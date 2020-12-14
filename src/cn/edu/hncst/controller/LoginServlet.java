package cn.edu.hncst.controller;

import cn.edu.hncst.entity.User;
import cn.edu.hncst.service.UserService;
import cn.edu.hncst.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/loginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 设置字符编码
        req.setCharacterEncoding("utf-8");

        // 获取前端输入的验证码和后台生成的保存在session中的验证码
        String verifycode = req.getParameter("verifycode");
        System.out.println("验证码：" + verifycode);
        String checkCode = (String) req.getSession().getAttribute("CHECKCODE_SERVER");
        // 移除验证码
        req.getSession().removeAttribute("CHECKCODE_SERVER");

        // 获取前端输入的用户名密码，使用userDao进行查询
        UserService userService = new UserServiceImpl();
        User user = new User();
        String username = req.getParameter("username");
        user.setUsername(username);
        String password = req.getParameter("password");
        user.setPassword(password);
        user = userService.findUser("", username, password);
        System.out.println("用户名：" + username + ",密码：" + password);

        // 设置返回信息
        String msg = null;

        // 判断验证码和用户名密码是否错误
        if (verifycode.equals(checkCode) && user != null) {
            // 设置用户名
            req.getSession().setAttribute("user", user);
            req.setAttribute("user", user);
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
        } else {
            if (verifycode.equals("") || !verifycode.equals(checkCode)) {
                msg = "验证码错误";
            }
            if (user == null) {
                msg = "用户名或密码错误";
            }
            req.setAttribute("login_msg", msg);
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        }
    }
}

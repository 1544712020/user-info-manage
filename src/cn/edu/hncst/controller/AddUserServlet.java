package cn.edu.hncst.controller;


import cn.edu.hncst.entity.User;
import cn.edu.hncst.service.UserService;
import cn.edu.hncst.service.impl.UserServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet(value = "/addUserServlet")
public class AddUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        User user = new User();
        Map<String, String[]> parameterMap = req.getParameterMap();
        try {
            // 将接收的数据添加到user中
            BeanUtils.populate(user, parameterMap);
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
        System.out.println(user);
        UserService userService = new UserServiceImpl();
        userService.addUser(user);
        /**
         * req.getContextPath()相当于http://localhost:8080
         */
//        resp.sendRedirect(req.getContextPath() + "/userListServlet");
        resp.sendRedirect(req.getContextPath() + "/pageQueryServlet");
    }
}

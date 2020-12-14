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

@WebServlet(value = "/findUserServlet")
public class FindUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String id = req.getParameter("id");
        UserService userService = new UserServiceImpl();
        User user = userService.findUser(id, "", "");
        req.setAttribute("user", user);
        req.getRequestDispatcher("/update.jsp").forward(req, resp);
    }
}

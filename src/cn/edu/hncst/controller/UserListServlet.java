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
import java.util.List;

@WebServlet(value = "/userListServlet")
public class UserListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        UserService userService = new UserServiceImpl();
        List<User> allUsers = userService.findAllUsers();
        req.setAttribute("users", allUsers);
        // 跳转list.jsp
        req.getRequestDispatcher("/list.jsp").forward(req, resp);
    }
}

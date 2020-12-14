package cn.edu.hncst.controller;

import cn.edu.hncst.service.UserService;
import cn.edu.hncst.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Array;
import java.util.Arrays;

@WebServlet(value = "/deleteUserByIdServlet")
public class DeleteUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("ids");
        System.out.println("userId:" + userId);
        // 将id字符串分隔开
        String[] str = userId.split(",");
        UserService userService = new UserServiceImpl();
        for (String i : str) {
            userService.deleteUser(i);
        }
        resp.sendRedirect(req.getContextPath() + "/pageQueryServlet");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}

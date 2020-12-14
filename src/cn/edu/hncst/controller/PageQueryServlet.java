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
import java.util.List;
import java.util.Map;

@WebServlet("/pageQueryServlet")
public class PageQueryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //页码数

        String keywords = request.getParameter("keywords");
        System.out.println(keywords);
        String strPageNum = request.getParameter("pageNum");
        //每页查询的记录数
        String strPageSize = request.getParameter("pageSize");
        int startCount = 0;
        int pageNum = 1;
        int pageSize = 15;
        if (strPageNum != null && !"".equals(strPageNum.trim())) {
            pageNum = Integer.parseInt(strPageNum);
        }
        if (strPageSize != null && !"".equals(strPageSize.trim())) {
            pageSize = Integer.parseInt(strPageSize);
        }
        if(keywords==null){
            keywords="";
        }

        //计算起始索引
        startCount =  (pageNum-1)*pageSize;
        //2、处理：分页查询
        UserService userService = new UserServiceImpl();
        //分页数据查询

        if(keywords==null||keywords.equals("")) {
            System.out.println("没有keywords");
            List<User> users = userService.pageQuery(startCount, pageSize);
            //分页条处理
            //1、计算总页数：   totalCount ,pageSize
            int totalCount = userService.total();
            int totalPage = totalCount % pageSize == 0?totalCount/pageSize:totalCount/pageSize+1;

            //把list数据转发到list.jsp
            request.setAttribute("users", users);
            request.setAttribute("totalPage", totalPage);
            request.setAttribute("pageNum",pageNum);
            request.setAttribute("pageSize",pageSize);
            request.getRequestDispatcher("/pagelist.jsp").forward(request,response);
        }else{



            System.out.println("keywords："+keywords);
            List<User> users = userService.searchUser(keywords, startCount, pageSize);
            //分页条处理
            //1、计算总页数：   totalCount ,pageSize
            int totalCount = userService.querySearchCount(keywords);
            int totalPage = totalCount % pageSize == 0?totalCount/pageSize:totalCount/pageSize+1;

            //把list数据转发到list.jsp
            request.setAttribute("users", users);
            request.setAttribute("totalPage", totalPage);
            request.setAttribute("pageNum",pageNum);
            request.setAttribute("pageSize",pageSize);
            request.getRequestDispatcher("/pagelist.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}

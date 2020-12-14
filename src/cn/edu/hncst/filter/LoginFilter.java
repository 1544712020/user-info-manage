package cn.edu.hncst.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * 登录拦截器
 */

@WebFilter("/*")
public class LoginFilter implements Filter {

    //实例化一个静态的集合
    private static List<String> urls = new ArrayList<>();
    //静态代码块中向集合中存放所有可以放行的请求或网页地址（不用账号密码即可访问）
    static {
        urls.add("/checkCodeServlet");
        urls.add("/loginServlet");
        urls.add("/login.jsp");
        urls.add("/register.jsp");
        urls.add("/css");
        urls.add("/js");
        urls.add("/fonts");
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req=(HttpServletRequest)request;
        HttpServletResponse res=(HttpServletResponse)response;
        String urlPattern=req.getServletPath();
        System.out.println("getServletPath" + urlPattern);
        String path = req.getRequestURI();
        System.out.println("getRequestURI" + path);
        for (String url : urls) {
            if(url.equals(urlPattern) || path.contains(url)) {
                //        System.out.println("reaource do chain...");
                chain.doFilter(request, response);
                //防止重复响应
                return;
            }
        }
        //如果person为null，表示没有登录
        if(req.getSession().getAttribute("user")==null) {
            res.sendRedirect(req.getContextPath() + "/login.jsp");
        }else {
            //放行
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {

    }
}

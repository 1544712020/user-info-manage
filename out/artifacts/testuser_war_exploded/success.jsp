<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2020/12/11
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>操作成功</title>
</head>
<body style="align-content: center">
<%
    String str = (String) request.getAttribute("msg");
    System.out.println(str);
    if (str.equals("注册操作")) {
        String register = (String) request.getAttribute("register");
        if (Integer.parseInt(register) != 0) {
            response.setHeader("refresh", "1;URL=login.jsp");
//                 request.getRequestDispatcher("/login.jsp").forward(request, response);
%>
注册成功，跳转到登录页面！！！<br>
1秒后自动跳转到登录窗口！！！<br>
<%
    }
%>
<%
    }
%>
</body>
</html>

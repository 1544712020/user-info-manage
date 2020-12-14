<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>用户信息管理系统</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
    <style type="text/css">
        td, th {
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <h3 style="text-align: center">用户信息列表</h3>
    <div style="float: left;margin: 5px;">
        ${user.name},欢迎您
    </div>

    <div style="float: right;margin: 5px;">
        <input class="input-group-lg" name="search" type="text"/>
        <a class="btn btn-primary" href="javascript:search()">搜索</a>
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/add.jsp">添加联系人</a>
        <a class="btn btn-primary" href="javascript:checkbox(${user.id});" id="delSelected">删除选中</a>
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/logoutServlet">退出</a>
    </div>

    <form id="form" action="${pageContext.request.contextPath}/delSelectedServlet" method="post">
        <table border="1" class="table table-bordered table-hover">
            <tr class="success">
                <th><input type="checkbox" name="firstCb" id="firstCb"></th>
                <th>编号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>籍贯</th>
                <th>QQ</th>
                <th>邮箱</th>
                <th>操作</th>
            </tr>

            <c:forEach items="${users}" var="user" varStatus="s">
                <tr>
                    <td><input id="check_item" type="checkbox" name="uid" value="${user.id}"></td>
                    <td>${s.count}</td>
                    <td>${user.name}</td>
                    <td>${user.gender}</td>
                    <td>${user.age}</td>
                    <td>${user.address}</td>
                    <td>${user.qq}</td>
                    <td>${user.email}</td>
                    <td><a class="btn btn-default btn-sm"
                           href="${pageContext.request.contextPath}/findUserServlet?id=${user.id}">修改</a>&nbsp;
                        <a class="btn btn-default btn-sm" href="javascript:deleteUser(${user.id});">删除</a></td>
                </tr>
            </c:forEach>
        </table>

        <div style="text-align: center">

            <c:if test="${pageNum>1}">
                <a class="btn btn-default"
                   onclick="next(${pageNum}-1,${pageSize})"
                >上一页</a>
            </c:if>
            <c:forEach begin="1" end="${totalPage}" var="i">
                <c:if test="${pageNum == i}">
                    <a class="btn btn-success btn-default"
                       onclick="next(${i},${pageSize})" >${i}</a>
                </c:if>
                <c:if test="${pageNum != i}">
                    <a class="btn btn-default"
                       onclick="next(${i},${pageSize})">${i}</a>
                </c:if>
            </c:forEach>
            <c:if test="${pageNum <totalPage}">
                <a class="btn btn-default"
                   onclick="next(${pageNum}+1,${pageSize})">下一页</a>
            </c:if>
            <select class="form-control" name="pageSize" id="pageSize">
                <option
                        <c:if test="${pageSize==5}">selected</c:if> value="5">5条/页
                </option>
                <option
                        <c:if test="${pageSize==10}">selected</c:if> value="10">10条/页
                </option>
                <option
                        <c:if test="${pageSize==15}">selected</c:if> value="15">15条/页
                </option>
            </select>
        </div>

    </form>

</div>

<%-- 需要将script脚本文件放到页面的底部，因为除了function之外其余的加载事件就无法被监听 --%>
<script type="text/javascript">

    var pageSize=$("#pageSize").val();
    var keywords=sessionStorage.getItem('keywords');
    if(keywords==null){
        keywords="";
    }
    function search(){

        keywords = $('input[name="search"]').val();

        sessionStorage.setItem('keywords',keywords);
        window.location.href = "${pageContext.request.contextPath}/pageQueryServlet?keywords="+keywords+"&pageNum=1&pageSize="+pageSize;
    }

    //删除选中
    function checkbox() {
        var flag = window.confirm("确定要删除吗？这些人都惹不起，请三思！");
        var $box = $("[name='uid']:checked");
        var val = new Array();
        $.each($box, function (i, v) {
            val[i] = v.value;
        });
        location.href = "${pageContext.request.contextPath}/deleteUserByIdServlet?ids=" + val;
    }

    window.onload=function(){
        var keywords = sessionStorage.getItem('keywords');

        if(keywords){
            $('input[name="search"]').val(keywords);
        }

    }

    /**
     * 根据页码显示数据
     * */
    function next(pageNum,pageSize){
        if(pageNum<=1){
            pageNum=1;
        }
        if(pageNum>=${totalPage}){
            pageNum=${totalPage};
        }

        window.location.href = "${pageContext.request.contextPath}/pageQueryServlet?keywords="+keywords+"&pageNum="+pageNum+"&pageSize="+pageSize;

    }

    /**
     * 发送请求 查询分页数据
     * */
    $("#pageSize").change(function () {
        pageSize = this.value;
        keywords = sessionStorage.getItem('keywords');
        window.location.href = "${pageContext.request.contextPath}/searchServlet?keywords="+keywords+"&pageNum=1&pageSize=" + pageSize;


    });


    //删除确认
    function deleteUser(userId) {
        var flag = window.confirm("确定要删除吗？这个人挺好的，请三思！");
        if (flag) {
            location.href = "${pageContext.request.contextPath}/deleteUserByIdServlet?ids=" + userId;
        }
    }

    $("#pageSize").change(function () {
        // var pageSize = $("#pageSize").val();
        var pageSize = this.value;
        //发送请求 查询分页数据
        location.href = "${pageContext.request.contextPath}/pageQueryServlet?pageNum=1&pageSize=" + pageSize;
    });

    // 全部选中删除
    $('input[name="firstCb"]').on("click", function () {
        if ($(this).is(':checked')) {
            $('input[name="uid"]').each(function () {
                $(this).prop("checked", true);
            });
        } else {
            $('input[name="uid"]').each(function () {
                $(this).prop("checked", false);
            });
        }
    });

</script>

</body>

</html>

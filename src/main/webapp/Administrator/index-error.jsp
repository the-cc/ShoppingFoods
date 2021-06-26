<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>My JSP 'login.jsp' starting page</title>
    <title>零食之家管理员</title>
    <link rel="stylesheet" href="../CSS/public.css"/>
    <link rel="stylesheet" href="../CSS/style_one.css"/>
    <STYLE type="text/css">
        .box {
            margin: auto;
            width: 200px;
            height: 80px;
            background:#fff;
            border:1px solid #bfbfbf;
            padding:5px;
            display: block;
            margin-top: 160px }
        .box .msg { text-align:center; padding:20px; }
    </STYLE>
</head>

<body>
<header class="publicHeader">
    <h1>零食之家管理员</h1>
    <div class="publicHeaderR">
        <p><span style="color: #fff21b"><c:if test="${smUser != null}">${smUser.suUserName}</c:if></span> , 欢迎你！</p>
        <a href="${pageContext.request.contextPath}/Administrator/login">退出</a>
    </div>
</header>
<!--时间-->
<section class="publicTime">
    <span id="time">2015年1月1日 11:11  星期一</span>
</section>
<!--主体内容-->
<section class="publicMian">
    <%@include file="../common/lefts.jsp"%>
    <div class="right">
        <div class="right">
            <div class="box">
                <div class="msg">
                    <p>恭喜：操作失败！</p>
                    <p>正在跳转页面...</p>
                    <script type="text/javascript">
                        setTimeout("location.href='${pageContext.request.contextPath}/Administrator/index'", 2000);
                    </script>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="../js/time.js"></script>
</body>
</html>


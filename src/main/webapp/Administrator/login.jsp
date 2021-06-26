<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>系统登录</title>
    <link rel="stylesheet" href="../CSS/style_one.css"/>
  </head>
  
  <body class="login_bg">
    <section class="loginBox">
        <header class="loginHeader">
            <h1>零食之家管理员</h1>
        </header>
        <section class="loginCont">
            <form class="loginForm" action="${pageContext.request.contextPath}/slogin" method="post">
                <div class="inputbox">
                    <label for="user">用户名：</label>
                    <input id="user" type="text" name="username" placeholder="请输入用户名" required/>
                </div>
                <div class="inputbox">
                    <label for="mima">密码：</label>
                    <input id="mima" type="password" name="password" placeholder="请输入密码" required/>
                </div>
                <div class="subBtn">
                    <input type="submit" value="登录" />
                    <input type="reset" value="重置"/>
                    <a href="${pageContext.request.contextPath}/index" id="per">返回主页</a>
                </div>
            </form>
            <c:if test="${lgn_error!=null}">
                <h2 align="center"><span style="color: #cc0000">用户名或者密码错误，请重新登录!</span></h2>
            </c:if>
        </section>
    </section>
	<div class="z_one"></div>
  </body>
</html>

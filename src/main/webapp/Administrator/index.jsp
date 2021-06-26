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
	        <img class="wColck" src="../Imger/timg/clock.jpg" alt=""/>
	        <div class="wFont">
	            <h2>Admin</h2>
	            <p><span>欢迎来零食之家</span>管理系统!</p>
				<span id="hours"></span>
	        </div>
	    </div>
	</section>
	<script src="../js/time.js"></script>
  </body>
</html>

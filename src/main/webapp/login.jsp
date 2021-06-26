<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>零食之家</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/style_two.css" />
  </head>
  
  <body>
    <div id="background" class="wall">
        <div class="main">
            <div class="mainin">
                <div class="mainin1">
                <h1 >零食之家</h1>
                	<form action="${pageContext.request.contextPath}/login" method="post">
                        <ul>
                            <li><span>用户名：</span><input name="userName" type="text" id="loginName"
                            placeholder="登录名" class="SearchKeyword"></li>
                            <li><span>密码：</span><input type="password" name="passWord" id="Possword"
                            placeholder="密码" class="SearchKeyword2"></li>
                            <li><input type="button" class="register" onclick="javascrtpt:window.location.href='register.jsp'"
                            value="注册">
                            <input class="sign" type="submit" value="登录"></li>
                        </ul>
                         <div >
                         <a href="#"><img class="imagesTwo"  src="${pageContext.request.contextPath}/Imger/Qimg/Q1.png"  /></a>
                         <a href="#"><img class="imagesTwo" src="${pageContext.request.contextPath}/Imger/Qimg/W1.png"  /></a>
                         <a href="#"> <img class="imagesTwo" src="${pageContext.request.contextPath}/Imger/Qimg/Z1.png"  /></a>
                         </div>
                        <c:if test="${lgn_error!=null}"><h4 align="center"><span style="color: #cc0000">用户名或者密码错误，请重新登录!</span></h4></c:if>
                    </form>
                </div>
            </div>
        </div>
    </div>
  </body>
</html>


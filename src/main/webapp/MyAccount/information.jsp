<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>My JSP 'MyJsp.jsp' starting page</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/style.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/ms-style.min.css"/>
    <script type="application/javascript">
        function checksubmits(){
            $("#inputForm").submit();
        }
    </script>
</head>

<body>
<div id="bodyer">
    <div class="header">
        <div class="h_one"></div>
        <div class="h_two">
            <ul class="all_menu">
                <li class="menu_li">
                    <span><a href="<%=request.getContextPath() %>/index">网站首页</a></span>
                </li>
            </ul>
        </div>
        <div class="h_three">
            <ul>
                <li class="uname">
                    <c:choose>
                        <c:when test="${lgnUser != null}">
                            <a style="color: green"  href="${pageContext.request.contextPath}/MyAccount/information">${lgnUser.suUserName}</a>
                            <ul class="Ast">
                                <li><a href="<%=request.getContextPath() %>/logout">退 出</a></li>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <a href="<%=request.getContextPath() %>/login.jsp">登录</a>
                        </c:otherwise>
                    </c:choose>
                </li>
                <li class="gouwu"><a href="<%=request.getContextPath() %>/Index/shopping_cart.jsp">购物车</a></li>
                <li id="version"><a href="${pageContext.request.contextPath}/Administrator/login.jsp" class="G_line">
                    <img src="${pageContext.request.contextPath}/Imger/e1.png" width="15px"/><i>管理控制台</i></a>
                </li>
            </ul>
        </div>
    </div>
    <div class="center">
        <div id="ms-center" class="personal-member">
            <div class="cont">
                <div class="cont-side">
                    <div class="side-neck">
                        <i></i>
                    </div>
                    <div class="ms-side">
                        <article class="side-menu side-menu-off">
                            <dl class="side-menu-tree">
                                <dt>账户管理</dt>
                                <dd>
                                    <a href="${pageContext.request.contextPath}/MyAccount/information">我的资料</a>
                                </dd>
                                <dd>
                                    <a href="${pageContext.request.contextPath}/MyAccount/userOrder">订单详情</a>
                                </dd>
                            </dl>
                            <a ison="on" class="switch-side-menu icon-up-side"><i></i></a>
                        </article>
                    </div>
                </div>
                <div class="main-wrap mt15">
                    <h3>
                        <strong style=" font-size: 14px;">个人信息</strong>
                    </h3>
                    <form action="${pageContext.request.contextPath}/MyAccount/edit" method="post" id="inputForm">
                        <input type="hidden" name="suUserId" value="${user.suUserId}">
                        <div class="user-profile clearfix" style="margin-left: 0px;width: 100%;border: 0px;">
                        <div class="user-profile-wrap" style="width: 100%;height: 517px;">
                            <div style="margin-left: 79px;margin-top: 40px;">
                                <span class="titles">账号:</span>
                                <span style="padding: 5px;width: 300px;margin-left: 14px;">${user.suUserName}</span>
                            </div>
                            <div style="margin-left: 80px;margin-top: 30px;">
                                <span class="titles">性别:</span>
                                <span style="padding: 5px;width: 300px;margin-left: 14px;">${user.suSex == "T"? "男":"女"}</span>
                            </div>
                            <div style="margin-left: 80px;margin-top: 30px;">
                                <span class="titles">手机:</span>
                                <input type="text" name="suMobile"  value="${user.suMobile}"
                                       style="padding: 5px;width: 120px;margin-left: 14px;"/>
                                <span>手机号码11位数</span>
                            </div>
                            <div style="margin-left: 80px;margin-top: 30px;">
                                <span class="titles">邮箱:</span>
                                <input type="text" name="suEmail" value="${user.suEmail}"
                                       style="padding: 5px;margin-left: 14px;"/>
                                <span>Email格式，例如web@sohu.com</span>
                            </div>
                            <div style="margin-left: 80px;margin-top: 30px;">
                                <span class="titles">地址:</span>
                                <input type="text" name="suAddress" value="${user.suAddress}"
                                       style="padding: 5px;margin-left: 14px;width: 250px"/>
                                <span>xx省xx市xx区xx(县|镇|路|乡)xxx</span>
                            </div>
                            <button style="margin-left:180px;margin-top:30px;background-color:#F37B1D ;color: #fff;width: 100px;height: 30px;border: 0px;border-radius: 5px;" onclick="checksubmits()">
                                保存
                            </button>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>


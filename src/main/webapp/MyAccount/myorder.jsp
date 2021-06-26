<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>个人订单</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/style.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/ms-style.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/sui.css"/>
    <style type="text/css">
        .pager { margin-top:15px; }
        .pager ul { float:right; }
        .pager ul li { float:left; border:1px solid #eee; line-height:18px; padding:0 3px; margin:0 1px; display:inline; }
        .pager ul li.current { font-weight:bold; color:#630; }
        .clearfix:after{content:".";display:block;height:0;clear:both;visibility:hidden}
        .clearfix{display:inline-block}
        .clearfix{display:block}
    </style>
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
                        <strong style=" font-size: 14px;">我的订单</strong>
                    </h3>
                    <div style="margin-top:5px;height:50px;width:910px; display: block;">
                        <table class="sui-table table-nobordered" style="border: 1px #ccc solid;">
                            <thead style="background-color: cadetblue">
                            <tr>
                                <th><font style="font-size: 12px;margin-left:83px; ">订单日期</font></th>
                                <th nowrap><font style="font-size: 12px; ">发货地址</font></th>
                                <th nowrap><font style="font-size: 12px; ">订单数量</font></th>
                                <th nowrap><font style="font-size: 12px; ">订单总额</font></th>
                                <th nowrap><font style="font-size: 12px;margin-left:28px; ">订单名称</font></th>
                                <th nowrap><font style="font-size: 12px;margin-left:28px; color: #ff0;">订单交易</font>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${Orders}" var="order">
                                <tr>
                                    <td style="padding-left: 90px;font-size: 12px;">
                                        <fmt:formatDate value="${order.soCreateTime}"  pattern="yyyy-MM-dd hh:mm:ss"/>
                                    </td>
                                    <td style="font-size: 12px">
                                        ${order.soUserAddress}
                                    </td>
                                    <td style="font-size: 12px">
                                        ${order.sodQuantity}
                                    </td>
                                    <td style="font-size: 12px">
                                        ${order.soCost}
                                    </td>
                                    <td style="font-size: 12px;">
                                        <span style="margin-left: 28px;">
                                            ${order.soName}
                                        </span>
                                    </td>
                                    <td style="font-size: 12px">
                                        <span style="margin-left: 28px;color: #007AFF;">
                                            <c:if test="${order.soStatus==1}">待审核</c:if>
                                            <c:if test="${order.soStatus==2}">审核通过</c:if>
                                            <c:if test="${order.soStatus==3}">配货</c:if>
                                            <c:if test="${order.soStatus==4}">发货</c:if>
                                            <c:if test="${order.soStatus==5}">收货确认</c:if>
                                        </span>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="pager">
                            <ul class="clearfix">
                                <li><a href="${pageContext.request.contextPath}/MyAccount/userOrder?page=${page>1?page-1:1}">上一页</a></li>
                                <c:forEach var="i" begin="1" end="${maxPage}" step="1">
                                    <li class="${i==page?"current":""}"><a href="${pageContext.request.contextPath}/MyAccount/userOrder?page=${i}">${i}</a></li>
                                </c:forEach>
                                <li><a href="${pageContext.request.contextPath}/MyAccount/userOrder?page=${page<maxPage?page+1:1}">下一页</a></li><!--必须是model中totalPage的键-->
                                <li><a>共${maxPage}页</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>


<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'MyJsp.jsp' starting page</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/global.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/style.css" />
	<script type="text/javascript" src="js/jquery-2.1.4.js"></script>
	<script type="text/javascript" src="js/function.js"></script>
	<script type="text/javascript" src="js/banner.js"></script>
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
                    <li class="menu_li">
                        <span><a href="#">${s1}</a></span>
                        <div class="tab list set_two">
                            <div class="tab-menu">
                                <ul>
                                    <c:forEach items="${s1_small}" var="ss1">
                                        <li>${ss1.spcName}</li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="tab-box">
                                <c:forEach items="${s1_small}" var="ss1">
                                <div>
                                    <ul class="nav">
                                        <c:forEach items="${smproduct}" var="pro">
                                            <c:if test="${ss1.spcId == pro.spcChildId}">
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/details?spId=${pro.spId}" class="p-img"><img src="${pageContext.request.contextPath}/Imger/product/${pro.spFileName}" alt=""/></a>
                                                    <a href="${pageContext.request.contextPath}/details?spId=${pro.spId}" class="p-name">&nbsp;&nbsp;&nbsp;&nbsp;${pro.spName}</a>
                                                    <p class="p-price">
                                                        <span>京东价：<strong>￥${pro.spPrice}</strong></span>
                                                    </p>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                    </li>
                    <li class="menu_li">
                        <span><a href="#">${s2}</a></span>
                        <ul class="list set_three set_spar menu_as postTitle">
                            <c:forEach items="${s2_small}" var="ss2" varStatus="i">
                                <li>
                                    <i><a href="${pageContext.request.contextPath}/browse?spcChildId=${ss2.spcId}"><img src="${pageContext.request.contextPath}/Imger/5447/${i.index}.ico" width="27"/>${ss2.spcName}</a></i>
                                </li>
                            </c:forEach>
                        </ul>
                    </li>
                    <li class="menu_li">
                        <span><a href="#">${s3}</a></span>
                        <ul class="list set_four set_spar menu_ad">
                            <c:forEach items="${s3_small}" var="ss3" varStatus="i">
                                <li><a href="#"><img src="${pageContext.request.contextPath}/Imger/5447/1${i.index}.ico" width="27"/>${ss3.spcName}</a></li>
                            </c:forEach>
                        </ul>
                    </li>
                    <li class="menu_li">
                        <span><a href="#">客服联系</a></span>
                        <ul class="list set_five set_spar menu_ad">
                            <li><a href="#"><img src="${pageContext.request.contextPath}/Imger/5447/17.ico" width="27"/>入门指南</a></li>
                            <li><a href="#"><img src="${pageContext.request.contextPath}/Imger/5447/18.ico" width="27"/>产品文档</a></li>
                            <li><a href="#"><img src="${pageContext.request.contextPath}/Imger/5447/19.ico" width="27"/>开发者资源</a></li>
                            <li><a href="#"><img src="${pageContext.request.contextPath}/Imger/5447/20.ico" width="27"/>视频中心</a></li>
                            <li><a href="#"><img src="${pageContext.request.contextPath}/Imger/5447/21.ico" width="27"/>技术支持</a></li>
                            <li><a href="#"><img src="${pageContext.request.contextPath}/Imger/5447/22.ico" width="27"/>联系方式</a></li>
                            <li><a href="#"><img src="${pageContext.request.contextPath}/Imger/5447/23.ico" width="27"/>技术专业</a></li>
                        </ul>
                    </li>
                </ul>
                <input type="text" name="search" id="G_key" placeholder="请输入关键字">
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
                    <li class="gouwu"><a href="${pageContext.request.contextPath}/cart/shopping">购物车</a></li>
                    <li id="version"><a href="<%=request.getContextPath() %>/Administrator/login.jsp" class="G_line"><img src="${pageContext.request.contextPath}/Imger/e1.png"
                                                                                              width="15px"/><i>管理控制台</i></a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="bannerbox">
        	<div class="Homebanner">
           		<ul>
                    <li class="cur" style="z-index:99">
                        <img src="${pageContext.request.contextPath}/Imger/banner_09.jpg" alt="">
                        <div class="Homebannertext">
                            <img src="${pageContext.request.contextPath}/Imger/stimg/banner2016.png" class="bannereffect bannertime bigimg">
                            <dl class="bannerone clearfix">
                                <dt class="bannereffect bannertime1">
                                     	花草植物<b>纯天然</b>·呼吸大自然
                                </dt>
                                <dd class="bannereffect bannertime2">
                                     	为自己打造良好的清晰养分
                                </dd>
                            </dl>
                        </div>
                    </li>
                    <li>
                        <img src="${pageContext.request.contextPath}/Imger/banner_07.jpg" alt="">
                        <div class="Homebannertext">
                            <img src="${pageContext.request.contextPath}/Imger/stimg/02.png" class="bannereffect bannertime bigimg">
                            <dl class="bannertwo clearfix">
                                <dt class="bannereffect bannertime1">
                                     <h3>万物生长</h3>
                                     <p>爱护花草树木，从你我做起</p>
                                </dt>
                            </dl>
                        </div>
                    </li>
                    <li>
                    	<img src="${pageContext.request.contextPath}/Imger/stimg/03.jpg" alt="">
                        <div class="Homebannertext">
                            <dl class="bannerthree clearfix">
                                <dd class="bannereffect bannertime1">
                                     <img src="${pageContext.request.contextPath}/Imger/stimg/03-2.png" alt="">
                                     <h3>远离雾霾，自由呼吸</h3>
                                     <p>打响健康保卫战，给天空一片蓝天，给呼吸一片自由，给呼吸一方净土！</p>
                                </dd>
                            </dl>
                        </div>
                    </li>
                </ul>
                <div class="Homeleft"><</div>
                <div class="Homeright">></div>
                <div class="Homedot"><a href="javascript:;" class="cur">1</a><a href="javascript:;">2</a><a href="javascript:;">3</a></div> 
            </div>
            <div class="index_btn">
                <ul>
                     <li><span><a href="#"><em class="btn">成功案例</em></a></span>
                     <div class="index_btnbox index_btnanli" style="top: 0px;">
                        <img src="${pageContext.request.contextPath}/Imger/stimg/menu_pic1.jpg" alt="成功案例" width="258" height="112">
                        <p class="clearfix">
                            <a href="#">知名客户</a>
                            <a href="#">网站案例</a>
                            <a href="#">客户评价</a>
                            <a href="#">客户列表</a>
                        </p>
                     </div>
                     </li>
                     <li><span><a href="#"><em class="btn1">微信营销</em></a></span>
                     <div class="index_btnbox">
                        <img src="${pageContext.request.contextPath}/Imger/stimg/menu_pic2.jpg" alt="微信营销" width="258" height="112">
                        <p class="clearfix">
                            <a href="#">微信商城O2O整合</a>
                            <a href="#">手机网站案例</a>
                            <a href="#">微信活动微场景</a>
                            <a href="#">手机网站建设</a>
                            <a href="#">微官网</a>
                            <a href="#">手机解决方案</a>
                            <a href="#">苹果手机应用</a>
                            <a href="#">安卓手机应用</a>
                        </p>
                     </div>
                     </li>
                     <li><span><a href="#"><em class="btn2">网站建设</em></a></span>
                     <div class="index_btnbox">
                        <img src="${pageContext.request.contextPath}/Imger/stimg/menu_pic3.jpg" alt="网站建设" width="258" height="112">
                        <p class="clearfix">
                            <a href="#" title="品牌创意网站建设">品牌创意网站建设</a>
                            <a href="#" title="企业官方网站建设">企业官方网站建设</a>
                            <a href="#" title="上市公司网站建设">上市公司网站建设</a>
                            <a href="#" title="B2C电子商务网站建设">B2C电子商务网站建设</a>
                            <a href="#" title="大型门户类网站建设">大型门户类网站建设</a>
                            <a href="#" title="专题活动网站（MINISITE）">专题活动网站</a>
                            <a href="#" title="全方位网站运营代理">全方位网站运营代理</a>
                        </p>
                     </div>
                     </li>
                     <li><span><a href="#" class="cur"><em class="btn3">我们的实力</em></a></span>
                     <div class="index_btnbox">
                        <img src="${pageContext.request.contextPath}/Imger/stimg/menu_pic4.jpg" alt="我们的实力" width="258" height="112" />
                        <p class="clearfix">
                           <a href="#" title="关于沙漠风">关于沙漠风</a>
                           <a href="#" title="实力认可">实力认可</a>
                           <a href="#" title="沙漠风与众不同">沙漠风与众不同</a>
                           <a href="#" title="理念与信仰">理念与信仰</a>
                        </p>
                     </div>
                     </li>
                </ul>
            </div>
        </div>
    </div>
  </body>
</html>


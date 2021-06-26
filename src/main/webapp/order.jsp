<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>My JSP 'MyJsp.jsp' starting page</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/base.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/style.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/function.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/shopping.js"></script>
    <script type="text/javascript"src="${pageContext.request.contextPath}/js/js.js"></script>
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
                                                    <a href="${pageContext.request.contextPath}/details?spId=${pro.spId}" class="p-img"><img src="${pageContext.request.contextPath}/Imger/${pro.spFileName}" alt=""/></a>
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
                            <a style="color: green"  href="#">${lgnUser.suUserName}</a>
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
                <li id="version"><a href="${pageContext.request.contextPath}/Administrator/login.jsp" class="G_line"><img src="${pageContext.request.contextPath}/Imger/e1.png"
                                                                                          width="15px"/><i>管理控制台</i></a>
                </li>
            </ul>
        </div>
    </div>
    <div class="centers">
        <div class="border_top_cart">
            <div class="container">
                <div class="checkout-box">
                    <form id="checkoutForm" action="<%=request.getContextPath() %>/OrderDetai/generate" method="post">
                        <div class="checkout-box-ft">
                            <!-- 商品清单 -->
                            <div id="checkoutGoodsList" class="checkout-goods-box">
                                <div class="xm-box">
                                    <div class="box-hd">
                                        <h2 class="title">确认订单信息</h2>
                                    </div>
                                    <div class="box-bd">
                                        <dl class="checkout-goods-list">
                                            <dt class="clearfix">
                                                <span class="col col-1">商品名称</span>
                                                <span class="col col-2">购买价格</span>
                                                <span class="col col-3">购买数量</span>
                                                <span class="col col-4">小计（元）</span>
                                            </dt>
                                            <c:if test="${prodetails != null}">
                                                <input type="hidden" name="spId" value="${prodetails.spId}">
                                                <input type="hidden" name="count" value="${prodetails.count}">
                                                <dd class="item clearfix">
                                                    <div class="item-row">
                                                        <div class="col col-1">
                                                            <div class="g-pic">
                                                                <img src="${pageContext.request.contextPath}/Imger/1.jpg"
                                                                     srcset="http://i1.mifile.cn/a1/T11lLgB5YT1RXrhCrK!80x80.jpg 2x"
                                                                     width="40" height="40"/>
                                                            </div>
                                                            <div class="g-info">
                                                                <a href="#">
                                                                        ${prodetails.spName} </a>
                                                            </div>
                                                        </div>
                                                        <div class="col col-2">${prodetails.spPrice}元</div>
                                                        <div class="col col -3">${prodetails.count}</div>
                                                        <div class="col col-4">${prodetails.count*prodetails.spPrice}元</div>
                                                    </div>
                                                </dd>
                                            </c:if>
                                            <c:if test="${prodetails == null}">
                                            <c:forEach items="${product}" var="pro">
                                                <dd class="item clearfix">
                                                    <div class="item-row">
                                                        <div class="col col-1">
                                                            <div class="g-pic">
                                                                <img src="${pageContext.request.contextPath}/Imger/1.jpg"
                                                                     srcset="http://i1.mifile.cn/a1/T11lLgB5YT1RXrhCrK!80x80.jpg 2x"
                                                                     width="40" height="40"/>
                                                            </div>
                                                            <div class="g-info">
                                                                <a href="#">
                                                                    ${pro.spName} </a>
                                                            </div>
                                                        </div>
                                                        <div class="col col-2">${pro.spPrice}元</div>
                                                        <div class="col col-3">${pro.count}</div>
                                                        <div class="col col-4">${pro.count*pro.spPrice}元</div>
                                                    </div>
                                                </dd>
                                                </c:forEach>
                                            </c:if>
                                        </dl>
                                        <div class="checkout-count clearfix">
                                            <div class="checkout-count-extend xm-add-buy">
                                                <h2 class="title">收货地址</h2></br>
                                                    <div class="clearfix xm-address-list" id="checkoutAddrList">
                                                        <dl class="item">
                                                            <dt>
                                                                <strong class="itemConsignee">${user.suUserName}</strong>
                                                                <span class="itemTag tag">家</span>
                                                            </dt>
                                                            <dd>
                                                                <p class="itemRegion">${user.suAddress}</p>

                                                            </dd>
                                                            <dd style="display:none">
                                                                <input type="radio" name="Checkout[address]"
                                                                       class="addressId"
                                                                       value="10140916720030323">
                                                            </dd>
                                                        </dl>
                                                    </div>
                                            </div>
                                            <!-- checkout-count-extend -->
                                            <div class="checkout-price">
                                                <ul>
                                                    <li>
                                                        配送快递：<span>圆通</span>
                                                    </li>
                                                    <li>
                                                        运费：<span id="postageDesc">包邮</span>
                                                    </li>
                                                    <li>
                                                        活动优惠：<span>-0元</span>
                                                        <script type="text/javascript">
                                                            checkoutConfig.activityDiscountMoney = 0;
                                                            checkoutConfig.totalPrice = 244.00;
                                                        </script>
                                                    </li>
                                                    <li>
                                                        优惠券抵扣：<span id="couponDesc">-0元</span>
                                                    </li>
                                                </ul>
                                                <p class="checkout-total">应付总额：<span><strong id="totalPrice"><c:if test="${prodetails != null}">${prodetails.spPrice*prodetails.count}</c:if><c:if test="${prodetails == null}">${sumPrict}</c:if></strong>元</span>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 商品清单 END -->
                            <div class="checkout-confirm">
                                <input type="submit" class="btn btn-primary" value="立即下单" id="checkoutToPay"/>
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


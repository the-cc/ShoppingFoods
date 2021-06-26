<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>商品分类信息</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/style.css"/>
    <script type="text/javascript" src="js/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="js/function.js"></script>

    <style type="text/css">
        img { border:0; }
        table { border-collapse:collapse; }
        a:link, a:visited { color:#3a52a8; text-decoration:none; }
        a:hover, a:active { color:#3a52a8; text-decoration:underline; }
        .clear { clear:both; }
        #header .help a { margin:0 5px; }
        #childNav ul { margin:9px; line-height:14px; }
        .pager { position:absolute;right:140px;bottom: 20px;}
        .pager ul { float:right;}
        .pager ul li { float:left; border:1px solid #eee; line-height:18px; padding:0 3px; margin:0 1px; display:inline; }
        .search label input { height:18px; }
        #main .main h2 { font-size:14px; line-height:30px; border-bottom:2px solid #fbaa62; padding-left:25px; }
        ul.product {margin-left: 7px}
        ul.product li { width:110px; line-height:18px; height:160px; float:left; display:inline; margin:9px; }
        ul.product li dl dt { text-align:center; }
        ul.product li dl dt img { width:100px; height:100px; }
        ul.product li dl dd.title a { color:#666; }
        ul.product li dl dd.price { text-align:center;color:#c30; font-weight:bold;}
        .product-list ul.product li { width:172px; height:240px; line-height:22px; font-size:14px; overflow:hidden; }
        .product-list ul.product li dl dt img { width:170px; height:170px; border:1px solid #ccc; }
        .product-list ul.product li dl dd.title { height:44px; text-align: center; }
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
                                                    <a href="#" class="p-img"><img src="${pageContext.request.contextPath}/Imger/${pro.spFileName}" alt=""/></a>
                                                    <a href="#" class="p-name">&nbsp;&nbsp;&nbsp;&nbsp;${pro.spName}</a>
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
                                <i><a href="#"><img src="${pageContext.request.contextPath}/Imger/5447/${i.index}.ico" width="27"/>${ss2.spcName}</a></i>
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
                        <li><a href="#"><img src="Imger/5447/17.ico" width="27"/>入门指南</a></li>
                        <li><a href="#"><img src="Imger/5447/18.ico" width="27"/>产品文档</a></li>
                        <li><a href="#"><img src="Imger/5447/19.ico" width="27"/>开发者资源</a></li>
                        <li><a href="#"><img src="Imger/5447/20.ico" width="27"/>视频中心</a></li>
                        <li><a href="#"><img src="Imger/5447/21.ico" width="27"/>技术支持</a></li>
                        <li><a href="#"><img src="Imger/5447/22.ico" width="27"/>联系方式</a></li>
                        <li><a href="#"><img src="Imger/5447/23.ico" width="27"/>技术专业</a></li>
                    </ul>
                </li>
            </ul>
            <input type="text" name="search" id="G_key" placeholder="请输入关键字">
        </div>
        <div class="h_three">
            <ul>
                <li class="uname"><a href="<%=request.getContextPath() %>/login/index.jsp">登录</a></li>
                <li class="gouwu"><a href="<%=request.getContextPath() %>/shopping_cart.jsp">购物车</a></li>
                <li id="version"><a href="Administrator/login.jsp" class="G_line"><img src="Imger/e1.png"
                                                                                       width="15px"/><i>管理控制台</i></a>
                </li>
            </ul>
        </div>
    </div>
    <div class="center">
        <div id="main" class="wrap">
            <div class="main">
                <div class="product-list">
                    <h2 style="padding-left: 35px;padding-top: 2px;">
                        <c:forEach items="${categoryMap.smalls}" var="small">
                            <c:if test="${small.spcId==spcChildId}">
                                <c:forEach items="${categoryMap.bigs}" var="big">
                                    <c:if test="${big.spcId==small.spcParentId}">您现在的位置：${big.spcName} &gt; ${small.spcName}</c:if>
                                </c:forEach>
                            </c:if>
                        </c:forEach>
                    </h2>
                    <div class="clear"></div>
                    <ul class="product clearfix">
                        <c:forEach items="${smProducts}" var="smpro">
                            <li>
                                <dl>
                                    <dt><a href="${pageContext.request.contextPath}/details?spId=${smpro.spId}"><img src="Imger/product/${smpro.spFileName}" /></a></dt>
                                    <dd class="title"><a href="${pageContext.request.contextPath}/details?spId=${smpro.spId}">${smpro.spName}</a></dd>
                                    <dd class="price">￥${smpro.spPrice}</dd>
                                </dl>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <div class="pager">
            <ul class="clearfix">
                <li><a href="${pageContext.request.contextPath}/User/list?page=${curPage>1?curPage-1:1}">上一页</a></li>
                <c:forEach var="i" begin="1" end="${maxPage}" step="1">
                    <li class="${curPage==i?"current":""}">${i}</li>
                </c:forEach>
                <li><a href="${pageContext.request.contextPath}/User/list?page=${curPage<maxPage?curPage+1:maxPage}">下一页</a></li>
                <!--必须是model中totalPage的键-->
                <li><a>共${maxPage}页</a></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>


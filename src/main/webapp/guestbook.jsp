<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>My JSP 'MyJsp.jsp' starting page</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/style.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/normalize.css"/>
    <script type="text/javascript" src="js/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="js/function.js"></script>
    <script type="text/javascript" src="js/shopping.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var showproduct = {
                "boxid": "showbox",
                "sumid": "showsum",
                "boxw": 400,//宽度,该版本中请把宽高填写成一样
                "boxh": 400,//高度,该版本中请把宽高填写成一样
                "sumw": 60,//列表每个宽度,该版本中请把宽高填写成一样
                "sumh": 60,//列表每个高度,该版本中请把宽高填写成一样
                "sumi": 7,//列表间隔
                "sums": 5,//列表显示个数
                "sumsel": "sel",
                "sumborder": 1,//列表边框，没有边框填写0，边框在css中修改
                "lastid": "showlast",
                "nextid": "shownext"
            };//参数定义
            $.ljsGlasses.pcGlasses(showproduct);//方法调用，务必在加载完后执行
            $(document).ready(function () {
                var t = $("#text_box");
                $('#min').attr('disabled', true);
                $("#add").click(function () {
                    t.val(parseInt(t.val()) + 1)
                    if (parseInt(t.val()) != 1) {
                        $('#min').attr('disabled', false);
                    }

                })
                $("#min").click(function () {
                    t.val(parseInt(t.val()) - 1);
                    if (parseInt(t.val()) == 1) {
                        $('#min').attr('disabled', true);
                    }

                })
            });
        });

    </script>
    <style type="text/css">
        *{margin:0;padding: 0;}
        .center .wrap{
            width:1080px;
            height: 540px;
            margin:0 auto;
            box-shadow: 10px 10px 30px #ccc;
            border-radius: 2px;
            padding: 10px;
            position: relative;
            top:20px;
        }
        .center .wrap .says{
            width:1080px;
            height: 220px;
            position: absolute;
        }
        .center .wrap .says h1{
            font-size:18px;
            color:#A8A8A8;
            margin-bottom: 5px;
        }
        .center textarea{
            width:1080px;
            height: 140px;
            outline: none;
            resize: none;
            border:1px solid #ccc;
            border-radius: 3px;
            padding: 5px;
            color:#660000;
        }
        .center input{
            width:100px;
            height: 30px;
            border:none;
            cursor: pointer;
            background: #00CC66;
            color:white;
            border-radius: 2px;
            position: absolute;
            right: 10px;
            bottom: 0px;
            transition: all ease 0.4s;
            font-size: 16px;
        }
        .center input:hover{
            opacity: 0.7;
        }
        .center ul{
            width:1080px;
            height: 290px;
            position: absolute;
            bottom: 0;
            overflow-x: hidden;
            overflow-y: scroll;

        }
        .center li{
            width:1080px;
            border-bottom: 1px  dotted #ccc;
            list-style:none;
            line-height: 57px;
            font-size: 14px;
            color:#606060;
            overflow: hidden;
            filter: alpha(opacity:0);
            opacity: 0;

        }
        .center span{
            float: right;
            margin-right: 30px;
        }
        .center .errmsg{
            font-size: 14px;
            color:red;
            font-weight: bold;
            filter: alpha(opacity:0);
            opacity:0;
        }
        .center a{
            font-size: 14px;
            color:#990000;
            text-decoration: none;
            margin-left: 10px;
        }
        .center a:hover{
            color:red;
            text-decoration: underline;
        }
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
    <div class="center">
        <div class="wrap">
            <div class="says">
                <form action="${pageContext.request.contextPath}/comment/add" method="post">
                <input type="hidden" name="scSpId" value="${pro.spId}">
                <input type="hidden" name="scNickName" value="${lgnUser.suUserName}">
                <h1>来，说说你对<a href="${pageContext.request.contextPath}/details?spId=${pro.spId}" style="color:#6b6720;font-size: 33px;">${pro.spName}</a>食品的感想，以及使用的情况。。。</h1>
                <textarea name="scContent" onfocus="if(value == '请点击发布试试吧'){value=''}" onblur="if(value == ''){value='请点击发布试试吧'}">请点击发布试试吧</textarea><input type="submit" value="发布"/>
                <div class="errmsg" style="opacity: 1;">请填写内容后再发布！</div>
                </form>
            </div>
            <ul>
                <c:forEach items="${Comment}" var="com">
                <li style="height: 57px; opacity: 1;">${com.scContent}<span><fmt:formatDate value="${com.scCreateTime}" pattern="yyyy-MM-dd hh:mm:ss"/></span><span>${com.scNickName}</span></li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
</body>
</html>


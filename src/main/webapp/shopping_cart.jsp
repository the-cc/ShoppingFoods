<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>购物车</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/carts.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/function.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/shopping.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript">
        function chk(i){
            var a = 0;
            if(i == 1){
                if(a < ${sumPrict}){
                window.location.href='${pageContext.request.contextPath}/OrderDetai/list?spId=${smProduct.spId}&sumPrict=${sumPrict}'
                }else{
                    alert("购物车没有物品，不能进行结算")
                }
            }else{
                alert("请登录用户,在购买商品");
            }
        }
        //=================================================商品数量==============================================
        $(function () {
            var $plus = $('.plus'),
                $reduce = $('.reduce'),
                $all_sum = $('.sum');
            $plus.click(function () {
                var $inputVal = $(this).prev('input');
                $count = parseInt($inputVal.val()) + 1
                $inputVal.val($count);
            });

            $reduce.click(function () {
                var $inputVal = $(this).next('input'),
                    $count = parseInt($inputVal.val()) - 1;
                if ($inputVal.val() > 1) {
                    $inputVal.val($count);
                }
            });

            $all_sum.keyup(function () {
                var $count = 0;
                if ($(this).val() == '') {
                    $(this).val('1');
                }
                $(this).val($(this).val().replace(/\D|^0/g, ''));
                $count = $(this).val();
                $(this).attr('value', $count);
            })
        });
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
                        <li><a href="#"><img src="../Imger/5447/17.ico" width="27"/>入门指南</a></li>
                        <li><a href="#"><img src="../Imger/5447/18.ico" width="27"/>产品文档</a></li>
                        <li><a href="#"><img src="../Imger/5447/19.ico" width="27"/>开发者资源</a></li>
                        <li><a href="#"><img src="../Imger/5447/20.ico" width="27"/>视频中心</a></li>
                        <li><a href="#"><img src="../Imger/5447/21.ico" width="27"/>技术支持</a></li>
                        <li><a href="#"><img src="../Imger/5447/22.ico" width="27"/>联系方式</a></li>
                        <li><a href="#"><img src="../Imger/5447/23.ico" width="27"/>技术专业</a></li>
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
                <li id="version"><a href="../Administrator/login.jsp" class="G_line"><img src="../Imger/e1.png"
                                                                                          width="15px"/><i>管理控制台</i></a>
                </li>
            </ul>
        </div>
    </div>
    <div class="centers">
        <section class="cartMain">
            <div class="cartMain_hd">
                <ul class="order_lists cartTop">
                    <li class="list_chk">商品图片</li>
                    <li class="list_con">商品信息</li>
                    <li class="list_info">商品描述</li>
                    <li class="list_price">单价</li>
                    <li class="list_amount">数量</li>
                    <li class="list_sum">类型</li>
                    <li class="list_op">操作</li>
                </ul>
            </div>
            <c:forEach items="${car}" var="product" varStatus="i">
                <div class="cartBox">
                    <div class="order_content">
                        <ul class="order_lists">
                            <li class="list_con">
                                <div class="list_img"><a href="javascript:;"><img src="../Imger/product/${product.spFileName}" alt=""></a></div>
                                <div class="list_text"><a href="javascript:;">${product.spName}</a></div>
                            </li>
                            <li class="list_info">
                                <p>${product.spDescription}</p>
                            </li>
                            <li class="list_price">
                                <p class="price">￥${product.spPrice}</p>
                            </li>
                            <li class="list_amount">
                                <div class="amount_box">
                                    <a href="javascript:window.location.href='${pageContext.request.contextPath}/cart/add?spId=${product.spId}&tag=2';" class="reduce">-</a>
                                    <input type="text" value="${product.count}" class="sum">
                                    <a href="javascript:window.location.href='${pageContext.request.contextPath}/cart/add?spId=${product.spId}&tag=1';" class="plus">+</a>
                                </div>
                            </li>
                            <li class="list_sum">
                                <p class="sum_price">
                                    <c:forEach items="${bigs}" var="big">
                                        <c:if test="${big.spcId == product.spcChildId}">
                                            ${big.spcName}
                                        </c:if>
                                    </c:forEach>
                                </p>
                            </li>
                            <li class="list_op">
                                <p class="del"><a href="${pageContext.request.contextPath}/cart/delete?spId=${product.spId}" class="delBtn">移除</a></p>
                            </li>
                        </ul>
                    </div>
                </div>
            </c:forEach>
            <!--底部-->
            <div class="bar-wrapper">
                <div class="bar-right">
                    <div class="piece">已选商品<strong class="piece_num">${orderCount}</strong>件</div>
                    <div class="totalMoney">共计: <strong class="total_text">${sumPrict}</strong></div>
                    <div class="calBtn"><a class="btn_sty" href="javascript:${lgnUser != null ?"chk(1)":"chk(0)"};">结算</a></div>
                </div>
            </div>
        </section>
    </div>
</div>
</body>
</html>


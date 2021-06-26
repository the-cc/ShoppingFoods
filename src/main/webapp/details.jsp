<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>My JSP 'MyJsp.jsp' starting page</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/style.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/normalize.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/function.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/shopping.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
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
                    if(parseInt(t.val()) < ${smProduct.spStock}){
                         t.val(parseInt(t.val()) + 1)
                    }
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
        function chk(i){
            if(i == 1){
                window.location.href='${pageContext.request.contextPath}/OrderDetai/list?spId=${smProduct.spId}&count='+$("#text_box").val()+'';
                tag1++;
            }else{
                alert("请登录用户,在购买商品");
            }
        }

        function addcar() {
            window.location.href='${pageContext.request.contextPath}/cart/add?spId=${smProduct.spId}'
            alert("加入成功");
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
        <!--left -->
        <div class="showbot">
            <div id="showbox">
                <img src="${pageContext.request.contextPath}/Imger/product/${smProduct.spFileName}" width="400" height="400"/>
                <img src="${pageContext.request.contextPath}/Imger/O1.jpg" width="400" height="400"/>
                <img src="${pageContext.request.contextPath}/Imger/O2.jpg" width="400" height="400"/>
                <img src="${pageContext.request.contextPath}/Imger/O3.jpg" width="400" height="400"/>
                <img src="${pageContext.request.contextPath}/Imger/O4.jpg" width="400" height="400"/>
                <img src="${pageContext.request.contextPath}/Imger/O5.jpg" width="400" height="400"/>
            </div>
            <!--展示图片盒子-->
            <div id="showsum">
                <!--展示图片里边-->
            </div>
            <p class="showpage">
                <a href="javascript:void(0);" id="showlast"> < </a>
                <a href="javascript:void(0);" id="shownext"> > </a>
            </p>
        </div>
        <!--conet -->
        <form action="#" method="post">
            <div class="tb-property">
                <div class="tr-nobdr">
                    <h3>${smProduct.spName}</h3>
                </div>
                <div class="txt">
                    <span class="nowprice">￥<a href="">${smProduct.spPrice}</a></span>
                    <div class="cumulative">
                        <span class="number tyu"><a href="${pageContext.request.contextPath}/comment/guestbook?spId=${smProduct.spId}">累计评价</a><br/><em>${comStock}</em></span>
                    </div>
                </div>
                <div class="txt-h">
                    <span class="tex-o">分类</span>
                    <ul class="glist" id="glist" data-monitor="goodsdetails_fenlei_click">
                        <li><a href="">${spcName}</a></li>
                    </ul>
                </div>
                <div class="gcIpt">
                    <span class="guT">数量</span>
                    <input id="min" name="" type="button" value="-"/>
                    <input id="text_box" name="" type="text" value="1"
                           style="width:80px; text-align: center; color: #0F0F0F;"/>
                    <input id="add" name="" type="button" value="+"/>
                    <span class="Hgt">库存（${smProduct.spStock}）</span>
                </div>
                <div class="nobdr-btns">
                    <button class="addcart" type="button" onclick="${lgnUser != null ?"chk(1)":"chk(0)"}"><img src="${pageContext.request.contextPath}/Imger/ht.png" width="25" height="25"/>立即购买
                    </button>
                    <button class="addcart" type="button" onclick="addcar()"><img src="${pageContext.request.contextPath}/Imger/shop.png" width="25" height="25"/>加入购物车
                    </button>
                </div>
                <div class="guarantee">
                    <span>邮费：包邮&nbsp;&nbsp;支持货到付款 <a href=""><img src="${pageContext.request.contextPath}/Imger/me.png"/></a></span>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>


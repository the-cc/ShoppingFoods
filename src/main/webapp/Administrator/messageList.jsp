<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>零食之家管理员</title>
    <link rel="stylesheet" href="../CSS/public.css"/>
    <link rel="stylesheet" href="../CSS/style_one.css"/>
    <style type="text/css">
        .pager { margin-top:15px; }
        .pager ul { float:right; }
        .pager ul li { float:left; border:1px solid #eee; line-height:18px; padding:0 3px; margin:0 1px; display:inline; }
        .pager ul li.current { font-weight:bold; color:#630; }
        .clearfix:after{content:".";display:block;height:0;clear:both;visibility:hidden}
        .clearfix{display:inline-block}
        .clearfix{display:block}
    </style>
    <script type="application/javascript">
        function checksubmit(){
            $("#inputForm").submit();
        }
    </script>
</head>

<body>
<!--头部-->
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
<section class="publicMian ">
    <%@include file="../common/lefts.jsp"%>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理页面</span>
        </div>
        <!--用户-->
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="10%">评价编码</th>
                <th width="10%">用户名</th>
                <th width="35%">评价内容</th>
                <th width="10%">状态</th>
                <th width="15%">操作</th>
            </tr>
            <tr>
                <td class="first w4 c">1</td>
                <td class="w1 c">王小二</td>
                <td>三只松鼠货发了没？</td>
                <td class="w1 c">已回复</td>
                <td>
                    <a href="${pageContext.request.contextPath}/order/to_edit?soId=${order.soId}"><img src="../Imger/timg/xiugai.png" alt="修改" title="修改"/></a>
                    <a href="${pageContext.request.contextPath}/order/delete?soId=${order.soId}" class="removeBill"><img src="../Imger/timg/schu.png" alt="删除" title="删除"/></a>
                </td>
            </tr>
            <tr>
                <td class="first w4 c">1</td>
                <td class="w1 c">匿名</td>
                <td>肉松里面的馅还可以</td>
                <td class="w1 c">未回复</td>
                <td>
                    <a href="${pageContext.request.contextPath}/order/to_edit?soId=${order.soId}"><img src="../Imger/timg/xiugai.png" alt="修改" title="修改"/></a>
                    <a href="${pageContext.request.contextPath}/order/delete?soId=${order.soId}" class="removeBill"><img src="../Imger/timg/schu.png" alt="删除" title="删除"/></a>
                </td>
            </tr>
            <tr>
                <td class="first w4 c">1</td>
                <td class="w1 c">路飞</td>
                <td>路过路过、开心果还可以</td>
                <td class="w1 c">已回复</td>
                <td>
                    <a href="${pageContext.request.contextPath}/order/to_edit?soId=${order.soId}"><img src="../Imger/timg/xiugai.png" alt="修改" title="修改"/></a>
                    <a href="${pageContext.request.contextPath}/order/delete?soId=${order.soId}" class="removeBill"><img src="../Imger/timg/schu.png" alt="删除" title="删除"/></a>
                </td>
            </tr>
            <tr>
                <td class="first w4 c">1</td>
                <td class="w1 c">光辉岁月</td>
                <td>腰果食品一般般。</td>
                <td class="w1 c">未回复</td>
                <td>
                    <a href="${pageContext.request.contextPath}/order/to_edit?soId=${order.soId}"><img src="../Imger/timg/xiugai.png" alt="修改" title="修改"/></a>
                    <a href="${pageContext.request.contextPath}/order/delete?soId=${order.soId}" class="removeBill"><img src="../Imger/timg/schu.png" alt="删除" title="删除"/></a>
                </td>
            </tr>
        </table>
        <div class="pager">
            <ul class="clearfix">
                <li><a href="#">上一页</a></li>
                <li class="current">1</li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">下一页</a></li>
            </ul>
        </div>
    </div>
</section>

<footer class="footer"></footer>

<script src="../js/jquery-2.1.4.js"></script>
<script src="../js/js.js"></script>
<script src="../js/time.js"></script>
</body>
</html>

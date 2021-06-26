<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>订单成功页面</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/buyConfirm.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/style.css"/>

</head>

<body>
<div class="border_top_cart">
    <div class="container payment-con">
        <form target="_blank" action="#" id="pay-form" method="post">
            <div class="order-info">
                <div class="msg">
                    <h3>您的订单已提交！付款成功～</h3>
                    <p class="post-date">成功付款后，7天之内发货</p>
                </div>
                <div class="info">
                    <p>
                        金额：<span class="pay-total">${sumPrict}</span>
                    </p>
                    <p>
                        订单：1150505740045173 </p>
                    <p>
                        配送：${lgnUser.suUserName}<span class="line">/</span>
                        ${lgnUser.suMobile} <span class="line">/</span>
                        ${lgnUser.suAddress} <span class="line">/</span>
                        不限送货时间 <span class="line">/</span>
                        个人电子发票 </p>
                </div>
                <div class="icon-box">
                    <i class="iconfont"><img src="${pageContext.request.contextPath}/Imger/yes_ok.png"></i>
                </div>
                <script type="text/javascript">
                    setTimeout("location.href='${pageContext.request.contextPath}/index'", 3000);
                </script>
            </div>
        </form>
    </div>
</div>
</body>
</html>


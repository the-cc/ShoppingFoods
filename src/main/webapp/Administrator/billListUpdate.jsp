<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>零食之家管理员</title>
	<link rel="stylesheet" href="../CSS/public.css"/>
	<link rel="stylesheet" href="../CSS/style_one.css"/>
	<script type="application/javascript">
        function checksubmits(){
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
			<span>供应商管理页面 >> 供应商修改页</span>
		</div>
		<div class="providerAdd">
			<form action="${pageContext.request.contextPath}/order/update" method="get" id="inputForm">
				<input type="hidden" name="soId" value="${smOrder.soId}"/>
				<input type="hidden" name="soUserName" value="${smOrder.soUserName}"/>
				<input type="hidden" name="soName"  value="${smOrder.soName}"/>
				<!--div的class 为error是验证错误，ok是验证成功-->
				<div class="">
					<label for="providerId">订单编号：	</label>
					<input type="text" id="providerId" placeholder="${smOrder.soId}"  readonly="readonly" />
					<span>*</span>
				</div>
				<div>
					<label for="providerName">订购人姓名：</label>
					<input type="text"  id="providerName" placeholder="${smOrder.soUserName}" readonly="readonly"  />
					<span >*</span>
				</div>
				<div>
					<label for="people">订购人地址：</label>
					<input type="text" name="soUserAddress" id="people" value="${smOrder.soUserAddress}"/>
					<span>*</span>
				</div>
				<div>
					<label for="ordernames">订单商品名：</label>
					<input type="text"  id="ordernames" placeholder="${smOrder.soName}"/>
					<span>*</span>
				</div>
				<div>
					<label for="Quantity">订单数量：</label>
					<input type="text" name="sodQuantity" id="Quantity" value="${smOrder.sodQuantity}"/>
					<span>*</span>
				</div>
				<div>
					<label for="phone">总金额：	</label>
					<input type="text" name="soCost" id="phone" onkeyup= "if( !/^[0-9]{1,}(?:.[0-9]{0,2})?$/.test(this.value)){alert('只能输入数字，小数点后只能保留两位');this.value='';}" value="${smOrder.soCost}"/>
					<span></span>
				</div>
				<div>
					<label for="address">下单日期：</label>
					<input type="datetime-local" name="createTime" id="address" value="<fmt:formatDate value="${smOrder.soCreateTime}" pattern="yyyy-MM-dd\'T\'hh:mm:ss"/>"/>
					<span></span>
				</div>
				<div>
					<label for="fax">订单状态：</label>
					<td>
						<select name="soStatus" id="fax">
							<option value="1"  <c:if test="${smOrder.soStatus==1}">selected="selected" </c:if>>待审核</option>
							<option value="2"  <c:if test="${smOrder.soStatus==2}">selected="selected" </c:if>>审核通过</option>
							<option value="3"  <c:if test="${smOrder.soStatus==3}">selected="selected" </c:if>>配货</option>
							<option value="4"  <c:if test="${smOrder.soStatus==4}">selected="selected" </c:if>>发货</option>
							<option value="5"  <c:if test="${smOrder.soStatus==5}">selected="selected" </c:if>>收货确认</option>
						</select>
					</td>
					<span></span>
				</div>
				<div class="providerAddBtn">
					<!--<a href="#">保存</a>-->
					<!--<a href="providerList.html">返回</a>-->
					<input type="button" value="更新" onclick="checksubmits()"/>
					<input type="button" value="返回" onclick="history.back(-1)"/>
				</div>
			</form>
		</div>
	</div>
</section>
<script src="../js/time.js"></script>
<script src="../js/jquery-2.1.4.js"></script>
</body>
</html>

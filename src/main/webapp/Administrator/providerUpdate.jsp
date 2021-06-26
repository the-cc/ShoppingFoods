<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page isELIgnored="false" %>
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
			<span>商品管理页面 >> 商品修改页</span>
		</div>
		<div class="providerAdd">
			<form action="${pageContext.request.contextPath}/product/edit" method="post" enctype="multipart/form-data"  id="inputForm">
				<input type="hidden" name="spId" value="${smProduct.spId}"/>
				<!--div的class 为error是验证错误，ok是验证成功-->
				<div class="">
					<label for="providerId">商品名称(*)：</label>
					<input type="text" name="spName" id="providerId" value="${smProduct.spName}"/>
					<span>*</span>
				</div>
				<div>
					<label for="providerName">描述：</label>
					<input type="text" name="spDescription" id="providerName" value="${smProduct.spDescription}"/>
					<span >*</span>
				</div>
				<div>
					<label for="people">商品种类：</label>
					<select id="people" name="spcChildId">
						<c:forEach items="${categoryMap.bigs}" var="big">
							<option value="${big.spcId}" disabled>${big.spcName}</option>
							<c:forEach items="${categoryMap.smalls}" var="small">
								<c:if test="${small.spcParentId==big.spcId}">
									<c:if test="${smProduct.spcChildId!=small.spcId}">
										<c:choose>
											<c:when test="${smProduct.spcChildId ==  546|| smProduct.spcChildId == 547 || smProduct.spcChildId == 548 || smProduct.spcChildId == 549 }">
												<option value="${small.spcId}" disabled>├ ${small.spcName}</option>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${small.spcParentId == 542}">
														<option value="${small.spcId}" disabled>├ ${small.spcName}</option>
													</c:when>
													<c:otherwise>
														<option value="${small.spcId}">├ ${small.spcName}</option>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
									</c:if>
									<c:if test="${smProduct.spcChildId==small.spcId}">
										<option value="${small.spcId}" selected="selected">├ ${small.spcName}</option>
									</c:if>
								</c:if>
							</c:forEach>
						</c:forEach>
					</select>
					<span>*</span>

				</div>
				<div>
					<label for="phone">商品价格：</label>
					<input type="text" name="spPrice" id="phone"  value="${smProduct.spPrice}"  onkeyup= "if( !/^[0-9]{1,}(?:.[0-9]{0,2})?$/.test(this.value)){alert('只能输入数字，小数点后只能保留两位');this.value='';}"/>
					<span></span>
				</div>
				<div>
					<label for="address">商品数量：</label>
					<input type="text" name="spStock" id="address"   value="${smProduct.spStock}" onkeyup= "if(!/^[0-9]*$/.test(this.value)){alert('只能整数');this.value='';}"/>
					<span></span>

				</div>
				<div>
					<label for="fax">商品图片：</label>
					<input type="file" style="border: none; box-shadow:none;" id="fax" name="uploadFile"/>
					<span></span>

				</div>
				<div class="providerAddBtn">
					<!--<a href="#">保存</a>-->
					<!--<a href="providerList.html">返回</a>-->
					<input type="button" value="修改" onclick="checksubmits()"/>
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

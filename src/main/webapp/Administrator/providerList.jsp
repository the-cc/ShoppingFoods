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
	            <span>商品管理页面</span>
	        </div>
			<form method="post" action="${pageContext.request.contextPath}/product/findByProduct"  id="inputForm">
	        <div class="search">
	            <span>商品名称：</span>
	            <input type="text" name="spName" placeholder="请输入商品名称"/>
				<span>商品种类：</span>
				<select name="spcId" >
					<option value="">--请选择--</option>
					<c:forEach items="${small}" var="sa">
						<option value="${sa.spcId}">${sa.spcName}</option>
					</c:forEach>
				</select>
	            <input type="button" onclick="checksubmit()" value="查询"/>
				<a href="${pageContext.request.contextPath}/product/to_save">添加商品</a>
	        </div>
			</form>
	        <!--供应商操作表格-->
	        <table class="providerTable" cellpadding="0" cellspacing="0">
	            <tr class="firstTr">
	                <th width="10%">商品编号</th>
	                <th width="20%">商品名称</th>
	                <th width="10%">商品种类</th>
	                <th width="10%">商品价格</th>
					<th width="10%">商品数量</th>
	                <th width="25%">商品图片</th>
	                <th width="15%">操作</th>
	            </tr>
				<c:forEach items="${smProducts}" var="sbp">
	            <tr>
	                <td>${sbp.spId}</td>
	                <td>${sbp.spName}</td>
					<c:forEach items="${small}" var="sa">
						<c:if test="${sbp.spcChildId == sa.spcId}">
							<td>${sa.spcName}</td>
						</c:if>
					</c:forEach>
	                <td>${sbp.spPrice}</td>
					<td>${sbp.spStock}</td>
	                <td><img width="80" height="50" src="../Imger/product/${sbp.spFileName}"></td>
	                <td>
	                    <a href="${pageContext.request.contextPath}/product/to_edit?spId=${sbp.spId}"><img src="../Imger/timg/xiugai.png" alt="修改" title="修改"/></a>
	                	<c:choose>
							<c:when test="${sbp.spcChildId == 546 || sbp.spcChildId == 547|| sbp.spcChildId == 548 || sbp.spcChildId == 549	}"></c:when>
							<c:otherwise><a href="${pageContext.request.contextPath}/product/delect?spId=${sbp.spId}" class="removeProvider"><img src="../Imger/timg/schu.png" alt="删除" title="删除"/></a></c:otherwise>
						</c:choose>
					</td>
	            </tr>
				</c:forEach>
	        </table>
			<div class="pager">
				<ul class="clearfix">
					<li><a href="${pageContext.request.contextPath}/product/list?page=${curPage>1?curPage-1:1}">上一页</a></li>
					<c:forEach var="i" begin="1" end="${maxPage}" step="1">
						<li class="${i==curPage?"current":""}"><a href="${pageContext.request.contextPath}/product/list?page=${i}">${i}</a></li>
					</c:forEach>
					<li><a href="${pageContext.request.contextPath}/product/list?page=${curPage<maxPage?curPage+1:1}">下一页</a></li>
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

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
	            <span>分类管理页面</span>
	        </div>
			<div class="search">
				<a href="${pageContext.request.contextPath}/productCategory/to_add">添加分类</a>
			</div>
	        <!--供应商操作表格-->
	        <table class="providerTable" cellpadding="0" cellspacing="0">
	            <tr class="firstTr">
	                <th width="10%">分类编号</th>
	                <th width="30%">分类名称</th>
	                <th width="15%">操作</th>
	            </tr>
				<c:forEach items="${categoryMap.bigs}" var="bigs">
					<tr>
						<td>${bigs.spcId}</td>
						<td>··························································  ${bigs.spcName}  ··························································</td>
						<td>
							<a href="${pageContext.request.contextPath}/productCategory/${bigs.spcId}"><img src="../Imger/timg/xiugai.png" alt="修改" title="修改"/></a>
						</td>
					</tr>
					<c:forEach items="${categoryMap.smalls}" var="small">
						<c:if test="${small.spcParentId==bigs.spcId}">
							<tr>
								<td>${small.spcId}</td>
								<td>${small.spcName}</td>
								<td>
									<a href="${pageContext.request.contextPath}/productCategory/${small.spcId}"><img src="../Imger/timg/xiugai.png" alt="修改" title="修改"/></a>
									<c:choose>
										<c:when test="${small.spcParentId == 542}"></c:when>
										<c:otherwise><a href="${pageContext.request.contextPath}/productCategory/delete?spcId=${small.spcId}" class="removeProvider"><img src="../Imger/timg/schu.png" alt="删除" title="删除"/></a></c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</c:forEach>
	        </table>
			<div class="pager">
				<ul class="clearfix">
					<li><a href="${pageContext.request.contextPath}/productCategory/list?page=${page>1?page-1:1}">上一页</a></li>
					<c:forEach var="i" begin="1" end="${maxPage}" step="1">
						<li class="${i==page?"current":""}"><a href="${pageContext.request.contextPath}/productCategory/list?page=${i}">${i}</a></li>
					</c:forEach>
					<li><a href="${pageContext.request.contextPath}/productCategory/list?page=${page<maxPage?page+1:1}">下一页</a></li>
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

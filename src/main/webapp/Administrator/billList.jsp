<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.cn.model.SmOrder" %>
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
	                <span>订单管理页面</span>
	            </div>
	            <div class="search">
					<form method="post" action="${pageContext.request.contextPath}/order/findByOrder"  id="inputForm">
	                <span>订单号：</span>
	                <input type="text" placeholder="请输入订单号" name="soId"/>
					<span>订单人：</span>
					<input type="text" placeholder="请输入订单人名称" name="soUserName"/>
	                <input type="button" onclick="checksubmit()"  value="查询"/>
					</form>
	            </div>
	            <!--账单表格 样式和供应商公用-->
	            <table class="providerTable" cellpadding="0" cellspacing="0">
	                <tr class="firstTr">
	                    <th width="10%">订单编码</th>
	                    <th width="20%">姓名</th>
	                    <th width="30%">发货地址</th>
						<th width="15%">商品名</th>
	                    <th width="10%">状态</th>
	                    <th width="15%">操作</th>
	                </tr>
					<c:forEach items="${smOrders}" var="order">
	                <tr>
	                    <td>${order.soId}</td>
	                    <td>${order.soUserName}</td>
	                    <td>${order.soUserAddress}</td>
						<td>${order.soName}</td>
						<c:choose>
							<c:when test="${order.soStatus == 1}"><td>待审核</td></c:when>
							<c:when test="${order.soStatus == 2}"><td>审核通过</td></c:when>
							<c:when test="${order.soStatus == 3}"><td>配货</td></c:when>
							<c:when test="${order.soStatus == 4}"><td>发货</td></c:when>
							<c:when test="${order.soStatus == 5}"><td>收货确认</td></c:when>
						</c:choose>
	                    <td>
							<a href="${pageContext.request.contextPath}/order/to_edit?soId=${order.soId}"><img src="../Imger/timg/xiugai.png" alt="修改" title="修改"/></a>
	                        <a href="${pageContext.request.contextPath}/order/delete?soId=${order.soId}" class="removeBill"><img src="../Imger/timg/schu.png" alt="删除" title="删除"/></a>
	                    </td>
	                </tr>
					</c:forEach>
	            </table>
				<div class="pager">
					<ul class="clearfix">
						<li><a href="${pageContext.request.contextPath}/order/list?page=${page>1?page-1:1}">上一页</a></li>
						<c:forEach var="i" begin="1" end="${maxPage}" step="1">
							<li class="${i==page?"current":""}"><a href="${pageContext.request.contextPath}/order/list?page=${i}">${i}</a></li>
						</c:forEach>
						<li><a href="${pageContext.request.contextPath}/order/list?page=${page<maxPage?page+1:1}">下一页</a></li>
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

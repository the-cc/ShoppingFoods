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
				<form method="post" action="${pageContext.request.contextPath}/User/findByUser"  id="inputForm">
					<div class="search">
						<span>用户名：</span>
						<input type="text"name="suUserName" placeholder="请输入用户名"/>
						<input type="button" onclick="checksubmit()" value="查询"/>
					</div>
				</form>
	            <!--用户-->
	            <table class="providerTable" cellpadding="0" cellspacing="0">
	                <tr class="firstTr">
	                    <th width="10%">用户编码</th>
	                    <th width="20%">用户名称</th>
	                    <th width="10%">性别</th>
	                    <th width="20%">Email电子邮箱</th>
	                    <th width="10%">手机电话</th>
	                    <th width="20%">操作</th>
	                </tr>
					<c:forEach items="${smUsers}" var="smUser">
						<tr>
							<td>${smUser.suUserId}</td>
							<td>${smUser.suUserName}</td>
							<td>${smUser.suSex=='T'?'男':'女'}</td>
							<td>${smUser.suEmail} </td>
							<td>${smUser.suMobile}</td>
							<td>
								<a href="${pageContext.request.contextPath}/User/delete?suUserId=${smUser.suUserId}&suStatus=${smUser.suStatus}" class="removeUser"><img src="../Imger/timg/schu.png" alt="删除" title="删除"/></a>
							</td>
						</tr>
					</c:forEach>
	            </table>
				<div class="pager">
					<ul class="clearfix">
						<li><a href="${pageContext.request.contextPath}/User/list?page=${curPage>1?curPage-1:1}">上一页</a></li>
						<c:forEach var="i" begin="1" end="${maxPage}" step="1">
							<li class="${curPage==i?"current":""}">${i}</li>
						</c:forEach>
						<li><a href="${pageContext.request.contextPath}/User/list?page=${curPage<maxPage?curPage+1:maxPage}">下一页</a></li>
						<!--必须是model中totalPage的键-->
						<li><a>共${maxPage}页</a></li>
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

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<div class="left">
    <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
    <nav>
        <ul class="list">
            <li><a href="${pageContext.request.contextPath}/order/list">订单管理</a></li>
            <li><a href="${pageContext.request.contextPath}/product/list">商品管理</a></li>
            <li><a href="${pageContext.request.contextPath}/User/list">用户管理</a></li>
            <li><a href="${pageContext.request.contextPath}/productCategory/list">分类管理</a></li>
            <li><a href="${pageContext.request.contextPath}/Administrator/messageList.jsp">评价管理</a></li>
        </ul>
    </nav>
</div>

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
            <span>分类管理页面 >> 分类添加页面</span>
        </div>
        <div class="providerAdd">
            <form action="${pageContext.request.contextPath}/productCategory/add" method="post" id="inputForm">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div>
                    <label for="people">父分类：</label>
                    <select name="spcParentId"  id="people">
                        <c:forEach items="${bigs}" var="big">
                            <c:choose>
                                <c:when test="${big.spcName == '新品上市'}"><option disabled>${big.spcName}</option></c:when>
                                <c:otherwise><option value="${big.spcId}" >${big.spcName}</option></c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                    <span>*请输入父分类</span>

                </div>
                <div>
                    <label for="providerName">分类名称：</label>
                    <input type="text" name="spcName" id="providerName"/>
                    <span >*请输入分类名称</span>
                </div>
                <div class="providerAddBtn">
                    <!--<a href="#">保存</a>-->
                    <!--<a href="providerList.html">返回</a>-->
                    <input type="button" value="保存" onclick="checksubmits()"/>
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

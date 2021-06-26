<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>用户注册成功</title>
    <STYLE type="text/css">
        .box {
            margin: auto;
            width: 200px;
            height: 120px;
            background: #fff;
            border: 1px solid #bfbfbf;
            padding: 5px;
            display: block;
            margin-top: 250px;
            background-color: greenyellow;
        }

        .box .msg {
            text-align: center;
            padding: 20px;
        }
    </STYLE>
</head>
<body style="background-color: bisque">
<div class="box">
    <div class="msg">
        <p>恭喜：注册成功！</p>
        <p>正在跳转页面...</p>
        <script type="text/javascript">
            setTimeout("location.href='${pageContext.request.contextPath}/login.jsp'", 3000);
        </script>
    </div>
</div>
</body>
</html>

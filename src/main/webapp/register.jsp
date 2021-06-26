<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>用户注册</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/layui.css">
    <script type="text/javascript" src="js/layui.js"></script>
    <script type="text/javascript" src="js/js.js"></script>
    <script type="text/javascript" src="js/jquery-2.1.4.js"></script>
    <style>
        .yout {
            background: url("${pageContext.request.contextPath}/Imger/1.jpg") no-repeat;
            background-size: 100%;
        }
    </style>
    <script type="application/javascript">
        function $(elementId){
            return document.getElementById(elementId).value;
        }
        function divId(elementId){
            return document.getElementById(elementId);
        }
        function clear(modes) {
            modes.style.backgroundImage = null;
            modes.style.backgroundSize = null;
            modes.style.width = null;
            modes.style.height = null;
            modes.style.marginLeft = null;
        }
        function setbackgrouds(modes) {
            modes.style.backgroundImage = "url(${pageContext.request.contextPath}/Imger/resizeApi.png)";
            modes.style.width = "30px";
            modes.style.height = "25px";
            modes.style.marginLeft = "10px";
            modes.style.backgroundSize = "30px";
        }


        /*用户名验证*/
        function checkUser(){
            var user=$("user");
            var userId=divId("user_prompt");
            userId.innerHTML="";
            var reg=/^[\u4e00-\u9fa5_a-zA-Z]{3,6}$/;
            if(reg.test(user)==false){
                clear(userId);
                userId.innerHTML="&nbsp;&nbsp;用户名不正确,字符3-6之间，不能有数字，空格";
                userId.style.color = 'red';
                return false;
            }
            setbackgrouds(userId);
            return true;

        }
        /*密码验证*/
        function checkPwd(){
            var pwd=$("Pwd");
            var pwdId=divId("pwd_prompt");
            pwdId.innerHTML="";
            var reg=/^[a-zA-Z0-9]{6,16}$/;
            if(reg.test(pwd)==false){
                clear(pwdId);
                pwdId.innerHTML="&nbsp;&nbsp;密码不能含有非法字符，长度在6-16之间";
                pwdId.style.color = 'red';
                return false;
            }
            setbackgrouds(pwdId);
            return true;
        }
        /*密码验证*/
        function checkRepwd(){
            var repwd=$("reqPwd");
            var pwd=$("Pwd");
            var repwdId=divId("repwd_prompt");
            repwdId.innerHTML="";
            if(pwd!=repwd){
                clear(repwdId);
                repwdId.innerHTML="&nbsp;&nbsp;两次输入的密码不一致";
                repwdId.style.color = 'red';
                return false;
            }
            setbackgrouds(repwdId);
            return true;
        }

        /*验证邮箱*/
        function checkEmail(){
            var email=$("email");
            var email_prompt=divId("email_prompt");
            email_prompt.innerHTML="";
            var reg=/^\w+@\w+(\.[a-zA-Z]{2,3}){1,2}$/;
            if(reg.test(email)==false){
                clear(email_prompt);
                email_prompt.innerHTML="&nbsp;&nbsp;Email格式不正确，例如web@sohu.com";
                email_prompt.style.color = 'red';
                return false;
            }
            setbackgrouds(email_prompt);
            return true;
        }
        /*验证手机号码*/
        function checkMobile(){
            var mobile=$("mobile");
            var mobileId=divId("mobile_prompt");
            var regMobile=/^1\d{10}$/;
            if(regMobile.test(mobile)==false){
                clear(mobileId);
                mobileId.innerHTML="&nbsp;&nbsp;手机号码不正确，请重新输入";
                mobileId.style.color = 'red';
                return false;
            }
            mobileId.innerHTML = null;
            setbackgrouds(mobileId);
            return true;
        }

        /*验证个人地址*/
        function checkAddress(){
            var address=$("address");
            var address_prompt=divId("address_prompt");
            var regAddress=/^.+省.+市.+区.*$/;
            if(regAddress.test(address)==false){
                clear(address_prompt);
                address_prompt.innerHTML="&nbsp;&nbsp;填写错误，例如：xx省xx市xx区xx(县|镇|路|乡)";
                address_prompt.style.color = 'red';
                return false;
            }
            address_prompt.innerHTML = null;
            setbackgrouds(address_prompt);
            return true;
        }

        //判断每个属性不能有空值
        function inputNull(form) {
            for(var i=0;i<form.length-1;i++){
                if(form.elements[i].value == ""){
                    form.elements[i].focus();
                    alert("亲："+form.elements[i].placeholder +"不能为空");
                    return false;
                }
            }
            if(checkUser() == false){
                alert("用户名报错，请填写正确");
                return false;
            }else if(checkPwd() == false){
                alert("密码报错，请填写正确");
                return false;
            }else if(checkRepwd() == false){
                alert("确认密码报错，请填写正确");
                return false;
            }else if(checkEmail() == false){
                alert("电子邮箱报错，请填写正确");
                return false;
            }else if(checkMobile() ==false){
                alert("手机号码报错，请填写正确");
                return false;
            }else if(checkAddress() ==false){
                alert("个人地址报错，请填写正确");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>

<div class="site-nav-bg">
    <div class="site-nav w1200">
        <p class="sn-back-home" style="background: rgba(255,210,1,0.29);width: 90px">
            <a id="sd" href="${pageContext.request.contextPath}/index" style="color: #0F0F0F;font-size: 20px;padding-left: 18px;">首&nbsp;&nbsp;页</a>
        </p>
        <div class="sn-quick-menu">
            <div class="login">已有帐号，去 <a href="login.jsp">登录</a></div>
        </div>
    </div>
</div>

<div class="data-cont-wrap yout">
    <div class="contentLayout w1200">
        <form action="${pageContext.request.contextPath}/reg" method="post" onsubmit="return inputNull(this)">
            <table width="100%">
                <caption><h2 style="margin-top: 20px; margin-bottom: 10px">用户注册</h2></caption>
                <tr style="line-height: 60px">
                    <td width="33.3%" align="right"><span style="color: red">*</span>用户名：</td>
                    <td width="33.3%">
                        <input type="text" id="user" name="suUserName" lay-verify="required|phone"
                               placeholder="请输入用户名，帐号须由3-6个字符组成" autocomplete="off" class="layui-input ts"  onblur="checkUser()">
                    </td>
                    <td width="33.3%">
                        <c:choose>
                            <c:when test="${users != null}"><div id="user_prompt" style="color: red">&nbsp;&nbsp;用户名已存在</div></c:when>
                            <c:otherwise><div id="user_prompt"></div></c:otherwise>
                        </c:choose>
                    </td>
                </tr>
                <tr style="line-height: 60px">
                    <td width="33.3%" align="right"><span style="color: red">*</span>密码：</td>
                    <td width="33.3%"><input type="text" id="Pwd" name="suPassword" lay-verify="required|phone"
                                             placeholder="6-16位密码，区分大小写" autocomplete="off" class="layui-input"   onblur="checkPwd()"></td>
                    <td width="33.3%"><div id="pwd_prompt"></div></td>
                </tr>
                <tr style="line-height: 60px">
                    <td width="33.3%" align="right"><span style="color: red">*</span>确认密码：</td>
                    <td width="33.3%"><input type="text"  id="reqPwd" lay-verify="required|phone"
                                             placeholder="再次输入密码" autocomplete="off" class="layui-input" onblur="checkRepwd()"></td>
                    <td width="33.3%"><div id="repwd_prompt"></div></td>
                </tr>

                <tr style="line-height: 60px">
                    <td width="33.3%" align="right">性别：</td>
                    <td width="33.3%">
                        <input type="radio" name="suSex" value="T" checked>&nbsp;男&nbsp;&nbsp;<input type="radio" name="suSex"
                                                                                 value="F">&nbsp;女
                    </td>
                    <td width="33.3%"></td>
                </tr>
                <tr style="line-height: 60px">
                    <td width="33.3%" align="right">电子邮箱：</td>
                    <td width="33.3%"><input type="text" id="email" name="suEmail" lay-verify="required|phone"
                                             placeholder="请输入电子邮箱" autocomplete="off" class="layui-input"  onblur="checkEmail()"></td>
                    <td width="33.3%">
                        <c:choose>
                            <c:when test="${emails != null}"><div id="email_prompt" style="color: red">&nbsp;&nbsp;电子邮箱已存在</div></c:when>
                            <c:otherwise><div id="email_prompt"></div></c:otherwise>
                        </c:choose>
                    </td>
                </tr>
                <tr style="line-height: 60px">
                    <td width="33.3%" align="right">手机：</td>
                    <td width="33.3%"><input type="text" id="mobile" name="suMobile" lay-verify="required|phone"
                                             placeholder="11位手机号码" autocomplete="off" class="layui-input"  onblur="checkMobile()"></td>
                    <td width="33.3%">
                        <c:choose>
                            <c:when test="${mobiles != null}"><div id="mobile_prompt" style="color: red">&nbsp;&nbsp;手机号码已存在</div></c:when>
                            <c:otherwise><div id="mobile_prompt"></div></c:otherwise>
                        </c:choose>
                    </td>
                </tr>
                <tr style="line-height: 60px">
                    <td width="33.3%" align="right">地址：</td>
                    <td width="33.3%"><input type="text" id="address" name="suAddress" lay-verify="required|phone"
                                             placeholder="请输入家庭住址" autocomplete="off" class="layui-input" onblur="checkAddress()"></td>
                    <td width="33.3%"><div id="address_prompt"></div></td>
                </tr>
                <tr style="line-height: 40px">
                    <td colspan="2" align="right"><span style="color: red">带*为必填项</span></td>
                </tr>
                <tr style="line-height: 80px">
                    <td width="33.3%"></td>
                    <td width="33.3%">
                        <button class="layui-btn" style="width: 100%; background-color: #cfb2f6" lay-submit=""
                                onclick="">
                            注册
                        </button>
                    </td>
                    <td width="33.3%"></td>
                </tr>
                <tr style="line-height: 80px">
                    <td width="33.3%" height="30px"></td>
                </tr>
            </table>
        </form>
    </div>
</div>

<div class="footer">
    <div class="ng-promise-box">
        <div class="ng-promise w1200">
            <p class="text">
                <a class="icon1">7天无理由退换货</a>
                <a class="icon2">满99元全场免邮</a>
                <a class="icon3" style="margin-right: 0">100%品质保证</a>
            </p>
        </div>
    </div>
    <div class="mod_help w1200">
        <p>
            <a>关于我们</a>
            <span>|</span>
            <a>帮助中心</a>
            <span>|</span>
            <a>售后服务</a>
            <span>|</span>
            <a>食品资讯</a>
            <span>|</span>
            <a>关于货源</a>
        </p>
        <p class="coty">母婴商城版权所有 &copy; 2012-2020</p>
    </div>
</div>

</body>
</html>

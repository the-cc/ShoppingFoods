// JavaScript Document
var a=false;
var b=false;
var c=false;
var d=false;
var e=false;
 $(document).ready(function() {
    $("#test1").blur(function() {
			var te0=$("#test1").val();
			var reg1 = /^[0-9a-zA-Z]+@[0-9a-zA-Z]+[\.]{1}[0-9a-zA-Z]+[\.]?[0-9a-zA-Z]+$/;
            if(!reg1.test(te0)){
				$("#td1").empty(); 
				$("#td1").append("邮箱名只能是字母、数字和下划线!");	 
			}
			if(reg1.test(te0)){
				$("#td1").empty();
				a=true;
			}
       });
	  $("#test2").blur(function() {
			var te1=$("#test2").val();
			var reg1 =/\d{6,}/;
            if(!reg1.test(te1)){
				$("#td2").empty(); 
				$("#td2").append("密码只能是六位数字!");	 
			}
			if(reg1.test(te1)){
				$("#td2").empty();
				b=true;
			}
       });
	   $("#test3").blur(function() {
        	var te1=$("#test2").val();
			var te2=$("#test3").val();
			var reg1 =/\d{6,}/;
			if(!reg1.test(te1)||!reg1.test(te2)){
				$("#td3").empty(); 
				$("#td3").append("你输入的密码不符合要求!");
			}
			if(te1!=te2){
				$("#td3").empty(); 
				$("#td3").append("你输入的两次密码不匹配！");
			}
			if((reg1.test(te1)&&reg1.test(te2))&&(te1==te2)){
				$("#td3").empty();
				c=true;
			}
    	});
		$("#test4").blur(function() {
        	var te3=$("#test4").val();
			var reg1=/[\u4e00-\u9fa5]/;
			if(!reg1.test(te3)){
				$("#td4").empty();
				$("#td4").append("答案只能是中文");	
			}
			if(reg1.test(te3)){
				$("#td4").empty();
				d=true;	
			}
    	});
		$("#test5").blur(function() {
        	var te4=$("#test5").val();
			var reg1=/^[0-9a-zA-Z]+@[0-9a-zA-Z]+[\.]{1}[0-9a-zA-Z]+[\.]?[0-9a-zA-Z]+$/;
			if(!reg1.test(te4)){
				$("#td5").empty();
				$("#td5").append("邮箱名只能是字母、数字和下划线!");	
			}
			if(reg1.test(te4)){
				$("#td5").empty();
				e=true;	
			}
    	});
		$("form").submit(function() {
            if($("#test1").val()!="" && $("#test2").val()!="" && $("#test3").val()!="" && $("#test4").val()!="" &&
				$("#test5").val()!="" && $("#test6").val()!=""){
				return true;}
			else{
				alert("你的内容不能为空!");
				return false;
				}
        });
});
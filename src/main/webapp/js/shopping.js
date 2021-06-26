// JavaScript Document
/**
 * Created by yaling.he on 2018/7/5.
 */
//时间
window.onload = function(){
 //低版本的IE浏览器不支持getElementByClassName方法，考虑兼容性,重写方法。
 if (!document.getElementByClassName) {
  document.getElementByClassName =function(cls){
   var ret = [];
   var clsElments = document.getElementsByTagName('*');
   for (var i = 0, len = clsElments.length; i < len; i++) {
    //考虑一个标签有多个class的情况,这里用正则表达式会好一点
    if (clsElments[i].className == cls 
     || (clsElments[i].className.indexOf(cls + " ") >= 0)
     || (clsElments[i].className.indexOf(" " + cls + " ") >= 0)
     || (clsElments[i].className.indexOf(" " + cls) >= 0)) 
    {
     ret.push(clsElments[i]);
    }
   }
   return ret;
  }
 
 }
 
 var cartTable = document.getElementById("cartTable");
 var tr = cartTable.children[1].rows; //table标签特有的属性，rows可以获得表格元素的所有tr行。
 var checkInput = document.getElementByClassName('check');//获得所有的单选框
 var checkAllInput = document.getElementByClassName('check_all');//获得所有的单选框
 var priceTotle = document.getElementById("priceTotle");//总价
 var selectTotle = document.getElementById("selectTotle");//已选商品
 var selected = document.getElementById("selected");
 var footer = document.getElementById("footer");//底部标签
 var selectedViewList = document.getElementById("selectedViewList");//底部标签
 var deleteAll = document.getElementById("deleteAll");
 
 
 
 //计算总价格和数量
 function getTotle(){
  var selectNum = 0;//数量
  var priceNum = 0;//价格
  var HTMLstr = ""; //缩略图的字符串拼接
  selectTotle.innerHTML = selectNum;
  priceTotle.innerHTML = priceNum.toFixed(2);//保留两位小数
  selectedViewList.innerHTML = HTMLstr;
 }
 
 //计算小计价格
 function getSubTotle(tr){
  var tds = tr.cells;
  var price = parseFloat(tds[2].innerHTML);
  var num = parseInt(tr.getElementsByTagName("input")[1].value);
  var subTotle = parseFloat(price * num).toFixed(2);
  tds[4].innerHTML = subTotle;
 }
 
 //复选框绑定单击事件
 for (var i = 0, len = checkInput.length; i < len; i++){
  checkInput[i].onclick =function (){
   //判断全选按钮，变更
   if (this.className == "check_all check") {
    for (var j = 0; j < len; j++){
     checkInput[j].checked = this.checked;
    }
   }
   if (this.checked == false) {
    for (var k = 0,len2 = checkAllInput.length; k < len2; k++){
     checkAllInput[k].checked = false;
    }
   }
   getTotle();
  }
 }
 
 
 
 

}
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8" />
    <title>SoSuggest</title>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.0.0.js"></script>
 	
 	<style type="text/css">
 		*{margin: 0;padding: 0;}
 		.center-block{ margin: 20% auto;position: relative; width: 800px;height: 100px;}
 		.input-style[type="text"]{ width: 500px;height: 30px;}
 		.input-btn{     width: 79px;height: 34px;position: relative;left: -5px;top: 1px;}
 		.sugg-list-div{ display:none;width: 502px;border-left: #0000FF 1px solid;border-bottom: #0000FF 1px solid;border-right: #0000FF 1px solid;position: relative;left: 96px;top:-1px;}
 		.sugg-list{ list-style: none;}
 		ul > li{padding-left:5px;padding-top:2px;cursor:pointer;}
 		ul > li:hover{background: #ccc;}
 		
 	</style>
  </head>
  
  <body>
    <div class="center-block"> 
    	输入关键字：<input name="keyword" id="key_input" type="text" class="input-style"/>
    	<input name="so_btn" id="so_btn" type="button" value="点击搜索" class="input-btn"/>
    	<div id="sugg_list" class="sugg-list-div">
    		<ul id="sugg_list_item" class="sugg-list">
    		</ul>
    	</div>
    </div>
  </body>
  <script type="text/javascript">
 		//$(document).ready(function(){
 			
 			$(document).delegate('ul li','click',function(){
 				window.location.href="http://www.baidu.com/s?wd="+$(this).text();
 				//https://sp0.baidu.com/5a1Fazu8AA54nxGko9WTAnF6hhy/su?wd=
 			});
 			$("#key_input").bind('keyup',function(){//键盘事件发生，提示框显示
 				var parameter = $(this).val().trim();//如果输入框内容为空即使发生键盘事件也不向服务器发请求，减轻服务器负担
 				if(parameter==""){
 					return ;
 				}
 				var url = "${pageContext.request.contextPath }/sugg?q="+$(this).val().trim();
 				 $.get(url,function(data,status){
 	 			    var aa = data.split(",");
 	 			    var ht = "";
 	 			    for(var i=0;i<aa.length;i++){
 	 			    	ht = ht+"<li>"+aa[i].substring(1,aa[i].length-1)+"</li>";
 	 			    }
 	 			    $("#sugg_list_item").html(ht);
 	 			    console.log(aa);
 	 			 });
 	 			$("#sugg_list").show();
 			}).bind('blur',function(){ //聚焦事件发生，提示框显示
 				$("#sugg_list").show();
 			});
 			$(document).bind('click',function(){ //点击可视区域，提示框隐藏
 				$("#sugg_list").hide();
 			});
 		//});
 	</script>
</html>

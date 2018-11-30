<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<style>
	*{margin:0;padding:0;}
	body{font-family:"微软雅黑";}
	.unfound{width:602px;height:506px;margin:50px auto 0;background: url(<%=path%>/resources/img/unf.jpg) no-repeat;position: relative;}
	.unfound h3{position:absolute;top:245px;left:192px;font-size:20px;color:#383230;font-weight: normal;}
	.unfound div{position: absolute;bottom:146px;right:215px;font-size:14px;color:#383230;}
	.unfound div a{text-decoration:none;color:#3899e5;}
	</style>

  </head>
  
<body>
<div class="unfound">
	<h3>在本系统<br/>未找到您的用户信息 !</h3>
	<div><a href="">重新登录</a>&nbsp;试试看！</div>
</div>
</body>
</html>

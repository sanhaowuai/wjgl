<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>表单设计器</title>
		<script type="text/javascript" src="<%=path%>/resources/js/ymbj/jquery-1.11.1.min.js"></script>
		<link rel="stylesheet" href="<%=path%>/resources/js/jquery-easyui-1.5.1/themes/metro-green/easyui.css" />
	    <link rel="stylesheet" href="<%=path%>/resources/js/jquery-easyui-1.5.1/themes/icon.css" />
	    <script type="text/javascript" src="<%=path%>/resources/js/jquery-easyui-1.5.1/jquery.easyui.min.js" ></script>
</head>
<body>
<div id="cc" class="easyui-layout" data-options="fit:true" >
    <div data-options="region:'north',title:'North Title',split:true" style="height:100px;"></div>
    <div data-options="region:'south',title:'South Title',split:true" style="height:100px;"></div>
    <div data-options="region:'east',title:'East',split:true" style="width:100px;"></div>
    <div data-options="region:'west',title:'West',split:true" style="width:100px;"></div>
    <div data-options="region:'center',title:'center title'" style="padding:5px;background:#eee;"></div>
</div>
</body>
</html>
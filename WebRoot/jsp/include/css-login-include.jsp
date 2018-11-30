<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blue/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blue/css/dripicon.css"> 
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blue/css/css.css">
<link href="<%=path%>/resources/style/blue/css/login.css" rel="stylesheet" type="text/css" />
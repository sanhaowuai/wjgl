<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>流程图片</title>
<jsp:include page="../../include/css-main-include.jsp"></jsp:include>

<link href="<%=path%>/resources/js/treetable/stylesheets/master.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/js/treetable/stylesheets/jquery.treeTable.css" rel="stylesheet" type="text/css" />
<style type="text/css">
  html, body { height:100%; }
  .Contentbox { width:100%; min-height:100%;height:auto }
  *html .Contentbox { height:100% }
</style>
</head>

<body>
  <div class="list">
    <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line" id="zbtable">
      <tbody>
          <tr>
           <td>
           <c:if test="${empty lctphzm || lctphzm eq ''}">
           	<font color="red">暂时没有流程图片，请先维护流程图片。</font>
           </c:if>
           <c:if test="${not empty lctphzm && lctphzm ne ''}">
           	<img src="<%=path%>/resources/img/lctp${lctphzm}" alt="流程图片" width="100%" height="100%"/>
           </c:if>
        </td>
      </tbody>
    </table>
  </div>

<div id="setting"> </div>
</body>
</html>
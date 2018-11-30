<%@ page language="java" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>demo</title>
</head>
  
<body>
	<a href="<%=path%>/demo/queryFj" target="_blank">pluploadDemo</a>
	<a href="<%=path%>/qxcdgl/queryAllQxcdgl" target="_blank">treeTableDemo</a>
	<a href="<%=path%>/demo/queryCk" target="_blank">ckeditor</a>
	<a href="<%=path%>/jsp/commons/demo/My97DatePicker/My97DateDemo.jsp" target="_blank">My97DatePicker</a>
	<a href="<%=path%>/demo/queryExcelDemo" target="_blank">excel</a>
	<a href="<%=path%>/jsp/commons/demo/pdf/pdfDemo.jsp" target="_blank">pdf</a>
	<a href="<%=path%>/demo/queryUeditor" target="_blank">UeditorDemo</a>
	<a href="<%=path%>/demo/queryUmeditor" target="_blank">UemditorDemo</a>
	<a href="<%=path%>/resources/js/highcharts2.2.5/test.html" target="_blank">highcharts</a>
	<a href="<%=path%>/resources/js/jwplayer-6.1/test.html" target="_blank">jwplayer</a>
	<a href="<%=path%>/jsp/commons/demo/transaction/transactionDemo.jsp" target="_blank">事务处理</a>
	<a href="<%=path%>/jsp/commons/demo/easyui/easyuiDemo.jsp" target="_blank">easyui数据表格</a>
</body>
</html>

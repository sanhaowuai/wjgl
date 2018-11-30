<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>--</title>
		
		<link rel="stylesheet" href="<%=path%>/resources/js/bootstrapvalidator-master/dist/css/bootstrapValidator.css"/>
		<link rel="stylesheet" href="<%=path%>/resources/js/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css"/>
		<link href="<%=path%>/resources/js/bootstrap-fileinput-master/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css"/>
		<link href="<%=path%>/resources/js/bootstrap-fileinput-master/themes/explorer/theme.min.css" media="all" rel="stylesheet" type="text/css"/>
		
		<c:if test="${ymcss eq '1' }">
		<jsp:include page="../../include/css-jsq-include-1.jsp"></jsp:include>
		</c:if>
		<c:if test="${ymcss eq '2'}">
		<jsp:include page="../../include/css-jsq-include-2.jsp"></jsp:include>
		</c:if>
		<c:if test="${ymcss eq '3' or empty ymcss}">
		<jsp:include page="../../include/css-jsq-include-3.jsp"></jsp:include>
		</c:if>
		
		<script type="text/javascript" src="<%=path%>/resources/js/ymbj/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/bootstrapvalidator-master/dist/js/bootstrapValidator.js"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js" ></script>
		<script src="<%=path%>/resources/js/ bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<script src="<%=path%>/resources/js/bootstrap-fileinput-master/js/fileinput.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/bootstrap-fileinput-master/js/locales/zh.js"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/bootstrap-fileinput-master/themes/explorer/theme.min.js"></script>
		<style>
			.butbar	{border-bottom:1px dotted #777777}
			.ptpb{padding-top:10px ;padding-bottom:10px;}
			table{margin:10px 0 0;}
			td,th{border: 1px solid #ddd;color: #787878;}
			label{color: #787878;}
			DIV.form-group{
			    margin: 5px;
			    padding: 5px;
			}
		</style>
	</head>
	<body>
		<!--  -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12   ptpb">
					${message}
				</div>
			</div>
		</div>
		 
	</body>

 
</html>
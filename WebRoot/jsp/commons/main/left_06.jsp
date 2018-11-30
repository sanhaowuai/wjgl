<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>北京赢科后台管理系统</title>
<jsp:include page="../../include/css-main-include.jsp"></jsp:include>
<script type="text/javascript" src="<%=path%>/resources/js/common/menu/jquery.min.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/menu/jquery.wysiwyg.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/menu/stylesheetToggle.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/menu/seeui.js"></script> 
</head>
<body> 
<div id="leftmenu04">
<div class="mainbg"></div>
<div class="lefttop">栏目导航</div>
	<ul>
		<c:forEach items="${order1List}" var="fmap">
			<li><a href="javascript:void(0);" class="clearfix">${fmap.QXMC} <span></span></a>
				<ol class="clearfix">
					<c:forEach items="${order2List}" var="zmap">
						<c:if test="${fmap.QXDM eq zmap.FQXDM}">
				        	<li><a href="<%=path%>/${zmap.FWLJ}" target="iframename">${zmap.QXMC}</a></li>
				        </c:if>
			        </c:forEach>
		      	</ol>
	    	</li>
    	</c:forEach>
	</ul>
</div>
</body>
</html>


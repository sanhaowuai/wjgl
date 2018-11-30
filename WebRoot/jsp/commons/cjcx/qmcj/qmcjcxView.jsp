<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>北京赢科后台管理系统</title>
<jsp:include page="../../../include/css-main-include.jsp"></jsp:include>
<style type="text/css">
	html, body { height:100%; }
	.Contentbox { width:100%; min-height:100%;height:auto }
	*html .Contentbox { height:100% }
</style>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>

</head>

<body>
<table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="addlist">
	 <tr>
	    <th width="120" >任务号：</th>
	    <td>${qmcjcx.rwh}</td> 
	    <th width="120">学年学期：</th>
	    <td>${qmcjcx.xnxqmc}</td>
    </tr> 
     <tr>  
	    <th>课程代码：</th>
	    <td>${qmcjcx.kcdm}</td> 
	    <th>课程名称：</th>
	    <td>${qmcjcx.kcmc}</td>
    </tr> 
     <tr>  
	    <th>累加分项计分制：</th>
	    <td>${qmcjcx.ljfxjfzmc}</td>
	    <th>总评计分制：</th>
	    <td>${qmcjcx.zpcjjfzmc}</td>
    </tr> 
     <tr>  
	    <th>计分制满分：</th>
	    <td>${qmcjcx.bfzmf}</td> 
	    <th>总成绩：</th> 
	    <td>${qmcjcx.zpcj}</td>
    </tr> 
    <c:forEach items="${rwmbList}" var="obj" >
     <tr>  
	    <th>${obj.lmmc}：</th>
	    <td>权重<span class="font8shrink">（占总成绩百分比）</span>[${obj.ljfxbz}%]，满分[${obj.mf}]</td> 
	    <th>得分：</th> 
	    <td>${qmcjcx[fn:toLowerCase(obj.lmdm)]}</td>
    </tr> 		    
    </c:forEach>
 </table>
</body>
</html>


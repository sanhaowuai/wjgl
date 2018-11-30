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
<jsp:include page="../../include/css-main-include.jsp"></jsp:include>
<style type="text/css">
  html, body { height:100%; }
  .Contentbox { width:100%; min-height:100%;height:auto }
  *html .Contentbox { height:100% }
</style>
<script src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=path%>/resources/js/umeditor/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=path%>/resources/js/umeditor/umeditor.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/js/umeditor/themes/default/css/umeditor.min.css"/>
<script type="text/javascript">
	
	function download(url)
	{
		document.getElementById("filepath").value=url;
		document.form1.submit();
	}
	
	function setValue()
	{
		var filename=document.getElementById("filepath").value;
		var suffix=filename.substring(filename.lastIndexOf("."));
		document.getElementById("mydoc").innerHTML="我的论文"+suffix;
	}
</script>
</head>

<body onLoad="setValue()">
<div class="Contentbox">
  <div class="mainbg"></div>
  <div class="pd10">
    <div class="address">当前位置：实验教学 >> 我的论文</div>
    <div class="clr"></div>
	<table>
	<tr>
	<td width="250px">&nbsp;</td>
	<td>
    <table class="addlist" width="600px" align="center" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" style="border-collapse:collapse;">
      <tr>
        <th style=" text-align:left; line-height:40px; padding-left:5px;" colspan="4">选题基本信息</th>
      </tr>
      <tr>
        <td align="center" width="120px"><strong>题目</strong></td>
        <td colspan="3">${lwxx.title}</td>
      </tr>
      <tr>
        <td align="center"><strong>指导教师</strong></td>
        <td colspan="3">${lwxx.teacherName}</td>
      </tr>
      <tr>
        <td align="center"><strong>选题时间</strong></td>
        <td colspan="3">${lwxx.selectDateString}</td>
      </tr>
      <tr>
        <th style=" text-align:left; line-height:40px; padding-left:5px;" colspan="4">论文信息
  
        </th>
      </tr>
      <tr>
        <td align="center" width="125px"><strong>提交状态</strong></td>
        <td width="167px">已提交</td>
        <td align="center" width="125px">提交时间</td>
        <td>${lunwen.subDateString}</td>
      </tr>
      <tr>
        <td align="center"><strong>关键词</strong></td>
        <td colspan="3">${lunwen.keyword}</td>
      </tr>
      <tr>
        <td align="center"><strong>摘要</strong></td>
        <td colspan="3">${lunwen.summary}</td>
      </tr>
      <tr>
        <td align="center"><strong>附件</strong></td>
        <td colspan="3"><a href="javascript:download('${lunwen.filepath}')"> <span id="mydoc">我的论文.doc </span></a> </td>
      </tr>
      <tr>
        <th style=" text-align:left; line-height:40px; padding-left:5px;" colspan="4">答辩信息</th>
      </tr>
      <tr>
        <td align="center"><strong>答辩时间</strong></td>
        <td colspan="3">
		<c:if test="${not empty dabian}">
		${dabian.dabianTimeString}~${dabian.endTimeString}
		</c:if>
		<c:if test="${empty dabian}">
		未公布
		</c:if>
		</td>
      </tr>
      <tr>
        <td align="center"><strong>答辩地点</strong></td>
        <td colspan="3">
		<c:if test="${empty dabian}">
		未公布
		</c:if>
		${dabian.dabianAddr}
		</td>
      </tr>
      <tr>
        <th style=" text-align:left; line-height:40px; padding-left:5px;" colspan="4">成绩信息</th>
      </tr>
      <tr>
        <td align="center"><strong>成绩</strong></td>
        <td colspan="3">
		<c:if test="${empty chengji}">
		（尚未公布）
		</c:if>
		${chengji.zpcj}</td>
      </tr>
      <tr>
        <td align="center"><strong>论文成绩</strong></td>
        <td>${chengji.lwcj}</td>
        <td align="center"><strong>所占比例</strong></td>
        <td>${chengji.lwcjbl}</td>
      </tr>
      <tr>
        <td align="center"><strong>答辩成绩</strong></td>
        <td>${chengji.dbcj}</td>
        <td align="center"><strong>所占比例</strong></td>
        <td>${chengji.dbcjbl}</td>
      </tr>
      <tr>
        <td align="center"><strong>实践成绩</strong></td>
        <td>${chengji.sjcj}</td>
        <td align="center"><strong>所占比例</strong></td>
        <td>${chengji.sjcjbl}</td>
      </tr>	  
    </table>
	</td>
	</tr>
  </div>
</div>
<form name="form1" method="post" action="<%=request.getContextPath()%>/wdlw/downFile">
<input type="hidden" name="filepath" id="filepath" value="${lunwen.filepath}"/>
</form>
</body>
</html>

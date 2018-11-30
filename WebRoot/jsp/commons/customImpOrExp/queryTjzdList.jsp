<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
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
<title>自定义导入列表</title>
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blue/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blue/css/dripicon.css"> 
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blue/css/skin-select.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blue/css/tooltipster.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blue/css/css.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blue/css/tooltipster.css">

<link href="<%=path%>/resources/style/blue/css/top.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blue/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blue/css/left.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blue/css/content.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blue/css/pageTag.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blue/css/zTreeStyle.css" rel="stylesheet" type="text/css" />
<jsp:include page="../js/js_jquery.jsp"/>

<style type="text/css">
	html, body { height:100%; }
	.Contentbox { width:100%; min-height:100%;height:auto }
	*html .Contentbox { height:100% }
	.link{width:60px;height:26px;border-radius: 3px;background:#f1f1f1;display:inline-block;border:1px solid #bebebe;line-height:26px;margin-top:4px;text-align:center;color:#222}
</style>
<script type="text/javascript">


    
	//全选
	function allcheck(bing, checkBoxName) {
		if ($(bing).attr("checked") == 'checked' || $(bing).attr("checked")) {
		      $("input[name='" + checkBoxName + "']").attr("checked", true);
		} else {
		      $("input[name='" + checkBoxName + "']").attr("checked", false);
		}
	}
	// 返选
	function backcheck(bing, checkBoxName) {
		$("input[name='" + checkBoxName + "']").each(function() {
			$(this).attr("checked", !$(this).attr("checked"));
		});
	}	
</script>
</head>

<body>

<div class="Contentbox">
  <div class="mainbg"></div>
  <div class="pd10">
	 <div class="clr"></div>
   <form name="cxform" method="post" id="cxform" >
	<div class="clr"></div>
	  <div class="list">
      <table id="selTbl" width="100%" cellpadding="0" cellspacing="0" class="bot_line" style="border-collapse:collapse;text-align: center;">
        <tr>
          <th width="5%"><input type="checkbox" id="ids" onclick="javascript:allcheck(this,'ids');" title="全选/不选"/></th>  
          <th style="text-align: center;">列</th>
          <th style="text-align: center;">列名</th>
          <th style="text-align: center;">长度</th>
          <th style="text-align: center;">类型</th>
          <th style="text-align: center;">是否主键</th>
        </tr>
	     <c:choose>
	     	<c:when test="${not empty impColList}">
	     		<c:forEach items="${impColList}" var="obj" varStatus="status">
		     		 <tr id="row${status.index}">
				        <td><input type="checkbox" name="ids"  value="${obj.column_en}-${status.index}"/></td>  	
				       	<td style="width: 10%">
			       			<font color="black">${obj.column_en}</font>
				       	</td>
				       	<td style="width: 10%">
				       	    <input type="hidden" id="zh${status.index}" value="${obj.column_zh}"/>
				       	    <font color="black">${obj.column_zh}</font>
				       	</td>
				       	<td style="width: 10%">
				       	    <input type="hidden" id="cd${status.index}" value="${obj.column_cd}"/>
				       		<font color="black">${obj.column_cd}</font>
				       	</td>
				       
				       	<td style="width: 10%">
				       	    <input type="hidden" id="lx${status.index}" value="${obj.column_lx}"/>
				       		<font color="black">${obj.column_lx}</font>
				       	</td>
				       	<td style="width: 10%">
				       	    <input type="hidden" id="sfzj${status.index}" value="${obj.sfzj}"/>
				      		<c:if test="${obj.sfzj=='1'}"><font color="green">是</font></c:if>			      		
				      		<c:if test="${obj.sfzj=='0'}"><font color="red">否</font></c:if>			      		
				       	</td>
			         </tr>
	     		</c:forEach>
	     	</c:when>
	     </c:choose>
	     <tr id="addIndex">
       	 </tr>
      </table>
      <input type="hidden" id="impColMesg" name="impColMesg"/>
      <input type="hidden" id="curid" name="curid" value="${id}"/>
      </form>
    </div>
	 <div class="clr"></div>
  </div>
  

<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"></div>
</body>
</html>


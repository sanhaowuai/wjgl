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
<title>修改代码表维护</title>
<jsp:include page="../../include/css-main-include.jsp"></jsp:include>
<jsp:include page="../js/js_jquery.jsp"/>

<style type="text/css">
  html, body { height:100%; }
  .Contentbox { width:100%; min-height:100%;height:auto }
  *html .Contentbox { height:100% }
  .link{width:60px;height:26px;border-radius: 3px;background:#f1f1f1;display:inline-block;border:1px solid #bebebe;line-height:26px;margin-top:4px;text-align:center;color:#222}
</style>

<script type="text/javascript" src="<%=path%>/resources/js/My97DatePicker/WdatePicker.js"></script>

<script type="text/javascript">
</script>
</head>

<body>
<div class="Contentbox">
  <div class="pd5">
      <form name="showform" method="post" id="showform" >
      	<input type="hidden" id="flag" name="flag" value="${flag}"/>
      	<input type="hidden" id="sqid" name="sqid" value="${sqid}"/>
        <table width="100%" border="1" cellpadding="0" cellspacing="0" style="text-align: center; float:none" class="addlist">
			
			<tr>
				<th style="text-align:right;">表：</th>
				<td style="text-align:left;"  width="380px">
					<input type="text" name="tablename" id='tablename' value="${map.TABLENAME}" style="color: black;" readonly="readonly"/>
				</td>
			</tr>
			<tr>
				<th style="text-align:right;">代码：</th>
				<td style="text-align:left;"  width="380px">
					<input type="text" name="dm" id='dm' value="${map.DM }" style="color: black;" maxlength="10" dataType="Require" msg="必填"/>
					<span class="red">*</span>
				</td>
			</tr>
			<tr>
				<th style="text-align:right;">名称：</th>
				<td style="text-align:left;"  width="380px">
					<input type="text" name="mc" id='mc' value="${map.MC }" style="color: black;" maxlength="10" dataType="Require" msg="必填"/>
					<span class="red">*</span>
				</td>
			</tr>
        </table>
      </form>
  </div>
</div>

<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"></div>
</body>
</html>


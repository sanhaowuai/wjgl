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
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/bootstrap.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/My97DatePicker/WdatePicker.js"></script>

<script type="text/javascript">
	
	

</script>
</head>

<body>
<div class="Contentbox">
  <div class="mainbg"></div>
  <div class="pd10">
   	
    <div class="list">
      <form name="ff" method="post" id="ff" >
<!--        <input type="hidden" name="pageCount"  value="${jsglPage.pageCount}" />-->
<!--		<input type="hidden" name="pageNo"  value="${jsglPage.pageNo}" />-->
<!--		<input type="hidden" name="pageSize"  value="${jsglPage.pageSize}" />-->
		<input type="hidden" name="dmmc"  value="${jsglPage.dmmc}" />
        <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
<!--             <th><input type="checkbox" id="ids" title="全选/不选" style="padding:0;margin-left:2px;*margin-left:-2px;"/></th> -->
            <th>需求编号</th>
            <th>项目名称</th>
            <th>申请人</th>
            <th>变更提出人</th>
            <th>变更类型</th>
            <th>紧急程度</th>
            <th>变更提出时间</th>
            <th>要求完成时间</th>
            <th>状态</th>
            <th>提示</th>
            
            
          </tr>
		  <c:forEach items="${fkcllist}" var="map" varStatus="status">
        	<tr <c:if test="${status.count % 2 eq '0'}">class="bgcol"</c:if>>        	 
<%--          	  <td><input name="ids" type="checkbox" value="${map.sqdh}"/></td> --%>
         	  <td>${map.sqdh}</td>
         	  <td>${map.xtmc}</td>
         	  <td>${map.sqr}</td>
         	  <td>${map.bgtcrxm}</td>
         	  <td>${map.bglxmc}</td>
         	  <td>${map.jjcdmc}</td>
			  <td>${map.sqsj }</td>
			  <td>${map.yqwcsj }</td>
			  <c:if test="${empty map.sqzt}"><td></td></c:if>
			<c:if test="${map.sqzt eq '0'}"><td>保存</td></c:if>
   			<c:if test="${map.sqzt eq '1'}"><td>提交</td></c:if>
   			<c:if test="${map.sqzt eq '2'}"><td>已流转</td></c:if>
   			<c:if test="${map.sqzt eq '3'}"><td>已接收</td></c:if>
   			<c:if test="${map.sqzt eq '4'}"><td>退回</td></c:if>
   			<c:if test="${map.sqzt eq '5'}"><td>已确认完成</td></c:if>
   			<c:if test="${map.sqzt eq '6'}"><td>已确认未完成</td></c:if>
   			<c:if test="${map.sqzt eq '99'}"><td>最终完成</td></c:if>
   			<c:if test="${map.sqzt eq '-99'}"><td>最终未完成</td></c:if>
   			<c:if test="${map.sqzt eq 'A'}"><td>逾期</td></c:if>
			  <td><span style="color:red;">${map.pdplcl }</span></td>
			
              
       		</tr>
          </c:forEach>
        </table>
      </form>
    </div>

<!--     <div class="youtube">  -->
<%--       <c:if test="${not empty fkclPage }"> --%>
<%--         <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="fkclPage" onlyOneShow="true" showListNo="true" action="fkcl/queryFkcl"/> --%>
<%--       </c:if> --%>
<!--     </div> -->
    <div class="clr"></div>
  </div>
</div>




  

<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"> </div>
</body>
</html>


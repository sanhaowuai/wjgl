<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%> 
<%@ taglib prefix="uf" uri="UFunction"%> 
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
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/My97DatePicker/WdatePicker.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/bootstrap.js"></script>
<link href="<%=path%>/resources/js/select2-4.0.0-rc.2/dist/css/select2.min.css" rel="stylesheet" />
<script src="<%=path%>/resources/js/select2-4.0.0-rc.2/dist/js/select2.min.js"></script>
<script type="text/javascript" >

	// 查询/刷新
	function querylike(){
		document.queryform.action="<%=path%>/qkfkxtcx/queryList";
		document.queryform.submit();
	}

	// 浏览信息
	function ckByID(sqdh){
		window.open('<%=path%>/qkfkxtcx/queryQkfkxtxxbyid?sqdh='+sqdh+'&random='+Math.random()*100000,"查看信息"+sqdh ,'height=600, width=1024, top=100, left=300, titlebar=no,toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no,z-look=yes');
	}

	function jiazai(){
		$("#lzjsrdm").select2();
		}
</script>
</head>

<body onload="jiazai();">
<div class="Contentbox">
  <div class="mainbg"></div>
  <div class="pd10">
   	<div class="question" title="帮助" onclick="javascript:cha('${QXB.QXDM}');"></div>
    <div class="address">当前位置：${QXB.FQXMC} >> ${QXB.QXMC}</div>
    <div class="clr"></div>
    <div class="butsea"> 
		
       <div class="dropdown pull-right">
       <form id="queryform" name="queryform" method="post">
	   <div class="btn-group">
		  <button type="button" class="btn btn-search dropdown-toggle" data-toggle="dropdown">搜索 <span class="caret"></span></button>
		  <div class="dropdown-menu search-list pull-right" role="menu" style="width:260px;">
          <table border="0" width="96%"  cellpadding="0" cellspacing="0"  >
          <tr>
          <th>项目名称</th>
	    	<td>
	         <select id="xtdm" name="xtdm">
	         <option value="">-请选择-</option>
	         <c:forEach items="${xtList}" var="map">
	         <option value="${map.DM}" <c:if test="${map.DM==qkfkxtcxPage.xtdm}">selected="selected"</c:if>>${map.XTMC}</option>
	         </c:forEach>
	         </select>
	         </td>
	         </tr>
	         <tr>
	         <th>变更类型</th>
	         <td>
	         <select id="bglx" name="bglxdm">
	         <option  value="">-请选择-</option>
	         <c:forEach items="${bglxList}" var="map">
	         <c:if test="${map.SJDM=='-1'}">
	         <optgroup label="${map.MC}"></optgroup>
	         </c:if>
	         <c:if test="${map.SJDM!='-1'}">
	         <option <c:if test="${map.DM==qkfkxtcxPage.bglxdm}">selected="selected"</c:if> value="${map.DM}">&nbsp;&nbsp;${map.MC}</option>
	         </c:if>
	         </c:forEach>
	         </select>
	         </td>
	         </tr>
	         <tr>
	         <th>紧急程度</th>
	        <td>
	         <select id="jjcddm" name="jjcddm">
	         <option  value="">-请选择-</option>
	         <c:forEach items="${jjcdList}" var="map">
	         <option value="${map.DM}" <c:if test="${map.DM==qkfkxtcxPage.jjcddm}">selected="selected"</c:if>>${map.MC}</option>
	         </c:forEach>
	         </select>
	         </td>
	         </tr>
	         <tr>
	         <th>状态</th>
	         <td>
	         <select id="zt" name="sqzt">
	         <option <c:if test="${qkfkxtcxPage.sqzt==''}">selected="selected"</c:if> value="">-请选择-</option>
	         <option <c:if test="${qkfkxtcxPage.sqzt=='0'}">selected="selected"</c:if> value="0">保存</option>
	         <option <c:if test="${qkfkxtcxPage.sqzt=='1'}">selected="selected"</c:if> value="1">提交</option>
	         <option <c:if test="${qkfkxtcxPage.sqzt=='2'}">selected="selected"</c:if> value="2">已流转</option>
	         <option <c:if test="${qkfkxtcxPage.sqzt=='3'}">selected="selected"</c:if> value="3">已接收</option>
	         <option <c:if test="${qkfkxtcxPage.sqzt=='4'}">selected="selected"</c:if> value="4">退回</option>
	         <option <c:if test="${qkfkxtcxPage.sqzt=='5'}">selected="selected"</c:if> value="5">已确认完成</option>
	         <option <c:if test="${qkfkxtcxPage.sqzt=='6'}">selected="selected"</c:if> value="6">已确认未完成</option>
	         <option <c:if test="${qkfkxtcxPage.sqzt=='99'}">selected="selected"</c:if> value="99">最终完成</option>
	         <option <c:if test="${qkfkxtcxPage.sqzt=='-99'}">selected="selected"</c:if> value="-99">最终未完成</option>
	         <option <c:if test="${qkfkxtcxPage.sqzt=='A'}">selected="selected"</c:if> value="A">逾期</option>
	         </select>
	         </td>
	         </tr>
	        <tr>
	        <th>变更提出时间</th>
	         <td>
	         <input id="qssj" class="Wdate" type="text" style="width:50px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',isShowToday:true,isShowClear:true,maxDate:'#F{$dp.$D(\'jssj\')}'})" name="qssj" value="${qkfkxtcxPage.qssj}" />
	         </td>
	         </tr>
	         <tr>
	         <th>&nbsp;&nbsp;&nbsp;~</th>
	        <td>
	         <input id="jssj" class="Wdate" type="text" style="width:50px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',isShowToday:true,isShowClear:true,minDate:'#F{$dp.$D(\'qssj\')}'})" name="jssj" value="${qkfkxtcxPage.jssj}" />
	         </td>
	        </tr>
	         <tr>
	        <th>流转接收人</th>
	        <td>
	        	<select id="lzjsrdm" name="lzjsrdm"  style="width: 150px;">
            		<option value="">-请选择-</option>
            		<c:forEach var="map" items="${jsList}">
            		<option value="${map.YHDM}"<c:if test="${map.YHDM==qkfkxtcxPage.lzjsrdm}">selected="selected"</c:if>>${map.XM}</option>
            		</c:forEach>
            	</select>
	        </td>
	        </tr>
	        <tr>
	        <th>需求编号</th>
	        <td>
	        	
				<input type="text" id="sQDH" name="sqdh" value="${qkfkxtcxPage.sqdh}"/>
	        </td>
	        </tr>
	         <tr>
	        <th>变更概述</th>
	        <td>
	        	
				<input type="text" id="bggs" name="bggs" value="${qkfkxtcxPage.bggs}"/>
	        </td>
	        </tr>
	        
          </table> 
	    <div class="divider"></div>
        <div class="clr"></div>
        <div class="addlist_button pull-right mr10"> <a href="javascript:void(0);" onclick="javascript:querylike();return false;"><span>查询</span></a> </div>
	   </div>
	</div>
    </form>     
   </div>  
		
	</div>
  
    <div class="clr"></div>
    <div class="list">
      <form name="ff" method="post" id="ff" >
        <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
            <!-- <th style="text-align:center"><input type="checkbox" id="xxids" title="全选/不选"/></th> -->
            <th>需求编号</th>
            <th>项目名称</th>
            <th>变更概述</th>
            <th>申请人</th>
            <th>变更提出人</th> 
            <th>变更类型</th>
            <th>紧急程度</th>
            <th>变更提出时间</th>
            <th>要求完成时间</th>
            <th>状态</th>
            <th>流转人</th>
            <th>流转接收人</th>
            <th>操作</th>
          </tr>
          <c:forEach items="${rwlist}" var="map" varStatus="i">
 		    <tr >
	  		  
	  	
	  		  <td>${map.sqdh}</td>
			  <td>${map.xtmc}</td>
			  <td title="${uf:splitAndFilterString(map.bggs,300000)}">${uf:splitAndFilterString(map.bggs,300)}</td>
   			  <td>${map.xqrxm}</td>
   			  <td>${map.bgtcrxm}</td>
   			  <td>${map.bglxmc}</td>
   			  <td>${map.jjcdmc}</td>
   			  <td>${map.sqsj}</td>
   			  <td>${map.yqwcsj}</td>
   			  <td>${map.ztmc}</td>
   			  <td>${map.lzrmc}</td>
   			  <td>${map.lzjsrmc}</td>
   			  
   			  
   			  
   			  <td>
   			    <div class="cz_button cz2_1" title="查看" onclick="javascript:ckByID('${map.sqdh}');"></div>
              </td>
            </tr>
		  </c:forEach>
        </table>
      </form>
    </div>
    
    
    <div class="youtube">
      <c:if test="${not empty qkfkxtcxPage }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="qkfkxtcxPage" onlyOneShow="true" showListNo="true" action="qkfkxtcx/queryList"/>
      </c:if>
    </div>
    </div>       
      
    </div> 
    
    <div class="clr"></div>
 
<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"> </div>
</body>
</html>

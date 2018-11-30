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
	//查询自定义导出
	function cxjssb(){
		document.cxform.action="<%=path%>/consumerExp/queryJsExp";
		document.cxform.submit();
	}

	//导出excel
	function toExcel(id){
		$.ajax({  
	        type:'post',      
	        url:'<%=path %>/consumerExp/checkExcel?&id='+id,    
	        success:function(data){
	        	if(data==0){
	        		alert("导出模板信息维护不全，请联系管理员！");
	        	}
	        	if(data==2){
	        		alert("表或视图不存在，请联系管理员！");
	        	}
	        	if(data==1){
	        		window.location.href='<%=basePath%>consumerExp/excel?id='+id;
	        	}
	        },
	        error:function(data){
	         alert("跳转失败");
	        }  
	    });  
		
	}
	
</script>
</head>

<body>

<div class="Contentbox">
  <div class="mainbg"></div>
  <div class="pd10">
	<div class="question" title="帮助" onclick="javascript:cha('${QXB.QXDM}');"></div>
    <div class="address">当前位置：${QXB.FQXMC} >> ${QXB.QXMC}</div>
	 <div class="clr"></div>
    <form name="cxform" method="post" id="cxform" >
    	<input  type="hidden" name="jsdm" id="jsdm" value="${consumerExpJsPage.jsdm}"/>
    	<div class="butsea">
    		
	   		<table border="0" cellpadding="0" cellspacing="0" width="100%">
	           <tr>
	              
		          <td height="35px" width="80%" align="right"> 
		          	<div class="addlist_button1 ml5" style="float: right;"> <a href="javascript:void(0);" onclick="cxjssb();"><span>查&nbsp;&nbsp;询</span></a> </div>
		          	<div style="display: inline;float: right;">
			          	业务名称:&nbsp;
	            		<input style="width: 120px" type="text" name="ywmc" id="ywmc" value="${consumerExpJsPage.ywmc}" />
        			</div>
		          </td>
	          </tr>
	        </table>
		</div>
	</form>
	
	<div class="clr"></div>
	  <div class="list">
	  <form name="ff" method="post" id="ff" >
      <table width="100%" cellpadding="0" cellspacing="0" class="bot_line" style="border-collapse:collapse;text-align: center;">
        <tr>
          <th style="text-align: center;">序号</th>
          <th style="text-align: center;">业务ID</th>
          <th style="text-align: center;">业务名称</th>
          <th style="text-align: center;">表</th>
          <th style="text-align: center;">操作</th>
        </tr>
  		<c:forEach items="${consumerExpList}" var="obj" varStatus="status">
	      	<tr>
	       	  <td>
	       	  	${status.index+1 }
	       	  </td>
		 	  <td>${obj.id}</td>
		 	  <td>${obj.ywmc}</td>
		 	  <td>${obj.tablename}</td>
	          <td>	
	         	<a href="javascript:void(0);" onclick="javascript:toExcel('${obj.id }');" class="btns btn-info" title="导出">导出</a>
	          </td>
	     	</tr>
        </c:forEach>
      </table>
      </form>
    </div>
    
	 <c:if test="${not empty consumerExpJsPage && consumerExpJsPage.pageCount>1}">
		<ff:page  mhFrom="cxform" showReSize="true" listPageCount="10" field="consumerExpJsPage" onlyOneShow="true" showListNo="true" action="consumerExp/queryJsExp"/>
	 </c:if>
	 <div class="clr"></div>
  </div>
</div>

<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"></div>
</body>
</html>


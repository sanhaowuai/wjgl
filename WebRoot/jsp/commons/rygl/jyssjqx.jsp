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
<link href="<%=path%>/resources/js/treetable/stylesheets/master.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/js/treetable/stylesheets/jquery.treeTable.css" rel="stylesheet" type="text/css" />
<style type="text/css">
  html, body { height:100%; }
  .Contentbox { width:100%; min-height:100%;height:auto }
  *html .Contentbox { height:100% }
</style>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/treetable/javascripts/jquery.treeTable.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/treetable/treeTable-my.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/bootstrap.js"></script>
<script type="text/javascript">
	
	$().ready(function(){
		var jysdms = document.getElementsByName('yx_jysdm');
		var jysmcs = document.getElementsByName('yx_jysmc');
		var str = '';
		for(var i = 0; i < jysdms.length; i++){
			  str =  str + "<div class='Floatleft mb5 mr5' id='" + jysdms[i].value + "'><span class='tag'><span><input value='" + jysdms[i].value + "' type='hidden'/><input name='jysmc' type='hidden' value='" + jysmcs[i].value + "'/>" + jysmcs[i].value + "</span><a href='javascript:void(0);' onclick='onRemove(this);return false;'>X</a></span></div>";
		}
		$("#td_add").append(str);
	});
	
	function onSet(bg){
		$('#ff_ids').val($('#ff_ids').val()+$(bg).attr("id")+",");
		document.queryform.action="<%=path%>/ryjs/queryJysSjqx";
		document.queryform.submit();
	}
	
	function onRemove(bg){
		var ids = $('#ff_ids').val();
		var parent = bg.parentNode.parentNode;
		var id=$(parent).attr("id");
		$('#ff_ids').val(ids.replace(","+id+"," , ","));
		document.queryform.action="<%=path%>/ryjs/queryJysSjqx";
		document.queryform.submit();
	}
	
	function querylike(){
		document.queryform.action="<%=path%>/ryjs/queryJysSjqx";
		document.queryform.submit();
	}
	
	//添加数据权限
	function addJysSjqx(){
		
		var yhdm = $("#yhdm").val();
		var jsdm = $("#jsdm").val();
		var ids = $("#ff_ids").val();
		 document.form1.action="<%=path%>/ryjs/addJysSjqx";
		 $('#form1').ajaxSubmit(function(r){
			 parent.window.BOX_remove('qx_jys');
		 });
	}
</script>
</head>

<body>
<c:forEach items="${yxjysList}" var="obj">
  <input type="hidden" id="yx_jysdm" name="yx_jysdm" value="${obj.jysdm}" />
  <input type="hidden" id="yx_jysmc" name="yx_jysmc" value="${obj.jysmc}" />
</c:forEach>
<div class="butsea" style="margin-bottom:0;">
	 <div class="dropdown pull-right">
      <form id="queryform" name="queryform" method="post">
      <input type="hidden" name="yhdm" value="${yhdm}" id="yhdm" />
	  <input type="hidden" name="jsdm" value="${jsdm}" id="jsdm" />
	  <input type="hidden" name="deljys"  id="deljys" />
      <input type="hidden" id="ff_ids"  name="ids" value="${jysQxPage.ids == null ? ',' : jysQxPage.ids}" />
	   <div class="btn-group">
		  <button type="button" class="btn btn-search dropdown-toggle" data-toggle="dropdown">搜索 <span class="caret"></span></button>
		  <div class="dropdown-menu search-list pull-right" role="menu" style="width:260px;">
          <table border="0" width="96%"  cellpadding="0" cellspacing="0"  >
		      <tr>
		      	<th width="100">所属院：</th>
	           	<td>
	           	  <select id="xydm" name="xydm">
		       		<option value="">请选择</option>
		       		<c:forEach items="${xyList}" var="map">
		       		  <option value="${map.YXDM }" ${jysQxPage.xydm == map.YXDM ? 'selected' : '' }>${map.YXMC } </option>
		       		</c:forEach>
		       	  </select>
	           	</td>
		       </tr>
		       <tr>
		        <th>教研室名称：</th>
	           	<td><input type="text" name="dmmc" id="qf_dm" value="${jysQxPage.dmmc}"  /></td>
		      </tr>
      	</table> 
	    <div class="divider"></div>
        <div class="clr"></div>
        <div class="addlist_button pull-right mr10"> <a href="javascript:void(0);" onclick="javascript:querylike();return false;"><span>确定</span></a> </div>
	   </div>
	</div>
    </form>     
   </div> 
</div>
<div class="clr"></div>
<form name="form1" id="form1" method="post">
  <input type="hidden" name="yhdm" value="${yhdm}" id="yhdm" />
  <input type="hidden" name="jsdm" value="${jsdm}" id="jsdm" />
  <input type="hidden" id="ff_ids"  name="jysdm" value="${jysQxPage.ids == null ? ',' : jysQxPage.ids}" />
  <div id="td_add"></div>
  <div class="list01" style="border-top:none;">
  <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
    <tr>
      <th>教研室名称</th>
      <th>学院名称</th>
    </tr>
    <c:forEach items="${jysList}" var="map" varStatus="status">
   	  <tr <c:if test="${status.count % 2 eq '0'}">class="bgcol"</c:if> onclick="onSet(this);return false;" id="${map.jysdm}">
    	<td>${map.jysmc}</td>
    	<td>${map.xymc}</td>
      </tr>
    </c:forEach>
  </table>
  </div>
</form>
<div class="clr"></div>
<div class="youtube01"> 
  <c:if test="${not empty jysQxPage }">
    <ff:page mhFrom="queryform" showReSize="true" listPageCount="3" field="jysQxPage" onlyOneShow="true" showListNo="true" action="ryjs/queryJysSjqx"/>
  </c:if>
</div>
<div class="clr"></div>
<div class="mt5">
  <div class="addlist_button1" style="float:right"><a href="javascript:void(0);"  title="取消" onclick="javascript:parent.window.BOX_remove('qx_jys');" ><span>取消</span></a> </div>
  <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:void(0);" title="保存" onclick="javascript:addJysSjqx();"><span>保存</span></a> </div>
</div>
<div class="clr"></div>        
</body>
</html>

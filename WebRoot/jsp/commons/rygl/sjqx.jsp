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
<script type="text/javascript">
	$(document).ready(function(){
	   $("#zbtable").baigoCheckall();
	});
	$().ready(function(){
		treetable();
	});
	
	function expandall(){
	    var zhi=$('tr[id^=node]');
	    zhi.each(function(i,val){  
	        $(val).expand();
	    });
	}
	
	function collapseall(){
	    var zhi=$('tr[id^=node]');
	    zhi.each(function(i,val){  
	        $(val).collapse();
	    });
	}
	
	function queryLike(){
		document.form1.action="<%=path%>/ryjs/querySjqx";
		document.form1.submit();
	}
	
	//添加数据权限
	function addSjqx(){
		
		var yhdm = $("#yhdm").val();
		var jsdm = $("#jsdm").val();
		var yxdm = "";
		var check = $("[id^=checkbox_]:checked");
		$.each(check,function(key,value){
			yxdm+=$(this).val() + ",";
		})
		var url = "<%=path%>/ryjs/addSjqx";
		var zhi = {'yhdm':yhdm,'jsdm':jsdm,'yxdm':yxdm};
		$.post(url,zhi,function(result){
			if(result){
				parent.window.closeDiv('qx');
			}else{
				alert("数据权限添加失败!!");
			}
		})
	}
</script>
</head>
  
<body>
  <form name="form1" id="form1" method="post">
  	<input type="hidden" name="yhdm" value="${yhdm}" id="yhdm" />
  	<input type="hidden" name="jsdm" value="${jsdm}" id="jsdm" />
  	<input type="hidden" id="sfcjgly" value="${sessionScope.CURRENT_USER.sfcjgly}"/>
  	<table cellpadding="0" cellspacing="0" align="right">
  	  <tr>
  	    <td>院系名称：</td>
	  	<td><input type="text" name="yxmc" id="yxmc" value="${sjqxbEntity.yxmc}" /></td>
	  	<td>
		  <div class="addlist_button2" >
		    <a href="javascript:void(0);" onclick="javascript:queryLike();" title="查询" ><span>查询</span></a>
		  </div>
	  	</td>
	  </tr>
  	</table> 
  </form>
  <div class="clr"></div>
  <table width="100%"  cellpadding="0" cellspacing="0"  class="addlist mt10" style="border-collapse:collapse" id="zbtable">
	<thead>
      <tr>
        <th style="text-align:left; padding-left:5px"> <span style="padding:0px; float:left; display:block">授权部门</span>
          <a href="javascript:void(0);" onclick="javascript:expandall();return false;" class="open_but" title="展开"></a>
          <a href="javascript:void(0);" onclick="javascript:collapseall();return false;"  class="close_but" title="收起"></a>
        </th>
        <th style="padding:0px; text-align:center"  width="10%"><input type="checkbox" id="checkbox"/></th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${list}" var="list" varStatus="status">
     	<tr id="node${list.treedm}"  class=" ${status.count%2==0 ? 'bgcol':'' }  <c:choose><c:when test='${list.sjyxdm==0}'>parent</c:when><c:otherwise>child</c:otherwise></c:choose>
          <c:choose><c:when test='${list.treefdm==null}'></c:when><c:otherwise>child-of-node</c:otherwise></c:choose>${list.treefdm}" style="line-height:30px;">
          <td><span class="<c:choose><c:when test='${list.sjyxdm==0}'>folder</c:when><c:otherwise>file</c:otherwise></c:choose>">
          &nbsp;</span><span>${list.yxmc}</span>
          </td>
          <td style="text-align:center; padding:0px"><input name="checkbox" type="checkbox" id="checkbox_${list.yxdm}" value="${list.yxdm}" <c:if test='${list.checked==1}'>checked="checked"</c:if> /></td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
  <div class="clr"></div>
  <div style="margin-top:10px;">
    <div class="addlist_button1" style="float:right"><a href="javascript:void(0);"  title="取消" onclick="javascript:parent.window.closeDiv('qx');" ><span>取消</span></a> </div>
    <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:void(0);" title="保存" onclick="javascript:addSjqx();"><span>保存</span></a> </div>
  </div>
</body>
</html>

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
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.min.1.4.2.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	   $("#table_js").baigoCheckall();
	});
	//模糊查询
	function queryLike(){
		document.form1.action="<%=path%>/qxcdgl/queryRyfp";
		document.form1.submit();
	}
	
	function add(obj){
		var check = $("[id^=checkbox_]:checked");
		var jsdm="";
		var yhdm="";
		var qxdm=$("#qxdm").val();
		var fqxdm = $("#fqxdm").val();
		if($(check).length == 0){
			alert("请选择分配此角色的人员!!");
			return;
		}else{
			$.each($(check),function(key,value){
				jsdm += $(this).siblings("input[type=hidden]").val()+",";
				yhdm += $(this).val()+",";
			})
			var url = "<%=path%>/qxcdgl/addRyjsqxb";
			var zhi = {"jsdm":jsdm,"yhdm":yhdm,"qxdm":qxdm,"fqxdm":fqxdm};
			$.post(url,zhi,function(result){
				if(result){
					parent.window.closeDiv('add_ryjsqxb');
				}
			})
		}
	}
</script>
</head>
  
<body> 
  <div class="butsea"> 
 	<form name="form1" id="form1" method="post">
 	  <input type="hidden" value="${jsdmss}" name="jsdmss" />
 	  <input type="hidden" name="qxdm" value="${qxdm}" id="qxdm"/>
 	  <input type="hidden" name="fqxdm" value="${fqxdm}" id="fqxdm"/>
      <table  border="0" align="left" cellpadding="0" cellspacing="0"  >
	    <tr>
          <td height="35px">角色： </td>
          <td> 
			<select name="jsdm" id="jsdm">
			  <option value="-1" selected="selected">--请选择角色--</option>
			  <c:forEach items="${list_js}" var="list_js" >
			    <option value="${list_js.jsdm}" <c:if test='${ryjsqxPage.jsdm eq list_js.jsdm}' >selected="selected"</c:if>>
			       ${list_js.jsmc}
			    </option>
			  </c:forEach>
			</select> 
          </td>
	      <td height="35px">姓名： </td>
	      <td><input type="text" name="xm" id="xm" value="${ryjsqxPage.xm}" /></td> 
	      <td >	<div class="addlist_button1 mr15" style="float:right" >
	        <a href="javascript:void(0);" onclick="javascript:queryLike();" title="查询" ><span>查询</span></a></div>
	      </td>
	    </tr>
      </table>
    </form>
  </div>  	 

<div style=" float:left; width:100%; min-height:400px; height:auto; _height:400px">
  <table width="100%"  cellpadding="0" cellspacing="0"  class="addlist_hp mt10" style="border-collapse:collapse" id="table_js">
    <tr>
	  <th><input type="checkbox" id="checkbox" /></th>
	  <th>姓名</th>
	  <th>院系</th>
	  <th>性别</th>
	  <th>角色</th>
	</tr>
    <c:forEach items="${list_ryjsqx}" var="list" varStatus="i">
      <tr <c:if test="${i.count % 2 eq '0'}">class="bgcol"</c:if>>
   		<td><input type="checkbox" name="checkbox" id="checkbox_${list.jsdm}" value="${list.yhdm}" /><input type="hidden" value="${list.jsdm}" /></td>
   		<td>${list.xm}</td>
   		<td>${list.yx}</td>
   		<td>${list.xb}</td>
   		<td>${list.js}</td>
      </tr>
    </c:forEach>
   	<tr>
      <td colspan="5" align="center"><div class="addlist_button1" style="float:right"><a href="#"  title="取消" onclick="javascript:parent.window.closeDiv('add_ryjsqxb');" ><span>取消</span></a> </div>
      <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:void(0);" onclick="javascript:add(this);" title="确定" ><span>确定</span></a> </div></td>
    </tr>
  </table> 
  <div class="clr"></div> 
</div>
<div class="clr"></div> 
<div class="youtube"> 
  <c:if test="${not empty ryjsqxPage }">
    <ff:page mhFrom="form1" showReSize="true" listPageCount="10" field="ryjsqxPage" onlyOneShow="true" showListNo="true" action="qxcdgl/queryRyfp"/>
  </c:if>
</div>
<div class="clr"></div>
</body>
</html>

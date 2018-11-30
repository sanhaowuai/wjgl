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
<title>学校信息查询 >>信息查看</title>
<jsp:include page="../../include/css-main-include.jsp"></jsp:include>
<style type="text/css">
	html, body { height:100%; }
	.Contentbox { width:100%; min-height:100%; height:auto}
	*html .Contentbox { height:100% }
	.address{margin-top:0px}
</style>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript">
	 
function querylike(){
	document.queryform.action="<%=path%>/xxfbxx/queryXXfbck";
	document.queryform.submit();
}
 

function downLoadFj(cclj,scr,ccm,xsm){
	$("#cclj").val(cclj+"/"+scr+"/"+ccm);
	$("#xsm").val(xsm);
	document.ff.action='<%=path%>/upload/downFile';
	document.ff.submit();
}
</script>
</head>

<body>
<div class="Contentbox">
  <div class="pd10">
      <div class="address">当前位置：学校信息查询 >>信息查看</div>
      <div class="clr"></div>
 	  <h3 class="title">${xxfbEntity.xxbt }</h3>
      <div class="newsinfor">
         <span class="pl10">发布人：${xxfbEntity.fbrxm }</span> 
         <span class="pl10">部门：${xxfbEntity.fbrxymc }</span> 
         <span class="pl10">发布时间：${xxfbEntity.fbsj }</span>  
      </div> 
      <div class="newsnr">
      ${xxfbEntity.xxnr }
       </div>
      <div class="newsnr">
      附件：
   	 <c:forEach  items="${fjlist}"  var="obj">
   	 <a  href="javascript:void(0);"   onclick="javascript:downLoadFj('${obj.CCLJ}','${obj.SCR }','${obj.CCM }','${ obj.XSM}');return false;" class="blue">${obj.XSM }</a>
   	 </c:forEach>         
      </div>     
    	 <form method="post"  id="ff"  name="ff">
	   	 <input  type="hidden"   name="inputPath"     id="cclj"/>
	   	 <input  type="hidden"   name="filename"     id="xsm"/>
	   	 </form>     

  </div>
</div>

 
<div id="setting"> </div>
</body>
</html>


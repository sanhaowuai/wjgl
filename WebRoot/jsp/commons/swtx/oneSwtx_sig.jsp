<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.lang.*,java.util.*,java.text.*" %>

<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>综合设置</title>
<jsp:include page="../../include/css-main-include.jsp"></jsp:include>
<meta content="text/html; charset=utf-8" http-equiv=Content-Type />
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript">
function querylike(){
   	document.ff.action = '<%=path%>/swtx/querySwtx';
    document.ff.submit();
}
</script>
<style type="text/css">
	html, body { height:100%; }
	.Contentbox { width:100%; min-height:100%; height:auto}
	*html .Contentbox { height:100% }
	 .address{margin-top:0px}
</style>
</head>
<body id="dy" onload="whatllq();">
<div class="Contentbox">
  <div class="mainbg"></div> 
 <div class="pd10"> 
<!--    <div class="address"  id="ycid"><span class="Floatleft">当前位置: 事务提醒</span></div> -->
   <div class="clr"></div>
<!--     <div class="butsea"> -->
<!--       <table  border="0" align="left" cellpadding="0" cellspacing="0"  > -->
<!--         <tr> -->
<!--           <td height="35px"> -->
<!--             <div class="addlist_button"> <a href="javascript:void(0);" onclick="javascript:querylike();return false;"><span>返&nbsp;&nbsp;回</span></a> </div> -->
<!--           </td> -->
<!--         </tr> -->
<!--       </table> -->
<!--       </div>     -->
  
  <div class="clr"></div>
   <form name="ff" method="post" id="ff" >
   <input type="hidden" name="sfyd"  id="sfyd_id" value="${swtxPage.sfyd}"  />
	  <h3 class="title">${entity.bt} </h3>
      <div class="newsinfor">
         <span class="pl10">发送人:${entity.fsr}</span>
         <span class="pl10">发送时间:${entity.fssj}</span>
         <span class="pl10">开始结束时间:  ${entity.txkssj}---${entity.sxzzsj}</span>
<%--          <span class="pl10">发送人:${entity.fsr} </span> --%>
      </div>
   
      <div class="newsnr">
      ${entity.nr}
      </div>
    </form>
    
    <div class="clr"></div>
 </div>
 </div>
  
</body>
</html>


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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${qxb.FQXMC} >> ${qxb.QXMC}</title>
<jsp:include page="../../include/css-main-include.jsp"></jsp:include>
<style type="text/css">
  html, body { height:100%; }
  .Contentbox { width:100%; min-height:100%;height:auto }
  *html .Contentbox { height:100% }
  	.address{margin-top:0px}
</style>
<script type="text/javascript" src="<%=path%>/resources/js/ckeditor4.1.2/ckeditor.js""></script><%--富文本编辑器--%>
<script type="text/javascript" >
function querylike(){
   	document.ff.action = '<%=request.getContextPath() %>/xxgl/queryAllBmxx';
    document.ff.submit();
}
</script>
</head>
<body id="dy" onload="whatllq();">
<div class="Contentbox">
 <div class="pd10"> 
   <div id="ycid" class="address"><span class="Floatleft">当前位置：${qxb.FQXMC} >> ${qxb.QXMC}</span> </div>
   	
   <form name="ff" method="post" id="ff" >
	  <input type="hidden" name="xxid"  value="${xxfbbEntity.xxid}" />
	  <input type="hidden" name="flag" id="ff_flag" value="${flag}" />
	  <c:if test="${flag == '1'}">
		  <input type=hidden name="pageCount"  value="${bmxxcxPage.pageCount}" />
		  <input type=hidden name="pageNo1"  value="${bmxxcxPage.pageNo}" />
		  <input type=hidden name="pageSize1"  value="${bmxxcxPage.pageSize}" />
		  <input type=hidden name="sxxbt"  value="${bmxxcxPage.sxxbt}" />
		  <input type=hidden name="skssj"  value="${bmxxcxPage.skssj}" />
		  <input type=hidden name="sjssj"  value="${bmxxcxPage.sjssj}" />
		  <input type="hidden" name="sfbr"  value="${bmxxcxPage.sfbr}"/>
		  <input type="hidden" name="sfbbm"  value="${bmxxcxPage.sfbbm}"/>
	  </c:if>
	  <div id="dyDiv">
	  
	  
	  <h3 class="title">${xxfbbEntity.xxbt}</h3>
      <div class="newsinfor">
         <span class="pl10">发布人： ${xxfbbEntity.fbrxm}</span> 
         <span class="pl10">部门： ${xxfbbEntity.fbrbm}</span> 
         <span class="pl10">发布时间： ${xxfbbEntity.fbsj_xs}</span>  
      </div> 
      <div class="newsnr">
       ${xxfbbEntity.xxnr}
      </div>
      <div class="newsnr">
        <c:if test="${fn:length(fjList)>0}">
                                  附件：
       	 		<c:forEach items="${fjList}" var="obj" varStatus="i">
		          <a href="<%=path%>/bmxxgl/downloadFile?fjbh=${obj.fjid}" title="点击下载" class="blue">${obj.xsmc}</a>
		        </c:forEach>
        </c:if>	  
      </div>
      </div>
  </form>
<div class="clr"></div>
</div>
</div>
</body>
</html>


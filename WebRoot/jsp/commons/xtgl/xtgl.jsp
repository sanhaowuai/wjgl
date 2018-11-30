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
<script type="text/javascript" src="<%=path%>/resources/js/common/jquery.min.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>
<script type="text/javascript">

	function querylike(){
		document.queryform.action="<%=path%>/xtgl/queryxtgl";
		document.queryform.submit();
	}
	
	
	function addXsxt(lwid){
	  
		   	document.getElementById('lwid').value= lwid  ;
	        document.ff.action = "<%=path%>/xtgl/addXt";
	        $('#ff').ajaxSubmit(function(r){
	    		document.ff.action="<%=path%>/xtgl/queryxtgl";
	    		document.ff.submit();
	    		
	    	});
	    
	}
	

</script>
</head>

<body>


    
    <div class="clr"></div>
    <div class="butsea">
     
      <form id="queryform" name="queryform" method="post">
        <table  border="0" align="right" cellpadding="0" cellspacing="0"  >
          <tr>         
            <td >题目：</td>
            <td><input type="text" name="xtmc" id="qf_zgh" value="${xtglPage.xtmc}"  /></td>
            <td ><div class="addlist_button2"> <a href="javascript:void(0);" onclick="javascript:querylike();return false;"><span>搜&nbsp;&nbsp;索</span></a> </div></td>
          </tr>
        </table>
      </form>
    </div>
    <div class="clr"></div>
    <div class="list">
      <form name="ff" method="post" id="ff" >
		
		<input type="hidden" id="lwid" name="lwid" value="11"/>
        <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>  	 
            <th width="10%"></th>
            <th  width="35%">题目名称</th>
            <th  width="25%">教师</th>
            <th  width="15%">带学生数</th>
            <th  width="15%">已选人数</th>        
          </tr>
		  <c:forEach items="${xtlist}" var="map" varStatus="status">
        	<tr <c:if test="${status.count % 2 eq '0'}">class="bgcol"</c:if>>        	
         	 
         	  <c:choose>
      	 		<c:when test="${map.DXSS eq map.YXRS}">
             	<td style="font-weight:700;font-size:12px; line-height:24px;color:#bbb"> <span style="padding-left:30px">已满</span> </td>
      	 		</c:when>
      	
       			<c:otherwise>
             		 <td style="font-weight:700;font-size:12px; line-height:24px;"> <a href="javascript:addXsxt('${map.LWID}');"><span style="padding-left:30px">可选</span></a> </td>
       				</c:otherwise>
				</c:choose>
         	 
         	  <td>${map.LWMC}</td>
         	  <td>${map.JSXM}</td>
         	  <td>${map.DXSS}</td>
         	  <td>${map.YXRS}</td>       	 
       		</tr>
          </c:forEach>
        </table>
      </form>
    </div>

    <div class="youtube"> 
      <c:if test="${not empty xtglPage }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="xtglPage" onlyOneShow="true" showListNo="true" action="xtgl/queryxtgl"/>
      </c:if>
    </div>
    <div class="clr"></div>




<div id="setting"> </div>

</body>
</html>


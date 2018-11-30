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

	
	
	
	function delXsxt(ids,lwid){
	  
		   	document.getElementById('ids').value= ids  ;
		   	document.getElementById('lwid').value= lwid  ;
	        document.ff.action = "<%=path%>/xtgl/delXt";
	        $('#ff').ajaxSubmit(function(r){
	    		document.ff.action="<%=path%>/xtgl/queryxtgl";
	    		document.ff.submit();
	    		
	    	});
	    
	}
	

</script>
</head>

<body>

   
   
    <div class="clr"></div>
    <div class="list">
      <form name="ff" method="post" id="ff" >

		<input type="hidden" id="ids" name="ids" value="0"/>
		<input type="hidden" id="lwid" name="lwid" value="0"/>
		
        <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>  	 
            <th width="15"></th>
            <th width="65">题目名称</th>
            <th width="20">教师</th>           
          </tr>
		  <c:forEach items="${yxtlist}" var="map" varStatus="status">
        	<tr <c:if test="${status.count % 2 eq '1'}">class="bgcol"</c:if>>        	
         	 
         	 
              <td style="font-weight:700;font-size:12px; line-height:24px;"> <a href="javascript:delXsxt('${map.ID}','${map.LWID}');"><span style="padding-left:30px">退选</span></a> </td>
      	 		
         	  <td>${map.LWMC}</td>
         	  <td>${map.JSXM}</td>
         	      	 
       		</tr>
          </c:forEach>
        </table>
      </form>
    </div>

    
    <div class="clr"></div>
  



<div id="setting"> </div>
</body>
</html>


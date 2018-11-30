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
<jsp:include page="../../include/css-main-include.jsp"></jsp:include>
<style type="text/css">
	html, body { height:100%; }
	.Contentbox { width:100%; min-height:100%;height:auto }
	*html .Contentbox { height:100% }
</style>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" >
	$(document).ready(function(){
	   $("#ff").baigoCheckall();
	});
	function querylike(yxdm){		
		document.queryform.action="<%=path%>/yxgl/queryZy?yxdm="+yxdm;
		document.queryform.submit();
	}
	
	function addXyzyb(){
		document.ff.action="<%=path%>/yxgl/addXyzyb";
		$("#ff").ajaxSubmit(function(ret){
			if(ret == "success"){
				var src ="<%=path%>/jsp/commons/main/loading.jsp";
				parent.$("#SelectZYIframe").attr("src",src);
				parent.BOX_remove('SelectZy');
			}
		});
	}
</script>
</head>

<body >
  <form id="queryform" name="queryform" method="post">   
   <div class="addlist_button1" >
        <a href="javascript:void(0);" onclick="javascript:addXyzyb();return false;"><span>确&nbsp;&nbsp;定</span></a> 
    </div>
	<table align="right">
	  <tr><td>专业名称：</td>
	    <td>
	      <input type="text" id="dmmc" name="dmmc" value="${DMMC}"/>      
	    </td>	    
	    <td>
 	      <div class="addlist_button2" >
            <a href="javascript:void(0);" onclick="javascript:querylike('${YXDM}');return false;"><span>搜&nbsp;&nbsp;索</span></a>  
 	      </div>
 	     
	    </td>
	  </tr>
	</table> 
	</form>    
  <div class="clr"></div> 
  <form name="ff" method="post" id="ff" >
	<input type="hidden" name="xydm" value="${YXDM}"/>
    <table width="100%"  cellpadding="0" cellspacing="0"  class="addlist_hp mt10" style="border-collapse:collapse" id="zbtable">
	  <thead>
        <tr>
          <th><input type="checkbox" id="ids" title="全选/不选"/></th>
          <th>专业代码</th>
          <th>专业名称</th>
        </tr>
      </thead>   
      <tbody>
        <c:forEach items="${zylist}" var="map" varStatus="i">
  		  <tr <c:if test="${i.count % 2 eq '0'}">class="bgcol"</c:if>>
   		    <td><input type="checkbox" name="ids" value="${map.zydm}" <c:if test="${map.flag eq '1'}">checked="checked"</c:if>/></td>
   		    <td>${map.zydm}</td>
   		    <td>${map.zymc}</td>
 		  </tr>
 	    </c:forEach>
      </tbody>
    </table>  
  </form>   
  <div class="clr"></div>
</body>
</html>


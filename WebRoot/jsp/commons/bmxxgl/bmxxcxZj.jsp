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
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript" >
	function myrefresh(){
	 window.location.reload();
	}
	function tiaozhuan()
	{
	  setTimeout('myrefresh()',200); 
		 
	}

	//查看
	function ckByID(xxid){
		var winObj = window.open('<%=path%>/bmxxgl/bmxxcxOne?flag=1&xxid='+xxid+'&random='+Math.random()*100000,"查看信息",'height=600, width=1024, top=100, left=300, titlebar=no,toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no,z-look=yes');
		var loop = setInterval(function() {     
		    if(winObj.closed) {    
		        clearInterval(loop);    
		        window.location.reload(); 
		    }    
		}, 500); 
		//myrefresh();
	}
</script>
</head>

<body>
 <div class="pd10">
       <form name="ff" method="post" id="ff"  target="_parent">
		<input type="hidden" name="sfyd"  id="sfyd_id" value="0"  />       
        <ul class="swlist">
         <c:forEach items="${list}" var="map" varStatus="i">
          <li><span  class="text">
          <c:if test="${map.sfyd == '0'}">
	   		<a href="javascript:void(0);" onclick="javascript:ckByID('${map.xxid}');return false;"    style="font-weight:bold" >${map.xxbt}</a> 
          </c:if>
	      <c:if test="${map.sfyd != '0'}">
	   		<a href="javascript:void(0);" onclick="javascript:ckByID('${map.xxid}');return false;"    >${map.xxbt}</a> 
          </c:if>
<%--		         --%>
<%--          <c:if test="${map.sfylj eq '1'}">--%>
<%--           <a id="a_id"  target="${map.dkfs}"  onclick="javascript:tiaozhuan();" href="<%=path %>/swtx/updSee?id=${map.id}&href=${map.ljdz}" >${map.xxbt}</a>--%>
<%--          </c:if>--%>
<%--          <c:if test="${map.sfylj ne '1'}">--%>
<%--          <a  href="javascript:void(0);" title="${map.bt}"  onclick="javascript:queryById('${map.id}');">${map.xxbt}</a>--%>
<%--          </c:if>--%>
          </span><span  class="time">${map.fbsj_xs}</span> </li> 
           </c:forEach>
        </ul>
      </form>
     <div class="clr"></div>  
 </div> 
 
 
</body>
</html>


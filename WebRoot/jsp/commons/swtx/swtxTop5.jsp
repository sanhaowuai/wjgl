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
	function queryById(id)
	{
		document.ff.action="<%=path%>/swtx/querySfkck?id="+id;
		$("#ff").ajaxSubmit(function(data){
				      if(data==1)
				      {
				      	alert("该提醒已被读取");
				      }else{
				    		var winObj;
				    	    var saHeight=window.screen.availHeight;
				    	    var saWidth=window.screen.availWidth;
				    		var par = "?id="+id+"&sfyd=0";
				    		var URL="<%=path%>/swtx/queryByidSwtx_sig"+par+"&anticache="+Math.floor(Math.random()*100000);
				    	    var obj="exam";
				    	    //top.location.href=URL;
				    	    var ua = navigator.userAgent.toLowerCase();   
				    	    if(ua.match(/chrome\/([\d.]+)/)){  
				    	    	window.open(URL,obj,'dialogWidth:'+saWidth+'px;dialogHeight:'+saHeight+'px;status:no');
				    	    }else{
				    	    	window.showModalDialog(URL,obj,'dialogWidth:'+saWidth+'px;dialogHeight:'+saHeight+'px;status:no');
				    	    }				    	  
				      		myrefresh();
				     	//document.ff.action="<%=path%>/swtx/queryByidSwtx?id="+id;
						//document.ff.submit();
				      }
				      
		});
	}
	function myrefresh(){
	 window.location.reload();
	}
	function tiaozhuan()
	{
	setTimeout('myrefresh()',200); 
		 
	}
</script>
</head>

<body>
 <div class="pd10">
       <form name="ff" method="post" id="ff"  target="_parent">
		<input type="hidden" name="sfyd"  id="sfyd_id" value="0"  />       
        <ul class="swlist">
         <c:forEach items="${listswtx}" var="map" varStatus="i">
          <li><span  class="text">
          <c:if test="${map.sfylj eq '1'}">
           <a id="a_id"  target="${map.dkfs}"  onclick="javascript:tiaozhuan();" href="<%=path %>/swtx/updSee?id=${map.id}&href=${map.ljdz}" >${map.bt}</a>
          </c:if>
          <c:if test="${map.sfylj ne '1'}">
          <a  href="javascript:void(0);" title="${map.bt}"  onclick="javascript:queryById('${map.id}');">${map.bt}</a>
          </c:if>
          </span><span  class="time">${map.fssj}</span> </li> 
           </c:forEach>
        </ul>
      </form>
     <div class="clr"></div>  
 </div> 
 
 
</body>
</html>


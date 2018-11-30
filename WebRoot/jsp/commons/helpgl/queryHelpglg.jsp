<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>在线帮助</title>
    <jsp:include page="../../include/css-main-include.jsp"></jsp:include>
    
 
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js" ></script>
<link href="<%=path%>/resources/style/help/css/help.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
		//关闭本页
		function cancel(){	  		
	  		if(confirm("您确定要关闭本页吗？")){
				window.opener = null;
				window.open('', '_self');
				window.close() 
			}
		}
	
		//查询一个帮助
		function chaxun(id,v){
			$("div[id^='div']").attr('class','round round_gray');
			$(v).attr('class','round round_blue');
		 var param={"bzid":id};
			var url="<%=path%>/helpgl/queryHelpglOne";
			$.ajax({
				url:url,
				data:param,
				dataType:'json',
				type:'post',
				success:function(result){
					$('#ming').text(result.mc);
					$('#neirong').html(result.nr);
				
				}
			})
		
		}
	
	</script>
  </head>
  <body>
  <div class="help_main">
   <div class="help_con">
     <div class="help_title"><span class="p120">帮助中心</span></div>
     <div class="pall20">
       <div class="help_lc">
       	 <c:forEach items="${listbz}" var ="b" varStatus="status">
	       	 <div id="div${status.count }" class="round round_gray" onclick="javascript:chaxun('${b.bzid }',this)">
	            <div class="round_digital">${status.count }</div>
	            <div class="round_title">${b.mc }</div>
	          </div>
		 </c:forEach>
          <div class="clr"></div>
       </div>
       <h2 class="help_text" id="ming"></h2>
       <div class="help_p" id="neirong">
       </div>
     </div>
   </div>
   <div class="clr"></div>
 </div>
  </body>
</html>

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
		function chaxun(id){
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
 <div class="Contentbox">	
    <table width="100%"  cellpadding="0" cellspacing="0">
	    <tr>
	      <td valign="top"  width="210px" >
			<div id="leftmenu" class="mt10">
			<div class="lefttop">${oneqx.qxmc}</div>
			    <ul>
			    <c:forEach items="${listbz}" var ="b">
			     <li><a href="javascript:chaxun('${b.bzid }')">${b.mc }</a></li>
			    </c:forEach>
			    </ul>
			</div>	      
	      </td>
	      <td valign="top">
		<div class="Contentbox">
		  <div class="pd10">
		   <div class="butsea">
            <table  border="0" align="left" cellpadding="0" cellspacing="0"  >
                <tr>
                    <td height="35px"> 
                        <div class="addlist_button"> <a href="javascript:void(0)" onclick="javascript:cancel();"><span>关闭本页</span></a> </div>
                     </td>
                </tr>
            </table>
		   </div>
		   <div class="clr"></div>
             <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="mt10" >
             
               <tr><th><div id="ming">${yige.mc }</div></th></tr>
             
              <tr>
	              <td>
	               <div id="neirong">${yige.nr }</div>
	              </td>
              </tr>
              </table>
		   <div class="clr"></div>
		  </div>
		   <div class="clr"></div>
		</div>	
	      </td>
	    </tr>
    </table>
</div> 
  </body>
</html>

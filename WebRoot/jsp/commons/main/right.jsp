<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery/jquery-1.8.3.min.js"></script>

<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/pub/divmkmove3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/pub/jquery-jtemplates.js"></script>
<script type="text/javascript">
 $(document).ready(function(){  
    // var items=new Array();
	 $.getJSON('<%=request.getContextPath()%>/loadLayout?r='+Math.random(),function(result){
		      console.log()
		    $('.drag_p').loadmydiv( result , '<%=request.getContextPath()%>')
		    $('.drag_p').load();
	 })
	 
	 
	 
 })
 
 function bjsz(){
	 $('.butsea').show()
	 $('.drag_p').startedit()
 }
</script> 
 <style type="text/css">
	html, body { height:100%; }
	.Contentbox { width:100%; min-height:100%;height:auto }
	*html .Contentbox { height:100% }
</style>
</head>
<body> 
 <div class="Contentbox">
     <div class="butsea" style="display: none;padding-left:42px">
      <table  border="0" align="left" cellpadding="0" cellspacing="0" class="bjbutton"  >
        <tr>
          <td height="35px"> 
			 <a class="btns btn-info" href="javascript:void(0);" onclick="$('.drag_p').saveLayout('<%=request.getContextPath() %>/saveLayout')">保存布局</a>&nbsp;&nbsp;
			 <a class="btns btn-info" href="javascript:void(0);"  onclick="$('.drag_p').createDiv('<%=request.getContextPath()%>/querykyzj')">添加组件</a>
          </td>
        </tr>
      </table>
      </div>
      <div class="clr"></div>
      <div  class="drag_p"  style="    bottom:0px  " > </div>
      <div class="clr"></div>
 </div>
</body>
</html>


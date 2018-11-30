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
	 $.getJSON('<%=request.getContextPath()%>/loadLayout/${jsdm}?r='+Math.random(),function(result){
		      console.log()
		    $('.drag_p').loadmydiv( result , '<%=request.getContextPath()%>')
		    $('.drag_p').load();
	 })
	 
	 
	 
 })
 
 function bjsz(){
	 $('#editbj').show()
	 $('.drag_p').startedit()
 }
</script> 
 <style type="text/css">
	html, body { height:100%; }
	.Contentbox { width:100%; min-height:100%;height:auto }
	*html .Contentbox { height:100% }

/*编辑布局*/
#editbj{ bottom: 50px;  position: fixed;  right: 26px;  z-index: 100;}
.edit_bg{background: #5bc0de  }
.save_bg{background: #5bc0de }
.editbj>i{color:#fff;}
.editbj{color: #ffffff; display: block; height: 40px;padding: 4px 0px; text-align: center; width:40px;position:relative;border-radius:2px;font-size:20px}
a.editbj{color: #ffffff;}
a.editbj:visited{color: #ffffff;}
a.editbj:focus{color: #ffffff;}
a.editbj:hover{color:#fff;background:#5bc0de ;}

.editbj-icon{width:100%;font-size:20px; line-height:40px; text-align:center;}
.editbj-txt{display: table;position:absolute; left:0; top:0;font-size:12px;padding:0 3px;background: #5bc0de ;color:#fff;width:100%;height:40px;overflow: hidden;text-align: center;/*text-overflow: ellipsis;white-space: nowrap;*/
border-radius:2px;}
.editbj-txt span{display: table-cell; vertical-align: middle; height:34px;text-align:center;width:100%;}

.editbj{
    -webkit-perspective: 1000;
    -moz-perspective: 1000;
    -ms-perspective: 1000;
    perspective: 1000;

    -ms-transform: perspective(1000px);
    -moz-transform: perspective(1000px);
    -moz-transform-style: preserve-3d; 
    -ms-transform-style: preserve-3d; 
	transition: 0.6s;
}

.editbj:hover .editbj-txt{
    -webkit-transform: rotateY(0deg);
    -moz-transform: rotateY(0deg);
    -o-transform: rotateY(0deg);
    -ms-transform: rotateY(0deg);
    transform: rotateY(0deg);
}

.editbj:hover .editbj-icon{
    -webkit-transform: rotateY(180deg);
    -moz-transform: rotateY(180deg);
    -o-transform: rotateY(180deg);
    transform: rotateY(180deg);
}

.editbj{
-webkit-transition: 0.6s;
-webkit-transform-style: preserve-3d;
-ms-transition: 0.6s;
-moz-transition: 0.6s;
-moz-transform: perspective(1000px);
-moz-transform-style: preserve-3d;
-ms-transform-style: preserve-3d;
transition: 0.6s;
transform-style: preserve-3d;
position: relative;
}

.editbj-icon, .editbj-txt {
-webkit-backface-visibility: hidden;
-moz-backface-visibility: hidden;
-ms-backface-visibility: hidden;
backface-visibility: hidden;
-webkit-transition: 0.6s;
-webkit-transform-style: preserve-3d;
-moz-transition: 0.6s;
-moz-transform-style: preserve-3d;
-o-transition: 0.6s;
-o-transform-style: preserve-3d;
-ms-transition: 0.6s;
-ms-transform-style: preserve-3d;
transition: 0.6s;
transform-style: preserve-3d;
position: absolute;
top: 0;
left: 0;
}



.editbj-icon {
-webkit-transform: rotateY(0deg);
-ms-transform: rotateY(0deg);
z-index: 2;
padding:10px 0px
}

.editbj-txt {
-webkit-transform: rotateY(-180deg);
-moz-transform: rotateY(-180deg);
-o-transform: rotateY(-180deg);
-ms-transform: rotateY(-180deg);
transform: rotateY(-180deg);
}
 
	
	
</style>
</head>
<body> 
 <div class="Contentbox">
<!--      <div class="butsea" style="display: none;padding-left:42px"> -->
<!--       <table  border="0" align="left" cellpadding="0" cellspacing="0" class="bjbutton"  > -->
<!--         <tr> -->
<!--           <td height="35px">  -->
<%-- 			 <a class="btns btn-info" href="javascript:void(0);" onclick="$('.drag_p').saveLayout('<%=request.getContextPath() %>/saveLayout/${jsdm}')">保存布局</a>&nbsp;&nbsp; --%>
<%-- 			 <a class="btns btn-info" href="javascript:void(0);"  onclick="$('.drag_p').createDiv('<%=request.getContextPath()%>/querykyzj/${jsdm}')">添加组件</a> --%>
<!--           </td> -->
<!--         </tr> -->
<!--       </table> -->
<!--       </div> -->
      <div class="clr"></div>
      <div  class="drag_p"  style="    bottom:0px  " > </div>
      <div class="clr"></div>
 </div>
 
<div id="editbj" style="display:none">
       <a href="javascript:void(0);"  onclick="$('.drag_p').createDiv('<%=request.getContextPath()%>/querykyzj/${jsdm}')"   class="editbj save_bg mb2">
         <div class="editbj-icon"><i class="fa fa fa-plus"></i></div>
         <div class="editbj-txt"><span>添加组件</span></div>
       </a>
       <a href="#"  class="editbj save_bg"  onclick="$('.drag_p').saveLayout('<%=request.getContextPath() %>/saveLayout/${jsdm}')">
         <div class="editbj-icon"><i class="fa fa-save"></i></div>
         <div class="editbj-txt" ><span>保存布局</span></div>
       </a>
 
</div>  
 
 
 
</body>
</html>


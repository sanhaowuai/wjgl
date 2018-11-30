<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    
<title>umeditor</title>

<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=path%>/resources/js/umeditor/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=path%>/resources/js/umeditor/umeditor.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/js/umeditor/themes/default/css/umeditor.min.css"/> 
  
  <script type="text/javascript">
	$().ready(function(){
	 	UM.getEditor('myEditor', {initialFrameHeight:450 });
	});
</script>
  
   </head>
  <body>
		<table  width="60%" cellpadding="0" cellspacing="0"  class="pop_table" style="border-collapse:collapse">
        <tr>
          <td>
  					使用方法与ueditor相同
             		 具体详细<a href="http://ueditor.baidu.com/website/umeditor.html">http://ueditor.baidu.com/website/umeditor.html</a>中查看

          </td>
        </tr>
        <tr>
          <td>
            <div>
             <script type="text/plain"  id="myEditor"  style="width:100%"> </script>		
            </div>
          </td>
        </tr>
		</table>
  </body>
</html>

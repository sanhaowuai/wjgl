<%@ page contentType="text/html; charset=utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>上传</title>
<meta content="text/html; charset=utf-8" http-equiv=Content-Type />
<base target="_self" />
<script type="text/javascript">
<!--
$().ready(function(){
	$("#FormMain").validate();
});
//-->
</script>

</head>
<body style="min-width: 400px; height: 160px;">

<form name="FormMain" id="FormMain" method="post" action="ckeditor_done.jsp" enctype="multipart/form-data">

<table border="0" style="width: 360px; margin-top: 20px; font-size: 12px;" align="center" cellpadding=0 cellspacing=0>
  <tr>
    <td style="height: 60px; line-height: 60px;">图片：<input type="file" style="width:200px" name="filename" id="filename" class={required:true,accept:'jpg|jpeg|gif|bmp|png'} /></td>
  </tr>
  <tr>
    <td style="height: 40px; line-height: 40px;">小于2M的.jpg .jpeg .gif .png .bmp文件。</td>
  </tr>
  <tr>
    <td style="height: 40px; line-height: 40px; text-align: center;"><input type="submit" value=" 上 传 " class="PopButton" /></td>
  </tr>
</table>

</form>

</body></html>

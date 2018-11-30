<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    
<title>ueditor</title>

<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=path%>/resources/js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=path%>/resources/js/ueditor/ueditor.all.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/js/ueditor/themes/default/css/ueditor.css"/>
  
  <script type="text/javascript">
	$().ready(function(){
	 	UE.getEditor('myEditor');
	});
</script>
  
   </head>
  <body>
		<table  width="60%" cellpadding="0" cellspacing="0"  class="pop_table" style="border-collapse:collapse">
        <tr>
          <td>
            		<p>ueditor中的属性name为传值所用</p>
                  	<p>使用editor.getContent()方法可以获得编辑器的内容</p>
             		<p>使用editor.getContentTxt()方法可以获得编辑器的纯文本内容</p>
             		<p>使用editor.hasContents()方法判断编辑器里是否有内容</p>
             		<p>具体详细<a href="http://ueditor.baidu.com/website/onlinedemo.html">http://ueditor.baidu.com/website/onlinedemo.html</a>中查看</p>
          </td>
        </tr>
        <tr>
          <td>
            <div>
             <script type="text/plain"  id="myEditor" name="" style="width:100%"> </script>		
            </div>
          </td>
        </tr>
		</table>
  </body>
</html>

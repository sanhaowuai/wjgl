<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    
<title>ckeditor</title>
    
<jsp:include page="ckeditor.include.jsp" />
  </head>
  
  <body>
  
  <!-- 修改时弹出，为文本框赋值的语句 -->
  <!-- CKEDITOR.instances.editor1.setData("这里是显示的数据"); -->
  <!-- 添加时弹出，清空文本框的语句 -->
  <!-- CKEDITOR.instances.editor1.setData(""); -->
  
  
   	 
		<table id="divKslb" width="60%" cellpadding="0" cellspacing="0"  class="pop_table" style="border-collapse:collapse">
        <tr>
          <td>
            <div>
              <textarea class="ckeditor" id="editor1" name="blnr"></textarea>
              <script>
              	CKEDITOR.replace('editor1',{toolbar : 'Full'});
              </script>
            </div>
          </td>
        </tr>
		</table>
  </body>
</html>

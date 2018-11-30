<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String mes = (String)request.getAttribute("message");
if(mes == null || mes.trim().equals("")){
	mes = "";
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
    <title>演示事务回滚</title>
  </head>
  
  <body>
   下列将演示事务怎么捕获到异常之后，回滚事务. <br>
   
   演示说明：提交表单到controller后，将当前表单值插入到TEST_DMWH_1中，并且将表单中的值也插入到TEST_DMWH_2中，在插入TEST_DMWH_2时，抛出异常，事务将回滚<br>
   <div><%= mes %></div>
   <% 
   	mes = "";
   %>
   <form action="<%=path%>/demo/transactionDemo" method="post">
   	代码：<input type="text" name="dm"/><br>
   	名称：<input type="text" name="mc"/><br>
   	<input type="submit"/>
   </form>
   
  </body>
</html>

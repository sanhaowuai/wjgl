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
<script type="text/javascript">

function changeSrc(srcRight){
	var i1 = parent.window.frames['iframename'];   
	//alert(i1.html);
	i1.location.href=srcRight;
}

</script>
</head>
<body>
     <div class="mainNav">
        <!-- <div class="user">
            <a title="" class="leftUserDrop"><img src="images/left05/user.png" alt="" /><span><strong>3</strong></span></a><span>栏目名称</span> 
        </div> -->
        <!-- Main nav -->
        <ul class="navleft05">
            <li><a href="#" title="" class="active"  onclick="changeSrc('right_教师管理.html')"><img src="images/left05/people.png" alt="" /><span>教师管理</span></a></li>
            <li><a href="#" title=""  onclick="changeSrc('right_学生管理.html')"><img src="images/left05/ui.png" alt="" /><span>学生管理</span></a> </li>
            <li><a href="#" title=""  onclick="changeSrc('right_学院管理.html')"><img src="images/left05/forms.png" alt="" /><span>学院管理</span></a> </li>
            <li><a href="#" title=""  onclick="changeSrc('right_专业管理.html')"><img src="images/left05/text.png" alt="" /><span>专业管理</span></a></li>
            <li><a href="#" title="" onclick="changeSrc('right_角色管理.html')"><img src="images/left05/statistics.png" alt="" /><span>角色管理</span></a></li>
            <li><a href="#" title=""  onclick="changeSrc('right_权限（菜单）管理.html')"><img src="images/left05/tables.png" alt="" /><span>权限（菜单）管理</span></a></li>
            <li><a href="#" title=""  onclick="changeSrc('right_页面权限管理.html')"><img src="images/left05/qx.png" alt="" /><span>页面权限管理</span></a> </li>
            <li><a href="#" title=""  onclick="changeSrc('right_人员管理.html')"><img src="images/left05/dashboard.png" alt="" /><span>人员管理</span></a> </li>
        </ul>
    </div>
</body>
</html>


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
<!--[if IE 6]><script src="<%=path%>/resources/js/common/DD_belatedPNG.js" type="text/javascript"></script><![endif]-->
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script src="<%=path%>/resources/js/common/task/jquery.min.1.4.2.js" type="text/javascript"></script>
<script src="<%=path%>/resources/js/common/task/jquery.plugins.js" type="text/javascript"></script>
<script src="<%=path%>/resources/js/common/task/index_02.js" type="text/javascript"></script>
<script src="<%=path%>/resources/js/common/menu/texthover.js"></script>
<script  type="text/javascript">
var status = 1;
function switchSysBar(){
     if (1 == window.status){
		  window.status = 0;
          switchPoint.innerHTML = '<a class="right_but pngFix"></a>';
          document.getElementById("frmTitle").style.display="none";
		  document.getElementById("main09_right").style.margin="0px 0px 0px 10px"
     }
     else{
		  window.status = 1;
          switchPoint.innerHTML = '<a class="left_but pngFix"></a>';
          document.getElementById("frmTitle").style.display="";
		  document.getElementById("main09_right").style.margin="0px 0px 0px 111px"
     }
}
</script>
</head>
<body style="height:100%;overflow-y:hidden; zoom:1;min-width:1260px;_width:1260px; width:auto">
<!--头部加导航-->
<div class="top" style="display: block;" id="north">
  <div class="logo"></div>
  <div class="top_right">
    <div id="taskbar_right">
      <div id="site-nav">
        <div class="switch">
          <div class="photo"> <a id="role" title="角色" href="#" class="pngFix"></a> </div>
          <div class="switch-bd" >
            <div class="switch_arrow pngFix"></div>
            <ul>
              <li><p class="Floatleft">教师</p> <span></span></li>
              <li><p class="Floatleft">管理员</p></li>
              <li><p class="Floatleft">院长</p></li>
              <li><p class="Floatleft">学生</p></li>
            </ul>
          </div>
        </div>
      </div>
      <a id="person_info" class="pngFix" title="主页" href="#" ></a> 
<%--      <a id="person_info2" title="刷新" href="#"></a> --%>
      <a id="shortcut" class="pngFix" title="个人信息" href="#"></a> 
      <a id="logout" class="pngFix" title="注销登录" href="#"></a> 
      </div>
    <div class="welcome"  >欢迎您，赢科！</div>
  </div>
</div> 
<div class="clr"></div>
 
<div id="tabs_portal_0_panel">
  <div class="main05_left"  name="fmTitle" id="frmTitle">
    <iframe id="iframename0" name="iframename0" src="left_03.html" border="0" framespacing="0" marginheight="0" 
marginwidth="0" style="width: 100px; height: 100%;" frameborder="0" allowTransparency="true"></iframe>
  </div>
  <div class="main_center" onclick="switchSysBar()"> <span class=navPoint id=switchPoint title=关闭/打开左栏><a class="left_but pngFix"></a></span> </div>
  <div class="main05_right"  id="main09_right">
    <iframe id="iframename" name="iframename" src="right.html" 
border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%; height: 100%;" frameborder="0" allowTransparency="true"></iframe>
  </div>
   <div class="clr"></div>
</div>
</body>
</html>


<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<style type="text/css">
  html, body { height:100%; }
  .Contentbox { width:100%; min-height:100%;height:auto }
  *html .Contentbox { height:100% }
</style>
<script src="<%=path%>/resources/js/common/task/jquery.min.1.4.2.js" type="text/javascript"></script>
<script src="<%=path%>/resources/js/common/task/jquery.plugins.js" type="text/javascript"></script>
<script src="<%=path%>/resources/js/common/index.js" type="text/javascript"></script>
<script type="text/javascript">
	
	//使用部门分配
	function openTabs(url){
		document.getElementById("iframename").src= url;
	}
</script>
</head>

<body style="height:100%;overflow:hidden;">
  <div class="Contentbox">
    <div class="mainbg"></div>
    <div class="pd10">   
      <div class="address">当前位置：论文管理 >> 学生选题</div>
      <div class="clr"></div> 
      <div id="taskbar_center">
        <div id="tabs_left_scroll"></div>
        <div id="tabs_container"> 
		  <div class="Menubox">
            <ul>
              <li class="hover"><a href="javascript:void(0);" onclick="javascript:openTabs('<%=path%>/xtgl/queryxtgl');return false;">可选题目</a></li>
              <li><a href="javascript:void(0);" onclick="javascript:openTabs('<%=path%>/xtgl/querychoosextgl');return false;">已选题目</a></li>          
            </ul>
          </div> 
        </div>
        <div  id="tabs_right_scroll"></div>
      </div>
      <div class="clr"></div>
	  <iframe id="iframename" name="iframename" src="<%=path%>/xtgl/queryxtgl" border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%; height: 471px;" frameborder="0" allowTransparency="true"></iframe>
	  <div class="clr"></div>
    </div>
    <div class="clr"></div>
  </div>
</body>
</html>


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
<script type="text/javascript" src="<%=path%>/resources/js/common/tab.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript">
	
	//使用部门分配
	function openTabs(url){
		document.getElementById("iframename").src= url;
	}
	
	$(function () {
    	$(".Menubox ul li").click(function () {
		//  alert("debug");
        $(this).addClass("hover").siblings().removeClass("hover");
                });
    });
</script>
</head>

<body style="height:100%;overflow:hidden;">
  <div class="Contentbox">
    <div class="mainbg"></div>
    <div class="pd10">   
   	  <div class="question" title="帮助" onclick="javascript:cha('${QXB.QXDM}');"></div>    
      <div class="address">当前位置：${QXB.FQXMC} >> ${QXB.QXMC}</div>
      <div class="clr"></div> 
      <div id="taskbar_center">
        <div id="tabs_left_scroll"></div>
        <div id="tabs_container"> 
		  <div class="Menubox">
            <ul>
              <li class="hover"><a href="javascript:void(0);" onclick="javascript:openTabs('<%=path%>/zylbgl/queryZylbgl');return false;">专业类别</a></li>
              <li><a href="javascript:void(0);" onclick="javascript:openTabs('<%=path%>/rxlxgl/queryRxlxgl');return false;">入校类型</a></li>
              <li><a href="javascript:void(0);" onclick="javascript:openTabs('<%=path%>/dqgl/queryDqgl');return false;">地区</a></li>
              <li><a href="javascript:void(0);" onclick="javascript:openTabs('<%=path%>/cdlbgl/queryCdlbgl');return false;">场地类别</a></li>
              <li><a href="javascript:void(0);" onclick="javascript:openTabs('<%=path%>/xnxqgl/queryXnxqgl');return false;">学年学期</a></li>
              <li><a href="javascript:void(0);" onclick="javascript:openTabs('<%=path%>/gwlxgl/queryGwlxgl');return false;">岗位类型</a></li>
              <li><a href="javascript:void(0);" onclick="javascript:openTabs('<%=path%>/gwgl/queryGwgl');return false;">岗位</a></li>
              <li><a href="javascript:void(0);" onclick="javascript:openTabs('<%=path%>/njgl/queryNjgl');return false;">年级</a></li>
              <li><a href="javascript:void(0);" onclick="javascript:openTabs('<%=path%>/jxcdgl/queryJxcdgl');return false;">教学场地</a></li>
              <li><a href="javascript:void(0);" onclick="javascript:openTabs('<%=path%>/jxlgl/queryJxlgl');return false;">教学楼</a></li>
              <li><a href="javascript:void(0);" onclick="javascript:openTabs('<%=path%>/jyslxgl/queryJyslxgl');return false;">教研室类型</a></li>
              <li><a href="javascript:void(0);" onclick="javascript:openTabs('<%=path%>/jysgl/queryJysgl');return false;">教研室</a></li>
              <li><a href="javascript:void(0);" onclick="javascript:openTabs('<%=path%>/xiaoqugl/queryXiaoqugl');return false;" >校区</a></li>
              <li><a href="javascript:void(0);" onclick="javascript:openTabs('<%=path%>/klgl/queryKlgl');return false;" >科类</a></li>
            </ul>
          </div> 
        </div>
        <div  id="tabs_right_scroll"></div>
      </div>
      <div class="clr"></div>
	  <iframe id="iframename" name="iframename" src="<%=path%>/zylbgl/queryZylbgl" border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%; height: 471px;" frameborder="0" allowTransparency="true"></iframe>
	  <div class="clr"></div>
    </div>
    <div class="clr"></div>
  </div>
<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>  
</body>
</html>


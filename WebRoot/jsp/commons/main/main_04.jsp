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
<!--[if IE 6]><script src="<%=path%>/resources/js/common/DD_belatedPNG.js" type="text/javascript"></script><![endif]-->
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script src="<%=path%>/resources/js/common/task/jquery.min.1.4.2.js" type="text/javascript"></script>
<script src="<%=path%>/resources/js/common/task/jquery.plugins.js" type="text/javascript"></script>
<script src="<%=path%>/resources/js/common/task/index.js" type="text/javascript"></script>
<script src="<%=path%>/resources/js/common/menu/texthover.js" type="text/javascript"></script>
<script src="<%=path%>/resources/js/common/menu/jquery-1.9.0.min.js" type="text/javascript"></script>
<script src="<%=path%>/resources/js/common/menu/main08.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js"></script>
<script type="text/javascript">
//切换角色
function qhjsLogin(jsdm){
	if($("#dljs").val() == jsdm){
		return;
	}else{
		$("#jsdm").val(jsdm);
		document.queryform.action = "<%=path%>/login";
	    document.queryform.submit();
	}
}

//返回主页
function getReturn(){
	//location.href="<%=path%>/getReturn";
	window.location.href=window.location.href;
}

//注销
function logout(){
	if(confirm("您好，确认要退出吗？")){
		window.parent.frames.location="<%=path%>/logout";
	}
}

//修改密码
function updMm(){
if(Validator.Validate(document.getElementById('divFrom'),3)){
	var mm1 = $("#mm1").val();
	var mm2 = $("#mm2").val();
	var mm3 = $("#mm").val();
	if(null == mm2 || "" == mm2 || null == mm3 || "" == mm3){
		alert("必填项!必须填写!");
		return;
	}
	if(mm2.length <6){
		alert("密码长度为6-25个字符！");
		return;
	}
	if(mm3 != mm2){
		alert("新密码两次输入不一致！");
		return;
	}
	var v = /^[a-z0-9A-Z_]+$/i;
	if(!v.test(mm3)){
		alert("密码只能由数字，字母，下划线组成！");
		return;
	}
	var url="<%=path%>/getDlbToMm";
    var param={'ysmm':mm1};
    $.post(url,param,function(result){
        if(result == 1){
        	document.divFrom.action = "<%=path%>/updMm";
    	    document.divFrom.submit();
	    }else{
		    alert("原始密码错误！");
		    return;
		}
    },'json')
    }
}
</script>
</head>
<body style="height:100%;overflow-y:hidden; zoom:1;min-width:1260px;_width:1260px; width:auto">
<form name="queryform" id="queryform" method="post">
	<input type="hidden" name="usercode" value="${sessionScope.CURRENT_USER.yhdm}"/>
	<input type="hidden" name="password" value="${sessionScope.CURRENT_USER.mm}"/>
	<input type="hidden" id="dljs" value="${sessionScope.CURRENT_USER.jsdm}"/>
	<input type="hidden" name="jsdm" id="jsdm" value=""/>
</form>
<!--头部加导航-->
<div class="top" style="display: block;" id="north">
<div class="topbg">
	<div class="logo">后台管理系统</div>
	<div class="top_right">
    	<div id="taskbar_right">
			<div id="site-nav">
				<div class="switch">
	          		<div class="photo"> <a class="pngFix" id="role" title="角色" href="#"></a> </div>
						<div class="switch-bd" >
		           			<div class="switch_arrow pngFix"></div>
								<ul>
									<c:forEach items="${jsbList}" var="map" varStatus="i">
										<li onclick="javascript:qhjsLogin('${map.jsdm}');">
											<p class="Floatleft">${map.jsmc}</p>
											<c:if test="${sessionScope.CURRENT_USER.jsdm eq map.jsdm}"><span></span></c:if>
										</li>
									</c:forEach>
								</ul>
		          			</div>
	        			</div>
	      			</div>
					<a id="person_info" class="pngFix" title="主页" href="javascript:getReturn()";></a>
					<a id="shortcut" class="pngFix" title="修改密码" href="javascript:BOX_show('updMm');"></a> 
					<a id="logout" class="pngFix" title="注销登录" href="javascript:logout();"></a> 
				</div>
				<div class="welcome">欢迎您，${sessionScope.CURRENT_USER.xm}！</div>
			</div>
		</div> 
		</div>
<div class="clr"></div>

<div class="top-nav">
	<div id="navList" class="navlist-wrap">
	<div id="menubar_right" ><a id="hide_topbar" title="隐藏顶部" href="#"  ></a> </div>
	    <div id="taskbar_center">
	        <div id="tabs_left_scroll"></div>
	        <div id="tabs_container"> 
		  		<div class="navlist ">
				<c:forEach items="${orderListFather}" var="fmap" varStatus="i">
					<a href="javascript:void(0);" class="nav-btn" id="menu_${i.count}"><span>${fmap.QXMC}</span><div></div></a> 
	            </c:forEach>
			    </div>
	        </div>
	        <div id="tabs_right_scroll"></div>
       </div> 
	</div> 
	<div class="clr"></div> 
	
	<div id="expandZone" class="expand active">
		<div class="download">
			<c:forEach items="${orderListFather}" var="fmap" varStatus="i">
				<div class="item" id="menu_${i.count}">
					<div class="download-list"> 
						<c:forEach items="${orderList}" var="zmap">
							<c:if test="${fmap.QXDM eq zmap.FQXDM}">
								<a href="<%=path%>/${zmap.FWLJ}" class="btn wdj" target="iframename"><span class="icon pngFix"></span><span class="text">${zmap.QXMC}</span></a>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</c:forEach>
			<div id="closeBtn"  class="close-btn pngFix"></div> 
		</div>
	</div>

</div> 
<!--头部加导航-->
 
<div id="tabs_portal_0_panel" >  
	<div class="main05">
		<iframe id="iframename" name="iframename" src="<%=path%>/jsp/commons/main/right.jsp" border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%; height: 100%;" frameborder="0" allowTransparency="true"></iframe> 
		<div class="clr"></div>
	</div>
    <div class="clr"></div>
</div>
 
<!-- 修改密码 -->
<div id="updMm" style="display:none; width: 400px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
<form name="divFrom" id="divFrom" method="post">
    <div class="popup">
        <div class="Floatleft Pct100 mb10">
            <div class="popup_left">修改密码</div>
            <a href="#" class="btn_close" onclick="javascript:BOX_remove('updMm');"></a> </div>
        <div class="clr"></div>
        <table id="divtab" width="100%" cellpadding="0" cellspacing="0" class="addlist" style="border-collapse:collapse">
        	<tr>
                <th>原始密码：</th>
                <td align="left"><input type="password" name="mm1" id="mm1" maxlength="50"/><span class="red">*长度6-50个字符</span></td>
            </tr>
            <tr>
                <th>新密码：</th>
                <td align="left"><input type="password" name="mm" id="mm" maxlength="50"/><span class="red">*长度6-50个字符</span></td>
            </tr>
            <tr>
                <th>再次输入新密码：</th>
                <td align="left"><input type="password" name="mm2" id="mm2" maxlength="50"/><span class="red">*长度6-50个字符</span></td>
            </tr>             
            <tr>
                <td colspan="2" >
	                <div class="addlist_button1" style="float:right"><a href="javascript:BOX_remove('updMm');" title="取消" ><span>取消</span></a> </div>
	                <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:updMm();" title="保存" ><span>保存</span></a></div>
                </td>
            </tr>
        </table>
        <div class="clr"></div>
    </div>
</form>
</div>

<div id="setting"> </div>
</body>
</html>


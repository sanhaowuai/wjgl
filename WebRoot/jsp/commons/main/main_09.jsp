<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9;IE=8;"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${applicationScope.XT_CSB_TITLE.CS1}</title>
<jsp:include page="../../include/css-main-include.jsp"></jsp:include>
<!--[if IE 6]><script src="<%=path%>/resources/js/common/DD_belatedPNG.js" type="text/javascript"></script><![endif]-->
<script src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<%-- <script src="<%=path%>/resources/js/common/task/index_02.js" type="text/javascript"></script>  --%>
<script src="<%=path%>/resources/js/common/task/jquery.min.1.4.2.js" type="text/javascript"></script>
<script src="<%=path%>/resources/js/common/task/jquery.plugins.js" type="text/javascript"></script>
<%--<script src="<%=path%>/resources/js/common/task/index_12.js?asa=127" type="text/javascript"></script> --%>

<%--针对不同页面风格需要引用不同的JS文件  start--%>
<script src="<%=path%>/resources/style/touming/js/bottomMenuTwo.js"></script>
<script src="<%=path%>/resources/style/touming/js/index_13.js?asa=127" type="text/javascript"></script> 
<%--针对不同页面风格需要引用不同的JS文件  end--%>

<script src="<%=path%>/resources/js/common/menu/texthover.js"></script>
<%--<script src="<%=path%>/resources/js/bottomMenu.js"></script>--%>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>

<script>  
 var curWwwPath = window.document.location.href;
 var pathName = window.document.location.pathname;
 var pos = curWwwPath.indexOf(pathName);
 var localhostPaht = curWwwPath.substring(0, pos);
 var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
 var path = localhostPaht + projectName; 
	$(document).ready(function(){
	 			document.queryform.action = "<%=path%>/xxtc/querySfxt";
		        $('#queryform').ajaxSubmit(function(r){
				        if(r!="")
				        {
					        var url="<%=path%>/xxtc/queryOneXxtc";
				   			var param={'Xxtcdm':r};
						      $.post(url,param,function(ru){
							        iframe_divTc(ru.fwlj,ru.ms,ru.nww,ru.id,ru.sfwzms);
					       	  },'json')
				        }
		    	});
	});
function toShow(id){  
	  var tTop = $('#'+id).offset().top;
	  var tLeft = $('#'+id).offset().left; 
    var divid=document.getElementById(id+"_a"); 
	  var tWidth = $('#'+id+"_a").width(); 
	  
		divid.style.display='block';   
		divid.style.left=tLeft+"px"; 
		divid.style.marginLeft=-tWidth*0.5+14+"px";  
		divid.style.top=tTop+28+"px"; 
	}
	
	function toHidden(id){  
   var divid=document.getElementById(id+"_a"); 
	divid.style.display='none'; 
	divid.style.left=0; 
	divid.style.marginLeft=0;  
	divid.style.top=0; 	  
	}

</script>
<script type="text/javascript">
//left收缩
var status = 1;
var left_b=0
var isHidden = 0;
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


function zybjsz(){
// 	alert($('#center').find('iframe:visible').size())
// 	alert($('#center').find('iframe:visible').eq(0))
// 	alert($('#center').find('iframe:visible').eq(1))
	window.frames[$('#center').find('iframe:visible').attr('id')].bjsz()
	
}


$(function(){
	var heighta = $(window).height();
	$('#iframename0').height(heighta-105);
	$(window).resize(function (){
		var heighta = $(window).height();
		$('#iframename0').height(heighta-105);
	});

	
	var widths = $(window).width();
	$('#taskbar_center').width(widths-270);
	$('#tabs_container').width(widths-320);
	$(window).resize(function (){
		widths = $(window).width();
		if(isHidden == 0){
			$('#taskbar_center').width(widths-270);
			$('#tabs_container').width(widths-320);
		}else{
			$('#taskbar_center').width(widths-50);
			$('#tabs_container').width(widths-100);
		}
	});
	//点击收缩展开左侧
	
	$('#toggle').click(function(){
		if(isHidden == 0){//缩小
			isHidden = 1;
			$('#frmTitle').animate({"width":"50px","padding-left":"0"},100);
			$('#main_right').animate({"margin-left":"50px"},100);
			$('.title-menu-left').find('span').hide();
			$('.title-menu-left').find('i').css({"left":"-12px"});
			iframename0.window.spanHide();
			$('#taskbar_center').width(widths-50);
			$('#tabs_container').width(widths-100);
			loadkjcd();
			$(window).resize(function (){
				widths = $(window).width();
				$('#taskbar_center').width(widths-50);
				$('#tabs_container').width(widths-100);
				loadkjcd();
			});
		}else{//宽的
			isHidden = 0;
			$('#frmTitle').animate({"width":"240px","padding-left":"0"},100);
			$('#main_right').animate({"margin-left":"250px"},100);
			$('.title-menu-left').find('span').show();
			$('.title-menu-left').find('i').css({"left":"-8px"});
			iframename0.window.spanShow();
			$('#taskbar_center').width(widths-270);
			$('#tabs_container').width(widths-320);
			loadkjcd();
			$(window).resize(function (){
				widths = $(window).width();
				$('#taskbar_center').width(widths-270);
				$('#tabs_container').width(widths-320);
				loadkjcd();
			});
		}
		
	});
})

function showTitle(top,text){
	if(isHidden == 1){
		var length = text.length;
		$('#skin-dinwei').css({"width":(length*20)+"px","left":"50px","top":(top+45)+"px"});
		$('#skin-dinwei').show();
		$('#skin-dinwei').stop(true,false).animate({"left":"80px"},100);
		$('#skin-dinwei').stop(true,false).animate({"left":"50px"},100);
		$('#skin-dinwei').html('<i class="fa fa-caret-left"></i>'+text);
	}
}

function queryHelp(){
	cha($('iframe:visible').eq(1).attr('id').replace('_iframe','').replace('tabs_','').replace('tabs_',''));
}
function iframe_div(lj,ms,nww)
		{
			var src ="";
		    if(nww=='1')
		    {
		    
		    	 src = "<%=basePath%>"+lj;
		    }
		    else{
		  		 src = lj;
		    }
		    $("#_divSpan").html(ms);
	 		$("#iframename_div").attr("src",src);
	 		BOX_show('_divTc');
 		}
 		
 		function iframe_frm(lj,nww){
 			var src ="";
			    if(nww=='1')
			    {
			    	 src = "<%=basePath%>"+lj;
			    }
			    else{
			  		 src = lj;
			    }
			window.location.href=src;
		}



	function iframe_divTc(lj,ms,nww,id,sfwzms)
		{
			var src ="";
			if(sfwzms=='1')
			{
				src = "<%=basePath%>/xxtc/queryByIdNr?id="+id;
			}else{
			    if(nww=='1')
			    {
			    
			    	 src = "<%=basePath%>"+lj;
			    }
			    else{
			  		 src = lj;
			    }
		    }
		    $("#_divJzSpan").html(ms);
	 		$("#iframename_divJz").attr("src",src);
	 		$("#id_tc").val(id);
	 		BOX_show('_divTcJz');
 		}
 		
 		function Look()
 		{
	 		if(confirm("点击阅读后将不再提示,确定阅读么?") == true){
		        document._divTcJzFrom.action = "<%=path%>/xxtc/updPtid";
		        $('#_divTcJzFrom').ajaxSubmit(function(r){
			    	     if(r=="1")
			            {
				            alert("阅读成功!");
				            BOX_remove('_divTcJz');
			            }else{
			          	  alert("阅读失败!");
			            }
		    	});
		    }
 		}
 		
 		
 		function iframe_tab(id)
		{
			    document.divFrom.action = "<%=path%>/xxtc/queryByIdNr?id="+id;
	    	    document.divFrom.submit();
 		}
 		
 		function iframe_divTcLj(lj,ms,id)
		{
		    $("#_divJzSpan").html(ms);
	 		$("#iframename_divJz").attr("src","<%=path%>/"+lj);
	 		$("#id_tc").val(id);
	 		BOX_show('_divTcJz');
 		}
 		
 		//首次登录修改密码
 		function scdlUpdMm(){
 			if(Validator.Validate(document.getElementById('scdlDivFrom'),3)){	
 				var mm1 = $("#scdlMm1").val();
 				var mm2 = $("#scdlMm2").val();
 				var mm3 = $("#scdlMm").val();
 				if(null == mm2 || "" == mm2 || null == mm3 || "" == mm3){
 					alert("必填项!必须填写!");
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
 			        	document.scdlDivFrom.action = "<%=path%>/updMm";
 			    	    document.scdlDivFrom.submit();
 				    }else{
 					    alert("原始密码错误！");
 					    return;
 					}
 			    },'json')
 		    }
 		}
 		function init(){
 			if('${sessionScope.CURRENT_USER.sfscdl}' == '1' || '${sessionScope.CURRENT_USER.sfscdl}' == ''){
 				BOX_show('scdlUpdMm');
 			}
 		};
 		<%--    加載完成時用戶保存的背景--%>
 		$(function (){
 			var tarUrl=$("#button-bgs00").val();
 	 		if(tarUrl!=null&&tarUrl!==""){

 	 			$("body").css({
 	 		        "background": "url('"+path+tarUrl+"') no-repeat",
 	 		        "background-size":"cover"
 	 			});
 	 		};
 	 		});
 		
</script>
<style>
#taskbar{background:none; }
.toptip{ position:absolute; margin-top: 3px;  padding: 5px 0;font-size: 12px;  line-height: 1.4;width: auto; z-index:100000}
.top-arrow{border-bottom-color:#f1f5fe;  border-width: 0 5px 5px;  left: 50%;  margin-left: -5px;  top: 0; border-style: solid;  height: 0;  position: absolute;  width: 0;color: transparent;}
.top-inner{  background-color: #f1f5fe;  border-radius: 4px; color:#444444 ;   width: auto;  padding: 3px 8px; text-align: center;  text-decoration: none;}	
</style>
</head>
<body style="height:100%;overflow-y:hidden; zoom:1;background:url(<%=path%>/resources/style/touming/images/bg.jpg) no-repeat" onload="init();">
<input type="hidden" id="button-bgs00" value="${sessionScope.skinname}"/>
<form name="queryform" id="queryform" method="post">
	<input type="hidden" name="usercode" value="${sessionScope.CURRENT_USER.yhdm}"/>
	<input type="hidden" name="password" value="${sessionScope.CURRENT_USER.mm}"/>
	<input type="hidden" id="dljs" value="${sessionScope.CURRENT_USER.jsdm}"/>
	<input type="hidden" name="jsdm" id="jsdm" value=""/>
</form>
<div class="top" id="north">
   <div class="topbg">
<%--	<div class="logo">${applicationScope.XT_CSB_TITLE.CS1}02</div>--%>
	<div class="logo"><img src="<%=path%>/resources/style/touming/images/logo.png"></div>
	<div class="welcome"><i class="fa fa-user"></i> 欢迎您，${sessionScope.CURRENT_USER.xm}！</div>
	<div class="top_right">
		<div id="taskbar_right">
		<c:forEach items="${listxx}" var="map">
			<c:choose>
		   		<c:when test="${map.id eq '1'}">  <!-- 主页  -->
			   	 <a class="pngFix" href="javascript:getReturn()"; onmouseover="toShow('home');" onmouseout="toHidden('home')"  id="home">
				 <i class="${map.icon}"></i><span>${map.ms}</span></a> 
		          <div class="toptip"  id="home_a" style="display:none">
	              <div class="top-arrow"></div>
	              <div class="top-inner">${map.ms} </div>
	            </div> 
		   		</c:when>
		   		<c:when test="${map.id eq '2'}">   <!-- 修改密码 -->
		   		<a  class="pngFix" href="javascript:BOX_show('updMm');" onmouseover="toShow('unlock');" onmouseout="toHidden('unlock')"  id="unlock">
		 		<i class="${map.icon}"></i><span>${map.ms}</span></a> 
	          	<div class="toptip"  id="unlock_a" style="display:none">
	              <div class="top-arrow"></div>
	              <div class="top-inner">${map.ms} </div>
	            </div> 
		   		</c:when>
		   		<c:when test="${map.id eq '3'}">    <!-- 注销登陆 -->
		   		<a   class="pngFix" href="javascript:logout();" onmouseover="toShow('power');" onmouseout="toHidden('power')"  id="power">
		 		<i class="${map.icon}"></i><span>${map.ms}</span></a> 
	          <div class="toptip"  id="power_a" style="display:none">
	              <div class="top-arrow"></div>
	              <div class="top-inner">${map.ms} </div>
	            </div> 
	            		 	
		   		</c:when>
		   		<c:when test="${map.id eq '4'}">   <!-- 个人菜单维护 -->
		   		<a class="pngFix"  href="javascript:void(0);" onclick="javascript:createTab('uuu5555555','个人菜单维护','<%=path%>	/grb/queryGrbcd');"  onmouseover="toShow('grwh');" onmouseout="toHidden('grwh')"  id="grwh">
		 		<i class="${map.icon}"></i><span>${map.ms}</span></a> 
	          <div class="toptip"  id="grwh_a" style="display:none">
	              <div class="top-arrow"></div>
	              <div class="top-inner">${map.ms}</div>
	            </div> 
		   		</c:when>
		   		<c:when test="${map.id eq '5'}">   	<!-- 布局设置 -->
		   		<a  class="pngFix"  href="javascript:void(0);" onclick="javascript:zybjsz()" onmouseover="toShow('tooltitle');" onmouseout="toHidden('tooltitle')"  id="tooltitle">
		 		<i class="${map.icon}"></i><span>${map.ms}</span></a>
	          <div class="toptip"  id="tooltitle_a" style="display:none">
	              <div class="top-arrow"></div>
	              <div class="top-inner">${map.ms} </div>
	            </div> 
		   		</c:when>
		   		<c:when test="${map.id eq '6'}">  <!-- 角色 -->
				   	 	<div id="site-nav">
						<div class="switch">
							<div class="photo"><a class="pngFix" title="${map.ms}" href="javaScript:void(0);"><i class="${map.icon}"></i><span>${map.ms}</span></a></div>
							<div class="switch-bd">
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
		   		</c:when>
		   		<c:when test="${map.id eq '7'}">   <!-- 关闭全部标签卡 -->
		   		<a class="pngFix"  href="javascript:void(0);" onclick="javascript:top.closeAllTab();" onmouseover="toShow('th');" onmouseout="toHidden('th')"  id="th">
		 		<i class="${map.icon}"></i><span>${map.ms}</span></a> 
	          <div class="toptip"  id="th_a" style="display:none">
	              <div class="top-arrow"></div>
	              <div class="top-inner">${map.ms}</div>
	            </div> 
		   		</c:when>		   		
		   		<c:otherwise>  
		   		
		   		<c:if test="${map.sfwzms eq '1'}"><!-- 是文本 -->
		   		
		   			<c:if test="${map.tcfs eq '_div'}"><!-- 如果是div -->
			   		<a  class="pngFix"  href="javascript:void(0);"  onclick="javascript:iframe_divTcLj('/xxtc/queryByIdNr?id=${map.id}','${map.ms}','${map.id}')"    onmouseover="toShow('${map.id}');" onmouseout="toHidden('${map.id}')"  id="${map.id}">
			 		<i class="${map.icon}"></i>
			 		<span>${map.ms}</span>
			 		</a>
		            <div class="toptip"  id="${map.id}_a" style="display:none">
		              <div class="top-arrow"></div>
		              <div class="top-inner">${map.ms} </div>
		               </div>
	<!--		   		 <a title="${map.ms}" class="pngFix"  href="javascript:void(0);" onclick="javascript:iframe_div('${map.fwlj}','${map.ms}','${map.nww}')"  style="background:#FFA200"><i class="${map.icon}"></i></a>	-->
			   		</c:if>
			   		
			   		<c:if test="${map.tcfs ne '_div'}"><!-- 不是div弹出 -->
				   		<c:if test="${map.tcfs eq '_tab'}"><!-- 是tab弹出 -->
				 		<a  class="pngFix"  href="javascript:void(0);"  onclick="javascript:top.createTab('${map.id}','${map.ms}','<%=path%>/xxtc/queryByIdNr?id=${map.id}');menuoffset(this);hys(this);"  onmouseover="toShow('${map.id}');" onmouseout="toHidden('${map.id}')"  id="${map.id}">
				 		<i class="${map.icon}"></i>
				 		 <span>${map.ms}</span>
				 		</a>
			            <div class="toptip"  id="${map.id}_a" style="display:none">
			              <div class="top-arrow"></div>
			              <div class="top-inner">${map.ms} </div>
			               </div>
		<!--		   		 <a title="${map.ms}" class="pngFix"  href="javascript:void(0);" onclick="javascript:iframe_div('${map.fwlj}','${map.ms}','${map.nww}')"  style="background:#FFA200"><i class="${map.icon}"></i></a>	-->
			   	    	</c:if>
				   	    	<c:if test="${map.tcfs ne '_tab'}">
					   			<a  class="pngFix"   onclick="javascript:iframe_tab('${map.id}')"   target="${map.tcfs}"     onmouseover="toShow('${map.id}');" onmouseout="toHidden('${map.id}')"  id="${map.id}">
						 		<i class="${map.icon}"></i>
						 		 <span>${map.ms}</span></a>
					            <div class="toptip"  id="${map.id}_a" style="display:none">
					              <div class="top-arrow"></div>
					              <div class="top-inner">${map.ms} </div> </div>
			<!--		   			<a title="${map.ms}" class="pngFix"  href="<%=path%>/${map.fwlj} "  target="${map.tcfs}"  style="background:#FFA200"><i class="${map.icon}"></i></a>	-->
				   			</c:if>
			   		</c:if>
			   		
			   		
			   		
		   		</c:if>
		   		
		   		<c:if test="${map.sfwzms ne '1'}"><!-- 不是文本 -->
			   		<c:if test="${map.tcfs eq '_div'}">
			   		<a  class="pngFix"  href="javascript:void(0);"  onclick="javascript:iframe_div('${map.fwlj}','${map.ms}','${map.nww}')"   onmouseover="toShow('${map.id}');" onmouseout="toHidden('${map.id}')"  id="${map.id}">
			 		<i class="${map.icon}"></i><span>${map.ms}</span></a>
		            <div class="toptip"  id="${map.id}_a" style="display:none">
		              <div class="top-arrow"></div>
		              <div class="top-inner">${map.ms} </div>
		               </div>
	<!--		   		 <a title="${map.ms}" class="pngFix"  href="javascript:void(0);" onclick="javascript:iframe_div('${map.fwlj}','${map.ms}','${map.nww}')"  style="background:#FFA200"><i class="${map.icon}"></i></a>	-->
			   		</c:if>
			   		<c:if test="${map.tcfs ne '_div'}">
				   		<c:if test="${map.tcfs eq '_tab'}">
				   	   <c:if test="${map.nww eq '1'}">
				   		<a  class="pngFix"  href="javascript:void(0);"  onclick="javascript:top.createTab('${map.id}','${map.ms}','<%=path%>/${map.fwlj}');menuoffset(this);hys(this);"  onmouseover="toShow('${map.id}');" onmouseout="toHidden('${map.id}')"  id="${map.id}"/>
				 		</c:if>
				 		<c:if test="${map.nww ne '1'}">
				 		<a  class="pngFix"  href="javascript:void(0);"  onclick="javascript:top.createTab('${map.id}','${map.ms}','${map.fwlj}');menuoffset(this);hys(this);"   onmouseover="toShow('${map.id}');" onmouseout="toHidden('${map.id}')"  id="${map.id}"/>
				 		</c:if>
				 		<i class="${map.icon}"></i><span>${map.ms}</span></a>
			            <div class="toptip"  id="${map.id}_a" style="display:none">
			              <div class="top-arrow"></div>
			              <div class="top-inner">${map.ms} </div>
			               </div>
		<!--		   		 <a title="${map.ms}" class="pngFix"  href="javascript:void(0);" onclick="javascript:iframe_div('${map.fwlj}','${map.ms}','${map.nww}')"  style="background:#FFA200"><i class="${map.icon}"></i></a>	-->
			   	    	</c:if>
				   	    	<c:if test="${map.tcfs ne '_tab'}">
				   			<c:if test="${map.nww eq '1'}">
					   			<a  class="pngFix"   href="<%=path%>/${map.fwlj} "  target="${map.tcfs}"   onmouseover="toShow('${map.id}');" onmouseout="toHidden('${map.id}')"  id="${map.id}">
						 		<i class="${map.icon}"></i><span>${map.ms}</span></a>
					            <div class="toptip"  id="${map.id}_a" style="display:none">
					              <div class="top-arrow"></div>
					              <div class="top-inner">${map.ms} </div> </div>
			<!--		   			<a title="${map.ms}" class="pngFix"  href="<%=path%>/${map.fwlj} "  target="${map.tcfs}"  style="background:#FFA200"><i class="${map.icon}"></i></a>	-->
				   			</c:if>
				   			 <c:if test="${map.nww eq '0'}">
					   			 <a  class="pngFix"   href="${map.fwlj}" target="${map.tcfs}"  onmouseover="toShow('${map.id}');" onmouseout="toHidden('${map.id}')"  id="${map.id}">
						 		<i class="${map.icon}"></i><span>${map.ms}</span></a>
					            <div class="toptip"  id="${map.id}_a" style="display:none">
					              <div class="top-arrow"></div>
					              <div class="top-inner">${map.ms} </div> </div>
		<!--		   			<a title="${map.ms}" class="pngFix"   href="${map.fwlj}" target="${map.tcfs}"  style="background:#FFA200"><i class="${map.icon}"></i></a>	-->
				   			</c:if>
				   			</c:if>
			   		</c:if>
		   		</c:if>
		   		</c:otherwise>
		  
			</c:choose>
			</c:forEach>
		</div>
    
	</div>
	<div class="clr"></div>
  </div>	
</div>
<div class="clr"></div>
<!-- iframe -->
<div id="tabs_portal_0_panel">
	<div class="main_left"  name="fmTitle" id="frmTitle">
		<div id="skin-select">
			<div class="skin-dinwei" id="skin-dinwei"><i class="fa fa-caret-left"></i>asdasdasdasdasdasdasdasasd</div>
			<ul id="menus"  class="topnav menu-left-nest">
				<li>
	                 <a href="javascript:;" style="border-left:0px solid!important;" class="title-menu-left">
	                     <span style="display:inline-block">栏目导航</span>
	                     <i data-toggle="tooltip" class="entypo-menu pull-right config-wrap" id="toggle" style="display:block!important"></i>
	                 </a>
                </li>
	         </ul>
			<iframe id="iframename0" name="iframename0" scrolling="no" src="<%=path%>/getOrder" border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%;" frameborder="0" allowTransparency="true"></iframe>
		</div>
	</div>
	
<%--	<div class="main_center" onclick="switchSysBar()"><span class="navPoint" id="switchPoint" title="关闭/打开左栏"><a class="left_but pngFix"></a></span></div>--%>
<%--	<div class="main_right" id="main_right">--%>
<%--		<iframe id="iframename" name="iframename" src="<%=path%>/jsp/commons/main/right.jsp" border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%; height: 100%;" frameborder="0" allowTransparency="true"></iframe>--%>
<%--	</div>--%>
 <div  id="main_right" class="main_right"  >
    <div id="myiframes">
    	<div id="taskbar">
		    <div id="taskbar_center">
		        <div style="display none" id="tabs_left_scroll"></div>
		        <div id="tabs_container">
		            <div id="tabs_portal_0" class="selected"><a hideFocus id="tabs_link_portal_0" class="tab" href="javascript:void(0);" closable="false" index="portal_0">首页</a></div>
		        </div>
		        <div style="display: none" id="tabs_right_scroll"></div>
		    </div>  
		</div>
	    <div  id="center" class="container-fluid paper-wrap bevel tlbr">
			<div id="tabs_portal_0_panel"  class="tabs-panel selected"> 
		    	<iframe id="tabs_portal_0_iframe"  name="tabs_portal_0_iframe" src="<%=path%>/jsp/commons/main/right.jsp"  border="0" framespacing="0" marginheight="0" marginwidth="0" frameborder="0" allowTransparency="true"></iframe>
		    </div>  
		</div>
	</div>
    <div id="cdbutton"></div>
	     <div id="kjcdbar" wz="bottom" zt="close" style="float:right; position:absolute  ; overflow:hidden "  class="icon_right">
		      <div id="s1" class="arrow_bg_right"  style=" position:relative; z-index:9 ">
		        <div id="s2"class="arrow_pic_right arrow_top" style=" position:relative; z-index:9 " ></div>
		      </div> 
		<a id="qhcd" href="javascript:cdbd();" class="switch" style="z-index:9;position:relative;"> 切换   </a>
		       
		      
		     
		<c:forEach items="${orderkjcd}" var="fmap" varStatus="status">
			
		   <div onclick="javascript:top.createTab('${fmap.qxdm}','${fmap.qxmc}','<%=path%>${fmap.fwlj}')" class="index_icon flip-container" ontouchstart="this.classList.toggle('hover');">
		       <div class="flipper" >
		          <div class="zj_icon front ${fmap.icon}"></div>
		          
		          <c:if test="${fn:length(fmap.qxmc) lt 4}">
			          <div class="back" style="padding-top:22px">${fmap.qxmc}</div>
		          </c:if>
		          <c:if test="${fn:length(fmap.qxmc) eq 4}">
		          	  <div class="back">${fn:substring(fmap.qxmc,0,2)}</br>
		          	  ${fn:substring(fmap.qxmc,2,4)}</div>
		          </c:if>
		          <c:if test="${fn:length(fmap.qxmc) gt 4 && fn:length(fmap.qxmc) lt 7 }">
		          	  <div class="back">${fn:substring(fmap.qxmc,0,3)}</br>
		          	  ${fn:substring(fmap.qxmc,3,6)}</div>
		          </c:if>
	          	  <c:if test="${fn:length(fmap.qxmc) gt 6}">
	          	  	 <div class="back"> ${fn:substring(fmap.qxmc,0,3)}</br>
		          	  ${fn:substring(fmap.qxmc,3,5)}...</div>
		          </c:if>
		          
		      </div>
		</div>
		</c:forEach>       
		       <div id="e1" class="arrow_bg_right">
		        <div id="e2" class="arrow_pic_right arrow_bottom"></div>
		       </div>   
         </div>
    
    
    </div>
     
    
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
                <td align="left"><input type="password" name="mm1" id="mm1" maxlength="50"/></td>
            </tr>

            <tr>
                <th>新密码：</th>
                <td align="left"><input type="password" name="mm" id="mm" dataType="Limit" msg="密码必须在6~25位" min="6" max="25" /></td>
            </tr>
            <tr>
                <th>再次输入新密码：</th>
                <td align="left"><input type="password" name="mm2" id="mm2" dataType="Limit" msg="密码必须在6~25位" min="6" max="25" /></td>
            </tr>            
            <tr>
                <td colspan="2">
	                <div class="addlist_button1" style="float:right"><a href="javascript:BOX_remove('updMm');" title="取消" ><span>取消</span></a> </div>
	                <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:updMm();" title="保存" ><span>保存</span></a></div>
                </td>
            </tr>
        </table>
        <div class="clr"></div>
    </div>
</form>
</div>

<!-- 首次登录修改密码 -->
<div id="scdlUpdMm" style="display:none; width: 400px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
<form name="scdlDivFrom" id="scdlDivFrom" method="post">
	<input name="sfscdl" value="0" type="hidden"/><!-- 是否首次登陆(1是；0否) -->
    <div class="popup">
        <div class="Floatleft Pct100 mb10">
            <div class="popup_left">首次登录修改密码</div>
        </div>
        <div class="clr"></div>
        <table id="divtab" width="100%" cellpadding="0" cellspacing="0" class="addlist" style="border-collapse:collapse">
        	<tr>
                <th>原始密码：</th>
                <td align="left"><input type="password" name="mm1" id="scdlMm1" maxlength="50"/></td>
            </tr>

            <tr>
                <th>新密码：</th>
                <td align="left"><input type="password" name="mm" id="scdlMm" dataType="Limit" msg="密码必须在6~25位" min="6" max="25" /></td>
            </tr>
            <tr>
                <th>再次输入新密码：</th>
                <td align="left"><input type="password" name="mm2" id="scdlMm2" dataType="Limit" msg="密码必须在6~25位" min="6" max="25" /></td>
            </tr>            
            <tr>
                <td colspan="2">
	                <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:scdlUpdMm();" title="保存" ><span>保存</span></a></div>
                </td>
            </tr>
        </table>
        <div class="clr"></div>
    </div>
</form>
</div>

<!-- 弹出为_div    的弹出层 -->
<div id="_divTc" style="display:none; width: 700px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
<form name="_divTcFrom" id="_divTcFrom" method="post">
    <div class="popup">
        <div class="Floatleft Pct100 mb10">
           <div class="popup_left"><span id="_divSpan"></span></div>
           <a href="javaScript:void(0);" class="btn_close" onclick="javascript:BOX_remove('_divTc');"></a> </div>
           <div class="clr"></div>
		   <iframe id="iframename_div" name="iframename_div"  border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%;height:450px;" frameborder="0" allowTransparency="true"></iframe>
           <div class="addlist_button1 mt10" style="float:right"><a href="javascript:void(0);" onclick="javascript:BOX_remove('_divTc');"  title="取消" ><span>取消</span></a> </div>
           <div class="clr"></div>
    </div>
</form>
</div>



<!-- 弹出层    加载 -->
<div id="_divTcJz" style="display:none; width: 700px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
<form name="_divTcJzFrom" id="_divTcJzFrom" method="post">
<input type="hidden" name="id" id="id_tc"/>
    <div class="popup">
        <div class="Floatleft Pct100 mb10">
            <div class="popup_left"><span id="_divJzSpan"></span></div>
            <a href="javaScript:void(0);" class="btn_close" onclick="javascript:BOX_remove('_divTcJz');"></a> </div>
            <div class="clr"></div>
			<iframe id="iframename_divJz" name="iframename_div"  border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%;height:400px;" frameborder="0" allowTransparency="true"></iframe>
            <div class="addlist_button1 mt10" style="float:right"><a href="javascript:void(0);" onclick="javascript:BOX_remove('_divTcJz');"  title="取消" ><span>取消</span></a> </div>
            <div class="addlist_button1 mt10 mr15" style="float:right"><a href="javascript:void(0);" onclick="javascript:Look();"  title="阅读" ><span>阅读</span></a> </div>
        <div class="clr"></div>
    </div>
</form>
</div>
<div id="setting"> </div>
<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
</body>
</html>
  

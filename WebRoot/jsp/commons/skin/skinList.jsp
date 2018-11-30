<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>北京赢科后台管理系统</title>
<jsp:include page="../../include/css-main-include.jsp"></jsp:include>
<style type="text/css">
  html, body { height:100%; }
  .Contentbox { width:100%; min-height:100%;height:auto }
  *html .Contentbox { height:100% }
</style>
<script type="text/javascript" src="<%=path%>/resources/js/common/jscolor/jscolor.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jquery.ztree.core-3.1.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jquery.ztree.excheck-3.1.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/bootstrap.js"></script>


<script type="text/javascript">
</script>
</head>

<body>
<form method="post" id="skinform" name="skinform">
<!-- <div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">模板名称：</span>
    <input type="text" id="skinName" name="skinName" value=""/>
</div> -->
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">顶部栏背景色：</span>
    <input class="topColor color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;"  id="boxColorA" name="boxColorA" value="${sessionScope.boxColorA}"/>
</div>

<%--新增更改的颜色值-star---%>

<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">顶部栏文字颜色<!-- (01,07,08右侧浮动栏目触发色) -->：</span>
    <input class="topFontColor color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;"  id="topFontColor" name="topFontColor" value="${topFontColor}"/>
</div>

<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">顶部菜单栏文字颜色<!-- (01,07,08右侧浮动栏目触发色) -->：</span>
    <input class="topFontColorR color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;"  id="topFontColorR" name="topFontColorR" value="${topFontColorR}"/>
</div>

<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">顶部菜单栏触发颜色<!-- (01,07,08右侧浮动栏目触发色) -->：</span>
    <input class="topHovR color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;"  id="topHovR" name="topHovR" value="${topHovR}"/>
</div>

<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">顶部logo文字颜色<!-- (01,07,08右侧浮动栏目触发色) -->：</span>
    <input class="topFontLogo color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;"  id="topFontLogo" name="topFontLogo" value="${topFontLogo}"/>
</div>

<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏栏目导航和菜单按钮颜色<!-- (01,07,08右侧浮动栏目触发色) -->：</span>
    <input class="navBtnBg color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;"  id="navBtnBg" name="navBtnBg" value="${navBtnBg}"/>
</div>

<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏二级icon颜色<!-- (01) -->：</span>
	<input class="leftIconColB color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="leftIconColB" name="leftIconColB" value="${leftIconColB}"/>  
</div>

<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏三级icon颜色<!-- (01) -->：</span>
	<input class="leftIconColC color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="leftIconColC" name="leftIconColC" value="${leftIconColC}"/>  
</div>

<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏一级菜单文字颜色<!-- (01) -->：</span>
	<input class="leftTextColA color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="leftTextColA" name="leftTextColA" value="${leftTextColA}"/>  
</div>

<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏二级菜单文字颜色<!-- (01) -->：</span>
	<input class="leftTextColB color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="leftTextColB" name="leftTextColB" value="${leftTextColB}"/>  
</div>

<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏三级菜单文字颜色<!-- (01) -->：</span>
	<input class="leftTextColC color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="leftTextColC" name="leftTextColC" value="${leftTextColC}"/>  
</div>

<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">二级导航栏触发色<!-- (01,08) -->：</span>
	<input class="leftColorHovB color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="leftColorHovB" name="leftColorHovB" value="${leftColorHovB}"/>  
</div>

<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">三级导航栏触发色<!-- (01,08) -->：</span>
	<input class="leftColorHovC color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="leftColorHovC" name="leftColorHovC" value="${leftColorHovC}"/>  
</div>

<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">面包屑导航文字颜色<!-- (01,07，08) -->：</span>
	<input class="contentCrumbs color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" value="${namKeys}" name="namKeys"/>  
</div>

<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">主页切换菜单文字颜色<!-- (01,07，08) -->：</span>
	<input class="mainNavCol color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" value="${mainNavCol}" id="mainNavCol" name="mainNavCol"/>  
</div>

<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">主页切换菜单背景颜色<!-- (01,07，08) -->：</span>
	<input class="navMainBg color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" value="${navMainBg}" id="navMainBg" name="navMainBg"/>  
</div>
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">页面内容背景颜色<!-- (01,07，08) -->：</span>
	<input class="contentBg color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" value="${contentBg}" id="contentBg" name="contentBg"/>  
</div>

<%--新增更改的颜色值-end---%>

<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">顶部边栏导航背景色：</span>
	<input class="topColorRig color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;"  id="boxColorB" name="boxColorB" value="${sessionScope.boxColorB}"/>  
</div>
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">顶部边栏logo背景色：</span>
	<input class="logoColor color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorC" name="boxColorC" value="${sessionScope.boxColorC}"/>  
</div>
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏一级菜单背景色：</span>
	<input class="leftColor color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorD" name="boxColorD" value="${sessionScope.boxColorD}"/>  
</div>
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏二级菜单背景色：</span>
	<input class="leftColorSub color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorE" name="boxColorE" value="${sessionScope.boxColorE}"/>  
</div>
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏触发色：</span>
	<input class="leftColorHov color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorF" name="boxColorF" value="${sessionScope.boxColorF}"/>  
</div>
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏icon颜色：</span>
	<input class="leftIconCol color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorG" name="boxColorG" value="${sessionScope.boxColorG}"/>  
</div>
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">内容部分颜色：</span>
	<input class="contentCol color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" value="${sessionScope.namKey}"/>  
</div>
<!-- <div align="center">
<button style="background-color: #50B3EE;width: 60px;height: 35px;border-radius:5px;color: #ffffff;border-color: #F0F0F0;border: 2px" onclick="saveModel();return false;">保存</button>
<button style="background-color: #50B3EE;width: 60px;height: 35px;border-radius:5px;color: #ffffff;border-color: #F0F0F0;border: 2px" onclick="cancel();return false;">取消</button>
</div> -->
</form>
<script>

    var colors={
        str1:null,
        str2:null,
        str3:null,
        str4:null,
        colArray:function (names){
            colors.str1=$(names).val();
            colors.str2="#"+colors.str1;
           
        },
        topbox:function (){
        	$(window.parent.document).find("head").children("style").append('#taskbar_right a:hover{background-color:'+colors.str2+'!important}');
        	$(window.parent.document).find(".topbg").css("background-color",colors.str2);/*顶部行栏的颜色*/
        	$(window.parent.document).find(".switch-bd").css("background-color",colors.str2);/*顶部行栏下拉框的颜色*/
<%--        	$(window.parent.document).find("#taskbar_right").css("background-color",colors.str4[1]);/*顶部右侧导航颜色*/--%>
        	/*$(window.parent.document).find("#taskbar_right:before").css("background-color",colors.str3[0]);顶部右侧导航颜色*/
        	/*$(window.parent.document).find(".logo").css("background-color",colors.str3[0]);顶部栏目和左侧栏目交汇处的颜色*/

        },
        toprig:function (){
        	$(window.parent.document).find("head").children("style").append('#taskbar_right:before{border-top-color:'+colors.str2+'!important}');
<%--        	$(window.parent.document).find(".topbg").css("background-color",colors.str4[0]);/*顶部行栏的颜色*/--%>
<%--        	$(window.parent.document).find(".switch-bd").css("background-color",colors.str4[0]);/*顶部行栏下拉框的颜色*/--%>
        	$(window.parent.document).find("#taskbar_right").css("background-color",colors.str2);/*顶部右侧导航颜色*/
        	/*$(window.parent.document).find("#taskbar_right:before").css("background-color",colors.str3[0]);顶部右侧导航颜色*/
        	/*$(window.parent.document).find(".logo").css("background-color",colors.str3[0]);顶部栏目和左侧栏目交汇处的颜色*/

        },
        logoColor:function (){
        	$(window.parent.document).find(".logo").css("background-color",colors.str2);/*顶部栏目和左侧栏目交汇处的颜色*/

        },
        leftColor:function (){
    		$(window.parent.document).find("head").children("style").append('#taskbar #taskbar_center #tabs_container div.selected{background-color:'+colors.str2+'!important}');
<%--        	$(window.parent.document).find(".logo").css("background-color",colors.str3[0]);/*顶部栏目和左侧栏目交汇处的颜色*/--%>
        	$(window.parent.document).find("#skin-select").css("background-color",colors.str2);/*左侧栏颜色*/
<%--        	$(window.parent.document).find(".title-menu-left").children("span").css("background-color",colors.str2);/*左侧栏“栏目导航条"颜色*/--%>
        	$(window.parent.document).find("#toggle").css("background-color",colors.str2);/*左侧栏导航收放按钮颜色*/
<%--        	$(window.parent.document).find("#skin-warp").find("i").css("color",colors.str3[0]);/*触发色边框箭头颜色*/--%>
<%--            $(window.parent.document).find("ul.topnav").children("ol").children("li").children("a").css("background-color",colors.str3[0]);    /*左侧栏导航一级收起栏目底色颜色*/--%>
        },
        leftColorSub:function (){
        	
    		window.parent.iframename0.test(colors.str2);
<%--    		$(window.parent.document).find("head").children("style").append('#taskbar #taskbar_center #tabs_container div.selected{background-color:'+colors.str3[0]+'!important}');--%>
<%--        	$(window.parent.document).find(".logo").css("background-color",colors.str3[0]);/*顶部栏目和左侧栏目交汇处的颜色*/--%>
<%--        	$(window.parent.document).find("#skin-select").css("background-color",colors.str3[1]);/*左侧栏颜色*/--%>
        	$(window.parent.document).find(".title-menu-left").children("span").css("background-color",colors.str2);/*左侧栏“栏目导航条"颜色*/
<%--        	$(window.parent.document).find("#toggle").css("background-color",colors.str3[2]);/*左侧栏导航收放按钮颜色*/--%>
<%--        	$(window.parent.document).find("#skin-warp").find("i").css("color",colors.str3[0]);/*触发色边框箭头颜色*/--%>
<%--            $(window.parent.document).find("ul.topnav").children("ol").children("li").children("a").css("background-color",colors.str3[0]);    /*左侧栏导航一级收起栏目底色颜色*/--%>
        },
		leftColorHov:function (){
        	
    		window.parent.iframename0.txs(colors.str2);
        },
        leftIconCol:function (){
    		window.parent.iframename0.iconCol(colors.str2);
        },
        colclick:function (){
        	$(".topColor").on("change",function (){
            	document.skinform.action = '<%=path%>/skin/saveSkin1';
		        $('#skinform').ajaxSubmit(function(r){
		        });
        		colors.colArray(".topColor");
        		colors.topbox();
            	});
        	$(".topColorRig").on("change",function (){
        		document.skinform.action = '<%=path%>/skin/saveSkin1';
		        $('#skinform').ajaxSubmit(function(r){
		        });
        		colors.colArray(".topColorRig");
        		colors.toprig();
            	});
        	$(".logoColor").on("change",function (){
        		document.skinform.action = '<%=path%>/skin/saveSkin1';
		        $('#skinform').ajaxSubmit(function(r){
		        });
        		colors.colArray(".logoColor");
        		colors.logoColor();
            	});
        	$(".leftColor").on("change",function (){
        		document.skinform.action = '<%=path%>/skin/saveSkin1';
		        $('#skinform').ajaxSubmit(function(r){
		        });
        		colors.colArray(".leftColor");
        		colors.leftColor();
            	});
        	$(".leftColorSub").on("change",function (){
        		document.skinform.action = '<%=path%>/skin/saveSkin1';
		        $('#skinform').ajaxSubmit(function(r){
		        });
        		colors.colArray(".leftColorSub");
        		colors.leftColorSub();
            	});
        	$(".leftColorHov").on("change",function (){
        		document.skinform.action = '<%=path%>/skin/saveSkin1';
		        $('#skinform').ajaxSubmit(function(r){
		        });
        		colors.colArray(".leftColorHov");
        		colors.leftColorHov();
            	});
            $(".leftIconCol").on("change",function (){
            	document.skinform.action = '<%=path%>/skin/saveSkin1';
		        $('#skinform').ajaxSubmit(function(r){
		        });
            		colors.colArray(".leftIconCol");
            		colors.leftIconCol();
                });
<%--            $(".contentCol").on("change",function (){--%>
<%--        		colors.colArray(".contentCol");--%>
<%--        		contentCol(colors.str2);--%>
<%--            });--%>
			<%--新增更改的颜色值-star---%>
        	$(".topFontColor").on("change",function (){
            	document.skinform.action = '<%=path%>/skin/saveSkin1';
		       // $('#skinform').ajaxSubmit(function(r){
		       // });
        		colors.colArray(".topFontColor");
        		colors.topfont();
            	});
        	$(".topFontColorR").on("change",function (){
            	document.skinform.action = '<%=path%>/skin/saveSkin1';
		       // $('#skinform').ajaxSubmit(function(r){
		       // });
        		colors.colArray(".topFontColorR");
        		colors.topfontR();
            	});
            	$(".topHovR").on("change",function (){
                	document.skinform.action = '<%=path%>/skin/saveSkin1';
    		       // $('#skinform').ajaxSubmit(function(r){
    		       // });
            		colors.colArray(".topHovR");
            		colors.topHovR();
                	});
            	$(".topFontLogo").on("change",function (){
                	document.skinform.action = '<%=path%>/skin/saveSkin1';
    		       // $('#skinform').ajaxSubmit(function(r){
    		       // });
            		colors.colArray(".topFontLogo");
            		colors.topfontLogo();
                	});
            	$(".navBtnBg").on("change",function (){
                	document.skinform.action = '<%=path%>/skin/saveSkin1';
    		       // $('#skinform').ajaxSubmit(function(r){
    		       // });
            		colors.colArray(".navBtnBg");
            		colors.navBtnBg();
                	});

            	$(".leftIconColB").on("change",function (){
                	document.skinform.action = '<%=path%>/skin/saveSkin1';
    		       // $('#skinform').ajaxSubmit(function(r){
    		       // });
                		colors.colArray(".leftIconColB");
                	
                		colors.leftIconColB();
                    });
            	$(".leftIconColC").on("change",function (){
                	document.skinform.action = '<%=path%>/skin/saveSkin1';
    		       // $('#skinform').ajaxSubmit(function(r){
    		       // });
                		colors.colArray(".leftIconColC");
                	
                		colors.leftIconColC();
                    });

                    $(".leftTextColA").on("change",function (){
                    	document.skinform.action = '<%=path%>/skin/saveSkin1';
        		       // $('#skinform').ajaxSubmit(function(r){
        		       // });
                    		colors.colArray(".leftTextColA");
                    	
                    		colors.leftTextColA();
                        });

                    $(".leftTextColB").on("change",function (){
                    	document.skinform.action = '<%=path%>/skin/saveSkin1';
        		       // $('#skinform').ajaxSubmit(function(r){
        		       // });
                    		colors.colArray(".leftTextColB");
                    	
                    		colors.leftTextColB();
                        });

                    $(".leftTextColC").on("change",function (){
                    	document.skinform.action = '<%=path%>/skin/saveSkin1';
        		       // $('#skinform').ajaxSubmit(function(r){
        		       // });
                    		colors.colArray(".leftTextColC");
                    	
                    		colors.leftTextColC();
                        });
                    $(".leftColorHovB").on("change",function (){
                		document.skinform.action = '<%=path%>/skin/saveSkin1';
        		       // $('#skinform').ajaxSubmit(function(r){
        		       // });
                		colors.colArray(".leftColorHovB");
                		colors.leftColorHovB();
                		
                    	});
                    $(".leftColorHovC").on("change",function (){
                		document.skinform.action = '<%=path%>/skin/saveSkin1';
        		       // $('#skinform').ajaxSubmit(function(r){
        		       // });
                		colors.colArray(".leftColorHovC");
                		colors.leftColorHovC();
                		
                    	});
                	$(".mainNavCol").on("change",function (){
                		document.skinform.action = '<%=path%>/skin/saveSkin1';
         		       // $('#skinform').ajaxSubmit(function(r){
         		       // });
                 		colors.colArray(".mainNavCol");
                 		colors.navMain();
                 		
                     	});
                     	$(".navMainBg").on("change",function (){
                    		document.skinform.action = '<%=path%>/skin/saveSkin1';
             		       // $('#skinform').ajaxSubmit(function(r){
             		       // });
                     		colors.colArray(".navMainBg");
                     		colors.navMainBg();
                     		
                         	});
                     	$(".contentBg").on("change",function (){
                    		document.skinform.action = '<%=path%>/skin/saveSkin1';
             		       // $('#skinform').ajaxSubmit(function(r){
             		       // });
                     		colors.colArray(".contentBg");
                     		colors.contentBg();
                     		
                         	});
                    
        	<%--新增更改的颜色值-end---%>
        }
    };
    $(function (){
    	colors.colclick();
        })
    
    </script>
</body>
</html>


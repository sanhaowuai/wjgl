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
	function goBackList(){
	 if($("#mrSkin").val()!=null&&$("#mrSkin").val()!=''){
				colors.str2="#"+$("#boxColorA1").val();
        		colors.topbox();
            	
        		colors.str2="#"+$("#boxColorB1").val();
        		colors.toprig();

        		colors.str2="#"+$("#boxColorC1").val();
        		colors.logoColor();

        		colors.str2="#"+$("#boxColorD1").val();
        		colors.leftColor();
            	
        		colors.str2="#"+$("#boxColorE1").val();
        		colors.leftColorSub();
            	
        		colors.str2="#"+$("#boxColorF1").val();
        		colors.leftColorHov();
            	
            	colors.str2="#"+$("#boxColorG1").val();
            	colors.leftIconCol();
            	
            	colors.str2="#"+$("#topFontColor1").val();
            	colors.topfont();
            	
            	colors.str2="#"+$("#topFontColorR1").val();
            	colors.topfontR();
            	
            	colors.str2="#"+$("#topHovR1").val();
            	colors.topHovR();
            	
            	colors.str2="#"+$("#topFontLogo1").val();
            	colors.topfontLogo();
            	
            	colors.str2="#"+$("#navBtnBg1").val();
            	colors.navBtnBg();
            	
            	colors.str2="#"+$("#leftIconColB1").val();
            	colors.leftIconColB();
            	
            	colors.str2="#"+$("#leftIconColC1").val();
            	colors.leftIconColC();
            	
            	colors.str2="#"+$("#leftTextColA1").val();
            	colors.leftTextColA();
            	
            	colors.str2="#"+$("#leftTextColB1").val();
            	colors.leftTextColB();
            	
            	colors.str2="#"+$("#leftTextColC1").val();
            	colors.leftTextColC();
            	
            	colors.str2="#"+$("#leftColorHovB1").val();
            	colors.leftColorHovB();
            	
            	colors.str2="#"+$("#leftColorHovC1").val();
            	colors.leftColorHovC();
            	
            	colors.str2="#"+$("#mainNavCol1").val();
            	colors.navMain();
            	
            	colors.str2="#"+$("#navMainBg1").val();
            	colors.navMainBg();
            	
            	colors.str2="#"+$("#contentBg1").val();
            	colors.contentBg();

            	bgColor();
           		//页面内按钮与面包屑颜色
           		window.parent.colRwLoc();
           		var nkaa=$("#namKey1").val();
        		var nkbb=$("#namKeys1").val();
           		returnA(nkaa);
           		returnB(nkbb);
            	
          }else{
          		colors.str2="#50b3ee";
        		colors.topbox();
            
        		colors.str2="#74C2F2";
        		colors.toprig();

        		colors.str2="#213047";
        		colors.logoColor();

        		colors.str2="#374B63";
        		colors.leftColor();
            	
            	
        		colors.str2="#2d3d56";
        		colors.leftColorHov();
            	
            	colors.str2="#50b3ee";
            	colors.leftIconCol();
            	
            	colors.str2="#ffffff";
            	colors.topfont();
            	
            	colors.str2="#"+'ffffff';
        		colors.topfont();
				colors.str2="#"+'ffffff';
        		colors.topfontR();
        		colors.str2="#"+'50B3EE';
        		colors.topHovR();
        		colors.str2="#"+'ffffff';
            	colors.topfontLogo();
            	colors.str2="#"+'2D3D56';
            	colors.navBtnBg();
            	
            	if('${sessionScope.syym}'=='commons/main/main_01'){
	        		colors.str2="#213047";
	        		colors.leftColorSub();
	            	colors.str2="#"+'50B3EE';
	                colors.leftIconColB();
	                colors.str2="#"+'50B3EE';
	                colors.leftIconColC();
	                colors.str2="#"+'ffffff';
	                colors.leftTextColA();
	                colors.str2="#"+'ffffff';
	                colors.leftTextColB();
	                colors.str2="#"+'ffffff';
	                colors.leftTextColC();
	                colors.str2="#"+'2D3D56';
	                colors.leftColorHovB();
	                colors.str2="#"+'2D3D56';
	                colors.leftColorHovC();
                }
                if('${sessionScope.syym}'=='commons/main/main_11'){
	        		colors.str2="#f8f8f8";
	        		colors.leftColorSub();
                	colors.str2="#"+'333333';
	                colors.leftIconColB();
	                colors.str2="#"+'333333';
	                colors.leftIconColC();
	                colors.str2="#"+'333333';
	                colors.leftTextColA();
	                colors.str2="#"+'333333';
	                colors.leftTextColB();
	                colors.str2="#"+'333333';
	                colors.leftTextColC();
	                colors.str2="#"+'EEEEEE';
	                colors.leftColorHovB();
	                colors.str2="#"+'EEEEEE';
	                colors.leftColorHovC();
                }
                
                colors.str2="#"+'7F8993';
                colors.navMain();
                colors.str2="#"+'ACB2B8';
           		colors.navMainBg();
                colors.str2="#"+'FAFAFA';
           		colors.navMainBg();
           		colors.str2="#"+'ffffff';
           		colors.contentBg();
           		
           		bgColor();
           		//页面内按钮与面包屑颜色
           		window.parent.colRwLoc();
           		var nkaa='50b3ee';
        		var nkbb='747e8a';
           		returnA(nkaa);
           		returnB(nkbb);

          }
		document.skinform.action="<%=path%>/skin/querySkinList";
		document.skinform.submit();
	}
	function saveModel(){
		var skinName=$("#skinName").val();
		if(skinName==null||''==skinName){
			alert("请输入名称！");
			return false;
		}
		document.skinform.action = '<%=path%>/skin/saveSkinModel';
		$('#skinform').ajaxSubmit(function(r){
			goBackList();
		});
	}
	/* function cancel(){
	
	} */
</script>
</head>

<body>
<form method="post" id="skinform" name="skinform">
<input type="hidden" name="skinId" id="skinId" value="${skinId}"/>
<input type="hidden" name="mrSkin" id="mrSkin" value="${mrSkin}"/>
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">模板名称：</span>
    <input type="text" id="skinName" name="skinName" value="${skinName}"/>
</div>
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">顶部栏背景色<!-- (01,07,08右侧浮动栏目触发色) -->：</span>
    <input class="topColor color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;"  id="boxColorA" name="boxColorA" value="${empty boxColorA ? '50B3EE' : boxColorA}"/>
</div>
<%--新增更改的颜色值-star---%>
<c:if test="${sessionScope.syym eq 'commons/main/main_01' or sessionScope.syym eq 'commons/main/main_11'}">
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">顶部栏文字颜色<!-- (01,07,08右侧浮动栏目触发色) -->：</span>
    <input class="topFontColor color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;"  id="topFontColor" name="topFontColor" value="${empty topFontColor ? 'FFFFFF' : topFontColor}"/>
</div>

<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">顶部菜单栏文字颜色<!-- (01,07,08右侧浮动栏目触发色) -->：</span>
    <input class="topFontColorR color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;"  id="topFontColorR" name="topFontColorR" value="${empty topFontColorR ? 'FFFFFF' : topFontColorR}"/>
</div>

<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">顶部菜单栏触发颜色<!-- (01,07,08右侧浮动栏目触发色) -->：</span>
    <input class="topHovR color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;"  id="topHovR" name="topHovR" value="${empty topHovR ? '50B3EE' : topHovR}"/>
</div>

<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">顶部logo文字颜色<!-- (01,07,08右侧浮动栏目触发色) -->：</span>
    <input class="topFontLogo color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;"  id="topFontLogo" name="topFontLogo" value="${empty topFontLogo ? 'FFFFFF' :topFontLogo}"/>
</div>
<%--模板布局11替换皮肤-star--%>
<%-- <c:if test="${sessionScope.syym eq 'commons/main/main_11'}">
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏栏目导航和菜单按钮颜色<!-- (01,07,08右侧浮动栏目触发色) -->：</span>
    <input class="navBtnBg color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;"  id="navBtnBg" name="navBtnBg" value="${empty navBtnBg ? '2D3D56' : navBtnBg}"/>
</div>
</c:if> --%>
<%--模板布局11替换皮肤-end--%>
<c:if test="${sessionScope.syym eq 'commons/main/main_01'}">
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏二级icon颜色<!-- (01) -->：</span>
	<input class="leftIconColB color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="leftIconColB" name="leftIconColB" value="${empty leftIconColB ? '50B3EE' : leftIconColB}"/>  
</div>

<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏三级icon颜色<!-- (01) -->：</span>
	<input class="leftIconColC color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="leftIconColC" name="leftIconColC" value="${empty leftIconColC ? '50B3EE' : leftIconColC}"/>  
</div>

<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏一级菜单文字颜色<!-- (01) -->：</span>
	<input class="leftTextColA color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="leftTextColA" name="leftTextColA" value="${empty leftTextColA ? 'FFFFFF' : leftTextColA}"/>  
</div>

<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏二级菜单文字颜色<!-- (01) -->：</span>
	<input class="leftTextColB color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="leftTextColB" name="leftTextColB" value="${empty leftTextColB ? 'FFFFFF' : leftTextColB}"/>  
</div>

<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏三级菜单文字颜色<!-- (01) -->：</span>
	<input class="leftTextColC color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="leftTextColC" name="leftTextColC" value="${empty leftTextColC ? 'FFFFFF' : leftTextColC}"/>  
</div>
</c:if>
<c:if test="${sessionScope.syym eq 'commons/main/main_11'}">
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏二级icon颜色<!-- (01) -->：</span>
	<input class="leftIconColB color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="leftIconColB" name="leftIconColB" value="${empty leftIconColB ? '50B3EE' : leftIconColB}"/>  
</div>

<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏三级icon颜色<!-- (01) -->：</span>
	<input class="leftIconColC color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="leftIconColC" name="leftIconColC" value="${empty leftIconColC ? '50B3EE' : leftIconColC}"/>  
</div>

<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏一级菜单文字颜色<!-- (01) -->：</span>
	<input class="leftTextColA color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="leftTextColA" name="leftTextColA" value="${empty leftTextColA ? '333333' : leftTextColA}"/>  
</div>

<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏二级菜单文字颜色<!-- (01) -->：</span>
	<input class="leftTextColB color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="leftTextColB" name="leftTextColB" value="${empty leftTextColB ? '333333' : leftTextColB}"/>  
</div>

<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏三级菜单文字颜色<!-- (01) -->：</span>
	<input class="leftTextColC color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="leftTextColC" name="leftTextColC" value="${empty leftTextColC ? '333333' : leftTextColC}"/>  
</div>
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">二级导航栏触发色<!-- (01,08) -->：</span>
	<input class="leftColorHovB color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="leftColorHovB" name="leftColorHovB" value="${empty leftColorHovB ? 'EEEEEE' : leftColorHovB}"/>  
</div>

<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">三级导航栏触发色<!-- (01,08) -->：</span>
	<input class="leftColorHovC color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="leftColorHovC" name="leftColorHovC" value="${empty leftColorHovC ? 'EEEEEE' : leftColorHovC}"/>  
</div>
</c:if>
<c:if test="${sessionScope.syym eq 'commons/main/main_01'}">
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">二级导航栏触发色<!-- (01,08) -->：</span>
	<input class="leftColorHovB color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="leftColorHovB" name="leftColorHovB" value="${empty leftColorHovB ? '2D3D56' : leftColorHovB}"/>  
</div>

<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">三级导航栏触发色<!-- (01,08) -->：</span>
	<input class="leftColorHovC color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="leftColorHovC" name="leftColorHovC" value="${empty leftColorHovC ? '2D3D56' : leftColorHovC}"/>  
</div>
</c:if>
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">面包屑导航文字颜色<!-- (01,07，08) -->：</span>
	<input class="contentCrumbs color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" value="${empty namKeys ? '949AA1' : namKeys}" name="namKeys"/>  
</div>

<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">主页切换菜单文字颜色<!-- (01,07，08) -->：</span>
	<input class="mainNavCol color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" value="${empty mainNavCol ? 'ACB2B8' : mainNavCol}" id="mainNavCol" name="mainNavCol"/>  
</div>

<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">主页切换菜单背景颜色<!-- (01,07，08) -->：</span>
	<input class="navMainBg color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" value="${empty navMainBg ? 'FAFAFA' : navMainBg}" id="navMainBg" name="navMainBg"/>  
</div>
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">页面内容背景颜色<!-- (01,07，08) -->：</span>
	<input class="contentBg color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" value="${empty contentBg ? 'FFFFFF' : contentBg}" id="contentBg" name="contentBg"/>  
</div>
</c:if>
<%--新增更改的颜色值-end---%>

<c:if test="${sessionScope.syym eq 'commons/main/main_01' or sessionScope.syym eq 'commons/main/main_11'}">
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">顶部边栏导航背景色<!-- (01,08右侧浮动栏目背景色) -->：</span>
	<input class="topColorRig color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;"  id="boxColorB" name="boxColorB" value="${empty boxColorB ? '74C2F2' : boxColorB}"/>  
</div>
</c:if>

<c:if test="${sessionScope.syym eq 'commons/main/main_01' or sessionScope.syym eq 'commons/main/main_11'}">
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">顶部边栏logo背景色<!-- (01) -->：</span>
	<input class="logoColor color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorC" name="boxColorC" value="${empty boxColorC ? '213047' : boxColorC}"/>  
</div>
</c:if>
<c:if test="${sessionScope.syym eq 'commons/main/main_01'}">
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏一级菜单背景色<!-- (01,07,08一级菜单背景色) -->：</span>
	<input class="leftColor color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorD" name="boxColorD" value="${empty boxColorD ? '374B63' : boxColorD}"/>  
</div>
</c:if>
<c:if test="${sessionScope.syym eq 'commons/main/main_11'}">
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏一级菜单背景色<!-- (01,07,08一级菜单背景色) -->：</span>
	<input class="leftColor color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorD" name="boxColorD" value="${empty boxColorD ? '2D3D56' : boxColorD}"/>  
</div>
</c:if>

<c:if test="${sessionScope.syym eq 'commons/main/main_01'}">
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏二级菜单背景色<!-- (01) -->：</span>
	<input class="leftColorSub color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorE" name="boxColorE" value="${empty boxColorE ? '213047' : boxColorE}"/>  
</div>
</c:if>
<c:if test="${sessionScope.syym eq 'commons/main/main_11'}">
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏二级菜单背景色<!-- (01) -->：</span>
	<input class="leftColorSub color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorE" name="boxColorE" value="${empty boxColorE ? 'F8F8F8' : boxColorE}"/>  
</div>
</c:if>
<c:if test="${sessionScope.syym eq 'commons/main/main_01'}">
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">一级导航栏触发色<!-- (01,08) -->：</span>
	<input class="leftColorHov color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorF" name="boxColorF" value="${empty boxColorF ? '2D3D56' : boxColorF}"/>  
</div>
</c:if>
<c:if test="${sessionScope.syym eq 'commons/main/main_01'}">
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏一级导航icon颜色<!-- (01) -->：</span>
	<input class="leftIconCol color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorG" name="boxColorG" value="${empty boxColorG ? '#50B3EE' : boxColorG}"/>  
</div>
</c:if>
<c:if test="${sessionScope.syym eq 'commons/main/main_11'}">
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏一级导航icon颜色<!-- (01) -->：</span>
	<input class="leftIconCol color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorG" name="boxColorG" value="${empty boxColorG ? '#333333' : boxColorG}"/>  
</div>
</c:if>

<c:if test="${sessionScope.syym eq 'commons/main/main_07'}">
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏一级菜单背景色<!-- (01,07,08一级菜单背景色) -->：</span>
	<input class="leftColor color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorD" name="boxColorD" value="${empty boxColorD ? '374B63' : boxColorD}"/>  
</div>
</c:if>
<c:if test="${sessionScope.syym eq 'commons/main/main_07'}">
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏一级菜单偶数列背景色<!-- (07) -->：</span>
	<input class="leftColorS color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorDd" name="boxColorDd" value="${empty boxColorDd ? '666' : boxColorDd}"/>  
</div>
</c:if>
<c:if test="${sessionScope.syym eq 'commons/main/main_07'}">
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">导航栏字体触发色<!-- (07,08) -->：</span>
	<input class="leftColorHovS color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorFf" name="boxColorFf" value="${empty boxColorFf ? 'FFFFFF' : boxColorFf}"/>  
</div>
</c:if>
<%--08二级背景换肤--%>
<c:if test="${sessionScope.syym eq 'commons/main/main_08'}">
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">顶部边栏导航背景色<!-- (01,08右侧浮动栏目背景色) -->：</span>
	<input class="topColorRig color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;"  id="boxColorB" name="boxColorB" value="${empty boxColorB ? '74C2F2' : boxColorB}"/>  
</div>
</c:if>
<c:if test="${sessionScope.syym eq 'commons/main/main_08'}">
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏一级菜单背景色<!-- (01,07,08一级菜单背景色) -->：</span>
	<input class="leftColor color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorD" name="boxColorD" value="${empty boxColorD ? '374B63' : boxColorD}"/>  
</div>
</c:if>
<c:if test="${sessionScope.syym eq 'commons/main/main_08'}">
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏一级菜单背景色<!-- (01,07,08一级菜单背景色) -->：</span>
	<input class="leftColor color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorD" name="boxColorD" value="${empty boxColorD ? 'FFFFFF' : boxColorD}"/>  
</div>
</c:if>
<c:if test="${sessionScope.syym eq 'commons/main/main_08'}">
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">导航栏二级菜单背景色<!-- (08) -->：</span>
	<input class="leftColorSubE color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorEe" name="boxColorEe" value="${empty boxColorEe ? 'transparent' : boxColorEe}"/>  
</div>
</c:if>
<c:if test="${sessionScope.syym eq 'commons/main/main_08'}">
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">一级导航栏触发色<!-- (01,08) -->：</span>
	<input class="leftColorHov color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorF" name="boxColorF" value="${empty boxColorF ? '2D3D56' : boxColorF}"/>  
</div>
</c:if>

<c:if test="${sessionScope.syym eq 'commons/main/main_08'}">
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">导航栏字体触发色<!-- (07,08) -->：</span>
	<input class="leftColorHovS color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorFf" name="boxColorFf" value="${empty boxColorFf ? 'F1B458' : boxColorFf}"/>  
</div>
</c:if>
<c:if test="${sessionScope.syym eq 'commons/main/main_08'}">
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">导航栏菜单列触发色<!-- (08) -->：</span>
	<input class="leftColorHoveS color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorFfs" name="boxColorFfs" value="${empty boxColorFfs ? '3371ad' : boxColorFfs}"/>  
</div>
</c:if>
<c:if test="${sessionScope.syym eq 'commons/main/main_08'}">
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏一级icon颜色<!-- (01) -->：</span>
	<input class="leftIconCol color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorG" name="boxColorG" value="${boxColorG}"/>  
</div>
</c:if>
<div class="butsea" style="padding-top:10px;overflow: hidden;">

	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">内容部分颜色<!-- (01,07，08) -->：</span>
	<input class="contentCol color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" value="${empty namKey ? '50B3EE' : namKey}" name="namKey"/>  
</div>
<div align="center">
<button style="background-color: #50B3EE;width: 60px;height: 35px;border-radius:5px;color: #ffffff;border-color: #F0F0F0;border: 2px" onclick="saveModel();return false;">保存</button>
<!-- <button style="background-color: #50B3EE;width: 60px;height: 35px;border-radius:5px;color: #ffffff;border-color: #F0F0F0;border: 2px" onclick="cancel();return false;">重置</button> -->
<button style="background-color: #50B3EE;width: 60px;height: 35px;border-radius:5px;color: #ffffff;border-color: #F0F0F0;border: 2px" onclick="goBackList();return false;">返回</button>
</div>
</form> 
    <input type="hidden" id="boxColorA1" name="boxColorA1" value="${boxColorA1}"/>
	<input type="hidden" id="boxColorB1" name="boxColorB1" value="${boxColorB1}"/>  
	<input type="hidden" id="boxColorC1" name="boxColorC1" value="${boxColorC1}"/>  
	<input type="hidden" id="boxColorD1" name="boxColorD1" value="${boxColorD1}"/>  
	<input type="hidden" id="boxColorE1" name="boxColorE1" value="${boxColorE1}"/>  
	<input type="hidden" id="boxColorF1" name="boxColorF1" value="${boxColorF1}"/>  
	<input type="hidden" id="boxColorG1" name="boxColorG1" value="${boxColorG1}"/>  
	<input type="hidden" id="boxColorDd1" name="boxColorDd1" value="${boxColorDd1}"/>  
	<input type="hidden" id="boxColorEe1" name="boxColorEe1" value="${boxColorEe1}"/>  
	<input type="hidden" id="boxColorFf1" name="boxColorFf1" value="${boxColorFf1}"/>  
	<input type="hidden" id="boxColorFfs1" name="boxColorFfs1" value="${boxColorFfs1}"/>  
	<input type="hidden" id="namKey1" value="${namKey1}" name="namKey1"/>
<%--	新增数值--%>
	
    <input type="hidden" id="topFontColor1" name="topFontColor1" value="${topFontColor1}"/>
	<input type="hidden" id="topFontColorR1" name="topFontColorR1" value="${topFontColorR1}"/>  
	<input type="hidden" id="topHovR1" name="topHovR1" value="${topHovR1}"/>  
	<input type="hidden" id="topFontLogo1" name="topFontLogo1" value="${topFontLogo1}"/>  
	<input type="hidden" id="navBtnBg1" name="navBtnBg1" value="${navBtnBg1}"/>  
	<input type="hidden" id="leftIconColB1" name="leftIconColB1" value="${leftIconColB1}"/>  
	<input type="hidden" id="leftIconColC1" name="leftIconColC1" value="${leftIconColC1}"/>  
	<input type="hidden" id="leftTextColA1" name="leftTextColA1" value="${leftTextColA1}"/>  
	<input type="hidden" id="leftTextColB1" name="leftTextColB1" value="${leftTextColB1}"/>  
	<input type="hidden" id="leftTextColC1" name="leftTextColC1" value="${leftTextColC1}"/>  
	<input type="hidden" id="leftColorHovB1" name="leftColorHovB1" value="${leftColorHovB1}"/>  
	<input type="hidden" id="leftColorHovC1" name="leftColorHovC1" value="${leftColorHovC1}"/>  
	<input type="hidden" id="mainNavCol1" name="mainNavCol1" value="${mainNavCol1}"/>  
	<input type="hidden" id="navMainBg1" name="navMainBg1" value="${navMainBg1}"/>  
	<input type="hidden" id="contentBg1" name="contentBg1" value="${contentBg1}"/>  
	<input type="hidden" id="namKeys1" value="${namKeys1}" name="namKeys1"/>  
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
            
<%--        	$(window.parent.document).find("head").children("style").append('#taskbar_right a:hover{background-color:'+colors.str2+'!important}');--%>
        	$(window.parent.document).find(".topbg").css("background-color",colors.str2);/*顶部行栏的颜色*/
        	$(window.parent.document).find(".switch-bd").css("background-color",colors.str2);/*顶部行栏下拉框的颜色*/
<%--        	$(window.parent.document).find("#taskbar_right").css("background-color",colors.str4[1]);/*顶部右侧导航颜色*/--%>
        	/*$(window.parent.document).find("#taskbar_right:before").css("background-color",colors.str3[0]);顶部右侧导航颜色*/
        	/*$(window.parent.document).find(".logo").css("background-color",colors.str3[0]);顶部栏目和左侧栏目交汇处的颜色*/

        },
        <%--新增更改的颜色值-star---%>
        
        topfont:function (){//顶部字体
        	$(window.parent.document).find(".welcome").css("color",colors.str2);/*顶部行字体栏的颜色*/

        },//顶部字体
        topfontR:function (){//顶部右边菜单字体
        	$(window.parent.document).find("head").children("style").append('#taskbar_right a{color:'+colors.str2+';}.switch-bd ul li{color:'+colors.str2+';}');

        },//顶部菜单字体

        topHovR:function (){//顶部右边菜单触发色
        	$(window.parent.document).find("head").children("style").append('#taskbar_right a:hover{background-color:'+colors.str2+'!important}.switch-bd ul li:hover{background-color:'+colors.str2+';}');

        },//顶部菜单触发色

        topfontLogo:function (){//顶部右边菜单字体
        	$(window.parent.document).find(".logo").css("color",colors.str2);/*顶部logo的颜色*/

        },//顶部logo字体

        navBtnBg:function (){//左侧栏“栏目导航条"颜色，导航收放按钮颜色
        	$(window.parent.document).find(".title-menu-left").children("span").css("background-color",colors.str2);/*左侧栏“栏目导航条"颜色*/
        	$(window.parent.document).find("#toggle").css("background-color",colors.str2);/*左侧栏导航收放按钮颜色*/
            },

         navMain:function (){//主页菜单tab
                
            $(window.parent.document).find("head").children("style").append('#taskbar #taskbar_center #tabs_container div A.tab{color:'+colors.str2+';}');
                },

         navMainBg:function (){//主页菜单tab背景色
                  
                	$(window.parent.document).find("head").children("style").append('#taskbar{background:'+colors.str2+'!important}');
                },

          contentBg:function (){
                	 $(window.parent.document).find("#center").css("background",colors.str2);/*页面内容背景颜色*/
                    },
               
                
        leftIconColB:function (){
			<%--布局模板11-star--%>
			if ('${sessionScope.syym}'=='commons/main/main_11'){
				window.parent.tabs_portal_0_iframe.iconColB(colors.str2);
			}else{
			<%--布局模板11-end--%>
       			window.parent.iframename0.iconColB(colors.str2);
			}
        },
        leftIconColC:function (){
			<%--布局模板11-star--%>
			if ('${sessionScope.syym}'=='commons/main/main_11'){
						window.parent.tabs_portal_0_iframe.iconColC(colors.str2);
			}else{
			<%--布局模板11-end--%>
	       		window.parent.iframename0.iconColC(colors.str2);
	       	}
        },
        leftTextColA:function (){
<%--布局模板11-star--%>
			if ('${sessionScope.syym}'=='commons/main/main_11'){
				window.parent.tabs_portal_0_iframe.textColA(colors.str2);
			}else{
<%--布局模板11-end--%>
	       		window.parent.iframename0.textColA(colors.str2);
	       	}
        },
        leftTextColB:function (){
			<%--布局模板11-star--%>
			if ('${sessionScope.syym}'=='commons/main/main_11'){
				window.parent.tabs_portal_0_iframe.textColB(colors.str2);
			}else{
			<%--布局模板11-end--%>
       			window.parent.iframename0.textColB(colors.str2);
       		}
        },
        leftTextColC:function (){
<%--布局模板11-star--%>
			if ('${sessionScope.syym}'=='commons/main/main_11'){
				window.parent.tabs_portal_0_iframe.textColC(colors.str2);
			}else{
<%--布局模板11-end--%>
 		      	window.parent.iframename0.textColC(colors.str2);
			}
        },
		leftColorHovB:function (){
	<%--布局模板11-star--%>
			if ('${sessionScope.syym}'=='commons/main/main_11'){
				window.parent.tabs_portal_0_iframe.txsB(colors.str2);
	<%--布局模板11-end--%>
			}else{
	   			window.parent.iframename0.txsB(colors.str2);
	   		}
        },
		leftColorHovC:function (){
<%--布局模板11-star--%>
			if ('${sessionScope.syym}'=='commons/main/main_11'){
				window.parent.tabs_portal_0_iframe.txsC(colors.str2);
			<%--布局模板11-end--%>
			}else{
	   			window.parent.iframename0.txsC(colors.str2);
	   		}
        },

        
        <%--新增更改的颜色值-end---%>
        
        toprig:function (){
        	$(window.parent.document).find("head").children("style").append('#taskbar_right:before{border-top-color:'+colors.str2+'!important}');
        	$(window.parent.document).find("#site-nav .switch-bd").css("background-color",colors.str2);/*顶部行下拉栏的背景颜色*/
<%--        	$(window.parent.document).find(".switch-bd").css("background-color",colors.str4[0]);/*顶部行栏下拉框的颜色*/--%>
        	$(window.parent.document).find("#taskbar_right").css("background-color",colors.str2);/*顶部右侧导航颜色*/
        	/*$(window.parent.document).find("#taskbar_right:before").css("background-color",colors.str3[0]);顶部右侧导航颜色*/
        	/*$(window.parent.document).find(".logo").css("background-color",colors.str3[0]);顶部栏目和左侧栏目交汇处的颜色*/

        },
        logoColor:function (){
        	$(window.parent.document).find(".logo").css("background-color",colors.str2);/*顶部栏目和左侧栏目交汇处的颜色*/

        },
        leftColor:function (){
        	<%--布局模板11-star--%>
        	if ('${sessionScope.syym}'=='commons/main/main_11'){
        		window.parent.tabs_portal_0_iframe.oneNavBg(colors.str2);
        	};
        	<%--布局模板11-end--%>
    		$(window.parent.document).find("head").children("style").append('#taskbar #taskbar_center #tabs_container div.selected{background-color:'+colors.str2+'!important}');
<%--        	$(window.parent.document).find(".logo").css("background-color",colors.str3[0]);/*顶部栏目和左侧栏目交汇处的颜色*/--%>
        	$(window.parent.document).find("#skin-select").css("background-color",colors.str2);/*左侧栏颜色*/
        	$(window.parent.document).find("#taskbar").css("border-color",colors.str2);/*tab切换栏目边框颜色*/
<%--        	$(window.parent.document).find(".title-menu-left").children("span").css("background-color",colors.str2);/*左侧栏“栏目导航条"颜色*/--%>
<%--        	$(window.parent.document).find("#toggle").css("background-color",colors.str2);/*左侧栏导航收放按钮颜色*/--%>
<%--        	$(window.parent.document).find("#skin-warp").find("i").css("color",colors.str3[0]);/*触发色边框箭头颜色*/--%>
<%--            $(window.parent.document).find("ul.topnav").children("ol").children("li").children("a").css("background-color",colors.str3[0]);    /*左侧栏导航一级收起栏目底色颜色*/--%>
        },
<%--        07菜单偶数列背景--%>
        leftColorS:function (){
            
        	window.parent.iframename0.sevenLeft(colors.str2);
       },
        leftColorSub:function (){
<%--布局模板11-star--%>
			if ('${sessionScope.syym}'=='commons/main/main_11'){
				window.parent.tabs_portal_0_iframe.test(colors.str2);
			}else{
<%--布局模板11-end--%>
    			window.parent.iframename0.test(colors.str2);
    		}
<%--    		$(window.parent.document).find("head").children("style").append('#taskbar #taskbar_center #tabs_container div.selected{background-color:'+colors.str3[0]+'!important}');--%>
<%--        	$(window.parent.document).find(".logo").css("background-color",colors.str3[0]);/*顶部栏目和左侧栏目交汇处的颜色*/--%>
<%--        	$(window.parent.document).find("#skin-select").css("background-color",colors.str3[1]);/*左侧栏颜色*/--%>
        	
<%--        	$(window.parent.document).find("#toggle").css("background-color",colors.str3[2]);/*左侧栏导航收放按钮颜色*/--%>
<%--        	$(window.parent.document).find("#skin-warp").find("i").css("color",colors.str3[0]);/*触发色边框箭头颜色*/--%>
<%--            $(window.parent.document).find("ul.topnav").children("ol").children("li").children("a").css("background-color",colors.str3[0]);    /*左侧栏导航一级收起栏目底色颜色*/--%>
        },
<%--        08二级菜单背景--%>
        leftColorSubE:function (){

<%--        	$(window.parent.document).find("#iframename0").css("background-color",colors.str2);--%>
        	window.parent.iframename0.bgtowS(colors.str2);
        },
		leftColorHov:function (){
		if ('${sessionScope.syym}'=='commons/main/main_01'){
     		window.parent.iframename0.txs(colors.str2);
     	}	
        },
<%--        07字体触发--%>
		leftColorHovS:function (){

    		window.parent.iframename0.txsS(colors.str2);
        },
<%--        07菜单列触发--%>
		leftColorHoveS:function (){

    		window.parent.iframename0.hoveS(colors.str2);
        },
        leftIconCol:function (){
<%--布局模板11-star--%>
			if ('${sessionScope.syym}'=='commons/main/main_11'){
				window.parent.tabs_portal_0_iframe.iconCol(colors.str2);
			}else{
<%--布局模板11-end--%>
    			window.parent.iframename0.iconCol(colors.str2);
    		}
        },
        colclick:function (){
        	$(".topColor").on("change",function (){
            	document.skinform.action = '<%=path%>/skin/saveSkin1';
		       // $('#skinform').ajaxSubmit(function(r){
		       // });
        		colors.colArray(".topColor");
        		colors.topbox();
            	});

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
                     	
<%--                 		//换肤效果--%>
<%--                     	 function contentCol(){--%>
<%--                     		 window.parent.iframe.asa();--%>
<%--                     		 };--%>
                    
        	<%--新增更改的颜色值-end---%>
        	
        	$(".topColorRig").on("change",function (){
        		document.skinform.action = '<%=path%>/skin/saveSkin1';
		        //$('#skinform').ajaxSubmit(function(r){
		        //});
        		colors.colArray(".topColorRig");
        		colors.toprig();
            	});
        	$(".logoColor").on("change",function (){
        		document.skinform.action = '<%=path%>/skin/saveSkin1';
		       // $('#skinform').ajaxSubmit(function(r){
		       // });
        		colors.colArray(".logoColor");
        		colors.logoColor();
            	});
        	$(".leftColor").on("change",function (){
        		document.skinform.action = '<%=path%>/skin/saveSkin1';
		       // $('#skinform').ajaxSubmit(function(r){
		       // });
        		colors.colArray(".leftColor");
        		colors.leftColor();
            	});
            	$(".leftColorS").on("change",function (){
            		document.skinform.action = '<%=path%>/skin/saveSkin1';
    		       // $('#skinform').ajaxSubmit(function(r){
    		       // });
            		colors.colArray(".leftColorS");
            		colors.leftColorS();
                	});
        	$(".leftColorSub").on("change",function (){
        		document.skinform.action = '<%=path%>/skin/saveSkin1';
		       // $('#skinform').ajaxSubmit(function(r){
		       // });
        		colors.colArray(".leftColorSub");
        		colors.leftColorSub();
            	});
        	//08二级菜单背景
        	$(".leftColorSubE").on("change",function (){
        		document.skinform.action = '<%=path%>/skin/saveSkin1';
		       // $('#skinform').ajaxSubmit(function(r){
		       // });
        		colors.colArray(".leftColorSubE");
        		colors.leftColorSubE();
            	});
        	$(".leftColorHov").on("change",function (){
        		document.skinform.action = '<%=path%>/skin/saveSkin1';
		       // $('#skinform').ajaxSubmit(function(r){
		       // });
        		colors.colArray(".leftColorHov");
        		colors.leftColorHov();
        		
            	});
        	
        	$(".leftColorHovS").on("change",function (){
        		document.skinform.action = '<%=path%>/skin/saveSkin1';
		       // $('#skinform').ajaxSubmit(function(r){
		       // });
        		colors.colArray(".leftColorHovS");
        		colors.leftColorHovS();
        		
            	});
        	$(".leftColorHoveS").on("change",function (){
        		document.skinform.action = '<%=path%>/skin/saveSkin1';
		       // $('#skinform').ajaxSubmit(function(r){
		       // });
        		colors.colArray(".leftColorHoveS");
        		colors.leftColorHoveS();
        		
            	});
            $(".leftIconCol").on("change",function (){
            	document.skinform.action = '<%=path%>/skin/saveSkin1';
		       // $('#skinform').ajaxSubmit(function(r){
		       // });
            		colors.colArray(".leftIconCol");
            		colors.leftIconCol();
                });
            $(".contentCol,.contentCrumbs").on("change",function (){
            	window.parent.colRwLoc();
            });
        }
    };
    $(function (){
    	colors.colclick();
        })
    
    </script>
</body>
</html>


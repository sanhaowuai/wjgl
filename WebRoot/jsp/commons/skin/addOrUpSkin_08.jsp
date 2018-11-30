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
// 				colors.str2="#"+$("#boxColorA1").val();
//         		colors.topbox();
            	
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
            	
            	bgColor();
           		//页面内按钮与面包屑颜色
           		window.parent.colRwLoc();
           		var nkaa='$("#namKey1").val()';
           		returnA(nkaa);
            	
         }else{
          		colors.str2="#50b3ee";
        		colors.topbox();
        		
        		colors.str2="#74C2F2";
        		colors.toprig();
      
				colors.str2="#213047";
        		colors.leftColorSubE();

        		colors.str2="#2d3d56";
        		colors.leftColorHov();
        		
        		colors.str2="#374B63";
        		colors.leftColor();
        		
            	colors.str2='transparent';
            	colors.leftColorSubE();//08
            	
            	colors.str2="#"+'f1b458';
            	colors.leftColorHovS();//078
				
            	colors.str2="#"+'3371ad';
            	colors.leftColorHoveS();//078
            	
            	bgColor();
           		//页面内按钮与面包屑颜色
           		window.parent.colRwLoc();
           		var nkaa='50b3ee';
           		returnA(nkaa);
            	
         }   
       setTimeout(querySkinList(), 500);
		
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
	function querySkinList(){
		document.skinform.action="<%=path%>/skin/querySkinList";
		document.skinform.submit();
	}
</script>
</head>

<body>
<form method="post" id="skinform" name="skinform">
<input type="hidden" name="skinId" id="skinId" value="${skinId}"/>
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">模板名称：</span>
    <input type="text" id="skinName" name="skinName" value="${skinName}"/>
</div>
<%-- <div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">顶部栏背景色<!-- (01,07,08右侧浮动栏目触发色) -->：</span>
    <input class="topColor color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;"  id="boxColorA" name="boxColorA" value="${boxColorA}"/>
</div> --%>
<c:if test="${sessionScope.syym eq 'commons/main/main_01' or sessionScope.syym eq 'commons/main/main_08'}">
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">顶部边栏导航背景色<!-- (01,08右侧浮动栏目背景色) -->：</span>
	<input class="topColorRig color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;"  id="boxColorB" name="boxColorB" value="${empty boxColorB ? '74C2F2' : boxColorB}"/>  
</div>
</c:if>
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">左侧边栏一级菜单背景色<!-- (01,07,08一级菜单背景色) -->：</span>
	<input class="leftColor color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorD" name="boxColorD" value="${empty boxColorD ? '213047' : boxColorD}"/>  
</div>
<%--08二级背景换肤--%>
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">导航栏二级菜单背景色<!-- (08) -->：</span>
	<input class="leftColorSubE color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorEe" name="boxColorEe" value="${empty boxColorEe ? '5887B4' : boxColorEe}"/>  
</div>
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">一级导航栏触发色<!-- (01,08) -->：</span>
	<input class="leftColorHov color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorF" name="boxColorF" value="${empty boxColor ? '2D3D56' : FboxColorF}"/>  
</div>
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">导航栏字体触发色<!-- (07,08) -->：</span>
	<input class="leftColorHovS color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorFf" name="boxColorFf" value="${empty boxColorFf ? 'F1B458' : boxColorFf}"/>  
</div>
<div class="butsea" style="padding-top:10px;overflow: hidden;">
	<span style="display:block;float:left;width:30%;text-align:right;line-height:35px;">导航栏菜单列触发色<!-- (08) -->：</span>
	<input class="leftColorHoveS color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorFfs" name="boxColorFfs" value="${empty boxColorFfs ? '2C68A0' : boxColorFfs}"/>  
</div>

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
<%--        	$(window.parent.document).find("#toggle").css("background-color",colors.str2);/*左侧栏导航收放按钮颜色*/--%>
<%--        	$(window.parent.document).find("#skin-warp").find("i").css("color",colors.str3[0]);/*触发色边框箭头颜色*/--%>
<%--            $(window.parent.document).find("ul.topnav").children("ol").children("li").children("a").css("background-color",colors.str3[0]);    /*左侧栏导航一级收起栏目底色颜色*/--%>
        },
<%--        07菜单偶数列背景--%>
        leftColorS:function (){
        	window.parent.iframename0.sevenLeft(colors.str2);
       },
        leftColorSub:function (){
        	
    		window.parent.iframename0.test(colors.str2);
<%--    		$(window.parent.document).find("head").children("style").append('#taskbar #taskbar_center #tabs_container div.selected{background-color:'+colors.str3[0]+'!important}');--%>
<%--        	$(window.parent.document).find(".logo").css("background-color",colors.str3[0]);/*顶部栏目和左侧栏目交汇处的颜色*/--%>
<%--        	$(window.parent.document).find("#skin-select").css("background-color",colors.str3[1]);/*左侧栏颜色*/--%>
        	$(window.parent.document).find(".title-menu-left").children("span").css("background-color",colors.str2);/*左侧栏“栏目导航条"颜色*/
        	$(window.parent.document).find("#toggle").css("background-color",colors.str2);/*左侧栏导航收放按钮颜色*/
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
        	
    		window.parent.iframename0.txs(colors.str2);
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
    		window.parent.iframename0.iconCol(colors.str2);
        },
        colclick:function (){
        	$(".topColor").on("change",function (){
            	document.skinform.action = '<%=path%>/skin/saveSkin1';
		       // $('#skinform').ajaxSubmit(function(r){
		       // });
        		colors.colArray(".topColor");
        		colors.topbox();
            	});
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
<%--            $(".contentCol").on("change",function (){--%>
<%--        		colors.colArray(".contentCol");--%>
<%--        		contentCol(colors.str2);--%>
<%--            });--%>
        }
    };
    $(function (){
    	colors.colclick();
        })
    
    </script>
</body>
</html>


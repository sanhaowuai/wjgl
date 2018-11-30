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
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9;IE=8;"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>北京赢科后台管理系统</title>
<jsp:include page="../../include/css-main-include.jsp"></jsp:include>


<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.3.min.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jquery.nicescroll.min.js"></script> 
<script type="text/javascript" src="<%=path%>/resources/js/common/menu/jquery.wysiwyg.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/menu/stylesheetToggle.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/menu/seeui.js"></script> 
<style></style>
<script type="text/javascript"> 
$(function(){
	//滚动条
	//$("#menus").jScrollPane();
	//$("#tree-wrap").niceScroll("#meus_parten",{cursorcolor:"#ccd7b3",cursoropacitymax:0.7,boxzoom:true,touchbehavior:true});  // Second scrollable DIV
    $("body").niceScroll({cursorcolor:"#2e4052",cursoropacitymax:0.7,boxzoom:true,touchbehavior:true});
    //$("#tree-wrap").getNiceScroll(0).doScrollTop($("#meus_parten").height(), 500);

});
 function menuoffset(v){
		var h=$(v).offset().top;
		   $("html,body").animate({scrollTop:h},1000);	
		
	}

function initMenu() {
	  $('#menus ol').hide(); 
	  $('#menus li a').click(
	    function() {
	      var checkElement = $(this).next();
	      if((checkElement.is('.submenu')) && (checkElement.is(':visible'))) { 
		        //$('#menus ol:visible').slideUp(500);
		        $('#menus .submenu:visible').hide();
		        $(this).find('img').attr('src','<%=path%>/resources/style/blue/images/plus.png');
		        $('#menus li').removeClass('expanded');
	        	return false;
	        }
	        
	      if((checkElement.is('.submenu')) && (!checkElement.is(':visible'))) { 
	        $('#menus .submenu:visible').hide();
	        $('#menus li a').find('img').attr('src','<%=path%>/resources/style/blue/images/plus.png');
		    $(this).find('img').attr('src','<%=path%>/resources/style/blue/images/minus.png');
	        $('#menus li').removeClass('expanded');
	        checkElement.show();
	        $(this.parentNode).addClass('expanded');
	        $("body").getNiceScroll().resize();
	        return false;
	        }

	      if((checkElement.is('.submenu2')) && (checkElement.is(':visible'))) { 
		        //$('#menus ol:visible').slideUp(500);
		        $('#menus .submenu2:visible').hide();
		        $(this).find('b').text("+");
		        $('#menus li').removeClass('expanded');
	        	return false;
	        }
	        
	      if((checkElement.is('.submenu2')) && (!checkElement.is(':visible'))) { 
	        $('#menus .submenu2:visible').hide();
	        $('#menus li a').find('b').text("+");
	        $(this).find('b').text("-");
	        $('#menus li').removeClass('expanded');
	        checkElement.show();
	        $(this.parentNode).addClass('expanded');
	        $("body").getNiceScroll().resize();
	        return false;
	        }

	        
	      }
	    );
	  	$('#menus li a').hover(
			function(){
				var text = $(this).children('span').text();
				var top = $(this).offset().top;
				var heitop = $(document).scrollTop();
				top = top-heitop;
				window.parent.window.showTitle(top,text);
			},function(){
				window.parent.window.$('#skin-dinwei').stop(true,false).hide();
				window.parent.window.$('#skin-dinwei').animate({"left":"50px"},100);
			}
		)
		$('#menus li ol li a').hover(
			function(){
				var text = $(this).children('span').text();
				var top = $(this).offset().top;
				var heitop = $(document).scrollTop();
				top = top-heitop;
				window.parent.window.showTitle(top,text);
			},function(){
				window.parent.window.$('#skin-dinwei').animate({"left":"50px"},100);
				window.parent.window.$('#skin-dinwei').stop(true,false).hide();
			}
		)
	  }

$(document).ready(function() {initMenu();});
	function hys(a){
		$("a[id^='cddm']").removeAttr("class");
		//$(a).addClass("selected");
	};

	function spanHide(){//缩小
		$('span').css({"display":"none"});
		$('#menus').find('i').css({"left":"-14px"});
		$('#menus').find('h4').css({"display":"none"});
		$('#menus ol').find('i').css({"left":"-44px","color":"#89aace"});
		$('#menus .submenu2').find('i').css({"left":"-74px","color":"#fff"});
	};

	function spanShow(){//宽的
		$('span').css({"display":"inline-block"});
		$('#menus').find('i').css({"left":"-10px"});
		$('#menus').find('h4').css({"display":"block"});
		$('#menus ol').find('i').css({"left":"-10px","color":"#50b3ee"});
		$('#menus ol').find('a').css({"color":"rgba(255, 255, 255, 0.9) !important"});
	};

	function test(colorNas){
		$("head").children("style").append('ul.topnav ol{background:'+colorNas+'} ul.topnav ol li a{background: '+colorNas+';}')
	};
	function iconCol(colorNas){//左侧icon一级

		$("head").children("style").append('ul#menus>li>a i{color:'+colorNas+'}')
	};
	function iconColB(colorNas){//左侧icon二级
		$("head").children("style").append('ul#menus ol.submenu>li>a.on{color:'+colorNas+'!important}ul#menus ol.submenu>li>a:hover{color:'+colorNas+'!important} ul#menus ol.submenu>li>a:hover span{color:'+colorNas+'} ul#menus ol.submenu>li>a i{color:'+colorNas+'}ul#menus ol.submenu>li>a:hover{border-left-color: '+colorNas+';} ul#menus ol.submenu>li>a:hover:after{border-bottom-color:'+colorNas+';}ul#menus ol.submenu>li>a.on span{color:'+colorNas+'} ul#menus ol.submenu>li>a.on{border-left-color: '+colorNas+';} ul#menus ol.submenu>li>a.on:after{border-bottom-color:'+colorNas+';}')
	};
	function iconColC(colorNas){//左侧icon三级
		$("head").children("style").append('ul#menus ol.submenu ol.submenu2>li>a:hover{color:'+colorNas+'!important} ul#menus ol.submenu ol.submenu2>li>a:hover span{color:'+colorNas+'} ul#menus ol.submenu ol.submenu2>li>a i{color:'+colorNas+'}ul#menus ol.submenu ol.submenu2>li>a:hover{border-left-color: '+colorNas+';} ul#menus ol.submenu ol.submenu2>li>a:hover:after{border-bottom-color:'+colorNas+';}ul#menus ol.submenu ol.submenu2>li>a.on{color:'+colorNas+'!important} ul#menus ol.submenu ol.submenu2>li>a.on span{color:'+colorNas+'} ul#menus ol.submenu ol.submenu2>li>a.on{border-left-color: '+colorNas+';} ul#menus ol.submenu ol.submenu2>li>a.on:after{border-bottom-color:'+colorNas+';}')

		};
	function textColA(colorNas){//左侧一级菜单文字颜色
		$("head").children("style").append('ul#menus>li>a{color:'+colorNas+'!important}')
	};
	function textColB(colorNas){//左侧二级菜单文字颜色
		$("head").children("style").append('ul#menus ol.submenu>li>a{color:'+colorNas+'!important}')
	};
	function textColC(colorNas){//左侧三级菜单文字颜色
		$("head").children("style").append('ul#menus ol.submenu ol.submenu2>li>a{color:'+colorNas+'!important}')
	};
	
	function txs(colorNas){
		$("head").children("style").append('ul.topnav>li>a:hover{background-color:'+colorNas+';}')
	};
	function txsB(colorNas){
		$("head").children("style").append('ul.topnav ol.submenu>li>a:hover{background: '+colorNas+';}ul.topnav ol.submenu>li>a.on{background: '+colorNas+';}')
	};
	function txsC(colorNas){
		$("head").children("style").append('ul.topnav ol.submenu>li ol li a:hover{background: '+colorNas+';}')
	};
	function oneNavBg(colorNas){
		$("head").children("style").append('ul.topnav>li>a{background: '+colorNas+';}')
	};
<%--	$(function (){--%>
<%--		var colors={--%>
<%--	 		        str1:null,--%>
<%--	 		        str2:null,--%>
<%--	 		        str3:null,--%>
<%--	 		        str4:null,--%>
<%--	 		        loadtop:function (){--%>
<%--	 			colors.str1="top";--%>
<%--	 		    colors.str3=['#ff6b6b','#ff8989','#fdb2b2','#5997d5'];--%>
<%--	 		},--%>
<%--	 		loadleft:function (){--%>
<%--	 			colors.str1="left";--%>
<%--	 		    colors.str3=['#304e6c','#4c6e90'];--%>
<%--	 		},--%>
<%--	 		huoqutop:function (){//加载获取变量判断变换顶部颜色--%>
<%--	 		            colors.loadtop();--%>
<%--	 		            if(colors.str1=="top"){--%>
<%--	 		               --%>
<%--	 		                colors.topcol();--%>
<%--	 		            }else if(colors.str1=="left"){--%>
<%--	 		                colors.leftcol();--%>
<%--	 		            }--%>
<%--	 		        },--%>
<%--	 		huoquleft:function (){//加载获取变量判断变换左部颜色--%>
<%--	 		            colors.loadleft();--%>
<%--	 		            if(colors.str1=="top"){--%>
<%--	 		               --%>
<%--	 		                colors.topcol();--%>
<%--	 		            }else if(colors.str1=="left"){--%>
<%--	 		                colors.leftcol();--%>
<%--	 		            }--%>
<%--	 		        },--%>
<%--	 		        topcol:function (){--%>
<%--	 		        	$(window.parent.document).find("head").children("style").append('#taskbar_right:before{border-top-color:'+colors.str3[2]+'!important} #taskbar_right a:hover{background-color:'+colors.str3[0]+'!important}');--%>
<%--	 		        	$(window.parent.document).find(".topbg").css("background-color",colors.str3[0]);/*顶部行栏的颜色*/--%>
<%--	 		        	$(window.parent.document).find(".switch-bd").css("background-color",colors.str3[0]);/*顶部行栏下拉框的颜色*/--%>
<%--	 		        	$(window.parent.document).find("#taskbar_right").css("background-color",colors.str3[2]);/*顶部右侧导航颜色*/--%>
<%--	 		        	/*$(window.parent.document).find("#taskbar_right:before").css("background-color",colors.str3[0]);顶部右侧导航颜色*/--%>
<%--	 		        	/*$(window.parent.document).find(".logo").css("background-color",colors.str3[0]);顶部栏目和左侧栏目交汇处的颜色*/--%>
<%----%>
<%--	 		        },--%>
<%--	 		        leftcol:function (){--%>
<%--	 		        	test(colors.str3);--%>
<%--	 		    		$(window.parent.document).find("head").children("style").append('#taskbar #taskbar_center #tabs_container div.selected{background-color:'+colors.str3[0]+'!important}');--%>
<%--	 		        	$(window.parent.document).find(".logo").css("background-color",colors.str3[0]);/*顶部栏目和左侧栏目交汇处的颜色*/--%>
<%--	 		        	$(window.parent.document).find("#skin-select").css("background-color",colors.str3[1]);/*左侧栏颜色*/--%>
<%--	 		        	$(window.parent.document).find(".title-menu-left").children("span").css("background-color",colors.str3[0]);/*左侧栏“栏目导航条"颜色*/--%>
<%--	 		        	$(window.parent.document).find("#toggle").css("background-color",colors.str3[2]);/*左侧栏导航收放按钮颜色*/--%>
<%--	 		        },--%>
<%--	 		        colclickTop:function (){--%>
<%--	 		            --%>
<%--	 		                colors.huoqutop();--%>
<%--	 		            //加载完成顶部--%>
<%--	 		        },--%>
<%--	 		        colclickLeft:function (){--%>
<%--	 		            --%>
<%--	 		                colors.huoquleft();--%>
<%--	 		              //加载完成左部--%>
<%--	 		        }--%>
<%--	 		    };--%>
<%--		colors.colclickTop();--%>
<%--		colors.colclickLeft();--%>
<%--		});--%>
var colorss={
        str1:null,
        str2:null,
        str3:null,
        str4:null,
        colArray:function (){

            colorss.str2=colorss.str4;
           
        },
        topbox:function (){
//        	$(window.parent.document).find("head").children("style").append('#taskbar_right a:hover{background-color:'+colorss.str2+'!important}');
       	$(window.parent.document).find(".topbg").css("background-color",colorss.str2);/*顶部行栏的颜色*/
        	$(window.parent.document).find(".switch-bd").css("background-color",colorss.str2);/*顶部行栏下拉框的颜色*/
<%--        	$(window.parent.document).find("#taskbar_right").css("background-color",colors.str4[1]);/*顶部右侧导航颜色*/--%>
        	/*$(window.parent.document).find("#taskbar_right:before").css("background-color",colors.str3[0]);顶部右侧导航颜色*/
        	/*$(window.parent.document).find(".logo").css("background-color",colors.str3[0]);顶部栏目和左侧栏目交汇处的颜色*/

        },

 <%--新增更改的颜色值-star---%>
        
        topfont:function (){//顶部字体
        	$(window.parent.document).find(".welcome").css("color",colorss.str2);/*顶部行字体栏的颜色*/

        },//顶部字体
        topfontR:function (){//顶部右边菜单字体
        	$(window.parent.document).find("head").children("style").append('#taskbar_right a{color:'+colorss.str2+';}.switch-bd ul li{color:'+colorss.str2+'!important}');

        },//顶部菜单字体
		topHovR:function (){//顶部右边菜单触发色
        	$(window.parent.document).find("head").children("style").append('#taskbar_right a:hover{background-color:'+colorss.str2+'!important}.switch-bd ul li:hover{background-color:'+colorss.str2+';}');

        },//顶部菜单触发色
        topfontLogo:function (){//顶部右边菜单字体
        	$(window.parent.document).find(".logo").css("color",colorss.str2);/*顶部logo的颜色*/

        },//顶部logo字体

        navBtnBg:function (){//左侧栏“栏目导航条"颜色，导航收放按钮颜色
        	$(window.parent.document).find(".title-menu-left").children("span").css("background-color",colorss.str2);/*左侧栏“栏目导航条"颜色*/
        	$(window.parent.document).find("#toggle").css("background-color",colorss.str2);/*左侧栏导航收放按钮颜色*/
            },

         navMain:function (){//主页菜单tab
                
            $(window.parent.document).find("head").children("style").append('#taskbar #taskbar_center #tabs_container div A.tab{color:'+colorss.str2+';}');
                },

         navMainBg:function (){//主页菜单tab背景色
                  
                	$(window.parent.document).find("head").children("style").append('#taskbar{background:'+colorss.str2+'!important}');
                },

          contentBg:function (){
                	 $(window.parent.document).find("#center").css("background",colorss.str2);/*页面内容背景颜色*/
                    },
               
                
        leftIconColB:function (){
            <%--布局模板11-star--%>
            iconColB(colorss.str2);
            			
        },
        leftIconColC:function (){
			<%--布局模板11-star--%>
			iconColC(colorss.str2);
	       	
        },
        leftTextColA:function (){
<%--布局模板11-star--%>
			textColA(colorss.str2);
	       	
        },
        leftTextColB:function (){
			<%--布局模板11-star--%>
			textColB(colorss.str2);
       		
        },
        leftTextColC:function (){
<%--布局模板11-star--%>
			textColC(colorss.str2);
			
        },
		leftColorHovB:function (){
	<%--布局模板11-star--%>
			txsB(colorss.str2);
	   		
        },
		leftColorHovC:function (){
<%--布局模板11-star--%>
			txsC(colorss.str2);
	   		
        },

        
        <%--新增更改的颜色值-end---%>    
    
        toprig:function (){
            
        	$(window.parent.document).find("head").children("style").append('#taskbar_right:before{border-top-color:'+colorss.str2+'!important}');
<%--        	$(window.parent.document).find(".topbg").css("background-color",colors.str4[0]);/*顶部行栏的颜色*/--%>
<%--        	$(window.parent.document).find(".switch-bd").css("background-color",colors.str4[0]);/*顶部行栏下拉框的颜色*/--%>
        	$(window.parent.document).find("#taskbar_right").css("background-color",colorss.str2);/*顶部右侧导航颜色*/
        	/*$(window.parent.document).find("#taskbar_right:before").css("background-color",colors.str3[0]);顶部右侧导航颜色*/
        	/*$(window.parent.document).find(".logo").css("background-color",colors.str3[0]);顶部栏目和左侧栏目交汇处的颜色*/

        },
        logoColor:function (){
        	$(window.parent.document).find(".logo").css("background-color",colorss.str2);/*顶部栏目和左侧栏目交汇处的颜色*/

        },
        leftColor:function (){
    		$(window.parent.document).find("head").children("style").append('#taskbar #taskbar_center #tabs_container div.selected{background-color:'+colorss.str2+'!important}');
<%--        	$(window.parent.document).find(".logo").css("background-color",colors.str3[0]);/*顶部栏目和左侧栏目交汇处的颜色*/--%>
        	$(window.parent.document).find("#skin-select").css("background-color",colorss.str2);/*左侧栏颜色*/
<%--        	$(window.parent.document).find(".title-menu-left").children("span").css("background-color",colors.str2);/*左侧栏“栏目导航条"颜色*/--%>
        	
<%--        	$(window.parent.document).find("#skin-warp").find("i").css("color",colors.str3[0]);/*触发色边框箭头颜色*/--%>
<%--            $(window.parent.document).find("ul.topnav").children("ol").children("li").children("a").css("background-color",colors.str3[0]);    /*左侧栏导航一级收起栏目底色颜色*/--%>
        },
        leftColorSub:function (){
        	
    		test(colorss.str2);
<%--    		$(window.parent.document).find("head").children("style").append('#taskbar #taskbar_center #tabs_container div.selected{background-color:'+colors.str3[0]+'!important}');--%>
<%--        	$(window.parent.document).find(".logo").css("background-color",colors.str3[0]);/*顶部栏目和左侧栏目交汇处的颜色*/--%>
<%--        	$(window.parent.document).find("#skin-select").css("background-color",colors.str3[1]);/*左侧栏颜色*/--%>
        	$(window.parent.document).find(".title-menu-left").children("span").css("background-color",colorss.str2);/*左侧栏“栏目导航条"颜色*/
        	$(window.parent.document).find("#toggle").css("background-color",colorss.str2);/*左侧栏导航收放按钮颜色*/
<%--        	$(window.parent.document).find("#toggle").css("background-color",colors.str3[2]);/*左侧栏导航收放按钮颜色*/--%>
<%--        	$(window.parent.document).find("#skin-warp").find("i").css("color",colors.str3[0]);/*触发色边框箭头颜色*/--%>
<%--            $(window.parent.document).find("ul.topnav").children("ol").children("li").children("a").css("background-color",colors.str3[0]);    /*左侧栏导航一级收起栏目底色颜色*/--%>
        },
		leftColorHov:function (){
        	
    		txs(colorss.str2);
        },
        leftIconCol:function (){
    		iconCol(colorss.str2);
        },
        colclick:function (){
            
        	if($(".boxColorA").val()!==""){
        		colorss.str4="#"+$(".boxColorA").val()
            		colorss.colArray();
            		colorss.topbox();
            	};
        		
        		if($(".boxColorB").val()!==""){
        			colorss.str4="#"+$(".boxColorB").val()
                		colorss.colArray();
                		colorss.toprig();
            	};
        		
        		if($(".boxColorC").val()!==""){
        			colorss.str4="#"+$(".boxColorC").val()
                		colorss.colArray();
                		colorss.logoColor();
            	};
        		
        		if($(".boxColorD").val()!==""){
        			colorss.str4="#"+$(".boxColorD").val()
                		colorss.colArray();
                		colorss.leftColor();
            	};
        		
        		if($(".boxColorE").val()!==""){
        			colorss.str4="#"+$(".boxColorE").val()
                		colorss.colArray();
                		colorss.leftColorSub();
            	};
        		
        		if($(".boxColorF").val()!==""){
        			colorss.str4="#"+$(".boxColorF").val()
                		colorss.colArray();
                		colorss.leftColorHov();
            	}
        		
        		if($(".boxColorG").val()!==""){
        			colorss.str4="#"+$(".boxColorG").val()
                		colorss.colArray();
                		colorss.leftIconCol();
            	};
            	
                <%--新增更改的颜色值-star---%>
        		if($(".topFontColor").val()!==""){
			        colorss.str4="#"+$(".topFontColor").val()
	        		colorss.colArray();
	        		colorss.topfont();
            	};
        		if($(".topFontColorR").val()!==""){
			        colorss.str4="#"+$(".topFontColorR").val()
	        		colorss.colArray();
	        		colorss.topfontR();
            	};
        		if($(".topHovR").val()!==""){
			        colorss.str4="#"+$(".topHovR").val()
	        		colorss.colArray();
	        		colorss.topHovR();
            	};
        		if($(".topFontLogo").val()!==""){
			        colorss.str4="#"+$(".topFontLogo").val()
	        		colorss.colArray();
	        		colorss.topfontLogo();
            	};
        		if($(".navBtnBg").val()!==""){
			        colorss.str4="#"+$(".navBtnBg").val()
	        		colorss.colArray();
	        		colorss.navBtnBg();
            	};
        		if($(".leftIconColB").val()!==""){
			        colorss.str4="#"+$(".leftIconColB").val()
	        		colorss.colArray();
	        		colorss.leftIconColB();
            	};
        		if($(".leftIconColC").val()!==""){
			        colorss.str4="#"+$(".leftIconColC").val()
	        		colorss.colArray();
	        		colorss.leftIconColC();
            	};
        		if($(".leftTextColA").val()!==""){
			        colorss.str4="#"+$(".leftTextColA").val()
	        		colorss.colArray();
	        		colorss.leftTextColA();
            	};
        		if($(".leftTextColB").val()!==""){
			        colorss.str4="#"+$(".leftTextColB").val()
	        		colorss.colArray();
	        		colorss.leftTextColB();
            	};
        		if($(".leftTextColC").val()!==""){
			        colorss.str4="#"+$(".leftTextColC").val()
	        		colorss.colArray();
	        		colorss.leftTextColC();
            	};
        		if($(".leftColorHovB").val()!==""){
			        colorss.str4="#"+$(".leftColorHovB").val()
	        		colorss.colArray();
	        		colorss.leftColorHovB();
            	};
        		if($(".leftColorHovC").val()!==""){
			        colorss.str4="#"+$(".leftColorHovC").val()
	        		colorss.colArray();
	        		colorss.leftColorHovC();
            	};
        		if($(".mainNavCol").val()!==""){
			        colorss.str4="#"+$(".mainNavCol").val()
	        		colorss.colArray();
	        		colorss.navMain();
            	};
        		if($(".navMainBg").val()!==""){
			        colorss.str4="#"+$(".navMainBg").val()
	        		colorss.colArray();
	        		colorss.navMainBg();
            	};
        		if($(".contentBg").val()!==""){
			        colorss.str4="#"+$(".contentBg").val()
	        		colorss.colArray();
	        		colorss.contentBg();
            	};
        		
        	
                    
        	<%--新增更改的颜色值-end---%>
        }
    };
    $(function (){
    	colorss.colclick();
    	$("ul.topnav ol a").on("click",function (){
    		$("ul.topnav ol a").removeClass("on");
        	//$(this).addClass("on");
        	});
        });
    	function eachFun(oj){
        	var t=oj;
    	$("ul.topnav li").each(function (){
			var u=$(this).find("a").attr("id");
			var e="cddm"+t;
			if(u==e){
				$("ul.topnav li a").removeClass("on");
				//$(this).find("a").addClass("on");
				};
			});
		
    	};
    
</script> 

</head>
<body style="padding-bottom:45px;"> 
<input type="hidden" value="${sessionScope.boxColorA}" class="boxColorA" />
<input type="hidden" value="${sessionScope.boxColorB}" class="boxColorB" />
<input type="hidden" value="${sessionScope.boxColorC}" class="boxColorC" />
<input type="hidden" value="${sessionScope.boxColorD}" class="boxColorD" />
<input type="hidden" value="${sessionScope.boxColorE}" class="boxColorE" />
<input type="hidden" value="${sessionScope.boxColorF}" class="boxColorF" />
<input type="hidden" value="${sessionScope.boxColorG}" class="boxColorG" />

<input type="hidden" value="${sessionScope.topFontColor}" class="topFontColor" />
<input type="hidden" value="${sessionScope.topFontColorR}" class="topFontColorR" />
<input type="hidden" value="${sessionScope.topHovR}" class="topHovR" />
<input type="hidden" value="${sessionScope.topFontLogo}" class="topFontLogo" />
<input type="hidden" value="${sessionScope.navBtnBg}" class="navBtnBg" />
<input type="hidden" value="${sessionScope.leftIconColB}" class="leftIconColB" />
<input type="hidden" value="${sessionScope.leftIconColC}" class="leftIconColC" />
<input type="hidden" value="${sessionScope.leftTextColA}" class="leftTextColA" />
<input type="hidden" value="${sessionScope.leftTextColB}" class="leftTextColB" />
<input type="hidden" value="${sessionScope.leftTextColC}" class="leftTextColC" />
<input type="hidden" value="${sessionScope.leftColorHovB}" class="leftColorHovB" />
<input type="hidden" value="${sessionScope.leftColorHovC}" class="leftColorHovC" />
<input type="hidden" value="${sessionScope.mainNavCol}" class="mainNavCol" />
<input type="hidden" value="${sessionScope.navMainBg}" class="navMainBg" />
<input type="hidden" value="${sessionScope.contentBg}" class="contentBg" />
<div id="skin-warp">
	<div class="skin-part">
		<div id="tree-wrap">
	    	<div class="side-bar" id="meus_parten">
					<ul id="menus"  class="topnav menu-left-nest" style="overflow-x:hidden">
						<c:forEach items="${orderListFather}" var="fmap" varStatus="status">
							<li>
								<a href="javascript:void(0);"  class="tooltip-tip ajax-load">
								<c:choose>
									<c:when test="${empty fmap.ICON}">
									<i class="glyphicon glyphicon-cog"></i>
									</c:when>
									<c:otherwise><i class="${fmap.ICON}"></i></c:otherwise>
								</c:choose>
								
								<span>${fmap.QXMC}</span>
								<h4><img src="<%=path%>/resources/style/blue/images/plus.png"></h4>
								</a>
								
								<ol class="submenu">
									<c:forEach items="${orderList}" var="zmap">
										<c:if test="${fmap.QXDM eq zmap.FQXDM}">
								        	<li >
									        	 <a class="tooltip-tip2 ajax-load"  id="cddm${zmap.QXDM}"  href="javascript:void(0)" onclick="javascript:top.createTab('${zmap.QXDM}','${zmap.QXMC}','<%=path%>${zmap.FWLJ}');menuoffset(this);hys(this);" >
									        	 <c:choose>
													<c:when test="${empty zmap.ICON}">
													<i class="glyphicon glyphicon-list-alt"></i>
													</c:when>
													<c:otherwise>
													<i class="${zmap.ICON}"></i>
													</c:otherwise>
												</c:choose>
										        	 <span title="${zmap.QXMC}-${zmap.SFZXJ}"><c:if test="${fn:length(zmap.QXMC) le 10}">${zmap.QXMC}</c:if><c:if test="${fn:length(zmap.QXMC) gt 10}">${fn:substring(zmap.QXMC,0,10)}...</c:if></span>
									        	 	 <c:if test="${zmap.SFYXJ gt '0'}"><h4><b>+</b></h4></c:if>
									        	 </a>
									       	<ol class="submenu2">
											<c:forEach items="${orderList}" var="zmap2">
												<c:if test="${zmap.QXDM eq zmap2.FQXDM}">									        	 
									        	 
										        	<li>
											        	 <a class="tooltip-tip2 ajax-load"  id="cddm${zmap2.QXDM }"  href="javascript:void(0)" onclick="javascript:top.createTab('${zmap2.QXDM}','${zmap2.QXMC}','<%=path%>${zmap2.FWLJ}');" >
											        	 <c:choose>
															<c:when test="${empty zmap2.ICON}">
															<i class="glyphicon glyphicon-list-alt"></i>
															</c:when>
															<c:otherwise>
															<i class="${zmap2.ICON}"></i>
															</c:otherwise>
														</c:choose>
															<span title="${zmap2.QXMC}"><c:if test="${fn:length(zmap2.QXMC) le 10}">${zmap2.QXMC}</c:if><c:if test="${fn:length(zmap2.QXMC) gt 10}">${fn:substring(zmap2.QXMC,0,10)}...</c:if></span>
											        	 </a>
										        	 </li>
										      	
										        </c:if>
									        </c:forEach>
									        </ol>										      	
								        	 </li>
												<!--  <a  id="cddm${fmap.QXDM }"  href="${zmap.FWLJ}" target="iframename" onclick="hys(this)">${zmap.QXMC}</a></li>-->
								        </c:if>
							        </c:forEach>
						      	</ol>
						      	
					    	</li>
				    	</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>


</body>
</html>


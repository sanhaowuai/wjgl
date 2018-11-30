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
<script type="text/javascript"> 
<%--导航下拉--%>
var winHei=$(window.parent.document).height()-60;
//$(window.parent.document).find("#iframename0").css("height",winHei+"px");
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
//平分屏幕
var numSi={
			nszD:0,
			nps:function (){
				numSi.nszD=0;
			for(var i=0; i<$('#menus>li').length; i++){
				numSi.nszC=$('#menus>li:eq('+i+')').find('ol').height();
				if(numSi.nszD<numSi.nszC){
					numSi.nszD=numSi.nszC;
					};
				};
				numSi.nszD=numSi.nszD+20;
				
				}
			};

$(document).ready(function() {
	initMenu();
	numSi.nps();
	$('#menus>li>ol').height(numSi.nszD+'px');
	});
	function hys(a){
		$("a[id^='cddm']").removeAttr("class");
		$(a).addClass("selected");
	};

<%--	function spanHide(){//缩小--%>
<%--		$('span').css({"display":"none"});--%>
<%--		$('#menus').find('i').css({"left":"-14px"});--%>
<%--		$('#menus').find('h4').css({"display":"none"});--%>
<%--		$('#menus ol').find('i').css({"left":"-44px","color":"#89aace"});--%>
<%--		$('#menus .submenu2').find('i').css({"left":"-74px","color":"#fff"});--%>
<%--	}--%>
<%----%>
<%--	function spanShow(){//宽的--%>
<%--		$('span').css({"display":"inline-block"});--%>
<%--		$('#menus').find('i').css({"left":"-10px"});--%>
<%--		$('#menus').find('h4').css({"display":"block"});--%>
<%--		$('#menus ol').find('i').css({"left":"-10px","color":"#50b3ee"});--%>
<%--		$('#menus ol').find('a').css({"color":"rgba(255, 255, 255, 0.9) !important"});--%>
<%--	}--%>
<%----%>
	function test(colorNas){
		$("head").children("style").append('ul.topnav ol li a{background:'+colorNas+'} ul.topnav ol li a{background: '+colorNas+';}')
	};
	function iconCol(colorNas){
		$("head").children("style").append('ul.topnav li a:hover{color:'+colorNas+'!important} ul.topnav ol li a:hover{color:'+colorNas+'!important} #skin-warp li i{color:'+colorNas+'}ul.topnav li a:hover{border-left-color: '+colorNas+';} ul.topnav li a:hover:after{border-bottom-color:'+colorNas+';}')
	};
	function txs(colorNas){
		$("head").children("style").append('ul.topnav li a:hover{background-color:'+colorNas+';} ul.topnav ol li a:hover{background: '+colorNas+';}')
	};
	//08菜单列的触发色
	function hoveS(colorNas){
		$("head").children("style").append('.side-bar>ul.topnav>li:hover{background-color:'+colorNas+';}')
	};
	//08二级菜单背景色
	function bgtowS(colorNas){
		$("#skin-warp").css("background-color",colorNas);
	};
	//08字触发色
	function txsS(colorNas){
		
		$("head").children("style").append('ul.topnav li ol li a:hover{color:'+colorNas+'!important;}')
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
<%--	 		        	$(wind ow.parent.document).find(".topbg").css("background-color",colors.str3[0]);/*顶部行栏的颜色*/--%>
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
        	$(window.parent.document).find("head").children("style").append('#taskbar_right a:hover{background-color:'+colorss.str2+'!important}');
        	$(window.parent.document).find(".topbg").css("background-color",colorss.str2);/*顶部行栏的颜色*/
        	$(window.parent.document).find(".switch-bd").css("background-color",colorss.str2);/*顶部行栏下拉框的颜色*/
<%--        	$(window.parent.document).find("#taskbar_right").css("background-color",colors.str4[1]);/*顶部右侧导航颜色*/--%>
<%--        	/*$(window.parent.document).find("#taskbar_right:before").css("background-color",colors.str3[0]);顶部右侧导航颜色*/--%>
<%--        	/*$(window.parent.document).find(".logo").css("background-color",colors.str3[0]);顶部栏目和左侧栏目交汇处的颜色*/--%>
<%----%>
        },
        toprig:function (){
        	$(window.parent.document).find("head").children("style").append('#taskbar_right:before{border-top-color:'+colorss.str2+'!important}');
        	/*$(window.parent.document).find(".topbg").css("background-color",colors.str4[0]);顶部行栏的颜色*/
        	/*$(window.parent.document).find(".switch-bd").css("background-color",colors.str4[0]);顶部行栏下拉框的颜色*/
        	$(window.parent.document).find("#taskbar_right").css("background-color",colorss.str2);/*顶部右侧导航颜色*/
<%--        	/*$(window.parent.document).find("#taskbar_right:before").css("background-color",colors.str3[0]);顶部右侧导航颜色*/--%>
<%--        	/*$(window.parent.document).find(".logo").css("background-color",colors.str3[0]);顶部栏目和左侧栏目交汇处的颜色*/--%>
<%----%>
        },
        logoColor:function (){
        	$(window.parent.document).find(".logo").css("background-color",colorss.str2);/*顶部栏目和左侧栏目交汇处的颜色*/

        },
        leftColor:function (){
        	$(window.parent.document).find("head").children("style").append('#taskbar #taskbar_center #tabs_container div.selected{background-color:'+colorss.str2+'!important}');
        	<%--        	$(window.parent.document).find(".logo").css("background-color",colors.str3[0]);/*顶部栏目和左侧栏目交汇处的颜色*/--%>
        	        	$(window.parent.document).find("#skin-select").css("background-color",colorss.str2);/*左侧栏颜色*/
        	/*$(window.parent.document).find("#skin-warp").find("i").css("color",colors.str3[0]);触发色边框箭头颜色*/
            /*$(window.parent.document).find("ul.topnav").children("ol").children("li").children("a").css("background-color",colors.str3[0]);    左侧栏导航一级收起栏目底色颜色*/
        },
        leftColorSub:function (){

    		test(colorss.str2);
<%--    		$(window.parent.document).find("head").children("style").append('#taskbar #taskbar_center #tabs_container div.selected{background-color:'+colors.str3[0]+'!important}');--%>
<%--        	$(window.parent.document).find(".logo").css("background-color",colors.str3[0]);/*顶部栏目和左侧栏目交汇处的颜色*/--%>
<%--        	$(window.parent.document).find("#skin-select").css("background-color",colors.str3[1]);/*左侧栏颜色*/--%>
        	$(window.parent.document).find(".title-menu-left").children("span").css("background-color",colorss.str2);/*左侧栏“栏目导航条"颜色*/
<%--        	$(window.parent.document).find("#toggle").css("background-color",colors.str3[2]);/*左侧栏导航收放按钮颜色*/--%>
<%--        	$(window.parent.document).find("#skin-warp").find("i").css("color",colors.str3[0]);/*触发色边框箭头颜色*/--%>
<%--            $(window.parent.document).find("ul.topnav").children("ol").children("li").children("a").css("background-color",colors.str3[0]);    /*左侧栏导航一级收起栏目底色颜色*/--%>
        },
        <%--        08二级菜单背景--%>
        leftColorSubE:function (){
<%--        	$(window.parent.document).find("#iframename0").css("background-color",colors.str2);--%>
        	bgtowS(colorss.str2);
        },
		leftColorHov:function (){
        	
    		txs(colorss.str2);
        },
<%--        07字体触发--%>
		leftColorHovS:function (){
        	txsS(colorss.str2);
        },
        <%--        07菜单列触发--%>
		leftColorHoveS:function (){
        	
        	hoveS(colorss.str2);
        },
        leftIconCol:function (){
        	iconCol(colorss.str2);
        },
        colclick:function (){
            
        	if($(".boxColorA").val()!==""){
        		colorss.str4="#"+$(".boxColorA").val()
            		colorss.colArray();
            		colorss.topbox();
            	};//8
        		
        		if($(".boxColorB").val()!==""){
        			colorss.str4="#"+$(".boxColorB").val()
                		colorss.colArray();
                		colorss.toprig();
            	};//8
        		
        		
        		if($(".boxColorD").val()!==""){
        			colorss.str4="#"+$(".boxColorD").val()
                		colorss.colArray();
                		colorss.leftColor();
            	};//8

            	if($(".boxColorEe").val()!==""){
        			colorss.str4="#"+$(".boxColorEe").val()
                		colorss.colArray();
                		colorss.leftColorSubE();
            	};//
        		
        		
        		
        		if($(".boxColorF").val()!==""){
        			colorss.str4="#"+$(".boxColorF").val()
                		colorss.colArray();
                		colorss.leftColorHov();
            	}
        		
        		if($(".boxColorFf").val()!==""){
        			colorss.str4="#"+$(".boxColorFf").val()
                		colorss.colArray();
                		colorss.leftColorHovS();
            	};
				if($(".boxColorFfs").val()!==""){
        			colorss.str4="#"+$(".boxColorFfs").val()
                		colorss.colArray();
                		colorss.leftColorHoveS();
            	};//
            $(".contentCol").on("change",function (){
        		colors.colArray(".contentCol");
        		contentCol(colorss.str2);
            });
        }
    };
    $(function (){
    	colorss.colclick();
        });
        
        //返回主页

function tzsy(){
	$(window.parent.document).find('.tabs-panel').removeClass("selected")
	$(window.parent.document).find('.index-vi').addClass("selected");
};
</script> 
<style></style>
</head>
<body style="padding-bottom:45px;"> 
<input type="hidden" value="${sessionScope.boxColorA}" class="boxColorA" />
<input type="hidden" value="${sessionScope.boxColorB}" class="boxColorB" />
<input type="hidden" value="${sessionScope.boxColorC}" class="boxColorC" />
<input type="hidden" value="${sessionScope.boxColorD}" class="boxColorD" />
<input type="hidden" value="${sessionScope.boxColorE}" class="boxColorE" />
<input type="hidden" value="${sessionScope.boxColorF}" class="boxColorF" />
<input type="hidden" value="${sessionScope.boxColorG}" class="boxColorG" />
<input type="hidden" value="${sessionScope.boxColorDd}" class="boxColorDd" />
<input type="hidden" value="${sessionScope.boxColorEe}" class="boxColorEe" />
<input type="hidden" value="${sessionScope.boxColorFf}" class="boxColorFf" />
<input type="hidden" value="${sessionScope.boxColorFfs}" class="boxColorFfs" />
<div id="skin-warp">
	<div class="skin-part">
		<div id="tree-wrap">
	    	<div class="side-bar" id="meus_parten">
					<ul id="menus"  class="topnav menu-left-nest" style="overflow-x:hidden">
						<li>
							<a class="pngFix" href="javascript:tzsy()" id="home">
				 			<i class="fa fa-home"></i><span>首页</span></a>
				 			<div style='height:3px;width:50px;'></div>
						</li>
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
				    	<li style='clear:both;float:none;width:0;height:0;'></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>


</body>
</html>


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
<jsp:include page="../../include/css-main-include.jsp"></jsp:include>
<style type="text/css">
	html, body { height:100%; }
	.Contentbox { width:100%; min-height:100%;height:auto }
	*html .Contentbox { height:100% }
</style>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" >
	$(document).ready(function(){
	   $("#ff").baigoCheckall();
	});
	function querylike(){		
		document.queryform.action="<%=path%>/skin/querySkinList";
		document.queryform.submit();
	}
	
	<%--function addXyzyb(){
		document.ff.action="<%=path%>/yxgl/addXyzyb";
		$("#ff").ajaxSubmit(function(ret){
			if(ret == "success"){
				var src ="<%=path%>/jsp/commons/main/loading.jsp";
				parent.$("#SelectZYIframe").attr("src",src);
				parent.BOX_remove('SelectZy');
			}
		});
	} --%>
	//皮肤管理删除皮肤
	function delSkin(){
		if(isCheck('ids')==false){
			alert("请选择要删除的数据");
			return;
		};
		
		if(confirm("您确定要删除选中的数据吗？")==true){
			document.ff.action = "<%= request.getContextPath() %>/skin/deleteSkin";
			$('#ff').ajaxSubmit(function(){
		    	alert("删除成功！");
		    	querylike();
		    });
		};
	
	};
	//选择皮肤
	function chooseSkin(skinId){
		$("#skinId").val(skinId);
		document.ff.action="<%=path%>/skin/chooseSkin";
		$('#ff').ajaxSubmit(function(res){
				var syym=res.SYYM;
				
				colors.str2="#"+res.BOXCOLORA;
        		colors.topbox();
        		if(syym=='commons/main/main_01'||syym=='commons/main/main_08'||syym=='commons/main/main_11'){
        		colors.str2="#"+res.BOXCOLORB;
        		colors.toprig();
        		}
        		if(syym=='commons/main/main_01'||syym=='commons/main/main_11'){
        		colors.str2="#"+res.BOXCOLORC;
        		colors.logoColor();
        		}
        		colors.str2="#"+res.BOXCOLORD;
        		colors.leftColor();
        		if(syym=='commons/main/main_01'||syym=='commons/main/main_11'){
        		colors.str2="#"+res.BOXCOLORE;
        		colors.leftColorSub();
        		}
        		if(syym=='commons/main/main_01'||syym=='commons/main/main_08'||syym=='commons/main/main_11'){
        		colors.str2="#"+res.BOXCOLORF;
        		colors.leftColorHov();
        		}
        		if(syym=='commons/main/main_01'||syym=='commons/main/main_11'){
            	colors.str2="#"+res.BOXCOLORG;
            	colors.leftIconCol();
        		}
            	if(syym=='commons/main/main_08'){
            	colors.str2="#"+res.BOXCOLOREE;
            	colors.leftColorSubE();
            	}
            	if(syym=='commons/main/main_07'){
            	colors.str2="#"+res.BOXCOLORDD;
            	colors.leftColorS();//07
            	}
            	if(syym=='commons/main/main_07'||syym=='commons/main/main_08'){
            	colors.str2="#"+res.BOXCOLORFF;
            	colors.leftColorHovS();
            	}
            	if(syym=='commons/main/main_08'){
            	colors.str2="#"+res.BOXCOLORFFS;
            	colors.leftColorHoveS();
            	}
//             	新增
				colors.str2="#"+res.TOPFONTCOLOR;
        		colors.topfont();
				colors.str2="#"+res.TOPFONTCOLORR;
        		colors.topfontR();
				colors.str2="#"+res.TOPHOVR;
        		colors.topHovR();
        		colors.str2="#"+res.TOPFONTLOGO;
            	colors.topfontLogo();
            	colors.str2="#"+res.NAVBTNBG;
            	colors.navBtnBg();
            	colors.str2="#"+res.LEFTICONCOLB;
                colors.leftIconColB();
                colors.str2="#"+res.LEFTICONCOLC;
                colors.leftIconColC();
                colors.str2="#"+res.LEFTTEXTCOLA;
                colors.leftTextColA();
                colors.str2="#"+res.LEFTTEXTCOLB;
                colors.leftTextColB();
                colors.str2="#"+res.LEFTTEXTCOLC;
                colors.leftTextColC();
                colors.str2="#"+res.LEFTCOLORHOVB;
                colors.leftColorHovB();
                colors.str2="#"+res.LEFTCOLORHOVC;
                colors.leftColorHovC();
                colors.str2="#"+res.MAINNAVCOL;
                colors.navMain();
                colors.str2="#"+res.NAVMAINBG;
           		colors.navMainBg();
           		colors.str2="#"+res.CONTENTBG;
           		colors.contentBg();
           		
           		window.parent.colRwLoc();
	    	querylike();
	    });
	}
	//返回默认
	function redefault(){
		document.ff.action="<%=path%>/skin/redefault";
		$('#ff').ajaxSubmit(function(res){
			
    			colors.str2="#50b3ee";
        		colors.topbox();
        		if(res=='commons/main/main_01'||res=='commons/main/main_08'||res=='commons/main/main_11'){
        		colors.str2="#74C2F2";
        		colors.toprig();
        		}
        		if(res=='commons/main/main_01'||res=='commons/main/main_11'){
        		colors.str2="#213047";
        		colors.logoColor();
        		}
        		if(res=='commons/main/main_08'){
				colors.str2="#213047";
        		colors.leftColorSub();
        		}
        		if(res=='commons/main/main_01'||res=='commons/main/main_08'||res=='commons/main/main_11'){
        		colors.str2="#2d3d56";
        		colors.leftColorHov();
        		}
        		colors.str2="#374B63";
        		colors.leftColor();
        		if(res=='commons/main/main_11'){
        		colors.str2="#f8f8f8";
        		colors.leftColorSub();//01
        		}
        		if(res=='commons/main/main_01'){
        		colors.str2="#213047";
        		colors.leftColorSub();//01
        		}
            	if(res=='commons/main/main_01'||res=='commons/main/main_11'){
            	colors.str2="#50b3ee";
            	colors.leftIconCol();
            	}
            	if(res=='commons/main/main_08'){
            	colors.str2='transparent';
            	colors.leftColorSubE();//08
            	}
            	if(res=='commons/main/main_07'){
            	colors.str2="#"+'666';
            	colors.leftColorS();//07
            	}
				if(res=='commons/main/main_07'||res=='commons/main/main_08'){
            	colors.str2="#"+'f1b458';
            	colors.leftColorHovS();//078
				}
            	if(res=='commons/main/main_08'){
            	colors.str2="#"+'3371ad';
            	colors.leftColorHoveS();//078
            	}
            	
            	
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
            	if(res=='commons/main/main_01'){
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
                if(res=='commons/main/main_11'){
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
           		
           		window.parent.colRwLoc();
	    	querylike();
	    });
	}
	//添加皮肤模板
	function addOrUpSkin(skinId){
		$("#skinId").val(skinId);
		mrSkin='${skinMap.SKINID}';
		document.ff.action="<%=path%>/skin/changeSkin?mrSkin="+mrSkin;
		document.ff.submit();
	}
	
	
	
	
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
<%--        	/*$(window.parent.document).find("#taskbar_right:before").css("background-color",colors.str3[0]);顶部右侧导航颜色*/--%>
<%--        	/*$(window.parent.document).find(".logo").css("background-color",colors.str3[0]);顶部栏目和左侧栏目交汇处的颜色*/--%>
<%----%>
        },
        toprig:function (){
        	$(window.parent.document).find("head").children("style").append('#taskbar_right:before{border-top-color:'+colors.str2+'!important}');
        	/*$(window.parent.document).find(".topbg").css("background-color",colors.str4[0]);顶部行栏的颜色*/
        	/*$(window.parent.document).find(".switch-bd").css("background-color",colors.str4[0]);顶部行栏下拉框的颜色*/
        	$(window.parent.document).find("#taskbar_right").css("background-color",colors.str2);/*顶部右侧导航颜色*/
<%--        	/*$(window.parent.document).find("#taskbar_right:before").css("background-color",colors.str3[0]);顶部右侧导航颜色*/--%>
<%--        	/*$(window.parent.document).find(".logo").css("background-color",colors.str3[0]);顶部栏目和左侧栏目交汇处的颜色*/--%>
<%----%>
        },
        logoColor:function (){
            
        	$(window.parent.document).find(".logo").css("background-color",colors.str2);/*顶部栏目和左侧栏目交汇处的颜色*/

        },
        leftColor:function (){
        	$(window.parent.document).find("head").children("style").append('#taskbar #taskbar_center #tabs_container div.selected{background-color:'+colors.str2+'!important}');
<%--        	        	$(window.parent.document).find(".logo").css("background-color",colors.str3[0]);/*顶部栏目和左侧栏目交汇处的颜色*/--%>
        	        	$(window.parent.document).find("#skin-select").css("background-color",colors.str2);/*左侧栏颜色*/
        	        	$(window.parent.document).find("#taskbar").css("border-color",colors.str2);/*tab切换栏目边框颜色*/
        	/*$(window.parent.document).find("#skin-warp").find("i").css("color",colors.str3[0]);触发色边框箭头颜色*/
            /*$(window.parent.document).find("ul.topnav").children("ol").children("li").children("a").css("background-color",colors.str3[0]);    左侧栏导航一级收起栏目底色颜色*/
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
        	$(window.parent.document).find(".title-menu-left").children("span").css("background-color",colors.str2);/*左侧栏“栏目导航条"颜色*/
        	$(window.parent.document).find("#toggle").css("background-color",colors.str2);/*左侧栏导航收放按钮颜色*/
<%--        	$(window.parent.document).find("#toggle").css("background-color",colors.str3[2]);/*左侧栏导航收放按钮颜色*/--%>
<%--        	$(window.parent.document).find("#skin-warp").find("i").css("color",colors.str3[0]);/*触发色边框箭头颜色*/--%>
<%--            $(window.parent.document).find("ul.topnav").children("ol").children("li").children("a").css("background-color",colors.str3[0]);    /*左侧栏导航一级收起栏目底色颜色*/--%>

        },
        <%--        08二级菜单背景--%>
        leftColorSubE:function (){
        	<%--布局模板11-star--%>
        	if ('${sessionScope.syym}'=='commons/main/main_11'){
            window.parent.tabs_portal_0_iframe.bgtowS(colors.str2);
            }else{
            <%--布局模板11-end--%>
<%--        	$(window.parent.document).find("#iframename0").css("background-color",colors.str2);--%>
				window.parent.iframename0.bgtowS(colors.str2);
			}
        },
		leftColorHov:function (){
        	<%--布局模板11-star--%>
<%--            window.parent.tabs_portal_0_iframe.txs(colors.str2);--%>
            <%--布局模板11-end--%>
            if ('${sessionScope.syym}'=='commons/main/main_01'){
        	window.parent.iframename0.txs(colors.str2);
        	}
        },
        <%--        07字体触发--%>
		leftColorHovS:function (){
        	<%--布局模板11-star--%>
        	if ('${sessionScope.syym}'=='commons/main/main_11'){
            window.parent.tabs_portal_0_iframe.txsS(colors.str2);
            }else{
            <%--布局模板11-end--%>
    		window.parent.iframename0.txsS(colors.str2);
    		}
        },
        <%--        07菜单列触发--%>
		leftColorHoveS:function (){
        	<%--布局模板11-star--%>
        	if ('${sessionScope.syym}'=='commons/main/main_11'){
            window.parent.tabs_portal_0_iframe.hoveS(colors.str2);
            }else{
            <%--布局模板11-end--%>
    		window.parent.iframename0.hoveS(colors.str2);
    		}
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
//         btnIconCol:function (){
//         alert(colors.str2)
//     		$(".addlist_button1 a").css("background-color",colors.str2);
//     		$(".addlist_button1 a span").css("background-color",colors.str2);
//         }
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
            }else{
            <%--布局模板11-end--%>
    		window.parent.iframename0.txsB(colors.str2);
    		}
        },
		leftColorHovC:function (){
        	<%--布局模板11-star--%>
        	if ('${sessionScope.syym}'=='commons/main/main_11'){
            window.parent.tabs_portal_0_iframe.txsC(colors.str2);
            }else{
            <%--布局模板11-end--%>
    		window.parent.iframename0.txsC(colors.str2);
    		}
        },

        
        <%--新增更改的颜色值-end---%>
    };
    
    
</script>
</head>

<body >
<div class="Contentbox">
  <div class="mainbg"></div>
  <div class="pd10">
   	<div class="question" title="帮助" onclick="javascript:cha('${QXB.QXDM}');"></div>
    <div class="address">当前位置：${QXB.FQXMC} >> ${QXB.QXMC}</div>
    <div class="clr"></div>
  <form id="queryform" name="queryform" method="post">   
   <c:if test="${jsdm eq '1'}">
	   <div class="addlist_button1" >
	       &nbsp; &nbsp; <a href="javascript:void(0);" onclick="javascript:addOrUpSkin('');return false;"><span>添&nbsp;&nbsp;加</span></a> 
	    </div>
	    
	   <div class="addlist_button1" >
	        &nbsp; &nbsp;<a href="javascript:void(0);" onclick="javascript:delSkin();return false;"><span>删&nbsp;&nbsp;除</span></a> 
	    </div>
	    
    </c:if>
	   <div class="addlist_button1" >
	        &nbsp; &nbsp;<a href="javascript:void(0);" onclick="javascript:redefault();return false;"><span>默&nbsp;&nbsp;认</span></a> 
	    </div>
	<%-- <table align="right">
	  <tr><td>专业名称：</td>
	    <td>
	      <input type="text" id="dmmc" name="dmmc" value="${DMMC}"/>      
	    </td>	    
	    <td>
 	      <div class="addlist_button2" >
            <a href="javascript:void(0);" onclick="javascript:querylike('${YXDM}');return false;"><span>搜&nbsp;&nbsp;索</span></a>  
 	      </div>
 	     
	    </td>
	  </tr>
	</table>  --%>
	</form>    
  <div class="clr"></div>
  <br/>
  <div style="width:100%; height:350px; overflow:auto">
  <form name="ff" method="post" id="ff" >
	<input type="hidden" name="skinId" id="skinId" value=""/>
<table id="divtab" width="100%" cellpadding="0" cellspacing="0" class="addlist" style="border-collapse:collapse">	  <thead>
        <tr>
          <th style="text-align:left;padding:6px;">&nbsp;<input type="checkbox" id="ids" title="全选/不选" /></th>
          <th>序号</th>
          <th width="50%">模板名称</th>
          <th>使用模板</th>
          <c:if test="${jsdm eq 1}">
            <th>操作</th>
          </c:if>
        </tr>
      </thead>   
        <c:forEach items="${skinModellist}" var="map" varStatus="i">
  		  <tr>
   		    <td>&nbsp;<input type="checkbox" name="ids" value="${map.SKINID}" /></td>
   		    <td>&nbsp;${i.count}</td>
   		    <td>&nbsp;
<!--    		    <font color="#1571FA"> -->
   		    ${map.SKINNAME}
<!--    		    </font> -->
<!--    		     	<a href="javascript:void(0);"  title="点击选择"><font color="#1571FA">${map.SKINNAME}</font></a> -->
<!--    		     	<c:if test="${not empty skinMap }"> -->
<!--    		     		<c:if test="${skinMap.SKINID eq  map.SKINID}"> -->
   		     		<!-- <font style="font-size:15px;color: green">✔</font> -->
<!--    		     		</c:if> -->
<!--    		     	</c:if> -->
   		    </td>
   		    <td>
   		    	<c:if test="${not empty skinMap }">
   		    		<c:if test="${skinMap.SKINID eq map.SKINID}">
   		    			<input type="checkbox" name="checkskin" checked="checked" onclick="chooseSkin('${map.SKINID}');return false;"/>
   		    		</c:if>
   		    		<c:if test="${skinMap.SKINID ne map.SKINID}">
	   		    			<input type="checkbox" name="checkskin" onclick="chooseSkin('${map.SKINID}');return false;"/>
	   		    	</c:if>
   		    	</c:if>
   		    	<c:if test="${empty skinMap }">
	   		    	<c:if test="${skinMap.SKINID ne map.SKINID}">
	   		    			<input type="checkbox" name="checkskin" onclick="chooseSkin('${map.SKINID}');return false;"/>
	   		    	</c:if>
   		    	</c:if>
   		    </td>
   		    <c:if test="${jsdm eq 1}">
   		    <td>
   				<div class="cz_button cz1_1" title="修改" onclick="addOrUpSkin('${map.SKINID}');return false;"></div>
   			</td>
   		   	</c:if>
 		  </tr>
 	    </c:forEach>
    </table>  
  </form>  
  </div> 
    <input type="hidden" id="skinName" name="skinName" value="${skinName}"/>
    <input type="hidden" class="boxColorA color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;"  id="boxColorA" name="boxColorA" value="${boxColorA}"/>
	<input type="hidden" class="boxColorB color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;"  id="boxColorB" name="boxColorB" value="${boxColorB}"/>  
	<input type="hidden" class="boxColorC color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorC" name="boxColorC" value="${boxColorC}"/>  
	<input type="hidden" class="boxColorD color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorD" name="boxColorD" value="${boxColorD}"/>  
	<input type="hidden" class="boxColorE color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorE" name="boxColorE" value="${boxColorE}"/>  
	<input type="hidden" class="boxColorF color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorF" name="boxColorF" value="${boxColorF}"/>  
	<input type="hidden" class="boxColorG color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorG" name="boxColorG" value="${boxColorG}"/>  
	<input type="hidden" class="boxColorDd color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorDd" name="boxColorDd" value="${boxColorDd}"/>  
	<input type="hidden" class="boxColorEe color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorEe" name="boxColorEe" value="${boxColorEe}"/>  
	<input type="hidden" class="boxColorFf color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorFf" name="boxColorFf" value="${boxColorFf}"/>  
	<input type="hidden" class="boxColorFfs color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="boxColorFfs" name="boxColorFfs" value="${boxColorFfs}"/>  
	<input type="hidden" class="contentCol color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="namKey" value="${namKey}" name="namKey"/>  
    
    <input type="hidden" class="topFontColor color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;"  id="topFontColor" name="topFontColor" value="${topFontColor}"/>
	<input type="hidden" class="topFontColorR color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;"  id="topFontColorR" name="topFontColorR" value="${topFontColorR}"/>  
	<input type="hidden" class="topHovR color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;"  id="topHovR" name="topHovR" value="${topHovR}"/>  
	<input type="hidden" class="topFontLogo color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="topFontLogo" name="topFontLogo" value="${topFontLogo}"/>  
	<input type="hidden" class="navBtnBg color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="navBtnBg" name="navBtnBg" value="${navBtnBg}"/>  
	<input type="hidden" class="leftIconColB color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="leftIconColB" name="leftIconColB" value="${leftIconColB}"/>  
	<input type="hidden" class="leftColorHov color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="leftIconColC" name="leftIconColC" value="${leftIconColC}"/>  
	<input type="hidden" class="leftTextColA color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="leftTextColA" name="leftTextColA" value="${leftTextColA}"/>  
	<input type="hidden" class="leftTextColB color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="leftTextColB" name="leftTextColB" value="${leftTextColB}"/>  
	<input type="hidden" class="leftTextColC color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="leftTextColC" name="leftTextColC" value="${leftTextColC}"/>  
	<input type="hidden" class="leftColorHovB color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="leftColorHovB" name="leftColorHovB" value="${leftColorHovB}"/>  
	<input type="hidden" class="leftColorHovC color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="leftColorHovC" name="leftColorHovC" value="${leftColorHovC}"/>  
	<input type="hidden" class="mainNavCol color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="mainNavCol" name="mainNavCol" value="${mainNavCol}"/>  
	<input type="hidden" class="navMainBg color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="navMainBg" name="navMainBg" value="${navMainBg}"/>  
	<input type="hidden" class="contentBg color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="contentBg" name="contentBg" value="${contentBg}"/>  
	<input type="hidden" class="contentCol color" style="cursor:pointer;outline-color: inherit;width:35%!important;display:block;float:left;height:33px;line-height:33px;" id="namKeys" value="${namKeys}" name="namKeys"/>  
  <div class="clr"></div>
  </div>
</body>
</html>


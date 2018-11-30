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

//换肤

$(function() {
	  var curWwwPath = window.document.location.href;
	  var pathName = window.document.location.pathname;
	  var pos = curWwwPath.indexOf(pathName);
	  var localhostPaht = curWwwPath.substring(0, pos);
	  var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
	  var path = localhostPaht + projectName;

    $("#button-bgs").click(function() {
    	$("#pfbj").val("/resources/style/touming/images/hf_01.jpg");
		document.queryform.action = '<%=path%>/skin/choose00';
		$('#queryform').ajaxSubmit(function(r){
		});
    	$(window.parent.document).find("body").css({
            "background": "url('"+path+"/resources/style/touming/images/hf_01.jpg') no-repeat",
            "background-size":"cover"
        });
    });
    $("#button-bgs2").click(function() {
    	$("#pfbj").val("/resources/style/touming/images/hf_02.jpg");
		document.queryform.action = '<%=path%>/skin/choose00';
		$('#queryform').ajaxSubmit(function(r){
		});
    	$(window.parent.document).find("body").css({
            "background": "url('"+path+"/resources/style/touming/images/hf_02.jpg') no-repeat",
            "background-size":"cover"
        });
    });


    $("#button-bgs3").click(function() {
    	$("#pfbj").val("/resources/style/touming/images/hf_03.jpg");
		document.queryform.action = '<%=path%>/skin/choose00';
		$('#queryform').ajaxSubmit(function(r){
		});
    	$(window.parent.document).find("body").css({
            "background": "url('"+path+"/resources/style/touming/images/hf_03.jpg') no-repeat",
            "background-size":"cover"
        });


    });

    $("#button-bgs5").click(function() {
    	$("#pfbj").val("/resources/style/touming/images/hf_04.jpg");
		document.queryform.action = '<%=path%>/skin/choose00';
		$('#queryform').ajaxSubmit(function(r){
		});
    	$(window.parent.document).find("body").css({
            "background": "url('"+path+"/resources/style/touming/images/hf_04.jpg')repeat",
            "background-size":"cover"
        });

    });

    $("#button-bgs6").click(function() {
    	$("#pfbj").val("/resources/style/touming/images/bg.jpg");
		document.queryform.action = '<%=path%>/skin/choose00';
		$('#queryform').ajaxSubmit(function(r){
		});
    	$(window.parent.document).find("body").css({
    		"background": "url('"+path+"/resources/style/touming/images/bg.jpg')repeat",
            "background-size":"cover"
        });

    });

    $("#button-bgs7").click(function() {
    	$("#pfbj").val("/resources/style/touming/images/hf_05.jpg");
		document.queryform.action = '<%=path%>/skin/choose00';
		$('#queryform').ajaxSubmit(function(r){
		});
    	$(window.parent.document).find("body").css({
            "background": "url('"+path+"/resources/style/touming/images/hf_05.jpg') repeat",
            "background-size":"cover"
        });

    });
    $("#button-bgs8").click(function() {
    	$("#pfbj").val("/resources/style/touming/images/hf_06.jpg");
		document.queryform.action = '<%=path%>/skin/choose00';
		$('#queryform').ajaxSubmit(function(r){
		});
    	$(window.parent.document).find("body").css({
            "background": "url('"+path+"/resources/style/touming/images/hf_06.jpg') no-repeat",
            "background-size":"cover"
        });
    });
    $("#button-bgs9").click(function() {
    	$("#pfbj").val("/resources/style/touming/images/hf_07.jpg");
		document.queryform.action = '<%=path%>/skin/choose00';
		$('#queryform').ajaxSubmit(function(r){
		});
    	$(window.parent.document).find("body").css({
            "background": "url('"+path+"/resources/style/touming/images/hf_07.jpg') no-repeat",
            "background-size":"cover"
        });
    });

    $("#button-bgs10").click(function() {
    	$("#pfbj").val("/resources/style/touming/images/hf_08.jpg");
		document.queryform.action = '<%=path%>/skin/choose00';
		$('#queryform').ajaxSubmit(function(r){
		});
    	$(window.parent.document).find("body").css({
            "background": "url('"+path+"/resources/style/touming/images/hf_08.jpg') no-repeat",
            "background-size":"cover"
        });
    });
    $("#button-bgs11").click(function() {
    	$("#pfbj").val("/resources/style/touming/images/hf_09.jpg");
		document.queryform.action = '<%=path%>/skin/choose00';
		$('#queryform').ajaxSubmit(function(r){
		});
    	$(window.parent.document).find("body").css({
            "background": "url('"+path+"/resources/style/touming/images/hf_09.jpg') no-repeat",
            "background-size":"cover"
        });
    });
    $("#button-bgs12").click(function() {
    	$("#pfbj").val("/resources/style/touming/images/hf_10.jpg");
		document.queryform.action = '<%=path%>/skin/choose00';
		$('#queryform').ajaxSubmit(function(r){
		});
    	$(window.parent.document).find("body").css({
            "background": "url('"+path+"/resources/style/touming/images/hf_10.jpg' )no-repeat",
            "background-size":"cover"
        });
    });

    $("#button-bgs13").click(function() {
   		$("#pfbj").val("/resources/style/touming/images/bg11.jpg");
		document.queryform.action = '<%=path%>/skin/choose00';
		$('#queryform').ajaxSubmit(function(r){
		});
    	$(window.parent.document).find("body").css({
            "background": "url('"+path+"/resources/style/touming/images/bg11.jpg') no-repeat",
            "background-size":"cover"
        });

    });
    /**
     * Background Changer end
     */
   
}); 
</script>
</head>

<body >

  <form id="queryform" name="queryform" method="post"> 
  <input type="hidden" id="pfbj" name="pfbj" value=""/>
	</form>    
  	<div align="center" style="margin-top: 20px">
  		<ul class="huanfu_warp-new00">
					<li class="theme-bg-new00">          	              
		                 <div id="button-bgs"></div>
		                 <div id="button-bgs2"></div>
		                 <div id="button-bgs3"></div>
		                 <div id="button-bgs5"></div>
		                 <div id="button-bgs6"></div>
		                 <div id="button-bgs7"></div>
		                 <div id="button-bgs8"></div>
		                 <div id="button-bgs9"></div>
		                 <div id="button-bgs10"></div>
		                 <div id="button-bgs11"></div>
		                 <div id="button-bgs12"></div>
		                 <div id="button-bgs13"></div>
		             </li>
		         </ul></div>
  <div class="clr">
  	
  </div>
</body>
</html>


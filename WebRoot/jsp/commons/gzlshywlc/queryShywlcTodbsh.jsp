<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>北京赢科后台管理系统</title>

<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/gzl_bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/gzl_bootstrap/css/dripicon.css"> 
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/gzl_bootstrap/css/font-awesome.min93e3.css" >
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/gzl_bootstrap/css/content.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/gzl_bootstrap/css/style.css">
<script src="<%=path%>/resources/style/gzl_bootstrap/js/jquery-1.11.1.min.js"></script>
<script src="<%=path%>/resources/style/gzl_bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/gzl_bootstrap/css/pageTag.css">

<!--[if lt IE 9]>
  <script src="<%=path%>/resources/style/gzl_bootstrap/js/html5shiv.min.js"></script>
  <script src="<%=path%>/resources/style/gzl_bootstrap/js/respond.min.js"></script>
<![endif]-->  


<style type="text/css">
  html, body { height:100%; }
  .Contentbox { width:100%; min-height:100%;height:auto }
  *html .Contentbox { height:100% }
</style>
  <script type="text/javascript" >
	function queryLike(){
		document.queryform.action="<%=path%>/gzlshywlc/queryShywlcdqPage";
		document.queryform.submit();
	}
	function fanhui(){
		if($('#url').val()!=null && $('#url').val()!=''){
			location.href="<%=path%>/"+$('#url').val();
		}else{
			location.href="<%=path%>/gzlshywlc/queryShywlcyxjdPage";
		}
	}
	//审核通过
	function tongguo(){
		var url="<%=path%>/gzlshywlc/updShywlcShtg";
		var param={'dbjddm':$('#dbjddm').val(),'ywlcdm':$('#ywlcdm').val(),'ywlcslid':$('#ywlcslid').val(),'lsshyj':$('#lsshyj').val()};
		$.post(url,param,function(result){
			if(result.jg=='1'){
				alert('审核通过！');
			}else{
				alert(result.error);
			}
			if($('#url').val()!=null && $('#url').val()!=''){
				location.href="<%=path%>/"+$('#url').val();
			}else{
				location.href="<%=path%>/gzlshywlc/queryShywlcyxjdPage";
			}
			
			
		});
	}
	
	//审核不通过
	function butongguo(){
		var url="<%=path%>/gzlshywlc/updShywlcShbtg";
		var param={'dbjddm':$('#dbjddm').val(),'ywlcdm':$('#ywlcdm').val(),'ywlcslid':$('#ywlcslid').val(),'lsshyj':$('#lsshyj').val()};
		$.post(url,param,function(result){
			if(result.jg=='1'){
				alert('审核不通过！');
			}else{
				alert(result.error);
			}
			if($('#url').val()!=null && $('#url').val()!=''){
				location.href="<%=path%>/"+$('#url').val();
			}else{
				location.href="<%=path%>/gzlshywlc/queryShywlcyxjdPage";
			}
			
			
		});
		
	}
 
</script>
</head>
<body>
<input type="hidden" id="url" value="${url}"/>
<input type="hidden" id="dbjddm" value="${dbjddm}"/>
<input type="hidden" id="ywlcdm" value="${gzlShywlcslModel.ywlcdm}"/>
<input type="hidden" id="ywlcslid" value="${gzlShywlcslModel.ywlcslid}"/>
<div class="Contentbox">
  <div class="mainbg"></div>
  <div class="pd10">
      <span class="glyphicon glyphicon-question-sign"></span>
   	  
      <div class="address">
       <ol class="breadcrumb  ">
          <li> <span class="glyphicon glyphicon-home pull-left"></span> </li>
		  <li>当前位置：</li>
		  <li><a href="#">${QXB.FQXMC}</a></li>
		  <li class="active">${QXB.QXMC}</li>
		</ol>          
      </div>
    <div class="clr"></div>
    <div class="list">
    	<h4 style="text-align:center">${gzlShywlcslModel.ywlcslbt }</h4>
    	<div class="row" >
    	  <div class="col-xs-4"><h5>创建人：${gzlShywlcslModel.ywlcslcjrxm }</h5></div>
    	  <div class="col-xs-4" ><h5>创建时间：${gzlShywlcslModel.ywlcslcjsj }</h5></div>
    	  <div class="col-xs-4" ><h5>业务名称：${gzlShywlcslModel.ywlcmc }</h5></div>
    	</div>
		 
         <div class="clr"></div>
         <div><textarea class="form-control" id="lsshyj"></textarea></div>
         <div style="margin-top:10px;" class="pull-right">
          <button type="button" class="btn btn-info" onclick="tongguo()">通过</button>
         <button type="button" class="btn btn-info" onclick="butongguo()">不通过</button>
         <button type="button" class="btn btn-info" onclick="fanhui()">返回</button>
         </div>
    </div>
    <div class="clr"></div>
  </div>
</div>
  
 
</body>
</html>

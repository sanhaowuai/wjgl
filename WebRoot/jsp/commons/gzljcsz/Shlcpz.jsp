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
<jsp:include page="../../include/css-boostrap-include.jsp"></jsp:include>
<jsp:include page="../../include/css-main-include.jsp"></jsp:include>
<jsp:include page="../../include/css-main-include.jsp"></jsp:include>
<style type="text/css">
  html, body { height:100%; }
  .Contentbox { width:100%; min-height:100%;height:auto }
  *html .Contentbox { height:100% }
</style>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<%-- <script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script> --%>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jquery.ztree.core-3.1.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jquery.ztree.excheck-3.1.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>

<style type="text/css">
	html, body { height:100%; 
	}
	.Contentbox { width:100%; min-height:100%;height:auto }
	*html .Contentbox { height:100% }
	
</style>
<script type="text/javascript">
$(document).ready(function(){
	   $("#ff").baigoCheckall();
	   
	   if('${error}'!=null && '${error}'!=''){
	   	alert('${error}');
	   }
	   
	});

function queryLike(){
	document.queryform.action = "<%=path%>/ywlcsz/queryYwList";
	document.queryform.submit();
}
//跳转到编辑流程页面
function addDiv1(ywid){
	document.ff.action = "<%=path%>/ywlcsz/queryToEditYwlc?ywdm="+ywid;
	document.ff.submit();
}

//添加审核业务
//添加流程
function addDivShyw(){
    $("input[id='ywlcdm']").attr("readonly",false);
    $("input[id='ywlcmc']").attr("readonly",false);
    $("input[id='xtdm']").attr("readonly",false);
    $("input[id='ywlcdm']").attr("disabled",false);
    $("input[id='xtdm']").attr("disabled",false);
    $("input[id='ywlcbbh']").attr("disabled",false);
    $("input[id='ywlcmc']").attr("disabled",false);
    $("#kyf").attr("disabled",false);
	$("#au_zt").val("1");
	$("#divtab").find("input[type='text']").val('');
	$("#divtab").find("select").val('');
	Validator.ClearForm('addOrUpdform');
	BOX_show('addOrUpd');
}
//保存
function addOrUpd(){
	var ywbidzdm=$("#ywbidzdm").val();
	
	if(Validator.Validate(document.getElementById('addOrUpdform'),3)){
	if(ywbidzdm== null ||ywbidzdm==""){
		alert("请填写业务表ID字段名")
		return ;
	}
	  $("input[id='ywlcdm']").attr("disabled",false);
	    $("input[id='xtdm']").attr("disabled",false);
	    $("input[id='ywlcbbh']").attr("disabled",false);
	    $("input[id='ywlcmc']").attr("disabled",false);
	    $("#kyf").attr("disabled",false);
	
// 		var ywlcdm=$("#ywlcdm").val();
// 		var zt = $("#au_zt").val();	

		document.addOrUpdform.action='<%=path%>/ywlcsz/addorupdate';	
	
		 $("#addOrUpdform").ajaxSubmit(function(result){
			
			 if(result=="1"){			
				 alert("增加成功")
			     queryLike();
			 }
			 if(result=="2"){
				 alert("增加失败")
				  queryLike();
			 }		
			 
			 if(result=="3"){
				 alert("更新成功")
				  queryLike();
			 }	
			 if(result=="4"){
				 alert("更新失败")
				  queryLike();
			 }		
		 } );
	}
}
			 

function addOrUpda(){
	if(Validator.Validate(document.getElementById('addOrUpdform'),3)){
		document.addOrUpdform.action ="<%=path%>/ywlcsz/addYw";
		$("#addOrUpdform").ajaxSubmit(function(result){
	        if(result=="0"){
	          alert("操作成功！");
	          queryLike();
	        }else{
	           alert("操作失败！");
	        }
		});
	}
}

function updateDiv(ywlcdm,ywlcbbh,xtdm){
	
	$("#au_zt").val("2");
	
	 var url="<%=path%>/ywlcsz/querypzsfcz";
	    var param={'xtdm':xtdm,'ywlcdm':ywlcdm,'ywlcbbh':ywlcbbh};
	    $.post(url,param,function(result){
	    	if(result>0){	
	    		
	    		alert("已经存在,只能复制新的版本号！！！！"); 
	    	
	    	}else{
	    		Validator.ClearForm('addOrUpdform');
	    		var url="<%=path%>/ywlcsz/queryOneYw";
	    	
	    	    var param={'ywlcdm':ywlcdm,'ywlcbbh':ywlcbbh,'xtdm':xtdm};
	    	    $.post(url,param,function(result){
	    	    	
	    	        $.each(result,function(k, obj){
	    	            obj=obj==null? '' : obj;
	    	            $("input[id='"+k+"'],select[id='"+k+"'],textarea[id='"+k+"']").val(obj);
	                    }) },'json')
//	     	    $("input[id='ywlcdm']").attr("readonly",true);
//	     	    $("input[id='xtdm']").attr("readonly",true);
//	     	    $("input[id='ywlcbbh']").attr("readonly",true);
	    	    
	    	    $("input[id='ywlcdm']").attr("disabled",true);
	    	    $("input[id='ywlcmc']").attr("disabled",true);
	    	    $("input[id='xtdm']").attr("disabled",true);
	    	    $("input[id='ywlcbbh']").attr("disabled",true);
	    	    
//	     	    $("#kyf").attr("disabled",true);
	    		BOX_show('addOrUpd');
	    	
	    		
	    	}
	    	
	    });
	
	
// 	var i1=Panduansfcz(xtdm,ywlcdm,ywlcbbh);
// 	alert(i1);
// 	if(i1==0){
	
// 	}
// 	else
// 	{
// 		alert("已经存在只能复制新的版本号！！！！"); 
// 	}
	
}
//删除
function delYw(){
    if(isCheck('ids') == false){
        alert("请选择要删除的业务");
        return;
    }
    
    if(confirm("您确定要删除选中的业务吗？") == true){
        document.ff.action = "<%=path%>/ywlcsz/delYw";
        
        $('#ff').ajaxSubmit(function(r){
        	if(r == 1){
        		alert("删除成功");
        		queryLike();
        	}else{
        		alert("删除失败，存在不能删除实例，请重新选择");
        	}
    		
    	});
    }
}
function addYwLcbl (ywlcdm,ywlcmc,xtdm,ywlcbbh){
	var fhdm=$("#dmmc").val();
	
	$("#fhdm").val(fhdm);
	$("#szywlcmc").val(ywlcmc);
	$("#szywlcdm").val(ywlcdm);
	$("#szywlcbbh").val(ywlcbbh);
	
	document.ff.action = "<%=path%>/ywlcsz/addYwlcbl?xtdm="+xtdm+"&ywlcbbh="+ywlcbbh;
	
	document.ff.submit();
	
	
}

//跳转到编辑流程页面
function  addYwLc (ywlcdm,ywlcmc,xtdm,ywlcbbh){
// 	Panduansfcz(xtdm,ywlcdm,ywlcbbh);

	var fhdm=$("#dmmc").val();
	$("#fhdm").val(fhdm);
	$("#szywlcmc").val(ywlcmc);
	$("#szywlcdm").val(ywlcdm);
	document.ff.action = "<%=path%>/ywlcsz/addYwlc?xtdm="+xtdm+"&ywlcbbh="+ywlcbbh;
	document.ff.submit();
}


function Copybbh(ywlcdm,ywlcbbh,xtdm){
	$("#old_ywlcdm").val(ywlcdm);
	$("#old_ywlcbbh").val(ywlcbbh);
	$("#old_xtdm").val(xtdm);
  
	BOX_show('copyModal');
	
}

function CopyYwlc(ywlcdm,ywlcbbh,xtdm,ywlcmc){

	 var url="<%=path%>/ywlcsz/querypzsfcz";
	    var param={'xtdm':xtdm,'ywlcdm':ywlcdm,'ywlcbbh':ywlcbbh};
	    $.post(url,param,function(result){
	    	if(result>0){	
	    		
	    		alert("已经存在实例,无法操作！！！！"); 
	    	
	    	}else{
	    		
	$("#oldr_ywlcmc").val(ywlcmc);
	$("#oldr_ywlcdm").val(ywlcdm);
	$("#oldr_ywlcbbh").val(ywlcbbh);
	$("#oldr_xtdm").val(xtdm);	
	$("#newr_ywlcdm").val("")
	BOX_show('copylcModal');

	  $("input[id='oldr_ywlcmc']").attr("disabled",true);
	  $("input[id='oldr_ywlcdm']").attr("disabled",true);
	  $("input[id='oldr_ywlcbbh']").attr("disabled",true);
	  $("input[id='oldr_xtdm']").attr("disabled",true);
	    	}
	    })
}

  function fuzhi(){	  
	  
 	  document.copyform.action = "<%=path%>/ywlcsz/pdsffg";	  
      $('#copyform').ajaxSubmit(function(r1) {
    		  
    	if(r1==3){
    	alert("不能复制，已存在该版本号")
    	return;
//     		  if(confirm("您确定要覆盖已经存在的业务流程版本号吗？") == true){
<%--     			  document.copyform.action = "<%=path%>/ywlcsz/fuzhi"; --%>
    			  
//     		      $('#copyform').ajaxSubmit(function(r){
    		    	  
//     		        	if(r==1){
//     		        		alert("操作成功！");
//     		        		queryLike();
//     		        	}else{
//     		        		alert("操作失败！");
//     		        	}
    		      	   
//     		        });
//     		      }
    		      
         }
     else{
    		    	  document.copyform.action = "<%=path%>/ywlcsz/fuzhi";
        			  
        		      $('#copyform').ajaxSubmit(function(r){
        		    	  
        		        	if(r==1){
        		        		alert("操作成功！");
        		        		queryLike();
        		        	}else{
        		        		alert("操作失败！");
        		        	}
        		      	   
        		        });    	
    		      }  
    	
  
    	})
  }
 

  function fuzhilc(){
	  $("input[id='oldr_ywlcmc']").attr("disabled",false);
	  $("input[id='oldr_ywlcdm']").attr("disabled",false);
	  $("input[id='oldr_ywlcbbh']").attr("disabled",false);
	  $("input[id='oldr_xtdm']").attr("disabled",false);
	 
	  document.copylcform.action = "<%=path%>/ywlcsz/fuzhiYwlc";
	
      $('#copylcform').ajaxSubmit(function(r){
      	if(r==1){
      		alert("操作成功！");
      		queryLike();
      	}else{
      		alert("操作失败！");
      	}
      });
  }
  
  function Panduansfcz(xtdm,ywlcdm,ywlcbbh){
	  var i=0;
	  var url="<%=path%>/ywlcsz/querypzsfcz";
	    var param={'xtdm':xtdm,'ywlcdm':ywlcdm,'ywlcbbh':ywlcbbh};
	    $.post(url,param,function(result){
	    	if(result>0){	
	    		i=1;
	    		alert(i);
// 	    		alert("已经存在只能复制新的版本号！！！！"); 
	    		return 1;
	    	}
	    });
	      
	  return 0;
  }
  
  function changeywlcdm(ywlcdm){
	  if($("#oldr_ywlcdm").val()==$("#newr_ywlcdm").val()){
		   $("#dmxt").val("1");
		   var dmxt=  $("#dmxt").val();
		 
	  }
// 	  var ywlcbbh=$("#oldr_ywlcbbh").val();
<%-- 	  var url="<%=path%>/ywlcsz/querypzsfcz"; --%>
// 	    var param={'ywlcdm':ywlcdm,'ywlcbbh':ywlcbbh};
// 	    $.post(url,param,function(result){
// 	    	if(result>0){	
	    		
// 	    		alert("已经存在实例,不能进行该操作1111！！！！"); 
// 	    		return;
// 	    	}else{
	  
	  var oldywlcbbh=$("#oldr_ywlcbbh").val();
	 
// 	  alert(oldywlcbbh);
		var param = {'ywlcdm':ywlcdm,'oldywlcbbh':oldywlcbbh,'dmxt':dmxt};
		var url = "<%=path%>/ywlcsz/changeywlcdm"; 
		
			var option="";
			var option1="";
			$.post(url,param,function(result){
			$("#newr_ywlcmc").empty();	
			$("#newr_ywlcmc").append("<option value=''>--请选择--</option>"); 
			$("#newr_ywlcbbh").empty();	
			$("#newr_ywlcbbh").append("<option value=''>--请选择--</option>"); 
			
			$.each(result,function(key,value){  
// 				alert(value.YWLCMC)
// 					alert(value.YWLCBBH)
					 option+="<option value='"+value.YWLCMC+"'>"+value.YWLCMC+"</option>";
				 option1+="<option value='"+value.YWLCBBH+"'>"+value.YWLCBBH+"</option>";
			})
				$("#newr_ywlcmc").append(option);
			$("#newr_ywlcbbh").append(option1);
			});
	  	
// 	    	}
// 	    });
  }
  
   //工作流导出
  function gzldc(){
    if(isCheck('ids') == false){
        alert("请选择要导出的业务");
        return;
    }
        document.ff.action = "<%=path%>/ywlcsz/expGzldc";
        document.ff.submit();
    
}
function gzldr(){
	$("#file").val("");
	 
	BOX_show('drModal');
}

function dr(){
	if($('#file').val()!=null && $('#file').val()!=''){
		document.drform.action = "<%=path%>/ywlcsz/impGzldr";
     	document.drform.submit();
	}else{
		alert('请选择文件！');
	
	}

	 
}
  
</script>
</head>
<body>
   <div class="Contentbox">
   <div class="mainbg"></div>
    <div class="pd10">
        <div class="address">当前位置：${QXB.FQXMC} >> ${QXB.QXMC}</div>
        <div class="clr"></div>
        <div class="butsea"> 
   <form method="post" name="queryform" id="queryform">
         <%--   分页传参开始      	--%>
        <input type="hidden" name="fqxmc"  value="${QXB.FQXMC}" />
        <input type="hidden" name="qxmc"  value="${QXB.QXMC}" />
		<%--   分页传参结束      	--%>
<%--		<input type="hidden" name="ywid" id="ff_ywid" />--%>
            <table  border="0" align="right" cellpadding="0" cellspacing="0"  >
                <tr>
                    <td>业务id/名称：</td>
                    <td><input type="text" name="dmmc" id="dmmc" value="${ywlcdmbPage.dmmc}"/></td>
                    <td><div class="addlist_button2"> <a href="javascript:void(0);" onclick="javascript:queryLike();"><span>搜&nbsp;&nbsp;索</span></a> </div></td>
                </tr>
            </table>
          </form>
          <table  border="0" align="left" cellpadding="0" cellspacing="0"  >
                <tr>
                    <td height="35px">
                    	<div class="addlist_button"> <a href="javascript:addDivShyw();"><span>添&nbsp;&nbsp;加</span></a> </div>
						<div class="addlist_button  ml15"> <a href="javascript:delYw();"><span>删&nbsp;&nbsp;除</span></a> </div>
						<div class="addlist_button  ml15"> <a href="javascript:gzldc();"><span>导&nbsp;&nbsp;出</span></a> </div>
						<div class="addlist_button  ml15"> <a href="javascript:gzldr();"><span>导&nbsp;&nbsp;入</span></a> </div>
						
<!--                     	
  <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">添加</button> -->
<!--                           <div class="addlist_button"> <a href="javascript:delYw();"><span>删&nbsp;&nbsp;除</span></a> </div> -->
                    </td>
                </tr>
            </table>
        </div>
        <div class="clr"></div>
            <div class="list">
      <form name="ff" method="post" id="ff" >
		<input type="hidden" name="fqxmc"  value="${QXB.FQXMC}" />
        <input type="hidden" name="qxmc"  value="${QXB.QXMC}" />
<!--          <input type="hidden" name="ywlcbbh"  id="szywlcbbh" value="" /> -->
          <input type="hidden" name="ywlcmc"  id="szywlcmc" value="" />
            <input type="hidden" name="ywlcdm"  id="szywlcdm" value="" />
            <input type="hidden" name="fhdm"  id="fhdm" value="" />
        
        
        <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
        <th><input type="checkbox" id="ids" title="全选/不选" style="padding:0;margin-left:2px;*margin-left:-2px;"/></th>
			<th>业务流程DM</th>
			<th>业务流程名称</th>
<!-- 			<th>系统代码</th>    -->
			
			<th>业务表名</th> 
			<th>业务表id字段名</th> 
			<th>业务表代办人字段名</th> 
			<th>事务详情查看链接</th> 
			<th>业务流程审核查看链接</th> 		
			<th>业务流程版本号</th> 
			<th>业务流程类别</th> 
			<th>可用否</th> 
<!-- 			<th>审核开始时间</th>  -->
<!-- 			<th>审核结束时间</th>  -->
            <th>操作</th>
          </tr>
          <c:forEach items="${YwList}" var="map" varStatus="i">
  		    <tr <c:if test="${i.count % 2 eq '0'}">class="bgcol"</c:if>>
  		    
  		    <td><input type="checkbox" name="ids" style="padding:0;margin-left:2px;*margin-left:-2px;" value="${map.YWLCDM}@${map.XTDM}@${map.YWLCBBH}"/></td>
   		      <td width="80px">${map.YWLCDM}</td>
   		      <td width="90px">${map.YWLCMC}</td>
<%--    		       <td width="90px">${map.XTDM}</td>  --%>
   		     
   		      <td width="90px">${map.YWBM}</td>  
   		      <td width="100px">${map.YWBIDZDM}</td>     		  
   			
   			  <td width="120px">${map.YWBDBRZDM}</td> 	
   			    <td width="130px">${map.SWXQCKLJ}</td>    
   			  <td width="140px">${map.YWLCSHCKLJ}</td>
   			  <td width="100px">${map.YWLCBBH}</td>
   			    <td width="100px">${map.YWLCLBDM}</td>
   			       <td width="60px">${map.KYF=='0'?'否':'是'}</td>
<%--    			   <td style="dispalynone"><input type="hidden"  name="ywlcbbh" >${map.YWLCBBH}</input></td> --%>
<%--    		      <td>${map.SWXQCKLJ}</td> --%>
<%--    		       <td>${map.YWLCLB}</td> --%>
<%--    			  <td>${map.YWBDBRZDM}</td> --%>
<%--    		      <td>${map.XTDM}</td> --%>
   		      <td><a href="javascript:void(0);" onclick="javascript:updateDiv('${map.YWLCDM}','${map.YWLCBBH }','${map.XTDM }');"><div class="cz_button cz1_1" title="修改" ></div></a>
   		      <a href="javascript:void(0);" onclick="javascript:addYwLc('${map.YWLCDM}','${map.YWLCMC}','${map.XTDM}','${map.YWLCBBH }');"><div class="cz_button cz3_4" title="添加流程" ></div></a>  		      
   		       <a href="javascript:void(0);" onclick="javascript:addYwLcbl('${map.YWLCDM}','${map.YWLCMC}','${map.XTDM}','${map.YWLCBBH }');"><div class="cz_button cz2_5" title="添加流程变量" ></div></a>
   		        <a href="javascript:void(0);" onclick="javascript:Copybbh('${map.YWLCDM}','${map.YWLCBBH}','${map.XTDM}');"><div class="cz_button cz4_4" title="复制业务流程版本号" ></div></a>  	
   		           <a href="javascript:void(0);" onclick="javascript:CopyYwlc('${map.YWLCDM}','${map.YWLCBBH}','${map.XTDM}','${map.YWLCMC }');"><div class="cz_button cz1_5" title="复制业务根据业务流程" ></div></a>  	
   		      
   		      </td>
 			</tr>
	      </c:forEach>
        </table>
      </form>    
    </div>
 
   
        <div class="clr"></div>
         <div class="youtube">
        	<c:if test="${not empty ywlcdmbPage }">
             <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="ywlcdmbPage" onlyOneShow="true" showListNo="true" action="ywlcsz/queryYwList"/>
            </c:if>
        </div>
       </div>
	<div>
        <div class="clr"></div>
    </div>

<div id="addOrUpd" style="display:none; width: 550px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
<form id="addOrUpdform" name="addOrUpdform" method="post">
<%--  <input type="hidden" name="rylb" id="rylb"/> 人员类别 --%>
  <input type="hidden" name="ryxx" id="ryxx"/><%-- 人员信息 --%>
  <input type="hidden" name="zt" id="au_zt"/><%-- 状态  1.新增       2.修改 --%>
<!--   <input type="hidden" name="ywlcdm" id="ywlcdm"/> -->
<!--   <input type="hidden" name="ywlcmd" id="ywlcmc"/> -->
<!--   <input type="hidden" name="xtdm" id="xtdm"/> -->
<!--     <input type="hidden" name="ywlcbbh" id="ywlcbbh"/> -->
  
    <div class="popup">
        <div class="Floatleft Pct100 mb5">
            <div class="popup_left">添加/修改</div>
            <a href="#" class="btn_close" onclick="javascript:BOX_remove('addOrUpd');"></a> </div>
        <div class="clr"></div>
            <div style="height:500px; overflow-y:auto">
        <table id="divtab" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
            <tr>
                <th width="30%">业务流程DM：</th>
                <td align="left"><input name="ywlcdm" id="ywlcdm"   type="text" dataType="Require" msg="必填" />
                    <span class="red">*</span></td>
            </tr>
            <tr>
                <th>业务流程名称：</th>
                <td align="left"><input name="ywlcmc" id="ywlcmc"   type="text" dataType="Require" msg="必填"  />
                    <span class="red">*</span></td>
            </tr>
<!--             <tr> -->
<!--                 <th>系统DM：</th> -->
<!--                 <td align="left"><input name="xtdm" id="xtdm"   type="text" dataType="Require" msg="必填"  /> -->
<!--                     <span class="red">*</span></td> -->
<!--             </tr> -->
   			  <tr>
                <th>业务表名：</th>
                <td align="left"><input name="ywbm" id="ywbm"   type="text" dataType="Require" msg="必填"  />
                   <span class="red">*</span> </td>
            </tr>      
  			  <tr>
                <th>业务表id字段名：</th>
                <td align="left"><input name="ywbidzdm" id="ywbidzdm"   type="text" dataType="Require" msg="必填"  />
                    <span class="red">*</span> </td>
            </tr>
              <tr>
                <th width="35%">业务待办人字段名：</th>
                <td align="left"><input name="ywbdbrzdm" id="ywbdbrzdm"   type="text" dataType="Require" msg="必填"  />
                   <span class="red">*</span></td>
            </tr>
            
            
         
              <tr>
                <th>业务流程审核查看链接：</th>
                <td align="left"><input name="ywlcshcklj" id="ywlcshcklj"   type="text"   />
                  </td>
            </tr>
               <tr>
                <th>事务详情查看链接：</th>
                <td align="left"><input name="swxqcklj" id="swxqcklj"   type="text"   />
                   </td>
            </tr>
              <tr>
                <th>业务流程版本号：</th>
                <td align="left"><input name="ywlcbbh" id="ywlcbbh"   type="text" dataType="Require" msg="必填"  onkeyup="value=value.replace(/[^\d]/g,'') "
                />
                    <span class="red">*</span></td>
            </tr>
<!--              <tr> -->
<!--                 <th>系统代码：</th> -->
<!--                 <td align="left"><input name="xtdm" id="xtdm"   type="text" dataType="Require" msg="必填"  /> -->
<!--                     <span class="red">*</span></td> -->
<!--             </tr> -->
  <tr>              
                    <th>业务流程类别：</th>
                    <td>				  
					<select  name="ywlclbdm" id="ywlclbdm" />
	   			    <option value="">--请选择--</option>
                    <c:forEach items="${lbList}" var="map">
                    <option value="${map.DM}" <c:if test="${map.DM == ywlcdmbPage.ywlclbdm}">selected</c:if>>${map.MC}</option>
                    </c:forEach>		
			        </select>
					</td>
            </tr>
            <tr>
                <th>可用否：</th>
                <td align="left"><select name="kyf" id="kyf">
                <option value="1">是</option>
                <option value="0">否</option>
                </select> <span class="red">*</span></td>
            </tr>
         
            <tr>
                <td colspan="2" align="center"><div class="addlist_button1" style="float:right"><a href="javascript:BOX_remove('addOrUpd');"><span>取消</span></a> </div>
                    <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:addOrUpd();" title="保存" ><span>保存</span></a> </div></td>
            </tr>
        </table>
        </div>
        <div class="clr"></div>
    </div>
</form>
</div>
 
 
 
 <div id="drModal" style="display:none; width: 400px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
            <form id="drform" name="drform" method="post" enctype="multipart/form-data">
       		 
       		
                <div class="popup">
                    <div class="Floatleft Pct100 mb5">
                        <div class="popup_left">导入</div>
                        <a href="#" class="btn_close" onclick="javascript:BOX_remove('drModal');"></a> 
                    </div>
                    <div class="clr"></div>

                    <table id="divtab4" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">                    	
                        <tr>
                            <th width="10%">文件：</th>
                            <td><input type="file" id="file" name="file" /></td>                           
                        </tr> 
                        <tr>
                            <td colspan="2" height="30">
                                <div class="addlist_button1" style="float:right"><a href="javascript:BOX_remove('drModal');"><span>取消</span></a> </div>
                                <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:dr();" title="导入" ><span>导入</span></a> </div>
                            </td>
                        </tr>
                    </table>
                    <div class="clr"></div>

                </div>
            </form>
        </div>
 
 
 
  <!--复制-->
          <div id="copyModal" style="display:none; width: 400px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
            <form id="copyform" name="copyform" method="post">
<!--             <input type="hidden" id="old_ywlcbbh" name="old_ywlcbbh" value="" /> -->
       		<input type="hidden" id="old_xtdm" name="old_xtdm"  value=""/>
       		<input type="hidden" id="old_ywlcdm" name="old_ywlcdm" value=""/>
       		
                <div class="popup">
                    <div class="Floatleft Pct100 mb5">
                        <div class="popup_left">复制</div>
                        <a href="#" class="btn_close" onclick="javascript:BOX_remove('copyModal');"></a> 
                    </div>
                    <div class="clr"></div>

                    <table id="divtab4" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">                    	
                        <tr>
                            <th width="180">原业务流程版本号：</th>
                            <td>
   							<input type="text" id="old_ywlcbbh" name="old_ywlcbbh" />
<!--                                 <select id="copy_ywlcbbh" name="copy_ywlcbbh" > -->
<!--                                     <option value=''>请选择</option> -->
<%--                                   	<c:forEach items="${YwList}" var="obj"> --%>
<%--               	                  	<option  value="${obj.YWLCBBH }">${obj.YWLCBBH }</option>             	 --%>
<%--               						</c:forEach>				                    --%>
<!--                                 </select> -->
                            </td>                           
                        </tr> 
                        <tr>
                            <th>新版本号：</th>
                            <td>
 							<input  type="text" name ="new_ywlcbbh"   id="new_ywlcbbh"   value=""  onkeyup="value=value.replace(/[^\d]/g,'') "> </input>         
<!--                                 <select id="copy_xxnxq" name="xxnxq" > -->
<!--                                     <option value=''>请选择</option> -->
<%--                                     <c:forEach items="${xnxqList}" var="obj"> --%>
<%--               						<option  value="${obj.XNXQ }">${obj.XNMC }${obj.XQMC }</option>             	 --%>
<%--               						</c:forEach> --%>
<!--                                 </select> -->
                            </td>                           
                        </tr> 
                        
                        
                          <tr>
                            <td align="right" width="25%" color="red">提示：</td>
                            <td align="left" width="25%" colspan="3" >
   						<span style='color:red'>复制新版本默认未开放状态。</span>
                            </td>                           
                        </tr> 
                        
                                
                        <tr>
                            <td colspan="2" height="30">
                                <div class="addlist_button1" style="float:right"><a href="javascript:BOX_remove('copyModal');"><span>取消</span></a> </div>
                                <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:fuzhi();" title="复制" ><span>复制</span></a> </div>
                            </td>
                        </tr>
                    </table>
                    <div class="clr"></div>

                </div>
            </form>
        </div>
        
        <!--复制新的流程  -->
        <div id="copylcModal" style="display:none; width: 400px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
            <form id="copylcform" name="copylcform" method="post">
<!--             <input type="hidden" id="old_ywlcbbh" name="old_ywlcbbh" value="" /> -->
       	  <input type="hidden" id="dmxt" name="dmxt" value="" />
<!--        		<input type="hidden" id="oldr_ywlcbbh" name="oldr_ywlcbbh" value=""/> -->
       		
                <div class="popup">
                    <div class="Floatleft Pct100 mb5">
                        <div class="popup_left">复制新的业务流程</div>
                        <a href="#" class="btn_close" onclick="javascript:BOX_remove('copylcModal');"></a> 
                    </div>
                    <div class="clr"></div>

                    <table id="divtab4" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">                    	
                        <tr>
                            <th width="180">自身业务流程代码：</th>
                            <td>
   							<input type="text" id="oldr_ywlcdm" name="oldr_ywlcdm" />
                            </td>                           
                        </tr> 
                          <tr>
                            <th>自身业务流程版本号：</th>
                            <td>
   							<input type="text" id="oldr_ywlcbbh" name="oldr_ywlcbbh" />
                            </td>                           
                        </tr> 
                          <tr>
                            <th>自身业务流程系统代码：</th>
                            <td>
   							<input type="text" id="oldr_xtdm" name="oldr_xtdm" />
                            </td>                           
                        </tr> 
                        <tr>
                            <th>复制的业务流程名称：</th>
                            <td>
<!--  							<input  type="text" name ="newr_ywlcdm"   id="newr_ywlcdm"   value="" > </input>          -->
  							<select id="newr_ywlcdm" name="newr_ywlcdm"  	onclick="javascript:changeywlcdm(this.value);return false;"> 
                               <option value=''>请选择</option> 
                                <c:forEach items="${ywlcmcList}" var="obj"> 
             						<option  value="${obj.YWLCDM }">${obj.YWLCMC }</option>             
             						</c:forEach> 
                               </select> 
                            </td>                           
                        </tr> 
<!--                          <tr> -->
<!--                             <td align="right" width="25%">复制的业务流程名称：</td> -->
<!--                             <td align="left" width="25%" colspan="3"> -->
<!-- <!--  							<input  type="text" name ="newr_ywlcmc"   id="newr_ywlcmc"   value=""   > </input>          --> 
<!-- 								<select class="form-control" name="newr_ywlcmc" id="newr_ywlcmc" dataType="Require" msg="必选" onchange="javascript:changeywlcBBH(this.value);return false;"> -->
<!-- 								<option value="">--请选择--</option> -->
<%--                                             <c:forEach items="${ywlcmcList}" var="map"> --%>
<%--                                                 <option value="${map.YWLCMC}" >${map.YWLCMC}</option> --%>
<%--                                             </c:forEach> --%>

<!-- 						</select> -->
<!--                             </td>                            -->
<!--                         </tr>  -->
                        
                         <tr>
                            <th>复制的业务流程版本号：</th>
                            <td>
<!--  							<input  type="text" name ="newr_ywlcmc"   id="newr_ywlcmc"   value=""   > </input>          -->
								<select class="form-control" name="newr_ywlcbbh" id="newr_ywlcbbh" dataType="Require" msg="必选">
								<option value="">--请选择--</option>
                                            <c:forEach items="${ywlcmcbbhList}" var="map">
                                                <option value="${map.YWLCBBH}" >${map.YWLCBBH}</option>
                                            </c:forEach>

						</select>
                            </td>                           
                        </tr>           
                        <tr>
                            <td colspan="2" height="30">
                                <div class="addlist_button1" style="float:right"><a href="javascript:BOX_remove('copylcModal');"><span>取消</span></a> </div>
                                <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:fuzhilc();" title="复制" ><span>复制</span></a> </div>
                            </td>
                        </tr>
                    </table>
                    <div class="clr"></div>

                </div>
            </form>
        </div>

<div id="setting"> </div>
</div>
</body>
</html>


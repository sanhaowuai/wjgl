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
<title>数字管理中心</title>

<jsp:include page="../../include/css-main-include.jsp"></jsp:include>
<style type="text/css">
	html, body { height:100%; 
	}
	.Contentbox { width:100%; min-height:100%;height:auto }
	*html .Contentbox { height:100% }
	.u433 {
	    background-color:#CCCCCC;
	    text-align: left;;
	    font-family:'Arial';
	    font-size: 13px;
	    font-style:normal;
	    font-weight:normal;
	    text-decoration:none;
     }
</style>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>

<script type="text/javascript">
function updDiv(jddm,ywlcbbh,xtdm,ywlcdm){
	
	
	 Validator.ClearForm('addOrUpdform');
	 var url="<%=path%>/ywlcsz/querypzsfcz";
	    var param={'xtdm':xtdm,'ywlcdm':ywlcdm,'ywlcbbh':ywlcbbh};
	    $.post(url,param,function(result){
	    	if(result>0){	
	    		
	    		alert("已经存在实例无法修改,只能复制新的版本号！！！！"); 
	    	
	    	}else{
	

	var url="<%=path%>/ywlcsz/queryOneYwlcjd";
	$.post(url,{jddm:jddm,ywlcdm:ywlcdm,xtdm:xtdm,ywlcbbh:ywlcbbh},function(result){
		
	    $.each(result, function (k, obj) {
            obj = obj == null ? '' : obj;
            $("#divtab input[id='" + k + "'],#divtab select[id='" + k + "']").val(obj);
			        });	
// 	    alert(result.rylb)
	    $("#rylb").val(result.rylb);
// 	    alert(result.rylb)
	    if(result.rylb==1){
	    	
	    	$("#rylb1").attr("checked",true);
	    }
 		 if(result.rylb==2){
	    	
	    	$("#rylb2").attr("checked",true);
	    }  if(result.rylb==3){
	    	
	    	$("#rylb3").attr("checked",true);
	    }
 		 if(result.rylb==4){
	    	
	    	$("#rylb4").attr("checked",true);
	    }
// 	  		alert(result.ryxxmc);
 			$("#rymc").val(result.ryxxmc);
        	$("#xtdm1").val(result.xtdm);
        	$("#ywlcdm1").val(result.ywlcdm);
        	$("#ywlcbbh1").val(result.ywlcbbh);
//         	alert(result.shtghzsjdm);
        	$("#shtghzsjdm").html(result.shtghzsjdm);
        	$("#shbtghzsjdm").html(result.shbtghzsjdm);
        	$("#shtgqzsjdm").html(result.shtgqzsjdm);
        	$("#shbtgqzsjdm").html(result.shbtgqzsjdm);
        	$("#ryxxcxsql").html(result.ryxxcxsql);
// 		$("#jddm").val(result.jddm);
// 		$("#jdmc").val(result.jdmc);
// 		$("#sybjddm").val(result.sybjddm);
// 		$("#xybjddm").val(result.xybjddm);
// 		$("#rylb").val(result.rylb);
// 		$("#ryxx").val(result.ryxx);
		
// 		$("#rymc").val(result.rymc);
	
	
// 		$("input[name='rylb'][value='"+result.rylb+"']").attr("checked",true);
// 		$("#qxdm").val(result.qxdm);
// 		$("#ywlcbbh").val(result.ywlcbbh);
// 		$("#shjssj").val(result.shjssj);
// 		$("input[name='sfkxg'][value='"+result.sfkxg+"']").attr("checked",true);
// 		$("input[name='sfzhbz'][value='"+result.sfzhbz+"']").attr("checked",true);
//         $("#au_id").val(result.id);
	BOX_show('addOrUpd');
  		$("input[id='ywlcdm']").attr("disabled",true);
	    $("input[id='xtdm']").attr("disabled",true);
	    $("input[id='ywlcbbh']").attr("disabled",true);
	    $("input[id='jddm']").attr("disabled",true);
// 	    $("input[id='jdmc']").attr("disabled",true);
		$("input[id='ryxx']").attr("disabled",true);
		$("input[id='rymc']").attr("disabled",true);

		$("#au_zt").val("2");
	
	},'json');
	    	}
	    });
}
function queryLike(){
	document.queryform.action = "<%=path%>/ywlcsz/addYwlc";
	document.queryform.submit();
}
//返回上级页面
function fanhui(){
	document.queryform.action = "<%=path%>/ywlcsz/queryYwList";
	document.queryform.submit();
}
function deleteById(jddm,ywlcbbh,xtdm,ywlcdm){
	 var url="<%=path%>/ywlcsz/querypzsfcz";
	    var param={'xtdm':xtdm,'ywlcdm':ywlcdm,'ywlcbbh':ywlcbbh};
	    $.post(url,param,function(result){
	    	if(result>0){	
	    		
	    		alert("已经存在实例无法删除,只能复制新的版本号！！！！"); 
	    	
	    	}else{
	
	
	if(confirm("您确定要删除该流程吗？")){
		var url="<%=path%>/ywlcsz/delYwlc";
		$.post(url,{jddm:jddm,ywlcbbh:ywlcbbh,xtdm:xtdm,ywlcdm:ywlcdm},function(result){
	           if(result=="1"){
	              alert("删除成功！");
	              queryLike();
	           }else{
	              alert("删除失败！");
	           }
		},'json');
	}
	    	}
	    });
}
//添加流程
function addDiv(){
	
	Validator.ClearForm('addOrUpdform');
// 	$("input[id='ryxx']").attr("disabled",false);
	var ywlcbbh=$("#ywlcbbh").val();
	var xtdm=$("#xtdmadd").val();
	var ywlcdm=$("#ywlcdmadd").val();
	
	 var url="<%=path%>/ywlcsz/querypzsfcz";
	    var param={'xtdm':xtdm,'ywlcdm':ywlcdm,'ywlcbbh':ywlcbbh};
	    $.post(url,param,function(result){
	    	if(result>0){	
	    		
	    		alert("已经存在实例无法添加,只能复制新的版本号！！！！"); 
	    	
	    	}else{
	    		 $("input[id='jddm']").attr("disabled",false);
	    		    $("input[id='jdmc']").attr("disabled",false);
	    		
	    		$("#addOrUpd").find('input[type=text],select').each(function() {
	     		        $(this).val('');
	     		   });
// 	$("#bzid").val('');
// 	$("#bzmc").val('');
// 	$("#rymc").val('');
// 	$("#rylb").val('');
// 	$("#sygbz").val('');
// 	$("#xygbz").val('');
			$("#shtghzsjdm").html("");
        	$("#shbtghzsjdm").html("");
        	$("#shtgqzsjdm").html("");
        	$("#shbtgqzsjdm").html("");
        	$("#ryxxcxsql").html("");
        	$("input[type='radio']").removeAttr('checked');
        
	$("#au_zt").val("1");
	BOX_show('addOrUpd');
	    	}
	    });
}
function chooseRyxx(rylb){
	
	$("#rylb").val(rylb);
	$("#rymc").val('');
	if(rylb=="1"){ //角色
		window.open('<%=path%>/ywlcsz/queryAllJs',"选择角色",'height=600, width=900, top=100, left=300, titlebar=no,toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no,z-look=yes');
	}else if(rylb=="2"){//部门
		window.open('<%=path%>/ywlcsz/queryAllyx',"选择部门",'height=600, width=900, top=100, left=300, titlebar=no,toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no,z-look=yes');
	}else if(rylb=="3"){//具体人员
		window.open('<%=path%>/ywlcsz/queryAllyh',"选择人员",'height=600, width=900, top=100, left=300, titlebar=no,toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no,z-look=yes');
	}else if(rylb=="4"){//岗位
		window.open('<%=path%>/ywlcsz/queryAllgw',"选择岗位",'height=600, width=900, top=100, left=300, titlebar=no,toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no,z-look=yes');
	}
// 	else if(rylb=="4"){//院
// 		$("#ryxx").val('4');
// 		$("#rymc").val('院');	
// 	}else if(rylb=="5"){//教研室
// 		$("#ryxx").val('5');
// 		$("#rymc").val('教研室');	
// 	}else if(rylb=="6"){//教研室
// 		$("#ryxx").val('6');
// 		$("#rymc").val('导师');	
// 	}
}
//选择角色带回方法
function resultJuese(str){
	
	$("#ryxx").val(str[0]);
	$("#rymc").val(str[1]);
}
//选择部门带回方法
function resultBm(str){
	$("#ryxx").val(str[0]);
	$("#rymc").val(str[1]);
}
//选择人员带回方法
function resultjsxx(str){
	$("#ryxx").val(str[0]);
	$("#rymc").val(str[1]);
}
function addOrUpd(){
	
		var ryxx = $("#ryxx").val();
	
		if(Validator.Validate(document.getElementById('addOrUpdform'),3)){
		
		if(ryxx == null || ryxx == ""){
			alert('请选择流程对象');
		}else {
			$("input[id='ywlcdm']").attr("disabled",false);
		    $("input[id='xtdm']").attr("disabled",false);
		    $("input[id='ywlcbbh']").attr("disabled",false);
		    $("input[id='jddm']").attr("disabled",false);
		    $("input[id='jdmc']").attr("disabled",false);
		    $("input[id='ryxx']").attr("disabled",false);
		    $("input[id='rylb']").attr("disabled",false);
		    $("input[id='rymc']").attr("disabled",false);
			document.addOrUpdform.action='<%=path%>/ywlcsz/addorupdateYwlc';
			
	
			$("#addOrUpdform").ajaxSubmit(function(result){
		         if(result=="0"){
		            alert("增加成功！");
		            queryLike();
		         }if(result=="1"){
		             alert("增加失败，该节点代码已经存在！");
		             queryLike();
		         }if(result=="2"){
		        	   alert("更新成功！");
		        	   queryLike();
		         }if(result=="3"){
		        	   alert("更新失败！"); 
		        	   queryLike();
		         }
			});
		}
		}
}
function changejd(){
	
	var ywlcdm =$("#ywlcdm1").val();
// alert(ywlcdm)

	var url = "<%=path%>/ywlcsz/queryjdbh"; 
		var param = {'ywlcdm':ywlcdm};
		var option="";	
		$.post(url,param,function(result){	
		$("#sybjddm").empty();	
		$("#sybjddm").append("<option value=''>--请选择--</option>"); 
		
		$.each(result,function(key,value){  
		
// 				alert(value.JDDM)
//					alert(value.YWLCBBH)
				 option+="<option value='"+value.JDDM+"'>"+value.JDMC+"</option>";
		
		})
			$("#sybjddm").append(option);
	
		});
	
	
}
</script>
</head>
<body>
<div class="Contentbox">
<div class="mainbg"></div> 
    <div class="pd10">
        <div class="address">当前位置：${qxb.FQXMC} >> ${qxb.QXMC}</div>
        <div class="clr"></div>
        <div class="butsea"> 
        <form method="post" name="ff" id="ff">
         <%--   分页传参开始      	--%>
<%-- 		<input type="hidden" name="pageCount"  value="${ywlcYmPage.pageCount}" /> --%>
<%-- 		<input type="hidden" name="pageNo"  value="${ywlcYmPage.pageNo}" /> --%>
<%-- 		<input type="hidden" name="pageSize"  value="${ywlcYmPage.pageSize}" /> --%>
<%-- 		<input type="hidden" name="pmc"  value="${ywlcYmPage.pmc}" /> --%>
		<input type="hidden" name="fqxmc"  value="${qxb.FQXMC}" />
      	<input type="hidden" name="qxmc"  value="${qxb.QXMC}" />
		<%--   分页传参结束      	--%>
<%--		<input type="hidden" name="ywid" id="ff_ywid" value="${ywid}"/>--%>
  		 </form>
          <form method="post" name="queryform" id="queryform">
           <input type="hidden" name="fqxmc"  value="${qxb.FQXMC}" />
      		<input type="hidden" name="qxmc"  value="${qxb.QXMC}" />
           <input type="hidden" name="ywlcbbh" id="ywlcbbh" value="${ywlcbbh}"/>
             <input type="hidden" name="xtdmadd" id="xtdmadd" value="${xtdm}"/>
              <input type="hidden" name="xtdm" id="xtdm" value="${xtdm}"/>
               <input type="hidden" name="ywlcdmadd" id="ywlcdmadd" value="${ywlcdm}"/>
           	 <input type="hidden" name="ywlcdm" id="ywlcdm" value="${ywlcdm}"/>
      		 <input type="hidden" name="fhdm" id="fhdm" value="${fhdm}"/>
<%--              <input type="hidden" name="ywlcdm" id="ywlcdm" value="${ywlcYmPage.ywlcdm}"/> --%>
<%--               <input type="hidden" name="ywlcmc" id="ywlcmc" value="${ywlcYmPage.ywlcmc}"/> --%>
<%--                <input type="hidden" name="xtdm" id="xtdm" value="${ywlcYmPage.xtdm}"/> --%>
               
          </form>
          <table  border="0" align="left" cellpadding="0" cellspacing="0"  >
                <tr>
                    <td height="35px">
                    	<div class="addlist_button "> <a href="javascript:addDiv();"><span>添&nbsp;&nbsp;加</span></a> </div>
                    	<div class="addlist_button ml15"> <a href="javascript:fanhui();"><span>返&nbsp;&nbsp;回</span></a> </div>
                    	
                    </td>
                </tr>
            </table>
        </div>
        <div class="clr"></div>
       
      <div class="list">
      <form name="ff" method="post" id="ff" >

        <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
<!-- 	                    <th>业务DM</th> -->
	                    <th>业务名称</th>
	                    <th>节点代码</th>
	                    <th>节点名称</th>
	                    <th>人员类别</th>
	                    <th>人员信息</th>	
	                    <th>审核详情链接</th>		               
	                    <th>上一步节点</th>
	                    <th>下一步节点</th>
	                	<th>节点类型</th>
	                    <th>显示顺序</th>
	                    <th>权限代码</th>	                         	                  
	                    <th>操作</th>
          </tr>
          <c:forEach items="${list}" var="map" varStatus="i">
  		    <tr <c:if test="${i.count % 2 eq '0'}">class="bgcol"</c:if>>
<%--    		      <td>${map.YWLCDM}</td> --%>
   		      <td>${map.YWLCMC}</td>
   			  <td>${map.JDDM}</td>
   		      <td>${map.JDMC}</td>
   		      <td>${map.RYLB}</td>
   		      <td>${map.RYXXMC}</td>
   		       <td>${map.SHXQLJ}</td>
   		      <td>${map.SYBJDMC}</td>
   		      <td>${map.XYBJDMC}</td>
   			 <td>
   			 	<c:if test="${map.JDLX=='1'}">起始节点</c:if>
   			 	<c:if test="${map.JDLX=='2'}">终止节点</c:if>
   			 	<c:if test="${map.JDLX=='3'}">一般节点</c:if>
   			 </td>
   		      <td>${map.XSSX}</td>   		      
<%--    		      <td>${map.XTDM}</td> --%>
   		      <td>${map.QXDM}</td>
   		  
   		      <td><a href="javascript:void(0);" onclick="javascript:updDiv('${map.JDDM}','${map.YWLCBBH}','${map.XTDM}','${map.YWLCDM}');"><div class="cz_button cz_modify" title="修改" ></div></a>
   		      <a href="javascript:void(0);" onclick="javascript:deleteById('${map.JDDM}','${map.YWLCBBH}','${map.XTDM}','${map.YWLCDM}');"><div class="cz_button cz_del" title="删除" ></div></a>
   		      </td>
 			</tr>
	      </c:forEach>
        </table>
      </form>    
    </div>
        <div class="clr"></div>
	<div>
        <div class="clr"></div>
    </div>

<div id="addOrUpd" style="display:none; width: 750px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
<!-- <div id="addOrUpd" style="display:none; width: 500px; height:500px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" > -->
<form id="addOrUpdform" name="addOrUpdform" method="post">
<%--  <input type="hidden" name="rylb" id="rylb"/> 人员类别 --%>
<%--   <input type="hidden" name="ryxx" id="ryxx"/>人员信息 --%>
  <input type="hidden" name="zt" id="au_zt"/><%-- 状态  1.新增       2.删除 --%>
<%--   <input type="hidden" name="ywlcdm" id="ywlcdm" value="${ywlcdm}"/> --%>
  <input type="hidden" name="ywlcmc" id=ywlcmc value="${ywlcYmPage.ywlcmc}"/>
   <input type="hidden" name="xtdm" id=xtdm1 value="${ywlcYmPage.xtdm}" />
    <input type="hidden" name="ywlcdm" id="ywlcdm1" value="${ywlcYmPage.ywlcdm}"/>
    <input type="hidden" name="ywlcbbh" id="ywlcbbh1" value="${ywlcYmPage.ywlcbbh }"/>
<!--    <input type="hidden" name="rylb" id="rylb" /> -->
    <div class="popup">
        <div class="Floatleft Pct100 mb5">
            <div class="popup_left">添加/修改</div>
            <a href="#" class="btn_close" onclick="javascript:BOX_remove('addOrUpd');"></a> </div>
        <div class="clr"></div>
         <div style="height:550px; overflow-y:auto">
<!--         <table id="divtab" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse"> -->
               <table id="divtab" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse;*width:97%;">
            <tr>
                <th width="15%">节点代码：</th>
                <td width="25%" align="left"><input name="jddm" id="jddm"   type="text" dataType="Require" msg="必填" />
                    <span class="red">*</span></td>
          
                <th width="16%">节点名称：</th>
                <td  width="25%" align="left"><input name="jdmc" id="jdmc"   type="text" dataType="Require" msg="必填"  />
                    <span class="red">*</span></td>
            </tr>
            <tr>
                <th width="15%">上一步节点：</th>
                <td width="25%" align="left">
          
                <select  name="sybjddm" id="sybjddm"  >
										<option value="">--请选择--</option>
									<c:forEach items="${jdlist}" var="map" varStatus="status">
										<option value="${map.JDDM}"
											<c:if test="${ywlcYmPage.jddm eq map.JDDM}">selected</c:if>>${map.JDMC}</option>
									</c:forEach>
							</select>
                	
                <span class="red">*</span> </td>
       
                <th width="15%">下一步节点：</th>
                <td width="25%" align="left">
                	  <select  name="xybjddm" id="xybjddm">
									<option value="">--请选择--</option>
									<c:forEach items="${jdlist}" var="map" varStatus="status">
										<option value="${map.JDDM}"
											<c:if test="${ywlcYmPage.jddm eq map.JDDM}">selected</c:if>>${map.JDMC}</option>
									</c:forEach>
							</select>
                 <span class="red">*</span></td>
            </tr>            
            <tr>
                <th width="15%">审核详情链接：</th>
                <td width="25%" align="left">
					<input name="shxqlj" id="shxqlj"   type="text"/>
                </td>
          
                <th width="15%">人员信息：</th>
                <td width="25%" align="left">
                	<input name="ryxx" id="ryxx"  readonly type="text" dataType="Require" msg="必选"/>
				  <span class="red">*</span></td>
            </tr> 
               <tr>
                     <th width="15%">人员信息名称：</th>
                <td  colspan="3" align="left">
                     <input name="rymc" id="rymc" readonly  type="text" dataType="Require" msg="必选" />
                     <br />
                   <input type="hidden"  name="rylb"   id="rylb" value=""/>
                   <input type="radio" name="rylb1" value="1"  id="rylb1" onclick="javascript:chooseRyxx('1');">角色（1）</input>
                   <input type="radio" name="rylb1" value="2" id="rylb2" onclick="javascript:chooseRyxx('2');"/>部门（2）
                   <input type="radio" name="rylb1" value="3" id="rylb3"onclick="javascript:chooseRyxx('3');"/>具体人员（3）
                   <input type="radio" name="rylb1" value="4" id="rylb4"onclick="javascript:chooseRyxx('4');"/>岗位（4）
<!--                    <input type="radio" name="rylb" value="5" onclick="javascript:chooseRyxx('5');"/>教研室 -->
<!--                    <input type="radio" name="rylb" value="6" onclick="javascript:chooseRyxx('6');"/>导师 -->
                 </td>
            </tr>
                                               
            <tr>
                  <th width="10%">节点类型:</th>
                <td width="25%" align="left">
<!--                    	<input name="jdlx" id="jdlx"   type="text"/> -->
                   	<select name="jdlx" id="jdlx" dataType="Require" msg="必选 ">
                   	  	<option value="">请选择</option>
                   	<option value="1">起始节点</option>
                   	  	<option value="2">终止节点</option>
                   	  	  	<option value="3">一般节点</option>
                   	
                   	</select>
                     <span class="red">*</span></td>
     
<%--             <tr>--%>
<%--                <th>人员类别：</th>--%>
<%--                <td align="left">--%>
<%--                    <input name="rylbmc" id="rylbmc"   type="text" dataType="Require" msg="必填" readonly="readonly" class="u433" /> --%>
<%--                    <span class="red">*</span></td>--%>
<%--            </tr>--%>
<!--  			<tr> -->
<!--                 <th>系统代码：</th> -->
<!--                 <td align="left"> -->
<!--             <input type="text" name="xtdm" id="xtdm1"    /> -->
<!--                       <span class="red">*</span> </td> -->
<!--             </tr> -->
 			
                <th width="10%">权限代码：</th>
                <td width="25%" align="left">
           <input type="text" name="qxdm" id="qxdm" />
           
                     </td>
            </tr>         
            <tr>
                <th width="15%">审核通过前置事件(class包名)：</th>
                <td  width="25%" align="left">
                   	<input name="shtgqzsj" id="shtgqzsj"   type="text"/>
                    </td>
          
                <th width="15%">审核不通过前置事件(class包名)：</th>
                <td width="25%" align="left">
                   	<input name="shbtgqzsj" id="shbtgqzsj"   type="text"/>
                   </td>
            </tr>
       
            <tr>
                <th width="15%">审核通过后置事件(class包名):</th>
                <td width="25%" align="left">
                   	<input name="shtghzsj" id="shtghzsj"   type="text"/>
                   </td>
           
                <th width="15%">审核不通过后置事件(class包名):</th>
                <td width="25%" align="left">
                   	<input name="shbtghzsj" id="shbtghzsj"   type="text"/>
                  </td>
            </tr>
            
            <tr>
                <th width="15%">审核通过状态显示名称:</th>
                <td width="25%" align="left">
                   	<input name="shtgztxsmc" id="shtgztxsmc"   type="text"/>
                   </td>
          
                <th width="15%">审核不通过状态显示名称:</th>
                <td width="25%" align="left">
                   	<input name="shbtgztxsmc" id="shbtgztxsmc"   type="text"/>
                  </td>
            </tr>
             <tr>
                <th width="15%">显示顺序:</th>
                <td width="25%" align="left">
                   	<input name="xssx" id="xssx" dataType="Require" msg="必填"   type="text" onkeyup="value=value.replace(/[^\d]/g,'') "
                   	/>
                  </td>
          
                <th width="15%">是否所属发起人部门:</th>
                
                  <td width="25%" align="left">
                   	<select name="sfssfqrbm" id="sfssfqrbm" dataType="Require" msg="必选 ">
                   	 <option value="0">否</option>
                   	<option value="1">是</option>
                   	  	
                   	  	  	
                   	
                   	</select>
                     <span class="red">*</span></td>
              
            </tr>
            
             <tr>
           <th>人员信息查询SQL：</th>
           <td colspan="3"><textarea name="ryxxcxsql" id="ryxxcxsql"   cols="40" rows="10" style="margin:0px;width:100%;resize: none;"></textarea>
            </tr>
            
            
            
           
            <tr>
           <th>审核通过前置事件代码：</th>
           <td colspan="3"><textarea name="shtgqzsjdm" id="shtgqzsjdm"   cols="40" rows="10" style="margin:0px;width:100%;resize: none;"></textarea>
            </tr>
             <tr>
           <th>审核不通过前置事件代码：</th>
           <td colspan="3"><textarea name="shbtgqzsjdm" id="shbtgqzsjdm"   cols="40" rows="10" style="margin:0px;width:100%;resize: none;"></textarea>
            </tr>
               <tr>
           <th>审核通过后置事件代码：</th>
           <td colspan="3"><textarea name="shtghzsjdm" id="shtghzsjdm"   cols="40" rows="10" style="margin:0px;width:100%;resize: none;"></textarea></td>
            </tr>
               <tr>
           <th>审核不通过后置事件代码：</th>
           <td colspan="3"><textarea name="shbtghzsjdm" id="shbtghzsjdm"   cols="40" rows="10" style="margin:0px;width:100%;resize: none;"></textarea>
            </tr>
   
            <tr>
                <td colspan="4" align="center"><div class="addlist_button1" style="float:right"><a href="javascript:BOX_remove('addOrUpd');"><span>取消</span></a> </div>
                    <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:addOrUpd();" title="保存" ><span>保存</span></a> </div></td>
            </tr>
        </table>
        <div class="clr"></div>
    </div>
</form>

</div>
 </div>
      <div class="youtube">
        	<c:if test="${not empty ywlcYmPage }">
             <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="ywlcYmPage" onlyOneShow="true" showListNo="true" action="ywlcsz/addYwlc"/>
            </c:if>
        </div>
<div id="setting"> </div>
</div>
</body>
</html>


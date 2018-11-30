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
// $(document).ready(function(){
// 	   $("#ff").baigoCheckall();
// 	});

function updDiv(bldm,ywlcdm,xtdm,ywlcbbh){
	 Validator.ClearForm('addOrUpdform');
	 var url="<%=path%>/ywlcsz/querypzsfcz";
	    var param={'xtdm':xtdm,'ywlcdm':ywlcdm,'ywlcbbh':ywlcbbh};
	    $.post(url,param,function(result){
	    	if(result>0){	
	    		
	    		alert("已经存在实例无法修改,只能复制新的版本号！！！！"); 
	    	
	    	}else{
	

	var url="<%=path%>/ywlcsz/queryOneYwlcbl";
	$.post(url,{bldm:bldm,ywlcdm:ywlcdm,xtdm:xtdm,ywlcbbh:ywlcbbh},function(result){

		$("#bldm").val(result.bldm);
		$("#blmc").val(result.blmc);
		 $("input[id='bldm']").attr("disabled",true);
// 		 $("input[id='blmc']").attr("disabled",true);
		$("#ywlcdm1").val(result.ywlcdm);
		$("#kyf").val(result.kyf);
// 		$("#ywlcmc").val(result.ywlcmc);
		$("#bllx").val(result.bllx);
		$("#ywlcbbh1").val(result.ywlcbbh);
		$("#rymc").val(result.rymc);
		$("#xtdm1").val(result.xtdm);
		
		$("#format").val(result.format);
	
// // 		$("input[name='rylb'][value='"+result.rylb+"']").attr("checked",true);
// 		$("#qxdm").val(result.qxdm);
// 		$("#ywlcbbh").val(result.ywlcbbh);
// 		$("#shjssj").val(result.shjssj);
// 		$("input[name='sfkxg'][value='"+result.sfkxg+"']").attr("checked",true);
// 		$("input[name='sfzhbz'][value='"+result.sfzhbz+"']").attr("checked",true);
//         $("#au_id").val(result.id);
		$("#au_zt").val("2");
		BOX_show('addOrUpd');
	},'json');
	    	}
	    })
}
function queryLike(){
	document.queryform.action = "<%=path%>/ywlcsz/addYwlcbl";
	document.queryform.submit();
}
//返回上级页面
function fanhui(){
	document.queryform.action = "<%=path%>/ywlcsz/queryYwList";
	document.queryform.submit();
}
function deleteById(bldm,ywlcbbh,xtdm,ywlcdm){
	
	 var url="<%=path%>/ywlcsz/querypzsfcz";
	    var param={'xtdm':xtdm,'ywlcdm':ywlcdm,'ywlcbbh':ywlcbbh};
	    $.post(url,param,function(result){
	    	if(result>0){	
	    		
	    		alert("已经存在实例无法删除,只能复制新的版本号！！！！"); 
	    	
	    	}else{
	if(confirm("您确定要删除该流程变量吗？")){
		
		var url="<%=path%>/ywlcsz/delYwlcbl";
		$.post(url,{bldm:bldm,ywlcbbh:ywlcbbh,xtdm:xtdm,ywlcdm:ywlcdm},function(result){
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
	var xtdm=$("#xtdm1").val();
	var ywlcdm=$("#ywlcdm2").val();
	var ywlcbbh=$("#ywlcbbh1").val();
	 var url="<%=path%>/ywlcsz/querypzsfcz";
	    var param={'xtdm':xtdm,'ywlcdm':ywlcdm,'ywlcbbh':ywlcbbh};
	    $.post(url,param,function(result){
	    	if(result>0){	
	    		
	    		alert("已经存在实例无法删除,只能复制新的版本号！！！！"); 
	    	
	    	}else{
// 	$("input[name='sfkxg'][value='"+1+"']").attr("checked",true);
	$("#bldm").val("");
		$("#blmc").val("");
		$("#ywlcdm1").val("");
		$("#kyf").val("");
// 		$("#ywlcmc").val("");
		$("#bllx").val("");
		$("#ywlcbbh5").val("");
		$("#rymc").val("");
		$("#xtdm5").val("");
		$("#format").val("");
	$("#au_zt").val("1");
	BOX_show('addOrUpd');
	    	}
	    });
}
// function chooseRyxx(rylb){
// //	$("#rylb").val(rylb);
// 	$("#rymc").val('');
// 	if(rylb=="1"){ //角色
<%-- 		window.open('<%=path%>/ywlcsz/queryAllJs',"选择角色",'height=600, width=900, top=100, left=300, titlebar=no,toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no,z-look=yes'); --%>
// 	}else if(rylb=="2"){//部门
<%-- 		window.open('<%=path%>/ywlcsz/queryAllyx',"选择部门",'height=600, width=900, top=100, left=300, titlebar=no,toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no,z-look=yes'); --%>
// 	}else if(rylb=="3"){//具体人员
<%-- 		window.open('<%=path%>/ywlcsz/queryAllyh',"选择人员",'height=600, width=900, top=100, left=300, titlebar=no,toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no,z-look=yes'); --%>
// 	}else if(rylb=="4"){//岗位
<%-- 		window.open('<%=path%>/ywlcsz/queryAllgw',"选择岗位",'height=600, width=900, top=100, left=300, titlebar=no,toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no,z-look=yes'); --%>
// 	}
// // 	else if(rylb=="4"){//院
// // 		$("#ryxx").val('4');
// // 		$("#rymc").val('院');	
// // 	}else if(rylb=="5"){//教研室
// // 		$("#ryxx").val('5');
// // 		$("#rymc").val('教研室');	
// // 	}else if(rylb=="6"){//教研室
// // 		$("#ryxx").val('6');
// // 		$("#rymc").val('导师');	
// // 	}
// }
// //选择角色带回方法
// function resultJuese(str){
// 	$("#ryxx").val(str[0]);
// 	$("#rymc").val(str[1]);
// }
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
	 $("input[id='bldm']").attr("disabled",false);
	 $("input[id='blmc']").attr("disabled",false);
	 Validator.ClearForm('addOrUpdform');
	 if(Validator.Validate(document.getElementById('addOrUpdform'),3)){
			document.addOrUpdform.action='<%=path%>/ywlcsz/addorupdateYwBl';
			
	
			$("#addOrUpdform").ajaxSubmit(function(result){
		         if(result=="0"){
		            alert("增加成功！");
		            queryLike();
		         }if(result=="1"){
		        	
		             alert("增加失败,该变量代码已存在！");
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
</script>
</head>
<body>
<div class="Contentbox">
<div class="mainbg"></div> 
    <div class="pd10">
        <div class="address">当前位置：${qxb.FQXMC} >> ${qxb.QXMC}</div>
        <div class="clr"></div>
        <div class="butsea"> 
<!--         <form method="post" name="ff" id="ff"> -->
         <%--   分页传参开始      	--%>
<%-- 		<input type="hidden" name="pageCount"  value="${ywlcBlPage.pageCount}" /> --%>
<%-- 		<input type="hidden" name="pageNo"  value="${ywlcBlPage.pageNo}" /> --%>
<%-- 		<input type="hidden" name="pageSize"  value="${ywlcBlPage.pageSize}" /> --%>
<%-- 		<input type="hidden" name="pmc"  value="${ywlcBlPage.pmc}" /> --%>
<%-- 		<input type="hidden" name="fqxmc"  value="${qxb.FQXMC}" /> --%>
<%--       	<input type="hidden" name="qxmc"  value="${qxb.QXMC}" /> --%>
		<%--   分页传参结束      	--%>
<%--		<input type="hidden" name="ywid" id="ff_ywid" value="${ywid}"/>--%>
<!--   		 </form> -->
          <form method="post" name="queryform" id="queryform">
           <input type="hidden" name="fqxmc"  value="${qxb.FQXMC}" />
      		<input type="hidden" name="qxmc"  value="${qxb.QXMC}" />
             <input type="hidden" name="ywlcdm" id="ywlcdm" value="${ywlcdm}"/>
              <input type="hidden" name="xtdm" id="xtdm" value="${xtdm}"/>
              <input type="hidden" name="ywlcbbh" id="ywlcbbh" value="${ywlcbbh}"/>
              <input type="hidden" name="ywlcmc" id="ywlcmc" value="${ywlcmc}"/>
              <input type="hidden" name="fhdm" id="fhdm" value="${fhdm}"/>
<%--               <input type="hidden" name="ywlcmc" id="ywlcmc" value="${ywlcmc}"/> --%>
<%--                <input type="hidden" name="xtdm" id="xtdm" value="${xtdm}"/> --%>
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
<!--            <th><input type="checkbox" id="ids" title="全选/不选" /></th> -->
<!-- 	                    <th>业务DM</th> -->
	                    <th>业务名称</th>
	                    <th>变量代码</th>
	                    <th>变量名称</th>
	                    <th>变量类型</th>	 
	                    <th>formart</th>	      	
	                    <th>可用否</th>		               
<!-- 	                    <th>系统代码</th>	                -->
<!-- 	                    <th>业务流程版本号</th>	                    	                   -->
	                    <th>操作</th>
          </tr>
          <c:forEach items="${list}" var="map" varStatus="i">
  		    <tr <c:if test="${i.count % 2 eq '0'}">class="bgcol"</c:if>>
<%--   		     <td><input type="checkbox" name="ids"  value="${map.YWLCDM}@${map.XTDM}@${map.YWLCBBH}@${map.BLDM}"/></td> 		     --%>
<%--    		      <td>${map.YWLCDM}</td> --%>
   		      <td>${map.YWLCMC}</td>
   			  <td>${map.BLDM}</td>
   		      <td>${map.BLMC}</td>
   		      <td>${map.BLLX}</td>  
   		      <td>${map.FORMAT}</td>
   		      <td>${map.KYF=='0'?'否':'是'}</td>
   		      
   		   
   		    
<%--    		       <td>${map.XTDM}</td>   --%>
<%--    		      <td>${map.YWLCBBH}</td>   		 --%>
   		      <td><a href="javascript:void(0);" onclick="javascript:updDiv('${map.BLDM}','${map.YWLCDM}','${map.XTDM}','${map.YWLCBBH}');"><div class="cz_button cz_modify" title="修改" ></div></a>
   		      <a href="javascript:void(0);" onclick="javascript:deleteById('${map.BLDM}','${map.YWLCBBH}','${map.XTDM}','${map.YWLCDM}');"><div class="cz_button cz_del" title="删除" ></div></a>
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


<div id="addOrUpd" style="display:none; width: 500px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
<form id="addOrUpdform" name="addOrUpdform" method="post">
<%--  <input type="hidden" name="rylb" id="rylb"/> 人员类别 --%>
<%--   <input type="hidden" name="ryxx" id="ryxx"/>人员信息 --%>
  <input type="hidden" name="zt" id="au_zt"/><%-- 状态  1.新增       2.删除 --%>
<%--   <input type="hidden" name="ywlcdm" id="ywlcdm" value="${ywlcdm}"/>业务id --%>
  <input type="hidden" name="ywlcbbh" id="ywlcbbh1" value="${ywlcbbh}"/>
  <input type="hidden" name="xtdm" id="xtdm1" value="${xtdm}"/>
  <input type="hidden" name="ywlcdm" id="ywlcdm2"   value="${ywlcdm}"/>
<%--   <input type="hidden" name="ywlcmc" id="ywlcmc2"   value="${ywlcmc}"/> --%>
<%--   <input type="hidden" name="ywlcmc" id="ywlcmc1"   value="${ywlcmc}"/> --%>
  	
    <div class="popup">
        <div class="Floatleft Pct100 mb5">
            <div class="popup_left">添加/修改</div>
            <a href="#" class="btn_close" onclick="javascript:BOX_remove('addOrUpd');"></a> </div>
        <div class="clr"></div>
        <table id="divtab" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
            <tr>
                <th width="100px">变量代码：</th>
                <td align="left"><input name="bldm" id="bldm"   type="text" dataType="Require" msg="必填"  />
                    <span class="red">*</span></td>
            </tr>
            <tr>
                <th>变量名称：</th>
                <td align="left"><input name="blmc" id="blmc"   type="text" dataType="Require" msg="必填"  />
                    <span class="red">*</span></td>
            </tr>
<!--             <tr > -->
<!--                 <th>业务流程代码：</th> -->
<!--                 <td align="left"> -->
<!--                 	<input name="ywlcdm" id="ywlcdm1"   type="text"/> -->
<!--                 </td> -->
<!--             </tr> -->
       
            <tr>
                <th>变量类型：</th>
                <td align="left">
                  
							<select  name="bllx" id="bllx" />
									<option value="">--请选择--</option>
                                   	<option value="1">--字符--</option>
                                   	<option value="2">--整数--</option>
                                  	<option value="3">--数字--</option>
                                  	<option value="4">--日期--</option>
							</select>
        
				</td>
            </tr>                                    
<!--            <tr> -->
<!--                 <th>系统代码：</th> -->
<!--                 <td align="left"> -->
<!--             <input type="text" name="xtdm" id="xtdm"    /> -->
<!--                       <span class="red">*</span> </td> -->
<!--             </tr> -->
 			<tr>
                <th>FORMAT：</th>
                <td align="left">
           <input type="text" name="format" id="format"  />
             <span class="red">*</span>
                     </td>
            </tr>
<!--             <tr> -->
<!--                 <th>业务流程版本号：</th> -->
<!--                 <td align="left"> -->
<!--                    	<input name="ywlcbbh" id="ywlcbbh"   type="text"/> -->
<!--                     <span class="red">*</span></td> -->
<!--             </tr> -->
               <tr>
                <th>可用否：</th>
                <td align="left"><select name="kyf" id="kyf">
                <option value="1">是</option>
                <option value="0">否</option>
                </select></td>
            </tr>
         
            <tr>
                <td colspan="2" align="center"><div class="addlist_button1" style="float:right"><a href="javascript:BOX_remove('addOrUpd');"><span>取消</span></a> </div>
                    <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:addOrUpd();" title="保存" ><span>保存</span></a> </div></td>
            </tr>
        </table>
        <div class="clr"></div>
    </div>
</form>
</div>
 </div>
      <div class="youtube">
        	<c:if test="${not empty ywlcBlPage }">
             <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="ywlcBlPage" onlyOneShow="true" showListNo="true" action="ywlcsz/addYwlcbl"/>
            </c:if>
        </div>
<div id="setting"> </div>
</div>
</body>
</html>


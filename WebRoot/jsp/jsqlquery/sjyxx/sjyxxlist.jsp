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
	document.queryform.action = "<%=path%>/Sjyxx/siyxxmain";
	document.queryform.submit();
}


//添加审核业务
//添加流程
function addDivShyw(){
   
	$("#au_zt").val("1");
	$("#divtab").find("input[type='text']").val('');
	$("#divtab").find("select").val('');
	Validator.ClearForm('addOrUpdform');
	BOX_show('addOrUpd');
}
//保存
function addOrUpd(){

	
	if(Validator.Validate(document.getElementById('addOrUpdform'),3)){

	
// 		var ywlcdm=$("#ywlcdm").val();
// 		var zt = $("#au_zt").val();	
   $("#sjy_sjymc").attr("disabled",false);
		document.addOrUpdform.action='<%=path%>/Sjyxx/addorupdate';	
	
		 $("#addOrUpdform").ajaxSubmit(function(result){
			
			 if(result=="1"){			
				 alert("增加成功")
			     queryLike();
			 }
			 if(result=="2"){
				 alert("增加失败")
				 //queryLike();
			 }		
			 
			 if(result=="3"){
				 alert("更新成功")
				  queryLike();
			 }	
			 if(result=="4"){
				 alert("更新失败")
				 //queryLike();
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

function updateDiv(SJY_SJYMC){
// 	alert(SJY_SJYMC);
	var sjy_sjymc=SJY_SJYMC;
	$("#au_zt").val("2");
	
	
	    		Validator.ClearForm('addOrUpdform');
 	    		var url="<%=path%>/Sjyxx/querySjyxxbyMc"; 
	    	
	    	    var param={'sjy_sjymc':sjy_sjymc};
	    	    $.post(url,param,function(result){
// 	    	    	alert(result.sjy_sjymc)
  
	    	        $.each(result,function(k, obj){
	    	            obj=obj==null? '' : obj;
	    	            $("input[id='"+k+"'],select[id='"+k+"'],textarea[id='"+k+"']").val(obj);
	                    }) },'json');
	    	    
	    	 
	    	    $("#sjy_sjymc").attr("disabled",true);
//     	    $("#sjy_sjymc]").attr("",true);
// //	     	    $("input[id='xtdm']").attr("readonly",true);
// //	     	    $("input[id='ywlcbbh']").attr("readonly",true);
	    	    
// 	    	    $("input[id='ywlcdm']").attr("disabled",true);
// 	    	    $("input[id='ywlcmc']").attr("disabled",true);
// 	    	    $("input[id='xtdm']").attr("disabled",true);
// 	    	    $("input[id='ywlcbbh']").attr("disabled",true);
	    	    
//	     	    $("#kyf").attr("disabled",true);
	    		BOX_show('addOrUpd');
	    	
	  
	
	
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
        document.ff.action = "<%=path%>/Sjyxx/delSjyxx";
        
        $('#ff').ajaxSubmit(function(r){
        	if(r == 1){
        		alert("删除成功");
        		queryLike();
        	}else{
        		alert("删除失败");
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
                    <td>数据源名称：</td>
                    <td><input type="text" name="dmmc" id="dmmc" value="" /></td>
                    <td><div class="addlist_button2"> <a href="javascript:void(0);" onclick="javascript:queryLike();"><span>搜&nbsp;&nbsp;索</span></a> </div></td>
                </tr>
            </table>
          </form>
          <table  border="0" align="left" cellpadding="0" cellspacing="0"  >
                <tr>
                    <td height="35px">
                    	<div class="addlist_button"> <a href="javascript:addDivShyw();"><span>添&nbsp;&nbsp;加</span></a> </div>
						<div class="addlist_button  ml15"> <a href="javascript:delYw();"><span>删&nbsp;&nbsp;除</span></a> </div>
<!-- 						<div class="addlist_button  ml15"> <a href="javascript:gzldc();"><span>导&nbsp;&nbsp;出</span></a> </div> -->
<!-- 						<div class="addlist_button  ml15"> <a href="javascript:gzldr();"><span>导&nbsp;&nbsp;入</span></a> </div> -->
						
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
			<th>数据源名称</th>
			<th>别名用来显示用</th>
<!-- 			<th>系统代码</th>    -->
			
			<th>驱动</th> 
			<th>驱动地址</th> 
			<th>数据库用户</th> 
<!-- 			<th>数据库密码</th>  -->
			<th>数据库最小连接数</th> 		
			<th>数据库最大连接数</th> 
<!-- 			<th>业务流程类别</th>  -->
<!-- 			<th>可用否</th>  -->
<!-- 			<th>审核开始时间</th>  -->
<!-- 			<th>审核结束时间</th>  -->
            <th>操作</th>
          </tr>
          <c:forEach items="${SjyxxList}" var="map" varStatus="i">
  		    <tr <c:if test="${i.count % 2 eq '0'}">class="bgcol"</c:if>>
  		    
  		    <td ><input type="checkbox" name="ids" style="padding:0;margin-left:2px;*margin-left:-2px;" value="${map.SJY_SJYMC}"/></td>
   		      <td >${map.SJY_SJYMC}</td>
   		      <td >${map.SJY_ALIAS}</td>
<%--    		       <td width="90px">${map.XTDM}</td>  --%>
   		     
   		      <td >${map.SJY_DRIVER}</td>  
   		      <td >${map.SJY_DRIVERURL}</td>     		  
   			
   			  <td >${map.SJY_USER}</td> 	
<%--    			    <td >${map.SJY_PASSWORD}</td>     --%>
   			  <td >${map.SJY_MINIMUMCONNECTIONCOUNT}</td>
   			  <td >${map.SJY_MAXIMUMCONNECTIONCOUNT}</td>
<%--    			    <td width="100px">${map.YWLCLBDM}</td> --%>
<%--    			       <td width="60px">${map.KYF=='0'?'否':'是'}</td> --%>
<%--    			   <td style="dispalynone"><input type="hidden"  name="ywlcbbh" >${map.YWLCBBH}</input></td> --%>
<%--    		      <td>${map.SWXQCKLJ}</td> --%>
<%--    		       <td>${map.YWLCLB}</td> --%>
<%--    			  <td>${map.YWBDBRZDM}</td> --%>
<%--    		      <td>${map.XTDM}</td> --%>
   		      <td><a href="javascript:void(0);" onclick="javascript:updateDiv('${map.SJY_SJYMC}');"><div class="cz_button cz1_1" title="修改" ></div></a>
<%--    		      <a href="javascript:void(0);" onclick="javascript:addYwLc('${map.YWLCDM}','${map.YWLCMC}','${map.XTDM}','${map.YWLCBBH }');"><div class="cz_button cz3_4" title="添加流程" ></div></a>  		       --%>
<%--    		       <a href="javascript:void(0);" onclick="javascript:addYwLcbl('${map.YWLCDM}','${map.YWLCMC}','${map.XTDM}','${map.YWLCBBH }');"><div class="cz_button cz2_5" title="添加流程变量" ></div></a> --%>
<%--    		        <a href="javascript:void(0);" onclick="javascript:Copybbh('${map.YWLCDM}','${map.YWLCBBH}','${map.XTDM}');"><div class="cz_button cz4_4" title="复制业务流程版本号" ></div></a>  	 --%>
<%--    		           <a href="javascript:void(0);" onclick="javascript:CopyYwlc('${map.YWLCDM}','${map.YWLCBBH}','${map.XTDM}','${map.YWLCMC }');"><div class="cz_button cz1_5" title="复制业务根据业务流程" ></div></a>  	 --%>
   		      
   		      </td>
 			</tr>
	      </c:forEach>
        </table>
      </form>    
    </div>
 
   
        <div class="clr"></div>
<!--          <div class="youtube"> -->
<%--         	<c:if test="${not empty ywlcdmbPage }"> --%>
<%--              <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="ywlcdmbPage" onlyOneShow="true" showListNo="true" action="ywlcsz/queryYwList"/> --%>
<%--             </c:if> --%>
<!--         </div> -->
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
            <div style="height:400px; overflow-y:auto">
        <table id="divtab" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
            <tr>
                <th width="30%">数据源名称：</th>
                <td align="left"><input name="sjy_sjymc" id="sjy_sjymc"   type="text" dataType="Require" msg="必填" />
                    <span class="red">*</span></td>
            </tr>
            <tr>
                <th>别名用来显示用：</th>
                <td align="left"><input name="sjy_alias" id="sjy_alias"   type="text" dataType="Require" msg="必填"  />
                    <span class="red">*</span></td>
            </tr>
   			  <tr>
                <th>驱动：</th>
                <td align="left">
                 	<select name="sjy_driver" id="sjy_driver" dataType="Require" msg="必填">
                		<option value="oracle.jdbc.driver.OracleDriver">oracle.jdbc.driver.OracleDriver</option>
                	</select>               
                   <span class="red">*</span> </td>
            </tr>      
  			  <tr>
                <th>驱动地址：</th>
                <td align="left">
                	<input name="sjy_driverurl" id="sjy_driverurl"   type="text" dataType="Require" msg="必填"  title="jdbc:oracle:thin:@192.168.0.11:1521:ORCL"/>
                    <span class="red">*</span>
                 </td>
            </tr>
              <tr>
                <th width="35%">数据库用户：</th>
                <td align="left"><input name="sjy_user" id="sjy_user"   type="text" dataType="Require" msg="必填"  />
                   <span class="red">*</span></td>
            </tr>
            
            
         
              <tr>
                <th>数据库密码：</th>
                <td align="left"><input name="sjy_password" id="sjy_password"   type="password" dataType="Require" msg="必填"  />
                   <span class="red">*</span></td>
            </tr>
               <tr>
                <th>数据库最小连接数：</th>
                <td align="left"><input name="sjy_minimumconnectioncount" id="sjy_minimumconnectioncount"   type="text" onkeyup="value=value.replace(/[^\d]/g,'') "  />
                  </td>
            </tr>
              <tr>
                <th>数据库最大连接数：</th>
                <td align="left"><input name="sjy_maximumconnectioncount" id="sjy_maximumconnectioncount"    type="text"  onkeyup="value=value.replace(/[^\d]/g,'') "
                />
              </td>
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
 
 
 
 
<div id="setting"> </div>
</div>
</body>
</html>


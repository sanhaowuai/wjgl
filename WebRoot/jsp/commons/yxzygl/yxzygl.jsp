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
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript" >
	$(document).ready(function(){
	   $("#ff").baigoCheckall();
	});
	function querylike(){
		document.queryform.action="<%=path%>/yxzygl/queryYxZygl";
		document.queryform.submit();
	}
	
	//添加弹出层
	function addDiv(){
		$("input[id='ZYDM']").attr("readonly",false);
		$("#zt").val("1");
		Validator.ClearForm('addOrUpdfrom');
		$("#divtab").find("input[type='text']").val('');
		$("#divtab").find("select").val('');
		BOX_show('addOrUpd');
	}
	
	function updYxzyKyf(id,object){
		var url="<%=path%>/yxzygl/updYxzyKyf";
	    var param={'id':id,'kyf':object};
	    $.post(url,param,function(result){
			$("#span_"+id).html("修改成功");
	    },'json');	
	} 
	
	//修改弹出层
	function updDiv(zydm){
		$("#zt").val("2");
		Validator.ClearForm('addOrUpdfrom');	
		var url="<%=path%>/zygl/queryOneZy";
	    var param={'zydm':zydm};
	    $.post(url,param,function(result){
	        $.each(result,function(k, obj){
	            obj=obj==null? '' : obj;
	            $("input[id='"+k+"'],select[id='"+k+"']").val(obj);
	        })
	    },'json');
	    //alert("33=="+xdm);
	    //alert("44=="+xydm);
	    $("input[id='ZYDM']").attr("readonly",true);
		BOX_show('addOrUpd');
	
	}
	
	//添加或修改
	function addOrUpd(){
		var glyx = $("#glyx").val();
		if(glyx==null || glyx == ''){
			alert('您选择的院或系均不属于[管理部门]，不允许添加..');
		}else {
			if(Validator.Validate(document.getElementById('addOrUpdfrom'),3)){
		       	document.addOrUpdfrom.action = '<%=path%>/yxzygl/addYxZy';
		       	$('#addOrUpdfrom').ajaxSubmit(function(r){
		       		querylike();
		       	});
			}
		}
	}
	
	//删除角色
	function delZy(){
	    if(isCheck('ids') == false){
	        alert("请选择要删除的专业");
	        return;
	    }
	    if(confirm("您确定要删除选中的院系专业吗？") == true){
	        document.ff.action = "<%=path%>/yxzygl/delYxZy";
	        $('#ff').ajaxSubmit(function(r){
	    		document.ff.action="<%=path%>/yxzygl/queryYxZygl";
	    		document.ff.submit();
	    	});
	    }
	}
	
	//根据院查询系
	function changeXDivNoBm(obj){
		var xydm = $(obj).val();
		var url1 = "<%=path%>/jsgl/querySfglbm";
		$.post(url1,{'yxdm':xydm},function(result){
		    if(result == '1'){
		       	$("#glyx").val(xydm);
		    }else {
		    	$("#glyx").val('');
		    }
		},'json');
		
		var url = "<%=path%>/pubXByYx/queryXByYx";      //查系
		$.post(url,{"yxdm":xydm},function(result){
			var option = "";
			$("#ff_ssxdm").empty();
			$("#ff_ssxdm").append("<option value=''>--请选择--</option>");   
		    $.each(result,function(key,value){
	        	option+="<option value='"+value.YXDM+"'>"+value.YXMC+"</option>";
	  	   	})
		    $("#ff_ssxdm").append(option);
		},'json')
		
	}
	function qeurySfglbm(obj){
		var xydm = $(obj).val();
		var url1 = "<%=path%>/jsgl/querySfglbm";
		$.post(url1,{'yxdm':xydm},function(result){
		    if(result == '1'){
		       	$("#glyx").val(xydm);
		    }
		},'json');		
	}	
</script>
</head>

<body>
<div class="Contentbox">
    <div class="mainbg"></div>
    <div class="pd10"> 
   	  <div class="question" title="帮助" onclick="javascript:cha('${QXB.QXDM}');"></div>    
      <div class="address">当前位置：${QXB.FQXMC} >> ${QXB.QXMC}</div>
    <div class="clr"></div>
    <div class="butsea">
      <table  border="0" align="left" cellpadding="0" cellspacing="0"  >
        <tr>
          <td height="35px"> 
            <div class="addlist_button "> <a href="javascript:addDiv();"><span>添&nbsp;&nbsp;加</span></a> </div>
            <div class="addlist_button  ml15"> <a href="javascript:delZy();"><span>删&nbsp;&nbsp;除</span></a> </div> 
          </td>
        </tr>
      </table>
      <form id="queryform" name="queryform" method="post">
        <table  border="0" align="right" cellpadding="0" cellspacing="0"  >
          <tr>
            <td >专业/院系名称：</td>
            <td><input type="text" name="dmmc" value="${zyglPage.dmmc}"  /></td>
            <td ><div class="addlist_button2"> <a href="javascript:void(0);" onclick="javascript:querylike();return false;"><span>搜&nbsp;&nbsp;索</span></a> </div></td>
          </tr>
        </table>
      </form>
    </div>
    <div class="clr"></div>
    <div class="list">
      <form name="ff" method="post" id="ff" >
<!--      	<input type="hidden" name="pageCount"  value="${zyglPage.pageCount}" />-->
<!--		<input type="hidden" name="pageNo"  value="${zyglPage.pageNo}" />-->
<!--		<input type="hidden" name="pageSize"  value="${zyglPage.pageSize}" />-->
<!--		<input type="hidden" name="dmmc" value="${zyglPage.dmmc}"  />-->
        <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
            <th width="30px"><input type="checkbox" id="ids" title="全选/不选"/></th>
            <th width="100px;">可用否</th>            
            <th>专业名称</th>     
			<th>管理院系</th>                     
			<th>所属院</th> 
			<th>所属系</th> 
          </tr>
          <c:forEach items="${zylist}" var="map" varStatus="i">
  		    <tr <c:if test="${i.count % 2 eq '0'}">class="bgcol"</c:if>>
   		      <td><input type="checkbox" name="ids"  value="${map.id}"/></td>
         	  <td>
	            <select dataType="Limit" min="1" max="20" msg="必选" onchange="updYxzyKyf('${map.id}',this.value);"/>
	        	    <option value='1' <c:if test="${map.kyf eq '1'}">selected</c:if>>是</option>
	        	    <option value='0' <c:if test="${map.kyf eq '0'}">selected</c:if>>否</option>
	            </select>    
	            <span class="red" id="span_${map.id}"></span>    	  
			</td>   		      
   			  <td>${map.zymc}</td> 
   			  <td>${map.glyx}</td>  		      
   		      <td>${map.ssy}</td>
   		      <td>${map.ssx}</td>
 			</tr>
	      </c:forEach>
        </table>
      </form>    
    </div>
    <div class="youtube">
  	  <c:if test="${not empty zyglPage }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="zyglPage" onlyOneShow="true" showListNo="true" action="yxzygl/queryYxZygl"/>
      </c:if>
    </div>
    <div class="clr"></div>
  </div>
</div>
 
<div id="dr" style=" display:none; width: 400px; -webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000; " >
    <div class="popup_title">
      <div class="popup_left">批量导入</div>
      <a href="#" class="btn_close" onclick="javascript:BOX_remove('dr');">Z</a> 
    </div>
    <div class="clr"></div>
    <div class="popup">
    <table width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
      <tr>
        <th>模板下载：</th>
        <td align="left">专业批量导入模版.xls</td>
      </tr>
      <tr>
        <th valign="top">文本选择：</th>
        <td align="left">
          <p><input type="file" name="fileField" id="fileField" /></p>
          <p>1、请按模板要求填写。<br />
              2、Excel文件中不能存在公式。<br />
              3、每次最多导入999行，文件大小限制在1M以内。<br />
              4、导入速度和每次导入的数据量有关，请耐心等待。
          </p>
        </td>
      </tr>
      <tr>
        <td colspan="2" align="center"><div class="addlist_button1" style="float:right"> <a href="#"  title="取消" onclick="javascript:BOX_remove('dr');" ><span>取消</span></a> </div>
        <div class="addlist_button1 mr15" style="float:right" > <a href="#" title="保存" ><span>保存</span></a> </div></td>
      </tr>
    </table>
    <div class="clr"></div>
  </div>
</div>


<div id="addOrUpd" style="display:none; width: 500px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form id="addOrUpdfrom" name="addOrUpdfrom" method="post">
	<input type="hidden" name="dmmc" value="${zyglPage.dmmc}"/>
	<input type="hidden" name="cxssyx" value="${zyglPage.cxssyx}"/>
	<input type="hidden" id="cxssx" name="cxssx" value="${zyglPage.cxssx}"/>
	<input type="hidden" name="zt" id="zt"/><!-- 1：添加  2：修改 --> 
	
    <div class="popup">
      <div class="Floatleft Pct100 mb10">
        <div class="popup_left">添加<input type="hidden" name="glyx" id="glyx" /></div>
        <a href="#" class="btn_close" onclick="javascript:BOX_remove('addOrUpd');"></a> 
      </div>
      <div class="clr"></div>
      <table id="divtab" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
        <tr>
          <th>所属院：</th>
          <td align="left"><select name="ssy" id="ff_ssydm" onchange="javascript:changeXDivNoBm(this);return false;" dataType="Limit" min="1" max="20" msg="必选">
            <option value="">--请选择--</option>
            <c:forEach items="${yxlist2}" var="map" varStatus="status">
        	  <option value='${map.YXDM}'>
     	        ${map.YXMC}
     	      </option>
  		    </c:forEach></select>
            <span class="red">*</span>
          </td>
        </tr> 
        <tr>
        	<th>所属系：</th>
          <td align="left">
            <select name="ssx" id="ff_ssxdm" onchange="javascript:qeurySfglbm(this);return false;">
          	  <option value="">--请选择--</option>
            </select>
          </td>   
        </tr>
        <tr>
          <th width="90px">所属专业：</th>
          <td align="left">
            <select name="zydm" id="ff_sszydm"  dataType="Limit" min="1" max="20" msg="必选">
          	  <option value="">--请选择--</option>
          	  <c:forEach items="${zyxzlist}" var="map" varStatus="status">
        	  <option value='${map.zydm}'>
     	        ${map.zymc}
     	      </option>
  		    </c:forEach>
            </select>
             <span class="red">*</span>
          </td>
        </tr>
        <tr>
          <th>可用否：</th>
          <td align="left">
            <select name="kyf" id="KYF" dataType="Limit" min="1" max="20" msg="必选">
              <option value="1" >是</option>
     		  <option value="0" >否</option>
            </select>
            <span class="red">*</span>
          </td>
        </tr>
        <tr>
          <td colspan="2" align="center"><div class="addlist_button1" style="float:right"><a href="#"  title="取消" onclick="javascript:BOX_remove('addOrUpd');" ><span>取消</span></a> </div>
            <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:addOrUpd();" title="保存" ><span>保存</span></a></div>
          </td>
        </tr>
      </table>
      <div class="clr"></div>
    </div>
  </form>   
</div>

<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"> </div>
</body>
</html>


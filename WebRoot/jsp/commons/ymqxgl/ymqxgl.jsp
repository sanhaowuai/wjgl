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
	.Contentbox { width:100%; min-height:100%; height:auto}
	*html .Contentbox { height:100% }
</style>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jquery.ztree.core-3.1.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jquery.ztree.excheck-3.1.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript" >
	$(document).ready(function(){
    	$("#ff").baigoCheckall();
  	});
	function querylike(){
		document.queryform.action="<%=path%>/ymqxgl/queryAnb";
		document.queryform.submit();
	}
	
	//添加弹出层
	function addDiv(){
		$("#zt").val("1");
		Validator.ClearForm('addOrUpdfrom');
		$("#divtab").find("input[type='text']").val('');
		$("#divtab").find("select").val('');
		BOX_show('addOrUpd');
	}
	
	//修改弹出层
	function updDiv(andm){
		$("#zt").val("2");
		Validator.ClearForm('addOrUpdfrom');
		var url="<%=path%>/ymqxgl/queryOneAn";
	    var param={'andm':andm};
	    $.post(url,param,function(result){
	        $.each(result,function(k, obj){
	            obj=obj==null? '' : obj;
	            $("input[name='"+k+"'],select[name='"+k+"']").val(obj);
	        })
	    },'json')
		BOX_show('addOrUpd');
	}
	
	//添加或修改
	function addOrUpd(){
		if(Validator.Validate(document.getElementById('addOrUpdfrom'),3)){
			
			document.addOrUpdfrom.action ="<%=path%>/ymqxgl/queryByAndhCount";
			$("#addOrUpdfrom").ajaxSubmit(function(result){
		        if(result == 0){
		        	document.addOrUpdfrom.action = '<%=path%>/ymqxgl/addAnsz';
		        	$("#addOrUpdfrom").ajaxSubmit(function(r){
						document.addOrUpdfrom.action="<%=path%>/ymqxgl/queryAnb";
						document.addOrUpdfrom.submit();
					});
			       
			    }else{
				    alert("按钮代号或访问路径已存在!");
				    return;
				}
		    },'json')
		}
	}
	
	//删除按钮
	function delAn(){
	    if(isCheck('ids') == false){
	        alert("请选择要删除的按钮");
	        return;
	    }
	    if(confirm("您确定要删除选中的按钮吗？") == true){
	        document.ff.action = "<%=path%>/ymqxgl/delAn";
	        $("#ff").ajaxSubmit(function(r){
				document.ff.action="<%=path%>/ymqxgl/queryAnb";
				document.ff.submit();
			});
	    }
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
            <div class="addlist_button"> <a href="javascript:addDiv();"><span>添&nbsp;&nbsp;加</span></a> </div>
            <div class="addlist_button  ml15"> <a href="javascript:delAn();"><span>删&nbsp;&nbsp;除</span></a> </div>
          </td>
        </tr>
      </table>
      <form id="queryform" name="queryform" method="post"> 
        <table  border="0" align="right" cellpadding="0" cellspacing="0"  >
          <tr>
            <td >所属权限：</td>
            <td><select name="yxqxdm" id="qf_qxdm" value="${ymqxglPage.yxqxdm}">
              <option value='' <c:if test="${empty ymqxglPage.yxqxdm}">selected</c:if>>---请选择---</option>
  			  <c:forEach items="${qxlist}" var="map" varStatus="status">
      		    <c:if test="${map.sfzxj eq '1'}">
      			  <option value='${map.qxdm}' <c:if test="${ymqxglPage.yxqxdm eq map.qxdm}">selected</c:if>>
    		        <c:if test="${map.jb eq '4'}">　</c:if>
    		        <c:if test="${map.jb eq '6'}">　　</c:if>
    		          ${map.qxmc}
   		          </option>
      		    </c:if>
  		        <c:if test="${map.sfzxj eq '0'}">
  			      <optgroup label='${map.qxmc}'>
    		        <c:if test="${map.jb eq '4'}">　</c:if>
    		        <c:if test="${map.jb eq '6'}">　　</c:if>
   		          </optgroup>
      		    </c:if>
		      </c:forEach></select>
		    </td>
            <td ><div class="addlist_button2"> <a href="javascript:void(0);" onclick="javascript:querylike();return false;"><span>搜&nbsp;&nbsp;索</span></a> </div></td>
          </tr>
        </table>
      </form>
    </div>
    <div class="clr"></div>
    <div class="list">
      <form name="ff" method="post" id="ff" >
      	<input type="hidden" name="yxqxdm" value="${ymqxglPage.yxqxdm}"/>
<!--      	<input type="hidden" name="pageCount"  value="${ymqxglPage.pageCount}" />-->
<!--		<input type="hidden" name="pageNo"  value="${ymqxglPage.pageNo}" />-->
<!--		<input type="hidden" name="pageSize"  value="${ymqxglPage.pageSize}" />-->
        <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
            <th width="50px"><input type="checkbox" id="ids" title="全选/不选" style="padding:0;margin-left:2px;*margin-left:-2px;"/></th>
            <th >按钮名称</th>
            <th >所属权限</th>
            <th >按钮代号</th> 
            <th width="50px">操作</th>
          </tr>
 		  <c:forEach items="${anlist}" var="map" varStatus="status">
  		    <tr <c:if test="${status.count % 2 eq '0'}">class="bgcol"</c:if>>
	   		  <td><input type="checkbox" name="ids" value="${map.andm}" style="padding:0;margin-left:2px;*margin-left:-2px;"/></td>
	   		  <td>${map.anmc}</td>
	   		  <td>${map.qxmc}</td>
	   		  <td>${map.andh}</td>
			  <td><div class="cz_button cz1_1" title="修改" onclick="javascript:updDiv('${map.andm}');"></div></td>
 			</tr>
	      </c:forEach>
        </table>
      </form>
    </div>
    <div class="youtube"> 
      <c:if test="${not empty ymqxglPage }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="ymqxglPage" onlyOneShow="true" showListNo="true" action="ymqxgl/queryAnb"/>
      </c:if>
    </div>
    <div class="clr"></div>
  </div>
</div>




<div id="addOrUpd" style="display:none; width: 400px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form id="addOrUpdfrom" name="addOrUpdfrom" method="post">
	<input type="hidden" name="pageCount"  value="${ymqxglPage.pageCount eq '0' ? '1' : ymqxglPage.pageCount}" />
	<input type="hidden" name="pageNo"  value="${ymqxglPage.pageNo eq '0' ? '1' : ymqxglPage.pageNo}" />
	<input type="hidden" name="pageSize"  value="${ymqxglPage.pageSize}" />
	<input type="hidden" name="yxqxdm" value="${ymqxglPage.yxqxdm}"/>
	<input type="hidden" name="andm" id="andm"/>
	<input type="hidden" name="zt" id="zt"/><!-- 1：添加  2：修改 -->
	<div class="popup">
      <div class="Floatleft Pct100 mb10">
        <div class="popup_left">添加/修改</div>
        <a href="#" class="btn_close" onclick="javascript:BOX_remove('addOrUpd');"></a> 
      </div>
      <div class="clr"></div>
      <table id="divtab" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse"> 
      	<tr>
          <th>按钮名称：</th>
          <td align="left"><input type="text" name="anmc" id="ff_anmc"  dataType="Limit" min="1" max="20" msg="必填(20个字之内)"/>
            <span class="red">*</span>
          </td>
        </tr>
       	<tr>
          <th>所属权限：</th>
          <td align="left"><select name="qxdm" id="ff_qxdm" dataType="Require" msg="必选"> 
        	<c:forEach items="${qxlist}" var="map" varStatus="status">
        	  <c:if test="${map.sfzxj eq '1'}">
        	    <option value='${map.qxdm}'>
     		      <c:if test="${map.jb eq '4'}">　</c:if>
     		      <c:if test="${map.jb eq '6'}">　　</c:if>
     		         ${map.qxmc}
     		    </option>
        	  </c:if>
    		  <c:if test="${map.sfzxj eq '0'}">
    			<optgroup label='${map.qxmc}'>
     		      <c:if test="${map.jb eq '4'}">　</c:if>
     		      <c:if test="${map.jb eq '6'}">　　</c:if>
     		    </optgroup>
        	  </c:if>
  		    </c:forEach></select>
            <span class="red">*</span>
          </td>
        </tr>
        <tr>
          <th>按钮代号：</th>
          <td align="left"><input type="text" name="andh" id="ff_andh" dataType="Limit" min="1" max="20" msg="必填(20个字之内)" />
            <span class="red">*</span>
          </td>
        </tr> 
        <tr>
          <th>访问路径：</th>
          <td align="left"><input type="text" name="fwlj" id="ff_fwlj" dataType="Limit" min="1" max="20" msg="必填(20个字之内)" />
            <span class="red">*</span>
          </td>
        </tr> 
        <tr>
          <td colspan="2" align="center"><div class="addlist_button1" style="float:right"><a href="#"  title="取消" onclick="javascript:BOX_remove('addOrUpd');" ><span>取消</span></a> </div>
            <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:addOrUpd();" title="保存" ><span>保存</span></a> </div>
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


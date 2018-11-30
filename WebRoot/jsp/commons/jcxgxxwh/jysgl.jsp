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
<title>北京赢科后台管理系统</title>
<jsp:include page="../../include/css-main-include.jsp"></jsp:include>
<STYLE type="text/css">
  html, body { height:100%; }
  .Contentbox { width:100%; min-height:100%;height:auto }
  *html .Contentbox { height:100% }
</STYLE>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	   $("#ff").baigoCheckall();
	});
	function querylike(){
		document.queryform.action="<%=path%>/jysgl/queryJysgl";
		document.queryform.submit();
	}
	
	//添加弹出层
	function addDiv(){
		$("#zt").val("1");	
		Validator.ClearForm('addOrUpdfrom');
		$("#divtab").find("input[type='text']").val('');
		$("#divtab").find("select").val('');
		$("#ff_jysdm").attr("readonly",false);
		BOX_show('addOrUpd');
		
	}
	
	//修改弹出层
	function updDiv(jysdm){
		$("#zt").val("2");
		Validator.ClearForm('addOrUpdfrom');
		var url="<%=path%>/jysgl/queryJysByDm";
	    var param={'jysdm':jysdm};
	    $.post(url,param,function(result){
	    	$("#ff_jysdm").val(result.jysdm);
	    	$("#ff_jysmc").val(result.jysmc);
	    	result.jysfzr = result.jysfzr==null? '' : result.jysfzr;
	    	$("#ff_jysfzr").val(result.jysfzr);
	    	result.jysjc = result.jysjc==null? '' : result.jysjc;
	    	$("#jysjc").val(result.jysjc);
	    	result.jysywmc = result.jysywmc==null? '' : result.jysywmc;
	    	$("#jysywmc").val(result.jysywmc);
	    	$("#ff_kyf").val(result.kyf);
	    	$("#xydm").val(result.xydm);
	    	$("#glyx").val(result.glyx);
	    	result.lxdh = result.lxdh==null? '' : result.lxdh;
	    	$("#lxdh").val(result.lxdh);
	    	$("#jyslx").val(result.jyslx);
	    	var url2 = "<%=path%>/pubXByYx/queryXByYx";
	    	$.post(url2,{"yxdm":result.xydm},function(result2){
	    	   $("#xdm").children("option").eq(0).nextAll().remove();
	    	   var option = "";
	    	   $.each(result2,function(key,value){  	   	   		
	  	   	   if(value.YXDM == result.xdm){             
	               option+="<option value='"+value.YXDM+"'selected>"+value.YXMC+"</option>";
	           }else{
	        	   option+="<option value='"+value.YXDM+"'>"+value.YXMC+"</option>";
	           }
	  	   	   })
		       $("#xdm").append(option);
	    	},'json')
	        //$.each(result,function(k, obj){
	            //obj=obj==null? '' : obj;
	            //$("input[name='"+k+"'],select[name='"+k+"']").val(obj);
	        //})
	    },'json')
	    $("#ff_jysdm").attr("readonly",true);
		BOX_show('addOrUpd');
	}
	
	//添加或修改
	function addOrUpd(){
		if(Validator.Validate(document.getElementById('addOrUpdfrom'),3)){		
			
			document.addOrUpdfrom.action ="<%=path%>/jysgl/queryByDmCount";
			$("#addOrUpdfrom").ajaxSubmit(function(result){
		        if(result){
		        	document.addOrUpdfrom.action = '<%=path%>/jysgl/addJysglSz';
		        	$("#addOrUpdfrom").ajaxSubmit(function(r){
						document.addOrUpdfrom.action="<%=path%>/jysgl/queryJysgl";
						document.addOrUpdfrom.submit();
					});
			    }else{
				    alert("此教研室代码已存在！");
				    return;
				}
		    },'json')
		}
	}
	
	//删除教研室
	function delJys(){
	    if(isCheck('ids') == false){
	        alert("请选择要删除的教研室");
	        return;
	    }
	    if(confirm("您确定要删除选中的教研室吗？") == true){
	        document.ff.action = "<%=path%>/jysgl/delJys";
	        $("#ff").ajaxSubmit(function(r){
				document.ff.action="<%=path%>/jysgl/queryJysgl";
				document.ff.submit();
			});
	    }
	}
	
	function changeYDiv(obj){
	   var xydm = $(obj).val();
		  //$(z).find("option:gt(0)").remove();
		   var option="";
		   var url = "<%=path%>/pubXByYx/queryXByYx";
		   $.post(url,{'yxdm':xydm},function(result){
			   $("#xdm").empty();
			   $("#xdm").append("<option value=''>--请选择系--</option>");   
		       $.each(result,function(key,value){  	   	   		
	  	   	   if(value.YXDM == $("#xdm").val()){             
	               option+="<option value='"+value.YXDM+"'selected>"+value.YXMC+"</option>";
	           }else{
	        	   option+="<option value='"+value.YXDM+"'>"+value.YXMC+"</option>";
	           }
	  	   	   })
		       $("#xdm").append(option);
		   },'json');
		   
		   var url1 = "<%=path%>/jysgl/querySfglbm";
		   $.post(url1,{'yxdm':xydm},function(result){
		       if(result == '1'){
		       	   $("#glyx").val(xydm);
		       }
		   },'json')
	}
	
	function changeXDiv(obj){
		var xydm = $(obj).val();
		var url1 = "<%=path%>/jysgl/querySfglbm";
		   $.post(url1,{'yxdm':xydm},function(result){
		       if(result == '1'){
		       	   $("#glyx").val(xydm);
		       }
		   },'json')
	}
</script>
</head>
  
<body>
  <div class="Contentbox">
  <div class="mainbg"></div>
  <div class="pd10"> 
     <div class="clr"></div>
    <div class="butsea">
      <table  border="0" align="left" cellpadding="0" cellspacing="0"  >
        <tr>
          <td height="35px">
            <div class="addlist_button"> <a href="javascript:addDiv();"><span>添&nbsp;&nbsp;加</span></a> </div>
            <div class="addlist_button  ml15"> <a href="javascript:delJys();"><span>删&nbsp;&nbsp;除</span></a> </div>
          </td>
        </tr>
      </table>
      <form id="queryform" name="queryform" method="post">
	    <table  border="0" align="right" cellpadding="0" cellspacing="0"  >
          <tr>
            <td>名称：</td>
            <td><input type="text" name="dmmc" id="qf_dm" value="${jysglPage.dmmc}"  /></td>
            <td><div class="addlist_button2"> <a href="javascript:void(0);" onclick="javascript:querylike();return false;"><span>搜&nbsp;&nbsp;索</span></a> </div></td>
          </tr>
	    </table>
      </form>
    </div>
    <div class="clr"></div>
    <div class="list">
      <form name="ff" method="post" id="ff" >
<!--        <input type="hidden" name="pageCount"  value="${jysglPage.pageCount}" />-->
<!--        <input type="hidden" name="pageNo"  value="${jysglPage.pageNo}" />-->
<!--	    <input type="hidden" name="pageSize"  value="${jysglPage.pageSize}" />-->
	    <input type="hidden" name="dmmc"  value="${jysglPage.dmmc}" />
        <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
            <th width="6%"><input type="checkbox" id="ids" title="全选/不选" style="padding:0;margin-left:2px;*margin-left:-2px;"/></th>
            <th>教研室代码</th>
            <th>教研室名称</th>
            <th>教研室类型</th>
            <th>学院名称</th>
            <th>系名称</th>
            <th>教研室负责人</th>
            <th>可用否</th>
            <th width="50px">操作</th>
          </tr>
          <c:forEach items="${jysList}" var="map" varStatus="status">
  	        <tr <c:if test="${status.count % 2 eq '0'}">class="bgcol"</c:if>>
		   	  <td><input name="ids" type="checkbox" value="${map.jysdm}" style="padding:0;margin-left:2px;*margin-left:-2px;"/></td>
		   	  <td>${map.jysdm}</td>
		   	  <td>${map.jysmc}</td>
		   	  <td>${map.jyxmc}</td>
		   	  <td>${map.xymc}</td>
		   	  <td>${map.xmc}</td>
		   	  <td>${map.jysfzr}</td>
		   	  <td>${map.kyf eq '1' ? '可用' : '不可用'}</td>
		      <td><div class="cz_button cz1_1" title="修改" onclick="javascript:updDiv('${map.jysdm}');"></div></td>
 		    </tr>
		  </c:forEach>
        </table>
      </form>
    </div>
    <div class="youtube01"> 
      <c:if test="${not empty jysglPage }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="jysglPage" onlyOneShow="true" showListNo="true" action="jysgl/queryJysgl"/>
      </c:if>
    </div>
    <div class="clr"></div>
 </div>
 </div>

<div id="addOrUpd" style="display:none; width: 700px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form id="addOrUpdfrom" name="addOrUpdfrom" method="post">
    <input type="hidden" name="pageCount"  value="${jysglPage.pageCount eq '0' ? '1' : jysglPage.pageCount}" />
	<input type="hidden" name="pageNo"  value="${jysglPage.pageNo eq '0' ? '1' : jysglPage.pageNo}" />
	<input type="hidden" name="pageSize"  value="${jysglPage.pageSize}" />
	<input type="hidden" name="dmmc"  value="${jysglPage.dmmc}" />
	<input type="hidden" name="zt" id="zt"/><!-- 1：添加  2：修改 -->
	<input type="hidden" name="glyx" id="glyx"/>
    <div class="popup">
      <div class="Floatleft Pct100 mb10">
        <div class="popup_left">添加/修改</div>
        <a href="#" class="btn_close" onclick="javascript:BOX_remove('addOrUpd');"></a>
      </div>
      <div class="clr"></div>
      <div style="width:100%; height:300px; overflow:auto">
      <table id="divtab" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
        <tr>
          <th>教研室代码：</th>
          <td align="left"><input type="text" name="jysdm" id="ff_jysdm"  dataType="Number" msg="请填写数字" maxlength="10"/>
            <span class="red">*</span>
          </td> 
          <th>教研室名称：</th>
          <td align="left"><input type="text" name="jysmc" id="ff_jysmc" dataType="Limit" min="1" max="20" msg="必填(20个字之内)" />
            <span class="red">*</span>
          </td>
        </tr>
        <tr>
          <th>教研室负责人：</th>
          <td align="left"><input type="text" name="jysfzr" id="ff_jysfzr" dataType="Limit" min="1" max="20" msg="必填(20个字之内)" />
            <span class="red">*</span>
          </td> 
          <th>教研室类型：</th>
       	  <td align="left">
       	    <select name="jyslx" id="jyslx" dataType="Limit" min="1" max="20" msg="必选">
       	      <option value="">--请选择教研室类型--</option>
    		  <c:forEach items="${jyslx_list}" var="map">
    			<option value="${map.dm}">${map.mc}</option>
    	      </c:forEach>
       	    </select><span class="red">*</span>
       	  </td>
        </tr>
        <tr>
       	  <th>所属学院：</th>
       	  <td>
       	    <select name="xydm" id="xydm" onchange="javascript:changeYDiv(this);return false;" dataType="Limit" min="1" max="20" msg="必选">
    		  <option value="">--请选择学院--</option>
   			  <c:forEach items="${xyList}" var="map">
   			    <option value="${map.YXDM}">${map.YXMC}</option>
   			  </c:forEach>
            </select><span class="red">*</span>
       	  </td> 
      	  <th>所属系：</th>
      	  <td>
   		    <select name="xdm" id="xdm" onchange="javascript:changeXDiv(this);return false;">
   			  <option value="">--请选择系--</option>
   		    </select>
      	  </td>
        </tr>
        <tr>
          <th>教研室简称：</th>
          <td align="left"><input type="text" name="jysjc" id="jysjc"/></td> 
          <th>教研室英文名称：</th>
          <td align="left"><input type="text" name="jysywmc" id="jysywmc" dataType="English" msg="<br/>选填(必须输入英文字母)" Require="false"/></td>
        </tr>
        <tr>
          <th>联系电话：</th>
          <td align="left"><input type="text" name="lxdh" id="lxdh" dataType="Phone" msg="<br/>格式不正确(固定电话)" Require="false"/></td> 
          <th>可用否：</th>
          <td align="left">
            <select name="kyf" id="ff_kyf">
          	<option value="1" selected="selected">可用</option>
          	<option value="0">不可用</option>
            </select>
          </td>
        </tr>
        <tr>
          <td colspan="4" align="center"><div class="addlist_button1" style="float:right"><a href="javascript:BOX_remove('addOrUpd');"><span>取消</span></a> </div>
          <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:addOrUpd();" title="保存" ><span>保存</span></a> </div></td>
        </tr>
      </table>
      </div>
      <div class="clr"></div>
    </div>
  </form>
</div>
<div id="setting"> </div>  
</body>
</html>

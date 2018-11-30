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
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>
<link rel="stylesheet" href="<%=path%>/resources/js/plupload/jquery.plupload.queue/css/jquery.plupload.queue.css" type="text/css" />
<script type="text/javascript" src="<%=path%>/resources/js/plupload/plupload.full.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/plupload/jquery.plupload.queue/jquery.plupload.queue.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/plupload/i18n/cn.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/plupload/plupload.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/My97DatePicker/WdatePicker.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/pub/chooseMxdx.js"></script>
<link href="<%=path%>/resources/js/select2-4.0.0-rc.2/dist/css/select2.min.css" rel="stylesheet" />
<script src="<%=path%>/resources/js/select2-4.0.0-rc.2/dist/js/select2.min.js"></script>
<script type="text/javascript" >
$().ready(function(){
	plfileupload({
		url:'<%=path%>',
	    savePath:'fkcl',
	    max_file_size:'10mb' ,
	    max_file_length:5, //上传数量
	    buttonId:'fake_btn',
	    formId:'ff' ,
	    downfiles:${empty listfjjson ? '[]' : listfjjson } // 初值
	},save);
});
$(document).ready(function(){
	var flag = "${flag}";
	if(flag == "success"){
		alert("操作成功！");
		goback();
	}else if(flag == "error"){
		alert("操作失败！");
		goback()
	}
});
//校验数据   填写完全可以上传附件
function testData(flag,obj){
	if(Validator.Validate(document.getElementById('ff'),3) ){
		$("#sffb").val(flag);
		var content=xxnrIframe.getHTML();
		if(content!=""){
			//$(obj).removeAttr('href');//去掉a标签中的href属性
			//$(obj).removeAttr('onclick');//去掉a标签中的onclick事件
			BOX_show('drzDiv');
			$("#fake_btn").click();  //触发隐藏btn 上传附件并调用save方法
		}else{
			 alert("请填变更概述!");
		}
	}
}
//保存

	function save(){
		
	var xz=$("#sffb").val();
		document.ff.action="<%=path%>/qkfkycl/addOrUpdqkfk?xz="+xz;
		document.ff.submit();
		
	}
	
// 返回
function goback(){
	document.fh.action="<%=path%>/qkfkycl/qkfk";
	document.fh.submit();
}

function jiazai(){
$("#lzjsrdm").select2();
}
</script>
</head>

<body onload="jiazai();">
 <div class="Contentbox">
    <div class="mainbg"></div>
    <div class="pd10">   
   	  <div class="address">当前位置：${qkfkyclPage.wz1} >> ${qkfkyclPage.wz2} >> 添加/修改</div>
      <div class="clr"></div> 
    <div class="butsea"> 
      <table  border="0" align="left" cellpadding="0" cellspacing="0"  >
        <tr>
          <td height="35px">
            <div class="addlist_button"> <a href="javascript:goback();"><span>返回</span></a> </div>
            <div class="addlist_button  ml15"> <a href="javascript:testData('0',this);" ><span>保存</span></a> </div>
            <div class="addlist_button  ml15"> <a href="javascript:testData('1',this);" ><span>提交</span></a> </div>
          </td>
        </tr>
      </table>
    </div>
    <div class="clr"></div>
    <form name="fh" method="post" id="fh"  >
    <input type="hidden" name="sqrdm" value="${yhdm}"/>
    </form>
      <form name="ff" method="post" id="ff" >
      <input type="hidden" name="wz1" value="${qkfkyclPage.wz1}"/>
       <input type="hidden" name="wz2" value="${qkfkyclPage.wz2}"/>
      <input type="hidden" name="sffb" id="sffb" /><%--	是否发布  1.是   0.保存  --%>
      <input type="hidden" name="fake_btn" id="fake_btn" /><%--   触发上传附件button  --%>
      <input type="hidden" name="sqdh" value="${qkfkxtFksqbEntity.sqdh}"/> 
            <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse"  class="addlist"  >
          <tr>
            <th width="10%">申请人</th>
            <td width="40%">
            <input type="hidden" name="sqrdm" value="${yhdm}" />
            <input type="text" name="dlr" value="${dlr}" readonly="readonly"/>
            </td>
             <th width="10%">联系电话</th>
            <td width="40%">
            <input type="text" name="sqrlxdh" value="${qkfkxtFksqbEntity.sqrlxdh}" />
            </td>
          </tr>
          <tr>
            <th width="10%">变更提出人</th>
            <td width="40%">
            <input type="text" name="bgtcrxm" dataType="Require" msg="必填" value="${qkfkxtFksqbEntity.bgtcrxm}" />
            </td>
             <th width="10%">联系电话</th>
            <td width="40%">
            <input type="text" name="bgtcrlxdm" value="${qkfkxtFksqbEntity.bgtcrlxdm}"  />
            </td>
          </tr>
          <tr>
            <th>项目名称</th>
            <td>
          <select id="xtdm" name="xtdm"  dataType="Require" msg="必选">
         <option value="">-请选择-</option>
         <c:forEach items="${xmList}" var="map">
         <option value="${map.DM}" <c:if test="${map.DM==qkfkxtFksqbEntity.xtdm}">selected="selected"</c:if>>${map.XTMC}</option>
         </c:forEach>
         </select>
            </td>
             <th>紧急程度</th>
            <td>
            	 <select id="jjcddm" name="jjcddm"  dataType="Require" msg="必选">
         <option value="">-请选择-</option>
         <c:forEach items="${jjcdList}" var="map">
         <option value="${map.DM}" <c:if test="${map.DM==qkfkxtFksqbEntity.jjcddm}">selected="selected"</c:if>>${map.MC}</option>
         </c:forEach>
         </select>
            </td>
          </tr>
           <tr>
            <th>变更类型</th>
            <td>
            	  <select id="bglxdm" name="bglxdm"  dataType="Require" msg="必选">
         <option value="">-请选择-</option>
         <c:forEach items="${bglxList}" var="map">
         <c:if test="${map.SJDM=='-1'}">
         <optgroup label="${map.MC}"></optgroup>
         </c:if>
         <c:if test="${map.SJDM!='-1'}">
         <option value="${map.DM}" <c:if test="${map.DM==qkfkxtFksqbEntity.bglxdm}">selected="selected"</c:if>>&nbsp;&nbsp;${map.MC}</option>
         </c:if>
         </c:forEach>
         </select>
            </td>
             <th>流转接收人</th>
            <td>
            	<select id="lzjsrdm" name="lzjsrdm"  dataType="Require" msg="必选">
            		<option value="">-请选择-</option>
            		<c:forEach var="map" items="${jsList}">
            		<option value="${map.YHDM}"<c:if test="${map.YHDM==qkfkxtFksqbEntity.lzjsrdm}">selected="selected"</c:if>>${map.XM}</option>
            		</c:forEach>
            	</select>
            </td>
          </tr>
          <tr>
            <th width="10%">变更提出时间</th>
            <td width="40%">
            <input id="sqsj" value="${qkfkxtFksqbEntity.sqsj}"  dataType="Require" msg="必填" name="sqsj" class="{required:true} Wdate" type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',isShowToday:true,isShowClear:true,maxDate:'#F{$dp.$D(\'yqwcsj\')}'})" />
            </td>
            <th width="10%">要求完成时间</th>
            <td width="40%">
            <input id="yqwcsj" value="${qkfkxtFksqbEntity.yqwcsj}" dataType="Require" msg="必填" name="yqwcsj" class="{required:true} Wdate" type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',isShowToday:true,isShowClear:true,minDate:'#F{$dp.$D(\'sqsj\')}'})" />
            </td>
          </tr>
          <tr>
            <th>变更概述</th>
            <td colspan="3">
            	<div style="padding: 10px 10px 10px 0;">
            		<textarea name="bggs" id="xxnr" style="display:none">${qkfkxtFksqbEntity.bggs}</textarea>
                    <iframe id="xxnrIframe" name="xxnrIframe" src="<%=path%>/resources/ewebeditor/ewebeditor.htm?id=xxnr&style=standard650" frameborder="0" scrolling="no" width="100%" height="450"></iframe>
	            </div>
            </td>
          </tr>
         <tr>
            <th>上传附件：</th>
            <td colspan="3">
            	<div id="div_fj">
            		<div style="padding: 10px 10px 10px 0;" >
              			<span>最多只能上传5个附件，并且每个附件不超过10M</span>
             			  <div id="uploader" >
                 			 <p>您的浏览器未安装 Flash, Silverlight, Gears, BrowserPlus 或者支持 HTML5 .</p>
             		      </div>
            		</div>
       	 		</div>
            </td>
          </tr>
        </table>
      </form>
      </div>
      </div>
      <div id="drzDiv" style="display:none; width: 300px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <div class="popup">
     <table  border="0" width="100%" cellpadding="0" cellspacing="0" >
      <tr>
         <td align="center" valign="middle" height="100px"><img src="<%=path%>/resources/style/blue/images/loading.gif" /><br /><br /><font id="message" class="FONT12 red LH30"></font></td>        
      </tr>
     </table>
     
    <div class="clr"></div>
  </div>
</div>

<div id="setting"></div>
      
</body>
</html>

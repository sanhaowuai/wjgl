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

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/pub/chooseMxdx.js"></script>
<script type="text/javascript" >
$().ready(function(){
	plfileupload({
		url:'<%=path%>',
	    savePath:'xxfbxx',
	    max_file_size:'10mb' ,
	    max_file_length:5, //上传数量
	    buttonId:'fake_btn',
	    formId:'ff' ,
	    downfiles:${empty listfjjson ? '[]' : listfjjson } // 初值
	},save);
});
//校验数据   填写完全可以上传附件
function testData(flag,obj){
	if(Validator.Validate(document.getElementById('ff'),3) ){
		$("#sffb").val(flag);
		var content=xxnrIframe.getHTML();
		if(content!=""){
			//$(obj).removeAttr('href');//去掉a标签中的href属性
			//$(obj).removeAttr('onclick');//去掉a标签中的onclick事件
			$("#fake_btn").click();  //触发隐藏btn 上传附件并调用save方法
		}else{
			 alert("请填写信息内容!!");
		}
	}
}
//保存
function save(){
	document.ff.action="<%=path%>/xxfbxx/addOrUpdXxfbxx";
    document.ff.submit();
}
// 返回
function goback(){
	document.ff.action="<%=path%>/xxfbxx/queryXxfbgl";
	document.ff.submit();
}

// 信息发布并保存
function xxfbbbc(flag){
	if(Validator.Validate(document.getElementById('ff'),3) ){
		if(confirm("您是否要发布并保存此条信息？")){		
			$("#sffb").val(flag);
			var content=xxnrIframe.getHTML();
			if(content!=""){
				//$(obj).removeAttr('href');//去掉a标签中的href属性
				//$(obj).removeAttr('onclick');//去掉a标签中的onclick事件
				$("#fake_btn").click();  //触发隐藏btn 上传附件并调用save方法
			}else{
				 alert("请填写信息内容!!");
			}
		}
	}
}
function qxfbxx(flag){
	if(Validator.Validate(document.getElementById('ff'),3) ){
		if(confirm("您是否要取消发布并保存此条信息？")){		
			$("#sffb").val(flag);
			var content=xxnrIframe.getHTML();
			if(content!=""){
				//$(obj).removeAttr('href');//去掉a标签中的href属性
				//$(obj).removeAttr('onclick');//去掉a标签中的onclick事件
				$("#fake_btn").click();  //触发隐藏btn 上传附件并调用save方法
			}else{
				 alert("请填写信息内容!!");
			}
		}
	}
}


function mxdxOpen(id){
	var par = id;
	var URL="${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/chooseMxdx/PT_XT_XXFB/XXID/"+par;
    window.open(URL,null,"height=550, width=900,toolbar=no, menubar=no, scrollbars=no, resizable=no, loca tion=no, status=no");
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
      <table  border="0" align="left" cellpadding="0" cellspacing="0"  >
        <tr>
          <td height="35px">
            <div class="addlist_button"> <a href="javascript:goback();"><span>返&nbsp;&nbsp;回</span></a> </div>
            <c:if test="${entity.sffb ne '1' }">            
            <c:if test="${entity.xxid == null || entity.xxid eq ''}">
            <div class="addlist_button  ml15"> <a href="javascript:testData('0',this);" ><span>保&nbsp;&nbsp;存</span></a> </div>
            </c:if>
            <div class="addlist_button  ml15"> <a href="javascript:testData('1',this);" ><span>发&nbsp;&nbsp;布</span></a> </div>
            </c:if>
            <c:if test="${entity.sffb eq '1' }">            	
            	<div class="addlist_button  ml15"> <a href="javascript:xxfbbbc('1');" ><span>发布并保存</span></a> </div>
            	<div class="addlist_button  ml15"> <a href="javascript:qxfbxx('0');" ><span>取消发布并保存</span></a> </div>
            </c:if>
          </td>
        </tr>
      </table>
    </div>
    <div class="clr"></div>
      <form name="ff" method="post" id="ff" >
      <input type="hidden" name="FQXMC" value="${QXB.FQXMC}"/>
	  <input type="hidden" name="QXMC" value="${QXB.QXMC}"/>
	  <input type="hidden" name="pxxlb" value="${xxfbxxglPage.pxxlb }" />
	  <input type="hidden" name="pfbr" value="${xxfbxxglPage.pfbr }" />
	  <input type="hidden" name="pxxbt" value="${xxfbxxglPage.pxxbt }" />
   	  <input type="hidden" name="pxydm" value="${xxfbxxglPage.pxydm }" />
      <input type="hidden" name="pfbqssj" value="${xxfbxxglPage.pfbqssj }" />
      <input type="hidden" name="pfbjssj" value="${xxfbxxglPage.pfbjssj }" />
      <input type="hidden" name="xxid" id="xxid" value="${entity.xxid }" />
      <input type="hidden" name="newxxid" id="newxxid" value="${newxxid}" />
      <input type="hidden" name="sffb" id="sffb" /><%--	是否发布  1.是   0.保存  --%>
      <input type="hidden" name="fake_btn" id="fake_btn" /><%--   触发上传附件button  --%>
		      <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse"  class="addlist"  >
          <tr>
            <th width="20%">信息标题：</th>
            <td width="80%">
            	<input type="text" name="xxbt" value="${entity.xxbt }" dataType="Limit" min="1" max="100" msg="必填(100字之内)" style="width:80%;"/>
            	<span class="red"> *</span>
            </td>
          </tr>
          <tr>
            <th>通知对象：</th>
            <td>
<!--             	<select name="kjyhlx" dataType="Require" msg="必选"> -->
<%--             		<option value="0" ${entity.kjyhlx eq '0' ? 'selected' : '' }>全部</option> --%>
<%--             		<option value="1" ${entity.kjyhlx eq '1' ? 'selected' : '' }>教师</option> --%>
<%--             		<option value="2" ${entity.kjyhlx eq '2' ? 'selected' : '' }>学生</option> --%>
<!--             	</select> -->
<!--             	<span class="red"> *</span> -->
            	<input type="text" name="mxdxxsz" id="mxdxxsz" disabled="disabled" value="${entity.mxdxxsz }" style="width:80%;"/>
            	<c:if test="${not empty entity.xxid}"><button type="button" class="btn btn-info"  onclick="javascript:mxdxOpen('${entity.xxid}');;return false;">选择</button></c:if>
            	<c:if test="${empty entity.xxid}"><button type="button" class="btn btn-info"  onclick="javascript:mxdxOpen('${newxxid}');;return false;">选择</button></c:if>
            	
            </td>
          </tr>
          <tr>
            <th>信息类别：</th>
            <td>
            	<select name="xxlb" dataType="Require" msg="必选">
            		<option value="">请选择</option>
            		<c:forEach var="map" items="${xxlbList}">
            		<option value="${map.DM }" ${entity.xxlb eq map.DM ? 'selected' : '' }>${map.MC }</option>
            		</c:forEach>
            	</select>
            	<span class="red"> *</span>
            </td>
          </tr>
          <tr>
            <th>信息内容：</th>
            <td>
            	<div style="padding: 10px 10px 10px 0;">
            		<textarea name="xxnr" id="xxnr" style="display:none">${entity.xxnr}</textarea>
                    <iframe id="xxnrIframe" name="xxnrIframe" src="<%=path%>/resources/ewebeditor/ewebeditor.htm?id=xxnr&style=standard650" frameborder="0" scrolling="no" width="100%" height="450"></iframe>
	            </div>
            </td>
          </tr>
          <tr>
            <th>附件：</th>
            <td>
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
 
</body>
</html>

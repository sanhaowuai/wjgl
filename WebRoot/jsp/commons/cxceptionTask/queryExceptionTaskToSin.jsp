<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.lang.*,java.util.*,java.text.*" %>

<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>添加/修改</title>
<meta content="text/html; charset=utf-8" http-equiv=Content-Type />
 <jsp:include page="../../include/css-main-include.jsp"></jsp:include>
<style type="text/css">
  html, body { height:100%; }
  .Contentbox { width:100%; min-height:100%;height:auto }
  *html .Contentbox { height:100% }
</style>
<!-- CSS end -->
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js"></script>
<link rel="stylesheet" href="<%=path%>/resources/js/plupload/jquery.plupload.queue/css/jquery.plupload.queue.css" type="text/css" />
<script type="text/javascript" src="<%=path%>/resources/js/plupload/plupload.full.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/plupload/jquery.plupload.queue/jquery.plupload.queue.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/plupload/i18n/cn.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/plupload/plupload.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/ckeditor4.1.2/ckeditor.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js" ></script>
<!-- cron -->
<!-- cron -->
<script type="text/javascript">
function shumitExceptionTaskToSin(){
	if(Validator.Validate(document.getElementById('ff'),3) ){
		if(confirm("您确定要保存么？") == true){
			$("#ff_id").removeAttr("disabled");
			$("#ff").ajaxSubmit({
			     type: "post",
			     url: "<%=path%>/exceptionTaskController/shumitExceptionTaskToSin/"+$("#ff_method").val(),
			     dataType: "json",
			     success: function(result){
						if(result > 0){
							alert("操作成功");
							opener.loadJsonp();
							window.close();
						}else {
							alert("操作失败");
						}
			     },
			     error: function(XmlHttpRequest, textStatus, errorThrown) {
			    	 alert(errorThrown);
			    } 		     
			 });		
		}
	}
}

function addJob(vid){
	if(Validator.Validate(document.getElementById('ff'),3) ){
		if(confirm("您确定要启动么？") == true){
			$("#ff").ajaxSubmit({
			     type: "post",
			     url: "<%=path%>/exceptionTaskController/addJob/"+vid,
			     //dataType: "json",
			     success: function(result){
						if(result== "success"){
							alert("操作成功");
							//opener.loadJsonp();
							//window.close();
						}else {
							alert("操作失败"+result);
						}
			     }
			 });		
		}
	}
}

function cron_div_open(cron){
	$('#cron_iff').attr('src','<%=path%>/resources/js/cxceptionTask/cron.jsp?cron='+$('#cron').val());
	BOX_show('cron_div');
}

function setCron(cron){
	BOX_remove('cron_div');
	$('#cron').val(cron);
}
</script>
</head>
<body>
<div class="Contentbox">
  <div class="mainbg"></div>
<div class="pd10">
    <div class="clr"></div>
    <div class="butsea">
  		 <div class="addlist_button"> 
  		 <a  href="javascript:void(0);" onclick="javascript:shumitExceptionTaskToSin();return false;"><span style="font-size:12px;">保&nbsp;&nbsp;存</span></a> 
<%--   		 <c:if test="${method eq 'upd'}"> --%>
<%--   		 <a  href="javascript:void(0);" onclick="javascript:addJob('${exceptionTaskEntitySin.id}');return false;"><span style="font-size:12px;">运行</span></a>  --%>
<%--   		 </c:if> --%>
  		 
  		 </div>
    </div>  
    <div class="clr"></div>
    <!--反馈列表-->
      <div>
		      <form name="ff" method="post" id="ff" >
		      <input id="ff_method" value="${method}" type="hidden"/>
		      <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse"  class="addlist"  >
		        <tr>
		          <th width="80">ID：</th>
		          <td colspan="3">
		         
		            <input type="text" id="ff_id" class="form-control pull-left" name="id" value="${exceptionTaskEntitySin.id}" <c:if test="${method eq 'upd'}"> readonly="readonly"</c:if>maxlength=36 dataType="Limit" min="1" max="100" msg="请填写ID"/>
		            <span class="red ml5">*</span>
		          </td>
		        </tr>
		         <tr>
		          <th width="10%">名称：</th>
		          <td width="40%" colspan="3">
		            <input type="text" name="mc"  value="${exceptionTaskEntitySin.mc}"/>
		          </td>
		        </tr>
		        <tr>
		          <th width="10%">描述：</th>
		          <td width="40%" colspan="3">
					<textarea rows="" cols="" name = 'ms'>${exceptionTaskEntitySin.ms}</textarea>
		          </td>
		        </tr>
		        <tr>
		          <th width="10%">异常查询SQL：</th>
		          <td width="40%" colspan="3" >
					<textarea rows="10" cols="200" name = 'yccxsql'>${exceptionTaskEntitySin.yccxsql}</textarea>
		          </td>
		        </tr>
		        <tr>
		          <th width="10%">异常处理SQL：</th>
		          <td width="40%" colspan="3">
					<textarea rows="10" cols="200" name = 'ycclsql'>${exceptionTaskEntitySin.ycclsql}</textarea>
		          </td>
		        </tr>			        
		        <tr>
		          <th width="10%">执行频率：</th>
		          <td width="40%" colspan="3">
<input id="cron" class="form-control pull-left" id="cron" name="cron" value="${exceptionTaskEntitySin.cron}" readonly="readonly"/>
 <div class="addlist_button">
 <a  href="javascript:void(0);" 
 onclick="javascript:cron_div_open('${exceptionTaskEntitySin.cron}');return false;"><span style="font-size:12px;">设&nbsp;&nbsp;置</span></a> 
 </div>
		          
		          </td>
		        </tr>		        	
		      </table>
		  </form>
  	</div>
    <div class="clr"></div>
  </div>
  <div class="clr"></div>
</div>

<div id="cron_div" style="display:none; width: 900px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <div class="popup">
    <div class="Floatleft Pct100 mb10">
      <div class="popup_left">执行频率</div>
      <a href="#" class="btn_close" onclick="javascript:BOX_remove('cron_div');"></a>
    </div>
    <div class="clr"></div>
    <div class="Floatleft Pct100 ">
	  <iframe id="cron_iff" name="iff" src="" border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%; height: 400px;" frameborder="0" allowTransparency="true"></iframe>
    </div>
    <div class="clr"></div>
  </div>
</div>

<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"> </div>

</body>
</html>


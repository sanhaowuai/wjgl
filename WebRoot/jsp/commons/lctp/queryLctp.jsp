<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>流程图片</title>
<jsp:include page="../../include/css-main-include.jsp"></jsp:include>

<link href="<%=path%>/resources/js/treetable/stylesheets/master.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/js/treetable/stylesheets/jquery.treeTable.css" rel="stylesheet" type="text/css" />
<style type="text/css">
  html, body { height:100%; }
  .Contentbox { width:100%; min-height:100%;height:auto }
  *html .Contentbox { height:100% }
</style>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/treetable/javascripts/jquery.treeTable.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/treetable/treeTable-my.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>

<script type="text/javascript">
	//维护流程图片弹出
	function whlctp(){
		BOX_show('add');
	}
	//保存流程图片
	function bclctp(){
		if(Validator.Validate(document.getElementById('lctpform'),3)){
			var f=document.getElementById("lctp").value;
			if(!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(f)){
	          alert("图片类型必须是.gif,jpeg,jpg,png中的一种")
	          return false;
	        }
			document.lctpform.action = "<%=path%>/lctp/uploadLctp";
			$("#lctpform").submit();
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
            	<div class="addlist_button">
					<a href="javascript:void(0);" onclick="javascript:whlctp();">
            			<span>维护流程图片</span>
            		</a> 
            	</div>           	
          </td>
        </tr>
      </table> 
    </div>
    <div class="clr"></div>
    <div class="list">
      <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line" id="zbtable">
        <tbody>
            <tr>
	            <td>
	            <c:if test="${empty lctphzm || lctphzm eq ''}">
	            	<font color="red">暂时没有流程图片，请先维护流程图片。</font>
	            </c:if>
	            <c:if test="${not empty lctphzm && lctphzm ne ''}">
	            	<img src="<%=path%>/resources/img/lctp${lctphzm}" alt="流程图片" width="100%" height="100%"/>
	            </c:if>
		        </td>
        </tbody>
      </table>
    </div>
    <div class="clr"></div>
  </div>
</div>


<!-- 上传流程图片-->
<div id="add" style="display:none; width: 460px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form name="lctpform" id="lctpform" method="post" enctype="multipart/form-data">
    <div class="popup">
      <div class="Floatleft Pct100 mb10">
        <a href="#" class="btn_close" onclick="javascript:BOX_remove('add');"></a>
      </div>
      <div class="clr"></div>
      <table width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
        <tr>
          <th>选择流程图片：</th>
          <td align="left">
          	<input name="lctp" id="lctp" type="file" accept="image/" dataType="Require" msg="必选"/ style="display:inline-block;padding:2px;">
            <span class="red">*</span>
          </td>
        </tr>
        <tr>
          <td colspan="2" align="center"><div class="addlist_button1" style="float:right"><a href="#"  title="取消" onclick="javascript:BOX_remove('add');" ><span>取消</span></a> </div>
          <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:void(0);" onclick="javascript:bclctp();" title="保存" ><span>保存</span></a> </div></td>
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
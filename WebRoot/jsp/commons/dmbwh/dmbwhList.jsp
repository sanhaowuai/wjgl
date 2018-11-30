<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
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
<title>代码表维护列表</title>
<jsp:include page="../../include/css-main-include.jsp"></jsp:include>
<jsp:include page="../js/js_jquery.jsp"/>

<style type="text/css">
	html, body { height:100%; }
	.Contentbox { width:100%; min-height:100%;height:auto }
	*html .Contentbox { height:100% }
	.link{width:60px;height:26px;border-radius: 3px;background:#f1f1f1;display:inline-block;border:1px solid #bebebe;line-height:26px;margin-top:4px;text-align:center;color:#222}
</style>

<script type="text/javascript">
	//查询
	function cxdmbwh(){
		document.cxform.action="<%=path%>/dmbwh/dmbwhList";
		document.cxform.submit();
	}

	//添加
	function addDbmwh(){
		var src = "<%=path%>/dmbwh/dmbwhAdd";
		$("#ckjsxmiframe").attr("src",src);
	 	BOX_show('ckjsxmDiv');
	}
	//修改
	function editDmbwh(tablename){
		var src = "<%=path%>/dmbwh/dmbwhEdit?tablename="+tablename;
		$("#ckjsxmiframe2").attr("src",src);
	 	BOX_show('ckjsxmDiv2');
	}
	//添加保存
	function bcAdd(){
		var xzjsxmform = $("#ckjsxmiframe")[0].contentWindow.$("#showform");
		if(Validator.Validate($("#ckjsxmiframe")[0].contentWindow.$("#showform")[0],3)){}else{return false;}
		var url="<%=path%>/dmbwh/saveAddDmbwh";
		xzjsxmform.ajaxSubmit({
			url: url,
			type:"post",
			contentType: "application/x-www-form-urlencoded; charset=utf-8",
			dataType : "text",
			success: function (data) {
	 				if(data=="1"){
	 					 alert("添加成功！");
	 					 document.ff.action="<%=path%>/dmbwh/dmbwhList";
	 					 document.ff.submit();
	 				}else if(data=="2"){
	 					alert("表已添加，不能再次添加！");
		 			}else if(data=="0"){
	 					alert("操作失败！");
		 			}else if(data=="3"){
	 					alert("此表在本库中不存在，不能添加！");
		 			}else if(data=="4"){
	 					alert("此表中不含有填写的代码或者名称！");
		 			}
			},
			error:function(data){
				alert("操作失败，请重试！");
			}
		});	
	}
	//修改保存
	function bcEdit(){
		var xzjsxmform = $("#ckjsxmiframe2")[0].contentWindow.$("#showform");
		if(Validator.Validate($("#ckjsxmiframe2")[0].contentWindow.$("#showform")[0],3)){}else{return false;}
		var url="<%=path%>/dmbwh/saveEditDmbwh";
		xzjsxmform.ajaxSubmit({
			url: url,
			type:"post",
			contentType: "application/x-www-form-urlencoded; charset=utf-8",
			dataType : "text",
			success: function (data) {
	 				if(data=="1"){
	 					 alert("修改成功！");
	 					 document.ff.action="<%=path%>/dmbwh/dmbwhList";
	 					 document.ff.submit();
		 			}else if(data=="0"){
	 					alert("操作失败！");
		 			}else if(data=="2"){
	 					alert("此表中不含有填写的代码或者名称！");
		 			}
			},
			error:function(data){
				alert("操作失败，请重试！");
			}
		});	
	}
	//批量删除
	function delDmbwh(){
	    if(isCheck('ids') == false){
	        alert("请选择要删除的信息！");
	        return;
	    }
	    if(confirm("您确定要删除选中的信息吗？") == true){
	         var url="<%=path%>/dmbwh/delDmbwh";
	         $("#ff").ajaxSubmit({
	 			url: url,
	 			type:"post",
	 			contentType: "application/x-www-form-urlencoded; charset=utf-8",
	 			dataType : "text",
	 			success: function (data) {
	 	 				if(data=="1"){
	 	 					 alert("删除成功！");
	 	 					 document.cxform.action="<%=path%>/dmbwh/dmbwhList";
	 	 					 document.cxform.submit();
	 		 			}else if(data=="0"){
	 	 					alert("删除失败！");
	 		 			}
	 			},
	 			error:function(data){
	 				alert("删除失败，请重试！");
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
	 <div class="question" title="帮助" onclick="javascript:cha('${QXB.QXDM}');"></div>
    <div class="address">当前位置：${QXB.FQXMC} >> ${QXB.QXMC}</div>
	 <div class="clr"></div>
    <form name="cxform" method="post" id="cxform" >
    	<div class="butsea">
	   		<table border="0" cellpadding="0" cellspacing="0" width="100%">
	           <tr>
	           	  <td height="35px" width="20%" align="left">
	              	<div class="addlist_button1 ml5" style="float: left;"> <a href="javascript:void(0);" onclick="addDbmwh();"><span>添&nbsp;&nbsp;加</span></a> </div>
	             	<div class="addlist_button1 ml5" style="float: left;"> <a href="javascript:void(0);" onclick="delDmbwh();"><span>删&nbsp;&nbsp;除</span></a> </div>
	              </td>
		          <td height="35px" width="80%" align="right"> 
		          	<div class="addlist_button1 ml5" style="float: right;"> <a href="javascript:void(0);" onclick="cxdmbwh();"><span>查&nbsp;&nbsp;询</span></a> </div>
		          	<div style="display: inline;float: right;">
			          	表:&nbsp;
	        			<input style="width: 120px" type="text" name="cxtablename" id="cxtablename" value="${dmbwhPage.cxtablename}" />
        			</div>
		          </td>
	          </tr>
	        </table>
		</div>
	</form>
	
	<div class="clr"></div>
	  <div class="list">
	  <form name="ff" method="post" id="ff" >
      <table width="100%" cellpadding="0" cellspacing="0" class="bot_line" style="border-collapse:collapse;text-align: center;">
        <tr>
          <th width="3%"><input type="checkbox" onclick="javascript:allcheck(this,'ids');" title="全选/不选" style="padding:0;margin-left:2px;*margin-left:-2px;"/></th>
          <th style="text-align: center;">序号</th>
          <th style="text-align: center;">表</th>
          <th style="text-align: center;">代码</th>
          <th style="text-align: center;">名称</th>         
          <th style="text-align: center;">操作</th>
        </tr>
  		<c:forEach items="${mapList}" var="obj" varStatus="status">
	      	<tr>
	      	  <td>
              	<input name="ids" type="checkbox" value="${obj.TABLENAME}" style="padding:0;margin-left:2px;*margin-left:-2px;"/>
              </td>
	       	  <td>
	       	  	${status.index+1 }
	       	  </td>
		 	  <td>${obj.TABLENAME}</td>
		 	  <td>${obj.DM}</td>
		 	  <td>${obj.MC}</td>
	          <td>	
         	 	<a href="javascript:void(0);" onclick="javascript:editDmbwh('${obj.TABLENAME }');" class="btns btn-info" title="修改"><i class="glyphicon glyphicon-pencil"></i></a>
	          </td>
	     	</tr>
        </c:forEach>
      </table>
      </form>
    </div>
    
	 <c:if test="${not empty dmbwhPage && dmbwhPage.pageCount>1}">
		<ff:page  mhFrom="cxform" showReSize="true" listPageCount="10" field="dmbwhPage" onlyOneShow="true" showListNo="true" action="dmbwh/dmbwhList"/>
	 </c:if>
	 <div class="clr"></div>
  </div>
</div>

<%-- 添加弹框 --%>
<div id="ckjsxmDiv" class="tan_add" style="display:none;width:450px; background: #fff; border: 3px solid #999;" >
  <div class="ckjsxmForm" style=" position:relative">
  		<div id="cyjsDiv" style="clear:both;position:absolute;left:7px;top:60px"></div> 
	  <div class="pd10">
	  	 <div class="popup_left" id="qxzName3">添加代码表</div>
	     <a href="#" class="btn_close" onclick="javascript:BOX_remove('ckjsxmDiv');"></a>
	     <div class="clr"></div>
	  </div>	  
      <div style="float:none; clear:both; overflow:hidden;" >
        <iframe frameborder="0" id="ckjsxmiframe" name="ckjsxmiframe" frameborder="0" src="" style="width:450px;height:220px;overflow:hidden;" ></iframe>
      </div>
      <div id="oMainLi  stToolBar" class="wp_toolbar_inner" style=" padding:10px 10px 20px 0;">
          
          <div class="addlist_button1 ml10" style="float: right" ><a href="javascript:void(0);" onclick="javascript:BOX_remove('ckjsxmDiv');return false;" ><span>取消</span></a></div>
          <div class="addlist_button1" style="float: right" ><a href="javascript:void(0);" onclick="javascript:bcAdd();" ><span>确定</span></a></div>
      	  <div class="clr"></div>
      </div>
     </div>
  </div>
  
  <%-- 修改弹框 --%>
<div id="ckjsxmDiv2" class="tan_add" style="display:none;width:450px; background: #fff; border: 3px solid #999;" >
  <div class="ckjsxmForm" style=" position:relative">
  		<div id="cyjsDiv" style="clear:both;position:absolute;left:7px;top:60px"></div> 
	  <div class="pd10">
	  	 <div class="popup_left" id="qxzName3">修改代码表</div>
	     <a href="#" class="btn_close" onclick="javascript:BOX_remove('ckjsxmDiv');"></a>
	     <div class="clr"></div>
	  </div>	  
      <div style="float:none; clear:both; overflow:hidden;" >
        <iframe frameborder="0" id="ckjsxmiframe2" name="ckjsxmiframe2" frameborder="0" src="" style="width:450px;height:220px;overflow:hidden;" ></iframe>
      </div>
      <div id="oMainLi  stToolBar" class="wp_toolbar_inner" style=" padding:10px 10px 20px 0;">
          
          <div class="addlist_button1 ml10" style="float: right" ><a href="javascript:void(0);" onclick="javascript:BOX_remove('ckjsxmDiv2');return false;" ><span>取消</span></a></div>
          <div class="addlist_button1" style="float: right" ><a href="javascript:void(0);" onclick="javascript:bcEdit();" ><span>确定</span></a></div>
      	  <div class="clr"></div>
      </div>
     </div>
  </div>
</div>

<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"></div>
</body>
</html>


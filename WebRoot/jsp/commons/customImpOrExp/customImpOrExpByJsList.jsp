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
<title>自定义导入列表</title>
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blue/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blue/css/dripicon.css"> 
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blue/css/skin-select.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blue/css/tooltipster.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blue/css/css.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blue/css/tooltipster.css">

<link href="<%=path%>/resources/style/blue/css/top.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blue/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blue/css/left.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blue/css/content.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blue/css/pageTag.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blue/css/zTreeStyle.css" rel="stylesheet" type="text/css" />
<jsp:include page="../js/js_jquery.jsp"/>

<style type="text/css">
	html, body { height:100%; }
	.Contentbox { width:100%; min-height:100%;height:auto }
	*html .Contentbox { height:100% }
	.link{width:60px;height:26px;border-radius: 3px;background:#f1f1f1;display:inline-block;border:1px solid #bebebe;line-height:26px;margin-top:4px;text-align:center;color:#222}
</style>
<script type="text/javascript">

//查询自定义导入
function cxjssb(){
	document.cxform.action="<%=path%>/customImpOrExp/queryCustomImpOrExpByjs";
	document.cxform.submit();
}

//弹出自定义导入弹窗
function viewZdydr(id){
	var src = "<%=path%>/customImpOrExp/customImpOrExpZdydr?id="+id;
    $("#xzjsxmiframe2").attr("src",src);
 	BOX_show('xzjsxmDiv2');
}
	

//保存导入信息
function saveImp(){
	//调取子页面确定导入方法
	$("#xzjsxmiframe2")[0].contentWindow.saveImp();
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
		          <td height="35px" width="80%" align="right"> 
		          	<div class="addlist_button1 ml5" style="float: right;"> <a href="javascript:void(0);" onclick="cxjssb();"><span>查&nbsp;&nbsp;询</span></a> </div>
		          	<div style="display: inline;float: right;">
			          	表名称:&nbsp;
	            		<input style="width: 120px" type="text" name="ywmc" id="ywmc" value="${customImpOrExpPage.ywmc}" />
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
          <th style="text-align: center;">序号</th>
          <th style="text-align: center;">业务ID</th>
          <th style="text-align: center;">业务名称</th>
          <th style="text-align: center;">表名</th>
          <!-- 
          <th style="text-align: center;">角色</th>
           -->
          <th style="text-align: center;">导入类型</th>
          <th style="text-align: center;">自定义导入</th>
        </tr>
  		<c:forEach items="${customImpOrExpList}" var="obj" varStatus="status">
	      	<tr>
	       	  <td>
	       	  	${status.index+1 }
	       	  </td>
		 	  <td>${obj.id}</td>
		 	  <td>${obj.ywmc}</td>
		 	  <td>${obj.tablename}</td>
		 	  <!-- 
		 	  <td>
		 	  	<c:forEach items="${obj.js}" var="js" varStatus="status">
		 	  	  ${js.jsmc}
		 	  	 <c:if test="${status.last==false}">
		 	  	 ,
		 	  	 </c:if>
		 	  	</c:forEach>
		 	  </td>
		 	   -->
		 	  <td>${obj.imptype}</td>
	          <td>	
	         	<a href="javascript:void(0);" onclick="javascript:viewZdydr('${obj.id }');" class="btns btn-info" title="自定义导入导出">自定义导入</a>
	          </td>
	     	</tr>
        </c:forEach>
      </table>
      </form>
    </div>
    
	 <c:if test="${not empty customImpOrExpPage && customImpOrExpPage.pageCount>1}">
		<ff:page  mhFrom="cxform" showReSize="true" listPageCount="10" field="customImpOrExpPage" onlyOneShow="true" showListNo="true" action="customImpOrExp/queryCustomImpOrExpByjs"/>
	 </c:if>
	 <div class="clr"></div>
  </div>
</div>

<div id="xzjsxmDiv2" class="tan_add" style="display:none;width:1050px; background: #fff; border: 3px solid #999;" >
  <div class="xzjsxmForm2" style=" position:relative">
  	  <div id="cyjsDiv" style="clear:both;position:absolute;left:7px;top:60px"></div> 
	  <div class="pd10">
	  	 <div class="popup_left" id="qxzName2">自定义导入</div>
	     <a href="#" class="btn_close" onclick="javascript:BOX_remove('xzjsxmDiv2');"></a>
	     <div class="clr"></div>
	  </div>	  
      <div style="float:none; clear:both; overflow:hidden;" >
        <iframe frameborder="0" id="xzjsxmiframe2" name="xzjsxmiframe2" frameborder="0" src="" style="width:100%;height:320px;overflow:hidden;" ></iframe>
      </div>
      <div id="oMainLi  stToolBar" class="wp_toolbar_inner" style=" padding:10px 10px 20px 0;">
          <div class="addlist_button1 ml10" style="float: right" ><a href="javascript:void(0);" onclick="javascript:BOX_remove('xzjsxmDiv2');return false;" ><span>取消</span></a></div>
          <div id="saveImportBtn" class="addlist_button1 ml10" style="float: right;display: none;" ><a href="javascript:void(0);" onclick="saveImp();" ><span>导入</span></a></div>
      	  <div class="clr"></div>
      </div>
     </div>
  </div> 
 
<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"></div> 

</body>
</html>


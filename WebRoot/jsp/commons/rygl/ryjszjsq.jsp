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
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jquery.ztree.core-3.1.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jquery.ztree.excheck-3.1.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript">	
	//多选
	$(document).ready(function(){
		$("#ff").baigoCheckall();
	});
	//查询
	function queryLike(){
	    document.queryform.action = '<%=path%>/zjwh/queryRyjsZjqx';
	    document.queryform.submit();
	}
	//添加组件维护权限
	function addZjwhQx(){		
	    if(confirm("您确定选中要授权的组件吗？") == true){
	        document.ff.action = '<%=path%>/zjwh/addRyjsZjsq';
	        $('#ff').ajaxSubmit(function(r){
	    		if(r="1"){
					alert("授权成功!");					
					parent.window.BOX_remove('qx_jyss');
					
		    	}else{
					alert("授权失败!");
			     	parent.window.BOX_remove('qx_jyss');
		    	}
	    	});
	    }
	}
	
	

</script>
</head>

<body>
   <div class="butsea">
      <table  border="0" align="left" cellpadding="0" cellspacing="0"  >
        <tr>
          <td height="35px"> 
            <div class="addlist_button"> <a href="javascript:addZjwhQx();"><span>保&nbsp;&nbsp;存</span></a> </div>             
          </td>
        </tr>
      </table>
      <form name="queryform" method="post" id="queryform" >
      	<input type="hidden" name="jsdm"     value="${page.jsdm}"/>
      	<input type="hidden" name="yhdm"     value="${page.yhdm}"/>
      	<input type="hidden" name="qxlb"     value="${page.qxlb}"/>
        <table border="0" align="right" cellpadding="0" cellspacing="0"  >
          <tr>
            <td>组件名称：</td>
            <td><input type="text" name="pzjmc" value="${page.pzjmc}"/></td>
            <td><div class="addlist_button2"><a href="javascript:queryLike();"><span>搜&nbsp;&nbsp;索</span></a></div></td>
          </tr>
        </table>
      </form>
    </div>
    <div class="clr"></div>
    <div class="list">
      <form name="ff" method="post" id="ff" >
      	<input type="hidden" name="jsdm"    value="${page.jsdm}"/>
      	<input type="hidden" name="yhdm"    value="${page.yhdm}"/>
      	<input type="hidden" name="qxlb"     value="${page.qxlb}"/>		
		<!-- 查询用 -->
        <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
            <th width="5%"><input type="checkbox" id="ids" title="全选/不选" style="padding:0;margin-left:2px;*margin-left:-2px;"/></th>
            <th >组件名称</th>
            <th >SRC</th> 
            <th >模板内容</th>
            <th>模板地址</th>
            <th>模板数据源</th>
            <th>更多链接地址</th>
          </tr>
          <c:forEach items="${list}" var="map" varStatus="i">
            <tr <c:if test="${i.count % 2 eq '0'}">class="bgcol"</c:if>>
              <td>
              	<c:if test="${map.sfxz == '1'}">
              		<input name="ids" type="checkbox" value="${map.qxdm}" style="padding:0;margin-left:2px;*margin-left:-2px;" checked="checked"/>
              	</c:if>
              	<c:if test="${map.sfxz == '0'}">
              		<input name="ids" type="checkbox" value="${map.qxdm}" style="padding:0;margin-left:2px;*margin-left:-2px;" />
              	</c:if>              	                
              </td>
              <td>${map.zjxxmc}</td>
              <td>${map.src}</td>
              <td>${map.mbnr}</td>
              <td>${map.mbdz}</td>
              <td>${map.mbsjy}</td>
              <td>${map.href}</td>
           </tr>
          </c:forEach>
        </table>
      </form>
    </div>
<%--    <div class="youtube01"> --%>
<%--   	  <c:if test="${not empty page }">--%>
<%--        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="page" onlyOneShow="true" showListNo="true" action="zjwh/queryRyjsZjqx"/>--%>
<%--      </c:if>--%>
<%--    </div>--%>
    <div class="clr"></div>
 
<div id="setting"> </div>
</body>
</html>


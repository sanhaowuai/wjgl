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
	    document.queryform.action = '<%=path%>/rycpckjlwb/queryXtryxz';
	    document.queryform.submit();
	}

	function radioFunction(yhdm,yhxm){
		$("#yhdm",parent.document).val(yhdm);
		$("#yhxm",parent.document).html(yhxm);
		
		
		parent.closeSel(); 
	}
	
	
</script>
</head>

<body>
    	
   <div class="butsea">
<%--      <table  border="0" align="left" cellpadding="0" cellspacing="0"  >--%>
<%--        <tr>--%>
<%--          <td height="35px"> --%>
<%--            <div class="addlist_button"> <a href="javascript:addZjwhQx();"><span>保&nbsp;&nbsp;存</span></a> </div>             --%>
<%--          </td>--%>
<%--        </tr>--%>
<%--      </table>--%>
      <form name="queryform" method="post" id="queryform" >
      <input type="hidden" name="jsdm"  value="${jsdm}"/>	
        <table border="0" align="right" cellpadding="0" cellspacing="0"  >
          <tr>
            <td>用户代码/姓名：</td>
            <td><input type="text" name="pzgh" value="${xtryxzPage.pzgh}"/></td>
            <td><div class="addlist_button2"><a href="javascript:queryLike();"><span>搜&nbsp;&nbsp;索</span></a></div></td>
          </tr>
        </table>
      </form>
    </div>
    <div class="clr"></div>
    <div class="list">
      <form name="ff" method="post" id="ff" >
<%--      	<input type="hidden" name="jsdm"   value="${jsdm}"/>		--%>
		<!-- 查询用 -->
        <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
            <th width="5%">
            </th>
            <th>用户代码</th>
            <th>姓名</th>
          </tr>
          <c:forEach items="${list}" var="map" varStatus="i">
            <tr <c:if test="${i.count % 2 eq '0'}">class="bgcol"</c:if>>
              <td>
             	<input name="ids" type="radio" value="${map.YHDM}" onclick="javascript:radioFunction('${map.YHDM}','${map.XM}');return false;" style="padding:0;margin-left:2px;*margin-left:-2px;" />
              </td>
              <td>${map.YHDM}</td>
              <td>${map.XM}</td>
           </tr>
          </c:forEach>
        </table>
      </form>
    </div>
    <div class="youtube01"> 
   	  <c:if test="${not empty xtryxzPage }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="xtryxzPage" onlyOneShow="true" showListNo="true" action="rycpckjlwb/queryXtryxz"/>
      </c:if>
    </div>
    <div class="clr"></div>
 
<div id="setting"> </div>
</body>
</html>


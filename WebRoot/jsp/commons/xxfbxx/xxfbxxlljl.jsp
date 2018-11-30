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
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/My97DatePicker/WdatePicker.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/bootstrap.js"></script>
<script type="text/javascript" >
	// 查询/刷新
	function querylike(){
		document.queryform.action="<%=path%>/xxfbxx/queryXxfbLljl";
		document.queryform.submit();
	}
	// 返回
	function goback(){
		document.queryform.action="<%=path%>/xxfbxx/queryXxfbgl";
		document.queryform.submit();
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
          </td>
        </tr>
      </table>
	 <div class="dropdown pull-right">
        <form id="queryform" name="queryform" method="post">
      	<input type="hidden" name="FQXMC" value="${QXB.FQXMC}"/>
	  	<input type="hidden" name="QXMC" value="${QXB.QXMC}"/>
      	<input type="hidden" name="xxid" value="${xxfbxxlljlPage.xxid }"/>
	  	<input type="hidden" name="pxxlb" value="${xxfbxxglPage.pxxlb }" />
	  	<input type="hidden" name="pfbr" value="${xxfbxxglPage.pfbr }" />
	  	<input type="hidden" name="pxxbt" value="${xxfbxxglPage.pxxbt }" />
   	  	<input type="hidden" name="pxydm" value="${xxfbxxglPage.pxydm }" />
      	<input type="hidden" name="pfbqssj" value="${xxfbxxglPage.pfbqssj }" />
      	<input type="hidden" name="pfbjssj" value="${xxfbxxglPage.pfbjssj }" />
	   <div class="btn-group">
		  <button type="button" class="btn btn-search dropdown-toggle" data-toggle="dropdown">搜索 <span class="caret"></span></button>
		  <div class="dropdown-menu search-list pull-right" role="menu" style="width:260px;">
          <table border="0" width="96%"  cellpadding="0" cellspacing="0"  >
		      <tr>
		      	<th width="100">用户姓名：</th>
	           	<td><input type="text" name="pyhxm" value="${xxfbxxlljlPage.pyhxm}" /></td>
		       </tr>
		       <tr>
		        <th>读取起始时间：</th>
	           	<td><input type="text" name="pdqqssj" id="pdqqssj" value="${xxfbxxlljlPage.pdqqssj}"  class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd  HH:mm',maxDate:'#F{$dp.$D(\'pdqjssj\')}'})"/></td>
		      </tr>
		       <tr>
		        <th>读取结束时间：</th>
	           	<td><input type="text" name="pdqjssj" id="pdqjssj" value="${xxfbxxlljlPage.pdqjssj}" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd  HH:mm',minDate:'#F{$dp.$D(\'pdqqssj\')}'})"/></td>
      		</tr>
      	</table> 
	    <div class="divider"></div>
        <div class="clr"></div>
        <div class="addlist_button pull-right mr10"> <a  href="javascript:void(0);" onclick="javascript:querylike();return false;"><span>确定</span></a> </div>
	   </div>
	</div>
    </form>     
   </div>       
    </div>
    <div class="clr"></div>
    <div class="list">
      <form name="ff" method="post" id="ff" >
        <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
            <th>用户姓名</th>
            <th>单位</th> 
            <th>读取时间</th>
          </tr>
          <c:forEach items="${list}" var="map" varStatus="i">
 		    <tr <c:if test="${i.count % 2 eq '0'}">class="bgcol"</c:if>>
	  		  <td>${map.yhxm}</td>
	  		  <td>${map.yxmc}</td>
			  <td>${map.dqsj}</td>
            </tr>
		  </c:forEach>
        </table>
      </form>
    </div>
    <div class="youtube">
      <c:if test="${not empty xxfbxxlljlPage }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="xxfbxxlljlPage" onlyOneShow="true" showListNo="true" action="xxfbxx/queryXxfbLljl"/>
      </c:if>
    </div>
    <div class="clr"></div>
  </div>
</div>
 
<div id="setting"> </div>
</body>
</html>

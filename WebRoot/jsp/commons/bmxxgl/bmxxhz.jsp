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
<script type="text/javascript" src="<%=path%>/resources/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/bootstrap.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
	   $("#ff").baigoCheckall();
	});
	//查询
	function fanhui(){
	    document.ff.action = '<%=path%>/bmxxgl/queryAllBmxx';
	    document.ff.submit();
	}
	function queryLike(){
	    document.queryform.action = '<%=path%>/bmxxgl/queryForCkhzBmxx';
	    document.queryform.submit();
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
           <div class="addlist_button"> <a href="javascript:void(0);" onclick="javascript:fanhui();return false;" ><span>返&nbsp;&nbsp;回</span></a> </div>
          </td>
        </tr>
      </table>
	 <div class="dropdown pull-right">
       <form name="queryform" method="post" id="queryform" >
        <input type="hidden" name="xxid" id="qf_xxid" value="${bmxxhzPage.ppxxid}"/>
        <input type="hidden" name="FQXMC"   value="${QXB.FQXMC}"/>
        <input type="hidden" name="QXMC"    value="${QXB.QXMC}"/>
	   <div class="btn-group">
		  <button type="button" class="btn btn-search dropdown-toggle" data-toggle="dropdown">搜索 <span class="caret"></span></button>
		  <div class="dropdown-menu search-list pull-right" role="menu" style="width:340px;">
          <table border="0" width="96%"  cellpadding="0" cellspacing="0"  >
		      <tr>
		      	<th width="100">用户姓名：</th>
	           	<td><input type="text" name="ppyhxm" id="qf_yhxm" value="${bmxxhzPage.ppyhxm}" /></td>
		       </tr>
		       <tr>
		        <th>读取日期区间：</th>
	           	<td>
	           	  <input name="ppfbksrq" id="qf_ksrq" value="${bmxxhzPage.ppfbksrq}" type="text" style="width:98px !important;"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',maxDate:'#F{$dp.$D(\'qf_jsrq\')}'})"  class="Wdate"/>
	           	  至 <input name="ppfbjsrq" id="qf_jsrq" value="${bmxxhzPage.ppfbjsrq}" type="text" style="width:98px !important;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',minDate:'#F{$dp.$D(\'qf_ksrq\')}'})" class="Wdate"/> 
	           	</td>
		      </tr>
      	</table> 
	    <div class="divider"></div>
        <div class="clr"></div>
        <div class="addlist_button pull-right mr10"> <a href="javascript:void(0);" onclick="javascript:queryLike();return fasle;"><span>确定</span></a> </div>
	   </div>
	</div>
    </form>     
   </div>        

    </div>
    <div class="clr"></div>
    <div class="list">
      <form name="ff" method="post" id="ff" >
		 <input type="hidden" id="FQXMC" name="FQXMC" value="${QXB.FQXMC}"/>
			  <input type="hidden" id="QXMC" name="QXMC" value="${QXB.QXMC}"/>
		    <%--   跳页分页传值   开始	  --%>
			 
			  <input type=hidden name="pxxbt"  value="${bmxxPage.pxxbt}" />
			  <input type=hidden name="pfbksrq"  value="${bmxxPage.pfbksrq}" />
			  <input type=hidden name="pfbjsrq"  value="${bmxxPage.pfbjsrq}" />
			  <input type="hidden" name="pglfw"  value="${bmxxPage.pglfw}"/>
			  <input type="hidden" name="pckfw"  value="${bmxxPage.pckfw}" />
			  <input type="hidden" name="pfbr"  value="${bmxxPage.pfbr}"/>
			  <input type="hidden" name="pfbbm"  value="${bmxxPage.pfbbm}"/>
			  <input type="hidden" name="xxid" id="ff_xxid"/>
			 
		<!-- 查询用 -->
        <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
            <th width="20%">序号</th>
          <th width="40%">用户姓名</th>
          <th width="40%">读取时间</th>
          </tr>
          <c:forEach items="${list}" var="obj" varStatus="i">
		      <tr>
		        <td>&nbsp;&nbsp;${i.index+1}</td>
		        <td>${obj.YHXM}</td>
		        <td>${obj.DQSJ}</td>
		      </tr>
	      </c:forEach>
        </table>
      </form>
    </div>
    <div class="youtube"> 
   	  <c:if test="${not empty fbxxhzPage }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="fbxxhzPage" onlyOneShow="true" showListNo="true" action="bmxxgl/queryForCkhzBmxx"/>
      </c:if>
    </div>
    <div class="clr"></div>
  </div>
</div>
 
<!-- div --> 
<!-- 添加or修改 -->
<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"> </div>
</body>
</html>


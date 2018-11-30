<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>数字管理中心</title>

<jsp:include page="../../include/css-main-include.jsp"></jsp:include>
<style type="text/css">
	html, body { height:100%; 
	}
	.Contentbox { width:100%; min-height:100%;height:auto }
	*html .Contentbox { height:100% }
		.select_btn{  color:#FFFFFF;border:3px #50B3EE solid;background:#50B3EE}
	
</style>
<script type="text/javascript">

function querylike(){
	document.queryform.action="<%=path%>/ywlcsz/queryAllyh";
	document.queryform.submit();
}

function resultjsgl(value){
	var str= new Array();    
	str = value.split(",");
	opener.resultJuese(str);
	window.close();
}
</script>
</head>
<body>
<div class="Contentbox">
    <div class="pd10">
        <div class="butsea">
            <form id="queryform" name="queryform" method="post">
            <table  border="0" align="right" cellpadding="0" cellspacing="0"  >
                <tr>
                    <td >用户代码/名称：</td>
                    <td><input type="text" name="yhdm" id="yhdm" value="${yhPage.yhdm}"  /></td>
                    <td ><div class="addlist_button2"> <a href="javascript:void(0);" onclick="javascript:querylike();"><span>搜&nbsp;&nbsp;索</span></a> </div></td>
                </tr>
            </table>
            </form>
        </div>
        <div class="clr"></div>
        <div class="list">
        <form name="ff" method="post" id="ff" >
            <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
				<tr>
                	<th >选择</th>
                    <th >用户代码</th>
                    <th >用户名称</th>
                </tr>
                
		    <c:forEach items="${list}" var="map"   varStatus="status">
	        	<tr <c:if test="${status.count % 2 eq '0'}">class="bgcol"</c:if>>
	        	<td ><a class="select_btn" href="javascript:void(0);" onclick='javascript:resultjsgl("${map.YHDM},${map.XM}")';>选择</a></td>
	         	<td >${map.YHDM}</td>
	         	<td >${map.XM}</td>
	       		</tr>
      		</c:forEach>
            </table>
            </form>
        </div>
        <div class="clr"></div>

        <div class="youtube">
        <c:if test="${not empty yhPage }">
           <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="yhPage" onlyOneShow="true" showListNo="false" action="ywlcsz/queryAllyh"/>
          </c:if>
        </div>
    </div>
</div>


<div id="setting"> </div>
<div id="zyxxlist" style="display:none; width: 800px;height:400px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" > </div>
</body>
</html>


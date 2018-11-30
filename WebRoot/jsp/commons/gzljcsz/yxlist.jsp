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
<title></title>

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
	document.queryform.action="<%=path%>/ywlcsz/queryAllyx";
	document.queryform.submit();
}

function resultjsgl(value){
	var str= new Array();    
	str = value.split(",");
	opener.resultBm(str);
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
                    <td >院系名称：</td>
                    <td><input type="text" name="yxmc" id="yxmc" value="${yxPage.yxmc}"  /></td>
                    <td ><div class="addlist_button2"> <a href="javascript:void(0);" onclick="javascript:querylike();"><span>搜&nbsp;&nbsp;索</span></a> </div></td>
                </tr>
            </table>
            </form>
        </div>
        <div class="clr"></div>
        <div  class="list">
        <form name="ff" method="post" id="ff" >
            <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
                <tr>
                	<th width="20%">选择</th>
                    <th width="20%">院系代码</th>
                    <th width="20%">院系名称</th>
              
                </tr>
		    <c:forEach items="${list}" var="map"  varStatus="status">
	        	<tr <c:if test="${status.count % 2 eq '0'}">class="bgcol"</c:if>>
	        	<td  width="20%"><a class="select_btn" href="javascript:void(0);" onclick='javascript:resultjsgl("${map.YXDM},${map.YXMC}")';>选择</a></td>
	         	<td  width="20%">${map.YXDM}</td>
	         	<td  width="20%">${map.YXMC}</td>
	         
	       		</tr>
      		</c:forEach>
            </table>
            </form>
        </div>
        <div class="clr"></div>

        <div class="youtube">  
        <c:if test="${not empty yxPage }">
           <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="yxPage" onlyOneShow="true" showListNo="false" action="ywlcsz/queryAllyx"/>
          </c:if>
        </div>
    </div>
</div>


<div id="setting"> </div>
<div id="zyxxlist" style="display:none; width: 800px;height:400px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" > </div>
</body>
</html>


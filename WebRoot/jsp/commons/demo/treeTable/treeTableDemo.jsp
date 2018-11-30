<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    
<title>treeTableDemo</title>
    
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>
<jsp:include page="treeTable.include.jsp" />
<script type="text/javascript">
$().ready(function(){
	treetable();
});

function expandall(){
    var zhi=$('tr[id^=node]');
    zhi.each(function(i,val){  
        $(val).expand();
    });
}

function collapseall(){
    var zhi=$('tr[id^=node]');
    zhi.each(function(i,val){  
        $(val).collapse();
    });
}
</script>

  </head>
  
  <body>
    <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line" id="zbtable">
            <thead>
                <tr>
	             <th width="21%">
		             <span class="Floatleft" style="padding:0px">菜单名称 </span>
		              <a href="javascript:void(0);" onclick="javascript:expandall();return false;" class="open_but" title="展开"></a>
		              <a href="javascript:void(0);" onclick="javascript:collapseall();return false;" class="close_but" title="收起"></a>
	             </th>
                    <th width="22%">访问路径</th>
                    <th width="21%">可用否</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${qxcd_list}" var="qxcd" varStatus="status">
    		      <tr id="node${qxcd.treedm}" ${status.count%2==0 ? 'class="bgcol"':'null' } class="<c:choose><c:when test='${qxcd.fqxdm==-1}'>parent</c:when><c:otherwise>child</c:otherwise></c:choose>
    		      <c:choose><c:when test='${qxcd.treefdm==null}'></c:when><c:otherwise>child-of-node</c:otherwise></c:choose>${qxcd.treefdm}"
    		        style="line-height:30px;">
    			    <td><span class="<c:choose><c:when test='${qxcd.fqxdm==-1}'>folder</c:when><c:otherwise>file</c:otherwise></c:choose>">
    			    &nbsp;</span><span>${qxcd.qxmc}</span></td>
    				<td>${qxcd.fwlj}</td>
    				<td>
    				<c:choose>
    				<c:when test="${qxcd.kyf == 1}">可用</c:when>
    				<c:otherwise>不可用</c:otherwise>
    				</c:choose>
    				</td>
    			  </tr>
    	       </c:forEach>
    	       </tbody>
            </table>
  </body>
</html>

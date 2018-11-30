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
<script type="text/javascript" src="<%=path%>/resources/js/bootstrap.js"></script>
<script type="text/javascript">	
	//多选
	$(document).ready(function(){
		$("#ff").baigoCheckall();
	});
	//查询
	function queryLike(){
	    document.queryform.action = '<%=path%>/shoujcd/queryAppCdsq';
	    document.queryform.submit();
	}
	//添加组件维护权限
	function addZjwhQx(){		
	    if(confirm("您确定要授权选中的菜单吗？") == true){
	        document.ff.action = '<%=path%>/shoujcd/addAppsq';
	        $('#ff').ajaxSubmit(function(r){
	    		if(r==1){
					alert("授权成功!");					
					parent.window.BOX_remove('appCdsqDiv');
		    	}else{
					alert("授权失败!");
			     	parent.window.BOX_remove('appCdsqDiv');
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
            <div class="addlist_button"> <a href="javascript:addZjwhQx();"><span>授权</span></a> </div>             
          </td>
        </tr>
      </table>
	 <div class="dropdown pull-right">
       <form name="queryform" method="post" id="queryform" >
       <input type="hidden" name="jsdm" value="${jsdm}"/>
	   <div class="btn-group">
		  <button type="button" class="btn btn-search dropdown-toggle" data-toggle="dropdown">搜索 <span class="caret"></span></button>
		  <div class="dropdown-menu search-list pull-right" role="menu" style="width:260px;">
          <table border="0" width="96%"  cellpadding="0" cellspacing="0"  >
		      <tr>
		      	<th width="90">位置：</th>
	           	<td>
	           	  <select name="wz">
            		<option value="L" <c:if test="${param.wz eq 'L'}">selected='selected'</c:if>>左</option>
            		<option value="R" <c:if test="${param.wz eq 'R'}">selected='selected'</c:if>>右</option>
            		<option value="C" <c:if test="${param.wz eq 'C'}">selected='selected'</c:if>>中间</option>
            		<option value="B" <c:if test="${param.wz eq 'B'}">selected='selected'</c:if>>底部</option>
            	  </select>        
		        </td>
		       </tr>
		       <tr>
		        <th>子系统：</th>
	           	<td>
	           	  <select name="zxtdm">
            		<option value="" <c:if test="${param.zxtdm eq ''}">selected='selected'</c:if>>请选择</option>
            		<c:forEach var="map" items="${zxtList}">
            		<option value="${map.xtdm }" <c:if test="${param.zxtdm eq map.xtdm}">selected='selected'</c:if>>"${map.xtmc }</option>
            		</c:forEach>
            	  </select>        
		        </td>
		      </tr>
		       <tr>
		        <th>菜单名称：</th>
	           	<td><input type="text" name="qxmc" value="${param.qxmc}"/></td>
		      </tr>
		       <tr>
		        <th>学号/姓名：</th>
	           	<td><input type="text" name="xhxm" value="${zgmdglPage.xhxm}"/></td>
		        <td></td>
      		</tr>
      	</table> 
	    <div class="divider"></div>
        <div class="clr"></div>
        <div class="addlist_button pull-right mr10"> <a href="javascript:queryLike();"><span>确定</span></a> </div>
	   </div>
	</div>
    </form>     
   </div>      

    </div>
    <div class="clr"></div>
    <div class="list">
      <form name="ff" method="post" id="ff" >
      	<input type="hidden" name="jsdm" value="${jsdm}"/>
      	<input type="hidden" name="wz" value="${param.wz}"/>
		<!-- 查询用 -->
        <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
            <th width="5%"><input type="checkbox" id="qxdm" title="全选/不选" style="padding:0;margin-left:2px;*margin-left:-2px;"/></th>
            <th >菜单名称</th>
<%--            <th >位置</th> --%>
            <th>appUrl</th>
            <th >子系统</th>
          </tr>
          <c:forEach items="${list}" var="map" varStatus="i">
            <tr <c:if test="${i.count % 2 eq '0'}">class="bgcol"</c:if>>
              <td>
              	<c:if test="${map.sfxz == '1'}">
              		<input name="qxdm" type="checkbox" value="${map.qxdm}" style="padding:0;margin-left:2px;*margin-left:-2px;" checked="checked"/>
              	</c:if>
              	<c:if test="${map.sfxz == '0'}">
              		<input name="qxdm" type="checkbox" value="${map.qxdm}" style="padding:0;margin-left:2px;*margin-left:-2px;" />
              	</c:if>              	                
              </td>
              <td>${map.qxmc}</td>
<%--              <td>${map.wz}</td>--%>
              <td>${map.appurl}</td>
              <td>${map.zxtdm}</td>
           </tr>
          </c:forEach>
        </table>
      </form>
    </div>
    <div class="clr"></div>
 
<div id="setting"> </div>
</body>
</html>


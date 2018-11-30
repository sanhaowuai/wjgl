<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/bootstrap.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	   $("#zbtable").baigoCheckall();
	});
	function queryLike(){
		document.ff.action="<%=path%>/jxcdgl/queryYx";
		document.ff.submit();
	}
	
	//修改教学场地的使用部门
	function updSybm(){
		var dm = $("#dm").val();
		var ids = $("[name='ids']:checked");
		var obj = "";
		$.each(ids,function(){
			obj += $(this).val() + ",";
		})
		var zhi = {'dm':dm,'obj':obj};
		var url = "<%=path%>/jxcdgl/updSybm";
		$.post(url,zhi,function(result){
			if(result){
				parent.window.closeDiv('yx');
			}else{
				alert("使用部门分配失败!!");
				parent.window.closeDiv('yx');
				return;
			}
		},'json')
	}
</script>
</head>
  
<body>
	 <div class="dropdown pull-right">
      <form id="ff" name="ff" method="post">
      <input type="hidden" value="${dm}" id="dm" name="id"/>
      <input type="hidden" value="${sybm}" id="sybm" name="sybm"/>
	   <div class="btn-group">
		  <button type="button" class="btn btn-search dropdown-toggle" data-toggle="dropdown">搜索 <span class="caret"></span></button>
		  <div class="dropdown-menu search-list pull-right" role="menu" style="width:260px;">
          <table border="0" width="96%"  cellpadding="0" cellspacing="0"  >
		      <tr>
		      	<th width="100">院系代码：</th>
	           	<td><input type="text" name="yxdm" value="${yxdm}"/></td>
		       </tr>
		       <tr>
		        <th>院系名称：</th>
	           	<td><input type="text" name="yxmc" value="${yxmc}"/></td>
		      </tr>
		       <tr>
		        <th>发布起始时间：</th>
	           	<td><input name="skssj" id="qf_ksrq" value="${bmxxcxPage.skssj}" type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'qf_jsrq\')}'})" class="Wdate"/></td>
		      </tr>
		       <tr>
		        <th>发布结束时间：</th>
	           	<td><input name="sjssj" id="qf_jsrq" value="${bmxxcxPage.sjssj}" type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'qf_ksrq\')}'})" class="Wdate"/></td>
		        <td></td>
      		</tr>
      	</table> 
	    <div class="divider"></div>
        <div class="clr"></div>
        <div class="addlist_button pull-right mr10"> <a href="javascript:void(0);" onclick="javascript:queryLike();"><span>确定</span></a> </div>
	   </div>
	</div>
    </form>     
   </div>  
 <div class="clr"></div>
  <table width="100%"  cellpadding="0" cellspacing="0"  class="addlist_hp mt10" style="border-collapse:collapse" id="zbtable">
	<thead>
      <tr>
        <th width="20px;"><input type="checkbox" id="ids" title="全选/不选"/></th>
        <th width="50px;">院系代码</th>
        <th>院系名称</th>
      </tr>
    </thead>   
    <tbody>
      <c:forEach items="${yx_list}" var="map" varStatus="i">
		<tr <c:if test="${i.count % 2 eq '0'}">class="bgcol"</c:if>>
 		  <td><input type="checkbox" name="ids" value="${map.yxdm}" <c:if test="${map.checked eq 'true'}">checked="checked"</c:if>/></td>
 		  <td <c:if test="${map.sjyxdm eq 1}">style='padding-left:40px;'</c:if>>${map.yxdm}</td>
 		  <td <c:if test="${map.sjyxdm eq 1}">style='padding-left:40px;'</c:if>>${map.yxmc}</td>
		</tr>
      </c:forEach>
    </tbody>
  </table>
  <div class="clr"></div>
  <div style="margin-top:10px;">
    <div class="addlist_button1" style="float:right"><a href="javascript:void(0);"  title="取消" onclick="javascript:parent.window.closeDiv('yx');" ><span>取消</span></a> </div>
    <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:void(0);" title="保存" onclick="javascript:updSybm();"><span>保存</span></a> </div>
  </div>
</body>
</html>

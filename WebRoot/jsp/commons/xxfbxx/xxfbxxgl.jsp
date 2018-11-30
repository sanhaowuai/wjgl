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
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/My97DatePicker/WdatePicker.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/bootstrap.js"></script>
<script type="text/javascript" >
	$(document).ready(function(){
		$("#ff").baigoCheckall();
	   	var flag = "${flag}";
	   	if(flag == "success"){
			alert("操作成功！");
			querylike();
		}else if(flag == "error"){
			alert("操作失败！");
			querylike();
		}
	});
	// 查询/刷新
	function querylike(){
		document.queryform.action="<%=path%>/xxfbxx/queryXxfbgl";
		document.queryform.submit();
	}
	// 跳转学校发布信息维护
	function toXxfbxxwh(xxid){
		$("#qf_xxid").val(xxid);
		document.queryform.action="<%=path%>/xxfbxx/toXxfbxxwh";
		document.queryform.submit();
	}
	// 查询学校发布信息浏览记录
	function lljl(xxid){
		$("#qf_xxid").val(xxid);
		document.queryform.action="<%=path%>/xxfbxx/queryXxfbLljl";
		document.queryform.submit();
	}
	// 删除信息
	function delXx(){
	    if(isCheck('xxids') == false){
	        alert("请选择要删除的信息");
	        return;
	    }
	    if(confirm("您确定要删除选中的信息吗？")){
	        document.ff.action = "<%=path%>/xxfbxx/delXxfbxx";
	        $('#ff').ajaxSubmit(function(r){
	    		if(r == 1)
		    		alert("删除成功！");
	    		else
		    		alert("删除失败！");
	    		querylike();
	    	});
	    }
	}
	// 浏览信息
	function ckByID(xxid){
		window.open('<%=path%>/xxfbxx/queryXXbyid?xxid='+xxid+'&qxdm='+1+'&fqxdm='+1+'&random='+Math.random()*100000,"查看信息"+xxid ,'height=600, width=1024, top=100, left=300, titlebar=no,toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no,z-look=yes');
	}
	// 信息发布
	function xxfb(xxid){
		if(confirm("您是否要发布此条信息？")){
			var url = "<%=path%>/xxfbxx/updXxfb";
			var param = {"xxid" : xxid};
			$.post(url, param, function(result){
				if(result == 1)
					alert("发布成功！");
				else
					alert("发布失败！");
				querylike();
			});
		}
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
            <div class="addlist_button"> <a href="javascript:toXxfbxxwh();"><span>添&nbsp;&nbsp;加</span></a> </div>
            <div class="addlist_button  ml15"> <a href="javascript:delXx();" ><span>删&nbsp;&nbsp;除</span></a> </div>
          </td>
        </tr>
      </table>
	 <div class="dropdown pull-right">
       <form id="queryform" name="queryform" method="post">
      	<input type="hidden" name="FQXMC" value="${QXB.FQXMC}"/>
	  	<input type="hidden" name="QXMC" value="${QXB.QXMC}"/>
      	<input type="hidden" id="qf_xxid" name="xxid" value=""/>
	   <div class="btn-group">
		  <button type="button" class="btn btn-search dropdown-toggle" data-toggle="dropdown">搜索 <span class="caret"></span></button>
		  <div class="dropdown-menu search-list pull-right" role="menu" style="width:260px;">
          <table border="0" width="96%"  cellpadding="0" cellspacing="0"  >
		      <tr>
		      	<th width="100">信息类别：</th>
	           	<td>
	           	  <select name="pxxlb">
            		<option value="">--信息类别--</option>
            		<c:forEach var="map" items="${xxlbList}">
	            		<option value="${map.DM }" ${map.DM eq xxfbxxglPage.pxxlb ? 'selected' : '' }>${map.MC }</option>
            		</c:forEach>
            	</select>
	           	</td>
		       </tr>
		       <tr>
		        <th>发布部门：</th>
	           	<td>
	           	  <select name="pxydm">
            		<option value="">--发布部门--</option>
            		<c:forEach var="map" items="${bmList}">
	            		<option value="${map.YXDM }" ${map.YXDM eq xxfbxxglPage.pxydm ? 'selected' : '' }>${map.YXMC }</option>
            		</c:forEach>
            	</select> 
	           	</td>
		      </tr>
		       <tr>
		        <th>发布人：</th>
	           	<td><input type="text" name="pfbr" value="${xxfbxxglPage.pfbr}" /></td>
		      </tr>
		       <tr>
		        <th>信息标题：</th>
	           	<td><input type="text" name="pxxbt" value="${xxfbxxglPage.pxxbt}" /></td>
      		</tr>
      		<tr>
		        <th>发布起始时间：</th>
	           	<td>
	           	  <input type="text" name="pfbqssj" value="${xxfbxxglPage.pfbqssj}" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd  HH:mm'})"/>
	           	</td>
      		</tr>
      		<tr>
		        <th>发布结束时间：</th>
	           	<td>
	           	  <input type="text" name="pfbjssj" value="${xxfbxxglPage.pfbjssj}"  class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd  HH:mm'})"/> 
	           	</td>
      		</tr>
      	</table> 
	    <div class="divider"></div>
        <div class="clr"></div>
        <div class="addlist_button pull-right mr10"> <a href="javascript:void(0);" onclick="javascript:querylike();return false;"><span>确定</span></a> </div>
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
            <th style="text-align:center"><input type="checkbox" id="xxids" title="全选/不选"/></th>
            <th  width="70px">是否已读</th>
            <th>是否发布</th>
            <th>信息标题</th>
            <th>发布人</th> 
            <th>发布部门</th>
            <th>发布时间</th>
            <th>通知对象</th>
            <th width="120px">操作</th>
          </tr>
          <c:forEach items="${list}" var="map" varStatus="i">
 		    <tr <c:if test="${i.count % 2 eq '0'}">class="bgcol"</c:if>>
	  		  <td align="center"><input type="checkbox" name="xxids" value="${map.xxid}" /></td>
	  		  <td>
		   	  	<c:if test="${map.sfyfj eq '1'}"><img src="<%=path%>/resources/style/blue/images/sfyfj.png" title="存在附件" class="mr5"/></c:if>
	  		  	<c:if test="${map.sfyd eq '1'}"><img src="<%=path%>/resources/style/blue/images/open.png" title="已读" class="mr5"/></c:if>
		   	    <c:if test="${map.sfyd eq '0'}"><img src="<%=path%>/resources/style/blue/images/close.png" title="未读" class="mr5"/></c:if>
	  		  </td>
	  		  <td>
	  		  	<c:if test="${map.sffb eq '1' }">已发布</c:if>
	  		  	<c:if test="${map.sffb ne '1' }">未发布</c:if>
	  		  </td>
	  		  <td>
	  		  	<a onclick="javascript:ckByID('${map.xxid}');return false;" class="blue">${map.xxbt}</a>
	  		  </td>
	  		  <td>${map.fbrxm}</td>
			  <td>${map.fbrxymc}</td>
   			  <td>${map.fbsj}</td>
   			  <td>${empty map.mxdxxsz ? "【类型：全部人员】" : map.mxdxxsz}</td>
   			  <td>
   			  <c:if test="${map.sffb ne '1'}">
   			    <div class="cz_button cz3_3" title="发布" onclick="javascript:xxfb('${map.xxid}');"></div>
			  </c:if>
   			    <div class="cz_button cz1_1" title="修改" onclick="javascript:toXxfbxxwh('${map.xxid}');"></div>
   			    <div class="cz_button cz4_4" title="浏览记录" onclick="javascript:lljl('${map.xxid}');"></div>
              </td>
            </tr>
		  </c:forEach>
        </table>
      </form>
    </div>
    <div class="youtube">
      <c:if test="${not empty xxfbxxglPage }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="xxfbxxglPage" onlyOneShow="true" showListNo="true" action="xxfbxx/queryXxfbgl"/>
      </c:if>
    </div>
    <div class="clr"></div>
  </div>
</div>
 
<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"> </div>
</body>
</html>

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
	.Contentbox { width:100%; min-height:100%; height:auto}
	*html .Contentbox { height:100% }
</style>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/bootstrap.js"></script>
<script type="text/javascript">
	 
	function querylike(){
		document.queryform.action="<%=path%>/xxfbxx/queryXXfbck";
		document.queryform.submit();
	}
 function ckByID(xxid){
	 var winObj = window.open('<%=path%>/xxfbxx/queryXXbyid?xxid='+xxid+'&qxdm='+1+'&fqxdm='+1+'&random='+Math.random()*100000,"查看信息"+xxid ,'height=600, width=1024, top=100, left=300, titlebar=no,toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no,z-look=yes');
	   var loop = setInterval(function() {     
		    if(winObj.closed) {    
		        clearInterval(loop);    
		        document.queryform.action="<%=path%>/xxfbxx/queryXXfbck";
				document.queryform.submit();	   
		    }    
		}, 500); 
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
	 <div class="dropdown pull-right">
       <form id="queryform" name="queryform" method="post">
	   <div class="btn-group">
		  <button type="button" class="btn btn-search dropdown-toggle" data-toggle="dropdown">搜索 <span class="caret"></span></button>
		  <div class="dropdown-menu search-list pull-right" role="menu" style="width:260px;">
          <table border="0" width="96%"  cellpadding="0" cellspacing="0"  >
		      <tr>
		      	<th width="100">信息类别：</th>
	           	<td>
	           	  <select name="xxlb" id="qf_xxlb" >
	      			<option value="">--信息类别--</option>
	      		    <c:forEach items="${xxlblist}" var="map" varStatus="status">
	      			  <option value='${map.DM}' <c:if test="${xxfbckPage.xxlb eq map.DM}">selected</c:if>>
	   			         ${map.MC}
	   		          </option>
				    </c:forEach>
	    		  </select> 
	           	</td>
		       </tr>
		       <tr>
		        <th>发布部门：</th>
	           	<td>
	           	  <select name="fbbm" id="qf_fbbm"  >
	      			<option value="">--发布部门--</option>
	      		    <c:forEach items="${fbbmlist}" var="map" varStatus="status">
	      			  <option value='${map.YXDM}' <c:if test="${xxfbckPage.fbbm eq map.YXDM}">selected</c:if>>
	   			         ${map.YXMC}
	   		          </option>
				    </c:forEach>
	    		  </select> 
	           	</td>
		      </tr>
		       <tr>
		        <th>发布人：</th>
	           	<td><input type="text" name="fbr" id="qf_fbr" value="${xxfbckPage.fbr}" /></td>
		      </tr>
		       <tr>
		        <th>信息标题：</th>
	           	<td><input type="text"  name="xxbt" id="qf_xxbt" value="${xxfbckPage.xxbt}" /></td>
      		</tr>
      		<tr>
		        <th>发布起始时间：</th>
	           	<td>
	           	  <div  onclick="javascript:pfbksrq.click();return false;">
	               <input name="fbkssj" id="qf_ksrq" value="${xxfbckPage.fbkssj}" type="text"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',maxDate:'#F{$dp.$D(\'qf_jsrq\')}'})" class="Wdate"/>
	        	</div> 
	           	</td>
      		</tr>
      		<tr>
		        <th>发布结束时间：</th>
	           	<td>
	           	  <div onclick="javascript:pfbjsrq.click();return false;">
	            	<input name="fbjssj" id="qf_jsrq" value="${xxfbckPage.fbjssj}" type="text"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',minDate:'#F{$dp.$D(\'qf_ksrq\')}'})" class="Wdate"/> 
	        	</div> 
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
            <th width="70px">是否已读</th>
            <th>信息标题</th>
            <th>发布人</th>
            <th>发布部门</th>
            <th>发布时间</th>
            <th>操作</th>
          </tr>
          <c:forEach items="${list}" var="map" varStatus="status">
		  	<tr <c:if test="${status.count % 2 eq '0'}">class="bgcol"</c:if>  >
		   	  <td>
		   	  <c:if test="${map.sfyfj == 1}"><img src="<%=path%>/resources/style/blue/images/sfyfj.png"  title="存在附件"  class="mr5"/> </c:if>
		   	  <c:if test="${map.sfyd == 1}"><img src="<%=path%>/resources/style/blue/images/open.png"   title="已读" class="mr5"/></c:if>
		   	  <c:if test="${map.sfyd == 0}"><img src="<%=path%>/resources/style/blue/images/close.png"   title="未读" class="mr5"/></c:if>
		   	  </td>
		   	  <td ><a  href="javascript:void(0);"  class="blue" onclick="javascript:ckByID('${map.xxid}');return false;" >${map.xxbt}</a></td>
		   	  <td>${map.fbrxm}</td>
		   	  <td>${map.fbrxymc }</td>
		   	  <td>${map.fbsj}</td>
		   	  <td> 
		   	    <div class="cz_button cz2_1" onclick="javascript:ckByID('${map.xxid}');return false;" title="查看"></div>
		   	   </td>
 		    </tr>
		  </c:forEach>
        </table>
      </form>
  	</div>
    <div class="youtube">
  	  <c:if test="${not empty xxfbckPage }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="xxfbckPage" onlyOneShow="true" showListNo="true" action="xxfbxx/queryXXfbck"/>
      </c:if>
    </div>
    <div class="clr"></div>
  </div>
</div>

<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"> </div>
</body>
</html>


<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>北京赢科后台管理系统</title>
<jsp:include page="../../include/css-boostrap-include.jsp"></jsp:include>
<link href="<%=path%>/resources/js/treetable/stylesheets/master.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/js/treetable/stylesheets/jquery.treeTable.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blue/css/zTreeStyle.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	html, body { height:100%; }
	.Contentbox { width:100%; min-height:100%;height:auto }
	*html .Contentbox { height:100% }
</style>
<link href="<%=path%>/resources/style/blue/css/pageTag.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blue/css/zTreeStyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/treetable/javascripts/jquery.treeTable.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/treetable/treeTable-my.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/bootstrap.js"></script>
  <script type="text/javascript">
   
	
	function querylike(){
		document.queryform.action="<%=path%>/zxtrywh/queryzxtYh";
		document.queryform.submit();
	}
	 function resultjsgl(id,mc){
		opener.resultjsxx(id,mc);
	window.close();
}
</script>
</head>
<body>

<div class="Contentbox">
 <div class="mainbg"></div>
  <div class="pd10">    
   	  <div class="question" title="帮助" onclick="javascript:cha('${QXB.QXDM}');">
   	  <span class="glyphicon glyphicon-question-sign"></span>
   	  </div>    
      <div class="address">
       <ol class="breadcrumb  ">
          <li> <span class="glyphicon glyphicon-home pull-left"></span> </li>
		  <li>当前位置：</li>
		  <li><a href="#">子系统人员维护</a></li>
		  <li class="active">人员选择</li>
		</ol>          
      </div>
    <div class="clr"></div>
    <div class="butsea">
	 <div class="dropdown pull-right">
       <form id="queryform" name="queryform"  class="form-horizontal" role="form" method="post">
	   <div class="btn-group">
		  <button type="button" class="btn btn-search dropdown-toggle" data-toggle="dropdown">搜索 <span class="caret"></span></button>
		  <div class="dropdown-menu search-list pull-right" role="menu" style="width:260px;">
          <table border="0" width="96%"  cellpadding="0" cellspacing="0"  >
		      <tr>
		      	<th width="100">用户名称/代码：</th>
	           	<td><input type="text" name="pyhmc" id="pyhmc" value="${page.pyhmc}"  /></td>
		       </tr>
		       <tr>
		        <th>院系：</th>
	           	<td>
	           	  <select id="pyxdm" name="pyxdm"   >
	             	<option value=""  >-请选择-</option>
						<c:forEach items="${yxList}" var="obj" >
					<option value="${obj.YXDM}"  <c:if test="${page.pyxdm eq obj.YXDM}">selected="selected"</c:if>>${obj.YXMC}</option>
						</c:forEach>
		          </select> 
	           	</td>
		      </tr>
		       <tr>
		        <th>类型：</th>
	           	<td>
	           	  <select id="pyhlx" name="pyhlx"  >
                 	<option value=""  >-请选择-</option>
					<option value="1"  <c:if test="${page.pyhlx eq '1'}">selected="selected"</c:if>>教师</option>
					<option value="2"  <c:if test="${page.pyhlx eq '2'}">selected="selected"</c:if>>学生</option>
		          </select> 
	           	</td>
		      </tr>
      	</table> 
	    <div class="divider"></div>
        <div class="clr"></div>
        <div class="addlist_button pull-right mr10"> <a href="javascript:querylike();"><span>确定</span></a> </div>
	   </div>
	</div>
    </form>     
   </div>     
       </div> 
    </div>
    <div class="clr"></div>
    <div class="list"> 
      <form name="ff" method="post" id="ff" >
        <table  class="table table-bordered bot_line">
         <thead>
          <tr>
          <th width="20%">选择</th>
            <th>代码</th>
            <th>名称</th>
            <th>学院</th>
            <th>类型</th>
          </tr>
         </thead>
         <tbody>
         <c:forEach items="${List}" var="map1" varStatus="status">
            <tr ondblclick="javaScript:iframe('${map1.yhdm}');">
            <td  width="20%"><a href="javascript:void(0);" onclick='javascript:resultjsgl("${map1.yhdm}","${map1.xm}")';>选择</a></td>
	         	  <td>${map1.yhdm}</td>
	         	   <td>${map1.xm}</td>
	         	    <td>${map1.yxmc}</td>
	         	     <td>${map1.yhlxmc}</td>
	        </tr>
          </c:forEach>
            
          </tbody>           
        </table>
      </form>
    </div>
    
    
    
    <iframe id="iframename_gx" name="iframename_gx"  border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%; height: 300px;" frameborder="0" allowTransparency="true"></iframe>
    
     <div class="youtube"> 
		 <c:if test="${not empty page }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="page" onlyOneShow="true" showListNo="true" action="zxtrywh/queryzxtYh"/>
      </c:if>
    </div>
    <div class="clr"></div>
  </div>
</div>
<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<!-- 添加弹出框 -->
<div class="modal fade" id="addOrUpd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document"  >
    <div class="modal-content popborder">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"  >&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">添加</h4>
      </div>
      <form name="addOrUpdform" method="post" id="addOrUpdform">
      <input  type="hidden" id="zt" name="zt"/>
         <input  type="hidden" id="id_upd" name="id"/>
      <div class="modal-body">
         <table  class="addlist table-bordered" id="divTable" >
            
           <tr>
             <th>模版名称：</th>
             <td><input type="text" name="mbmc" id="mbmc"  class="form-control Pct92 pull-left" dataType="Limit" min="1" max="100" msg="必填(100字之内)" ><span class="red ml5">*</span></td>
           </tr>
             
         </table>
      </div>
      </form>
      <div class="modal-footer mt1">
        <button type="button" class="btn btn-info" onclick="javascript:addOrUpd();">保存</button>
        <button type="button" class="btn btn-info" data-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>
 

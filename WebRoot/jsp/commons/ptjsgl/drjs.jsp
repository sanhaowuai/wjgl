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
<jsp:include page="../../include/css-main-include.jsp"></jsp:include>
<link href="<%=path%>/resources/style/blue/css/pageTag.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/js/treetable/stylesheets/master.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/js/treetable/stylesheets/jquery.treeTable.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	html, body { height:100%; }
	.Contentbox { width:100%; min-height:100%;height:auto }
	*html .Contentbox { height:100% }
	 #zbtable tbody tr td {padding: 8px;overflow: hidden;}
</style>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>


<script type="text/javascript" src="<%=path%>/resources/js/treetable/javascripts/jquery.treeTable.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/treetable/treeTable-my.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/bootstrap.js"></script>
  <script type="text/javascript">
   $(document).ready(function(){
	   $("#ff").baigoCheckall();
	});
$.ajaxSetup({  
	    async : false  
	}); 	
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
	function xuanzhong(dm,fdm)
	{
		var id="ids"+dm+"_"+fdm;
		 var chk = document.getElementById(id);
		 if(chk.checked){
		 	$("input[id$=_"+dm+"]").attr("checked",true);
		 }else{
	    	 $("input[id$=_"+dm+"]").attr("checked",false);
		 }
		 if(fdm!=0)
		 {
			 if($("input[id$=_"+fdm+"]").length==$("input[id$=_"+fdm+"]:checked").length)
			 {
			 	$("input[id$=ids"+fdm+"_0").attr("checked",true);
			 }else{
			 	$("input[id$=ids"+fdm+"_0").attr("checked",false);
			 }
		 }
			 
	}
		//查询
	function queryLike(){
	    document.queryform.action = "<%=path%>/ptjsgl/queryYxByJysTree";
        document.queryform.submit();
	}
	
		//查询
	function addorupdJs(){
			if(isCheck('ids') == false){
					alert("请选择要导入的数据");
					return;
			    }
	     if(confirm("您确定要导入选中的数据吗？") == true){
	        document.ff.action = "<%=path%>/ptjsgl/addorupdJs";
	        $('#ff').ajaxSubmit(function(r){
	        if(r=='1')
	        {
	        		alert("导入成功");
	        		opener.resultCg();
					window.close();
	        }else{
	      		  alert("导入失败");
	        }
	        });
	    }
	}

	
</script>
</head>
<body>
<div class="Contentbox">
  <div class="mainbg"></div>
  <div class="pd10">
    <div class="clr"></div>
    <div class="butsea">
     <div class="addlist_button"> <a href="javascript:void(0);" onclick="javascript:addorupdJs()"><span>确定导入</span></a> </div>
	 <div class="dropdown pull-right">
       <form name="queryform" method="post" id="queryform" >
	   <div class="btn-group">
		  <button type="button" class="btn btn-search dropdown-toggle" data-toggle="dropdown">搜索 <span class="caret"></span></button>
		  <div class="dropdown-menu search-list pull-right" role="menu" style="width:260px;">
          <table border="0" width="96%"  cellpadding="0" cellspacing="0"  >
		      <tr>
		      	<th width="110">院系代码/名称：</th>
	           	<td> <input type="text" name="yxmcordm" id="qf_yxmcordm" value="${entity.yxmcordm}"  /></td>
		       </tr>
		       <tr>
		        <th>教研室代码/名称：</th>
	           	<td><input type="text" name="jysmcordm" id="qf_jysmcordm" value="${entity.jysmcordm}"  /></td>
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
        <table class="bot_line"  id="zbtable" width="100%">
         <thead>
          <tr>
            <th width="15%"><input type="checkbox" id="ids" title="全选/不选" style="padding:0;margin-left:2px;*margin-left:-2px;"/></th>
            <th width="240">代码
              <a class="open_but" href="javascript:void(0);" onclick="javascript:expandall();return false;"   title="展开"><i class="glyphicon glyphicon-circle-arrow-down"></i></a>
              <a class="close_but" href="javascript:void(0);" onclick="javascript:collapseall();return false;"   title="收起"><i class="glyphicon glyphicon-remove-circle"></i></a>
            </th>
            <th>名称</th>
          </tr>
         </thead>
         <tbody>
         <c:forEach items="${treeList}" var="map1" varStatus="status">
           	<tr id="node${map1.dm}"  class=" ${status.count%2==0 ? 'bgcol':'' }  <c:choose><c:when test='${map1.fdm==0}'>parent</c:when><c:otherwise>child</c:otherwise></c:choose> 
           	   <c:choose><c:when test='${map1.fdm==0}'></c:when><c:otherwise>child-of-node</c:otherwise></c:choose>${map1.fdm}"
               style="line-height:30px;">
                <td><c:if test="${map1.fdm!=0}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if><input name="ids" id="ids${map1.dm}_${map1.fdm}" type="checkbox" value="<c:if test="${map1.fdm==0}">Y</c:if>${map1.dm}" onclick="javaScript:xuanzhong('${map1.dm}','${map1.fdm}');" style="padding:0;margin-left:2px;*margin-left:-2px;"/></td>
		   	    <td><span class="<c:choose><c:when test='${map1.fdm==0}'>fa fa-comment-o</c:when><c:otherwise>fa fa-comments-o</c:otherwise></c:choose>">
	              &nbsp;</span>
	              <span class="zb-name">${map1.dm}</span>
	          </td>
             <td><c:if test="${map1.fdm==0}"><span  style="color: #8e8e0f">院</span></c:if>
             <c:if test="${map1.fdm!=0}"><span style="color: #fa6c24">教</span></c:if>
             ${map1.mc}</td>
	        </tr>
          </c:forEach>
            
          </tbody>           
        </table>
      </form>
    </div>


    <div class="clr"></div>
</div>
</div>
<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
</body>
</html>
 

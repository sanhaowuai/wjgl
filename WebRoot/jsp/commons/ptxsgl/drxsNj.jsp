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

<link href="<%=path%>/resources/style/bootstrap/css/content.css" rel="stylesheet" type="text/css" />
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
	    document.ff.action = "<%=path%>/ptxsgl/queryYxByZyTree";
        document.ff.submit();
	}
	
		//查询
	function addorupdJs(){
		if(isCheck('ids') == false){
			alert("请选择要导入的数据");
			return;
	    }
	     if(confirm("您确定要导入选中的数据吗？") == true){
	        document.ff.action = "<%=path%>/ptxsgl/addorupdXsNj";
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
    <ul class="nav nav-tabs tabweb mb10" role="tablist">
	  <li role="presentation"><a href="javaScript:void(0);" onclick="javaScript:queryLike();" role="tab" data-toggle="tab">院系专业</a></li>  
	  <li role="presentation" class="active"><a href="javaScript:void(0)" role="tab" data-toggle="tab">年级</a></li>
	</ul>
    <div class="butsea">
      <div class="addlist_button"> <a href="javascript:void(0);" onclick="javascript:addorupdJs()"><span>确定导入</span></a> </div>
    </div>
    <div class="clr"></div>
    <div class="list"> 
      <form name="ff" method="post" id="ff" >
        <table class="bot_line" width="100%" >
         <thead>
          <tr>
          <th width="15%"><input type="checkbox" id="ids" title="全选/不选" style="padding:0;margin-left:2px;*margin-left:-2px;"/></th>
         	 <th>年级代码</th>
            <th>年级名称</th>
          </tr>
         </thead>
         <tbody>
         <c:forEach items="${treeList}" var="map1" varStatus="status">
         <td><input name="ids" id="ids_${map1.dm}" type="checkbox" value="${map1.dm}" style="padding:0;margin-left:2px;*margin-left:-2px;"/></td>
        	 <td>${map1.dm}</td>
             <td>${map1.mc}</td>
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
 

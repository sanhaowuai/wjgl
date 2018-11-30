<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>选择用户</title>
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
<script type="text/javascript">
$(function(){  
    $.ajax({  
        async : false,  
        cache:false,  
        type: 'POST',  
        dataType : "json",  
        url: "<%=path%>/bmxxgl/queryYxTree",//请求的action路径  
        error: function () {//请求失败处理函数  
            alert('请求失败');  
        },  
        success:function(data){ //请求成功后处理函数。    
           
            treeNodes = data;   //把后台封装好的简单Json格式赋给treeNodes  
        }
    });  
    $.fn.zTree.init($("#treeDemo"), setting, treeNodes);
   // setCheck();
}); 


var zTree;  
var treeNodes;  
var code;
 
var setting = {
		check: {
			enable: true
		},
		data: {
			simpleData: {
				enable: true
			}
		}
	};

//查询
function queryLike(){
	 
    var yxmc = $("#yxmc").val();
	var url = "<%=path%>/bmxxgl/queryYxTree";
	$.post(url,{'yxmc':yxmc},function (result){
		 
		zNodes =result;
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
<%--		setCheck();--%>
<%--		BOX_show('test_con2');--%>
	},'json');
}
 
</script>

</head>

<body >
<div class="butsea" style="margin-top:0px;">
<form name="queryform" method="post" id="queryform" >
	<table border="0" align="right" cellpadding="0" cellspacing="0" >
	  <tr>
	    <td>名称：</td>
	    <td><input type="text" id="yxmc" name="yxmc"   /></td>
	    <td>
	      <div class="addlist_button2">
	      	<a href="javascript:void(0);" onclick="queryLike();return false;"><span>搜&nbsp;&nbsp;索</span></a> 
	      </div>
	    </td>
	  </tr>
	</table>
</form>
</div> 
<div>           
    <form name="ff" method="post" id="ff" style=" height:350px;"  >
      <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse;">
        <tr>
          <td>
             <div class="zTreeDemoBackground" style="height:300px; overflow-y:auto; overflow-x:hidden">
			    <ul id="treeDemo" class="ztree"></ul>
		     </div>
		 </td>
        </tr>
	  </table>
      </form>
</div>

</body>
</html>
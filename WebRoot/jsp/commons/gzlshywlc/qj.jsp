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
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/gzl_bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/gzl_bootstrap/css/dripicon.css"> 
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/gzl_bootstrap/css/font-awesome.min93e3.css" >
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/gzl_bootstrap/css/content.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/gzl_bootstrap/css/style.css">
<script src="<%=path%>/resources/style/gzl_bootstrap/js/jquery-1.11.1.min.js"></script>
<script src="<%=path%>/resources/style/gzl_bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/gzl_bootstrap/css/pageTag.css">

<!--[if lt IE 9]>
  <script src="<%=path%>/resources/style/gzl_bootstrap/js/html5shiv.min.js"></script>
  <script src="<%=path%>/resources/style/gzl_bootstrap/js/respond.min.js"></script>
<![endif]-->  
<style type="text/css">
  html, body { height:100%; }
  .Contentbox { width:100%; min-height:100%;height:auto }
  *html .Contentbox { height:100% }
</style>
  <script type="text/javascript" >
	function queryLike(){
		document.queryform.action="<%=path%>/qj/queryQj";
		document.queryform.submit();
	}
	//签收
	function sc(ids){
		var url="<%=path%>/qj/delQj";
		var param={'ids':ids};
		$.post(url,param,function(result){
			if(result.jg=='1'){
				alert('成功!');
			}else{
				alert(result.error);
			}
			queryLike();
		});
		
	}
	function tc(id,bt){
		 $('#id').val(id);
		 $('#bt').val(bt);
		
	}
	 
	function save(sftj){
		var url="<%=path%>/qj/addupdQj";
		var param={'sftj':sftj,'id':$('#id').val(),'bt':$('#bt').val()};
		$.post(url,param,function(result){
			if(result.jg=='1'){
				alert('成功!');
			}else{
				alert(result.error);
			}
			queryLike();
		});
		
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
		  <li><a href="#">${QXB.FQXMC }</a></li>
		  <li class="active">${QXB.QXMC }</li>
		</ol>          
      </div>
    <div class="clr"></div>
    <div class="butsea">
      <div class="pull-left Pct35">
            <button onclick="tc('','');" type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">添加</button>
            
      </div>
	 <div class="dropdown pull-right">
       <form name="queryform" method="post" id="queryform" >
	   <div class="btn-group">
		  <button type="button" class="btn btn-search dropdown-toggle" data-toggle="dropdown">搜索 <span class="caret"></span></button>
		  <div class="dropdown-menu search-list pull-right" role="menu" style="width:300px;">
           
	    <div class="divider"></div>
        <div class="clr"></div>
        <button type="button" class="btn btn-info pull-right mr10" onclick="javascript:queryLike();">确定</button>
	   </div>
	</div>
    </form>     
   </div>     

    </div>
    <div class="clr"></div>
    <div class="list"> 
        <table  class="table table-bordered bot_line">
         <thead>
          <tr>
			<th>标题</th> 
			<th>时间</th>
			<th>状态</th>
			<th>操作</th> 
          </tr>
         </thead>
         <tbody>
         <c:forEach items="${list}" var="a">
         	<tr>
	            <td>${a.BT }</td>
	            <td>${a.SJ }</td>
	            <td>${a.YSHJDZTXSMC }</td>
	            <td>
	            <c:if test="${a.SLSFYTJ!='1'}">
		            <div class="cz_button cz_bg1" data-toggle="modal" data-target="#myModal" onclick="tc('${a.ID }','${a.BT }')"><span class="glyphicon glyphicon-pencil"></span></div>
		            <div class="cz_button cz_bg3" onclick="sc('${a.ID }')"><span class="glyphicon glyphicon-remove"></span></div>
	            </c:if>
	            </td>
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

<!-- 添加弹出框 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document"  >
    <div class="modal-content popborder">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"  >&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">添加</h4>
      </div>
      <div class="modal-body">
         <table  class="addlist table-bordered"  >
           <tr>
             <th>标题：</th>
             <td><input type="text" id="bt"  class="form-control Pct92 pull-left">
             	<input type="hidden" id="id"  class="form-control Pct92 pull-left">
             </td>
           </tr>
                                   
         </table>
      </div>
      <div class="modal-footer mt1">
        <button type="button" onclick="save('0')" class="btn btn-info">保存</button>
        <button type="button" onclick="save('1')" class="btn btn-info">提交</button>
        <button type="button" class="btn btn-info" data-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>

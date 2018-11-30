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
		document.queryform.action="<%=path%>/gzlshywlc/queryShywlcjkPage";
		document.queryform.submit();
	}
	 //事务详情查看
	function swxqck(ywlcdm,ywlcslid,swxqcklj){
		 $('#ywlcdm').val(ywlcdm);
		$('#ywlcslid').val(ywlcslid);
		if(swxqcklj==null || swxqcklj==''){//事务详情查看链接，如果为空，默认公共页面
			document.queryform.action="<%=path%>/gzlshywlc/queryShywlcSwxq";
			document.queryform.submit();
		
		}else{//不为空，走配置
			document.queryform.action="<%=path%>/"+swxqcklj;
			document.queryform.submit();
		}
	
	}
	//事务详情查看
	function ywlcshck(ywlcdm,ywlcslid,ywlcshcklj){
		$('#ywlcdm').val(ywlcdm);
		$('#ywlcslid').val(ywlcslid);
		if(ywlcshcklj==null || ywlcshcklj==''){//业务流程审核查看链接，如果为空，默认公共页面
			document.queryform.action="<%=path%>/gzlshywlc/queryShywlcShck";
			document.queryform.submit();
		
		}else{//不为空，走配置
			document.queryform.action="<%=path%>/"+ywlcshcklj;
			document.queryform.submit();
		}
	
		
	
	
	}
	
	//终止工作流
	function zz(ywlcdm,ywlcslid){
		var url="<%=path%>/gzlshywlc/updShywlcZz";
		var param={'ywlcdm':ywlcdm,'ywlcslid':ywlcslid};
		$.post(url,param,function(result){
			if(result.jg=='1'){
				alert('终止成功!');
			}else{
				alert(result.error);
			}
			queryLike();
		});
		
	}
	//重置工作流
	function cz(ywlcdm,ywlcslid){
		var url="<%=path%>/gzlshywlc/updShywlcCz";
		var param={'ywlcdm':ywlcdm,'ywlcslid':ywlcslid};
		$.post(url,param,function(result){
			if(result.jg=='1'){
				alert('重置成功!');
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
  <div class="pd10">    
   	  <span class="glyphicon glyphicon-question-sign"></span>
   	  
      <div class="address">
       <ol class="breadcrumb  ">
          <li> <span class="glyphicon glyphicon-home pull-left"></span> </li>
		  <li>当前位置：</li>
		  <li><a href="#">${QXB.FQXMC}</a></li>
		  <li class="active">${QXB.QXMC}</li>
		</ol>          
      </div>
    <div class="clr"></div>
    <div class="butsea">
       
	 <div class="dropdown pull-right">
       <form name="queryform" method="post" id="queryform" >
       	<input type="hidden" name="ywlcdm" id="ywlcdm"/>
       	<input type="hidden" name="ywlcslid" id="ywlcslid"/>
       	
	   <div class="btn-group">
		  <button type="button" class="btn btn-search dropdown-toggle" data-toggle="dropdown">搜索 <span class="caret"></span></button>
		  <div class="dropdown-menu search-list pull-right" role="menu" style="width:300px;">
          <table border="0" width="96%"  cellpadding="0" cellspacing="0"  >
		      <tr>
		      	<th width="120">标题：</th>
	           	<td> <input type="text" name="pageBt" id="pageBt" value="${gzlShywlcjkPage.pageBt}"  /></td>
		       </tr>
		       <tr>
		        <th>业务名称：</th>
	           	<td><input type="text" name="pageYwlcgjz" id="pageYwlcgjz" value="${gzlShywlcjkPage.pageYwlcgjz}"  /></td>
		      </tr>
		      <tr>
		      	<th width="100">业务流程类别：</th>
	           	<td>
	           	  <select name="pageYwlclbdm" id="pageYwlclbdm"  >
	      		    <option value="">--请选择--</option>
	      		    <c:forEach items="${ywlclbList}" var="map" varStatus="status">
	       		      <option value='${map.DM}' <c:if test="${map.DM eq gzlShywlcjkPage.pageYwlclbdm}">selected</c:if>>
	    		         ${map.MC}
	    	          </option>
				    </c:forEach>
	    		  </select>
	           	</td>
		      </tr>
		      <tr>
		      	<th width="100">实例状态：</th>
	           	<td>
	           	  <select name="pageSfyzz" id="pageSfyzz"  >
	      		    <option value="">--请选择--</option>
	      		    <option value='0' <c:if test="${'0' eq gzlShywlcjkPage.pageSfyzz}">selected</c:if>>  运行中 </option>
	      		    <option value='1' <c:if test="${'1' eq gzlShywlcjkPage.pageSfyzz}">selected</c:if>>  终止 </option>
	      		    <option value='2' <c:if test="${'2' eq gzlShywlcjkPage.pageSfyzz}">selected</c:if>>  办结 </option>
	    		  </select>
	           	</td>
		      </tr>
      	</table> 
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
			<th>业务名称</th>  
			<th>发起人</th>
			<th>发起时间</th>
			<th>审核状态</th> 
			<th>实例状态</th>                
            <th>操作</th>
          </tr>
         </thead>
         <tbody>
         <c:forEach items="${list}" var="a">
         	<tr>
	            <td>${a.ywlcslbt }</td>
	            <td>${a.ywlcmc }</td>
	            <td>${a.ywlcslcjrxm }</td>
	            <td>${a.ywlcslcjsj }</td>
	            <td>${a.yshjdztxsmc }</td>
	            <td>
	            	<c:if test="${a.sfyzz=='0'}">运行中</c:if>
	            	<c:if test="${a.sfyzz=='1'}">终止</c:if>
	            	<c:if test="${a.sfyzz=='2'}">办结</c:if>
	            </td>
	            <td>
	            <div  onclick="javascript:swxqck('${a.ywlcdm}','${a.ywlcslid}','${a.swxqcklj}');"  class="cz_button cz_bg1"><span class="glyphicon glyphicon-search"></span></div>
	            <div  onclick="javascript:ywlcshck('${a.ywlcdm}','${a.ywlcslid}','${a.ywlcshcklj}');" class="cz_button cz_bg4"><span class="glyphicon glyphicon-list-alt"></span></div>
	             <c:if test="${a.sfyzz=='0'}">
	             	<div  onclick="javascript:zz('${a.ywlcdm}','${a.ywlcslid}');" class="cz_button cz_bg6"><span class="glyphicon glyphicon-edit"></span></div>
	             	<div  onclick="javascript:cz('${a.ywlcdm}','${a.ywlcslid}');" class="cz_button cz_bg3"><span class="glyphicon glyphicon-remove"></span></div>
	             
	             </c:if>
	            </td>
	          </tr>
         </c:forEach>
          
                      
          </tbody>           
        </table>
      </form>
    </div>
    <div class="youtube"> 
        <c:if test="${not empty gzlShywlcjkPage }">
            <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="gzlShywlcjkPage" onlyOneShow="true" showListNo="true" action="gzlshywlc/queryShywlcjkPage"/>
        </c:if>
    </div>
    <div class="clr"></div>
  </div>
</div>
  
 
</body>
</html>

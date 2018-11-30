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
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/bootstrap.js"></script>
<script type="text/javascript">

<%--$.ajaxSetup({--%>
<%--		async: false--%>
<%--	});--%>
	$(document).ready(function(){
	   $("#ff").baigoCheckall();
	});
	$().ready(function(){
		 //联动赋值
	   var yx = $("#yx").val();
	   var jys = $("#jys").val();
	   

	   
	   if(yx != null){
	   	var url2 = "<%=request.getContextPath()%>/pubJysByYx/queryJysByGlyx";
	       var param2 = {'yxdm':yx};
	       jQuery.post(url2,param2,function (ret){
	           if(null != ret){
	               $("#qf_ssjys").empty();   
	               $("#qf_ssjys").append("<option value=''>--请选择--</option>");
	               $.each(ret,function(key,value){
	                   if(jys == value.JYSDM){
	                       $("#qf_ssjys").append("<option value='"+value.JYSDM+"' selected>"+value.JYSMC+"</option>");
	                   }else{
	                       $("#qf_ssjys").append("<option value='"+value.JYSDM+"'>"+value.JYSMC+"</option>");
	                   }
	               })
	           }else{
	               return;
	           }
	       },'json'); 
	   }
	});
	
	
	function querylike(){
		document.queryform.action="<%=path%>/ptjsgl/queryPtxzJs";
		document.queryform.submit();
	}
	
	//级联班级
	function changeJys(yx,jys){
		var yxdm = $("#"+yx).val();
		if(yxdm != ""){
			var option="";
			var url = "<%=path%>/pubJysByYx/queryJysByGlyx"; 
			var param = {'yxdm':yxdm};
			$.post(url,param,function(result){
				$("#"+jys).empty();
				option+="<option value=''>--请选择--</option>";   
				$.each(result,function(key,value){  	
					if(value.JYSDM == $("#"+jys).val()){   
						         
						option+="<option value='"+value.JYSDM+"'selected>"+value.JYSMC+"</option>";
					}else{
						option+="<option value='"+value.JYSDM+"'>"+value.JYSMC+"</option>";
					}
				})
				$("#"+jys).append(option);
			},'json');
		}
	    $("#qf_ssjys").empty();   
	    $("#qf_ssjys").append("<option value=''>--请选择--</option>");
	}
	
	
	function changeXAndJys(obj){
		var xydm = $(obj).val();
		var url = "<%=path%>/pubXByYx/queryXByYx";
		$.post(url,{"yxdm":xydm},function(result){
			var option = "";
			$("#ff_ssxdm").empty();
			$("#ff_ssxdm").append("<option value=''>--请选择--</option>");   
		    $.each(result,function(key,value){
	        	option+="<option value='"+value.YXDM+"'>"+value.YXMC+"</option>";
	  	   	})
		    $("#ff_ssxdm").append(option);
		},'json')
		
		var url1 = "<%=path%>/jsgl/querySfglbm";
		$.post(url1,{'yxdm':xydm},function(result){
		    if(result == '1'){
		       	$("#glyx").val(xydm);
		    }
		},'json')
		
		var url2 = "<%=path%>/pubJysByYx/queryJysByY";
		$.post(url2,{"yxdm":xydm},function(result){
			var option2 = "";
			$("#ff_jysdm").empty();
			$("#ff_jysdm").append("<option value=''>--请选择--</option>");
			$.each(result,function(key,value){
				option2+="<option value='"+value.JYSDM+"'>"+value.JYSMC+"</option>";
			}) 
			$("#ff_jysdm").append(option2);
		},'json')
	}
	
	function changeJysByX(obj){
		var xydm = $(obj).val();
		var url1 = "<%=path%>/jsgl/querySfglbm";
		$.post(url1,{'yxdm':xydm},function(result){
		    if(result == '1'){
		       	$("#glyx").val(xydm);
		    }
		},'json')
		if(xydm==null || xydm==''){
			var xydm=$("#ff_ssydm").val();
			var url2 = "<%=path%>/pubJysByYx/queryJysByY";
		}else{
			var url2 = "<%=path%>/pubJysByYx/queryJysByX";
		}
		$.post(url2,{"yxdm":xydm},function(result){
			var option = "";
			$("#ff_jysdm").empty();
			$("#ff_jysdm").append("<option value=''>--请选择--</option>");
			$.each(result,function(key,value){
				option+="<option value='"+value.JYSDM+"'>"+value.JYSMC+"</option>";
			}) 
			$("#ff_jysdm").append(option);
		},'json')
	}
	
function addJs(){
	 if(isCheck('ids') == false){
	        alert("请选择要添加的教师");
	        return;
	    }
	    if(confirm("您确定要添加选中的教师吗？") == true){
	        document.ff.action = "<%=path%>/ptjsgl/addXzjs";
	        $('#ff').ajaxSubmit(function(r){
	        	if(r == 1)
		        	alert("添加成功！");
	        	else
		        	alert("添加失败！");
	        	window.parent.BOX_remove("sel");
	        	window.parent.querylike();
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
            <div class="addlist_button"> <a href="javascript:addJs();"><span>选&nbsp;&nbsp;择</span></a> </div>
          </td>
        </tr>
      </table>
	 <div class="dropdown pull-right">
       <form id="queryform" name="queryform" method="post">
	   <div class="btn-group">
		  <button type="button" class="btn btn-search dropdown-toggle" data-toggle="dropdown">搜索 <span class="caret"></span></button>
		  <div class="dropdown-menu search-list pull-right" role="menu" style="width:260px;">
          <table border="0" width="96%"  cellpadding="0" cellspacing="0"  >
		      <tr>
		      	<th width="90">院系：</th>
	           	<td>
	           	  <select name="pjsyxdm" id="qf_ssyx"  onchange="javascript:changeJys('qf_ssyx','qf_ssjys');return false;">
	      		    <option value="">--请选择--</option>
	      		    <c:forEach items="${yxlist}" var="map" varStatus="status">
	       		      <option value='${map.YXDM}' <c:if test="${map.YXDM eq ptxzjsPage.pjsyxdm}">selected</c:if>>
	    		         ${map.YXMC}
	    	          </option>
				    </c:forEach>
	    		  </select>
	           	</td>
		       </tr>
		       <tr>
		        <th>教研室：</th>
	           	<td>
	           	  <select name="pjsjysdm" id="qf_ssjys">
	       			<option value="" <c:if test="${empty ptxzjsPage.pjsjysdm}">selected</c:if>>--请选择--</option>
	    		  </select>
	           	</td>
		      </tr>
		       <tr>
		        <th>职工号/姓名：</th>
	           	<td><input type="text" name="pdmmc" id="qf_zgh" value="${ptxzjsPage.pdmmc}"  /></td>
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
    <div class="list01">
      <form name="ff" method="post" id="ff" >
		<input type="hidden" name="dmmc"  value="${ptxzjsPage.dmmc}" />
        <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
            <th><input type="checkbox" id="ids" title="全选/不选" style="padding:0;margin-left:2px;*margin-left:-2px;"/></th>
            <th>职工号</th>
            <th>姓名</th>
            <th>所属学院</th>
            <th>所属系</th>
            <th>所属教研室</th>
            <th>角色</th>
            <th>性别</th>
            <th>籍贯</th>
            <th>民族</th>
            <th>文化程度</th>
            <th>学历</th>
            <th>学位</th>
            <th>行政级别</th>
            <th>职称</th>
            <th>政治面貌</th>
          </tr>
		  <c:forEach items="${jslist}" var="map" varStatus="status">
        	<tr <c:if test="${status.count % 2 eq '0'}">class="bgcol"</c:if>>
         	  <td>
         	  <c:choose>
         	  	<c:when test="${map.zgh eq 'admin'}"><div class="lock"></div></c:when>
         	  	<c:otherwise> <input name="ids" type="checkbox" value="${map.zgh}" style="padding:0;margin-left:2px;*margin-left:-2px;"/></c:otherwise>
         	  </c:choose>
         	  
         	  </td>
         	  <td>${map.zgh}</td>
         	  <td>${map.jsxm}</td>
         	  <td>${map.yxmc}</td>
         	  <td>${map.xmc}</td>
         	  <td>${map.jysmc}</td>
         	  <td>${map.jsm}</td>
			  <td>${map.xbmc }</td>
			  <td>${map.jgmc }</td>
			  <td>${map.mzmc }</td>
			  <td>${map.whcdmc }</td>
			  <td>${map.xlmc }</td>
			  <td>${map.xwmc }</td>
			  <td>${map.xzjbmc }</td>
			  <td>${map.zcmc }</td>
			  <td>${map.zzmmmc }</td>
       		</tr>
          </c:forEach>
        </table>
      </form>
    </div>

    <div class="youtube01"> 
      <c:if test="${not empty ptxzjsPage }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="ptxzjsPage" onlyOneShow="true" showListNo="true" action="ptjsgl/queryPtxzJs"/>
      </c:if>
    </div>
 
<input type="hidden" name="dmmc"  value="${ptxzjsPage.pdmmc}" />
	<input type="hidden" name="zt" id="zt"/><!-- 1：添加  2：修改 -->
	<input type="hidden" id="yx" value="${ptxzjsPage.pjsyxdm}" />
	<input type="hidden" id="jys" value="${ptxzjsPage.pjsjysdm}" />
	<input type="hidden" name="glyx" id="glyx" />
<div id="setting"> </div>
</body>
</html>


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
	$().ready(function(){
		//初始化全选功能
		$("#ff").baigoCheckall();
		 //联动赋值
	    var xy = $("#xy").val();
	    var zy = $("#zy").val();
	    var bj = $("#bj").val();
	    
		if(null == xy || "" == xy){
		
			xy = $("#qf_ssydm").val();
		}
	    
	    if(xy != null){
	    	var url = "<%=path%>/pubZyByGlyx/queryZyByGlyx"; 
	    	var param = {'xydm':xy};
	    	//changeXDiv("qf_ssydm","qf_sszydm");
	    	$.post(url,param,function(result){
	    		$("#qf_sszydm").empty();
	    		$("#qf_sszydm").append("<option value=''>--请选择--</option>");   
	    		$.each(result,function(key,value){  
	        		  
	    			if(value.ZYDM == zy){             
	    				$("#qf_sszydm").append("<option value='"+value.ZYDM+"'selected>"+value.ZYMC+"</option>");
	    			}else{
	    				$("#qf_sszydm").append("<option value='"+value.ZYDM+"'>"+value.ZYMC+"</option>");
	    			}
	    		})
	    	},'json');
	    	
	    	
	    }
	    if(null == zy || "" == zy){
	    	
			zy = $("#qf_sszydm").val();
		}
	    if(zy != null){
	    	var url = "<%=path%>/pubBjByZy/queryBjByZy"; 
	    	var param = {'zydm':zy};
	    	$.post(url,param,function(result){
	    		$("#qf_xsbjdm").empty();
	    		$("#qf_xsbjdm").append("<option value=''>--请选择--</option>");   
	    		$.each(result,function(key,value){  	   	   		
	    			if(value.BJDM == bj){             
	    				$("#qf_xsbjdm").append("<option value='"+value.BJDM+"'selected>"+value.BJMC+"</option>");
	    			}else{
	    				$("#qf_xsbjdm").append("<option value='"+value.BJDM+"'>"+value.BJMC+"</option>");
	    			}
	    		})
	    	},'json');
	    }
	});
	
	function querylike(){
		document.queryform.action="<%=path%>/ptxsgl/queryPtxzXs";
		document.queryform.submit();
	}
	
	//级联班级
	function changeBj(zy,bj){
		var zydm = $("#"+zy).val();
		if(zydm != ""){
			var option="";
			var url = "<%=path%>/pubBjByZy/queryBjByZy"; 
			var param = {'zydm':zydm};
			$.post(url,param,function(result){
				$("#"+bj).empty();
				option+="<option value=''>--请选择--</option>";   
				$.each(result,function(key,value){  	   	   		
					if(value.ZYDM == $("#qf_sszydm").val()){             
						option+="<option value='"+value.BJDM+"'selected>"+value.BJMC+"</option>";
					}else{
						option+="<option value='"+value.BJDM+"'>"+value.BJMC+"</option>";
					}
				})
				$("#"+bj).append(option);
			},'json');
		}
		   $("#qf_xsbjdm").empty();   
		   $("#qf_xsbjdm").append("<option value=''>--请选择--</option>");
	}
	
	//根据院查询系
	function changeXDivNoBm(obj){
		var xydm = $(obj).val();
		var url = "<%=path%>/pubXByYx/queryXByYx";      //查系
		$.post(url,{"yxdm":xydm},function(result){
			var option = "";
			$("#ff_ssxdm").empty();
			$("#ff_ssxdm").append("<option value=''>--请选择--</option>");   
		    $.each(result,function(key,value){
	        	option+="<option value='"+value.YXDM+"'>"+value.YXMC+"</option>";
	  	   	})
		    $("#ff_ssxdm").append(option);
		},'json')
		
		var url1 = "<%=path%>/jsgl/querySfglbm";     //查询是否管理部门
		$.post(url1,{'yxdm':xydm},function(result){
		    if(result == '1'){
		       	$("#glyx").val(xydm);
		    }
		},'json')
		
		$("#ff_sszydm").empty();
		   $("#ff_sszydm").append("<option value=''>--请选择专业--</option>");
		   var url2 = "<%=path%>/pubZyByYx/queryZyByYx";
		   $.post(url2,{'xydm':xydm},function(result){
		        var option2 = "";
		        $.each(result,function(key,value){
	        	     option2+="<option value='"+value.ZYDM+"'>"+value.ZYMC+"</option>";
		        })
		        $("#ff_sszydm").append(option2);
		   },'json')

			$("#ff_ssbjdm").empty();   
			$("#ff_ssbjdm").append("<option value=''>--请选择--</option>");
	}
	
	function changeX(obj){
		var xydm = $(obj).val();
		var url1 = "<%=path%>/ptxsgl/querySfglbm";
		   $.post(url1,{'yxdm':xydm},function(result){
		       if(result == '1'){
		       	   $("#glyx").val(xydm);
		       }
		   },'json')
		   
		   if(xydm==null || xydm==''){
				var xydm=$("#ff_ssydm").val();
			    var url="<%=path%>/pubZyByYx/queryZyByYx";
			}else{
		        var url = "<%=path%>/pubZyByX/queryZyByX";
			}
		$("#ff_sszydm").empty();
		$("#ff_sszydm").append("<option value=''>--请选择专业--</option>");
		$.post(url,{'xydm':xydm},function(result){
		    var option = "";
		    $.each(result,function(key,value){
	        	 option+="<option value='"+value.ZYDM+"'>"+value.ZYMC+"</option>";
		    })
		    $("#ff_sszydm").append(option);
		},'json')
		$("#ff_ssbjdm").empty();   
		$("#ff_ssbjdm").append("<option value=''>--请选择--</option>");
	}
	
	function changeZy(obj){
		var zydm = $(obj).val();
		var option="";
		var url = "<%=path%>/pubBjByZy/queryBjByZy"; 
			var param = {'zydm':zydm};
			$.post(url,param,function(result){
			$("#ff_ssbjdm").empty();
			$("#ff_ssbjdm").append("<option value=''>--请选择--</option>");   
			$.each(result,function(key,value){  	   	   		
				if(value.ZYDM == $("#qf_sszydm").val()){             
					option+="<option value='"+value.BJDM+"'selected>"+value.BJMC+"</option>";
				}else{
					 option+="<option value='"+value.BJDM+"'>"+value.BJMC+"</option>";
				}
			})
				$("#ff_ssbjdm").append(option);
			},'json');
	}
	function addXs(){
		 if(isCheck('ids') == false){
		        alert("请选择要添加的学生");
		        return;
		    }
		    if(confirm("您确定要添加选中的学生吗？") == true){
		        document.ff.action = "<%=path%>/ptxsgl/addXzxs";
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
	
			
	//添加修改用联动 
	function changeXDiv(yx,zy){
	   var yxdm = $("#"+yx).val();
	   $("#"+zy).empty();
	   $("#"+zy).append("<option value=''>--请选择--</option>");  
	   if(yxdm!=""){
		   var option="";
		   var url = "<%=path%>/pubZyByGlyx/queryZyByGlyx" 
		   $.post(url,{'xydm':yxdm},function(result){
		       $.each(result,function(key,value){
		  	   	   if(value.ZYDM == $("#qf_sszydm").val()){             
		               option+="<option value='"+value.ZYDM+"'selected>"+value.ZYMC+"</option>";
		           }else{
		        	   option+="<option value='"+value.ZYDM+"'>"+value.ZYMC+"</option>";
		           }
	  	   	   })
		       $("#"+zy).append(option);
		   },'json');
	   }
	//   $("#qf_sszydm").empty();   
	//   $("#qf_sszydm").append("<option value=''>--请选择--</option>");
	   $("#qf_xsbjdm").empty();   
	   $("#qf_xsbjdm").append("<option value=''>--请选择--</option>");
	}
</script>
</head>

<body>
 
    <div class="butsea">
      <table  border="0" align="left" cellpadding="0" cellspacing="0"  >
        <tr>
          <td height="35px">
            <div class="addlist_button"> <a href="javascript:addXs();"><span>选&nbsp;&nbsp;择</span></a> </div>
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
	           	  <select name="xsyxdm" id="qf_ssydm"  onchange="javascript:changeXDiv('qf_ssydm','qf_sszydm');return false;">
	      			<option value="">--请选择--</option>
	      		    <c:forEach items="${yxlist}" var="map" varStatus="status">
	      			  <option value='${map.YXDM}' <c:if test="${ptxzXsPage.xsyxdm eq map.YXDM}">selected</c:if>>
	   			         ${map.YXMC}
	   		          </option>
				    </c:forEach>
	    		  </select> 
	           	</td>
		       </tr>
		       <tr>
		        <th>专业：</th>
	           	<td>
	           	  <select name="xszydm" id="qf_sszydm"  onchange="javascript:changeBj('qf_sszydm','qf_xsbjdm');return false;">
	     			<option value="" <c:if test="${empty ptxzXsPage.xszydm}">selected</c:if>>--请选择--</option>
	  			  </select> 
	           	</td>
		      </tr>
		       <tr>
		        <th>班级：</th>
	           	<td>
	           	  <select name="xsbjdm" id="qf_xsbjdm"  >
	       			<option value="" <c:if test="${empty ptxzXsPage.xsbjdm}">selected</c:if>>--请选择--</option>
	    		  </select>  
	           	</td>
		      </tr>
		       <tr>
		        <th>学号/姓名：</th>
	           	<td><input type="text" name="xsxh" id="qf_xh" value="${ptxzXsPage.xsxh}"  /></td>
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
            <th width="50px"><input type="checkbox" id="ids" title="全选/不选"/></th>
            <th width="100px">学号</th>
            <th width="100px">姓名</th>
            <th width="100px">角色</th>
            <th>管理院系</th>
            <th>专业</th>
            <th>班级</th>
            <th width="50px">性别</th>
            <th>籍贯</th>
            <th>民族</th>
            <th>政治面貌</th>
             <th>年级</th>
          </tr>
          <c:forEach items="${xslist}" var="map" varStatus="status">
		  	<tr <c:if test="${status.count % 2 eq '0'}">class="bgcol"</c:if>>
		   	  <td><input name="ids" type="checkbox" value="${map.xh}"/></td>
		   	  <td>${map.xh}</td>
		   	  <td>${map.xm}</td>
		   	  <td>${map.jsm }</td>
		   	  <td>${map.yxmc}</td>
		   	  <td>${map.zymc}</td>
		   	  <td>${map.bjmc}</td>
			  <td>${map.xbmc }</td>
			  <td>${map.jgmc }</td>
			  <td>${map.mzmc }</td>
			  <td>${map.zzmmmc }</td>
			   <td>${map.nj }</td>
 		    </tr>
		  </c:forEach>
        </table>
      </form>
  	</div>
    <div class="youtube01">
  	  <c:if test="${not empty ptxzXsPage }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="ptxzXsPage" onlyOneShow="true" showListNo="true" action="ptxsgl/queryPtxzXs"/>
      </c:if>
    </div>
 
  <input type="hidden" id="xy" value="${ptxzXsPage.xsyxdm}"/>
	<input type="hidden" id="zy" value="${ptxzXsPage.xszydm}"/>
	<input type="hidden" id="bj" value="${ptxzXsPage.xsbjdm}"/>
<div id="setting"> </div>
</body>
</html>


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
		document.queryform.action="<%=path%>/ptxsgl/queryXsgl";
		document.queryform.submit();
	}
	
	//添加修改用联动 
	function changeXDiv(yx,zy){
	   var yxdm = $("#"+yx).val();
	   if(yxdm!=""){
		   var option="";
		   var url = "<%=path%>/pubZyByGlyx/queryZyByGlyx" 
		   $.post(url,{'xydm':yxdm},function(result){
			   $("#"+zy).empty();
			   $("#"+zy).append("<option value=''>--请选择--</option>");   
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
	   $("#qf_sszydm").empty();   
	   $("#qf_sszydm").append("<option value=''>--请选择--</option>");
	   $("#qf_xsbjdm").empty();   
	   $("#qf_xsbjdm").append("<option value=''>--请选择--</option>");
	}
	
	//添加弹出层
	function addDiv(){
		$("#zt").val("1");
		Validator.ClearForm('addOrUpdfrom');	
		$("#divtab").find("input[type='text']").val('');
		$("#divtab").find("select").val('');
		$("#xh").attr("readonly",false);	
		BOX_show('addOrUpd');
	}
	
	//修改弹出层
	function updDiv(xh){
		$("#zt").val("2");
		Validator.ClearForm('addOrUpdfrom');
		var url="<%=path%>/ptxsgl/queryXsByXh";
	    var param={'xh':xh};
	    $.post(url,param,function(result){
	        $("#ff_ssydm").val(null == result['xsxxbEntity']['xydm'] ? "" : result['xsxxbEntity']['xydm']);
	        $("#glyx").val(result['xsxxbEntity']['glyx']);
	        /////////////////////////////////////系begin
	        var url3 = "<%=path%>/pubXByYx/queryXByYx";  
	        //查系
			$.post(url3,{"yxdm":result['xsxxbEntity']['xydm']},function(result2){
				var option = "";
				$("#ff_ssxdm").empty();
				$("#ff_ssxdm").append("<option value=''>--请选择--</option>");   
		    	$.each(result2,function(key,value){
		    		if(result['xsxxbEntity']['xdm'] == value.YXDM){
		    			option+="<option value='"+value.YXDM+"' selected>"+value.YXMC+"</option>";
	        		}else{
	        			option+="<option value='"+value.YXDM+"'>"+value.YXMC+"</option>";
	        		}
	  	   		})
		    	$("#ff_ssxdm").append(option);
			},'json')
	        /////////////////////////////////////系end
	        /////////////////////////////////////专业begin
	        var url2="";
	        var param2="";
	        if(null == result['xsxxbEntity']['xdm']){
	        	url2 = "<%=path%>/pubZyByYx/queryZyByYx";
	        	param2 = {'xydm':result['xsxxbEntity']['xydm']};
	        }else{
	        	url2 = "<%=path%>/pubZyByX/queryZyByX";
	        	param2 = {'xydm':result['xsxxbEntity']['xdm']};
	        }
	        
	        jQuery.post(url2,param2,function (ret){
	             $("#ff_sszydm").empty(); 
	             $("#ff_sszydm").append("<option value=''>--请选择--</option>");
	             $.each(ret,function(key,value){
	                 if(result['xsxxbEntity']['zydm'] == value.ZYDM){
	                  	 $("#ff_sszydm").append("<option value='"+value.ZYDM+"' selected>"+value.ZYMC+"</option>");
	                 }else{
	                     $("#ff_sszydm").append("<option value='"+value.ZYDM+"'>"+value.ZYMC+"</option>");
	                  }
	             })
	        },'json'); 
	        
	       
	    	/////////////////////////////////////专业end
	    	/////////////////////////////////////班级begin
	    	var url1 = "<%=path%>/pubBjByZy/queryBjByZy"; 
	    	var param1 = {'zydm':result['xsxxbEntity']['zydm']};
	    	jQuery.post(url1,param1,function(ret1){
	    		$("#ff_ssbjdm").empty();
	    		$("#ff_ssbjdm").append("<option value=''>--请选择--</option>");   
	    		$.each(ret1,function(key,value){  	   	   		
	    			if(result['xsxxbEntity']['bjdm'] == value.BJDM){             
	    				$("#ff_ssbjdm").append("<option value='"+value.BJDM+"' selected>"+value.BJMC+"</option>");
	    			}else{
	    				$("#ff_ssbjdm").append("<option value='"+value.BJDM+"'>"+value.BJMC+"</option>");
	    			}
	    		})
	    	},'json');
			/////////////////////////////////////班级end
	    	$("#xh").val(result['xsxxbEntity']['xh']);
	    	$("#xm").val(result['xsxxbEntity']['xm']);
	        $("#ff_xb").val(null == result['xsxxbEntity']['xb'] ? "" : result['xsxxbEntity']['xb']);
	        $("#ff_jg").val(null == result['xsxxbEntity']['jgdm'] ? "" : result['xsxxbEntity']['jgdm']);
	        $("#ff_mz").val(null == result['xsxxbEntity']['mzdm'] ? "" : result['xsxxbEntity']['mzdm']);
	        $("#ff_zzmm").val(null == result['xsxxbEntity']['zzmm'] ? "" : result['xsxxbEntity']['zzmm']);
	          
	    },'json')
	    $("#xh").attr("readonly",true);
		BOX_show('addOrUpd');
	}
	
	//删除学生
	function delXs(){
	    if(isCheck('ids') == false){
	        alert("请选择要删除的学生");
	        return;
	    }
	    if(confirm("您确定要删除选中的学生吗？") == true){
	        document.ff.action = "<%=path%>/ptxsgl/delXs";
	        $('#ff').ajaxSubmit(function(r){
	        	document.queryform.action = "<%=path%>/ptxsgl/queryXsgl";
	        	document.queryform.submit();
	        });
	        
	    }
	}
	//添加或修改
	function addOrUpd(){	
		if(Validator.Validate(document.getElementById('addOrUpdfrom'),3)){
			var xh = $("#xh").val();
			var zt = $("#zt").val();
			/**
			var zppath = $("#zppath").val();
			var zp = zppath.substring(zppath.indexOf('.')+1,zppath.length).toLowerCase();
			if( zp != "" && (zp != "jpg" && zp != "jpeg" && zp != "png" && zp != "gif" )){
				alert("请选择jpg,jpeg,png,gif格式的图片");
				return ;
			}		
			**/
			var url="<%=path%>/ptxsgl/queryByXhCount";
		    var param={'xh':xh,'zt':zt};
	//	    var xb = $("input[name=xbs]:checked").attr("id");
	//	    $("#xb").val(xb);
		    $.post(url,param,function(result){
		        if(result){
		        	document.addOrUpdfrom.action = '<%=path%>/ptxsgl/addOrUpdXs';	    
		        	$('#addOrUpdfrom').ajaxSubmit(function(r){
				        	if(r == 1){
								alert("保存成功!");
								document.queryform.action = "<%=path%>/ptxsgl/queryXsgl";
				             	document.queryform.submit();
				        	}else{
								alert("保存失败！");
								document.queryform.action = "<%=path%>/ptxsgl/queryXsgl";
				             	document.queryform.submit();
					        }		             	
		             });
			    }else{
				    alert("此学号已在用户中存在，请检查后再次添加！");
				    return;
				}
		    },'json')
		}
	}
	function importExcel(){
		if(Validator.Validate(document.getElementById('FormUpload'),3) ){
		   document.FormUpload.submit();
		}
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
	//选择学生
	function selXs(){
	    $("#iframename").attr("src", "<%=path%>/ptxsgl/queryPtxzXs");
	    BOX_show("sel");
	}
	//修改密码弹出Div
	function updMmDiv(yhdm){
		$("#divFrom_yhdm").val(yhdm);
		$("#mm").val("");
		$("#mm2").val("");
		BOX_show('updMm');
		
	}
	//修改密码
	function updMm(){
		if(Validator.Validate(document.getElementById('divFrom'),3)){
		var mm2 = $("#mm2").val();
		var mm3 = $("#mm").val();
		if(null == mm2 || "" == mm2 || null == mm3 || "" == mm3){
			alert("新密码必填！");
			return;
		}
		if(mm2.length <6){
			alert("密码长度为6-25个字符！");
			return;
		}
		if(mm3 != mm2){
			alert("新密码两次输入不一致！");
			return;
		}
		var v = /^[a-z0-9A-Z_]+$/i;
		if(!v.test(mm3)){
			alert("密码只能由数字，字母，下划线组成！");
			return;
		}

		if(confirm("您确定要执行操作么？") == true){
        	$("#divFrom").ajaxSubmit({
        	     type: "post",
        	     url: "<%=path%>/updMmByYhdm",
        	     dataType: "json",
        	     success: function(result){
        	           //返回提示信息      
        	           if(result == 1){
        	        	   alert("操作成功");
        	        	   BOX_remove('updMm');
        	        	 
        	           }else if(result == 0){
        	        	   alert("操作失败");
        	           }
        	     }
        	 });         
		}
		} 
	}
	
	
	
	
		//导出模板
	function exp_ykcjmb(){
	    document.queryform.action = "<%=path%>/ptxsgl/expYkcjmb";
        document.queryform.submit();
	}
	function clier()
	{
		Validator.ClearForm('impExlform');
		$("#excel").val("");
			Validator.ClearForm('impExlform');
			BOX_show('impExl');
	}
	
	function impPtxsxx(){
		if(Validator.Validate(document.getElementById('impExlform'),3)){
		 document.impExlform.action = "<%=path%>/ptxsgl/impPtxsxx";
	        $('#impExlform').ajaxSubmit(function(r){
	        if(r=='1')
	        {
		        alert("导入成功");
		        document.queryform.action = "<%=path%>/ptxsgl/queryXsgl";
	        	document.queryform.submit();
	        }else{
	          	alert("导失败");
	        }
	        });
		
	  //  document.impExlform.action = "<%=path%>/ptxsgl/impPtxsxx";
       // document.impExlform.submit();
  	}
	}
	
	
	function resultCg()
{
	document.queryform.action="<%=path%>/ptxsgl/queryXsgl";
	document.queryform.submit();
}

function iframe_divTcLj(){
	var openUrl = '<%=path%>/ptxsgl/queryYxByZyTree';//弹出窗口的url
	var iHeight=550; //弹出窗口的高度;
	var iWidth=900; //弹出窗口的宽度;
	var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
	var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	window.open(openUrl,"选择按钮",'height='+iHeight+', width='+iWidth+', top='+iTop+', left='+iLeft+', titlebar=no,toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no,z-look=yes');
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
          <td height="35px"><!-- <div class="addlist_button"> <a href="javascript:BOX_show('dr');"><span>导&nbsp;&nbsp;入</span></a> </div> -->
            <div class="addlist_button"> <a href="javascript:void(0);" onclick="javascript:clier()"><span>导入平台学生</span></a> </div>
            <div class="addlist_button ml15"> <a href="javascript:addDiv();"><span>添&nbsp;&nbsp;加</span></a> </div>
            <div class="addlist_button  ml15"> <a href="javascript:delXs();"><span>删&nbsp;&nbsp;除</span></a> </div>
            <div class="addlist_button  ml15"> <a href="javascript:selXs();"><span>选&nbsp;&nbsp;择</span></a> </div>
            <div class="addlist_button  ml15"> <a href="javascript:void(0);" onclick="javascript:iframe_divTcLj()"><span>平台学生导入学生表</span></a> </div>
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
		      	<th width="100">年级：</th>
	           	<td>
	           	  <select name="xsnjdm" id="qf_ssnjdm">
	      			<option value="">--请选择--</option>
	      		    <c:forEach items="${njList}" var="map" varStatus="status">
			  		<option value="${map.dm}" <c:if test="${xsglPage.xsnjdm eq map.dm}">selected</c:if>>${map.mc}</option>
			  	  	</c:forEach>
	    		  </select>
	           	</td>
		       </tr>
		       <tr>
		        <th>院系：</th>
	           	<td>
	           	  <select name="xsyxdm" id="qf_ssydm" onchange="javascript:changeXDiv('qf_ssydm','qf_sszydm');return false;">
	      			<option value="">--请选择--</option>
	      		    <c:forEach items="${yxlist}" var="map" varStatus="status">
	      			  <option value='${map.YXDM}' <c:if test="${xsglPage.xsyxdm eq map.YXDM}">selected</c:if>>
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
	     			<option value="" <c:if test="${empty xsglPage.xszydm}">selected</c:if>>--请选择--</option>
	  			  </select>
	           	</td>
		      </tr>
		       <tr>
		        <th>班级：</th>
	           	<td>
	           	  <select name="xsbjdm" id="qf_xsbjdm">
	       			<option value="" <c:if test="${empty xsglPage.xsbjdm}">selected</c:if>>--请选择--</option>
	    		  </select>
	           	</td>
      		</tr>
      		<tr>
		        <th>学号/姓名：</th>
	           	<td><input type="text" name="xsxh" id="qf_xh" value="${xsglPage.xsxh}" /></td>
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
<!--	<input type="hidden" name="pageCount"  value="${xsglPage.pageCount eq '0' ? '1' : xsglPage.pageCount}" />-->
<!--	<input type="hidden" name="pageNo"  value="${xsglPage.pageNo eq '0' ? '1' : xsglPage.pageNo}" />-->
<!--	<input type="hidden" name="pageSize"  value="${xsglPage.pageSize eq '0' ? '1' : xsglPage.pageSize}" />-->
<!--		<input type="hidden" name="xsxh"  value="${xsglPage.xsxh}" />-->
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
            <th>操作</th>
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
			   <td>${map.njmc }</td>
			  <td>
				<div class="cz_button cz3_6" title="修改密码" onclick="javascript:updMmDiv('${map.xh}');"></div>      
              </td>
 		    </tr>
		  </c:forEach>
        </table>
      </form>
  	</div>
    <div class="youtube">
  	  <c:if test="${not empty xsglPage }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="xsglPage" onlyOneShow="true" showListNo="true" action="ptxsgl/queryXsgl"/>
      </c:if>
    </div>
    <div class="clr"></div>
  </div>
</div>

<form name="FormUpload" id="FormUpload"  method="post" action="<%=path%>/jsp/commons/xls_up.jsp"  enctype="multipart/form-data">
  <div id="dr" style=" display:none; width: 400px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
    <div class="popup">
      <div class="Floatleft Pct100 mb10">
        <div class="popup_left">批量导入</div>
        <a href="#" class="btn_close" onclick="javascript:BOX_remove('dr');"></a> 
      </div>
      <div class="clr"></div>
      <table width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
        <tr>
          <th width="100">模板下载：</th>
          <td align="left"><a href="javascript:void(0);" onclick="javascript:location.href='<%=path%>/jsp/commons/download.jsp?strPath=/upload/student.xls&disFile=学生批量导入模版.xls';return false;" title="点击下载">学生批量导入模版.xls</a></td>
        </tr>
        <tr>
          <th valign="top">文本选择：</th>
          <td align="left"><p>
            <input type="file" name="fileField" id="fileField" /></p>
            <p>1、请按模板要求填写。<br />
               2、Excel文件中不能存在公式。<br />
               3、每次最多导入999行，文件大小限制在1M以内。<br />
               4、导入速度和每次导入的数据量有关，请耐心等待。
            </p>
          </td>
        </tr>
        <tr>
          <td colspan="2" align="center"><div class="addlist_button1" style="float:right"> <a href="#"  title="取消" onclick="javascript:BOX_remove('dr');" ><span>取消</span></a> </div>
          <div class="addlist_button1 mr15" style="float:right" > <a href="javascript:importExcel();" title="保存" ><span>保存</span></a> </div></td>
        </tr>
      </table>
      <div class="clr"></div>
    </div>
  </div>
</form>

<div id="addOrUpd" style="display:none; width: 700px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form id="addOrUpdfrom" name="addOrUpdfrom" method="post">
	<input type="hidden" name="pageCount"  value="${xsglPage.pageCount eq '0' ? '1' : xsglPage.pageCount}" />
	<input type="hidden" name="pageNo"  value="${xsglPage.pageNo eq '0' ? '1' : xsglPage.pageNo}" />
	<input type="hidden" name="pageSize"  value="${xsglPage.pageSize eq '0' ? '1' : xsglPage.pageSize}" />
	<input type="hidden" name="xsxh"  value="${xsglPage.xsxh}" />
	<input type="hidden" name="zt" id="zt"/><!-- 1：添加  2：修改 -->
	<input type="hidden" id="xy" value="${xsglPage.xsyxdm}"/>
	<input type="hidden" id="zy" value="${xsglPage.xszydm}"/>
	<input type="hidden" id="bj" value="${xsglPage.xsbjdm}"/>
	<input type="hidden" id="glyx" name="glyx" />
    <div class="popup">
      <div class="Floatleft Pct100 mb10">
        <div class="popup_left">添加/修改</div>
        <a href="#" class="btn_close" onclick="javascript:BOX_remove('addOrUpd');"></a> 
      </div>
      <div class="clr"></div>
      <div style="max-height:400px;overflow:auto;">
      <table id="divtab" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
        <tr>
          <th>学号：</th>
          <td align="left"><input type="text" name="xh" id="xh" dataType="Number" min="1" max="20" msg="必填数字(20个字之内)"/>
            <span class="red">*</span></td>
          <th>姓名：</th>
          <td align="left"><input type="text" name="xm" id="xm" dataType="Limit" min="1" max="20" msg="必填(20个字之内)" />
            <span class="red">*</span>
          </td>
        </tr> 
        <tr>
          <th>密码：</th>
          <td align="left">初始密码123456</td>

<!--          <th>照片：</th>-->
<!--          <td align="left"><input name="filed" type="file" id="zppath" /></td>-->
 <th> 政治面貌：</th>
          <td align="left">
		    <select name="zzmm" id="ff_zzmm">
		    <option value="">--请选择--</option>
		  	  <c:forEach items="${zzmmList}" var="map" varStatus="status">
		  		<option value="${map.dm}">${map.mc}</option>
		  	  </c:forEach>
		    </select>
          </td>

        </tr> 
        <tr>
          <th>所属院：</th>
          <td align="left"><select name="xydm" id="ff_ssydm" onchange="javascript:changeXDivNoBm(this);return false;" dataType="Limit" min="1" max="20" msg="必选">
            <option value="">--请选择--</option>
            <c:forEach items="${yxlist2}" var="map" varStatus="status">
        	  <option value='${map.YXDM}'>
     	        ${map.YXMC}
     	      </option>
  		    </c:forEach></select>
            <span class="red">*</span>
          </td>
          <th>所属系：</th>
          <td align="left">
            <select name="xdm" id="ff_ssxdm" onchange="javascript:changeX(this);return false;">
          	  <option value="">--请选择--</option>
            </select>
          </td>   
        </tr> 
        <tr>
          <th>所属专业：</th>
          <td align="left">
            <select name="zydm" id="ff_sszydm" onchange="javascript:changeZy(this);return false;">
          	  <option value="">--请选择--</option>
            </select>
          </td>
          <th>所属班级：</th>
          <td align="left">
            <select name="bjdm" id="ff_ssbjdm" >
           	  <option value="">--请选择--</option>
            </select>
          </td>
        </tr> 
        <tr>
          <th> 性别：</th>
          <td align="left">
		    <select name="xb" id="ff_xb">
		  	  <option value="">--请选择--</option>
		  	  <c:forEach items="${xbList}" var="map" varStatus="status">
		  		<option value="${map.dm}">${map.mc}</option>
		  	  </c:forEach>
		    </select>
		  </td>
          <th> 籍贯：</th>
          <td align="left">
		    <select name="jg" id="ff_jg">
		      <option value="">--请选择--</option>
		  	  <c:forEach items="${jgList}" var="map" varStatus="status">
		  		<option value="${map.dm}">${map.mc}</option>
		  	  </c:forEach>
            </select>
          </td>
        </tr> 
        <tr>
          <th> 民族：</th>
          <td align="left">
		    <select name="mz" id="ff_mz">
		      <option value="" >--请选择--</option>
		  	  <c:forEach items="${mzList}" var="map" varStatus="status">
		  		<option value="${map.dm}">${map.mc}</option>
		  	  </c:forEach>
		    </select>
		  </td>
		   <th> 年级：</th>
          <td align="left">
		    <select name="nj" id="ff_nj">
		      <option value="" >--请选择--</option>
		  	  <c:forEach items="${njList}" var="map" varStatus="status">
		  		<option value="${map.dm}">${map.mc}</option>
		  	  </c:forEach>
		    </select>
		  </td>
         
        </tr> 
        <tr>
          <td colspan="4" align="center"><div class="addlist_button1" style="float:right"><a href="#"  title="取消" onclick="javascript:BOX_remove('addOrUpd');" ><span>取消</span></a> </div>
          <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:addOrUpd();" title="保存" ><span>保存</span></a> </div></td>
        </tr>
      </table>
    </div>
    <div class="clr"></div>
  </div>
</form>
</div>

<div id="sel" style=" display:none; width: 800px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <div class="popup">
    <div class="Floatleft Pct100 mb10">
      <div class="popup_left">选择学生</div>
      <a href="#" class="btn_close" onclick="javascript:BOX_remove('sel');"></a> 
    </div>
    <div class="clr"></div>
       <iframe id="iframename" name="iframename" src="" border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%; height: 400px;" frameborder="0" allowTransparency="true"></iframe>
  </div>
</div>

<!-- 修改密码 -->
<div id="updMm" style="display:none; width: 400px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
<form name="divFrom" id="divFrom" method="post">
	  <input name="yhdm" id="divFrom_yhdm" type="hidden"/>
    <div class="popup"> 
      <div class="Floatleft Pct100 mb10">
        <div class="popup_left">修改密码</div>
        <a href="javascript:void(0);" class="btn_close" onclick="javascript:BOX_remove('updMm');"></a>
      </div>  
      <div class="clr"></div>      
        <table id="divtab" width="100%" cellpadding="0" cellspacing="0" class="addlist" style="border-collapse:collapse">
            <tr>
                <th>新密码：</th>
                <td align="left"><input type="password" name="mm" id="mm" dataType="Limit" msg="密码必须在6~25位" min="6" max="25"/></td>
            </tr>
            <tr> 
                <th>再次输入新密码：</th>
                <td align="left"><input type="password" name="mm2" id="mm2" dataType="Limit" msg="密码必须在6~25位" min="6" max="25"/></td>
            </tr>            
            <tr>
                <td colspan="2">
 		            <div class="addlist_button1" style="float:right"><a href="javascript:BOX_remove('updMm');"><span>取消</span></a> </div>
		            <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:updMm();" title="保存" ><span>保存</span></a> </div>                      
                </td>
            </tr>
        </table>
        <div class="clr"></div>
    </div>
</form>
</div>
<!-- 导入 -->
<form name="impExlform" id="impExlform"  method="post" action="<%=path%>/jsp/commons/jls_up.jsp"  enctype="multipart/form-data">
  <div id="impExl" style=" display:none; width: 400px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
    <div class="popup">
      <div class="Floatleft Pct100 mb10">
        <div class="popup_left">导入</div>
        <a href="#" class="btn_close" onclick="javascript:BOX_remove('impExl');"></a> 
      </div>
      <div class="clr"></div>
      <table width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
       <tr>
             <th style="width: 120px;">友情提示：</th>
             <td> <p>正在导入的时候,不可关闭当前页面。当弹出exl表格时,请手动刷新页面!!!</p></td>
           </tr>
           <tr>
             <th>模版：</th>
             <td><button class="btn btn-search" type="button"  onclick="javaScript:exp_ykcjmb();">点击下载</button></td>
           </tr>
           <tr>
             <th>文件路径：</th>
             <td><input id="excel" name="excel" type="file" size="30" data-options="required:true"   dataType="Limit" min="1" max="100" msg="请选择文件" accept=".xlsx,.xls,.txt"/></td>
           </tr>
             <tr>
                <td colspan="2">
 		            <div class="addlist_button1" style="float:right"><a href="javascript:BOX_remove('impExl');"><span>取消</span></a> </div>
		            <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:impPtxsxx();" title="保存" ><span>保存</span></a> </div>           
                </td>
            </tr>
      </table>
      <div class="clr"></div>
    </div>
  </div>
</form>
<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"> </div>
</body>
</html>


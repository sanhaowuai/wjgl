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
<script type="text/XAjavascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/bootstrap.js"></script>
<script type="text/javascript">
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
		document.queryform.action="<%=path%>/ptjsgl/queryJsgl";
		document.queryform.submit();
	}
	
	//添加弹出层
	function addDiv(){
		$("#zt").val("1");	
		Validator.ClearForm('addOrUpdfrom');
		$("#divtab").find("input[type='text']").val('');
		$("#divtab").find("select").val('');
		$("#zgh").attr("readonly",false);
		BOX_show('addOrUpd');
		
	}
	
	//删除学生
	function delJs(){
	    if(isCheck('ids') == false){
	        alert("请选择要删除的教师");
	        return;
	    }
	    if(confirm("您确定要删除选中的教师吗？") == true){
	        document.ff.action = "<%=path%>/ptjsgl/delJs";
	        $('#ff').ajaxSubmit(function(r){
	        	document.queryform.action="<%=path%>/ptjsgl/queryJsgl";
	        	document.queryform.submit();
	        });
	    }
	}
	//选择学生
	function selJs(){
	    $("#iframename").attr("src", "<%=path%>/ptjsgl/queryPtxzJs");
	    BOX_show("sel");
	}
	//添加或修改
	function addOrUpd(){	
		if(Validator.Validate(document.getElementById('addOrUpdfrom'),3)){
			var zgh = $("#zgh").val();
			var zt = $("#zt").val();
			var url="<%=path%>/ptjsgl/queryByZghCount";
		    var param={'zgh':zgh,'zt':zt};
		//    var xb = $("input[name=xbs]:checked").attr("id");
	   // 	$("#xb").val(xb);
		    $.post(url,param,function(result){
		        if(result){
		        	document.addOrUpdfrom.action = '<%=path%>/ptjsgl/addJssz';	 
		        	$('#addOrUpdfrom').ajaxSubmit(function(r){
		            	document.queryform.action="<%=path%>/ptjsgl/queryJsgl";
		            	document.queryform.submit();
		            });
			    }else{
				    alert("此教师号已在用户中存在，请检查后再次添加！");
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
		
		var url1 = "<%=path%>/ptjsgl/querySfglbm";
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
		var url1 = "<%=path%>/ptjsgl/querySfglbm";
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
	function updKyf(zt){
		if(isCheck('ids') == false){
			alert("请选择要操作的教师");
			return;
	    }
	    if(confirm("您确定要操作选中的教师吗？") == true){
		    $("#plkyf").val(zt);
	        document.ff.action = "<%=path%>/ptjsgl/updKyf";
	        $('#ff').ajaxSubmit(function(r){
		        if(r == 1)
			        alert("操作成功！");
		        else
			        alert("操作失败！");
	        	document.queryform.action="<%=path%>/ptjsgl/queryJsgl";
	        	document.queryform.submit();
	        });
	    }
	}
	
	
	
	
	
		//导出模板
	function exp_ykcjmb(){
	    document.queryform.action = "<%=path%>/ptjsgl/expYkcjmb";
        document.queryform.submit();
	}
	
	function impPtjsxx(){
		if(Validator.Validate(document.getElementById('impExlform'),3)){
	    document.impExlform.action = "<%=path%>/ptjsgl/impPtjsxx";
        $('#impExlform').ajaxSubmit(function(r){
	        if(r=='1')
	        {
		        alert("导入成功");
		        document.queryform.action = "<%=path%>/ptjsgl/queryJsgl";
	        	document.queryform.submit();
	        }else{
	          	alert("导入失败");
	        }
	        });
  }
	}
	
	function clier()
	{
		Validator.ClearForm('impExlform');
		$("#excel").val("");
			Validator.ClearForm('impExlform');
			BOX_show('impExl');
	}
	
	
	
	
	function iframe_divTcLj(){
	var openUrl = '<%=path%>/ptjsgl/queryYxByJysTree';//弹出窗口的url
	var iHeight=550; //弹出窗口的高度;
	var iWidth=900; //弹出窗口的宽度;
	var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
	var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	window.open(openUrl,"选择按钮",'height='+iHeight+', width='+iWidth+', top='+iTop+', left='+iLeft+', titlebar=no,toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no,z-look=yes');
}
function resultCg()
{
	document.queryform.action="<%=path%>/ptjsgl/queryJsgl";
	document.queryform.submit();
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
            <div class="addlist_button"> <a href="javascript:addDiv();"><span>添&nbsp;&nbsp;加</span></a> </div>
            <div class="addlist_button  ml15"> <a href="javascript:delJs();"><span>删&nbsp;&nbsp;除</span></a> </div>
            <div class="addlist_button  ml15"> <a href="javascript:selJs();"><span>选&nbsp;&nbsp;择</span></a> </div>
            <div class="addlist_button  ml15"> <a href="javascript:updKyf('1');"><span>启&nbsp;&nbsp;用</span></a> </div>
            <div class="addlist_button  ml15"> <a href="javascript:updKyf('0');"><span>禁&nbsp;&nbsp;用</span></a> </div>
               <div class="addlist_button  ml15"> <a href="javascript:void(0);" onclick="javascript:clier()"><span>导入平台教师表</span></a> </div>
                <div class="addlist_button  ml15"> <a href="javascript:void(0);" onclick="javascript:iframe_divTcLj()"><span>平台教师导入教师表</span></a> </div>
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
	           	  <select name="jsyxdm" id="qf_ssyx onchange="javascript:changeJys('qf_ssyx','qf_ssjys');return false;">
	      		    <option value="">--请选择--</option>
	      		    <c:forEach items="${yxlist}" var="map" varStatus="status">
	       		      <option value='${map.YXDM}' <c:if test="${map.YXDM eq jsglPage.jsyxdm}">selected</c:if>>
	    		         ${map.YXMC}
	    	          </option>
				    </c:forEach>
	    		  </select>
	           	</td>
		       </tr>
		       <tr>
		        <th>教研室：</th>
	           	<td>
	           	  <select name="jsjysdm" id="qf_ssjys">
	       			<option value="" <c:if test="${empty jsglPage.jsjysdm}">selected</c:if>>--请选择--</option>
	    		  </select>
	           	</td>
		      </tr>
		       <tr>
		        <th>职工号/姓名：</th>
	           	<td><input type="text" name="dmmc" id="qf_zgh" value="${jsglPage.dmmc}"  /></td>
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
		<input type="hidden" name="dmmc"  value="${jsglPage.dmmc}" />
		<input type="hidden" name="kyf"  id="plkyf" value="" />
        <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
            <th width="5%"><input type="checkbox" id="ids" title="全选/不选" style="padding:0;margin-left:2px;*margin-left:-2px;"/></th>
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
            <th>是否可用</th>
            <th>操作</th>
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
			  <td>
			  	<c:if test="${map.kyf eq '1'}">可用</c:if>
			  	<c:if test="${map.kyf eq '0'}">禁用</c:if>
			  </td>
			  <td>
				<div class="cz_button cz3_6" title="修改密码" onclick="javascript:updMmDiv('${map.zgh}');"></div>      
              </td>
       		</tr>
          </c:forEach>
        </table>
      </form>
    </div>

    <div class="youtube"> 
      <c:if test="${not empty jsglPage }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="jsglPage" onlyOneShow="true" showListNo="true" action="ptjsgl/queryJsgl"/>
      </c:if>
    </div>
    <div class="clr"></div>
  </div>
</div>

<form name="FormUpload" id="FormUpload"  method="post" action="<%=path%>/jsp/commons/jls_up.jsp"  enctype="multipart/form-data">
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
          <td align="left"><a href="javascript:void(0);" onclick="javascript:location.href='<%=path%>/jsp/commons/download.jsp?strPath=/upload/teacher.xls&disFile=教师批量导入模版.xls';return false;" title="点击下载">教师批量导入模版.xls</a></td>
        </tr>
        <tr>
          <th valign="top">文本选择：</th>
          <td align="left">
            <p><input type="file" name="fileField" id="fileField" /></p>
            <p>1、请按模板要求填写。<br />
               2、Excel文件中不能存在公式。<br />
               3、每次最多导入999行，文件大小限制在1M以内。<br />
               4、导入速度和每次导入的数据量有关，请耐心等待。
            </p>
          </td>
        </tr>
      </table>
      <div class="clr"></div>
    </div>
  </div>
</form>

<div id="sel" style=" display:none; width: 800px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <div class="popup">
    <div class="Floatleft Pct100 mb10">
      <div class="popup_left">选择教师</div>
      <a href="#" class="btn_close" onclick="javascript:BOX_remove('sel');"></a> 
    </div>
    <div class="clr"></div>
        <iframe id="iframename" name="iframename" src="" border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%; height: 400px;" frameborder="0" allowTransparency="true"></iframe>
  </div>
</div>

<div id="addOrUpd" style="display:none; width: 700px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form id="addOrUpdfrom" name="addOrUpdfrom" method="post">
	<input type="hidden" name="dmmc"  value="${jsglPage.dmmc}" />
	<input type="hidden" name="zt" id="zt"/><!-- 1：添加  2：修改 -->
	<input type="hidden" id="yx" value="${jsglPage.jsyxdm}" />
	<input type="hidden" id="jys" value="${jsglPage.jsjysdm}" />
	<input type="hidden" name="glyx" id="glyx" />
    <div class="popup">
      <div class="Floatleft Pct100 mb10">
        <div class="popup_left">添加/修改</div>
        <a href="#" class="btn_close" onclick="javascript:BOX_remove('addOrUpd');"></a> 
      </div>
      <div class="clr"></div>
      <table id="divtab" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
        <tr>
          <th>职工号：</th>
          <td align="left"><input type="text" name="zgh" id="zgh"  dataType="Number" min="1" max="15" msg="必填数字(15个字之内)"/>
            <span class="red">*</span></td>
          <th>姓名：</th>
          <td align="left"><input type="text" name="jsxm" id="jsxm" dataType="Limit" min="1" max="20" msg="必填(20个字之内)" />
            <span class="red">*</span>
          </td>
        </tr> 
        <tr>
          <th>密码：</th>
          <td align="left">初始密码123456</td>
<!--          <th>照片：</th>-->
<!--          <td align="left"><input name="" type="file" /></td>-->
			 <th> 性别：</th>
		  <td align="left">
			<select name="xb" id="ff_xb">
			  <option value="">--请选择--</option>
              <c:forEach items="${xbList}" var="map" varStatus="status">
		  		<option value="${map.dm}">${map.mc}</option>
		  	  </c:forEach>
            </select>
          </td>

        </tr> 
        <tr>
          <th>所属院：</th>
          <td align="left">
            <select name="xydm" id="ff_ssydm"  class="se200" onchange="javascript:changeXAndJys(this);return false;" dataType="Limit" min="1" max="20" msg="必选">
        	  <option value="">--请选择--</option>
         	  <c:forEach items="${xyList}" var="map" varStatus="status">
         	    <option value='${map.YXDM}'>
      	          ${map.YXMC}
                </option>
     	      </c:forEach>
        	</select>
        	<span class="red">*</span>
          </td>
          <th>所属系：</th>
          <td align="left">
            <select name="xdm" id="ff_ssxdm"  class="se200" onchange="javascript:changeJysByX(this);return false;">
              <option value="">--请选择--</option>
          	</select>
          </td>
        </tr> 
        <tr>
          <th> 教研室：</th>
		  <td align="left">
		    <select name="jysdm" id="ff_jysdm">
		 	  <option value="">--请选择--</option>
            </select>
          </td>
          <th> 籍贯：</th>
		  <td align="left">
			<select name="jg" id="ff_jg">
			  <option value="0">--请选择--</option>
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
			  <option value="">--请选择--</option>
              <c:forEach items="${mzList}" var="map" varStatus="status">
		  		<option value="${map.dm}">${map.mc}</option>
		  	  </c:forEach>
            </select>
          </td>
          <th> 文化程度：</th>
		  <td align="left">
			<select name="whcd" id="ff_whcd">
			  <option value="">--请选择--</option>
              <c:forEach items="${whcdList}" var="map" varStatus="status">
		  		<option value="${map.dm}">${map.mc}</option>
		  	  </c:forEach>
            </select>
          </td>
        </tr>
        <tr>
          <th> 学历：</th>
 		  <td align="left">
			<select name="xl" id="ff_xl">
			  <option value="">--请选择--</option>
              <c:forEach items="${xlList}" var="map" varStatus="status">
		  		<option value="${map.dm}">${map.mc}</option>
		  	  </c:forEach>
            </select>
          </td>
          <th> 学位：</th>
		  <td align="left">
			<select name="xw" id="ff_xw">
			  <option value="">--请选择--</option>
              <c:forEach items="${xwList}" var="map" varStatus="status">
		  		<option value="${map.dm}">${map.mc}</option>
		  	  </c:forEach>
            </select>
          </td>
        </tr> 
        <tr>
          <th> 行政级别：</th>
 		  <td align="left">
			<select name="xzjb" id="ff_xzjb">
			  <option value="">--请选择--</option>
              <c:forEach items="${xzjbList}" var="map" varStatus="status">
		  		<option value="${map.dm}">${map.mc}</option>
		  	  </c:forEach>
            </select>
          </td>
          <th> 职称：</th>
 		  <td align="left">
			<select name="zc" id="ff_zc">
			  <option value="">--请选择--</option>
              <c:forEach items="${zcList}" var="map" varStatus="status">
		  		<option value="${map.dm}">${map.mc}</option>
		  	  </c:forEach>
            </select>
          </td>
        </tr> 
        <tr>
          <th> 政治面貌：</th>
 		  <td align="left" >
			<select name="zzmm" id="ff_zzmm">
			  <option value="">--请选择--</option>
              <c:forEach items="${zzmmList}" var="map" varStatus="status">
		  		<option value="${map.dm}">${map.mc}</option>
		  	  </c:forEach>
            </select>
          </td>
         
        </tr>
        <tr>
          <td colspan="4" align="center"><div class="addlist_button1" style="float:right"><a href="javascript:BOX_remove('addOrUpd');"><span>取消</span></a> </div>
          <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:addOrUpd();" title="保存" ><span>保存</span></a> </div></td>
        </tr>
      </table>
      <div class="clr"></div>
    </div>
  </form>
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
                <td align="left"><input type="password" name="mm" id="mm" dataType="Limit" msg="密码必须在6~25位" min="6" max="25" /></td>
            </tr> 
            <tr>
                <th>再次输入新密码：</th>
                <td align="left"><input type="password" name="mm2" id="mm2" dataType="Limit" msg="密码必须在6~25位" min="6" max="25" /></td>
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
		            <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:impPtjsxx();" title="保存" ><span>保存</span></a> </div>           
                </td>
            </tr>
      </table>
      <div class="clr"></div>
    </div>
  </div>
</form>

 <!-- 弹出为_div    的弹出层 -->
<div id="_divTc" style="display:none; width: 700px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
<form name="_divTcFrom" id="_divTcFrom" method="post">
    <div class="popup">
        <div class="Floatleft Pct100 mb10">
           <div class="popup_left">导入教师</div>
           <a href="javaScript:void(0);" class="btn_close" onclick="javascript:BOX_remove('_divTc');"></a> </div>
           <div class="clr"></div>
		   <iframe id="iframename_div" name="iframename_div"  border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%;height:450px;" frameborder="0" allowTransparency="true"></iframe>
           <div class="addlist_button1 mt10" style="float:right"><a href="javascript:void(0);" onclick="javascript:BOX_remove('_divTc');"  title="取消" ><span>取消</span></a> </div>
           <div class="clr"></div>
    </div>
</form>
</div>
<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"> </div>
</body>
</html>


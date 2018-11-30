<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
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
<title>自定义导入列表</title>
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blue/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blue/css/dripicon.css"> 
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blue/css/skin-select.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blue/css/tooltipster.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blue/css/css.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blue/css/tooltipster.css">

<link href="<%=path%>/resources/style/blue/css/top.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blue/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blue/css/left.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blue/css/content.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blue/css/pageTag.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blue/css/zTreeStyle.css" rel="stylesheet" type="text/css" />
<jsp:include page="../js/js_jquery.jsp"/>

<style type="text/css">
	html, body { height:100%; }
	.Contentbox { width:100%; min-height:100%;height:auto }
	*html .Contentbox { height:100% }
	.link{width:60px;height:26px;border-radius: 3px;background:#f1f1f1;display:inline-block;border:1px solid #bebebe;line-height:26px;margin-top:4px;text-align:center;color:#222}
</style>
<style>
.col-xs-4{width: 30%}
.col-xs-8{width: 69.5%}
/* .imp-div{width: 10%;padding-left: 5px;float: left;text-align: center;padding-top: 120px;} */
.bot_line tr td{text-align:center}
.bot_line tr th{text-align:center}
</style>
<script type="text/javascript">
 	// 选中行加背景
	$(function(){
	    $('table tr a').click(function(){
	        $('table tr').removeClass('tr-bg');
	        $(this).parent().parent().addClass('tr-bg');
	    })
	});
	
	$().ready(function(){
		//初始化全选功能
		$("#ff").baigoCheckall();
		
		//如果是选择导入文件后返回，判断是否读取导入文件失败
		var readExcelTag = "${readExcelTag}";
		if(readExcelTag!=null && readExcelTag!="" && readExcelTag=="false"){
			alert("读取文件数据失败,请确保Excel工作表命名为Sheet1,并在Sheet1中添加数据。");
		}else if(readExcelTag!=null && readExcelTag!="" && readExcelTag=="true"){
			$("#saveImportBtn",parent.document).show();
			$("#dccwxx").show();
		}
	});


	//左右列表结构
    $(document).ready(function(){
 	    var wHeight =(window.innerHeight || (window.document.documentElement.clientHeight || window.document.body.clientHeight));
	    var wWidth = (window.innerWidth || (window.document.documentElement.clientWidth || window.document.body.clientWidth));
		$('.col-xs-4').height(wHeight -50);
		//$('.imp-div').height(wHeight -50);
		$('.col-xs-8').height(wHeight-50);
		$(window).resize(function(){
			var wHeight =(window.innerHeight || (window.document.documentElement.clientHeight || window.document.body.clientHeight));
	 		var wWidth = (window.innerWidth || (window.document.documentElement.clientWidth || window.document.body.clientWidth));
	 		$('.col-xs-4').height(wHeight -50); 
	 		//$('.imp-div').height(wHeight -50);
	 		$('.col-xs-8').height(wHeight - 50);
		});
	
	
    });
    
    //选择文件
    function clier(){
		Validator.ClearForm('impExlform');
		$("#excel").val("");
		BOX_show('impExl');
	}
	
	//读取选择文件的数据并回显
	function xzExcel(){
		if(Validator.Validate(document.getElementById('impExlform'),3)){
			 var fjgs = document.getElementById("excel").value.split('.');
			 var i= fjgs.length-1;
		     var fjhz = fjgs[i];
		     if(fjhz=='xls'){
		     	openLoading();
		     	document.impExlform.action = "<%=path%>/customImpOrExp/customImpOrExpZdydr?sfimpfile=1";
		     	document.impExlform.submit(); 
			 }else{
			 	alert("选择的文件格式不正确！");
			 	return false;
			 }
	    }
	}
	
	//确认导入，保存导入的数据
	function saveImp(){
		if(Validator.Validate(document.getElementById('ff'),3)){
			$("#saveImportBtn",parent.document).hide();
			openLoading();
			document.ff.action = "<%=path%>/customImpOrExp/saveImport";
			$('#ff').ajaxSubmit(function(res){
				alert(" 导入数据总条数："+res.dataSize+" \r\n 导入成功条数："+res.okDataSize+" \r\n 导入失败条数："+res.errorDataSize);
				$("#ztsTip").text(res.dataSize);
       	        $("#cgtsTip").text(res.okDataSize);
       	        $("#sbtsTip").text(res.errorDataSize);
       	        
       	        if(parseInt(res.errorDataSize)>0){
					$("#impError").show();
				}
				
				$("#impTip").show();
				
	    		closeLoading();
	    		$("#saveImportBtn",parent.document).show();
	        });
		}
	}
	
	//导出错误信息
	function impError(){
		window.location.href = "<%=path%>/customImpOrExp/impError";
	}
	
    //打开等待窗口
	function openLoading(){
		BOX_show('drzDiv');
	}
	// 关闭等待窗口
	function closeLoading(){
		BOX_remove('drzDiv');
	}
 
	//下载模板
	function toExcel(id){
	     var sellength = '${fn:length(impColEntitys)}';
	     if('0'!= sellength){
		     window.location.href='<%=basePath%>customImpOrExp/downExcel?id='+id;
	     }else{
	       	 alert("请维护保存模板信息后下载模板！" );
	       	 return;
	     }
	}
 
</script>
</head>

<body>
<div class="Contentbox">
  <div class="mainbg"></div>
  <div class="pd10">
	<div class="clr"></div>
	
	<div class="row" style="width:100%">
        <table width="100%" cellpadding="0" cellspacing="0" style="margin-bottom: 5px!important;">
      	    <tr>
				<td align="left">
					<div class="addlist_button1 ml10" style="float: left;" > <a class="addlist_button1 ml10" onclick="toExcel('${id}')"><span>1.下载模版</span></a></div>
					<div class="addlist_button1 ml10" style="float: left;" > <a class="addlist_button1 ml10" onclick="clier();return false;"><span>2.选择导入文件</span></a></div>
				</td>
				<td align="right" width="60%">
					<span id="impTip" style="width:100%;display: none;margin-right: 15px;">
						导入数据条数：<font color="blue" id="ztsTip"></font> 条 &nbsp;
      					导入成功条数：<font color="green" id="cgtsTip"></font> 条
      					导入失败条数：<font color="red" id="sbtsTip"></font> 条 &nbsp;
      					<a id="impError" style="text-decoration:underline;color: #63c5ea;display: none;" href="javascript:void(0);" onmouseover="javascript:this.style.color='#ed8181';" onmouseout="javascript:this.style.color='#63c5ea';" onclick="impError();"><span>点此下载导入失败数据</span></a>
					</span>
				</td>
			</tr>
        </table>
	  	
	  	<div class="clr"></div>
	  	
        <div class="col-xs-4" style="overflow: auto;">
	    	<div class="clr"></div>
	    	<form action="" name="ff" id="ff" method="post">
	    		<input type="hidden" id="id" name="id" value="${id}"/>
			    <table class="table table-bordered mt5" style="white-space:nowrap;">
		            <tbody>
		            <c:forEach items="${impColEntitys}" var="map" varStatus="status">
			        	<tr <c:if test="${status.count % 2 eq '0'}">class="bgcol"</c:if>>
			         	  <td>
			         	  	<c:choose>
				         	  	<c:when test="${map.sfzj eq '1'}">
				         	  		<font color="red">${map.column_zh}</font>
				         	  	</c:when>
				         	  	<c:otherwise>
				         	  		${map.column_zh}
				         	  	</c:otherwise>
			         	    </c:choose>
			         	  </td>
			         	  <td>
			         	  	<select class="form-control Pct92 pull-left" style="max-width: 80%;" id="${map.column_en}" name="columnIndex" <c:if test="${map.sfzj eq '1'}">dataType="Require" msg="必选"</c:if> >
				          		<option value="">请选择</option>
				          		<c:forEach items="${btList}" var="bt" varStatus="btStatu">
				          			<option value="${map.column_en}!@#${btStatu.index}!@#${map.sfzj}!@#${map.sfxlzj}!@#${map.xlmc}!@#${map.dmbmc}!@#${map.column_cd}!@#${map.column_lx}" <c:if test="${map.column_zh eq bt}">selected</c:if>>${bt}</option>
				          		</c:forEach>
				          	</select>
			         	  </td>
			       		</tr>
			          </c:forEach>
		            </tbody>           
		           </table>
	    	</form>
        </div>
        
        <div class="col-xs-8" style="padding-left: 20px;overflow: auto;">
           <div class="clr"></div>
		     <table  class="table table-bordered mt5" style="white-space:nowrap">
	            <thead>
	              <tr>
	              	<c:forEach items="${btList}" var="bt" varStatus="btStatu">
	              		<th>${bt}</th>
              		</c:forEach>
	              </tr>
	            </thead>
	            <tbody>
	            <c:forEach items="${sjList}" var="sjlist" varStatus="sjlistStatu">
		        	<tr>
		        		<c:forEach items="${sjlist}" var="sj" varStatus="sjStatu">
			         	  	<td>${sj}</td>
		         	  	</c:forEach>
		       		</tr>
		          </c:forEach>
	            </tbody>           
	           </table>
        </div>
      </div>
	  <div class="clr"></div>
  </div>
</div>
</div>


<!-- 选择文件 -->
<div id="impExl" class="tan_add" style="display:none;width:600px; background: #fff; border: 3px solid #999;">
  <div class="impExlform" style="position:relative">
      <div id="cyjsDiv" style="clear:both;position:absolute;left:7px;top:60px"></div> 
	  <div class="pd10">
	  	 <div class="popup_left" id="qxzName2">选择文件</div>
	     <a href="#" class="btn_close" onclick="javascript:BOX_remove('xzjsxmDiv2');"></a>
	     <div class="clr"></div>
	  </div>
	  
      <div style="float:none; clear:both; overflow:hidden;" >
	    <form id="impExlform" name="impExlform" method="post" enctype="multipart/form-data">
		  	<table id="divtabuu" class="addlist table-bordered"  >
		      	  <tr>
		            <th >友情提示：</th>
		            <td>
		            <p>1. 支持.xls格式的Excel文件。</p>
		            <p>2. 需要将Excel文件的所有列的单元格格式改为“文本”。</p>
		            <p>3. 保存的时候,不可关闭当前页面!!!</p>
		            </td>
		          </tr>
		          <tr>
		            <th>文件路径：</th>
		            <td><input id="excel" name="excel" type="file" size="30" data-options="required:true" dataType="Limit" min="1" max="100" msg="请选择文件" accept=".xls"/></td>
		          </tr>
		      </table>  
		      
		      <input type="hidden" id="id" name="id" value="${id}"/>       
          </form>
      </div>
      
      <div id="oMainLi  stToolBar" class="wp_toolbar_inner" style=" padding:10px 10px 20px 0;">
        <div class="addlist_button1 ml10" style="float: right" ><a href="javascript:void(0);" onclick="javascript:BOX_remove('impExl');return false;" ><span>取消</span></a></div>
        <div class="addlist_button1 ml10" style="float: right" ><a href="javascript:void(0);" onclick="javascript:xzExcel();return false;" ><span>保存</span></a></div>
    	<div class="clr"></div>
      </div>
  </div>
</div>

<%--loading效果--%>
<div id="drzDiv" style="display:none;position:absolute;z-index;background:#fff;width:100%;height:100%;text-align:center;filter:alpha(opacity=30);opacity:0.3;">
	<span style="display:inline-block;margin-top:5px">
		<image src="<%=path%>/resources/style/blueTwo/images/loading.gif"></image>
	</span>
</div>
		  
<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"></div>
</body>
</html>


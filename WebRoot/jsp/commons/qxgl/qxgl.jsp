<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.lang.*,java.util.*,java.text.*" %>


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

<link href="<%=path%>/resources/js/treetable/stylesheets/master.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/js/treetable/stylesheets/jquery.treeTable.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/resources/js/selectJs/css/bootstrap-select.min.css"><!-- 下拉框复选 -->
<style type="text/css">
  html, body { height:100%; }
  .Contentbox { width:100%; min-height:100%;height:auto }
  *html .Contentbox { height:100% }
  
  .bootstrap-select.btn-group .dropdown-toggle .filter-option{
     	line-height: 24px;
 		height: 24px;
     	}
     	.dropdown-menu{margin-top:-1px}
.dropdown-menu ul{border:0!important;box-shadow: 0px 0px 0px rgba(0, 0, 0, 0.3) !important;}
.dropdown-menu li{height:34px;}
.dropdown-menu li a{display:block;height:34px;}
</style>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/treetable/javascripts/jquery.treeTable.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/treetable/treeTable-my.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>



<link rel="stylesheet" href="<%=path%>/resources/js/plupload/jquery.plupload.queue/css/jquery.plupload.queue.css" type="text/css" />
<script type="text/javascript" src="<%=path%>/resources/js/plupload/plupload.full.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/plupload/jquery.plupload.queue/jquery.plupload.queue.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/plupload/i18n/cn.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/plupload/plupload.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/ckeditor4.1.2/ckeditor.js"></script>
<%-- <script type="text/javascript" src="<%=path%>/resources/js/bootstrap.js"></script><!-- 下拉框复选 --> --%>
<%-- <script type="text/javascript" src="<%=path%>/resources/js/selectJs/js/bootstrap-select.min.js"></script><!-- 下拉框复选 --> --%>
<script type="text/javascript">

$().ready(function(){
	treetable();
	plfileupload({
	      url:'<%=path%>',
	      savePath:'helpupload',
	      max_file_size:'10mb' ,
	      max_file_length:1, //上传数量
	      buttonId:'fake_btn',
	      formId:'ff' ,
	      filters : (	[
		{title : "全部可上传类型", extensions : "zip"}
			     		]),
		   downfiles:${empty listfjjson ? '[]' : listfjjson }
	   },save);
	
});
   //添加只能填报菜单
	function addzntbcd(){
		$("#zntbiframe").attr("src","<%=path %>/jsp/formbj/selectfile.jsp?r="+Math.random());
		BOX_show('add_zntb');
	}
	function seturl(url){
		
		$('#fwlj').val(url)
		
		BOX_remove('add_zntb')
	}
	//校验数据   填写完全可以上传附件
	function testData(){
		if(Validator.Validate(document.getElementById('ff'),3) ){
			if(confirm("确认要上传此压缩包吗？(会清空所有帮助信息！)")){
				$("#fake_btn").click();  //触发隐藏btn 上传附件并调用save方法
			}
		}
	}
	//保存方法
	function save(){
		document.ff.action="<%=path%>/qxcdgl/Dryswjj";
	    document.ff.submit();
	}
	$.ajaxSetup({
	    async : false
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
	
	//查询所有父级权限
	function queryFqxdm(){
		var app="";
		var url = "<%=path%>/qxcdgl/queryCdmc";
		$.post(url,function(result){
			app+="<option value='-1'>最上级</option>";
			$.each(result,function(key,value){
				if((value.sfzxj == 0 && value.fqxdm=='-1') || (value.sfzxj==1 && value.fqxdm=='-1')){
					app+="<option value='"+value.qxdm+"'>&nbsp;&nbsp;"+value.qxmc+"</option>";
				}else if(value.fqxdm != '-1' && value.fqxdm.length == 2){
					app+="<option value='"+value.qxdm+"'>&nbsp;&nbsp;&nbsp;&nbsp;"+value.qxmc+"</option>";
				}else{
					app+="<option value='"+value.qxdm+"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+value.qxmc+"</option>";
				}
			})
			$("#fqxdm").append(app);
		})
	}
	//添加菜单权限弹出
	function addQxcd(){
		$("#qxmc").val("");
		$("#kyf").val("1");
		$("#fqxdm").children().remove();
		$("#qxcd_addOrUpd").val("0");   //0为添加
		queryFqxdm();
		$("#fwlj").val("#");
		$("#fwlj").attr("readonly","readonly");
		$("#fqxdm").attr("disabled",false);
		BOX_show('add');
	}
	
	//改变下拉列表框触发的事件
	function mySel(obj){
		if($(obj).val() ==-1){
			$("#fwlj").val("#");
			$("#fwlj").attr("readonly","readonly");
		}else{
			$("#fwlj").val("");
			$("#fwlj").attr("readonly",false);
		}
	}
	
	//修改菜单权限弹出
	function updQxcd(qxdm){
		$("#qxcd_addOrUpd").val("1");   //1为修改
		$("#fqxdm").children().remove();
		queryFqxdm();
		$("#fqxdm").attr("disabled",true);
		$("#qxdm").val(qxdm);
		var url = "<%=path%>/qxcdgl/queryByQxdm";
		var zhi = {'zhi':qxdm};
		$.post(url,zhi,function(result){
			$("#qxmc").val(result.qxmc);
			$("#fwlj").val(result.fwlj);
			$("#icon").val(result.icon);

			$("#fqxdm").val(result.fqxdm);
			//alert($("#fqxdm").val());
			/**
			$.each($("#fqxdm option"),function(key,value){
				if($(this).val() == result.fqxdm){
					$(this).attr("selected","selected");
				}
			})
			**/
			
			$.each($("#kyf option"),function(key,value){
				if($(this).val() == result.kyf){
					$(this).attr("selected","selected");
				}
			})
			if($("#fqxdm").val() == -1 || $("#fwlj").val() == '#'){
				$("#fwlj").val("#");
				$("#fwlj").attr("readonly",true);
			}else{
				$("#fwlj").attr("readonly",false);
			}
		})
		BOX_show('add');
	}
	//添加权限菜单和修改权限菜单
	function addOrUpt(){
		var i = $("#qxcd_addOrUpd").val();
		if(i==0){      //添加操作
		if(Validator.Validate(document.getElementById('form1'),3)){
			$("#table_js tr").remove();
			
			document.form1.action = "<%=path%>/qxcdgl/addQxcd";
			$("#form1").ajaxSubmit(function(result){
				if(result != null && result != ""){
					$("#qxdmByJs").val(result.qxdm);
					$("#fqxdmByJs").val(result.fqxdm);
					var address = "<%=path%>/qxcdgl/queryJs?qxdm="+result.qxdm;
					$.post(address,function(result2){
						var app="";
						$.each(result2,function(key,value){
							app+="<tr><td width='30px'><input type='checkbox' value='"+value.jsdm+"' name='js_"+value.jsdm+"' id='js_"+value.jsdm+"'";
							if(value.checked == 'true'){
				        		app+=" checked='checked'";
				        	}
				        	app+=" />";
							app+="</td><td>"+value.jsmc+"</td></tr>";
						})
						app+="<tr><td colspan='2' style='text-align:center'>是否默认开放：";
						app+="<select name='sfmrkf' id='sfmrkf' style='max-width:230px;'><option value='1' selected='selected'>是</option>";
						app+="<option value='0'>否</option></td></tr>";
						app+="<tr><td colspan='2' align='center'>";
						app+="<div class='addlist_button1' style='float:right'><a href=\"javascript:void(0);\" ";
						app+="title='取消' onclick=\"javascript:closeDiv('add_jsqx');\" ><span>取消</span></a> </div>";
						app+="<div class='addlist_button1 mr15' style='float:right' >";
						app+="<a href=\"javascript:void(0);\" onclick=\"javascript:addJsqx();\" title='保存' >";
						app+="<span>保存</span></a> </div></td> </tr>";
						$("#table_js").append(app);
						BOX_remove('add');
						BOX_show('add_jsqx');
					})
				}else{
					alert("访问路径已存在!!");
				}} );
			}
		}else{         //修改操作
			if(Validator.Validate(document.getElementById('form1'),3)){
				document.form1.action="<%=path%>/qxcdgl/updQxcd";
				$("#form1").ajaxSubmit(function(r){
					if(r == null || r == ""){
						document.form1.action="<%=path%>/qxcdgl/queryAllQxcdgl";
						document.form1.submit();
					}else {
						alert("访问路径已存在!!");
					}

				});
			}
		}
	}
	
	//为角色分配菜单
	function addJsqx(){
		if($("[id^=js_]:checked").length == 0){
			alert("请选择分配的角色!!");
			return;
		}else{
			var jsdm = "";
			var qxdm = $("#qxdmByJs").val();
			var fqxdm = $("#fqxdmByJs").val();
			var sfmrkf = $("#sfmrkf").val();
			var len = $("[id^=js_]:checked").length;
			$.each($("[id^=js_]:checked"),function(key,value){
				if(key == len -1){
					jsdm+=$(this).val();
				}else{
					jsdm+=$(this).val() + ",";
				}
			})
			var url = "<%=path%>/qxcdgl/addJsqx";
			var zhi = {'jsdm':jsdm,'qxdm':qxdm,'fqxdm':fqxdm,'sfmrkf':sfmrkf};
			$.post(url,zhi,function(result){
				if(result){
					BOX_remove('add_jsqx');
					document.form1.action="<%=path%>/qxcdgl/queryAllQxcdgl";
					document.form1.submit();
					///$("#iframename").attr("src","<%=path%>/qxcdgl/queryRyfp?jsdmss="+jsdm+"&qxdm="+qxdm+"&fqxdm="+fqxdm);
					//BOX_show('add_ryjsqxb');
				}
			})
		}
	}
	
	//删除权限菜单方法
	function deleteQx(qxdm){
		if(confirm("确认删除该菜单吗？")){
			document.form2.action="<%=path%>/qxcdgl/delQx?qxdm="+qxdm;
			$("#form2").ajaxSubmit(function(r){
				document.form2.action="<%=path%>/qxcdgl/queryAllQxcdgl";
				document.form2.submit();
			});
		}
	}
	
	//关闭弹出层方法
	function closeDiv(obj){
		BOX_remove(obj);
		document.form2.action="<%=path%>/qxcdgl/queryAllQxcdgl";
		document.form2.submit();
	}
	
	//改变显示顺序
	function changeXssx(obj,qxdm,fqxdm,sfzxj){
		var qxdm2 = $(obj).val();
		document.form2.action="<%=path%>/qxcdgl/changeXssx?qxdm="+qxdm+"&fqxdm="+fqxdm+"&qxdm2="+qxdm2+"&sfzxj="+sfzxj;
		document.form2.submit();
	}
	
 
	function chaedit(qxdm){
		var oAction = new Action("<%=path%>/helpgl/queryHelpglListBj");
		oAction.setParameter("qxdm",qxdm);
		oAction.doOpenWinAction();
	}
	function chaedit(qxdm){
		var oAction = new Action("<%=path%>/helpgl/queryHelpglListBj");
		oAction.setParameter("qxdm",qxdm);
		oAction.doOpenWinAction();
	}
	
	//为菜单分配角色权限
	function qxcdSq(qxdm,fqxdm){
		$("#qxdmByJs").val(qxdm);
		$("#fqxdmByJs").val(fqxdm);
		var address = "<%=path%>/qxcdgl/queryJs?qxdm="+qxdm;
		$.post(address,function(result2){
			var app="";
			$.each(result2,function(key,value){
				app+="<tr><td width='30px'><input type='checkbox' value='"+value.jsdm+"' name='js_"+value.jsdm+"' id='js_"+value.jsdm+"'";
				if(value.checked == 'true'){
	        		app+=" checked='checked'";
	        	}
	        	app+=" />";
				app+="</td><td>"+value.jsmc+"</td></tr>";
			})
			app+="<tr><td colspan='2' style='text-align:center;'>是否默认开放：";
			app+="<select name='sfmrkf' id='sfmrkf' style='max-width:230px;'><option value='1' selected='selected'>是</option>";
			app+="<option value='0'>否</option></td></tr>";
			app+="<tr><td colspan='2' align='center'>";
			app+="<div class='addlist_button1' style='float:right'><a href=\"javascript:void(0);\" ";
			app+="title='取消' onclick=\"javascript:closeDiv('add_jsqx');\" ><span>取消</span></a> </div>";
			app+="<div class='addlist_button1 mr15' style='float:right' >";
			app+="<a href=\"javascript:void(0);\" onclick=\"javascript:addJsqx();\" title='保存' >";
			app+="<span>保存</span></a> </div></td> </tr>";
			$("#table_js").append(app);
			BOX_show('add_jsqx');
		})
	}
	
	//导出数据
	function excelDc(){
		document.drform.action="<%=path%>/qxcdgl/dowloadFile";
		document.drform.submit();
	}
	function addAn(){
		$("#iframename_an").attr("src","<%=path%>/jsp/commons/ymqxgl/main.jsp");
		BOX_show("add_an");
	}
	function yl(src){
		
		$("#iframename_yl").attr("src",src);
		BOX_show("yl");
		
	}
	function queryLike(){
		document.form2.action="<%=path%>/qxcdgl/queryAllQxcdgl";
		document.form2.submit();
	}
	//查询
	function querylike(){
		document.form2.action="<%=path%>/qxcdgl/queryAllQxcdgl";
		document.form2.submit();
	}

	//修改弹出层
	function updDiv(id,qxmc,qxdm){
		$("#ff_zt").val('2');//2:修改
		Validator.ClearForm('pageForm');
		$("#divtab").find("input[type='text']").val('');
		$("#divtab").find("select").val('');
		$('.bix-colon').html("");
		var url="<%=path%>/pageGen/queryPageByid";
	    var param={'id':id};
	    $.post(url,param,function(result){
		    if(result.flag=='1'){
		    	var a = result.pagexx;
		    	$.each(result.cxtjList,function(key,value){
					var sel="";
					if(value.LX == '2'){
						sel = 'selected="selected"';
					}
					var coll='<p class="bix-colon" style="margin:15px;">'+
			           '<span>类型：  </span>'+
			           '<select name="lx" style="width:10%!important;">'+
			             '<option value="1"'+sel+'>'+'文本框'+'</option>'+
			             '<option value="2"'+sel+'>'+'下拉框'+'</option>'+
			           '</select>'+
			           '<span>    表名：</span>'+
			           '<input type="text" name="tablename" id="" value="'+value.TABLENAME+'" style="width:12%!important;"/>'+
			           '<span>    属性(DM)：</span>'+
			           '<input type="text" name="sxdm" id="" value="'+value.SXDM+'" style="width:10%!important;"/>'+
			           '<span>    属性(MC)：</span>'+
			           '<input type="text" name="sxmc" id="" value="'+value.SXMC+'" style="width:10%!important;"/>'+
			           '<span>    标题：</span>'+
			           '<input type="text" name="bt" id="" value="'+value.BT+'" style="width:16%!important;"/>'+
			         '</p>';
	
	
			         $('.colon-bottom-p').append(coll);
				});
		    	$.each(result.gnlbList,function(key,value){
					var coll='<p class="bix-colon" style="margin:15px;">'+
			           '<span>选择功能：</span>'+
		               '<select name="gnlb" style="width:10%!important;">';
			            	<c:forEach items="${gnList}" var="map" varStatus="status">
			            		coll += '<option value=\'${map.GNID}\'';
					      		if(value.GNID == '${map.GNID}'){
					      			coll += 'selected="selected"';
					      		}
					      		coll += '>${map.GNMC}</option>';
					     	</c:forEach>
			           coll +='</select>'+
	                   '<span>跳转链接：</span><input type="text" name="tzlj" value="'+value.TZLJ+'" style="width: 95%;margin: 0 6px;"/>'+
			         '</p>';
						$('#gnlbTd').append(coll);
				})
				
				$.each(result.hngnlbList,function(key,value){
					var coll='<p class="bix-colon" style="margin:15px;">'+
			           '<span>选择功能：</span>'+
		               '<select name="hngnlb" style="width:10%!important;">';
			            	<c:forEach items="${hngnList}" var="map" varStatus="status">
			            		coll += '<option value=\'${map.GNID}\'';
					      		if(value.HNGNID == '${map.GNID}'){
					      			coll += 'selected="selected"';
					      		}
					      		coll += '>${map.GNMC}</option>';
					     	</c:forEach>
			           coll +='</select>'+
	                   '<span>跳转链接：</span><input type="text" name="hntzlj" value="'+value.HNTZLJ+'" style="width: 95%;margin: 0 6px;"/>'+
			         '</p>';
						$('#hngnlbTd').append(coll);
				})
				
		    	$("#ff_pageid").val(result.pagexx.ID);
		    	//$("#ff_pagename").val(result.pagexx.PAGENAME);
		    	$("#ff_columnname").val(result.pagexx.COLUMNNAME);
		    	$("#ff_sql").val(result.pagexx.SQL);
		    	$("#ff_sqlwhere").val(result.pagexx.SQLWHERE);
		    	if(result.pagexx.SFFY == 1){
		    		$("#ff_sffy").attr("checked", true);
		    	}
		    }
	    	$("#ff_qxdm").val(qxdm);
	    	$("#ff_pagename").val(qxmc);
	    	$("#ff_pagename").attr("readonly","readonly");
	    },'json')
	    
	    
		BOX_show('addPage');
	}

	function addPage(){
		if(Validator.Validate(document.getElementById('pageForm'),3)){
        	document.pageForm.action = '<%=path%>/pageGen/addPage';
        	$('#pageForm').ajaxSubmit(function(r){
        		queryLike();
            });
		}
	}

	function colon(){
		var coll='<p class="bix-colon" style="margin:15px;">'+
		           '<span>类型：  </span>'+
		           '<select name="lx" style="width:10%!important;">'+
		             '<option value="1">'+'文本框'+'</option>'+
		             '<option value="2">'+'下拉框'+'</option>'+
		           '</select>'+
		           '<span>    表名：</span>'+
		           '<input type="text" name="tablename" id="" value="" style="width:12%!important;"/>'+
		           '<span>    属性(DM)：</span>'+
		           '<input type="text" name="sxdm" id="" value="" style="width:10%!important;"/>'+
		           '<span>    属性(MC)：</span>'+
		           '<input type="text" name="sxmc" id="" value="" style="width:10%!important;"/>'+
		           '<span>    标题：</span>'+
		           '<input type="text" name="bt" id="" value="" style="width:16%!important;"/>'+
		         '</p>';


		$('.colon-bottom-p').append(coll);
	}

	function addgnlb(){
		var coll='<p class="bix-colon" style="margin:15px;">'+
        '<span>选择功能：</span>'+
        '<select name="gnlb" style="width:10%!important;">';
         	<c:forEach items="${gnList}" var="map" varStatus="status">
         		coll += '<option value=\'${map.GNID}\'>${map.GNMC}</option>';
		     	</c:forEach>
        coll +='</select>'+
        '<span>跳转链接：</span><input type="text" name="tzlj" value="" style="width:12%!important;"/>'+
      '</p>';
		$('#gnlbTd').append(coll);
	}

	function addhngnlb(){
			var coll='<p class="bix-colon" style="margin:15px;">'+
	        '<span>选择功能：</span>'+
	        '<select name="hngnlb" style="width:10%!important;">';
	         	<c:forEach items="${hngnList}" var="map" varStatus="status">
	         		coll += '<option value=\'${map.GNID}\'>${map.GNMC}</option>';
			     	</c:forEach>
	        coll +='</select>'+
	        '<span>跳转链接：</span><input type="text" name="hntzlj" value="" style="width:12%!important;"/>'+
	      '</p>';
			$('#hngnlbTd').append(coll);
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
    <form name="drform" id="drform"  method="post"  >
   		 <input  type="hidden"   name="inputPath" id="cclj" value="dcsj.ser"/>
   		 <input  type="hidden"   name="filename"  id="xsm" value="xt_help.ser"/>
   	</form>
   	<input type="hidden" id="qxdmByJs" value="" />
    <input type="hidden" id="fqxdmByJs" value="" />
    <form name="form2" id="form2" method="post">
    <div class="butsea">
      <table  border="0" align="left" cellpadding="0" cellspacing="0"  >
        <tr>
          <td height="35px">
            <c:if test="${fn:contains(ANB,'an2')}">
            	<div class="addlist_button">
					<a href="javascript:void(0);" onclick="javascript:addQxcd();">
            			<span>${ANB['an2'].ANMC}</span>
            		</a>
            	</div>
           	</c:if>
            	<div class="addlist_button">
					<a href="javascript:void(0);" onclick="javascript:addQxcd();">
            			<span>添加</span>
            		</a>
            	</div>
            	<div class="addlist_button  ml15">
            	 	<a href="javascript:void(0);" onclick="javascript:BOX_show('upload');return false;"">
            			<span>导入帮助数据</span>
            		</a>
            	 </div>
            	 <div class="addlist_button  ml15">
            		 <a href="javascript:void(0);" onclick="javascript:excelDc();">
            			<span>导出帮助数据</span>
            		</a>
            	 </div>
            <div class="addlist_button  ml15"> <a href="javascript:void(0);" onclick="javascript:addAn();"><span>按钮维护</span></a> </div>
            <div class="addlist_button  ml15"><a href="javascript:void(0);" onclick="javascript:queryLike();return false;"><span>刷新</span></a> </div>
          </td>
        </tr>
      </table>
      
      <table  border="0" align="right" cellpadding="0" cellspacing="0"  >
          <tr>
            <td >权限角色：</td>
            <td>
             <select name="cxjsdm" id="cxjsdm">
              <option value=''>---请选择---</option>
  			  <c:forEach items="${jslist}" var="map" varStatus="status">
		      		<option value='${map.jsdm}' <c:if test="${map.jsdm eq cxjsdm}">selected</c:if>>${map.jsmc}</option>
		      </c:forEach>
		     </select>
		    </td>
            <td ><div class="addlist_button2"> <a href="javascript:void(0);" onclick="javascript:querylike();return false;"><span>搜&nbsp;&nbsp;索</span></a> </div></td>
         </tr>
      </table>
    </div>
    </form>
    <div class="clr"></div>
    <div class="list">
      <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line" id="zbtable">
        <thead>
          <tr>
            <th>
         	  <span class="Floatleft" style="padding:0px">菜单名称 </span>
              <a href="javascript:void(0);" onclick="javascript:expandall();return false;" class="open_but" title="展开"><i class="glyphicon glyphicon-circle-arrow-down"></i></a>
              <a href="javascript:void(0);" onclick="javascript:collapseall();return false;" class="close_but" title="收起"><i class="glyphicon glyphicon-remove-circle"></i></a>
        	</th>
            <th>访问路径</th>
            <th>显示顺序</th>
            <th>icon</th>
            <th>可用否</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${qxcd_list}" var="qxcd" varStatus="status">
            <tr id="node${qxcd.treedm}"  class=" ${status.count%2==0 ? 'bgcol':'' }  <c:choose><c:when test='${qxcd.fqxdm==-1}'>parent</c:when><c:otherwise>child</c:otherwise></c:choose>
              <c:choose><c:when test='${qxcd.treefdm==null}'></c:when><c:otherwise>child-of-node</c:otherwise></c:choose>${qxcd.treefdm}"style="line-height:30px;">
	            <td><span class="<c:choose><c:when test='${qxcd.fqxdm==-1}'>folder</c:when><c:otherwise>file</c:otherwise></c:choose>">
	              &nbsp;</span><span>${qxcd.qxmc}</span>
	            </td>
		        <td>${qxcd.fwlj}</td>
		        <td>
		          <c:if test="${qxcd.fqxdm==-1}">
		            <select name="xssx" style="width:50px;" onchange="javascript:changeXssx(this,'${qxcd.qxdm}','${qxcd.fqxdm}','${qxcd.sfzxj}');">
		              <c:forEach items="${qxcd_list}" var="qxcds" varStatus="statu">
		                <c:if test="${qxcds.fqxdm==-1}">
			              <option value="${qxcds.qxdm}" <c:if test='${statu.index+1 eq status.index+1}'>selected="selected"</c:if>>
				            ${statu.index+1}
			              </option>
			            </c:if>
		              </c:forEach>
		            </select>
		          </c:if>
		          <c:if test="${qxcd.fqxdm!=-1}">
				    <select name="xssx" style="width:50px;" onchange="javascript:changeXssx(this,'${qxcd.qxdm}','${qxcd.fqxdm}','${qxcd.sfzxj}');">
				      <c:forEach items="${qxcd_list}" var="qxcds" varStatus="statu">
				        <c:if test="${qxcds.fqxdm!=-1 and qxcds.fqxdm eq qxcd.fqxdm}">
					      <option value="${qxcds.qxdm}" <c:if test='${statu.index+1 eq status.index+1}'>selected="selected"</c:if>>
						    ${statu.index+1}
					      </option>
					    </c:if>
				      </c:forEach>
			        </select>
		          </c:if>
		        </td>
		        <td>
		        ${qxcd.icon}
		        </td>
		        <td>
		          <c:choose>
		            <c:when test="${qxcd.kyf == 1}">可用</c:when>
		            <c:otherwise>不可用</c:otherwise>
		          </c:choose>
		      </td>
		      <td>
		        <div class="cz_button cz1_1" title="修改" onclick="javascript:updQxcd('${qxcd.qxdm}');"></div>
		        <div class="cz_button cz1_2" title="删除" onclick="javascript:deleteQx('${qxcd.qxdm}');"></div>
		        <div class="cz_button cz3_5" title="帮助" onclick="javascript:chaedit('${qxcd.qxdm}');"></div>
		        <div class="cz_button cz2_3" title="菜单授权" onclick="javascript:qxcdSq('${qxcd.qxdm}','${qxcd.fqxdm}');"></div>
		         <c:forEach items="${anglb_list}" var="anglb" varStatus="statu">
		         	<c:choose>
		         		<c:when test="${anglb.tcfs eq 'iFrame'}"><div class="cz_button ${anglb.icon}" title="${anglb.title}" onclick="javascript:yl('${anglb.fwlj}');"></div></c:when>
		         		<c:otherwise><a class="cz_button ${anglb.icon}" title="${anglb.title}" target="${anglb.tcfs}" href="${anglb.fwlj}"></a></c:otherwise>
		         	</c:choose>
		         	
		         </c:forEach>
		         <div class="cz_button cz5_1" title="创建页面" onclick="javascript:updDiv('${qxcd.id}','${qxcd.qxmc}','${qxcd.qxdm}');"></div>
		      </td>
	        </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
    <div class="clr"></div>
  </div>
</div>


<!-- 添加权限菜单 -->
<div id="add" style="display:none; width: 450px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form name="form1" id="form1" method="post">
    <input type="hidden" id="qxcd_addOrUpd" value="" />
    <input type="hidden" id="qxdm" value="" name="qxdm" />
    <div class="popup">
      <div class="Floatleft Pct100 mb10">
        <div class="popup_left">添加/修改</div>
        <a href="#" class="btn_close" onclick="javascript:BOX_remove('add');"></a>
      </div>
      <div class="clr"></div>
      <table width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
        <tr>
          <th>菜单名称：</th>
          <td align="left"><input type="text" name="qxmc" id="qxmc"  dataType="Limit" min="1" max="100" msg="<br/>请填写菜单名称(100字符之内)" />
            <span class="red">*</span>
          </td>
        </tr>
        <tr>
          <th>父级菜单：</th>
           <td align="left"><select name="fqxdm" id="fqxdm" onchange="mySel(this);"> </select>
             <span class="red">*</span>
           </td>
        </tr>
        <tr>
          <th>访问路径：</th>
          <td align="left"><input  style="width: 75%!important;float:left" type="text" name="fwlj" id="fwlj" dataType="Limit" min="1" max="100" msg="100字符之内" Require="false" /><div   class="addlist_button1  " style="float:left;width: 22%" ><a  href="javascript:void(0);" onclick="addzntbcd()" title="选择" ><span>选择</span></a></td>
        </tr>
        <tr>
          <th>ICON：</th>
          <td align="left"><input type="text" name="icon" id="icon"/></td>
        </tr>
        
        <tr>
          <th> 可用否：</th>
          <td align="left">
            <select name="kyf" id="kyf">
              <option value="1">可用</option>
              <option value="0">不可用</option>
            </select><span class="red">*</span>
          </td>
        </tr>
        <tr>
          <td colspan="2" align="center"><div class="addlist_button1" style="float:right"><a href="#"  title="取消" onclick="javascript:BOX_remove('add');" ><span>取消</span></a> </div>
          <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:void(0);" onclick="javascript:addOrUpt();" title="保存" ><span>保存</span></a> </div></td>
        </tr>
      </table>
      <div class="clr"></div>
    </div>
  </form>
</div>

<!-- 为角色添加权限菜单 -->
<div id="add_jsqx" style="display:none; width: 400px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <div class="popup">
    <div class="Floatleft Pct100 mb10">
      <div class="popup_left">选择此菜单要分配的角色</div>
      <a href="#" class="btn_close" onclick="javascript:closeDiv('add_jsqx');"></a>
    </div>
    <div class="clr"></div>
    <div  style="max-height:450px; overflow-y:auto; overflow-x:hidden;">
      <table width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse" id="table_js">
      </table>
    </div>
    <div class="clr"></div>
  </div>
</div>

<!-- 为角色添加权限菜单 -->

<div id="add_ryjsqxb" style="display:none; width: 800px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <div class="popup">
    <div class="Floatleft Pct100 mb10">
      <div class="popup_left">选择此菜单要分配的角色</div>
      <a href="#" class="btn_close" onclick="javascript:closeDiv('add_ryjsqxb');"></a>
    </div>
    <div class="clr"></div>
    <div class="Floatleft Pct100 ">
	  <iframe id="iframename" name="iframename" src="" border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%; height: 500px;" frameborder="0" allowTransparency="true"></iframe>
    </div>
    <div class="clr"></div>
  </div>
  </div>
<div id="add_zntb" style="display:none; width: 500px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <div class="popup">
    <div class="Floatleft Pct100 mb10">
      <div class="popup_left">选择此菜单要分配的角色</div>
      <a href="#" class="btn_close" onclick="javascript:BOX_remove('add_zntb');"></a>
    </div>
    <div class="clr"></div>
    <div class="Floatleft Pct100 ">
	  <iframe id="zntbiframe" name="zntbiframe" src="" border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%; height: 500px;" frameborder="0" allowTransparency="true"></iframe>
    </div>
    <div class="clr"></div>
  </div>
</div>

<!-- 创建页面 -->
<div id="addPage" style=" height: 500px;overflow: auto;display:none; width: 900px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
<form name="pageForm" id="pageForm" method="post">
	  <input name="zt" id="ff_zt" type="hidden"/>
	  <input name="qxid" id="ff_qxdm" type="hidden"/>
    <div class="popup">
      <div class="Floatleft Pct100 mb10">
        <div class="popup_left" id="divId">修改页面</div>
        <a href="javascript:void(0);" class="btn_close" onclick="javascript:BOX_remove('addPage');"></a>
      </div>
      <div class="clr"></div>
    
        <table id="divtab" width="100%" cellpadding="0" cellspacing="0" class="addlist" style="border-collapse:collapse">
            <tr>
                <th width="150">页面名称：</th>
                <input type="hidden" name="id" id="ff_pageid"/>
                <td align="left"><input type="text" name="pagename" id="ff_pagename" style="width: 95%;margin: 0 6px;" /><span class="red">*</span></td>
            </tr>
            <tr>
                <th>显示列名：</th>
                <td align="left"><input type="text" name="columnname" id="ff_columnname" style="width: 95%;margin: 0 6px;" /><span class="red">*</span></td>
            </tr>
            <tr>
                <th>是否分页：</th>
                <td align="left"><input type="checkbox" name="sffy" id="ff_sffy" style="width: 95%;margin: 0 6px;" value="1" /></td>
            </tr>
            <tr>
                <th>查询SQL：</th>
                <td align="left"><input type="text" name="sql" id="ff_sql"  style="width: 95%;margin: 0 6px;" /><span class="red">*</span></td>
            </tr>
            <tr>
                <th>SQL(带条件)：</th>
                <td align="left"><input type="text" name="sqlwhere" id="ff_sqlwhere"  style="width: 95%;margin: 0 6px;"/><span class="red">*</span></td>
            </tr>
            <tr>
                <th>查询条件：</th>
                <td align="left" class="colon-bottom-p">
                <span onclick="colon()" style="cursor:pointer;display:block;margin-left:6px;margin-top:6px;margin-bottom:15px;width:80px;background: #50b3ee none repeat scroll 0 0;border-radius: 3px;color: #ffffff;border:none;text-decoration: none;text-align:center;">新增</span>
                <p class="bix-colon" style="margin:15px;">
                    <span>类型：</span>
                	<select name="lx"  style="width: 95%;margin: 0 6px;" >
                		<option value="1">文本框</option>
                		<option value="2">下拉框</option>
                	</select>
                	<span>表名：</span><input type="text" name="tablename" id="" value="-1" style="width:12%!important;"/>
                	<span>属性(DM)：</span><input type="text" name="sxdm" id="" value="-1" style="width:10%!important;"/>
                	<span>属性(MC)：</span><input type="text" name="sxmc" id="" value="-1" style="width:10%!important;"/>
                	<span>标题：</span><input type="text" name="bt" id="" value="" style="width:16%!important;"/>
                </p>
                </td>
            </tr>
            <tr>
                <th>功能列表：</th>
				<td align="left" id="gnlbTd">
				<span onclick="addgnlb()" style="cursor:pointer;display:block;margin-left:6px;margin-top:6px;margin-bottom:15px;width:80px;background: #50b3ee none repeat scroll 0 0;border-radius: 3px;color: #ffffff;border:none;text-decoration: none;text-align:center;">新增</span>
                <p class="bix-colon" style="margin:15px;">
                    <span>选择功能：</span>
	                <select name="gnlb" id="gnlb" class="selectpicker"  multiple>
		            	<c:forEach items="${gnList}" var="map" varStatus="status">
				      		<option value='${map.GNID}'>${map.GNMC}</option>
				      </c:forEach>
		           	</select>
                	<span>跳转链接：</span><input type="text" name="tzlj" value="" style="width: 95%;margin: 0 6px;"/>
                </p>
                </td>
            </tr>
            <tr>
                <th>行内功能列表：</th>
				<td align="left" id="hngnlbTd">
				<span onclick="addhngnlb()" style="cursor:pointer;display:block;margin-left:6px;margin-top:6px;margin-bottom:15px;width:80px;background: #50b3ee none repeat scroll 0 0;border-radius: 3px;color: #ffffff;border:none;text-decoration: none;text-align:center;">新增</span>
                <p class="bix-colon" style="margin:15px;">
                    <span>选择功能：</span>
	                <select name="hngnlb" id="hngnlb" class="selectpicker"  multiple>
		            	<c:forEach items="${hngnList}" var="map" varStatus="status">
				      		<option value='${map.GNID}'>${map.GNMC}</option>
				      </c:forEach>
		           	</select>
                	<span>跳转链接：</span><input type="text" name="hntzlj" value="" style="width: 95%;margin: 0 6px;"/>
                </p>
                </td>
            </tr>
            <tr>
                <td colspan="2">
		            <div class="addlist_button1" style="float:right"><a href="javascript:BOX_remove('addPage');" ><span>取消</span></a> </div>
		            <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:addPage();" title="保存" ><span>保存</span></a> </div>
                </td>
            </tr>
        </table>
        <div class="clr"></div>
    </div>
</form>
</div>
<!-- end -->
<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>

<div id="upload" style="display:none; width: 1000px;border: 6px solid #ddd;
-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;
box-shadow: 0px 0px 5px #000;
-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form name="ff" method="post" id="ff">
	<div class="popup">
      <div class="Floatleft Pct100 mb5">
        <div class="popup_left">从本地上传</div>
        <a href="javascript:void(0);" class="btn_close" onclick="javascript:BOX_remove('upload');"></a>
      </div>
      <div class="clr"></div>
      <input type="hidden" name="fake_btn" id="fake_btn" /><%--   触发上传附件button  --%>
      <table  width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse"  class="addlist"  >
         <tr>
		        	<th width="10%" >附件：</th>
		        	<td colspan="3"  width="80%">
		       	 		<div id="div_fj">
		            		<div style="padding: 10px 10px 10px 0;" >
		              			<span>最多只能上传1个附件，并且每个附件不超过10M</span>
		             			  <div id="uploader" >
		                 			 <p>您的浏览器未安装 Flash, Silverlight, Gears, BrowserPlus 或者支持 HTML5 .</p>
		             		      </div>
		            		</div>
		       	 		</div>
		            </td>
		        </tr>
        <tr>
          <td colspan="2" align="center"><div class="addlist_button1" style="float:right"><a href="javascript:void(0);"  title="取消" onclick="javascript:BOX_remove('upload');" ><span>取消</span></a> </div>
            <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:void(0);" onclick="testData()" title="保存" ><span>保存</span></a></div>
          </td>
        </tr>
      </table>
      <div class="clr"></div>
    </div>
  </form>
</div>

<div id="drzDiv" style="display:none; width: 300px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <div class="popup">
     <table  border="0" width="100%" cellpadding="0" cellspacing="0" >
      <tr>
         <td align="center" valign="middle" height="100px"><img src="<%=path%>/resources/style/blue/images/loading.gif" /><br /><br /><font id="message" class="FONT12 red LH30"></font></td>
      </tr>
     </table>
    <div class="clr"></div>
  </div>
</div>

<div id="add_an" style="display:none; width: 800px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <div class="popup">
    <div class="Floatleft Pct100 mb10">
      <div class="popup_left">按钮维护</div>
      <a href="#" class="btn_close" onclick="javascript:closeDiv('add_an');"></a>
    </div>
    <div class="clr"></div>
    <div class="Floatleft Pct100 ">
	  <iframe id="iframename_an" name="iframename_an" src="" border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%; height: 400px;" frameborder="0" allowTransparency="true"></iframe>
    </div>
    <div class="clr"></div>
  </div>
</div>

<div id="yl" style="display:none; width: 800px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <div class="popup">
    <div class="Floatleft Pct100 mb10">
      <div class="popup_left"></div>
      <a href="#" class="btn_close" onclick="javascript:BOX_remove('yl');"></a>
    </div>
    <div class="clr"></div>
    <div class="Floatleft Pct100 ">
	  <iframe id="iframename_yl" name="iframename_yl" src="" border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%; height: 400px;" frameborder="0" allowTransparency="true"></iframe>
    </div>
    <div class="clr"></div>
  </div>
</div>
<div id="setting"></div>
</body>
</html>


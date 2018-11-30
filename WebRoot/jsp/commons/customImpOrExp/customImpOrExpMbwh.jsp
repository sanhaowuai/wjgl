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
<script type="text/javascript">
	//查询自定义导入导出
	function cxjssb(){
		document.cxform.action="<%=path%>/customImpOrExp/queryCustomImpOrExp";
		document.cxform.submit();
	}

	//维护模板
	function viewJsxxsb(id){
		document.ff.action = "<%=path%>/customImpOrExp/customImpOrExpMbwh?id="+id;
	    document.ff.submit();
	}
	function addmbxx(sqid){
	 	BOX_show('xzjsxmDiv');
	}
	
	//保存模板信息
	function bcmbxx(){
        var ywmc = $('#curywmc').val();
        var tablename = $('#curtablename').val();
        var imptype = $('#curimptype').val();
        if(ywmc =='' || ywmc==null){
        	alert('请填写业务名称！');
        	return;
        }else{
           $('#addywmc').val(ywmc);
        }
        if(tablename =='' ||tablename==null ){
            alert('请填写表名称');
            return;
        }else{
           $('#tablename').val(tablename);
        }
         if(imptype =='' ||imptype==null ){
            alert('请选择属性类型');
            return;
        }else{
           $('#imptype').val(imptype);
        }
        
       // if(isCheck('curjsdm') == false){
       // 	alert("请选择要添加的角色");
       // 	return;
	    //}
	    var xzjsxmform = $('#cxform');
		var url="<%=path%>/customImpOrExp/saveMbxx";
		xzjsxmform.ajaxSubmit({
			url: url,
			type:"post",
			contentType: "application/x-www-form-urlencoded; charset=utf-8",
			dataType : "text",
			success: function (data) {
	 				 if(data=="1"){
	 					alert("保存成功！");
		 			}else if(data=="0"){
	 					alert("保存失败，请重试！");
		 			}
	 				document.cxform.action="<%=path%>/customImpOrExp/queryCustomImpOrExp";
					document.cxform.submit();
			},
			error:function(data){
				alert("保存获奖信息失败，请重试！");
			}
		});	
	}

function xsoryc(xsoryc,index){
  var sfxlzjxsoryc = '#sfxlzjxsoryc'+index;
  var sfzj = '#sfzjs'+index;
  if(xsoryc=='1'){
      //$(sfzj).attr("checked","checked");
	  $(sfxlzjxsoryc).show();
  }else{
	  $(sfxlzjxsoryc).hide();
  }
}

function addIndex(){
	  $("#addIndex").before(function(){ 
	      var index = $("#addIndex").index();
	      var gznrIndex = 'upgznr'+index;
	      var xsIndex = 'upxs'+index;
	      var checkIndex = 'upch'+index;
	      return "<tr id="+gznrIndex+"><th width='150px;'>工作内容：</th>" 
	     +"<td align='left'><textarea style='width: 460px!important' name='upgznr' cols=60 dataType='Require' Msg='必填'></textarea></td>"
	     +"<td align='left' width='50px;' rowspan='2'><div class='addlist_button1' style='float:left' ><a href='javascript:void(0);' onclick='javascript:delGznr2("+index+");'><span>删除</span></a></div></td> </tr>"
	     +"<tr id="+xsIndex+"><th width='90px;'>学时：</th>"
	     +"<td align='left'><input onchange='checkxs("+index+")' style='width: 460px!important' type='text' id="+checkIndex+" name='upxs' cols=60 dataType='Require' Msg='必填'/></td></tr>";
	    });  
}


function curaddrows(id){
	window.parent.$("#saveImpCol").hide();
	var tollength = $('#selTbl tr').length;
    var curlength = tollength-2;//去掉表头和，最后js添加标记行
    var columnenIndex = '';
    var columnenVal = '';
    for(var i=1;i<=curlength;i++ ){
    	columnenIndex = 'column_en'+i; 
        if(i!=curlength){
        	columnenVal= columnenVal+$('#'+columnenIndex+' option:selected').val()+',';
        }else{
        	columnenVal= columnenVal+$('#'+columnenIndex+' option:selected').val();
        }
    }
  	var src = "<%=path%>/customImpOrExp/queryTjzdList?id="+id+"&columnenVal="+columnenVal;
	$("#tjzdiframe").attr("src",src);    
	BOX_show('tjzdDiv');
}

function zncun(){
	var id = '${id}';
    $("#tjzdiframe")[0].contentWindow.$('input:checkbox[name=ids]:checked').each(function(i){
         var colandCurIndex=$(this).val();
         var columnVal = colandCurIndex.split('-')[0];
         var curIndexVal = colandCurIndex.split('-')[1];
         var cdIndex = '#cd'+curIndexVal;
         var zhIndex = '#zh'+curIndexVal;
         var lxIndex = '#lx'+curIndexVal;
         var sfzjIndex = '#sfzj'+curIndexVal;
         var curCdVal =$("#tjzdiframe")[0].contentWindow.$(cdIndex).val(); 
         var curZhVal =$("#tjzdiframe")[0].contentWindow.$(zhIndex).val(); 
         var curLxVal =$("#tjzdiframe")[0].contentWindow.$(lxIndex).val(); 
         if("VARCHAR2" !=curLxVal && "DATE"!=curLxVal && "NUMBER"!=curLxVal){
         	curLxVal="varchar2";
         }
         var curSfzjVal =$("#tjzdiframe")[0].contentWindow.$(sfzjIndex).val(); 
    	 var index='';
    	 $("#addIndex").before(function(){ 
          index = $("#addIndex").index();
          var rowIndex='row'+index;
	      var sfxlzjxsoryc = 'sfxlzjxsoryc'+index;
	      var sfxlzj = 'sfxlzj'+index;
	      var sfxlzjs = 'sfxlzjs'+index;
	      var sfxlzjf = 'sfxlzjf'+index;
	      var sfzj = 'sfzj'+index;
	      var curSfzjMesgs = '';
          var curSfzjMesgf = '';
          if('1'==curSfzjVal ){
         	curSfzjMesgs="<input type='radio' name='"+sfzj+"' id='sfzjs"+index+"' value='1' checked='checked'/><span >是</span>&nbsp;&nbsp;"
         	curSfzjMesgf="<input type='radio' name='"+sfzj+"' id='sfzjf"+index+"' value='0' /><span>否</span>"	
          }else{
         	curSfzjMesgs="<input type='radio' name='"+sfzj+"' id='sfzjs"+index+"' value='1'/><span >是</span>&nbsp;&nbsp;"
         	curSfzjMesgf="<input type='radio' name='"+sfzj+"' id='sfzjf"+index+"' value='0' checked='checked'/><span>否</span>"	
          }
	      
	      return " <tr id='"+rowIndex+"'><td style='width: 10%'><div style='display: inline;float: none;text-align: center;'>"
  				+"<select name='column_en' id='column_en"+index+"' style='width: 10%' disabled='disabled'>"
  				+" <option value='"+columnVal+"'selected='selected'>"+columnVal+"</option></select></div></td>"
  				+"<td style='width: 10%'>"
  				+"<input type='text' name='column_zh' id='column_zh"+index+"' value='"+curZhVal+"' style='color: black;width:150px;text-align: center;'/></td>"
  				+"<td style='width: 10%'>"
			    +"<input type='text' name='column_cd' id='column_cd"+index+"' value='"+curCdVal+"' style='color: black;width:50px;text-align: center;' readonly='readonly'/></td>" 
			    +"<td style='width: 10%'>"
			    +"<select name='column_lx' id='column_lx"+index+"' style='width: 10%' disabled='disabled'>"
	        	+" <option value='"+curLxVal+"'selected='selected'>"+curLxVal+"</option></select></td>"   		   	
  				+"<td style='width: 10%'>"
  				+curSfzjMesgs
  				+curSfzjMesgf
  				+"</td>"
  				+" <td style='width: 30%'>"
  				+"<input type='radio' name='"+sfxlzj+"' id='"+sfxlzjs+"' onchange='xsoryc(1,"+index+");' value='1'/><span >是</span>&nbsp;&nbsp;"
			    +"<input type='radio' name='"+sfxlzj+"' id='"+sfxlzjf+"' onchange='xsoryc(0,"+index+");' value='0' checked='checked' /><span>否</span>"
			    +"<font id='"+sfxlzjxsoryc+"' style='display: none;' class='ml5'>序列名称:<input style='width: 30%!important;' id='xlmc"+index+"' name='xlmc' value='' type='text'/></font>" 
  				+"</td>"
  				+"<td style='width: 10%'><div style='display: inline;float: none;text-align: center;'>"
  				+"<select name='dmbmc' id='dmbmc"+index+"' style='width: 10%'></select></div></td>"
	       		+"<td align='center'>"
	          	+"<div class='addlist_button1 ml5' style='text-align: center;'> <a href='javascript:void(0);' onclick='delRow("+index+");'><span>删&nbsp;&nbsp;除</span></a> </div>"
	       		+"</td>"
  				+"</tr>";					
      });
     		    var cxform = $('#cxform');
				var url="<%=path%>/customImpOrExp/queryDmbmc";
				cxform.ajaxSubmit({
				url: url,
				type:"post",
				contentType: "application/x-www-form-urlencoded; charset=utf-8",
				dataType : "text",
				success: function (responseText) {
		  			var optionIndex = '#dmbmc'+index;
		    		$(optionIndex).empty();
			  		$opf=$('<option value="">--请选择--</option>');
			  		$(optionIndex).append($opf);
			  		var jsonObj=eval("("+responseText+")");
			  		$.each(jsonObj,function(i,item){
			  		$op=$("<option value='"+item.tablename+"'>"+item.tablename+"</option>");
			  		$(optionIndex).append($op);
			  		});
		  		},
				error:function(data){
					alert("获取信息失败，请重试！");
				}
			});		
      window.parent.$("#saveImpCol").show();
      BOX_remove('tjzdDiv');
     
    });
    
    
      
      
}


function removecurck(index){
	window.parent.$("#saveImpCol").show();
	BOX_remove(index);
}



function addrows(id){
	var cxform = $('#cxform');
	var url="<%=path%>/customImpOrExp/addrows?id="+id;
	cxform.ajaxSubmit({
		url: url,
		type:"post",
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		dataType : "text",
		success: function (responseText) {
		 var index='';
 		 $("#addIndex").before(function(){ 
	      index = $("#addIndex").index();
	      var rowIndex='row'+index;
	      var sfxlzjxsoryc = 'sfxlzjxsoryc'+index;
	      var sfxlzj = 'sfxlzj'+index;
	      var sfxlzjs = 'sfxlzjs'+index;
	      var sfxlzjf = 'sfxlzjf'+index;
	      var sfzj = 'sfzj'+index;
	      return " <tr id='"+rowIndex+"'><td style='width: 10%'><div style='display: inline;float: none;text-align: center;'>"
  				+"<select name='column_en' id='column_en"+index+"' style='width: 10%'></select></div></td>"
  				+"<td style='width: 10%'>"
  				+"<input type='text' name='column_zh' id='column_zh"+index+"' value='' style='color: black;width:150px;text-align: center;'/></td>"
  				+"<td style='width: 10%'>"
			    +"<input type='text' name='column_cd' id='column_cd"+index+"' value='${obj.column_cd}' style='color: black;width:50px;text-align: center;'/></td>" 
			    +"<td style='width: 10%'>"
			    +"<select name='column_lx' id='column_lx"+index+"' style='width: 10%'>"
			    +"<option value=''>--请选择--</option>"
	        	+"<option value='varchar2'>varchar2</option>"
	        	+"<option value='number'>number</option>"
	        	+"<option value='date'>date</option></td>"   		   	
  				+"<td style='width: 10%'>"
  				+"<input type='radio' name='"+sfzj+"' id='sfzjs"+index+"' value='1'/><span >是</span>&nbsp;&nbsp;"
  				+"<input type='radio' name='"+sfzj+"' id='sfzjf"+index+"' value='0' checked='checked' /><span>否</span>"
  				+"</td>"
  				+" <td style='width: 30%'>"
  				+"<input type='radio' name='"+sfxlzj+"' id='"+sfxlzjs+"' onchange='xsoryc(1,"+index+");' value='1'/><span >是</span>&nbsp;&nbsp;"
			    +"<input type='radio' name='"+sfxlzj+"' id='"+sfxlzjf+"' onchange='xsoryc(0,"+index+");' value='0' checked='checked' /><span>否</span>"
			    +"<font id='"+sfxlzjxsoryc+"' style='display: none;' class='ml5'>序列名称:<input style='width: 30%!important;' id='xlmc"+index+"' name='xlmc' value='' type='text'/></font>" 
  				+"</td>"
  				+"<td style='width: 10%'><div style='display: inline;float: none;text-align: center;'>"
  				+"<select name='dmbmc' id='dmbmc"+index+"' style='width: 10%'></select></div></td>"
	       		+"<td align='center'>"
	          	+"<div class='addlist_button1 ml5' style='text-align: center;'> <a href='javascript:void(0);' onclick='delRow("+index+");'><span>删&nbsp;&nbsp;除</span></a> </div>"
	       		+"</td>"
  				+"</tr>";
	    });
	     		var optionIndex = '#column_en'+index;
	    		$(optionIndex).empty();
		  		$opf=$('<option value="">--请选择--</option>');
		  		$(optionIndex).append($opf);
		  		var jsonObj=eval("("+responseText+")");
		  		$.each(jsonObj,function(i,item){
		  		$op=$("<option value='"+item.column_name+"'>"+item.column_name+"</option>");
		  		$(optionIndex).append($op);
		  		});
		  		var cxform = $('#cxform');
				var url="<%=path%>/customImpOrExp/queryDmbmc";
				cxform.ajaxSubmit({
				url: url,
				type:"post",
				contentType: "application/x-www-form-urlencoded; charset=utf-8",
				dataType : "text",
				success: function (responseText) {
		  			var optionIndex = '#dmbmc'+index;
		    		$(optionIndex).empty();
			  		$opf=$('<option value="">--请选择--</option>');
			  		$(optionIndex).append($opf);
			  		var jsonObj=eval("("+responseText+")");
			  		$.each(jsonObj,function(i,item){
			  		$op=$("<option value='"+item.tablename+"'>"+item.tablename+"</option>");
			  		$(optionIndex).append($op);
			  		});
		  		},
				error:function(data){
					alert("获取信息失败，请重试！");
				}
			});		
		  		
		},
		error:function(data){
			alert("获取信息失败，请重试！");
		}
	});		
}
 function delRow(Index){
   var rowIndex = '#row'+Index;
   $(rowIndex).remove();
   var tollength = $('#selTbl tr').length;
   
   var column_en = document.getElementsByName("column_en");
   for(var i=0;i<column_en.length;i++){
        var k=i+1;
        column_en[i].id='column_en'+k;
   }
   var column_zh = document.getElementsByName("column_zh");
   for(var i=0;i<column_zh.length;i++){
        var k=i+1;
        column_zh[i].id='column_zh'+k;
   }
   var column_cd = document.getElementsByName("column_cd");
   for(var i=0;i<column_cd.length;i++){
        var k=i+1;
        column_cd[i].id='column_cd'+k;
   }
   var column_lx = document.getElementsByName("column_lx");
   for(var i=0;i<column_lx.length;i++){
        var k=i+1;
        column_lx[i].id='column_lx'+k;
        
   }
   
   var sfxlzjxsoryc = document.getElementsByName("sfxlzjxsoryc");
   for(var i=0;i<sfxlzjxsoryc.length;i++){
        var k=i+1;
        sfxlzjxsoryc[i].id='sfxlzjxsoryc'+k;
        
   }
   var dmbmc = document.getElementsByName("dmbmc");
   for(var i=0;i<dmbmc.length;i++){
        var k=i+1;
        dmbmc[i].id='dmbmc'+k;
        
   }
    var xlmc = document.getElementsByName("xlmc");
   for(var i=0;i<xlmc.length;i++){
        var k=i+1;
        xlmc[i].id='xlmc'+k;
        
   }
  
   var sfzjzjf = document.getElementsByClassName("sfzjf");
   for(var i=0;i<sfzjzjf.length;i++){
        var k=i+1;
        sfzjzjf[i].name='sfzj'+k;
        sfzjzjf[i].id='sfzjf'+k;
   }
   var sfzjzjs = document.getElementsByClassName("sfzjs");
   for(var i=0;i<sfzjzjs.length;i++){
        var k=i+1;
        sfzjzjs[i].name='sfzj'+k;
        sfzjzjs[i].id='sfzjs'+k;
   }

   var sfxlzjf = document.getElementsByClassName("sfxlzjf");
   for(var i=0;i<sfxlzjf.length;i++){
        var k=i+1;
        sfxlzjf[i].name='sfxlzj'+k;
        sfxlzjf[i].id='sfxlzjf'+k;
        sfxlzjf[i].setAttribute("onchange", "javascript:xsoryc('0',"+k+");"); 
   }
   var sfxlzjs = document.getElementsByClassName("sfxlzjs");
   for(var i=0;i<sfxlzjs.length;i++){
        var k=i+1;
        sfxlzjs[i].name='sfxlzj'+k;
        sfxlzjs[i].id='sfxlzjs'+k;
        sfxlzjs[i].setAttribute("onchange", "javascript:xsoryc('1',"+k+");"); 
   }
   
 }
 function cursaveMesg(){
   window.parent.saveImpCol();
 }
</script>
</head>

<body>

<div class="Contentbox">
  <div class="mainbg"></div>
  <div class="pd10">
	 <div class="clr"></div>
    <form name="cxform" method="post" id="cxform" >
    	<div class="butsea">
    		
	   		<table border="0" cellpadding="0" cellspacing="0" width="100%">
	            <tr>
	          	<td height="35px"align="right" width="25%"> 
	            	<div style="display: inline;text-align: right;">
	        			业务名称:&nbsp;
	        		</div>
	            </td>
	          	<td height="35px"align="left" width="15%"> 
		          	<div style="display: inline; text-align: left;">
	        			 <input value="${customImpOrExp.ywmc}" name="curywmc" id='curywmc' type="text" style="color: black;width:150px!important;text-align: left;"/>  
        			</div>
		          </td>
		          <td height="35px"align="right" width="25%"> 
	            	<div style="display: inline;text-align: right;">
	        				表名:&nbsp;
	        		</div>
	            </td>
		          <td height="35px"align="left" width="35%"> 
		          	<div style="display: inline;text-align: left;">
	        			 <input value="${customImpOrExp.tablename}" name="curtablename" id='curtablename' type="text" style="color: black;width:150px!important;text-align: left" readonly="readonly"/>  
        			</div>
		          </td>
	          
	          </tr>
	          
	           <tr>
		          	<td height="35px"align="right"> 
	            		<div style="display: inline;text-align: right;">
	        				属性:&nbsp;
	        			</div>
	            	</td>
		          <td height="35px"align="left"> 
		          	<div style="display: inline;">
	        			<select name="curimptype" id="curimptype" style="width: 150px!important;">
			        			<option value="">-请选择-</option>
			        			<option value="增加" <c:if test="${customImpOrExp.imptype=='增加'}">selected=selected</c:if>>增加</option>
			        			<option value="修改" <c:if test="${customImpOrExp.imptype=='修改'}">selected=selected</c:if>>修改</option>
	        			</select>
        			</div>
		          </td>
		          <!-- 
			          <td height="35px"align="right"> 
		            		<div style="display: inline;text-align: right;">
		        				角色:&nbsp;
		        			</div>
		              </td>
			          <td height="35px"align="left"> 
			          	<div style="display: inline;">
				          	<c:forEach items="${jsList}" var="js" varStatus="status">
		        			 	<input type="checkbox" name="curjsdm" id='curjsdm' value="${js.jsdm}" style="color: black;width:150px;text-align: center;" <c:if test="${js.sfxz=='1'}">checked=checked</c:if>/> ${js.jsmc}  
							   		<br />
				          	</c:forEach>
	        			</div>
			          </td>
		           -->
		          
	          </tr>
	          <tr>
	          	<td height="35px" width="20%" align="right" colspan="10">
	              	<div class="addlist_button1 ml5" style="float: right;"> <a href="javascript:void(0);" onclick="curaddrows('${customImpOrExp.id}');"><span>添&nbsp;&nbsp;加</span></a> </div>
	              	<div class="addlist_button1 ml5" style="float: right;"> <a href="javascript:void(0);" onclick="cursaveMesg();"><span>保存模板字段</span></a> </div>
	            </td>
	         </tr>
	        </table>
		</div>
	<div class="clr"></div>
	  <div class="list">
      <table id="selTbl" width="100%" cellpadding="0" cellspacing="0" class="bot_line" style="border-collapse:collapse;text-align: center;">
        <tr>
          <th style="text-align: center;">列</th>
          <th style="text-align: center;">列名</th>
          <th style="text-align: center;">长度</th>
          <th style="text-align: center;">类型</th>
          <th style="text-align: center;">是否主键</th>
          <th style="text-align: center;">是否序列增加</th>
          <th style="text-align: center;">代码表</th>
          <th style="text-align: center;">操作</th>
        </tr>
	     <c:choose>
	     	<c:when test="${not empty impColList}">
	     		<c:forEach items="${impColList}" var="obj" varStatus="status">
	     		 <tr id="row${status.index+1 }">
			       	<td style="width: 10%">
		       			<div style="display: inline;float: none;text-align: center;">
		        			<select name="column_en" id="column_en${status.index+1 }" style="width: 10%" disabled="disabled">
				        			<option value="">--请选择--</option>
				        		<c:forEach items="${tabColumns}" var="ta">
				        			<option value="${ta.column_name}"<c:if test="${obj.column_en==ta.column_name}">selected=selected</c:if>>${ta.column_name}</option>
				        		</c:forEach>
		        			</select>
		       			</div>
			       	</td>
			       	<td style="width: 10%">
			       		<input type="text" name="column_zh" id="column_zh${status.index+1 }" value="${obj.column_zh}" style="color: black;width:150px;text-align: center;"/> 
			       	</td>
			       	<td style="width: 10%">
			       	    <c:choose>
			       	    	<c:when test="${not empty obj.column_cd}">
					       		<input type="text" name="column_cd" id="column_cd${status.index+1 }" value="${obj.column_cd}" style="color: black;width:50px;text-align: center;" readonly="readonly"/> 
			       	    	</c:when>
			       	    	<c:otherwise>
					       		<input type="text" name="column_cd" id="column_cd${status.index+1 }" value="${obj.data_length}" style="color: black;width:50px;text-align: center;" readonly="readonly"/> 
			       	    	</c:otherwise>
			       	    </c:choose>
			       	    
			       	</td>
			       
			       	<td style="width: 10%">
			       		<select name="column_lx" id="column_lx${status.index+1 }" style="width: 10%" disabled="disabled">
				        		<option value="">--请选择--</option>
				        		<option value="varchar2"<c:if test="${obj.column_lx=='varchar2'}">selected=selected</c:if>>varchar2</option>
				        		<option value="number"<c:if test="${obj.column_lx=='number'}">selected=selected</c:if>>number</option>
				        		<option value="date"<c:if test="${obj.column_lx=='date'}">selected=selected</c:if>>date</option>
		        		</select>
			       	</td>
			       	<td style="width: 10%">
			      		<input type="radio" name="sfzj${status.index+1 }" class="sfzjs"  id="sfzjs${status.index+1 }" value="1"<c:if test="${obj.sfzj=='1'}">checked="checked"</c:if>/><span >是</span>&nbsp;&nbsp;
					    <input type="radio" name="sfzj${status.index+1 }" class="sfzjf" id="sfzjf${status.index+1 }" value="0" <c:if test="${obj.sfzj=='0'}">checked="checked"</c:if> /><span>否</span>
			       	</td>
			       	 <td style="width: 30%">
			       	 	<input type="radio" name="sfxlzj${status.index+1 }" class="sfxlzjs" id="sfxlzjs${status.index+1 }" onchange="xsoryc(1,'${status.index+1 }');" value="1" <c:if test="${obj.sfxlzj=='1'}">checked="checked"</c:if>/><span >是</span>&nbsp;&nbsp;
					    <input type="radio" name="sfxlzj${status.index+1 }" class="sfxlzjf" id="sfxlzjf${status.index+1 }" onchange="xsoryc(0,'${status.index+1 }');" value="0" <c:if test="${obj.sfxlzj=='0'}">checked="checked"</c:if>/><span>否</span>
					    <c:choose>
					    	<c:when test="${obj.sfxlzj=='1'}">
							    <font id="sfxlzjxsoryc${status.index+1 }" class="ml5" name="sfxlzjxsoryc">序列名称:<input style="width: 30%!important;" id="xlmc${status.index+1 }" name="xlmc" value="${obj.xlmc}" type="text"/></font> 
					    	</c:when>
					    	<c:otherwise>
							    <font id="sfxlzjxsoryc${status.index+1 }" style="display: none;" class="ml5" name="sfxlzjxsoryc">序列名称:<input style="width: 30%!important;" id="xlmc${status.index+1 }" name="xlmc" value="${obj.xlmc}" type="text"/></font> 
					    	</c:otherwise>	
					    </c:choose>
			       	</td>
			       	<td style="width: 10%">
			       		<select name="dmbmc" id="dmbmc${status.index+1 }" style="width: 10%">
				        			<option value="">--请选择--</option>
				        		<c:forEach items="${impColCheckList}" var="ta">
				        			<option value="${ta.tablename}"<c:if test="${obj.dmbmc==ta.tablename}">selected=selected</c:if>>${ta.tablename}</option>
				        		</c:forEach>
		        		</select>
			       	</td>
			       	<td align="center">
			           <div class="addlist_button1 ml5" style="text-align: center;"> <a href="javascript:void(0);" onclick="delRow('${status.index+1 }');"><span>删&nbsp;&nbsp;除</span></a> </div>
			        </td>
		     </tr>
	     		</c:forEach>
	     	</c:when>
	        <c:otherwise>
	        	<tr id="row1">
			       	<td style="width: 10%">
		       			<div style="display: inline;float: none;text-align: center;">
		        			<select name="column_en" id="column_en1" style="width: 10%">
				        			<option value="">--请选择--</option>
				        		<c:forEach items="${tabColumns}" var="obj" varStatus="status">
				        			<option value="${obj.column_name}">${obj.column_name}</option>
				        		</c:forEach>
		        			</select>
		       			</div>
			       	</td>
			       	<td style="width: 10%">
			       		<input type="text" name="column_zh" id='column_zh1' value="" style="color: black;width:150px;text-align: center;"/> 
			       	</td>
			       	
			       	<td style="width: 10%">
			       		<input type="text" name="column_cd" id="column_cd1" value="" style="color: black;width:50px;text-align: center;"/> 
			       	</td>
			       	<td style="width: 10%">
			       		<select name="column_lx" id="column_lx1" style="width: 10%">
				        		<option value="">--请选择--</option>
				        		<option value="varchar2">varchar2</option>
				        		<option value="number">number</option>
				        		<option value="date">date</option>
		        		</select>
			       	</td>
			       	<td style="width: 10%">
			      		<input type="radio" name="sfzj1" id="sfzjs1" value="1"/><span >是</span>&nbsp;&nbsp;
					    <input type="radio" name="sfzj1" id="sfzjf1" value="0" checked="checked" /><span>否</span>
			       	</td>
			       	 <td style="width: 30%">
			       	 	<input type="radio" name="sfxlzj1" id="sfxlzjs1" onchange="xsoryc(1,1);" value="1"/><span >是</span>&nbsp;&nbsp;
					    <input type="radio" name="sfxlzj1" id="sfxlzjf1" onchange="xsoryc(0,1);" value="0" checked="checked" /><span>否</span>
					    <font id="sfxlzjxsoryc1" style="display: none;" class="ml5">序列名称:<input style="width: 30%!important;" id="xlmc1" name="xlmc1" value="" type="text"/></font> 
			       	</td>
			       	<td style="width: 10%">
			       		<select name="dmbmc" id="dmbmc${status.index+1 }" style="width: 10%">
				        			<option value="">--请选择--</option>
				        		<c:forEach items="${impColCheckList}" var="ta">
				        			<option value="${ta.tablename}"<c:if test="${obj.dmbmc==ta.tablename}">selected=selected</c:if>>${ta.tablename}</option>
				        		</c:forEach>
		        		</select>
			       	</td>
			       	<td align="center">
			           <div class="addlist_button1 ml5" style="text-align: center;"> <a href="javascript:void(0);" onclick="delRow('1');"><span>删&nbsp;&nbsp;除</span></a> </div>
			        </td>
		     </tr>
	        </c:otherwise>
	     </c:choose>
	     <tr id="addIndex">
       	 </tr>
      </table>
      <input type="hidden" id="impColMesg" name="impColMesg"/>
      <input type="hidden" id="curid" name="curid" value="${id}"/>
      <input type="hidden" id="xzzjbs" name="xzzjbs" value="${xzzjbs}"/>
      
      </form>
    </div>
    
	
	 <div class="clr"></div>
  </div>
  
 <div id="tjzdDiv" class="tan_add" style="overflow:auto;display:none;width:700px; background: #fff; border: 3px solid #999;" >
  <div class="tjzdForm" style=" position:relative">
  		<div id="cyjsDiv" style="clear:both;position:absolute;left:7px;top:60px"></div> 
	  <div class="pd10">
	  	 <div class="popup_left" id="qxzName2">添加字段</div>
	     <a href="#" class="btn_close" onclick="javascript:removecurck('tjzdDiv');"></a>
	     <div class="clr"></div>
	  </div>	  
      <div style="float:none; clear:both; overflow:hidden;" >
        <iframe frameborder="0" id="tjzdiframe" name="tjzdiframe" frameborder="0" src="" style="width:680px;height:170px;overflow:hidden;" ></iframe>
      </div>
      <div id="oMainLi  stToolBar" class="wp_toolbar_inner" style=" padding:10px 10px 20px 0;">
          <div class="addlist_button1 ml10" style="float: right" ><a href="javascript:void(0);" onclick="javascript:removecurck('tjzdDiv');return false;" ><span>取消</span></a></div>
          <div class="addlist_button1 ml10" style="float: right" ><a href="javascript:void(0);" onclick="zncun();" ><span>确定</span></a></div>
      	  <div class="clr"></div>
      </div>
     </div>
  </div>

<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"></div>
</body>
</html>


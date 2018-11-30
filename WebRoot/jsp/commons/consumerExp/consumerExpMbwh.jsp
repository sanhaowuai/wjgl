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
<title>自定义导出列表</title>
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
function curaddrows(id){
	window.parent.$("#saveImpCol").hide();
	var tollength = $('#colTab tr').length;
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
  	var src = "<%=path%>/consumerExp/queryTjzdList?id="+id+"&columnenVal="+columnenVal;
	$("#tjzdiframe").attr("src",src);    
	BOX_show('tjzdDiv');
}
function removecurck(index){
	window.parent.$("#saveImpCol").show();
	BOX_remove(index);
}



function xsoryc(xsoryc,index){
  var  sfxlzjxsoryc = '#sfxlzjxsoryc'+index;
  if(xsoryc=='1'){
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

function zncun(){
	//var id = '${id}';
    $("#tjzdiframe")[0].contentWindow.$('input:checkbox[name=ids]:checked').each(function(i){
         var colandCurIndex=$(this).val();
         var columnVal = colandCurIndex.split('-')[0];
         var curIndexVal = colandCurIndex.split('-')[1];
         
         var zhIndex = '#zh'+curIndexVal;
        
         var curZhVal =$("#tjzdiframe")[0].contentWindow.$(zhIndex).val(); 
    	 var index='';
    	 $("#addIndex").before(function(){ 
          index = $("#addIndex").index();
          var rowIndex='row'+index;
	      return " <tr id='"+rowIndex+"'><td style='width: 45%'><div style='display: inline;float: none;text-align: center;'>"
  				+"<select style='text-align: center;' name='column_en' id='column_en"+index+"' style='width: 20%' disabled='disabled'>"
  				+"<option value='"+columnVal+"'selected='selected'>"+columnVal+"</option>"
  				+"</select></div></td>"
  				+"<td style='width: 45%'>"
  				+"<input type='text' name='column_zh' id='column_zh' value='"+curZhVal+"' style='color: black;width:150px;text-align: center;'/></td>"
	       		+"<td align='center'>"
	          	+"<div class='addlist_button1 ml5' style='text-align: center;'> <a href='javascript:void(0);' onclick='delRow("+index+");'><span>删&nbsp;&nbsp;除</span></a> </div>"
	       		+"</td>"
  				+"</tr>";
	    	});
     		   <%--  var cxform = $('#cxform');
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
			});		 --%>
      window.parent.$("#saveImpCol").show();
      BOX_remove('tjzdDiv');
     
    });
      
}

function addrows(){
	var cxform = $('#cxform');
	var url="<%=path%>/consumerExp/addrows";
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
	      return " <tr id='"+rowIndex+"'><td style='width: 45%'><div style='display: inline;float: none;text-align: center;'>"
  				+"<select name='column_en' id='column_en"+index+"' style='width: 20%'></select></div></td>"
  				+"<td style='width: 45%'>"
  				+"<input type='text' name='column_zh' id='column_zh' value='' style='color: black;width:150px;text-align: center;'/></td>"
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
		},
		error:function(data){
			alert("获取信息失败，请重试！");
		}
	});		
}
 function delRow(Index){
   var rowIndex = '#row'+Index;
   $(rowIndex).remove();
 }

 
</script>
</head>

<body>

<div class="Contentbox">
  <div class="mainbg"></div>
  <div class="pd10">
	
	 <div class="clr"></div>
    <form name="cxform" method="post" id="cxform" >
    	<input type="hidden" name="id" id="id" value="${consumerExpEntity.id}" />
    	<div class="">
    		
	   		<table border="0" cellpadding="0" cellspacing="0" width="100%">
	            <tr>
	          	<td height="35px"align="right"> 
	            	<div style="display: inline;text-align: right;">
	        			业务名称:&nbsp;
	        		</div>
	            </td>
	          	<td height="35px"align="left"> 
		          	<div style="display: inline; text-align: left;">
	        			 <input value="${consumerExpEntity.ywmc}" name="ywmc" id='ywmc' type="text" style="color: black;width:150px!important;text-align: left;" maxlength="50"/>  
        			</div>
		          </td>
		          <td height="35px"align="right"> 
	            	<div style="display: inline;text-align: right;">
	        				表:&nbsp;
	        		</div>
	            </td>
		          <td height="35px"align="left"> 
		          	<div style="display: inline;text-align: left;">
	        			 <input value="${consumerExpEntity.tablename}" name="curtablename" id='curtablename' type="text" style="color: black;width:150px!important;text-align: left" readonly='readonly'/>  
	        			 
        			</div>
		          </td>
		         
		         
	          </tr>
	          <!-- 
	           <tr>
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
	          </tr>
	           -->
	          <tr>
	          	<td height="35px" width="20%" align="right" colspan="10">
	              	<div class="addlist_button1 ml5" style="float: right;"> <a href="javascript:void(0);" onclick="curaddrows('${consumerExpEntity.id}');"><span>添&nbsp;&nbsp;加</span></a> </div>
	            </td>
	         </tr>
	        </table>
		</div>
	<div class="clr"></div>
	  <div class="list">
      <table id="colTab" name="colTab" class="addlist" width="100%" cellpadding="0" cellspacing="0" class="bot_line" style="border-collapse:collapse;text-align: center;">
        <tr>
          <th style="text-align: center;">列</th>
          <th style="text-align: center;">列名</th>
          <th style="text-align: center;">操作</th>
        </tr>
        <c:if test="${not empty mapList }">
        	 <c:forEach items="${mapList}" var="col" varStatus="status">
		        <tr id="row${status.index+1 }">
			       	<td style="width: 45%;">
		       			<div style="display: inline;float: none;text-align: center;">
		        			<select style="text-align: center;" name="column_en" id="column_en${status.index+1}" style="width: 20%" disabled="disabled">
				        			<option value="">--请选择--</option>
				        		<c:forEach items="${tabColumns}" var="obj" varStatus="status2">
				        			<option  value="${obj.column_name}" <c:if test="${col.COLUMN_EN eq obj.column_name}">selected=selected</c:if> >${obj.column_name}</option>
				        		</c:forEach>
		        			</select>
		       			</div>
		       			<%-- <input type="text" name="column_en" id='column_en${status.index+1}' value="${col.COLUMN_EN}" style="color: black;width:150px;text-align: center;" readonly="readonly"/> --%>
			       	</td>
			       	<td style="width: 45%">
			       		<input type="text" name="column_zh" id='column_zh' value="${col.COLUMN_ZH}" style="color: black;width:150px;text-align: center;" readonly="readonly"/> 
			       	</td>
			       
			       	<td align="center">
			           <div class="addlist_button1 ml5" style="text-align: center;"> <a href="javascript:void(0);" onclick="delRow('${status.count}');"><span>删&nbsp;&nbsp;除</span></a> </div>
			        </td>
			     </tr>
        	 </c:forEach>
        </c:if>
        <%-- <c:if test="${empty mapList }">
	      <tr id="row1">
	       	<td style="width: 45%;">
       			<div style="display: inline;float: none;text-align: center;">
        			<select name="column_en" id="column_en" style="width: 20%">
		        			<option value="">--请选择--</option>
		        		<c:forEach items="${tabColumns}" var="obj" varStatus="status">
		        			<option value="${obj.column_name}">${obj.column_name}</option>
		        		</c:forEach>
        			</select>
       			</div>
	       	</td>
	       	<td style="width: 45%">
	       		<input type="text" name="column_zh" id='column_zh' value="" style="color: black;width:150px;text-align: center;"/> 
	       	</td>
	       
	       	<td align="center">
	           <div class="addlist_button1 ml5" style="text-align: center;"> <a href="javascript:void(0);" onclick="delRow('1');"><span>删&nbsp;&nbsp;除</span></a> </div>
	        </td>
	     </tr>
	     </c:if> --%>
	     <tr id="addIndex">
       	  </tr>
      </table>
      </form>
    </div>
    
	
	 <div class="clr"></div>
  </div>
</div>

<!-- 添加字段 -->
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


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
<title>北京赢科后台管理系统</title>
<jsp:include page="../../include/css-main-include.jsp"></jsp:include>
<STYLE type="text/css">
  html, body { height:100%; }
  .Contentbox { width:100%; min-height:100%;height:auto }
  *html .Contentbox { height:100% }
</STYLE>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<link rel="stylesheet" href="<%=path%>/resources/js/plupload/jquery.plupload.queue/css/jquery.plupload.queue.css" type="text/css" />
<script type="text/javascript" src="<%=path%>/resources/js/plupload/plupload.full.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/plupload/jquery.plupload.queue/jquery.plupload.queue.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/plupload/i18n/cn.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/plupload/plupload.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript">

$.fn.serializeObject = function() { 
	var o = {}; 
	var a = this.serializeArray(); 
	$.each(a, function() { 
	if (o[this.name]) { 
	if (!o[this.name].push) { 
	o[this.name] = [ o[this.name] ]; 
	} 
	o[this.name].push(this.value || ''); 
	} else { 
	o[this.name] = this.value || ''; 
	} 
	}); 
	return o; 
	} 
	
var importdatas
$(document).ready(function(){
   $("#queryform").baigoCheckall();
	 
});

function uploadmb() {

		var formData = new FormData();
		var name = $("input").val();
		formData.append("file", $("#upload")[0].files[0]);
		formData.append("name", name);
		importdatas=[];
		$('#importdivtabdata').html('')
		$.ajax({
			url : '<%=path%>/dmwh/excelupload',
			type : 'POST',
			data : formData,
			// 告诉jQuery不要去处理发送的数据
			processData : false,
			// 告诉jQuery不要去设置Content-Type请求头
			contentType : false,
			dataType:'JSON',
			beforeSend : function() {
				console.log("正在进行，请稍候");
			},
			success : function(responseStr) {
				  importdatas=responseStr
				  var title=responseStr[0];
				  $('.impselect').html('')
				  $.each(title,function(rk,rv){
					  $('.impselect').append('<option value="'+rk+'">'+rv+'</option>');
				  })
				  $.each(responseStr,function(rk,rv){
				  console.log(rk)
				  var tr=$('<tr></tr>');
				  $.each(rv,function(k,v){
					  var td
					  if (rk==0) {
					    td=$('<th value="'+k+'" >'+v+'</th>')
					  }else{
					    td=$('<td>'+v+'</td>')
					  }
					  $(tr).append($(td));
				  })
				  $('#importdivtabdata').append($(tr))
				  })
				  scroll("importdivtabdata","excel",1);  
			},
			error : function(responseStr) {
				 
			}
		});

	}

	//去空格
	function trim1(obj) {
		$(obj).val($(obj).val().replace(/\s+/g, ""));
	}

	function goback() {
		$("#tabName").val('DM_DMWHB');
		querySubmit();
	}

	//查询
	function querySubmit() {
		document.importdivfrom.action = '<%=request.getContextPath()%>/dmwh/queryDmwh'
	    document.importdivfrom.submit();
    }

//跳转代码类别
function queryDmwh(tableName){
	window.location.href='<%=request.getContextPath()%>/dmwh/queryDmwh?tabName='+tableName
}
//跳转代码类别
function importDmwhPage(tableName){
	window.location.href='<%=request.getContextPath()%>/dmwh/importDmwhPage?tabName='+tableName
}

//弹出添加窗口
function onAdd(){
	$("#pdz").val('');
	Validator.ClearForm('divfrom');
	$("#NeworEdit").find("input[type='text']").val('');
	$("#NeworEdit").find("select").val('');
	$("input[name='"+"val[${tabStrList[0].COLUMN_NAME}]']").removeAttr('readonly');
 	BOX_show('NeworEdit');
    $("#divtab").find('select').show();
}
 
 function importexcel(){
  var  field =  $("#importdivfrom").serializeArray();   
  console.log(field)
  var items={
	  tablename:'${dmwhPage.tabName}',
	  columns:field,
	  datas:importdatas
  }
  $.ajax({ 
      type:"POST", 
      url:'<%=request.getContextPath()%>/dmwh/importDmwh', 
      dataType:"json",      
      contentType:"application/json",               
      data:JSON.stringify(items), 
      success:function(data){   
    	   
    		  alert('上传成功')
    		   
      } 
   }); 
 }   
 function zdmcdy(){
	 $('#importdivtabdata').find('th').each(function(i,doc){
	   $('#importdivtab').find('th[col='+$(doc).text()+']').parents('tr').find('select').val($(doc).attr('value'))
	 })
 }
 
 function asxdy(){
	 $('#importdivtabdata').find('th').each(function(i,doc){
	   $('#importdivtab').find('td > select').eq(i).val($(doc).attr('value'))
	 })
 }
 
 
function viewTable(tabName){
	$("#tabName").val(tabName);
	//alert(tabName);
	querySubmit();
}
function ImportViewTable(){
	$("#tabName").val('${dmwhPage.tabName}');
	//alert(tabName);
	querySubmit();
}

 
$(document).ready(function(){
	var wHeight =(window.innerHeight || (window.document.documentElement.clientHeight || window.document.body.clientHeight));
		$('#excel').height(wHeight-146); 

		$(window).resize(function(){
			var wHeight =(window.innerHeight || (window.document.documentElement.clientHeight || window.document.body.clientHeight));
	 		$('#excel').height(wHeight-146); 
		});
}); 


</script>
 
</head>
<body>
<div class="Contentbox">
 <div class="mainbg"></div>
  <div class="pd10">    
<%--    	  <div class="question" title="帮助" onclick="javascript:cha('${QXB.QXDM}');"></div>     --%>
<%--       <div class="address">当前位置：${QXB.FQXMC} >> ${QXB.QXMC}</div> --%>
    <div class="clr"></div>
    <div class="butsea">
          <div class="addlist_button1 mr15"><a href="javascript:void(0);" onclick="javascritp:importexcel();return false;" title="导入" ><span>导入</span></a> </div> 
          <div class="addlist_button1 mr15"><a href="javascript:void(0);" onclick="javascritp:zdmcdy();return false;" title="字段名对应" ><span>字段名对应</span></a> </div> 
          <div class="addlist_button1 mr15"><a href="javascript:void(0);" onclick="javascritp:asxdy();return false;" title="顺序对应" ><span>顺序对应</span></a> </div> 
          <div class="addlist_button ml15"> <a href="javascript:goback();"><span>返&nbsp;&nbsp;回</span></a> </div>  
    </div>
    <div class="clr"></div>
	<input type="hidden" name="pdz" id="importpdz"/>
	    
	     <div class="Floatleft Pct100 mb10">
	        <table  border="0"  cellpadding="0" cellspacing="0"   width="100%" >
	          <tr>
	            <td >
		           <form id="upform"   action="<%=path%>/dmwh/excelupload">
			         <input  id="upload" type="file" name="file"/>
			         <input  id="filename" name="name" type="hidden" value="${dmwhPage.tabName}"/>
			       </form>           
	            </td>
	            <td width="60px"> 	    
	               <div class="addlist_button"> <a href="javascript:void(0);" onclick="uploadmb();return false;"><span>上&nbsp;&nbsp;传</span></a> </div>
	            </td>
	          </tr>
	        </table>	    
         </div>
  	      <div class="clr"></div>
  	      
  
    <form name="importdivfrom" id="importdivfrom" method="post">
      <div style="width:300px; float:left;  ">
      <table id="importdivtab" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
		<c:forEach items="${tabStrList}" var="tabStr" varStatus="status">
			<tr>
				<th width="29%" col="${tabStr.COMMENTS}" >${tabStr.COMMENTS}</th>
				<td>
							<select class="impselect" id="val_${tabStr.COLUMN_NAME}" name="${tabStr.COLUMN_NAME}"
							<c:if test="${tabStr.NULLABLE eq 'N'}">dataType="Require"</c:if>
							 msg="请选择 ${tabStr.COMMENTS}" 
							 		<c:choose>
										<c:when test="${tabStr.NULLABLE eq 'N'}">
											dataType="Require"
										</c:when>
										<c:otherwise>
											require="false"
										</c:otherwise>
									</c:choose>
							 >
								<option value="">---请选择---</option>									
							</select>
					        <c:if test="${tabStr.NULLABLE eq 'N'}"><span style="color:red;">*</span></c:if>
				</td>
			</tr>
		</c:forEach>
      </table>
       
      </div>
      <div id="excel" style="margin-left:310px; overflow:auto;  position:relative; white-space:nowrap;" >
         <table id="importdivtabdata" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse; ">
         </table>
     </div>
</form>
	     <div class="clr"></div>  
    
  </div>
</div>

   

 

  	   
 

<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"> </div>   
 
</body>
</html>

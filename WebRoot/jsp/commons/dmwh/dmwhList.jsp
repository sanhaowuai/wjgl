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
				  $.each(title,function(rk,rv){
					  $('.impselect').append('<option value="'+rk+'">'+rv+'</option>');
				  })
				  
				  
				  $.each(responseStr,function(rk,rv){
				  var tr=$('<tr></tr>');
				  $.each(rv,function(k,v){
					  var td=$('<td>'+v+'</td>')
					  $(tr).append($(td));
				  })
				  $('#importdivtabdata').append($(tr))
				  })
				 
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
		document.queryform1.action = '<%=request.getContextPath()%>/dmwh/queryDmwh'
	document.queryform1.submit();
}
	//查询
	function queryImportSubmit() {
		document.queryform1.action = '<%=request.getContextPath()%>/dmwh/importDmwhPage'
	document.queryform1.submit();
}
	//导出
	function exportDmwhPage() {
		document.queryform1.action = '<%=request.getContextPath()%>/dmwh/exportDmwhPage'
		document.queryform1.submit();
	}

//跳转代码类别
function queryDmwh(tableName){
	window.location.href='<%=request.getContextPath()%>/dmwh/queryDmwh?tabName='+tableName
}

//弹出添加窗口
function onAdd(){
	$("#pdz").val('');
	Validator.ClearForm('divfrom');
	$("#NeworEdit").find("input[type='text']").val('');
	$("#NeworEdit").find("select").val('');
	
    <c:choose>
	<c:when test="${empty tabConstraints}">
	$("input[name='"+"val[${tabStrList[0].COLUMN_NAME}]']").removeAttr('readonly');
	</c:when>
	<c:otherwise>
	<c:forEach items="${tabConstraints}" var="tabCon" varStatus="status">$("input[name='"+"val[${tabCon.COLUMN_NAME}]']").removeAttr('readonly');</c:forEach>
	</c:otherwise>
	</c:choose>
 	BOX_show('NeworEdit');
    $("#divtab").find('select').show();
}
//弹出添加窗口
function onImport(){
	$("#importpdz").val('');
	Validator.ClearForm('divfrom');
 	BOX_show('importdiv');
    $("#importdivtab").find('select').show();
}
 function importexcel(){
  var  field =  $("#importdivfrom").serializeArray();   
   
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
    		  BOX_remove('importdiv')
      } 
   }); 
 }   
//修改弹出
function updateByID(DM,MC){
	Validator.ClearForm('divfrom');
	/*丁起明*/
    <c:choose>
	<c:when test="${empty tabConstraints}">
	var b='${tabStrList[0].COLUMN_NAME}';
	</c:when>
	<c:otherwise>
	var b='<c:forEach items="${tabConstraints}" var="tabCon" varStatus="status">${tabCon.COLUMN_NAME}<c:if test="${status.last eq false}">||</c:if></c:forEach>';
	</c:otherwise>
	</c:choose>

	var url="<%=path%>/dmwh/queryByID?tabName=${dmwhPage.tabName}&id="+b;
    var zhi=  {zhi:DM};
	$.post(url,zhi,function(map){
			<c:forEach items="${tabStrList}" var="tabStr">
				 $('#val_${tabStr.COLUMN_NAME}').val(map['${tabStr.COLUMN_NAME}']);
			</c:forEach>
			
		    <c:choose>
			<c:when test="${empty tabConstraints}">
			$("input[name='"+"val[${tabStrList[0].COLUMN_NAME}]']").attr('readonly',true);
			</c:when>
			<c:otherwise>
			<c:forEach items="${tabConstraints}" var="tabCon" varStatus="status">$("input[name='"+"val[${tabCon.COLUMN_NAME}]']").attr('readonly',true);</c:forEach>
			</c:otherwise>
			</c:choose>			
			$("#NeworEdit").find('select').show();
 	},'json')
	BOX_show('NeworEdit');
	$("#pdz").val(DM);
 }
 

// 添加/修改
function save(){
	
	/*丁起明*/
    <c:choose>
	<c:when test="${empty tabConstraints}">
	var ID=$("input[name='val[${tabStrList[0].COLUMN_NAME}]']").val();
	var id='${tabStrList[0].COLUMN_NAME}';
	</c:when>
	<c:otherwise>
	var ID=<c:forEach items="${tabConstraints}" var="tabCon" varStatus="status">$("input[name='val[${tabCon.COLUMN_NAME}]']").val()<c:if test="${status.last eq false}">+</c:if></c:forEach>;
	var id='<c:forEach items="${tabConstraints}" var="tabCon" varStatus="status">${tabCon.COLUMN_NAME}<c:if test="${status.last eq false}">||</c:if></c:forEach>';
	</c:otherwise>
	</c:choose>
	
   	//alert(id + ID);
	var url="<%=path%>/dmwh/repeatJudg?tabName=${dmwhPage.tabName}&id="+id+"&mc=${tabStrList[1].COLUMN_NAME}";
    var zhi=  {zhi:ID};
	var exit=false;    
	if(Validator.Validate(document.getElementById('divfrom'),1)  ){
        if($("#pdz").val()==undefined || $("#pdz").val()==""){//添加
          if('DM_DMWHB'=='${dmwhPage.tabName}'){
			var path="<%=path%>/dmwh/existTable?tabName="+ID;
			$.ajax({
						type: "POST",
						async:false,
						url: path,
						success: function(result){
          					if(result.count<= 0){
             		   			alert(result.msg);
             		   			exit=true;
          					}
          				  }
          			});
          	 }
               if(exit==true) return false;		//跳出函数体
               
               	$.post(url,zhi,function(result){
              			if(result.count > 0){
                  		   alert('该'+id+'已存在!');
                  		   return;
              			}
              			
            	    document.divfrom.action = "<%=path%>/dmwh/addDmwh?tabName=${dmwhPage.tabName}";
             	    BOX_remove('NeworEdit');
            	    $('#divfrom').ajaxSubmit(function(){  querySubmit(); });
        	},'json');
        }else{//修改var 			
      	    document.divfrom.action = "<%=path%>/dmwh/updateDmwh?tabName=${dmwhPage.tabName}&id="+id+"&zhi="+ID;
     	    BOX_remove('NeworEdit');
    	    $('#divfrom').ajaxSubmit(function(){  querySubmit(); });
        }
	}
}

function delSubmit(){
	if(isCheck('ids')==false){
		alert("请选择要删除的数据");
		return;
	}
	
	if(confirm("您确定要删除选中的数据吗？")==true){
		document.queryform.action = "<%= request.getContextPath() %>/dmwh/deleteDmwh";
		$('#queryform').ajaxSubmit(function(){
	    	alert("删除成功！");
	    	querySubmit();
	    });
	}
	
}

function viewTable(tabName){
	$("#tabName").val(tabName);
	//alert(tabName);
	querySubmit();
}

function ImportViewTable(){
	$("#tabName").val('${dmwhPage.tabName}');
	//alert(tabName);
	queryImportSubmit();
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
          <td height="35px">
            <div class="addlist_button"> <a href="javascript:void(0);" onclick="onAdd();return false;"><span>添&nbsp;&nbsp;加</span></a> </div>
            <div class="addlist_button  ml15"> <a href="javascript:void(0);" onclick="delSubmit();return false;"><span>删&nbsp;&nbsp;除</span></a> </div>
            
            <c:if test="${ dmwhPage.tabName ne 'DM_DMWHB'}">
                    		 
<!--             <div class="addlist_button  ml15"> <a href="javascript:void(0);" onclick="onImport();return false;"><span>导&nbsp;&nbsp;入</span></a> </div> -->
            <div class="addlist_button  ml15"> <a href="javascript:void(0);" onclick="ImportViewTable();return false;"><span>导&nbsp;&nbsp;入</span></a> </div>
            <div class="addlist_button  ml15"> <a href="javascript:void(0);" onclick="exportDmwhPage();return false;"><span>导&nbsp;&nbsp;出</span></a> </div>
           </c:if>	
	           <c:if test="${dmwhPage.tabName  != 'DM_DMWHB'}">
	             <div class="addlist_button ml15"> <a href="javascript:goback();"><span>返&nbsp;&nbsp;回</span></a> </div>          
	           </c:if>
<%--            <div class="addlist_button  ml15"> <a href="javascript:querySubmit();"><span>刷&nbsp;&nbsp;新</span></a> </div>--%>
          </td>
        </tr>
      </table>
      <form id="queryform1" name="queryform1" method="post">
        <input type="hidden" name="pageCount"  value="${dmwhPage.pageCount}" />
        <input type="hidden" name="tabName" id="tabName" value="${dmwhPage.tabName}"/>
        <input type="hidden" name="id" id="id" value="${tabStrList[0].COLUMN_NAME}"/>
        <table  border="0" align="right" cellpadding="0" cellspacing="0"  >
          <tr>
            <td >基础代码类型：</td>
            <td>
				<select id="pjcdmlx" name="pjcdmlx">
					<option value="">--请选择--</option>
					<c:forEach items="${jcdmlxbs}" var="map">
						<option value="${map.DM }" <c:if test='${map.DM eq dmwhPage.pjcdmlx}'>selected="selected"</c:if>>${map.MC }</option>
					</c:forEach>
				</select>            
            </td>
            <td >  <div class="addlist_button2"><a href="javascript:querySubmit();" ><span>搜 索</span></a> </div> </td>
          </tr>
        </table>
      </form>
    </div>
    <div class="clr"></div>
    <div class="list">
    	<form name="queryform" method="post" id="queryform">
        <input type="hidden" name="tabName" id="tabName" value="${dmwhPage.tabName}"/>
        
        <c:choose>
        	<c:when test="${empty tabConstraints}">
        	<input type="hidden" name="id" id="id" value="${tabStrList[0].COLUMN_NAME}"/>
        	</c:when>
        	<c:otherwise>
        		<input type="hidden" name="id" id="id" value="<c:forEach items="${tabConstraints}" var="tabCon" varStatus="status">${tabCon.COLUMN_NAME}<c:if test="${status.last eq false}">||</c:if></c:forEach>"/>
        	</c:otherwise>
        </c:choose>        
        <input type="hidden" name="id_name" id="name_id"/>
        <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
            <th><input type="checkbox" title="全选/不选" id="ids" style="padding:0;margin-left:2px;*margin-left:-2px;"/></th>
<!--             <td width="3%" align="center">&nbsp;</td>-->
             <c:forEach items="${tabStrList}" var="tabStr" varStatus="status">
				<th>${tabStr.COMMENTS}</th>                    
             </c:forEach>
            <th>操作</th>
          </tr>
                  	<c:forEach items="${datalist}" var="data" varStatus="i">
                  		 <tr <c:if test="${i.count % 2 eq '0'}">class="bgcol"</c:if>>
                  			<td>
                  				<c:if test="${fn:trim(data[tabStrList[0].COLUMN_NAME]) ne 'DM_DMWHB' and fn:trim(data[tabStrList[0].COLUMN_NAME]) ne 'DM_DMFKB'}">

							        <c:choose>
							        	<c:when test="${empty tabConstraints}">
							        	<input type="checkbox" name="ids" value="${data[tabStrList[0].COLUMN_NAME]}"/>
							        	</c:when>
							        	<c:otherwise>
							        		<input type="checkbox" name="ids" value="<c:forEach items="${tabConstraints}" var="tabCon" varStatus="status">${data[tabCon.COLUMN_NAME]}</c:forEach>"/>
							        	</c:otherwise>
							        </c:choose>
                  				</c:if>
                  			</td>
                    		<c:forEach items="${tabStrList}" var="tabStr" varStatus="j">
							<td>
							<c:choose>
								<c:when test="${tabStr.GLFS eq '1'}">
									${data[tabStr.COLUMN_NAME]}
								</c:when>
								<c:when test="${tabStr.GLFS eq '2'}">
									<c:forEach items="${fn:split(tabStr.GDZ,',')}" var="str">
										<c:if test="${fn:split(str,':')[0] eq data[tabStr.COLUMN_NAME]}">
											${fn:split(str,':')[1]}
										</c:if>
									</c:forEach>
								</c:when>
								<c:otherwise>
									${data[tabStr.COLUMN_NAME]}				
								</c:otherwise>	
							</c:choose>
                   			</td>
                    		</c:forEach>
                    		<td>
								
								
							        <c:choose>
							        	<c:when test="${empty tabConstraints}">
										<div class="cz_button cz1_1" title="修改" onclick="javascript:updateByID('${data[tabStrList[0].COLUMN_NAME]}','${data[tabStrList[1].COLUMN_NAME]}');"></div>
							        	</c:when>
							        	<c:otherwise>
							        		<div class="cz_button cz1_1" title="修改" onclick="javascript:updateByID('<c:forEach items="${tabConstraints}" var="tabCon" varStatus="status">${data[tabCon.COLUMN_NAME]}</c:forEach>','${data[tabStrList[1].COLUMN_NAME]}');"></div>
							        	</c:otherwise>
							        </c:choose>								
								
								<c:if test="${(dmwhPage.tabName eq 'DM_DMWHB') and (data[tabStrList[0].COLUMN_NAME] ne 'DM_DMWHB')}">
                    			<div class="cz_button cz2_4" title="添加数据" onclick="javascript:viewTable('${data[tabStrList[0].COLUMN_NAME]}');">
                    			</div>
                    			</c:if>									
                    		</td>
                    	</tr>
                    </c:forEach>
        </table>
      </form>
    </div>
    <div class="youtube"> 
      <c:if test="${not empty dmwhPage }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="dmwhPage" onlyOneShow="true" showListNo="true" action="dmwh/queryDmwh"/>
      </c:if>
    </div>
    <div class="clr"></div>
  </div>
</div>

   <form name="divfrom" id="divfrom" method="post">
	<input type="hidden" name="pdz" id="pdz"/>
	<div id="NeworEdit" style="display:none; width: 500px; border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;">
  	<div class="popup">
	    <div class="Floatleft Pct100 mb10">
	      <div class="popup_left">添加/修改</div>
	      <a href="#" class="btn_close" onclick="javascript:BOX_remove('NeworEdit');"></a>
	    </div>
  	     <div class="clr"></div>
    <div style="height:350px;overflow-x:hidden;overflow-y:auto;">
      <table id="divtab" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
		<c:forEach items="${tabStrList}" var="tabStr" varStatus="status">
			<tr>
				<th width="50%">${tabStr.COMMENTS}</th>
				<td>
					<c:choose>
						<c:when test="${tabStr.GLFS eq '1'}">
							<select id="val_${tabStr.COLUMN_NAME}" name="val[${tabStr.COLUMN_NAME}]"
							<c:if test="${tabStr.NULLABLE eq 'N'}">dataType="Require"</c:if>
							msg="请选择 ${tabStr.COMMENTS}" >
								<option value="">---请选择---</option>									
									<c:forEach items="${glbMap[tabStr.COLUMN_NAME]}" var="optionMap">
										 <option value='${optionMap[tabStr.GLZD]}'>	
										 	${optionMap[tabStr.GLXSZD]}
				  						 </option>
									</c:forEach>									
							</select>
						</c:when>
						<c:when test="${tabStr.GLFS eq '2'}">
							<select id="val_${tabStr.COLUMN_NAME}" name="val[${tabStr.COLUMN_NAME}]"
							<c:if test="${tabStr.NULLABLE eq 'N'}">dataType="Require"</c:if>
							msg="请选择 ${tabStr.COMMENTS}" >
								 <option value=''>--请选择--</option>
								 	<c:forEach items="${fn:split(tabStr.GDZ,',')}" var="str">
								 		<option value="${fn:split(str,':')[0]}">
								 			${fn:split(str,':')[1]}
								 		</option>
									</c:forEach>
							</select>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${tabStr.DATA_TYPE eq 'NUMBER'}">
									<input id="val_${tabStr.COLUMN_NAME}" name="val[${tabStr.COLUMN_NAME}]" type="text" 
									onblur="javascript:trim1(this);" 
									<c:choose>
										<c:when test="${tabStr.NULLABLE eq 'N'}">
											dataType="Require"
										</c:when>
										<c:otherwise>
											require="false"
										</c:otherwise>
									</c:choose>
									dataType="Double" msg="请输入${tabStr.COMMENTS}(数字)"
									<c:if test="${tabStr.NULLABLE eq 'N'}">dataType="Require"</c:if> />
								</c:when>
								<c:otherwise>
									<input id="val_${tabStr.COLUMN_NAME}" name="val[${tabStr.COLUMN_NAME}]" type="text" 
									onblur="javascript:trim1(this);"
									<c:choose>
										<c:when test="${tabStr.NULLABLE eq 'N'}">
											dataType="Require"
										</c:when>
										<c:otherwise>
											require="false"
										</c:otherwise>
									</c:choose>
									msg="请填写${tabStr.COMMENTS}(在1-${tabStr.DATA_LENGTH}字符内)" 
									dataType="Limit" <c:if test="${tabStr.NULLABLE eq 'N'}">min="1"</c:if>  max="${tabStr.DATA_LENGTH}"  />						
								</c:otherwise>
							</c:choose>
						</c:otherwise>						
					</c:choose>
					<c:if test="${tabStr.NULLABLE eq 'N'}"><span style="color:red;">*</span></c:if>
				</td>
			</tr>
		</c:forEach>

        <tr>
          <td colspan="2" class="pt10">
             <div class="addlist_button1" style="float:right"><a href="javascript:void(0);" onclick="BOX_remove('NeworEdit');return false;"><span>取消</span></a> </div>
            <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:void(0);" onclick="javascritp:save();return false;" title="保存" ><span>保存</span></a> </div>
             
          </td>
        </tr>
      </table>
      </div> 
   </div>
</div>
</form>


 
	<input type="hidden" name="pdz" id="importpdz"/>
	<div id="importdiv" style="display:none; width: 800px; border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;">
  	<div class="popup">
	    <div class="Floatleft Pct100 mb10">
	      <div class="popup_left">添加/修改</div>
	      <a href="#" class="btn_close" onclick="javascript:BOX_remove('importdiv');"></a>
	    </div>
	    
	     <div class="Floatleft Pct100 mb10">
	        <table  border="0"  cellpadding="0" cellspacing="0"   width="100%" >
	          <tr>
	            <td width="90%">
		           <form id="upform"   action="<%=path%>/dmwh/excelupload">
			         <input  id="upload" type="file" name="file"/>
			         <input  id="filename" name="name" type="hidden" value="${dmwhPage.tabName}"/>
			       </form>           
	            </td>
	            <td> 	    
	               <div class="addlist_button"> <a href="javascript:void(0);" onclick="uploadmb();return false;"><span>上&nbsp;&nbsp;传</span></a> </div>
	            </td>
	          </tr>
	        </table>	    
         </div>
  	      <div class="clr"></div>
  	      
    <div style="height:350px;overflow-x:hidden;overflow-y:auto; position:relative">
    <form name="importdivfrom" id="importdivfrom" method="post">
       <div  style="width:240px; position:fixed; ">
      <table id="importdivtab" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
		<c:forEach items="${tabStrList}" var="tabStr" varStatus="status">
			<tr>
				<th width="29%">${tabStr.COMMENTS}</th>
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
<%-- 									<c:forEach items="${glbMap[tabStr.COLUMN_NAME]}" var="optionMap"> --%>
<%-- 										 <option value='${optionMap[tabStr.GLZD]}'>	 --%>
<%-- 										 	${optionMap[tabStr.GLXSZD]} --%>
<!-- 				  						 </option> -->
<%-- 									</c:forEach>									 --%>
							</select>
					        <c:if test="${tabStr.NULLABLE eq 'N'}"><span style="color:red;">*</span></c:if>
				</td>
			</tr>
		</c:forEach>
      </table>
      </div>
      
      <div style="width:510px; overflow:auto; height:350px;float:right; white-space:nowrap;">
         <table id="importdivtabdata" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse; ">
         </table>
     </div>
</form>
</div>

                  <div class="addlist_button1" style="float:right"><a href="javascript:void(0);" onclick="BOX_remove('importdiv');return false;"><span>取消</span></a> </div>
            <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:void(0);" onclick="javascritp:importexcel();return false;" title="保存" ><span>导入</span></a> </div>
             
	     <div class="clr"></div>
  	   </div>
   </div>
</div>

<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"> </div>   
</body>
</html>

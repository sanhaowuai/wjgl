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
	function viewWhmb(id){
		var src = "<%=path%>/customImpOrExp/customImpOrExpMbwh?id="+id;
	    $("#xzjsxmiframe").attr("src",src);
	 	BOX_show('xzjsxmDiv1');
	}
	function viewZdydr(id){
		var src = "<%=path%>/customImpOrExp/customImpOrExpZdydr?id="+id;
	    $("#xzjsxmiframe2").attr("src",src);
	 	BOX_show('xzjsxmDiv2');
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
	    
	    
	    var xzjsxmform = $('#xzjsxmForm');
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
function saveImpCol(){
	var xgjsxmform = $("#xzjsxmiframe")[0].contentWindow.$("#cxform");
	var tollength = $('#xzjsxmiframe')[0].contentWindow.$('#selTbl tr').length;
    var curlength = tollength-2;//去掉表头和，最后js添加标记行
    if(curlength ==0){
      alert("请添加导入字段行！");
      return;
    }
    var columnenIndex = '';
    var columnzhIndex = '';
    var columncdIndex = '';
    var columnlxIndex = '';
    var sfzjIndex = '';
    var sfxlzjIndex = '';
    var xlmcIndex = '';
    var xzzjbs=$("#xzjsxmiframe")[0].contentWindow.$('#xzzjbs').val();
    var sfyxzzj='0';//是否已选择主键 (当xzzjbs标识为 1 修改时必须有选择主键项,默认未选择)
    //校验数据
    for(var i=1;i<=curlength;i++ ){
       columnenIndex = 'column_en'+i; 
       columnzhIndex = 'column_zh'+i;
       columncdIndex = 'column_cd'+i;
       columnlxIndex = 'column_lx'+i;
       $("#xzjsxmiframe")[0].contentWindow.$('#'+columnenIndex).attr("disabled",false);
       $("#xzjsxmiframe")[0].contentWindow.$('#'+columnlxIndex).attr("disabled",false);
       
       sfxlzjIndex = 'sfxlzj'+i;
       xlmcIndex ='xlmc'+i;
       var columnenVal= $("#xzjsxmiframe")[0].contentWindow.$('#'+columnenIndex+' option:selected').val();
       var columnzhVal= $("#xzjsxmiframe")[0].contentWindow.$('#'+columnzhIndex).val();
       var columncdVal= $("#xzjsxmiframe")[0].contentWindow.$('#'+columncdIndex).val();
       var columnlxVal= $("#xzjsxmiframe")[0].contentWindow.$('#'+columnlxIndex+' option:selected').val();
       var sfxlzj = $("#xzjsxmiframe")[0].contentWindow.$('input[name="'+sfxlzjIndex+'"]:checked ').val();
       var xlmcVal = '';
       if(columnenVal=='' ||columnenVal==null){
        alert("第"+i+"行列值不能为空,请选择！");
        return;
       }
       var columnArray = new Array();
       var sfcf ='0';
       for(var j=1;j<=curlength;j++){
          var curcolumnenIndex = 'column_en'+j; 
          var curcolumnenVal = $("#xzjsxmiframe")[0].contentWindow.$('#'+curcolumnenIndex+' option:selected').val();
          columnArray.push(curcolumnenVal);
       }
       var curcolumnArray = columnArray.sort(); 
       for(var m = 0;m<curcolumnArray.length-1;m++){
          if(curcolumnArray[m]==curcolumnArray[m+1]){
           sfcf='1';
          }
       }
       if(sfcf =='1'){
       	  alert("列值不能重复,请重新选择！！");
          return;
       }
        if(columnzhVal==''||columnzhVal==null){
       	  alert("第"+i+"行列名称不能为空！");
          return;
       }
       if(columncdVal=='' ||columncdVal==null){
        alert("第"+i+"行长度值不能为空！");
        return;
       }
       if(columnlxVal=='' ||columnlxVal==null){
        alert("第"+i+"行类型不能为空,请选择！");
        return;
       }
       
       if(sfxlzj=='1'){
    		xlmcVal = $("#xzjsxmiframe")[0].contentWindow.$('#'+xlmcIndex).val();
    		var sfczxlz='1';
    		if(xlmcVal =='' || xlmcVal==null){
    			 alert("第"+i+"行序列名称不能为空！");
       		 	 return;
    		}else{
    		    //判断序列名是否存在
    			var xgjsxmform = $("#xzjsxmiframe")[0].contentWindow.$("#cxform");
				var url="<%=path%>/customImpOrExp/querySfczxl?xlmcVal="+xlmcVal;
				xgjsxmform.ajaxSubmit({
				url: url,
				type:"post",
				contentType: "application/x-www-form-urlencoded; charset=utf-8",
				dataType : "text",
				success: function (data) {
		  			sfczxlz=data;
		  		},
				error:function(data){
					alert("获取信息失败，请重试！");
				}
			});	
    			if(sfczxlz =='0'){
    				 alert("第"+i+"行序列名称在数据库中不存在，请在数据库建立此名称序列！");
       		 		 return;
       		 	 }
    		} 	
       } 
    }
    var curywmc = $("#xzjsxmiframe")[0].contentWindow.$('#curywmc').val();
    var curimptype= $("#xzjsxmiframe")[0].contentWindow.$('#curimptype option:selected').val();
	//var curjsdmleg=$("#xzjsxmiframe")[0].contentWindow.$('input[name="curjsdm"]:checked').length;
    if(curywmc=='' || curywmc ==null){
    	alert("业务名称不能为空！");
    	return;
    }
    if(curimptype=='' || curimptype==null){
    	alert("属性不能为空！");
   		return;
    }
    //if(curjsdmleg==0){
	//	alert('角色不能为空！'); 
	//	return;
	//}
    var ImpColMesg = '';
    for(var i=1;i<=curlength;i++ ){
       columnenIndex = 'column_en'+i; 
       columnzhIndex = 'column_zh'+i;
       sfzjIndex = 'sfzj'+i;
       sfxlzjIndex = 'sfxlzj'+i;
       xlmcIndex ='xlmc'+i;
       var columnenVal= $("#xzjsxmiframe")[0].contentWindow.$('#'+columnenIndex+' option:selected').val();
       var columnzhVal= $("#xzjsxmiframe")[0].contentWindow.$('#'+columnzhIndex).val();
       var sfxlzjVal = $("#xzjsxmiframe")[0].contentWindow.$('input[name="'+sfxlzjIndex+'"]:checked ').val();
       var sfzj =  $("#xzjsxmiframe")[0].contentWindow.$('input[name="'+sfzjIndex+'"]:checked ').val();
       if('1'==sfzj){
       	sfyxzzj='1';
       }
       var xlmcVal = '';
       if(sfxlzjVal =='1'){
       	  xlmcVal = $("#xzjsxmiframe")[0].contentWindow.$('#'+xlmcIndex).val();
       }
       ImpColMesg = ImpColMesg+sfzj+"|"+sfxlzjVal+"|"+xlmcVal+",";
       $("#xzjsxmiframe")[0].contentWindow.$('#impColMesg').val(ImpColMesg);
    }
     if(xzzjbs=='1' && sfyxzzj=='0'){
		alert('当前导入数据方式为修改,请选择修改主键列后进行导入！'); 
		return;
	}
    
    //拼接是否主键，是否序列增加行数据
   var url="<%=path%>/customImpOrExp/saveImpCol";
   xgjsxmform.ajaxSubmit({
		url: url,
		type:"post",
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		dataType : "text",
		success: function (data) {
			if(data=='1'){
				alert("保存成功！");
			}else{
				alert("保存失败！");
			}	
			document.cxform.action="<%=path%>/customImpOrExp/queryCustomImpOrExp";
			document.cxform.submit();
		},
		error:function(data){
			alert("保存失败，请重试！");
		}
	});	 
     
}
function saveImport(){
	 var cxform =  $("#xzjsxmiframe2")[0].contentWindow.$("#cxform");
	 var newimpColSize =  $("#xzjsxmiframe2")[0].contentWindow.$("#newimpColSize").val();
	  var excelVal =  $("#xzjsxmiframe2")[0].contentWindow.$("#excel").val();
     if(excelVal=='' || excelVal==null){
       alert("请选择excel进行自动匹配后导入数据！");
       return;
     }
     var importMesg='';
     var importMcMesg='';
	 for(var i=1;i<= newimpColSize;i++){
	 	  var sptextIndex = '#spzdpp'+i;  
	 	  var ppExlIndex = '#ppExl'+i;  
	 	  var sptextVal = $("#xzjsxmiframe2")[0].contentWindow.$(sptextIndex).val();
		  var ppExlVal = $("#xzjsxmiframe2")[0].contentWindow.$(ppExlIndex).val();
	 	  if(ppExlVal !=='' && ppExlVal!==null){
	 	  	importMesg = importMesg+sptextVal+',';
	 	  	importMcMesg = importMcMesg+ppExlVal+',';  
	 	  }
	 	  $("#xzjsxmiframe2")[0].contentWindow.$('#importMesg').val(importMesg);
	 	  $("#xzjsxmiframe2")[0].contentWindow.$('#importMcMesg').val(importMcMesg);
	 }
	 var url="<%=path%>/customImpOrExp/saveImport";
	 cxform.ajaxSubmit({
			url: url,
			type:"post",
			contentType: "application/x-www-form-urlencoded; charset=utf-8",
			dataType: "json",
			success: function (data) {
		  		$.each(data,function(i,item){
		  		var mesg = item.rel;
		  		var errrorMesg = mesg.split('-'); 
		  		if(errrorMesg[0]=="1"){
	 				alert('导入成功！');
	 			}else if(errrorMesg[0]=="2"){
	 			    alert(errrorMesg[1]);
	 			}else if(errrorMesg[0]=="3"){
	 			    alert('请匹配主键字段，重新导入！');
	 			}
		  	  });
			},
			error:function(data){
				alert("导入失败，请重试！");
			}
		});	
}

	//批量删除
	function scdr(){
	    if(isCheck('ids') == false){
	        alert("请选择要删除的信息！");
	        return;
	    }
	    if(confirm("您确定要删除选中的信息吗？") == true){
	         var url="<%=path%>/customImpOrExp/delCustomImp";
	         $("#ff").ajaxSubmit({
	 			url: url,
	 			type:"post",
	 			contentType: "application/x-www-form-urlencoded; charset=utf-8",
	 			dataType : "text",
	 			success: function (data) {
	 	 				if(data=="1"){
	 	 					 alert("删除成功！");
	 	 					 cxjssb();
	 		 			}else if(data=="0"){
	 	 					alert("删除失败！");
	 		 			}
	 			},
	 			error:function(data){
	 				alert("删除失败，请重试！");
	 			}
	 		});	
	    }
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
    <form name="cxform" method="post" id="cxform" >
    	<div class="butsea">
    		
	   		<table border="0" cellpadding="0" cellspacing="0" width="100%">
	           <tr>
	              <td height="35px" width="20%" align="left">
	              	<div class="addlist_button1 ml5" style="float: left;"> <a href="javascript:void(0);" onclick="addmbxx();"><span>添&nbsp;&nbsp;加</span></a> </div>
	              	<div class="addlist_button1 ml5" style="float: left;"> <a href="javascript:void(0);" onclick="scdr();"><span>删&nbsp;&nbsp;除</span></a> </div>
	              </td>
		          <td height="35px" width="80%" align="right"> 
		          	<div class="addlist_button1 ml5" style="float: right;"> <a href="javascript:void(0);" onclick="cxjssb();"><span>查&nbsp;&nbsp;询</span></a> </div>
		          	<div style="display: inline;float: right;">
			          	表名称:&nbsp;
	            		<input style="width: 120px" type="text" name="ywmc" id="ywmc" value="${customImpOrExpPage.ywmc}" />
        			</div>
		          </td>
	          </tr>
	        </table>
		</div>
	</form>
	
	<div class="clr"></div>
	  <div class="list">
	  <form name="ff" method="post" id="ff" >
      <table width="100%" cellpadding="0" cellspacing="0" class="bot_line" style="border-collapse:collapse;text-align: center;">
        <tr>
          <th width="3%"><input type="checkbox" onclick="javascript:allcheck(this,'ids');" title="全选/不选" style="padding:0;margin-left:2px;*margin-left:-2px;"/></th>
          <th style="text-align: center;">序号</th>
          <th style="text-align: center;">业务ID</th>
          <th style="text-align: center;">业务名称</th>
          <th style="text-align: center;">表名</th>
          <!-- 
          <th style="text-align: center;">角色</th>
          -->
          <th style="text-align: center;">导入类型</th>
          <th style="text-align: center;">自定义导入</th>
        </tr>
  		<c:forEach items="${customImpOrExpList}" var="obj" varStatus="status">
	      	<tr>
	      	  <td>
              	<input name="ids" type="checkbox" value="${obj.id}" style="padding:0;margin-left:2px;*margin-left:-2px;"/>
              </td>
	       	  <td>
	       	  	${status.index+1 }
	       	  </td>
		 	  <td>${obj.id}</td>
		 	  <td>${obj.ywmc}</td>
		 	  <td>${obj.tablename}</td>
		 	  <!-- 
		 	  <td>
		 	  	<c:forEach items="${obj.js}" var="js" varStatus="status">
		 	  	  ${js.jsmc}
		 	  	 <c:if test="${status.last==false}">
		 	  	 ,
		 	  	 </c:if>
		 	  	</c:forEach>
		 	  </td>
		 	   -->
		 	  
		 	  <td>${obj.imptype}</td>
	          <td>	
<%-- 	         	<a href="javascript:void(0);" onclick="javascript:viewZdydr('${obj.id }');" class="btns btn-info" title="自定义导入">自定义导入</a> --%>
	         	<a href="javascript:void(0);" onclick="javascript:viewWhmb('${obj.id}');" class="btns btn-info" title="维护导入模板">维护导入模板</a>
	          </td>
	     	</tr>
        </c:forEach>
      </table>
      </form>
    </div>
    
	 <c:if test="${not empty customImpOrExpPage && customImpOrExpPage.pageCount>1}">
		<ff:page  mhFrom="cxform" showReSize="true" listPageCount="10" field="customImpOrExpPage" onlyOneShow="true" showListNo="true" action="customImpOrExp/queryCustomImpOrExp"/>
	 </c:if>
	 <div class="clr"></div>
  </div>
</div>

<%-- 弹出新增报名列表--%>
<div id="xzjsxmDiv" class="tan_add" style="display:none;width:600px; background: #fff; border: 3px solid #999;" >
  <div class="xzjsxmForm" style=" position:relative">
  <form name="xzjsxmForm" method="post" id="xzjsxmForm" >
  	  <div id="cyjsDiv" style="clear:both;position:absolute;left:7px;top:60px"></div> 
	  <div class="pd10">
	  	 <div class="popup_left" id="qxzName2">添加模板信息</div>
	     <a href="#" class="btn_close" onclick="javascript:BOX_remove('xzjsxmDiv');"></a>
	     <div class="clr"></div>
	  </div>	  
      <div style="float:none; clear:both; overflow:hidden;" >
       	<table border="0" cellpadding="0" cellspacing="0" width="100%">
	          <tr>
	          	<td height="35px"align="right"> 
	            	<div style="display: inline;text-align: right;">
	        			业务名称:&nbsp;
	        		</div>
	            </td>
	          	<td height="35px"align="left"> 
		          	<div style="display: inline; text-align: left;">
	        			 <input name="curywmc" id='curywmc' type="text" style="color: black;width:150px!important;text-align: left;"/>  
        			</div>
		          </td>
		          <td height="35px"align="right"> 
	            	<div style="display: inline;text-align: right;">
	        				表名:&nbsp;
	        		</div>
	            </td>
		          <td height="35px"align="left"> 
		          	<div style="display: inline;text-align: left;">
	        			 <input name="curtablename" id='curtablename' type="text" style="color: black;width:150px!important;text-align: left"/>  
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
			        			<option value="增加">增加</option>
			        			<option value="修改">修改</option>
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
	        			 	<input type="checkbox" name="curjsdm" id='curjsdm' value="${js.jsdm}" style="color: black;width:150px;text-align: center;"/> ${js.jsmc}  
						   		<br />
			          	</c:forEach>
        			</div>
		          </td>
		          -->
		          
	          </tr>
	        </table>
      </div>
      <div id="oMainLi  stToolBar" class="wp_toolbar_inner" style=" padding:10px 10px 20px 0;">
          <div class="addlist_button1 ml10" style="float: right" ><a href="javascript:void(0);" onclick="javascript:BOX_remove('xzjsxmDiv');return false;" ><span>取消</span></a></div>
          <div class="addlist_button1" style="float: right" ><a href="javascript:void(0);" onclick="javascript:bcmbxx();" ><span>保存</span></a></div>
      	  <div class="clr"></div>
      </div>
      	<input type="hidden" name="ywmc" id="addywmc"/>
      	<input type="hidden" name="tablename" id='tablename'/>
      	<input type="hidden" name="imptype" id='imptype'/>
      </form>
     </div>
  </div>
  <div id="xzjsxmDiv1" class="tan_add" style="display:none;width:1000px; background: #fff; border: 3px solid #999;" >
  <div class="xzjsxmForm1" style=" position:relative">
  		<div id="cyjsDiv" style="clear:both;position:absolute;left:7px;top:60px"></div> 
	  <div class="pd10">
	  	 <div class="popup_left" id="qxzName2">模板维护</div>
	     <a href="#" class="btn_close" onclick="javascript:BOX_remove('xzjsxmDiv1');"></a>
	     <div class="clr"></div>
	  </div>	  
      <div style="float:none; clear:both; overflow:hidden;" >
        <iframe frameborder="0" id="xzjsxmiframe" name="xzjsxmiframe" frameborder="0" src="" style="width:1000px;height:350px;overflow:hidden;" ></iframe>
      </div>
      <div id="oMainLi  stToolBar" class="wp_toolbar_inner" style=" padding:10px 10px 20px 0;">
          <div class="addlist_button1 ml10" style="float: right" ><a href="javascript:void(0);" onclick="javascript:BOX_remove('xzjsxmDiv1');return false;" ><span>取消</span></a></div>
          <div id="saveImpCol" class="addlist_button1 ml10" style="float: right" ><a href="javascript:void(0);" onclick="saveImpCol();" ><span>保存</span></a></div>
      	  <div class="clr"></div>
      </div>
     </div>
  </div>
<div id="xzjsxmDiv2" class="tan_add" style="display:none;width:890px; background: #fff; border: 3px solid #999;" >
  <div class="xzjsxmForm2" style=" position:relative">
  		<div id="cyjsDiv" style="clear:both;position:absolute;left:7px;top:60px"></div> 
	  <div class="pd10">
	  	 <div class="popup_left" id="qxzName2">自定义导入</div>
	     <a href="#" class="btn_close" onclick="javascript:BOX_remove('xzjsxmDiv2');"></a>
	     <div class="clr"></div>
	  </div>	  
      <div style="float:none; clear:both; overflow:hidden;" >
        <iframe frameborder="0" id="xzjsxmiframe2" name="xzjsxmiframe2" frameborder="0" src="" style="width:890px;height:320px;overflow:hidden;" ></iframe>
      </div>
      <div id="oMainLi  stToolBar" class="wp_toolbar_inner" style=" padding:10px 10px 20px 0;">
          <div class="addlist_button1 ml10" style="float: right" ><a href="javascript:void(0);" onclick="javascript:BOX_remove('xzjsxmDiv2');return false;" ><span>取消</span></a></div>
          <div class="addlist_button1 ml10" style="float: right" ><a href="javascript:void(0);" onclick="saveImport();" ><span>导入</span></a></div>
      	  <div class="clr"></div>
      </div>
     </div>
  </div> 

<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"></div>
 
</body>
</html>


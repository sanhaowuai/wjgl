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
	//查询自定义导出
	function cxjssb(){
		document.cxform.action="<%=path%>/consumerExp/queryConsumerExp";
		document.cxform.submit();
	}
	//添加导出
	function tjdc(){
	 	BOX_show('xzjsxmDiv');
	}
	
	//保存模板信息
	function bcmbxx(){
        var ywmc = $('#curywmc').val();
        var tablename = $('#curtablename').val();
        
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
       // if(isCheck('curjsdm') == false){
       // 	alert("请选择要添加的角色");
        //	return;
	   // }
	    var xzjsxmform = $('#xzjsxmForm');
		var url="<%=path%>/consumerExp/saveMbxx";
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
	 				document.cxform.action="<%=path%>/consumerExp/queryConsumerExp";
					document.cxform.submit();
			},
			error:function(data){
				alert("保存信息失败，请重试！");
			}
		});	
	}
	//维护模板
	function viewWhmb(id){
		var src = "<%=path%>/consumerExp/whmb?id="+id;
	    $("#xzjsxmiframe").attr("src",src);
	 	BOX_show('xzjsxmDiv1');
	}
	//保存修改模板信息
	function bcEditmbxx(){
		
		var xzjsxmform = $("#xzjsxmiframe")[0].contentWindow.$("#cxform");
		//if(Validator.Validate($("#xzjsxmiframe")[0].contentWindow.$("#showform")[0],3)){}else{return false;}
	 	var curywmcIframe = window.frames["xzjsxmiframe"].window.$("input[name='ywmc']");
		var curjsdmIframe = window.frames["xzjsxmiframe"].window.$("input:checkbox[name='curjsdm']:checked");
		var ywmc = curywmcIframe.val();
		var temp = "0";
		$.each(curjsdmIframe,function(i,item){
			temp = "1";
		}); 
		
		if(ywmc==null || ywmc ==''){
			alert("请填写业务名称！");
			return;
		}
	//	if(temp==0){
	//		alert("请选择角色!");
	//		return;
	//	}
		var curjsdmIframe = window.frames["xzjsxmiframe"].window.$("table[name='colTab']");
		var column_en = "";
		var column_zh = "";
		var temp = "";
		var arr=[];
		//验证
		var checkCol = "1";
		var arrEnTemp=[];
		var arrZhTemp=[];
		//var myArray = new Array();
		$(curjsdmIframe).find("tr").each(function(){
			$(this).find("td").each(function(){
				$(this).find("select").each(function(){
					column_en = $(this).val();
					if(column_en=="" || column_en==null){
						checkCol="0";
					}
					arrEnTemp.push(column_en);
				});
				$(this).find("input").each(function(){
					column_zh = $(this).val();
					if(column_zh=="" || column_zh==null){
						checkCol="0";
					}
					temp = column_en+"##"+column_zh;
					arr.push(temp);
					arrZhTemp.push(column_zh);
				});
			});
		});
		if(checkCol==0){
			alert("列或列名不能为空！");
			return false;
		}
		if(isRepeat(arrEnTemp)){
			alert("不能选择重复字段！");
			return false;
		}
		if(isRepeat(arrZhTemp)){
			alert("不能填写重复列名！");
			return false;
		}
		
		
		var url="<%=path%>/consumerExp/saveEdtOrUpd";
		xzjsxmform.ajaxSubmit({
			url: url,
			type:"post",
			data: {arr:arr},
			contentType: "application/x-www-form-urlencoded; charset=utf-8",
			dataType : "text",
			success: function (data) {
	 				if(data=="1"){
	 					 alert("保存成功！");
	 					 document.cxform.action="<%=path%>/consumerExp/queryConsumerExp";
	 					 document.cxform.submit();
		 			}else if(data=="0"){
	 					alert("保存失败！");
		 			}
			},
			error:function(data){
				alert("保存失败，请重试！");
			}
		});	
	}
	
	//批量删除
	function scdc(){
	    if(isCheck('ids') == false){
	        alert("请选择要删除的信息！");
	        return;
	    }
	    if(confirm("您确定要删除选中的信息吗？") == true){
	         var url="<%=path%>/consumerExp/deleteConsumerExp";
	         $("#ff").ajaxSubmit({
	 			url: url,
	 			type:"post",
	 			contentType: "application/x-www-form-urlencoded; charset=utf-8",
	 			dataType : "text",
	 			success: function (data) {
	 	 				if(data=="1"){
	 	 					 alert("删除成功！");
	 	 					 document.cxform.action="<%=path%>/consumerExp/queryConsumerExp";
	 	 					 document.cxform.submit();
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
	//判断数组中是否有重复数据
	function isRepeat(arr){
	     var hash = {};
	     for(var i in arr) {
	         if(hash[arr[i]])
	              return true;
	         hash[arr[i]] = true;
	     }
	     return false;
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
	              	<div class="addlist_button1 ml5" style="float: left;"> <a href="javascript:void(0);" onclick="tjdc();"><span>添&nbsp;&nbsp;加</span></a> </div>
	             	<div class="addlist_button1 ml5" style="float: left;"> <a href="javascript:void(0);" onclick="scdc();"><span>删&nbsp;&nbsp;除</span></a> </div>
	              </td>
	              
		          <td height="35px" width="80%" align="right"> 
		          	<div class="addlist_button1 ml5" style="float: right;"> <a href="javascript:void(0);" onclick="cxjssb();"><span>查&nbsp;&nbsp;询</span></a> </div>
		          	<div style="display: inline;float: right;">
			          	业务名称:&nbsp;
	            		<input style="width: 120px" type="text" name="ywmc" id="ywmc" value="${consumerExpPage.ywmc}" />
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
          <th style="text-align: center;">表</th>
         <!-- 
          <th style="text-align: center;">角色</th>
          -->
          <th style="text-align: center;">操作</th>
        </tr>
  		<c:forEach items="${consumerExpList}" var="obj" varStatus="status">
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
		 	   
	          <td>	
	         	<a href="javascript:void(0);" onclick="javascript:viewWhmb('${obj.id }');" class="btns btn-info" title="维护导出模板">维护导出模板</a>
	          </td>
	     	</tr>
        </c:forEach>
      </table>
      </form>
    </div>
    
	 <c:if test="${not empty consumerExpPage && consumerExpPage.pageCount>1}">
		<ff:page  mhFrom="cxform" showReSize="true" listPageCount="10" field="consumerExpPage" onlyOneShow="true" showListNo="true" action="consumerExp/queryConsumerExp"/>
	 </c:if>
	 <div class="clr"></div>
  </div>
</div>

<%-- 弹出添加模板--%>
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
	        			 <input name="curywmc" id='curywmc' type="text" style="color: black;width:150px!important;text-align: left;" maxlength="50"/>  
        			</div>
		          </td>
		          <td height="35px"align="right"> 
	            	<div style="display: inline;text-align: right;">
	        				表:&nbsp;
	        		</div>
	            </td>
		          <td height="35px"align="left"> 
		          	<div style="display: inline;text-align: left;">
	        			 <input name="curtablename" id='curtablename' type="text" style="color: black;width:150px!important;text-align: left" />  
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
	        			 	<input type="checkbox" name="curjsdm" id='curjsdm' value="${js.jsdm}" style="color: black;width:150px;text-align: center;"/> ${js.jsmc}  
						   		<br />
			          	</c:forEach>
        			</div>
		          </td>
	          </tr>
	           -->
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
  <!-- 维护模板 -->
  <div id="xzjsxmDiv1" class="tan_add" style="display:none;width:890px; background: #fff; border: 3px solid #999;" >
  <div class="xzjsxmForm1" style=" position:relative">
  		<div id="cyjsDiv" style="clear:both;position:absolute;left:7px;top:60px"></div> 
	  <div class="pd10">
	  	 <div class="popup_left" id="qxzName2">模板维护</div>
	     <a href="#" class="btn_close" onclick="javascript:BOX_remove('xzjsxmDiv1');"></a>
	     <div class="clr"></div>
	  </div>	  
      <div style="float:none; clear:both; overflow:hidden;" >
        <iframe frameborder="0" id="xzjsxmiframe" name="xzjsxmiframe" frameborder="0" src="" style="width:890px;height:320px;overflow:hidden;" ></iframe>
      </div>
      <div id="oMainLi  stToolBar" class="wp_toolbar_inner" style=" padding:10px 10px 20px 0;">
          <div class="addlist_button1 ml10" style="float: right" ><a href="javascript:void(0);" onclick="javascript:BOX_remove('xzjsxmDiv1');return false;" ><span>取消</span></a></div>
      	  <div id="saveImpCol" class="addlist_button1" style="float: right" ><a href="javascript:void(0);" onclick="javascript:bcEditmbxx();" ><span>保存</span></a></div>
      	  <div class="clr"></div>
      </div>
     </div>
  </div>
  
<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"></div>

</body>
</html>


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
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript" >
	$(document).ready(function(){
	   $("#ff").baigoCheckall();
	});
	function querylike(){
		document.queryform.action="<%=path%>/yxgl/queryYxgl";
		document.queryform.submit();
	}
	function addOrUpdZyTwo(){
		document.queryform.action="<%=path%>/yxgl/queryYxgl";
		document.queryform.submit();
	}
	//添加弹出层
	function addDiv(){
		$("input[name='yxdm']").attr("readonly",false);
<%--		 $("#sfglbm").attr("disabled",false);--%>
		$("#zt").val("1");
		Validator.ClearForm('addOrUpdfrom');
		$("#divtab").find("input[type='text']").val('');
		$("#divtab").find("select").val('');
		BOX_show('addOrUpd');
	}
	
	//修改弹出层
	function updDiv(yxdm){
		$("#zt").val("2");
		Validator.ClearForm('addOrUpdfrom');
		var url="<%=path%>/yxgl/queryOneYx";
	    var param={'yxdm':yxdm};
	    $.post(url,param,function(result){
	        $.each(result,function(k, obj){
	            obj=obj==null? '' : obj;
	            $("input[name='"+k+"'],select[name='"+k+"']").val(obj);
	        })
	    },'json')
	   $("input[name='yxdm']").attr("readonly",true);
<%--	   $("#sfglbm").attr("disabled",true);--%>
		BOX_show('addOrUpd');
	}
	//弹出专业
	function updYxzy(yxdm){
		var src ="<%=path%>/yxgl/queryZy?yxdm="+yxdm;
		$("#SelectZYIframe").attr("src",src);
		document.getElementById("Zy").value=document.getElementById("mxjs").value;
	    $("#czt").val("1");
		BOX_show('SelectZy');
	}
	
	//添加或修改
	function addOrUpd(){
		if(Validator.Validate(document.getElementById('addOrUpdfrom'),3)){
			var yxdm = $("#yxdm").val();	
			var zt = $("#zt").val();
			var url="<%=path%>/yxgl/queryByYxdmCount";	
		    var param={'yxdm':yxdm,'zt':zt};	
		    $.post(url,param,function(result){
		        if(result){
		        	document.addOrUpdfrom.action = '<%=path%>/yxgl/addOrUpdYx';
		        	$('#addOrUpdfrom').ajaxSubmit(function(r){
		        		document.ff.action="<%=path%>/yxgl/queryYxgl";
		        		document.ff.submit();
		        	});
			    }else{
				    alert("此院系代码系统已存在！");
				    return;
				}
		    },'json')
		}
	}
	//添加或修改Two
	function addOrUpdZyTwo(){
		if(Validator.Validate(document.getElementById('addOrUpdfrom'),3)){
			var yxdm = $("#yxdm").val();	
			var zt = $("#zt").val();
			var url="<%=path%>/yxgl/queryByYxdmCount";	
		    var param={'yxdm':yxdm,'zt':zt};	
		    $.post(url,param,function(result){
		        if(result){
		        	document.addOrUpdfrom.action = '<%=path%>/yxgl/addOrUpdYx';
		        	$('#addOrUpdfrom').ajaxSubmit(function(r){
		        		document.ff.action="<%=path%>/yxgl/queryYxgl";
		        		document.ff.submit();
		        	});
			    }else{
				    alert("此院系代码系统已存在！");
				    return;
				}
		    },'json')
		}
	}
	//查看院系信息
	function ckYx(yxdm){   
       var url="<%=path%>/yxgl/queryOneYx";
        $.post(url,{'yxdm':yxdm},function(result){
        	$("#ck_yxdm").val(result.yxdm);
            $("#ck_yxmc").val(result.yxmc);
            $("#ck_sjyxdm").val(result.sjyxdm);
            $("#ck_kyf").val(result.kyf);
            $("#ck_sfglbm").val(result.sfglbm);
            BOX_show('ckyx');
            $("#add").find("select").show();
        });
	   
	}
	//删除角色
	function delYx(){
		
	    if(isCheck('ids') == false){
	        alert("请选择要删除的院系");
	        return;
	    }
	    if(confirm("您确定要删除选中的院系吗？") == true){
	        document.ff.action = "<%=path%>/yxgl/delYx";
	        $('#ff').ajaxSubmit(function(r){
	    		document.ff.action="<%=path%>/yxgl/queryYxgl";
	    		document.ff.submit();
	    	});
	    }
	}
	var code;
	var zNodes;
	function queryQx(yxdm){
		BOX_show('qxjz'); 
		var param = {'jsdm':jsdm};
		var url = "<%=path%>/juesgl/queryQx";
		jQuery.post(url,param,function (result){
			zNodes =result.list1;
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			setCheck();
			BOX_remove('qxjz');
			$("#sq_jsdm").val(jsdm);
			BOX_show('sq');
		},'json');
	}
	
	//确定
	function queding(){
	    var flag="SelectZy";
	    document.getElementById("mxjs").value =  $('#cyjs').val()
	    $('#CyjsShow').html($('#cyjsDiv').html());
	    $("#czt").val("2");
	    BOX_remove(flag);
	    //添加修改
	    addOrUpdZyTwo();
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
            <div class="addlist_button  ml15"> <a href="javascript:delYx();" ><span>删&nbsp;&nbsp;除</span></a> </div>
            <!-- <div class="addlist_button  ml15"> <a href="#"><span>管&nbsp;&nbsp;理</span></a> </div> -->
          </td>
        </tr>
      </table>
      <form id="queryform" name="queryform" method="post">
        <input type="hidden" name="pageCount"  value="${yxglPage.pageCount}" />
        <table  border="0" align="right" cellpadding="0" cellspacing="0"  >
          <tr>
            <td >院系名称：</td>
            <td><input type="text" name="dmmc" id="qf_yxmc"  value="${yxglPage.dmmc}" /></td>
            <td ><div class="addlist_button2"> <a href="javascript:void(0);" onclick="javascript:querylike();return false;"><span>搜&nbsp;&nbsp;索</span></a> </div></td>
          </tr>
        </table>
      </form>
    </div>
    <div class="clr"></div>
    <div class="list">
      <form name="ff" method="post" id="ff" >
<!--       	<input type="hidden" name="pageCount"  value="${yxglPage.pageCount}" />-->
<!--		<input type="hidden" name="pageNo"  value="${yxglPage.pageNo}" />-->
<!--		<input type="hidden" name="pageSize"  value="${yxglPage.pageSize}" />-->
<!--		<input type="hidden" name="dmmc" value="${yxglPage.dmmc}"/>-->
		<!-- 查询用 -->
        <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
            <th width="3%" style="text-align:center"><input type="checkbox" id="ids" title="全选/不选"/></th>
            <th width="22%">院系代码</th>
            <th >院系名称</th> 
            <th width="24%">是否管理部门</th>
            <th>可用否</th>
            <th width="10%">操作</th>
          </tr>
          <c:forEach items="${yxlist}" var="map" varStatus="i">
 		    <tr <c:if test="${i.count % 2 eq '0'}">class="bgcol"</c:if>>
	  		  <td align="center"><input type="checkbox" name="ids" value="${map.yxdm}" /></td>
	  		  <td>${map.yxdm}</td>
	  		  <td>${map.yxmc}</td>
			  <td>${map.sfglbm eq '1' ? '是' : '否'}</td>
   			  <td>${map.kyf eq '1' ? '是' : '否'}</td>
   			  <td>
   			    <div class="cz_button cz1_1" title="修改" onclick="javascript:updDiv('${map.yxdm}');">
                </div>
                <c:if test="${map.xjsl eq '0'}">
                  <div class="cz_button cz1_6" title="选择专业" onclick="javascript:updYxzy('${map.yxdm}');">
	                <input name="mxjs"  value=","  id="mxjs" type="hidden" />
                  </div>
                </c:if>
              </td>
            </tr>
		  </c:forEach>
        </table>
      </form>
    </div>
    <div class="youtube">
      <c:if test="${not empty yxglPage }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="yxglPage" onlyOneShow="true" showListNo="true" action="yxgl/queryYxgl"/>
      </c:if>
    </div>
    <div class="clr"></div>
  </div>
</div>
 
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
        <td align="left">学院批量导入模版.xls</td>
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
      <tr>
        <td colspan="2" align="center"><div class="addlist_button1" style="float:right"> <a href="#"  title="取消" onclick="javascript:BOX_remove('dr');" ><span>取消</span></a> </div>
        <div class="addlist_button1 mr15" style="float:right" > <a href="#" title="保存" ><span>保存</span></a> </div></td>
      </tr>
    </table>
    <div class="clr"></div>
  </div>
</div> 
 
<div id="addOrUpd" style="display:none; width: 500px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form name="addOrUpdfrom" id="addOrUpdfrom" method="post">
	<input type="hidden" name="pageCount"  value="${yxglPage.pageCount eq '0' ? '1' : yxglPage.pageCount}" />
	<input type="hidden" name="pageNo"  value="${yxglPage.pageNo eq '0' ? '1' : yxglPage.pageNo}" />
	<input type="hidden" name="pageSize"  value="${yxglPage.pageSize}" />
	<input type="hidden" name="dmmc" value="${yxglPage.dmmc}"/> <!-- 查询用 --> 
	<input type="hidden" name="zt" id="zt"/><!-- 1：添加  2：修改 -->
    <div class="popup">
      <div class="Floatleft Pct100 mb10">
        <div class="popup_left">添加/修改</div>
        <a href="#" class="btn_close" onclick="javascript:BOX_remove('addOrUpd');"></a> 
      </div>
      <div class="clr"></div>
      <table id="divtab" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
        <tr>
          <th>院系代码：</th>
          <td align="left"><input type="text" name="yxdm" id="yxdm"  dataType="Number" msg="请填写数字" maxlength="10"/>
            <span class="red">*</span>
          </td>      
        </tr> 
        <tr>
          <th>院系名称：</th>
          <td align="left"><input type="text" name="yxmc" id="yxmc" dataType="Limit" min="1" max="20" msg="必填(20个字之内)"/>
            <span class="red">*</span>
          </td>      
        </tr>
        <tr>
          <th>上级院系：</th>
          <td align="left">
            <select name="sjyxdm" id="sjyxdm" dataType="Limit" min="1" max="20" msg="必选"/>
              <option value='0' <c:if test="${empty yxglPage.dmmc}">selected</c:if>>---请选择---</option>
    		  <c:forEach items="${sjyxlist}" var="map" varStatus="status">
        	    <option value='${map.YXDM}' <c:if test="${yxglPage.dmmc eq map.yxdm}">selected</c:if>>	        		
      		      ${map.YXMC}
     		    </option>
  			  </c:forEach>
            </select>
            <span class="red">*</span>
          </td>
        </tr>
        <tr>
          <th> 是否管理部门：</th>
          <td align="left">
            <select name="sfglbm" id="sfglbm" dataType="Limit" min="1" max="20" msg="必选"/>
              <option value="1" >是</option>
     		  <option value="0" >否</option>    
            </select>
            <span class="red">*</span>
          </td>
        </tr>
        <tr>
          <th>可用否：</th>
          <td align="left">
            <select name="kyf" id="kyf" dataType="Limit" min="1" max="20" msg="必选"/>
              <option value="1" >是</option>
     		  <option value="0" >否</option>
            </select>
            <span class="red">*</span>
          </td>
        </tr>
        <tr>
          <td colspan="2" align="center">
          	<div class="addlist_button1" style="float:right">
          	  <a href="#"  title="取消" onclick="javascript:BOX_remove('addOrUpd');" ><span>取消</span></a> 
          	</div>
            <div class="addlist_button1 mr15" style="float:right" >
              <a href="javascript:void(0);" onclick="javascript:addOrUpd();return false;" title="保存" ><span>保存</span></a> 
            </div>
          </td>
        </tr>
      </table>
      <div class="clr"></div>
    </div>
  </form>   
</div>
<!-- 层状态1:开启 2:关闭 -->
<input type="hidden" id="czt"/>
<div id="SelectZy" style="display:none; width: 800px; height: 505px ;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <div class="popup">
    <div class="Floatleft Pct100 mb10">
      <div class="popup_left">选择专业<input type="hidden" id="Zy" value = ',' /> </div>
      <a href="#" class="btn_close" onclick="javascript:BOX_remove('SelectZy');"></a> 
    </div>
    <div class="clr"></div>	  
    <iframe id="SelectZYIframe" src="<%=path%>/jsp/commons/main/loading.jsp" style="width:100%; height:450px;  " border="0" framespacing="0" marginheight="0" marginwidth="0"  frameborder="0" allowTransparency="true"></iframe>
     
<%--     <div class="Pct100 Floatleft mb10 mt10">--%>
        	<%--<div class="addlist_button  ml15" style="float:right"> 
        		<a href="javascript:void(0);onclick="javascript:BOX_remove('SelectZy')"">
        			<span>返&nbsp;&nbsp;回</span>
        		</a> 
        	</div>--%>
<%--      </div>--%>
      
  </div>
</div>
<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"> </div>
</body>
</html>


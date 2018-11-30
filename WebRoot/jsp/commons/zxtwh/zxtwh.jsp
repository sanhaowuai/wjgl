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
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jquery.ztree.core-3.1.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jquery.ztree.excheck-3.1.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript">	
	//多选
	$(document).ready(function(){
		$("#ff").baigoCheckall();
	});
	//查询
	function queryLike(){
	    document.queryform.action = '<%=path%>/zxtwh/queryZxtwh';
	    document.queryform.submit();
	}
	
	//添加弹出层
	function addDiv(){
		$("#zt").val("1");
		$("#xtdm").attr("readonly",false);
		Validator.ClearForm('addOrUpdfrom');
		$("#divtab").find("input[type='text']").val('');
		$("#divtab").find("select").val('');
		$("#divtab").find("textarea").val('');		
		BOX_show('addOrUpd');
	}
	
	//修改弹出层
	function updDiv(dm){
		$("#zt").val("2");
		$("#xtdm").attr("readonly",true);
		Validator.ClearForm('addOrUpdfrom');
		var url="<%=path%>/zxtwh/queryZxtwhOne";
	    var param={'dm':dm};
	    $.post(url,param,function(result){
	    	//zjlxTjXg_2(result.zjlx);
	        $.each(result,function(k, obj){
	            obj=obj==null? '' : obj;
	            $("input[name='"+k+"'],select[name='"+k+"'],textarea[name='"+k+"']").val(obj);
	        })
	    },'json')	 
	    
		BOX_show('addOrUpd');
	}
	
	//添加或修改
	function addOrUpd(){
		
		
		if(Validator.Validate(document.getElementById('addOrUpdfrom'),3)){
			if($("#zt").val() == "1"){
				$.post("<%=path%>/zxtwh/checkXtdm",{xtdm:$("#xtdm").val()},
					function(res){
						if(res == '1'){
							if(confirm("您确定要保存吗？") == true){					
					        	document.addOrUpdfrom.action = '<%=path%>/zxtwh/addOrUpdZxtwh';
					        	$('#addOrUpdfrom').ajaxSubmit(function(r){
					            	if(r="1"){
					                	alert("保存成功!");
					            		queryLike();
					                }else{
					                	alert("保存失败!");
					                	queryLike();    
				                	}
				        		});   
							}
						}else{
							alert("系统代码重复!");	
						}
					},'json')
			}else{
				if(confirm("您确定要保存吗？") == true){					
		        	document.addOrUpdfrom.action = '<%=path%>/zxtwh/addOrUpdZxtwh';
		        	$('#addOrUpdfrom').ajaxSubmit(function(r){
		            	if(r="1"){
		                	alert("保存成功!");
		            		queryLike();
		                }else{
		                	alert("保存失败!");
		                	queryLike();    
	                	}
	        		});   
				}
			}
			
		}
	}	
	
	//删除组件
	function delJs(){
	    if(isCheck('ids') == false){
	        alert("请选择要删除的数据");
	        return;
	    }
	    if(confirm("您确定要删除选中的数据吗？") == true){
	        document.ff.action = '<%=path%>/zxtwh/delZxtwh';
	        $('#ff').ajaxSubmit(function(r){
	    		if(r="1"){
					alert("删除成功!");
					queryLike();
		    	}else{
					alert("删除失败!");
					queryLike();
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
    <div class="butsea">
      <table  border="0" align="left" cellpadding="0" cellspacing="0"  >
        <tr>
          <td height="35px"> 
            <div class="addlist_button"> <a href="javascript:addDiv();"><span>添&nbsp;&nbsp;加</span></a> </div>
            <div class="addlist_button  ml15"> <a href="javascript:delJs();"><span>删&nbsp;&nbsp;除</span></a> </div> 
          </td>
        </tr>
      </table>
      <form name="queryform" method="post" id="queryform" >
        <table border="0" align="right" cellpadding="0" cellspacing="0"  >
          <tr>
            <td>系统名称：</td>
            <td><input type="text" name="pzxtmc" value="${page.pzxtmc}"/></td>
            <td><div class="addlist_button2"><a href="javascript:queryLike();"><span>搜&nbsp;&nbsp;索</span></a></div></td>
          </tr>
        </table>
      </form>
    </div>
    <div class="clr"></div>
    <div class="list">
      <form name="ff" method="post" id="ff" >		
		<!-- 查询用 -->
        <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
            <th ><input type="checkbox" id="ids" title="全选/不选" style="padding:0;margin-left:2px;*margin-left:-2px;"/></th>
            <th>系统名称</th>
            <th>系统代码</th>
            <th>访问连接</th> 
            <th>可用否</th>
            <th>APPID</th>
            <th>ICON</th>
            <th>系统类型</th>
            <th>显示顺序</th>
            <th width="40px">操作</th>
          </tr>
          <c:forEach items="${list}" var="map" varStatus="i">
            <tr <c:if test="${i.count % 2 eq '0'}">class="bgcol"</c:if>>
              <td>
              	<input name="ids" type="checkbox" value="${map.dm}" style="padding:0;margin-left:2px;*margin-left:-2px;"/>                
              </td>
              <td>${map.xtmc}</td>
              <td>${map.xtdm}</td>
              <td>${map.fwlj}</td>
              <td>${map.kyf == '1'?'是':'否'}</td>
              <td>${map.appid}</td>
              <td>${map.icon}</td>
              <td>
              <c:if test="${map.xtlx == '0'}">BS</c:if>
              <c:if test="${map.xtlx == '1'}">手机</c:if>
              <c:if test="${map.xtlx == '2'}">CS</c:if>
              </td>
              <td>${map.xssx}</td>
              <td>
				<div class="cz_button cz1_1" title="修改" onclick="javascript:updDiv('${map.dm}');"></div>               
              </td>
            </tr>
          </c:forEach>
        </table>
      </form>
    </div>
    <div class="youtube"> 
   	  <c:if test="${not empty page }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="page" onlyOneShow="true" showListNo="true" action="zxtwh/queryZxtwh"/>
      </c:if>
    </div>
    <div class="clr"></div>
  </div>
</div>
 
<!-- div --> 
<!-- 添加or修改 -->
<div id="addOrUpd" style="display:none; width: 800px;border: 8px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form name="addOrUpdfrom" id="addOrUpdfrom" method="post">
	
	<input type="hidden" id="dm" name="dm" value=""/>
	<input type="hidden" name="zt" id="zt"/><!-- 1：添加  2：修改 -->
    <div class="popup">
      <div class="Floatleft Pct100 mb10">
          <div class="popup_left">添加/修改</div>
          <a href="#" class="btn_close" onclick="javascript:BOX_remove('addOrUpd');"></a>
      </div>
      <div class="clr"></div>
      <table id="divtab" width="100%" cellpadding="0" cellspacing="0" class="addlist" style="border-collapse:collapse">      	
      	<tr>
          <th style="width: 85px;">系统名称：</th>
          <td align="left"><input size="40" type="text" name="xtmc" id="xtmc" dataType="Limit" min="1" max="100" msg="必填(100个字之内)"/><span class="red">*</span></td>
          <th style="width: 85px;">系统代码：</th>
          <td align="left"><input size="40" type="text" name="xtdm" id="xtdm" dataType="Limit" min="1" max="100" msg="必填(100个字之内)"/><span class="red">*</span></td>
        </tr>
        <tr>
			<th >访问连接：</th>
         	<td align="left" colspan="4" ><input size="80" type="text" name="fwlj" id="fwlj" dataType="Limit" min="1" max="100" msg="必填(100个字之内)" /><span class="red">*</span></td>	
		</tr>
        <tr>
			<th >APPID：</th>
         	<td align="left" colspan="4" ><input size="80" type="text" name="appid" id="appid" /></td>		
		</tr>
        <tr>
			<th >ICON：</th>
         	<td align="left"><input size="80" type="text" name="icon" id="icon" dataType="Limit" min="1" max="100" msg="必填(100个字之内)" /></td>	
          	<th style="width: 85px;">显示顺序：</th>
          	<td align="left"><input size="40" type="text" name="xssx" id="xssx" dataType="Limit" min="1" max="100" msg="必填(100个字之内)"/><span class="red">*</span></td>			
		</tr>
        <tr>
          <th>可用否：</th>
          <td>
	          <select id="kyf" name="kyf" dataType="Require"  msg="必选" >
					<option value="1">是</option> 
					<option value="0">否</option>
	          </select> <span class="red">*</span>
	      </td>
          <th>系统类型：</th>
          <td>
	          <select id="xtlx" name="xtlx" dataType="Require"  msg="必选" >
					<option value="0">BS</option> 
					<option value="1">手机</option>
					<option value="2">CS</option>					
	          </select> 
          </td>          
        </tr> 
        <tr>
          <td colspan="5" align="center">
            <div class="addlist_button1" style="float:right"><a href="javascript:BOX_remove('addOrUpd');" title="取消" ><span>取消</span></a> </div>
            <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:addOrUpd();" title="保存" ><span>保存</span></a></div>
          </td>
        </tr>
      </table>
      <div class="clr"></div>
    </div>
  </form>
</div>
<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"> </div>
</body>
</html>


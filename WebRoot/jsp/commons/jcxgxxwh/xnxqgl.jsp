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
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	   $("#ff").baigoCheckall();
	});
	function querylike(){
		document.queryform.action="<%=path%>/xnxqgl/queryXnxqgl";
		document.queryform.submit();
	}
	
	//添加弹出层
	function addDiv(){
		$("#zt").val("1");
		$("#ff_xn").attr("readonly",false);
	    $("#ff_xq").attr("readonly",false);	
		Validator.ClearForm('addOrUpdfrom');
		$("#divtab").find("input[type='text']").val('');
		$("#divtab").find("select").val('');
		BOX_show('addOrUpd');
		
	}
	
	//修改弹出层
	function updDiv(xn,xq){
		$("#zt").val("2");
		Validator.ClearForm('addOrUpdfrom');
		var url="<%=path%>/xnxqgl/queryXnxqByDm";
	    var param={'xn':xn,'xq':xq};
	    $.post(url,param,function(result){
	        $.each(result,function(k, obj){
	            obj=obj==null? '' : obj;
	            $("input[name='"+k+"'],select[name='"+k+"']").val(obj);
	        })
	    },'json')
	    $("#ff_xn").attr("readonly",true);
	    $("#ff_xq").attr("readonly",true);
		BOX_show('addOrUpd');
	}
	
	//添加或修改
	function addOrUpd(){	
		if(Validator.Validate(document.getElementById('addOrUpdfrom'),3)){		
			var xn = $("#ff_xn").val();
			var xq = $("#ff_xq").val();
			var zt = $("#zt").val();
			var url="<%=path%>/xnxqgl/queryByDmCount";
		    var param={'xn':xn,'xq':xq,'zt':zt};
		    $.post(url,param,function(result){
	
		        if(result){
		        	document.addOrUpdfrom.action = '<%=path%>/xnxqgl/addXnxqglSz';
		        	$('#addOrUpdfrom').ajaxSubmit(function(r){
		         		document.ff.action="<%=path%>/xnxqgl/queryXnxqgl";
		         		document.ff.submit();
		         	});
			    }else{
				    alert("此学年学期已存在！");
				    return;
				}
		    },'json')
		}
	}
	
	//删除学年学期
	function delXnxq(){
	    if(isCheck('ids') == false){
	        alert("请选择要删除的学年学期");
	        return;
	    }else{
	    	if(confirm("您确定要删除选中的学年学期吗？") == true){
	    		var i = $("[name='ids']:checked");
	    		var xqs = "";
	    		$.each(i,function(key,value){
	    			xqs += $(this).parent().next().next().text()+",";
	    		})
	        	document.ff.action = "<%=path%>/xnxqgl/delXnxq?xqs="+xqs;
	        	$('#ff').ajaxSubmit(function(r){
	         		document.ff.action="<%=path%>/xnxqgl/queryXnxqgl";
	         		document.ff.submit();
	         	});
	    	}
	    }
	}
</script>
</head>
  
<body> 
    <div class="clr"></div>
<%--    <div class="Menubox">--%>
<%--      <ul>--%>
<%--        <li><a href="<%=path%>/zylbgl/queryZylbgl">专业类别</a></li>--%>
<%--        <li><a href="<%=path%>/rxlxgl/queryRxlxgl">入校类型</a></li>--%>
<%--        <li><a href="<%=path%>/dqgl/queryDqgl">地区</a></li>--%>
<%--        <li><a href="<%=path%>/cdlbgl/queryCdlbgl">场地类别</a></li>--%>
<%--        <li class="hover">学年学期</li>--%>
<%--        <li><a href="<%=path%>/gwlxgl/queryGwlxgl">岗位类型</a></li>--%>
<%--        <li><a href="<%=path%>/gwgl/queryGwgl">岗位</a></li>--%>
<%--        <li><a href="<%=path%>/njgl/queryNjgl">年级</a></li>--%>
<%--        <li><a href="<%=path%>/jxcdgl/queryJxcdgl">教学场地</a></li>--%>
<%--        <li><a href="<%=path%>/jxlgl/queryJxlgl">教学楼</a></li>--%>
<%--        <li><a href="<%=path%>/jyslxgl/queryJyslxgl">教研室类型</a></li>--%>
<%--        <li><a href="<%=path%>/jysgl/queryJysgl">教研室</a></li>--%>
<%--        <li><a href="<%=path%>/xiaoqugl/queryXiaoqugl">校区</a></li>--%>
<%--        <li><a href="<%=path%>/klgl/queryKlgl">科类</a></li>--%>
<%--        <li><a href="<%=path%>/bjgl/queryBjgl">班级</a></li>--%>
<%--      </ul>--%>
<%--    </div> --%>
    <div class="butsea">
      <table  border="0" align="left" cellpadding="0" cellspacing="0"  >
        <tr>
          <td height="35px">
            <div class="addlist_button"> <a href="javascript:addDiv();"><span>添&nbsp;&nbsp;加</span></a> </div>
            <div class="addlist_button  ml15"> <a href="javascript:delXnxq();"><span>删&nbsp;&nbsp;除</span></a> </div>
          </td>
        </tr>
      </table>
      <form id="queryform" name="queryform" method="post">
        <table  border="0" align="right" cellpadding="0" cellspacing="0"  >
          <tr>
            <td >学年名称：</td>
            <td><input type="text" name="dmmc" id="qf_xn" value="${xnxqglPage.dmmc}"  /></td>
            <td ><div class="addlist_button2"> <a href="javascript:void(0);" onclick="javascript:querylike();return false;"><span>搜&nbsp;&nbsp;索</span></a> </div></td>
          </tr>
        </table>
      </form>
    </div>
    <div class="clr"></div>
    <div class="list">
      <form name="ff" method="post" id="ff" >
        <input type="hidden" name="pageCount"  value="${xnxqglPage.pageCount}" />
		<input type="hidden" name="pageNo"  value="${xnxqglPage.pageNo}" />
		<input type="hidden" name="pageSize"  value="${xnxqglPage.pageSize}" />
		<input type="hidden" name="dmmc"  value="${xnxqglPage.dmmc}" />
        <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
            <th width="6%"><input type="checkbox" id="ids" title="全选/不选" style="padding:0;margin-left:2px;*margin-left:-2px;"/></th>
            <th>学年</th>
            <th>学期</th>
            <th>学年名称</th>
            <th>学期名称</th>
            <th>可用否</th>
            <th>是否当前学期</th>
            <th width="15%">操作</th>
          </tr>
		  <c:forEach items="${xnxqList}" var="map" varStatus="status">
       	    <tr <c:if test="${status.count % 2 eq '0'}">class="bgcol"</c:if>>
        	  <td><input name="ids" type="checkbox" value="${map.xn}" style="padding:0;margin-left:2px;*margin-left:-2px;"/></td>
        	  <td>${map.xn}</td>
        	  <td>${map.xq}</td>
        	  <td>${map.xnmc}</td>
        	  <td>${map.xqmc}</td>
        	  <td>${map.kyf eq '1' ? '可用' : '不可用'}</td>
        	  <td>${map.sfdqxq eq '1' ? '是' : '不是'}</td>
              <td><div class="cz_button cz1_1" title="修改" onclick="javascript:updDiv('${map.xn}','${map.xq}');"></div></td>
      		</tr>
          </c:forEach>
        </table>
      </form>
    </div>
    <div class="youtube01"> 
      <c:if test="${not empty xnxqglPage }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="xnxqglPage" onlyOneShow="true" showListNo="true" action="xnxqgl/queryXnxqgl"/>
      </c:if>
    </div>
    <div class="clr"></div> 

<div id="addOrUpd" style="display:none; width: 400px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form id="addOrUpdfrom" name="addOrUpdfrom" method="post">
	<input type="hidden" name="pageCount"  value="${xnxqglPage.pageCount eq '0' ? '1' : xnxqglPage.pageCount}" />
	<input type="hidden" name="pageNo"  value="${xnxqglPage.pageNo eq '0' ? '1' : xnxqglPage.pageNo}" />
	<input type="hidden" name="pageSize"  value="${xnxqglPage.pageSize}" />
	<input type="hidden" name="dmmc"  value="${xnxqglPage.dmmc}" />
	<input type="hidden" name="zt" id="zt"/><!-- 1：添加  2：修改 -->
    <div class="popup">
      <div class="Floatleft Pct100 mb10">
        <div class="popup_left">添加/修改</div>
        <a href="#" class="btn_close" onclick="javascript:BOX_remove('addOrUpd');"></a>
      </div>
      <div class="clr"></div>
      <table id="divtab" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
        <tr>
          <th>学年：</th>
          <td align="left"><input type="text" name="xn" id="ff_xn"  dataType="Limit" min="1" max="15" msg="必填(15个字之内)"/>
            <span class="red">*</span>
          </td>
        </tr>
        <tr>
          <th>学期：</th>
          <td align="left"><input type="text" name="xq" id="ff_xq" dataType="Number" msg="请填写数字" maxlength="10"/>
            <span class="red">*</span>
          </td>
        </tr>
        <tr>
          <th>学年名称：</th>
          <td align="left"><input type="text" name="xnmc" id="ff_xnmc" dataType="Limit" min="1" max="20" msg="必填(20个字之内)" />
            <span class="red">*</span>
          </td>
        </tr>
        <tr>
          <th>学期名称：</th>
          <td align="left"><input type="text" name="xqmc" id="ff_xqmc" dataType="Limit" min="1" max="20" msg="必填(20个字之内)" />
            <span class="red">*</span>
          </td>
        </tr>
        <tr>
          <th>可用否：</th>
          <td align="left">
            <select name="kyf" id="ff_kyf">
          	  <option value="1" selected="selected">可用</option>
          	  <option value="0">不可用</option>
            </select>
          </td>
        </tr>
        <tr>
          <th>是否当前学期：</th>
          <td align="left">
            <select name="sfdqxq" id="ff_sfdqxq">
          	  <option value="1" selected="selected">是</option>
          	  <option value="0">不是</option>
            </select>
          </td>
        </tr>
        <tr>
          <td colspan="2" align="center"><div class="addlist_button1" style="float:right"><a href="javascript:BOX_remove('addOrUpd');"><span>取消</span></a> </div>
          <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:addOrUpd();" title="保存" ><span>保存</span></a> </div></td>
        </tr>
      </table>
      <div class="clr"></div>
    </div>
  </form>
</div>
<div id="setting"> </div>  
</body>
</html>

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
		document.queryform.action="<%=path%>/rxlxgl/queryRxlxgl";
		document.queryform.submit();
	}
	
	//添加弹出层
	function addDiv(){
		$("#zt").val("1");	
		Validator.ClearForm('addOrUpdfrom');
		$("#divtab").find("input[type='text']").val('');
		$("#divtab").find("select").val('');
		$("#ff_dm").attr("readonly",false);
		BOX_show('addOrUpd');
		
	}
	
	//修改弹出层
	function updDiv(dm){
		$("#zt").val("2");
		Validator.ClearForm('addOrUpdfrom');
		var url="<%=path%>/rxlxgl/queryRxlxByDm";
	    var param={'dm':dm};
	    $.post(url,param,function(result){
	        $.each(result,function(k, obj){
	            obj=obj==null? '' : obj;
	            $("input[name='"+k+"'],select[name='"+k+"']").val(obj);
	        })
	    },'json')
	    $("#ff_dm").attr("readonly",true);
		BOX_show('addOrUpd');
	}
	
	//添加或修改
	function addOrUpd(){	
		if(Validator.Validate(document.getElementById('addOrUpdfrom'),3)){		
			var dm = $("#ff_dm").val();
			var zt = $("#zt").val();
			var url="<%=path%>/rxlxgl/queryByDmCount";
		    var param={'dm':dm,'zt':zt};
		    $.post(url,param,function(result){
	
		        if(result){
		        	document.addOrUpdfrom.action = '<%=path%>/rxlxgl/addRxlxglSz';
		        	$('#addOrUpdfrom').ajaxSubmit(function(r){
		        		document.ff.action="<%=path%>/rxlxgl/queryRxlxgl";
		        		document.ff.submit();
		        	});
			    }else{
				    alert("此代码已存在！");
				    return;
				}
		    },'json')
		}
	}
	
	//删除专业类别
	function delRxlx(){
	    if(isCheck('ids') == false){
	        alert("请选择要删除的入校类型");
	        return;
	    }
	    if(confirm("您确定要删除选中的入校类型吗？") == true){
	        document.ff.action = "<%=path%>/rxlxgl/delRxlx";
	        $('#ff').ajaxSubmit(function(r){
	    		document.ff.action="<%=path%>/rxlxgl/queryRxlxgl";
	    		document.ff.submit();
	    	});
	    }
	}
</script>
</head>
  
<body>
   
    <div class="clr"></div>
<%--    <div class="Menubox">--%>
<%--      <ul>--%>
<%--        <li><a href="<%=path%>/zylbgl/queryZylbgl">专业类别</a></li>--%>
<%--        <li class="hover">入校类型</li>--%>
<%--        <li><a href="<%=path%>/dqgl/queryDqgl">地区</a></li>--%>
<%--        <li><a href="<%=path%>/cdlbgl/queryCdlbgl">场地类别</a></li>--%>
<%--        <li><a href="<%=path%>/xnxqgl/queryXnxqgl">学年学期</a></li>--%>
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
            <div class="addlist_button  ml15"> <a href="javascript:delRxlx();"><span>删&nbsp;&nbsp;除</span></a> </div>
          </td>
        </tr>
      </table>
      <form id="queryform" name="queryform" method="post">
        <table  border="0" align="right" cellpadding="0" cellspacing="0"  >
          <tr>
            <td >名称：</td>
            <td><input type="text" name="dmmc" id="qf_dm"  value="${rxlxglPage.dmmc}" /></td>
            <td ><div class="addlist_button2"> <a href="javascript:void(0);" onclick="javascript:querylike();return false;"><span>搜&nbsp;&nbsp;索</span></a> </div></td>
          </tr>
        </table>
      </form>
    </div>
    <div class="clr"></div>
    <div class="list">
      <form name="ff" method="post" id="ff" >
        <input type="hidden" name="pageCount"  value="${rxlxglPage.pageCount}" />
		<input type="hidden" name="pageNo"  value="${rxlxglPage.pageNo}" />
		<input type="hidden" name="pageSize"  value="${rxlxglPage.pageSize}" />
		<input type="hidden" name="dmmc"  value="${rxlxglPage.dmmc}" />
        <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
            <th width="6%"><input type="checkbox" id="ids" title="全选/不选" style="padding:0;margin-left:2px;*margin-left:-2px;"/></th>
            <th>代码</th>
            <th>名称</th>
            <th>可用否</th>
            <th width="15%">操作</th>
          </tr>
	      <c:forEach items="${rxlxList}" var="map" varStatus="status">
        	<tr <c:if test="${status.count % 2 eq '0'}">class="bgcol"</c:if>>
         	  <td><input name="ids" type="checkbox" value="${map.dm}" style="padding:0;margin-left:2px;*margin-left:-2px;"/></td>
         	  <td>${map.dm}</td>
         	  <td>${map.mc}</td>
         	  <td>${map.kyf eq '1' ? '可用' : '不可用'}</td>
              <td><div class="cz_button cz1_1" title="修改" onclick="javascript:updDiv('${map.dm}');"></div></td>
       		</tr>
          </c:forEach>
        </table>
      </form>
    </div>
    <div class="youtube01"> 
      <c:if test="${not empty rxlxglPage }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="rxlxglPage" onlyOneShow="true" showListNo="true" action="rxlxgl/queryRxlxgl"/>
      </c:if>
    </div>
    <div class="clr"></div>
 
<div id="addOrUpd" style="display:none; width: 400px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form id="addOrUpdfrom" name="addOrUpdfrom" method="post">
	<input type="hidden" name="pageCount"  value="${rxlxglPage.pageCount eq '0' ? '1' : rxlxglPage.pageCount}" />
	<input type="hidden" name="pageNo"  value="${rxlxglPage.pageNo eq '0' ? '1' : rxlxglPage.pageNo}" />
	<input type="hidden" name="pageSize"  value="${rxlxglPage.pageSize}" />
	<input type="hidden" name="dmmc"  value="${rxlxglPage.dmmc}" />
	<input type="hidden" name="zt" id="zt"/><!-- 1：添加  2：修改 -->
    <div class="popup">
      <div class="Floatleft Pct100 mb10">
        <div class="popup_left">添加/修改</div>
          <a href="#" class="btn_close" onclick="javascript:BOX_remove('addOrUpd');"></a>
      </div>
      <div class="clr"></div>
      <table id="divtab" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
        <tr>
          <th>代码：</th>
          <td align="left"><input type="text" name="dm" id="ff_dm"  dataType="Number" msg="请填写数字" maxlength="10"/>
            <span class="red">*</span>
          </td>
        </tr>
        <tr>
          <th>名称：</th>
          <td align="left"><input type="text" name="mc" id="ff_mc" dataType="Limit" min="1" max="20" msg="必填(20个字之内)" />
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

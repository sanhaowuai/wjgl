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
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>
<script type="text/javascript" >
	$(document).ready(function(){
	   $("#ff").baigoCheckall();
	});
	//查询
	function queryLike(){
	    document.queryform.action = '<%=path%>/xlbgl/queryXl';
	    document.queryform.submit();
	}
	
	//添加弹出层
	function addDiv(){
		$("#zt").val("1");
		Validator.ClearForm('addOrUpdfrom');
		$("#divtab").find("input[type='text']").val('');
		$("#divtab").find("select").val('');
		$("#dm").attr("readonly",false);
		BOX_show('addOrUpd');
	}
	
	//修改弹出层
	function updDiv(dm){
		$("#zt").val("2");
		Validator.ClearForm('addOrUpdfrom');
		var url="<%=path%>/xlbgl/queryXlByDm";
	    var param={'dm':dm};
	    $.post(url,param,function(result){
	        $.each(result,function(k, obj){
	            obj=obj==null? '' : obj;
	            $("input[name='"+k+"'],select[name='"+k+"'],textarea[name='"+k+"']").val(obj);
	        })
	    },'json')
	    $("#dm").attr("readonly",true);
		BOX_show('addOrUpd');
	}
	
	//添加或修改
	function addOrUpd(){
		if(Validator.Validate(document.getElementById('addOrUpdfrom'),3)){
			var dm = $("#dm").val();
			var zt = $("#zt").val();
			var url = "<%=path%>/xlbgl/queryByDmCount";
		    var param={'dm':dm,'zt':zt};
		    $.post(url,param,function(result){
		        if(result){
		        	document.addOrUpdfrom.action = '<%=path%>/xlbgl/addOrUpdXl'
	        		$('#addOrUpdfrom').ajaxSubmit(function(r){
		        		document.ff.action="<%=path%>/xlbgl/queryXl";
		        		document.ff.submit();
		        	});
			    }else{
				    alert("此代码系统已存在！");
				    return;
				}
		    },'json')
		}
	}
	//删除
	function delXl(){
	    if(isCheck('ids') == false){
	        alert("请选择要删除的选项");
	        return;
	    }
	    if(confirm("您确定要删除选中的选项吗？") == true){
	        document.ff.action = "<%=path%>/xlbgl/delXl";
	        $('#ff').ajaxSubmit(function(r){
	    		document.ff.action="<%=path%>/xlbgl/queryXl";
	    		document.ff.submit();
	    	});
	    }
	}
</script>
</head>
  
<body>
<div class="Contentbox">
  <div class="mainbg"></div>
  <div class="pd10">    
    <div class="clr"></div>
    <div class="Menubox">
      <ul>
        <li><a href="<%=path%>/jgbgl/queryJg"><span>籍贯</span></a></li>
        <li><a href="<%=path%>/mzbgl/queryMz"><span>民族</span></a></li>
        <li><a href="<%=path%>/ryflbgl/queryRyfl"><span>人员分类</span></a></li>
        <li><a href="<%=path%>/whcdbgl/queryWhcd"><span>文化程度</span></a></li>
        <li><a href="<%=path%>/xbbgl/queryXb"><span>性别</span></a></li>
        <li class="hover"><a href="<%=path%>/xlbgl/queryXl"><span>学历</span></a></li>
        <li><a href="<%=path%>/xwlbbgl/queryXwlb"><span>学位类别</span></a></li>
        <li><a href="<%=path%>/xwbgl/queryXw"><span>学位</span></a></li>
        <li><a href="<%=path%>/xzjbbgl/queryXzjb"><span>行政级别</span></a></li>
        <li><a href="<%=path%>/yzbgl/queryYz"><span>语种</span></a></li>
        <li><a href="<%=path%>/zcbgl/queryZc"><span>职称</span></a></li>
        <li><a href="<%=path%>/zzmmbgl/queryZzmm"><span>政治面貌</span></a></li>
        <li><a href="<%=path%>/gjgl/queryGjgl"><span>国籍</span></a></li>
      </ul>
    </div> 
    <div class="butsea">
      <table  border="0" align="left" cellpadding="0" cellspacing="0"  >
        <tr>
          <td height="35px">
            <div class="addlist_button"> <a href="javascript:addDiv();"><span>添&nbsp;&nbsp;加</span></a> </div>
            <div class="addlist_button  ml15"> <a href="javascript:delXl();"><span>删&nbsp;&nbsp;除</span></a> </div>
          </td>
        </tr>
      </table>
      <form id="queryform" name="queryform" method="post">
        <input type="hidden" name="pageCount"  value="${xlbPage.pageCount}" />
        <table  border="0" align="right" cellpadding="0" cellspacing="0"  >
          <tr>
            <td >名称：</td>
             <td><input type="text" name="dmmc" value="${xlbPage.dmmc}"/></td>
            <td ><div class="addlist_button2"> <a href="javascript:queryLike();"><span>搜&nbsp;&nbsp;索</span></a> </div></td>
          </tr>
        </table>
      </form>
    </div>
    <div class="clr"></div>
    <div class="list">
      <form name="ff" method="post" id="ff" >
      	<input type="hidden" name="pageCount"  value="${xlbPage.pageCount eq '0' ? '1' : xlbPage.pageCount}" />
		<input type="hidden" name="pageNo"  value="${xlbPage.pageNo eq '0' ? '1' : xlbPage.pageNo}" />
		<input type="hidden" name="pageSize"  value="${xlbPage.pageSize}" />
		<input type="hidden" name="dmmc" value="${xlbPage.dmmc}"/><!-- 查询用 -->
        <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
            <th width="6%" style="text-align:center"> <input type="checkbox" id="ids" title="全选/不选" /></th>
            <th>代码</th>
            <th>名称</th>
            <th>可用否</th>
            <th width="15%">操作</th>
          </tr>
          <c:forEach items="${xlList}" var="map" varStatus="i">
            <tr <c:if test="${i.count % 2 eq '0'}">class="bgcol"</c:if>>
           	  <td align="center"><input type="checkbox" name="ids"  value="${map.dm}"/></td>		   
              <td>${map.dm}</td>
              <td>${map.mc}</td>
              <td>${map.kyf eq '1' ? '是' : '否'}</td> 
              <td><div class="cz_button cz1_1" title="修改" onclick="javascript:updDiv('${map.dm}');"></div></td>
            </tr>
          </c:forEach>
        </table>
      </form>
    </div>
    <div class="youtube">
   	  <c:if test="${not empty xlbPage }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="xlbPage" onlyOneShow="true" showListNo="true" action="xlbgl/queryXl"/>
      </c:if>
    </div>
    <div class="clr"></div>
  </div>
</div>
 <!-- div --> 
<!-- 添加or修改 -->
<div id="addOrUpd" style="display:none; width: 400px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form name="addOrUpdfrom" id="addOrUpdfrom" method="post">
	<input type="hidden" name="pageCount"  value="${xlbPage.pageCount}" />
	<input type="hidden" name="pageNo"  value="${xlbPage.pageNo}" />
	<input type="hidden" name="pageSize"  value="${xlbPage.pageSize}" />
	<input type="hidden" name="dmmc" value="${xlbPage.dmmc}"/><!-- 查询用 -->
	<input type="hidden" name="zt" id="zt"/><!-- 1：添加  2：修改 -->
    <div class="popup">
      <div class="Floatleft Pct100 mb10">
        <div class="popup_left">添加/修改</div>
        <a href="#" class="btn_close" onclick="javascript:BOX_remove('addOrUpd');"></a> 
      </div>
      <div class="clr"></div>
      <table id="divtab" width="100%" cellpadding="0" cellspacing="0" class="addlist" style="border-collapse:collapse">
      	<tr>
          <th>代码：</th>
          <td align="left"><input type="text" name="dm" id="dm" dataType="Number" msg="请填写数字" maxlength="10"/>
          	<span class="red">*</span>
          </td>
        </tr>
        <tr>
          <th>名称：</th>
          <td align="left"><input type="text" name="mc" id="mc" dataType="Limit" min="1" max="20" msg="必填(20个字之内)"/>
          	<span class="red">*</span>
          </td>
        </tr>  
        <tr>
          <th>可用否：</th>
          <td align="left">
          	<select name="kyf" id="kyf">
          	  <option value="1" selected="selected">是</option>
          	  <option value="0">否</option>
          	</select>
          </td>
        </tr>
        <tr>
          <td colspan="2" align="center">
            <div class="addlist_button1" style="float:right"><a href="javascript:BOX_remove('addOrUpd');" title="取消" ><span>取消</span></a> </div>
            <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:addOrUpd();" title="保存" ><span>保存</span></a></div>
          </td>
        </tr>
      </table>
      <div class="clr"></div>
    </div>
  </form>
</div>
<div id="setting"> </div>       
</body>
</html>

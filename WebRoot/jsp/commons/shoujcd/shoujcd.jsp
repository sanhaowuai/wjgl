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
<script type="text/javascript" src="<%=path%>/resources/js/bootstrap.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	   $("#ff").baigoCheckall();
	});
	//查询
	function queryLike(){
	    document.queryform.action = '<%=path%>/shoujcd/queryQxb';
	    document.queryform.submit();
	}
	
	//添加弹出层
	function addDiv(){
		$("#zt").val("1");
		Validator.ClearForm('addOrUpdfrom');
		$("#divtab").find("input[type='text']").val('');
		$("#divtab").find("select").val('');
		$("#divtab").find("textarea").val('');
		$("#jsdm").attr("readonly",false);
		BOX_show('addOrUpd');
	}
	
	//修改弹出层
	function updDiv(qxdm){
		$("#zt").val("2");
		Validator.ClearForm('addOrUpdfrom');
		var url="<%=path%>/shoujcd/queryOneQx";
	    var param={'qxdm':qxdm};
	    $.post(url,param,function(result){
	        $.each(result,function(k, obj){
	            obj=obj==null? '' : obj;
	            $("input[name='"+k+"'],select[name='"+k+"'],textarea[name='"+k+"']").val(obj);
	        })
	    },'json')
	    $("#qxdm_add").attr("readonly",true);
		BOX_show('addOrUpd');
	}
	
		//添加或修改
	function addOrUpd(){
		if(Validator.Validate(document.getElementById('addOrUpdfrom'),3)){
			var qxdm = $("#qxdm_add").val();
			if(qxdm.indexOf("_")!=-1){
				alert("权限代码不允许存在“_”字符");
			}else {
			
				var zt = $("#zt").val();
				var url="<%=path%>/shoujcd/queryByQxdmCount";
			       var param={'qxdm':qxdm,'zt':zt};
			    $.post(url,param,function(result){
			        if(result){
			        	document.addOrUpdfrom.action = '<%=path%>/shoujcd/addOrUpdQx';
			        	$('#addOrUpdfrom').ajaxSubmit(function(r){
			        		document.ff.action="<%=path%>/shoujcd/queryQxb";
			        		document.ff.submit();
			        	});
				    }else{
					    alert("菜单代码已存在");
					    return;
					}
			    },'json')
			}
		}
	}
	
	
	
	
	//删除角色
	function delJs(){
	    if(isCheck('ids') == false){
	        alert("请选择要删除的菜单");
	        return;
	    }
	    if(confirm("您确定要删除选中的菜单吗？") == true){
	        document.ff.action = "<%=path%>/shoujcd/delQx";
	        $('#ff').ajaxSubmit(function(r){
	    		//document.ff.action = '<%=path%>/shoujcd/queryQxb';
	    	    //document.ff.submit();
	    	       if(r=="1")
	            {
		            alert("删除成功!");
		            document.ff.action = '<%=path%>/shoujcd/queryQxb';
		    	    document.ff.submit();
	            }else{
	          	  alert("删除失败!");
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
	 <div class="dropdown pull-right">
       <form name="queryform" method="post" id="queryform" >
	   <div class="btn-group">
		  <button type="button" class="btn btn-search dropdown-toggle" data-toggle="dropdown">搜索 <span class="caret"></span></button>
		  <div class="dropdown-menu search-list pull-right" role="menu" style="width:260px;">
          <table border="0" width="96%"  cellpadding="0" cellspacing="0"  >
		      <tr>
		      	<th width="100">子系统：</th>
	           	<td>
	           	  <select name="zxtdmPage" id="zxtdm_id" />
			     		  <option value="" >--请选择--</option>
			              <c:forEach items="${zxtList}" var="map">
			              <option value="${map.XTDM}" <c:if test="${page.zxtdmPage eq map.XTDM}">selected="selected"</c:if>>${map.XTMC}</option>
			              </c:forEach>
			            </select>
	           	</td>
		       </tr>
		       <tr>
		        <th>位置：</th>
	           	<td>
	           	  <select name="wzPage" id="wz_id" />
	     		  <option value="" >--请选择--</option>
	              <option value="L" <c:if test="${page.wzPage eq 'L'}">selected="selected"</c:if>>左</option>
	     		  <option value="R" <c:if test="${page.wzPage eq 'R'}">selected="selected"</c:if>>右</option>
	     		  <option value="C" <c:if test="${page.wzPage eq 'C'}">selected="selected"</c:if>>中</option>
	     		  <option value="B" <c:if test="${page.wzPage eq 'LB'}">selected="selected"</c:if>>下</option>
	            </select>
	           	</td>
		      </tr>
		       <tr>
		        <th>权限名称：</th>
	           	<td><input type="text" name="qxmcPage" value="${page.qxmcPage}"/></td>
		      </tr>
      	</table> 
	    <div class="divider"></div>
        <div class="clr"></div>
        <div class="addlist_button pull-right mr10"> <a href="javascript:queryLike();"><span>确定</span></a> </div>
	   </div>
	</div>
    </form>     
   </div>       
    </div>
    <div class="clr"></div>
    <div class="list">
      <form name="ff" method="post" id="ff" >
   		<input type="hidden" name="pageCount"  value="${page.pageCount}" />
		<input type="hidden" name="pageNo"  value="${page.pageNo}" />
		<input type="hidden" name="pageSize"  value="${page.pageSize}" />
		<!-- 查询用 -->
        <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
            <th><input type="checkbox" id="ids" title="全选/不选" style="padding:0;margin-left:2px;*margin-left:-2px;"/></th>
            <th>权限代码</th>
            <th>权限名称</th>
            <th>inco(图标)</th> 
            <th>AppUrl</th>
            <th>位置</th>
            <th>显示顺序</th>
            <th>子系统代码</th>
            <th>操作</th>
          </tr>
          <c:forEach items="${cdList}" var="map" varStatus="i">
            <tr <c:if test="${i.count % 2 eq '0'}">class="bgcol"</c:if>>
              <td>
                	<input name="ids" type="checkbox" value="${map.qxdm}" style="padding:0;margin-left:2px;*margin-left:-2px;"/>
              </td> 
              <td>${map.qxdm}</td>
              <td>${map.qxmc}</td>
              <td>${map.icon}</td> 
              <td>${map.appurl}</td>
              <td>
              <c:if test="${map.wz eq 'L'}">左</c:if>
              <c:if test="${map.wz eq 'R'}">右</c:if>
              <c:if test="${map.wz eq 'C'}">中</c:if>
              <c:if test="${map.wz eq 'B'}">下</c:if>
              </td>
              <td>${map.xsxx}</td> 
                <td>${map.zxtdm}</td> 
              <td>
				<div class="cz_button cz1_1" title="修改" onclick="javascript:updDiv('${map.qxdm}');"></div>               
              </td>
            </tr>
          </c:forEach>
        </table>
      </form>
    </div>
    <div class="youtube"> 
   	  <c:if test="${not empty page }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="page" onlyOneShow="true" showListNo="true" action="shoujcd/queryQxb"/>
      </c:if>
    </div>
    <div class="clr"></div>
  </div>
</div>
 
<!-- div --> 
<!-- 添加or修改 -->
<div id="addOrUpd" style="display:none; width: 500px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form name="addOrUpdfrom" id="addOrUpdfrom" method="post">
	<input type="hidden" name="zt" id="zt"/><!-- 1：添加  2：修改 -->
    <div class="popup">
      <div class="Floatleft Pct100 mb10">
          <div class="popup_left">添加/修改</div>
          <a href="#" class="btn_close" onclick="javascript:BOX_remove('addOrUpd');"></a>
      </div>
      <div class="clr"></div>
      <table id="divtab" width="100%" cellpadding="0" cellspacing="0" class="addlist" style="border-collapse:collapse">
      	<tr>
          <th style="width:120px">权限代码：</th>
          <td   align="left"><input type="text" name="qxdm" id="qxdm_add" dataType="Limit" min="1" max="20" msg="必填"/><span class="red">*</span></td>
        </tr>
        <tr>
          <th>权限名称：</th>
          <td align="left"><input type="text" name="qxmc" id="qxmc_add" dataType="Limit" min="1" max="200" msg="200个字之内"/><span class="red">*</span></td>
        </tr>
        <tr>
          <th>显示顺序：</th>
          <td align="left"><input type="text" name="xsxx" id="xsxx_add"  dataType="Number" msg="必填数字" maxlength="10"/><span class="red">*</span></td>
        </tr>
        <tr>
          <th>位置：</th>
            <td>
            <select name="wz" id="wz_add"  dataType="Limit" min="1" max="20" msg="必选"/>
     		  <option value="" >--请选择--</option>
              <option value="L" >左</option>
     		  <option value="R" >右</option>
     		  <option value="C" >中</option>
     		  <option value="B" >下</option>
            </select><span class="red">*</span>
            </td>
        </tr>
        <tr>
          <th >子系统：</th>
            <td>
		            <select name="zxtdm" id="zxtdm_add"  dataType="Limit" min="1" max="20" msg="必选"/> 
		     		  <option value="" >--请选择--</option>
		              <c:forEach items="${zxtList}" var="map">
		              <option value="${map.XTDM}" >${map.XTMC}</option>
		              </c:forEach>
		            </select><span class="red">*</span>
            </td>  </tr> 
             <tr>
          <th>ICON（图标）：</th>
          <td align="left"><input type="text" name="icon" id="inco_add" dataType="Limit" min="0" max="50" msg="50个字之内"/></td>
        </tr>
        <tr>
          <th>APPURL：</th>
          <td align="left"><input type="text" name="appurl" id="appurl_add" dataType="Limit" min="0" max="200" msg="200个字之内"/></td>
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
<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"> </div>
</body>
</html>


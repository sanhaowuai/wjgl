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
	    document.ff.action = '<%=path%>/grb/queryGrbcd';
	    document.ff.submit();
	}

	//删除菜单
	function delGrb(){
		if(isCheck('ids') == false){
	        alert("请选择要删除的菜单");
	        return;
	    }
	    if(confirm("您确定要删除选中的菜单吗？") == true){
	        document.ff.action = "<%=path%>/grb/delGrb";
	        $('#ff').ajaxSubmit(function(r){
		        if(r){
			        alert("删除成功!");
		        	queryLike();
		        }else{
					alert("删除失败!")
					queryLike();
			    }
	        	
	    	});
	    }
	}	
	
	
	
	//获取权限树形菜单
	var setting = {
		check: {
			enable: true
		},
		data: {
			simpleData: {
				enable: true
			}
		}
	};
	//角色授权
	var code;
	var zNodes;
	function queryQx(){		
		var zhi = null;
		var url = "<%=path%>/grb/queryQx";
		$.post(url,zhi,function(result){
			$.fn.zTree.init($("#treeDemo"), setting, result);
			setCheck();
			BOX_show('sq');
		},'json')
	}
	
	function setCheck() {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		type = { "Y":"ps", "N":"ps"};		
		zTree.setting.check.chkboxType = type;
		showCode('setting.check.chkboxType = { "Y" : "' + type.Y + '", "N" : "' + type.N + '" };');
	}
	
	function showCode(str) {
		if (!code) code = $("#code");
		code.empty();
		code.append("<li>"+str+"</li>");
	}

	function addCd(){
		var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
		var nodes = treeObj.getCheckedNodes(true);
		var id = new Array();
		var idd = new Array();
		var pId = new Array();
		for(var i=0 ;i<nodes.length;i++){
			id[i] = nodes[i].id;
			idd[i] = nodes[i].idd;
			pId[i] = nodes[i].pId;
		}		
		var url = "<%=path%>/grb/addGrbCd";
	    var zhi = {'id':''+id+'','idd':''+idd+'','fid':''+pId+''};
	    $.post(url,zhi,function (result){
	        if(result){	        	
	        	document.ff.action = '<%=path%>/grb/queryGrbcd';
	    	    document.ff.submit();
	        }else{
	        	alert("菜单添加失败!!");
	        }
	    },'json');
	    BOX_remove('sq');		
	}

	function bcsx(){
		if(Validator.Validate(document.getElementById('ff'),3)){
			if(confirm("您确定要保存所填写顺序吗？") == true){
				document.ff.action = '<%=path%>/grb/addBcsx';
	        	$('#ff').ajaxSubmit(function(r){
	            	if(r="1"){
	                	alert("保存顺序成功!");
	            		queryLike();
	                }else{
	                	alert("保存顺序失败!");
	                	queryLike();    
                	}
        		}); 
				
			}			
		}
	}
	
</script>
</head>

<body>
<div class="Contentbox">
  <div class="mainbg"></div>
  <div class="pd10">
<%--    	<div class="question" title="帮助" onclick="javascript:cha('${QXB.QXDM}');"></div> --%>
<%--     <div class="address">当前位置：${QXB.FQXMC} >> ${QXB.QXMC}</div> --%>
    <div class="clr"></div>
    <div class="butsea">
      <table  border="0" align="left" cellpadding="0" cellspacing="0"  >
        <tr>
          <td height="35px"> 
            <div class="addlist_button"> <a href="javascript:queryQx();"><span>添&nbsp;&nbsp;加</span></a> </div>
            <div class="addlist_button  ml15"> <a href="javascript:delGrb();"><span>删&nbsp;&nbsp;除</span></a> </div> 
            <div class="addlist_button  ml15"> <a href="javascript:bcsx();"><span>保&nbsp;&nbsp;存</span></a> </div> 
          </td>
        </tr>
      </table>      
    </div>
    <div class="clr"></div>
    <div class="list">
      <form name="ff" method="post" id="ff" >		
		<!-- 查询用 -->
        <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
            <th width="5%"><input type="checkbox" id="ids" title="全选/不选" style="padding:0;margin-left:2px;*margin-left:-2px;"/></th>
            <th>菜单名称</th>
<%--            <th>访问路径</th> --%>
            <th>显示顺序</th>
          </tr>
          <c:forEach items="${list}" var="map" varStatus="i">
            <tr <c:if test="${i.count % 2 eq '0'}">class="bgcol"</c:if>>
              <td>
              	<input name="ids" type="checkbox" value="${map.id}" style="padding:0;margin-left:2px;*margin-left:-2px;"/>               
              </td>        	
              	<td>${map.qxmc}</td>	
<%--              <td>${map.fwlj}</td>--%>
              <td><input dataType="Integer" msg="必填数字" id="xssx" name="xssx" value="${map.xssx}"/>
              	<input type="hidden" name="id" value="${map.id }"/>
              </td>
            </tr>
          </c:forEach>
        </table>
      </form>
    </div>    
    <div class="clr"></div>
  </div>
</div> 

<!-- 授权 -->
<div id="sq" style="display:none; width: 400px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <input type="hidden" name="jsdm" id="jsdm" value="" />
  <input type="hidden" name="yhdm" id="yhdm" value="" />
  <input type="hidden" id="sq_jsdm"/><!-- 角色代码（授权专用） -->
  <div class="popup"  style="margin-right:0px; padding-right:10px">
    <div class="Floatleft Pct100 mb10">
      <div class="popup_left">菜单管理</div>
      <a href="#" class="btn_close" onclick="javascript:BOX_remove('sq');"></a>
    </div>
    <div class="clr"></div>
    <div class="zTreeDemoBackground" style="height:280px; overflow-y:auto; overflow-x:hidden">
	  <ul id="treeDemo" class="ztree"></ul>
	</div>
	<div class="zTreeDemoBackground left" style="margin-top:10px; height:40px; ">
      <ul>
        <div class="addlist_button1" style="float:right"><a href="javascript:void(0);" title="取消" onclick="javascript:BOX_remove('sq');" ><span>取消</span></a> </div>   
        <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:addCd();" title="保存" ><span>保存</span></a> </div> 
	  </ul>
	</div>
    <div class="clr"></div>
  </div>
</div>


<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"> </div>
</body>
</html>


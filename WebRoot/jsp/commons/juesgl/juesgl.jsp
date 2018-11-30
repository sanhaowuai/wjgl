<%@ page language="java" import="java.util.*,com.incon.framework.util.propertiesLoader" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
propertiesLoader loader = new propertiesLoader();
String url=loader.getPropertyKey("/config/others/config.properties","inconmh.url");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>北京赢科后台管理系统</title>
<jsp:include page="../../include/css-main-include.jsp"></jsp:include>

<link href="<%=path%>/resources/js/treetable/stylesheets/master.css" rel="stylesheet" type="text/css"/>
<link href="<%=path%>/resources/js/treetable/stylesheets/jquery.treeTable.css" rel="stylesheet" type="text/css"/>
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

<script type="text/javascript" src="<%=path%>/resources/js/treetable/javascripts/jquery.treeTable.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/treetable/treeTable-my.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
        treetable();
	    $("#ff").baigoCheckall();
	});

	//查询
	function queryLike(){
	    document.queryform.action = '<%=path%>/juesgl/queryJs';
	    document.queryform.submit();
	}

	//查询所有父级角色
    function queryFjJs(jsdm){
        var app = "";
        var url = "<%=path%>/juesgl/queryFjJs?jsdm="+jsdm;
        $.post(url, function (result) {
            app += "<option value='-1'>最上级</option>";
            $.each(result, function (key, value) {
                if (value.fjsdm == '-1') {
                    app += "<option value='" + value.jsdm + "'>&nbsp;&nbsp;" + value.jsmc + "</option>";
                }else if (value.fjsdm != '-1') {
                    app += "<option value='" + value.jsdm + "'>&nbsp;&nbsp;&nbsp;&nbsp;" + value.jsmc + "</option>";
                }
            })
            $("#fjsdm").append(app);
        })
    }
	
	//添加弹出层
	function addDiv(){
		$("#zt").val("1");
		Validator.ClearForm('addOrUpdfrom');
		$("#divtab").find("input[type='text']").val('');
		$("#divtab").find("select").val('');
		$("#divtab").find("textarea").val('');
        $("#fjsdm").children().remove();
        queryFjJs('');
		$("#jsdm").attr("readonly",false);
		BOX_show('addOrUpd');
	}
	
	//修改弹出层
	function updDiv(jsdm){
		$("#zt").val("2");
		Validator.ClearForm('addOrUpdfrom');
        $("#fjsdm").children().remove();
        queryFjJs(jsdm);
		var url="<%=path%>/juesgl/queryJsByJsdm";
	    var param={'jsdm':jsdm};
	    $.post(url,param,function(result){
	        $.each(result,function(k, obj){
	            obj=obj==null? '' : obj;
	            $("input[name='"+k+"'],select[name='"+k+"'],textarea[name='"+k+"']").val(obj);
	        });
	    },'json')
	    $("#jsdm").attr("readonly",true);
		BOX_show('addOrUpd');
	}
	
	//添加或修改
	function addOrUpd(){
		if(Validator.Validate(document.getElementById('addOrUpdfrom'),3)){
			var jsdm = $("#jsdm").val();
			var zt = $("#zt").val();
			var url="<%=path%>/juesgl/queryByJsdmCount";
		    var param={'jsdm':jsdm,'zt':zt};
		    $.post(url,param,function(result){
		        if(result){
		        	document.addOrUpdfrom.action = '<%=path%>/juesgl/addOrUpdJs';
		        	$('#addOrUpdfrom').ajaxSubmit(function(r){
		        		document.ff.action = '<%=path%>/juesgl/queryJs';
		        	    document.ff.submit();
		        	});
			    }else{
				    alert("此角色代码系统已存在！");
				    return;
				}
		    },'json')
		}
	}
	
	//textarea输入字符数
	var textarea_maxlen = {
	  	isMax : function (){
			var textarea = document.getElementById("ms");	
		  	var max_length = textarea.maxLength;	
		  	if(textarea.value.length > max_length){
				textarea.value = textarea.value.substring(0, max_length);	
			}  
		},  
		disabledRightMouse : function (){
			document.oncontextmenu = function (){
				return false; 
			}  
		},  
		enabledRightMouse : function (){
			document.oncontextmenu = null;  
		}
	};
	
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
	var code;
	var zNodes;
	function queryQx(jsdm){
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
	
	//添加权限
	function addQx(){
		var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
		var nodes = treeObj.getCheckedNodes(true);
		var obj = new Array();
		var objqxfdm = new Array();
		var objqxzt = new Array();
		for(var i=0 ;i<nodes.length;i++){
			obj[i] = nodes[i].id;
			objqxfdm[i] = nodes[i].pId;
			objqxzt[i] = nodes[i].idd;
		}
		var jsdm = $("#sq_jsdm").val();
		var url = "<%=path%>/juesgl/addQx";
	    var param = {'jsdm':jsdm,'obj':''+obj+'','objqxfdm':''+objqxfdm+'','objqxzt':''+objqxzt+''};
	    jQuery.post(url,param,function (result){
	        if(result != null && result != ""){
	        	
	        }else{
	            return;
	        }
	    },'json');
	    BOX_remove('sq');
	}
	
	//删除角色
	function delJs(){
	    if(isCheck('ids') == false){
	        alert("请选择要删除的角色");
	        return;
	    }
	    if(confirm("其下级角色也将被删除，您确定要删除选中的角色吗？") == true){
	        document.ff.action = "<%=path%>/juesgl/delJs";
	        $('#ff').ajaxSubmit(function(r){
	    		document.ff.action = '<%=path%>/juesgl/queryJs';
	    	    document.ff.submit();
	    	});
	    }
	}
	//组件授权	
	function zjsq(qxlb,jsdm){
		if(qxlb == '2'){
				alert("暂未维护");
				return;
		}
		$("#iframename_jys").attr("src","<%=path%>/zjwh/queryZjqx?jsdm="+jsdm+"&qxlb="+qxlb);
		BOX_show('qx_jys');
	}
	function kjzjwh(qxlb,jsdm){
		if(qxlb == '2'){
				alert("暂未维护");
				return;
		}
	  top.createTab('kjzjwh01','框架组件布局维护','<%=path%>/jskjzjwh/'+jsdm)
	   
	}
	function mhzjwh(qxlb,jsdm){
		if(qxlb == '2'){
				alert("暂未维护");
				return;
		}
	   top.createTab('kjzjwh01','门户组件布局维护',"<%=url%>/jsmhzjbjwh/"+jsdm)
	  //"+url+"+'/commons/jszjbj/zjbjwh.jsp"
	  
	//	window.location.href=
		 
	}

	function appcdsq(jsdm){
		$("#appCdsqIframe").attr("src","<%=path%>/shoujcd/queryAppCdsq?jsdm="+jsdm);
		BOX_show('appCdsqDiv');
	}
	//子系统授权
	function zxtsq(jsdm){
		$("#iframename_zxt").attr("src","<%=path%>/zxtwh/queryZxtqx?jsdm="+jsdm);
		BOX_show('qx_zxt');
	}

	
	var randomNu = (new Date().getTime()) ^ Math.random();//解决IE缓存问题
	//根据角色代码批量插入用户角色比表
	function addRyjsbByJsdm(jsdm){
		$("#message").html("正在执行，请稍候");
		BOX_show('loading');
		var url = '<%=path%>/juesgl/addRyjsbByJsdm?_'+randomNu;						
    	$.ajax({
 	        type: "POST", 
            data:{'jsdm':jsdm},  	        
 	     	url:url,
 	        success : function (data) {
 	        	BOX_remove('loading');
 	        	if(data){
 	 	        	$("#loading-mess-message").html("执行成功");   		
 	        	}else{
 	        		$("#loading-mess-message").html("执行失败");
 	        	}
 	        	BOX_show('loading-mess'); 	    
 	        }
 	    });		
	}

    $.ajaxSetup({
        async: false
    });
    function expandall() {
        var zhi = $('tr[id^=node]');
        zhi.each(function (i, val) {
            $(val).expand();
        });
    }

    function collapseall() {
        var zhi = $('tr[id^=node]');
        zhi.each(function (i, val) {
            $(val).collapse();
        });
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
            <td >角色名称：</td>
            <td><input type="text" name="dmmc" value="${juesglPage.dmmc}"/></td>
            <td><div class="addlist_button2"><a href="javascript:queryLike();"><span>搜&nbsp;&nbsp;索</span></a></div></td>
          </tr>
        </table>
      </form>
    </div>
    <div class="clr"></div>
    <div class="list">
      <form name="ff" method="post" id="ff" >
<!--   		<input type="hidden" name="pageCount"  value="${juesglPage.pageCount}" />-->
<!--		<input type="hidden" name="pageNo"  value="${juesglPage.pageNo}" />-->
<!--		<input type="hidden" name="pageSize"  value="${juesglPage.pageSize}" />-->
		<input type="hidden" name="dmmc" value="${juesglPage.dmmc}"/>
		<!-- 查询用 -->
        <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line" id="zbtable">
          <tr>
            <th>
                <a href="javascript:void(0);" onclick="javascript:expandall();return false;" class="open_but"
                   title="展开"><i class="glyphicon glyphicon-circle-arrow-down"></i></a>
                <a href="javascript:void(0);" onclick="javascript:collapseall();return false;" class="close_but"
                   title="收起"><i class="glyphicon glyphicon-remove-circle"></i></a>
                <input type="checkbox" id="ids" title="全选/不选" style="padding:0;margin-left:2px;*margin-left:-2px;"/>
            </th>
            <%--<th width="16%">角色名称</th>--%>
            <th>登录主页链接</th>
            <th>可用否</th>
            <th>描述</th>
            <th >操作</th>
          </tr>
          <c:forEach items="${jsList}" var="map" varStatus="i">
              <tr id="node_${map.jsdm}" class=" ${i.count%2==0 ? 'bgcol':'' }
              <c:choose><c:when test='${map.fjsdm==-1}'>parent</c:when><c:otherwise>child child-of-node_${map.fjsdm}</c:otherwise></c:choose>" style="line-height:30px;">
              <td>
                  <span class="<c:choose><c:when test='${map.fjsdm==-1}'>folder</c:when><c:otherwise>file</c:otherwise></c:choose>">&nbsp;</span>
                  <c:choose>
            	  <c:when test="${map.sfsd eq '1'}">
            	    <span class="lock" style="padding-right: 8px;margin-left: 5px;padding-top: 5px;"></span>
                  </c:when>
                  <c:otherwise>
                	<input name="ids" type="checkbox" value="${map.jsdm}" style="padding:0;margin-left:2px;*margin-left:-2px;"/>
                  </c:otherwise>
                </c:choose>
                ${map.jsmc}
              </td>
              <%--<td>${map.jsmc}</td>--%>
              <td>${map.dlzylj}</td>
              <td>${map.kyf eq '1' ? '可用' : '不可用'}</td> 
              <td>${map.ms}</td> 
              <td>
              	<div class="cz_button cz3_1"  title="系统组件授权" onclick="javascript:zjsq('0','${map.jsdm}');"></div>
              	<div class="cz_button cz4_6"  title="系统组件布局维护" onclick="javascript:kjzjwh('0','${map.jsdm}');"></div>
              	<div class="cz_button cz2_2"  title="门户组件授权" onclick="javascript:zjsq('1','${map.jsdm}');"></div>
              	<div class="cz_button cz1_5"  title="报表授权" onclick="javascript:zjsq('2','${map.jsdm}');"></div>
              	<div class="cz_button cz4_4"  title="子系统授权" onclick="javascript:zxtsq('${map.jsdm}');"></div>
              	<c:if test="${map.jsdm eq '2' or map.jsdm eq '3'}">
              	<div class="cz_button cz3_4"  title="APP菜单授权" onclick="javascript:appcdsq('${map.jsdm}');"></div>
              	</c:if>
              	<c:if test="${map.jsdm eq '2' }">
              	  <div class="cz_button cz6_5"  title="门户组件布局维护" onclick="javascript:mhzjwh('0','2');"></div>
              	</c:if>
              	
              	 <c:if test="${ map.jsdm eq '3'}">
              	  <div class="cz_button cz6_5"  title="门户组件布局维护" onclick="javascript:mhzjwh('0','3');"></div>
              	</c:if>
              	
                <div class="cz_button cz2_3"  title="角色授权" onclick="javascript:queryQx('${map.jsdm}');"></div>
				<div class="cz_button cz1_1" title="修改" onclick="javascript:updDiv('${map.jsdm}');"></div>    
				<c:if test="${map.jsdm eq '2' or map.jsdm eq '3'}">
				<div class="cz_button cz2_3"  title="增量初始化人员" onclick="javascript:addRyjsbByJsdm('${map.jsdm}');"></div> 
				</c:if>          
              </td>
            </tr>
          </c:forEach>
        </table>
      </form>
    </div>
    <div class="clr"></div>
  </div>
</div>
 
<!-- div --> 
<!-- 添加or修改 -->
<div id="addOrUpd" style="display:none; width: 500px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form name="addOrUpdfrom" id="addOrUpdfrom" method="post">
	<input type="hidden" name="pageCount"  value="${juesglPage.pageCount eq '0' ? '1' : juesglPage.pageCount}" />
	<input type="hidden" name="pageNo"  value="${juesglPage.pageNo eq '0' ? '1' : juesglPage.pageNo}" />
	<input type="hidden" name="pageSize"  value="${juesglPage.pageSize}" />
	<input type="hidden" name="dmmc" value="${juesglPage.dmmc}"/><!-- 查询用 -->
	<input type="hidden" name="zt" id="zt"/><!-- 1：添加  2：修改 -->
    <div class="popup">
      <div class="Floatleft Pct100 mb10">
          <div class="popup_left">添加/修改</div>
          <a href="#" class="btn_close" onclick="javascript:BOX_remove('addOrUpd');"></a>
      </div>
      <div class="clr"></div>
      <table id="divtab" width="100%" cellpadding="0" cellspacing="0" class="addlist" style="border-collapse:collapse">
      	<tr>
          <th>角色代码：</th>
          <td align="left"><input type="text" name="jsdm" id="jsdm" dataType="Number" msg="请填写数字" maxlength="10"/><span class="red">*</span></td>
        </tr>
        <tr>
          <th>角色名称：</th>
          <td align="left"><input type="text" name="jsmc" id="jsmc" dataType="Limit" min="1" max="20" msg="必填(20个字之内)"/><span class="red">*</span></td>
        </tr>
         <tr>
              <th>父级角色：</th>
              <td align="left">
                  <select name="fjsdm" id="fjsdm"></select>
              </td>
          </tr>
          <tr>
          <th>主页链接地址：</th>
          <td align="left">
          <!-- <input type="text" name="dlzylj" id="dlzylj" maxlength="40"/> -->
          <select name="dlzylj" id="dlzylj">
          	  <c:forEach items="${zyljdzList}" var="zylj">
          	  	<option value="${zylj.LJ}">${zylj.MBMC}</option>
          	  </c:forEach>
          </select>
          </td>
        </tr> 
        <tr>
          <th>可用否：</th>
          <td align="left">
          	<select name="kyf" id="kyf">
       		  <option value="1" selected="selected">可用</option>
       		  <option value="0">不可用</option>
          	</select>
          </td>
        </tr>
        <tr>
          <th>角色描述：</th>
          <td align="left"><textarea name="ms" id="ms" cols="2" rows="2" style="width: 99%; height: 93px;" maxLength="200" onkeyup="textarea_maxlen.isMax()" onfocus="textarea_maxlen.disabledRightMouse()" onblur="textarea_maxlen.enabledRightMouse()"></textarea></td>
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

<!-- 授权 -->
<div id="sq" style="display:none; width: 400px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <input type="hidden" id="sq_jsdm"/><!-- 角色代码（授权专用） -->
  <div class="popup"  style=" margin-right:0px; padding-right:10px">
    <div class="Floatleft Pct100 mb10">
      <div class="popup_left">授权</div>
      <a href="#" class="btn_close" onclick="javascript:BOX_remove('sq');"></a>
    </div>
    <div class="clr"></div>
    <div class="zTreeDemoBackground" style="height:280px; overflow-y:auto; overflow-x:hidden">
     <ul id="treeDemo" class="ztree"></ul>
    </div>
    <div class="zTreeDemoBackground left" style="margin-top:10px; height:40px; ">
      <ul>
        <div class="addlist_button1" style="float:right"><a href="javascript:void(0);" title="取消" onclick="javascript:BOX_remove('sq');" ><span>取消</span></a> </div>   
        <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:addQx();" title="保存" ><span>保存</span></a> </div> 
      </ul>
    </div>
    <div class="clr"></div>
  </div>
</div>

<!-- 权限树型菜单加载 -->
<div id="qxjz" style="display:none; width: 400px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <div class="popup">
    <div style="width:100%; float:left;text-align:center" >
	  <div class="loading_10"></div>
    </div>
	<div class="clr"></div>
  </div>
  <div class="clr"></div>
</div>

<!-- 组件授权 -->
<div id="qx_jys" style="display:none; width:700px; border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <div class="popup">
    <div class="Floatleft Pct100 mb10">
      <div class="popup_left">组件权限</div>
      <a href="#" class="btn_close" onclick="javascript:BOX_remove('qx_jys');"></a>
    </div>
    <div class="clr"></div>
    <div class="Floatleft Pct100 ">
	  <iframe id="iframename_jys" name="iframename_jys" src="" border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%; height: 400px;" frameborder="0" allowTransparency="true"></iframe>
	</div>
    <div class="clr"></div>
  </div>
</div>

<!-- 子系统授权 -->
<div id="qx_zxt" style="display:none; width:700px; border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <div class="popup">
    <div class="Floatleft Pct100 mb10">
      <div class="popup_left">子系统授权</div>
      <a href="#" class="btn_close" onclick="javascript:BOX_remove('qx_zxt');"></a>
    </div>
    <div class="clr"></div>
    <div class="Floatleft Pct100 ">
	  <iframe id="iframename_zxt" name="iframename_zxt" src="" border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%; height: 400px;" frameborder="0" allowTransparency="true"></iframe>
	</div>
    <div class="clr"></div>
  </div>
</div>

<!-- app菜单授权 -->
<div id="appCdsqDiv" style="display:none; width:700px; border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <div class="popup">
    <div class="Floatleft Pct100 mb10">
      <div class="popup_left">app菜单授权</div>
      <a href="#" class="btn_close" onclick="javascript:BOX_remove('appCdsqDiv');"></a>
    </div>
    <div class="clr"></div>
    <div class="Floatleft Pct100 ">
	  <iframe id="appCdsqIframe" name="appCdsqIframe" src="" border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%; height: 400px;" frameborder="0" allowTransparency="true"></iframe>
	</div>
    <div class="clr"></div>
  </div>
</div>
<div id="loading" style="display:none; width: 300px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <div class="popup">
     <table  border="0" width="100%" cellpadding="0" cellspacing="0" >
      <tr>
         <td align="center" valign="middle" height="100px"><img src="<%=path%>/resources/style/blue/images/loading.gif" /><br /><br /><font id="message" class="FONT12 red LH30"></font></td>        
      </tr>
     </table>
    <div class="clr"></div>
  </div>
</div>

<div id="loading-mess" style="display:none; width: 600px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <div class="popup">
    <div class="Floatleft Pct100 mb10">
      <div class="popup_left">提示信息</div>
      <a href="#" class="btn_close" onclick="javascript:BOX_remove('loading-mess');"></a>
    </div> 
    <div class="clr"></div> 
     <table id="divtab" width="100%" cellpadding="0" cellspacing="0" class="addlist" style="border-collapse:collapse">
      <tr>
         <td align="center" valign="middle" height="100px">
         <font id="loading-mess-message" class="FONT12 red LH30"></font>
         </td>        
      </tr>
     </table>
    <div class="clr"></div>
  </div>
</div>
<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>


<div id="setting"> </div>
</body>
</html>


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
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jquery.ztree.core-3.1.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jquery.ztree.excheck-3.1.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/bootstrap.js"></script>
<script type="text/javascript">
	
	//模糊查询
	function queryLike(){
		document.form1.action="<%=path%>/ryjs/ryjsQuery";
		document.form1.submit();
	}
	
	//文本框改变时改变校级
	function changeGljb(yhdm,jsdm,obj){
		var url = "<%=path%>/ryjs/changeGljb";
		var gljb = $(obj).val();
		if(gljb == 1){
			gljb = 2;
		}else{
			gljb = 1;
		}
		var zhi = {'yhdm':yhdm,'gljb':gljb,'jsdm':jsdm};
		$.post(url,zhi,function(result){
			if(result){
				if($(obj).val() == 1){
					$(obj).val("2");
					$(obj).parent().next().next().children("div").eq(5).show();
					$(obj).parent().next().next().children("div").eq(6).show();
				}else{
					$(obj).val("1");
					$(obj).parent().next().next().children("div").eq(5).hide();
					$(obj).parent().next().next().children("div").eq(6).hide();
				}
			}
		})
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
	function queryQx(yhdm,jsdm){
		$("#jsdm").val(jsdm);
		$("#yhdm").val(yhdm);
		var zhi = {'yhdm':yhdm,'jsdm':jsdm};
		var url = "<%=path%>/ryjs/queryQx";
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
	
	//添加权限
	function addQx(){
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
		var jsdm = $("#jsdm").val();
		var yhdm = $("#yhdm").val();
		var url = "<%=path%>/ryjs/addQx";
	    var zhi = {'jsdm':jsdm,'yhdm':yhdm,'id':''+id+'','idd':''+idd+'','fid':''+pId+''};
	    $.post(url,zhi,function (result){
	        if(result){
	        	//$("#xm").val("");
	        	document.form1.action="<%=path%>/ryjs/ryjsQuery";
	        	document.form1.submit();
	        }else{
	        	alert("人员授权失败!!");
	        }
	    },'json');
	    BOX_remove('sq');
	}
	
	//跳转到iframe页
	function forward(yhdm,jsdm){
		$("#iframename").attr("src","<%=path%>/ryjs/querySjqx?yhdm="+yhdm+"&jsdm="+jsdm);
		BOX_show('qx');
	}
	
	//跳转到教研室iframe页
	function forward_jys(yhdm,jsdm){
		$("#iframename_jys").attr("src","<%=path%>/ryjs/queryJysSjqx?yhdm="+yhdm+"&jsdm="+jsdm);
		BOX_show('qx_jys');
	}
	
	//查询所有角色
	function queryJs(yhdm){
		$("#table_js tr").remove();
		$("#yhdms").val(yhdm);
		var url = "<%=path%>/ryjs/queryJs";
		var zhi = {'yhdm':yhdm};
		var app="";
		$.post(url,zhi,function(result){
	        $.each(result,function(key,value){
	        	app+="<tr><th width='10%'><input name='checkbox' type='checkbox' ";
	        	app+="value='"+value.jsdm+"' id='checkbox2_"+value.jsdm+"'";
	        	if(value.checked == 1){
	        		app+=" checked='checked'";
	        	}
	        	if(value.mrjs == 1){
	        		app+=" disabled";
	        	}
	        	app+=" /></th>";
	        	app+="<td align='left'>"+value.jsmc+"</td></tr>";
	        })
	        app+="<tr><td colspan='2' align='center'>";
			app+="<div class='addlist_button1' style='float:right'><a href=\"javascript:void(0);\" ";
			app+="title='取消' onclick=\"javascript:BOX_remove('role');\" ><span>取消</span></a> </div>";
			app+="<div class='addlist_button1 mr15' style='float:right' >";
			app+="<a href=\"javascript:void(0);\" onclick=\"javascript:addJs();\" title='保存' >";
			app+="<span>保存</span></a> </div></td> </tr>";
			$("#table_js").append(app);
			//判断已经选中的人员角色的创建人是否为登录的角色，如果是，那么可以修改，如果不是，不能修改
		})
		BOX_show("role");
	}
	
	//添加人员角色
	function addJs(){
		var jsdms = "";
		var yhdm = $("#yhdms").val();
		var check = $("[id^=checkbox2_]:checked");
		if(check.length > 0){
			$.each(check,function(){
				jsdms += $(this).val() + ",";
			})
			document.form_js.action="<%=path%>/ryjs/addJs?jsdms="+jsdms;
			$("#form_js").ajaxSubmit(function(r){
				document.form1.action="<%=path%>/ryjs/ryjsQuery";
				document.form1.submit();
			});			
		}else {
			alert("请选择一个角色");
		}

	}
	
	//关闭弹出层
	function closeDiv(obj){
		BOX_remove(obj);
		//$("#xm").val("");
		document.form1.action="<%=path%>/ryjs/ryjsQuery";
		document.form1.submit();
		
	}
	
	//改变
	function changeMrjs(yhdm,obj){
		var mrjs = $(obj).val();
		document.form1.action="<%=path%>/ryjs/ryjsChangeMrjs?yhdm="+yhdm+"&mrjs="+mrjs;
		$("#form1").ajaxSubmit(function(r){
			document.form1.action="<%=path%>/ryjs/ryjsQuery";
			document.form1.submit();
		});
	}

	function zjsq(qxlb,yhdm,jsdm){
	    if(qxlb == '2'){
				alert("暂未维护");
				return;
		}
		$("#iframename_jyss").attr("src","<%=path%>/zjwh/queryRyjsZjqx?yhdm="+yhdm+"&jsdm="+jsdm+"&qxlb="+qxlb);
		BOX_show('qx_jyss');
	}
	//子系统授权
	function zxtsq(yhdm,jsdm){
		$("#iframename_zxts").attr("src","<%=path%>/zxtwh/queryRyjsZxtqx?yhdm="+yhdm+"&jsdm="+jsdm);
		BOX_show('qx_zxts');
	}

</script>
</head>

<body>
<div class="Contentbox">
  <input type="hidden" id="cjr" value="${sessionScope.CURRENT_USER.yhdm}"/>
  <input type="hidden" id="sfcjgly" value="${sessionScope.CURRENT_USER.sfcjgly}"/>
  <div class="mainbg"></div>
  <div class="pd10">
   	<div class="question" title="帮助" onclick="javascript:cha('${QXB.QXDM}');"></div>
    <div class="address">当前位置：${QXB.FQXMC} >> ${QXB.QXMC}</div>
    <div class="clr"></div>
    <div class="butsea"> 
	 <div class="dropdown pull-right">
       <form method="post" name="form1" id="form1">
	   <div class="btn-group">
		  <button type="button" class="btn btn-search dropdown-toggle" data-toggle="dropdown">搜索 <span class="caret"></span></button>
		  <div class="dropdown-menu search-list pull-right" role="menu" style="width:260px;">
          <table border="0" width="96%"  cellpadding="0" cellspacing="0"  >
		      <tr>
		      	<th width="90">院系：</th>
	           	<td>
	           	  <select name="yxdm" id="yxdm" >
	      		    <option value="">--请选择--</option>
	      		    <c:forEach items="${yxlist}" var="map" varStatus="status">
	       		      <option value='${map.YXDM}' <c:if test="${map.YXDM eq ryjsPage.yxdm}">selected</c:if>>
	    		         ${map.YXMC}
	    	          </option>
				    </c:forEach>
	    		  </select>
	           	</td>
		       </tr>
		       <tr>
		        <th>角色：</th>
	           	<td>
	           	  <select name="jsdm">
	           	    <option selected="selected" value="">--请选择--</option>
	           	  	<c:forEach items="${list_js}" var="list_js">
	           	  	  <option value="${list_js.jsdm}" <c:if test='${list_js.jsdm eq ryjsPage.jsdm}'>selected="selected"</c:if>>${list_js.jsmc}</option>
	           	  	</c:forEach>
	           	  </select>
	           	</td>
		      </tr>
		       <tr>
		        <th>姓名/职工号：</th>
	           	<td><input type="text" name="xm" id="xm"  value="${ryjsPage.xm}" /></td>
		      </tr>
      	</table> 
	    <div class="divider"></div>
        <div class="clr"></div>
        <div class="addlist_button pull-right mr10"> <a href="javascript:void(0);" onclick="javascript:queryLike();"><span>确定</span></a> </div>
	   </div>
	</div>
    </form>     
   </div>     
    </div>
    <div class="clr"></div>
    <div class="list">
      <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
        <tr>
          <th>职工号/学号</th>
          <th>姓名</th>
          <th>性别</th>
          <th>角色</th>
          <th>是否校级</th> 
          <th>默认角色</th>
          <th  width="300px">操作</th>
        </tr>
        <c:choose>
          <c:when test="${sessionScope.CURRENT_USER.sfcjgly eq 1}">
          <c:forEach items="${list}" var="list" varStatus="i">
          <tr <c:if test="${i.count % 2 eq '0'}">class="bgcol"</c:if>>
            <td>${list.yhdm}</td>
            <td>${list.xm}</td>
            <td>${list.xb}</td>
            <td>${list.jsmc}</td>
            <td>
              <input type="checkbox" name="checkbox" id="checkbox_${list.ryjsdm}" value="${list.gljb}" <c:if test='${list.gljb eq 1}'>checked</c:if> onclick="changeGljb('${list.yhdm}','${list.jsdm}',this);" />
            </td>
            <td>
              <input type="checkbox" name="checkbox" id="checkbox_${list.ryjsdm}" value="${list.jsdm}" <c:if test='${list.mrjs eq 1}'>checked</c:if> onclick="changeMrjs('${list.yhdm}',this);" />
            </td>
            <td>
              <div class="cz_button cz3_1"  title="系统组件授权" onclick="javascript:zjsq('0','${list.yhdm}','${list.jsdm}');"></div>
              <div class="cz_button cz2_2"  title="门户组件授权" onclick="javascript:zjsq('1','${list.yhdm}','${list.jsdm}');"></div>
              <div class="cz_button cz1_5"  title="报表授权" onclick="javascript:zjsq('2','${list.yhdm}','${list.jsdm}');"></div>
              <div class="cz_button cz4_4"  title="子系统授权" onclick="javascript:zxtsq('${list.yhdm}','${list.jsdm}');"></div>
              <div class="cz_button cz3_4" title="菜单授权" onclick="javascript:queryQx('${list.yhdm}','${list.jsdm}');"></div>
              <div class="cz_button cz6_5"  title="数据查询权限" onclick="javascript:forward('${list.yhdm}','${list.jsdm}');" <c:if test='${list.gljb == 1}'>style="display:none"</c:if>></div>
              <div class="cz_button cz4_4"  title="教研室数据查询权限" onclick="javascript:forward_jys('${list.yhdm}','${list.jsdm}');" <c:if test='${list.gljb == 1}'>style="display:none"</c:if>></div>
              <div class="cz_button cz2_3" title="修改角色" onclick="javascript:queryJs('${list.yhdm}');"></div> 
            </td>
          </tr>
        </c:forEach>
      </c:when>
      <c:otherwise>
        <c:forEach items="${list}" var="list" varStatus="i">
          <tr <c:if test="${i.count % 2 eq '0'}">class="bgcol"</c:if>>
            <td>${list.yhdm}</td>
            <td>${list.xm}</td>
            <td>${list.xb}</td>
            <td>${list.jsmc}</td>
            <td><input type="checkbox" name="checkbox" id="checkbox_${list.ryjsdm}" value="${list.gljb}" disabled /></td>
            <td><input type="checkbox" name="checkbox" id="checkbox_${list.ryjsdm}" value="${list.jsdm}" <c:if test='${list.mrjs eq 1}'>checked</c:if> onclick="changeMrjs('${list.yhdm}',this);" disabled /></td>
            <td>
              <div class="cz_button cz3_1"  title="系统组件授权" onclick="javascript:zjsq('${list.yhdm}','${list.jsdm}');"></div>
              <div class="cz_button cz2_2"  title="门户组件授权" onclick="javascript:zjsq('${list.yhdm}','${list.jsdm}');"></div>
              <div class="cz_button cz1_5"  title="报表授权" onclick="javascript:zjsq('${list.yhdm}','${list.jsdm}');"></div>
              <div class="cz_button cz4_4"  title="子系统授权" onclick="javascript:zxtsq('${list.yhdm}','${list.jsdm}');"></div>
              <div class="cz_button cz3_4" title="菜单授权" onclick="javascript:queryQx('${list.yhdm}','${list.jsdm}');"></div>
              <div class="cz_button cz6_5"  title="数据查询权限" onclick="javascript:forward('${list.yhdm}','${list.jsdm}');" <c:if test='${list.gljb == 1}'>style="display:none"</c:if>></div>
              <div class="cz_button cz4_4"  title="教研室数据查询权限" onclick="javascript:forward_jys('${list.yhdm}','${list.jsdm}');" <c:if test='${list.gljb == 1}'>style="display:none"</c:if>></div>
              <div class="cz_button cz2_3" title="修改角色" onclick="javascript:queryJs('${list.yhdm}');"></div> 
            </td>
          </tr>
        </c:forEach>
      </c:otherwise>
    </c:choose>
  </table>
</div>
<div class="youtube"> 
        	<c:if test="${not empty ryjsPage }">
              <ff:page mhFrom="form1" showReSize="true" listPageCount="10" field="ryjsPage" onlyOneShow="true" showListNo="true" action="ryjs/ryjsQuery"/>
            </c:if>
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
      <div class="popup_left">菜单授权</div>
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

<!-- 数据查询权限 -->
<div id="qx" style="display:none; width: 400px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <div class="popup">
    <div class="Floatleft Pct100 mb10">
      <div class="popup_left">数据查询权限</div>
      <a href="#" class="btn_close" onclick="javascript:closeDiv('qx');"></a>
    </div>
    <div class="clr"></div>
    <div class="Floatleft Pct100 ">
	  <iframe id="iframename" name="iframename" src="" border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%; height: 400px;" frameborder="0" allowTransparency="true"></iframe>
    </div>
    <div class="clr"></div>
  </div>
</div>

<div id="qx_jys" style="display:none; width:820px; border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <div class="popup">
    <div class="Floatleft Pct100 mb10">
      <div class="popup_left">教研室数据查询权限</div>
      <a href="#" class="btn_close" onclick="javascript:BOX_remove('qx_jys');"></a>
    </div>
    <div class="clr"></div>
	  <iframe id="iframename_jys" name="iframename_jys" src="" border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%; height: 400px;" frameborder="0" allowTransparency="true"></iframe>
    <div class="clr"></div>
  </div>
</div>

<div id="role" style="display:none; width: 400px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form name="form_js" id="form_js" method="post">
	<input type="hidden" name="yhdm" id="yhdms" value="" />
	<input type="hidden" name="pageCount"  value="${ryjsPage.pageCount}" />
	<input type="hidden" name="pageNo"  value="${ryjsPage.pageNo}" />
	<input type="hidden" name="pageSize"  value="${ryjsPage.pageSize}" />
    <div class="popup">
      <div class="Floatleft Pct100 mb10">
        <div class="popup_left">人员分配角色</div> 
        <a href="#" class="btn_close" onclick="javascript:BOX_remove('role');"></a>
      </div>
      <div class="clr"></div>
      <div class="Floatleft Pct100 " style="height:240px; overflow-y:auto; overflow-x:hidden;">
        <table width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse;" id="table_js">
        </table>
      </div>
      <div class="clr"></div>
    </div>
  </form>
</div>

<!-- 组件授权 -->
<div id="qx_jyss" style="display:none; width:700px; border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <div class="popup">
    <div class="Floatleft Pct100 mb10">
      <div class="popup_left">组件权限</div>
      <a href="#" class="btn_close" onclick="javascript:BOX_remove('qx_jyss');"></a>
    </div>
    <div class="clr"></div>
    <div class="Floatleft Pct100 ">
	  <iframe id="iframename_jyss" name="iframename_jyss" src="" border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%; height: 400px;" frameborder="0" allowTransparency="true"></iframe>
	</div>
    <div class="clr"></div>
  </div>
</div>

<!-- 子系统授权 -->
<div id="qx_zxts" style="display:none; width:700px; border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <div class="popup">
    <div class="Floatleft Pct100 mb10">
      <div class="popup_left">子系统授权</div>
      <a href="#" class="btn_close" onclick="javascript:BOX_remove('qx_zxts');"></a>
    </div>
    <div class="clr"></div>
    <div class="Floatleft Pct100 ">
	  <iframe id="iframename_zxts" name="iframename_zxts" src="" border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%; height: 400px;" frameborder="0" allowTransparency="true"></iframe>
	</div>
    <div class="clr"></div>
  </div>
</div>

<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"> </div>
</body>
</html>


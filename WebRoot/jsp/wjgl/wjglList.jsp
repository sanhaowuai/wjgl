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
<jsp:include page="../include/css-main-include.jsp"></jsp:include>
<style type="text/css">
	html, body { height:100%; }
	.Contentbox { width:100%; min-height:100%;height:auto }
	*html .Contentbox { height:100% }
</style>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript" >
	$(document).ready(function(){
	   $("#ff").baigoCheckall();
	});
	function querylike(){
		document.queryform.action="<%=path%>/wjglindex/wjglList";
		document.queryform.submit();
	}
	
	//上传弹出层---文件管理
	function uplpadDiv(){
        //window.location.href = "/jsp/wjgl/wjsc.jsp";
        var src = "<%=path%>/wjglindex/wjsc.do";
        $("#uplpadDiviframe").attr("src",src);
        BOX_show('uplpadDiv');
	}
    function downLoad(md5) {
	    window.location.href="<%=path%>/wjglindex/downLoadFile?md5="+md5;
    }

    //批量删除
    function delFile(){
        if(isCheck('ids') == false){
            alert("请选择要删除的选项");
            return;
        }
        if(confirm("您确定要删除选中的选项吗？") == true){
            document.ff.action = "<%=path%>/wjglindex/delBatchOrSingle";
            $('#ff').ajaxSubmit(function(r){
                document.ff.action="<%=path%>/wjglindex/wjglList";
                document.ff.submit();
            });
        }
    }
    //单个删除
    function delFileSingle(md5Single){
        document.ff.action = "<%=path%>/wjglindex/delBatchOrSingle?md5Single="+md5Single;
        $('#ff').ajaxSubmit(function(r){
            document.ff.action="<%=path%>/wjglindex/wjglList";
            document.ff.submit();
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
          <td height="35px"><!-- <div class="addlist_button"> <a href="javascript:BOX_show('dr');"><span>导&nbsp;&nbsp;入</span></a> </div> -->
            <div class="addlist_button"> <a href="javascript:uplpadDiv();"><span>上&nbsp;&nbsp;传</span></a> </div>
            <div class="addlist_button  ml15"> <a href="javascript:delFile();"><span>删&nbsp;&nbsp;除</span></a> </div>
          </td>
        </tr>
      </table>
      <form id="queryform" name="queryform" method="post">
        <table  border="0" align="right" cellpadding="0" cellspacing="0"  >
          <tr>
            <td >文件名：</td>
            <td><input type="text" name="wjm" value="${wjglPage.wjm}"  /></td>
            <td ><div class="addlist_button2"> <a href="javascript:void(0);" onclick="javascript:querylike();return false;"><span>搜&nbsp;&nbsp;索</span></a> </div></td>
          </tr>
        </table>
      </form>
    </div>
    <div class="clr"></div>
    <div class="list">
      <form name="ff" method="post" id="ff" >
        <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
            <th width="100px"><input type="checkbox" id="ids" title="全选/不选"/></th>  
			<th>MD码</th>
            <th>文件名</th>
            <th>类型</th>
            <th>文件位置</th>
            <th>完整标识</th>
            <th>实体文件生成标识</th>
            <th>存入时间</th>
            <th width="90px">操作</th>
          </tr>
          <c:forEach items="${wjxxfkbList}" var="map" varStatus="i">
  		    <tr <c:if test="${i.count % 2 eq '0'}">class="bgcol"</c:if>>
   		      <td><input type="checkbox" name="ids"  value="${map.md5}"/></td>
   		      <td>${map.md5}</td>
   			  <td>${map.wjm}</td>
         	  <td>${map.lx}</td>
              <td>${map.wjwz}</td>
              <td>${map.wzbs}</td>
              <td>${map.stwjscbz}</td>
              <td>${map.crsj}</td>
              <td>
                <a href="javascript:void(0);" onclick="javascript:downLoad('${map.md5}');"><div class="cz_button cz6_2" title="下载" ></div></a>
                <a href="javascript:void(0);" onclick="javascript:delFileSingle('${map.md5}');"><div class="cz_button cz1_2" title="删除" ></div></a>

              </td>

              </tr>
	      </c:forEach>
        </table>
      </form>    
    </div>
    <div class="youtube">
  	  <c:if test="${not empty wjglPage }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="wjglPage" onlyOneShow="true" showListNo="true" action="wjglindex/wjglList"/>
      </c:if>
    </div>
    <div class="clr"></div>
  </div>
</div>

<%-- 弹出上传 --%>
<div id="uplpadDiv" class="tan_add" style="display:none;width:800px; height:320px;background: #fff; border: 3px solid #999;" >
  <div class="xzjsxmForm" style=" position:relative">
    <div id="cyjsDiv" style="clear:both;position:absolute;left:7px;top:60px"></div>
    <div class="pd10">
      <div class="popup_left" id="qxzName2">上传</div>
      <a href="#" class="btn_close" onclick="javascript:querylike();"></a>
      <div class="clr"></div>
    </div>
    <div style="float:none; clear:both; overflow:hidden;" >
      <iframe frameborder="0" id="uplpadDiviframe" name="uplpadDiviframe" frameborder="0" src="" style="margin: 0 1%;width: 98%;height:200px;overflow:hidden;" ></iframe>
    </div>
    <div id="oMainLi  stToolBar" class="wp_toolbar_inner" style=" padding:10px 10px 20px 0;">
      <%--<div class="addlist_button1 ml10" style="float: right" ><a href="javascript:void(0);" onclick="javascript:BOX_remove('uplpadDiv');return false;" ><span>取消</span></a></div>--%>
      <div class="addlist_button1" style="float: right" ><a href="javascript:void(0);" onclick="javascript:querylike();" ><span>返回</span></a></div>
      <div class="clr"></div>
    </div>
  </div>
</div>

<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"> </div>
</body>
</html>


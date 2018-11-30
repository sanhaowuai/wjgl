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
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript" >
	function querylike(){
		document.ff.action="<%=path%>/dbsx/queryDbsx";
		document.ff.submit();
	}
	
	function changeTag(falg)
	{
		$("#sfyd_id").val(falg);
		querylike();
	}
	
	function seeOne(id)
	{
		var sfyd_id = $("#sfyd_id").val();
		var winObj;
	    var saHeight=window.screen.availHeight;
	    var saWidth=window.screen.availWidth;
		var par = "?id="+id+"&sfyd="+sfyd_id;
		var URL="<%=path%>/dbsx/queryByidDbsx_sig"+par+"&anticache="+Math.floor(Math.random()*100000);
	    var obj="exam";
	    //top.location.href=URL;
	    var ua = navigator.userAgent.toLowerCase();   
	    if(ua.match(/chrome\/([\d.]+)/)){  
	    	window.open(URL,obj,'dialogWidth:'+saWidth+'px;dialogHeight:'+saHeight+'px;status:no');
	    }else{
	    	window.showModalDialog(URL,obj,'dialogWidth:'+saWidth+'px;dialogHeight:'+saHeight+'px;status:no');
	    }				    	  
  		myrefresh();		
				     	 //document.ff.action="<%=path%>/dbsx/queryByidDbsx?id="+id;
						//document.ff.submit();
	}
function myrefresh(){
	 window.location.reload();
	}
	function tiaozhuan()
	{
	setTimeout('querylike()',200); 
		 
	}
</script>
</head>

<body>
<div class="Contentbox">
  <div class="mainbg"></div>
  <div class="pd10">
<%--    	<div class="question" title="帮助" onclick="javascript:cha('${QXB.QXDM}');"></div> --%>
    <div class="address">当前位置：待办事项${QXB.QXDM}</div>
    <div class="clr"></div>
    <div class="Menubox">
       <ul>
         <li <c:if test ="${dbsxPage.sfyd eq '1'}" >class="hover"</c:if>><a href="javascript:changeTag('1');" >已读提醒</a></li>
         <li <c:if test ="${dbsxPage.sfyd ne '1'}" >class="hover"</c:if>><a href="javascript:changeTag('0');" >未读提醒</a></li>
       </ul>
    </div> 
 	<div class="clr"></div>
    <div class="list">
      <form name="ff" method="post" id="ff" >
<!--      	<input type="hidden" name="pageCount"  value="${dbsxPage.pageCount}" />-->
<!--		<input type="hidden" name="pageNo"  value="${dbsxPage.pageNo}" />-->
<!--		<input type="hidden" name="pageSize"  value="${dbsxPage.pageSize}" />-->
		<input type="hidden" name="sfyd"  id="sfyd_id" value="${dbsxPage.sfyd}"  />
        <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
          	<th>发送人</th> 
			<th>标题</th> 
            <th>发送时间</th> 
            <th>是否完成</th>
			<th>完成时间</th>
<!--            <th width="50px">操作</th>-->
          </tr>
          <c:forEach items="${listdbsx}" var="map" varStatus="i">
  		    <tr <c:if test="${i.count % 2 eq '0'}">class="bgcol"</c:if>>
  		    <td>${map.fsr}</td>
   		      <td> 
   		      	<c:if test="${map.sfylj eq '1'}">
		          <!--      <a id="a_id"  target="${map.dkfs}" onclick="javascript:tiaozhuan('${map.ljdz}','${map.id}');" href="${map.ljdz}">${map.bt}</a>-->
         <a id="a_id"  class="blue" target="${map.dkfs}" href="<%=path %>/dbsx/updSee?id=${map.id}&href=${map.ljdz}"      <c:if test="${map.sfyd eq '0'}">onclick="javascript:tiaozhuan();"</c:if>>${map.bt}</a>
		 
          </c:if>
		          <c:if test="${map.sfylj ne '1'}">
		          <a  href="javascript:void(0);" onclick="javascript:seeOne('${map.id}');" title="${map.bt}">${map.bt}</a>
		          </c:if>
		       </td>
   			  <td>${map.fssj}</td>
   			  <td><c:if test="${map.sfwc eq '1'}">是</c:if>
   			  <c:if test="${map.sfwc ne '1'}">否</c:if>
   			  </td>
   			  <td>${map.wcsj}</td>
<!--              <td><a href="javascript:void(0);" onclick="javascript:seeOne('${map.id}');"><div class="cz_button cz2_1" title="查看" ></div></a></td>-->
 			</tr>
	      </c:forEach>
        </table>
      </form>    
    </div>
    <div class="youtube">
  	  <c:if test="${not empty dbsxPage }">
        <ff:page showReSize="true" listPageCount="10" field="dbsxPage" onlyOneShow="true" showListNo="true" action="dbsx/queryDbsx"/>
      </c:if>
    </div>
    <div class="clr"></div>
  </div>
</div>
 

<div id="addOrUpd" style="display:none; width: 600px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form id="addOrUpdfrom" name="addOrUpdfrom" method="post">
	<div class="popup">
      <div class="Floatleft Pct100 mb10">
        <div class="popup_left">查看</div>
        <a href="#" class="btn_close" onclick="javascript:querylike();"></a> 
      </div>
      <div class="clr"></div>
      <table id="divtab" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
        <tr>
          <th width="90px;">标题：</th>
          <td id="bt_id"></td>                 
        </tr> 
        <tr>
          <th>发送人：</th>
          <td id="fsr_id"></td>         
        </tr>
        
        <tr>
          <th>开始结束时间：</th>
          <td id="ksjssj_id"></td>
        </tr>
         <tr>
          <th>内容：</th>
          <td id="nr_id"></td>         
        </tr>
        <tr>
          <td colspan="2" align="center"><div class="addlist_button1" style="float:right"><a href="#"  title="取消" onclick="javascript:querylike();" ><span>取消</span></a> </div>
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


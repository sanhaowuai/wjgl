<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.lang.*,java.util.*,java.text.*" %>
<%@ taglib prefix="uf" uri="UFunction"%> 


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
 <jsp:include page="../../include/css-boostrap-include.jsp"></jsp:include>

<link href="<%=path%>/resources/js/treetable/stylesheets/master.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/js/treetable/stylesheets/jquery.treeTable.css" rel="stylesheet" type="text/css" />
<style type="text/css">
  html, body { height:100%; }
  .Contentbox { width:100%; min-height:100%;height:auto }
  *html .Contentbox { height:100% }
	
</style>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/treetable/javascripts/jquery.treeTable.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/treetable/treeTable-my.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>



<link rel="stylesheet" href="<%=path%>/resources/js/plupload/jquery.plupload.queue/css/jquery.plupload.queue.css" type="text/css" />
<script type="text/javascript" src="<%=path%>/resources/js/plupload/plupload.full.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/plupload/jquery.plupload.queue/jquery.plupload.queue.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/plupload/i18n/cn.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/plupload/plupload.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/ckeditor4.1.2/ckeditor.js"></script>
<link href="<%=path%>/resources/js/select2-4.0.0-rc.2/dist/css/select2.min.css" rel="stylesheet" />
<script src="<%=path%>/resources/js/select2-4.0.0-rc.2/dist/js/select2.min.js"></script>
<script type="text/javascript">

function jiazai(){
	$("#iframename_lzjsrdm").select2();
	
	$("#id_lzjsrdm").select2();
}

function sss(){
	document.getElementById('iframename_lzjsrdm').style.display = 'none';
	document.getElementById('id_lzjsrdm').style.display = 'none';
}


function toQkfk(){
	console.log("toQ")
	document.tjxz.action="<%=path%>/qkfkycl/qkfk";
	document.tjxz.submit();	
}


function querylike(){
	document.queryform.action="<%=path%>/qkfkycl/fkcl";
	document.queryform.submit();
}

$(document).ready(function(){
	   $("#ff").baigoCheckall();
	});
	
	
function plsh(){
	 
	if(isCheck('ids') == false){
       alert("请选择要处理的任务");
       return;
   }
// 	if(confirm("您确定要执行该操作吗？") == true){      
       document.ff.action = "<%=path%>/fkcl/querypdy";
       $('#ff').ajaxSubmit(function(r){
       	if(r==1){
       		BOX_show('addOrUpd');
       	}else{
       		
       		
       		var xh=document.getElementsByName('ids');
       		var s=[];
       		$('input[name="ids"]:checked').each(function(){
     			s.push($(this).val());
     		});       		 		
       		$('#ifr').attr('src','<%=path%>/fkcl/queryFkclpd?ids='+s);
       		BOX_show('addOrUpd3');
       	}
       });
       
// 	}
}


function addOrUpd(){
 	if(confirm("您确定要执行该操作吗？") == true){
 		BOX_show('drzDiv');
	var xh=document.getElementsByName('ids');
		var s=[];
		$('input[name="ids"]:checked').each(function(){
 			s.push($(this).val());
 		});      	
	document.addOrUpdfrom.action="<%=path%>/qkfkycl/addFkcx?ids="+s;
	document.addOrUpdfrom.submit();
	
 	}
}


$(document).ready(function(){
	$("#ff").baigoCheckall();
   	var flag = "${flag}";
   	if(flag == "success"){
		alert("操作成功！");
		querylike();
	}else if(flag == "error"){
		alert("操作失败！");
		querylike();
	}
});


function updDiv(sqdh,sqzt){
	document.queryform.action="<%=path%>/qkfkycl/queryFkclxg?dh="+sqdh+"&zt="+sqzt;
	document.queryform.submit();
}

function ckByID(sqdh){
	window.open('<%=path%>/qkfkxtcx/queryQkfkxtxxbyid?sqdh='+sqdh+'&random='+Math.random()*100000,"查看信息"+sqdh ,'height=600, width=1024, top=100, left=300, titlebar=no,toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no,z-look=yes');

}
</script>
</head>

<body onload="jiazai();">
 <div class="Contentbox">
    <div class="mainbg"></div>
    <div class="pd10">   
   	 <div class="address">当前位置：${fkclPage.wz1} >> ${fkclPage.wz2}</div>
   <ul class="nav nav-tabs tabweb mb10"  role="tablist">
	  <li role="presentation" onclick="javascript:toQkfk();return false;"><a>情况反馈</a></li>
	  <li role="presentation" class="active" ><a>反馈处理</a></li>  
	</ul>
	<form id="tjxz" name="tjxz" method="post" >
    <input id="wz11" name="wz1" value="${fkclPage.wz1}" type="hidden"></input>
    <input id="wz21" name="wz2" value="${fkclPage.wz2}" type="hidden"></input>
	</form>
  <div class="butsea">
     <table  border="0" align="left" cellpadding="0" cellspacing="0"  >
        <tr>
          <td height="35px"> 
           	<div class="addlist_button">
					<a href="javascript:void(0);" onclick="javascript:plsh();return false;">
            			<span>批量审核</span>
            		</a>            		   
            	</div>
            </td>
        </tr>
      </table> 
      
        <div class="dropdown pull-right">
       <form id="queryform" name="queryform" method="post">
       <input id="wz1" name="wz1" value="${fkclPage.wz1}" type="hidden"></input>
    <input id="wz2" name="wz2" value="${fkclPage.wz2}" type="hidden"></input>
	   <div class="btn-group">
		  <button type="button" class="btn btn-search dropdown-toggle" data-toggle="dropdown">搜索 <span class="caret"></span></button>
		  <div class="dropdown-menu search-list pull-right" role="menu" style="width:260px;">
          <table border="0" width="96%"  cellpadding="0" cellspacing="0"  >
          <tr>
          <th>项目名称</th>
	    	<td>
	         <select id="xtdm" name="xtdm">
	         <option value="">-请选择-</option>
	         <c:forEach items="${xmList}" var="map">
	         <option value="${map.DM}" <c:if test="${map.DM==fkclPage.xtdm}">selected="selected"</c:if>>${map.XTMC}</option>
	         </c:forEach>
	         </select>
	         </td>
	         </tr>
	         <tr>
	         <th>变更类型</th>
	         <td>
	         <select id="bglxdm" name=bglxdm>
	         <option  value="">-请选择-</option>
	         <c:forEach items="${bglxList}" var="map">
	         <c:if test="${map.SJDM=='-1'}">
	         <optgroup label="${map.MC}"></optgroup>
	         </c:if>
	         <c:if test="${map.SJDM!='-1'}">
	         <option <c:if test="${map.DM==fkclPage.bglxdm}">selected="selected"</c:if> value="${map.DM}">&nbsp;&nbsp;${map.MC}</option>
	         </c:if>
	         </c:forEach>
	         </select>
	         </td>
	         </tr>
	         <tr>
	         <th>紧急程度</th>
	        <td>
	         <select id="jjcddm" name="jjcddm">
	         <option  value="">-请选择-</option>
	         <c:forEach items="${jjcdList}" var="map">
	         <option value="${map.DM}" <c:if test="${map.DM==fkclPage.jjcddm}">selected="selected"</c:if>>${map.MC}</option>
	         </c:forEach>
	         </select>
	         </td>
	         </tr>
	         <tr>
	         <th>状态</th>
	         <td>
	         <select id="sqzt" name="sqzt">
	         <option <c:if test="${fkclPage.sqzt==''}">selected="selected"</c:if> value="">-请选择-</option>
<%-- 	         <option <c:if test="${fkclPage.sqzt=='0'}">selected="selected"</c:if> value="0">保存</option> --%>
	         <option <c:if test="${fkclPage.sqzt=='1'}">selected="selected"</c:if> value="1">提交</option>
	         <option <c:if test="${fkclPage.sqzt=='2'}">selected="selected"</c:if> value="2">已流转</option>
	         <option <c:if test="${fkclPage.sqzt=='3'}">selected="selected"</c:if> value="3">已接收</option>
	         <option <c:if test="${fkclPage.sqzt=='4'}">selected="selected"</c:if> value="4">退回</option>
	         <option <c:if test="${fkclPage.sqzt=='5'}">selected="selected"</c:if> value="5">已确认完成</option>
	         <option <c:if test="${fkclPage.sqzt=='6'}">selected="selected"</c:if> value="6">已确认未完成</option>
	         <option <c:if test="${fkclPage.sqzt=='99'}">selected="selected"</c:if> value="99">最终完成</option>
	         <option <c:if test="${fkclPage.sqzt=='-99'}">selected="selected"</c:if> value="-99">最终未完成</option>
	         <option <c:if test="${fkclPage.sqzt=='A'}">selected="selected"</c:if> value="A">逾期</option>
	         </select>
	         </td>
	         </tr>
	        <tr>
	        <th>变更提出时间</th>
	         <td>
	         <input id="qssj" class="Wdate" type="text" style="width:50px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',isShowToday:true,isShowClear:true,maxDate:'#F{$dp.$D(\'jssj\')}'})" name="qssj" value="${fkclPage.qssj}" />
	         </td>
	         </tr>
	         <tr>
	         <th>~</th>
	        <td>
	         <input id="jssj" class="Wdate" type="text" style="width:50px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',isShowToday:true,isShowClear:true,minDate:'#F{$dp.$D(\'qssj\')}'})" name="jssj" value="${fkclPage.jssj}" />
	         </td>
	        </tr>
	        <tr>
	        <th>流转接收人</th>
          <td>
          <select id="id_lzjsrdm" name="lzjsrdm" style="width:150px;">
          <option value="">-请选择-</option>
          <c:forEach items="${lzrlist}" var="obj">
			    <option value="${obj.YHDM}" <c:if test="${obj.YHDM==fkclPage.lzjsrdm}">selected="selected"</c:if>>${obj.XM}</option>
			  </c:forEach>
			  </select>        
          </td>
          </tr>
          
            <tr>
	        <th>需求编号</th>
	        <td>
	        	
				<input type="text" id="sQDH"  name="sqdh" value="${fkclPage.sqdh}"/>
	        </td>
	        </tr>
 <tr>
	        <th>变更概述</th>
	        <td>
	        	
				<input type="text" id="bggs"  name="bggs" value="${fkclPage.bggs}"/>
	        </td>
	        </tr>
          
          </table> 
	    <div class="divider"></div>
        <div class="clr"></div>
        <div class="addlist_button pull-right mr10"> <a href="javascript:void(0);" onclick="javascript:querylike();return false;"><span>查询</span></a> </div>
	   </div>
	</div>
    </form>     
   </div> 
       </div>
          <div class="clr"></div>
    <div class="list">
      <form name="ff" method="post" id="ff" >
      <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
            <th align="center"><input type="checkbox" id="ids" title="全选/不选" style="padding:0;margin-left:2px;*margin-left:-2px;"/></th>
            <th>需求编号</th>
            <th>项目名称</th>
            <th>变更概述</th>
            <th>申请人</th>
            <th>变更提出人</th>
            <th>变更类型</th>
            <th>紧急程度</th>
            <th>变更提出时间</th>
            <th>要求完成时间</th>          
            <th>状态</th>
            <th>流转人</th>
            <th>流转接收人</th>
            <th width="90">操作</th>
          </tr>
		  <c:forEach items="${listfkcl}" var="map" varStatus="status">
        	<tr <c:if test="${status.count % 2 eq '0'}">class="bgcol"</c:if>>
         	  
         	  <td align="center"><input type="checkbox" name="ids" value="${map.sqdh}" /></td>  
         	 
         	  <td>${map.sqdh}</td>
         	  <td>${map.xtmc}</td>
         	  <td title="${uf:splitAndFilterString(map.bggs,300000)}">${uf:splitAndFilterString(map.bggs,300)}</td>
         	  <td>${map.sqr}</td>
         	  <td>${map.bgtcrxm}</td>
         	  <td>${map.bglxmc}</td>
         	  <td>${map.jjcdmc}</td>
			  <td>${map.sqsj }</td>
			  <td>${map.yqwcsj }</td>
			  			  
			  <c:if test="${empty map.sqzt}"><td></td></c:if>
			<c:if test="${map.sqzt eq '0'}"><td>保存</td></c:if>
   			<c:if test="${map.sqzt eq '1'}"><td>提交</td></c:if>
   			<c:if test="${map.sqzt eq '2'}"><td>已流转</td></c:if>
   			<c:if test="${map.sqzt eq '3'}"><td>已接收</td></c:if>
   			<c:if test="${map.sqzt eq '4'}"><td>退回</td></c:if>
   			<c:if test="${map.sqzt eq '5'}"><td>已确认完成</td></c:if>
   			<c:if test="${map.sqzt eq '6'}"><td>已确认未完成</td></c:if>
   			<c:if test="${map.sqzt eq '99'}"><td>最终完成</td></c:if>
   			<c:if test="${map.sqzt eq '-99'}"><td>最终未完成</td></c:if>
   			<c:if test="${map.sqzt eq 'A'}"><td>逾期</td></c:if>
   			<td>${map.lzrmc}</td>
   			  <td>${map.lzjsrmc}</td>
              <td>        
				 <c:if test="${map.lzjsrdm eq yhdm}">
              <c:if test="${map.sqzt eq 1 || map.sqzt eq 2 }">
				<div class="cz_button cz3_1" title="审核" onclick="javascript:updDiv('${map.sqdh}','${map.sqzt}');"></div>
				</c:if>								
				</c:if>			
				 <div class="cz_button cz2_1" onclick="javascript:ckByID('${map.sqdh}');return false;" title="查看"></div>                        
              </td>
       		</tr>
          </c:forEach>
        </table>
      </form>
    </div>
     <div class="youtube"> 
      <c:if test="${not empty fkclPage }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="fkclPage" onlyOneShow="true" showListNo="true" action="qkfkycl/fkcl"/>
      </c:if>
    </div>
    </div>
   </div>
   
   
   <div id="addOrUpd" style="display:none; width: 700px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form id="addOrUpdfrom" name="addOrUpdfrom" method="post">

    <div class="popup">
      <div class="Floatleft Pct100 mb10">
        <div class="popup_left">批量审核</div>
        <a href="#" class="btn_close" onclick="javascript:BOX_remove('addOrUpd');sss();"></a> 
      </div>
      <div class="clr"></div>
      <input id="wz3" name="wz1" value="${fkclPage.wz1}" type="hidden"></input>
    <input id="wz3" name="wz2" value="${fkclPage.wz2}" type="hidden"></input>
      <table id="divtab" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
        <tr>
          <th>审核状态：</th>
          <td align="left">
	           	  <select name="zt" id="zt" class="se150">
	       			<option value="2">通过</option>
	       			<option value="4">不通过</option>
	    		  </select>
	           	</td>
          <th>流转接收人：</th>
          <td align="left">
          <select id="iframename_lzjsrdm" name="lzjsrdm" >
          <option value="">请选择</option>
          <c:forEach items="${lzrlist}" var="obj">
			    <option value="${obj.YHDM}" >${obj.XM}</option>
			  </c:forEach>
			  </select>        
          </td>
        </tr> 
        <tr>
          <th>处理意见：</th>
          <td colspan=3><textarea rows="10" style="width:98%" name = 'yj'></textarea></td>
		
 		
        </tr> 
        
        <tr>
          <td colspan="4" align="center">
          <div class="addlist_button1" style="float:right"><a href="javascript:BOX_remove('addOrUpd');sss();"><span>取消</span></a> </div>
          <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:addOrUpd();" title="保存" ><span>保存</span></a> </div>
          </td>
        </tr>
      </table>
      <div class="clr"></div>
    </div>
  </form>
</div>

 <div id="addOrUpd3" style="display:none; width: 700px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form id="addOrUpdfrom3" name="addOrUpdfrom3" method="post">

    <div class="popup">
      <div class="Floatleft Pct100 mb10">
        <div class="popup_left">批量审核</div>
        <a href="#" class="btn_close" onclick="javascript:BOX_remove('addOrUpd3');sss();"></a> 
      </div>
      <div class="clr"></div>     
      <iframe src="" id="ifr" style="width:100%;height:410px;"border="0" framespacing="0" marginheight="0" marginwidth="0"  frameborder="0" allowTransparency="true"></iframe>
      <div class="clr"></div>
    </div>
  </form>
</div>


 <div id="drzDiv" style="display:none; width: 300px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <div class="popup">
     <table  border="0" width="100%" cellpadding="0" cellspacing="0" >
      <tr>
         <td align="center" valign="middle" height="100px"><img src="<%=path%>/resources/style/blue/images/loading.gif" /><br /><br /><font id="message" class="FONT12 red LH30"></font></td>        
      </tr>
     </table>
    <div class="clr"></div>
  </div>
</div>

<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"> </div>
</body>
</html>


<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%> 
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
<style type="text/css">
	html, body { height:100%; }
	.Contentbox { width:100%; min-height:100%;height:auto }
	*html .Contentbox { height:100% }
</style>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/bootstrap.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/My97DatePicker/WdatePicker.js"></script>
<link href="<%=path%>/resources/js/select2-4.0.0-rc.2/dist/css/select2.min.css" rel="stylesheet" />
<script src="<%=path%>/resources/js/select2-4.0.0-rc.2/dist/js/select2.min.js"></script>

<script type="text/javascript">

function jiazai(){
	$("#iframename_lzjsrdm").select2();
	
	
}

function sss(){
	document.getElementById('iframename_lzjsrdm').style.display = 'none';
}

$(document).ready(function(){
	   $("#ff").baigoCheckall();
	});
	
function plcl(){
	 
	if(isCheck('ids') == false){
       alert("请选择要处理的任务");
       return;
   }
    
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

}

function qrwc(){
	 
	if(isCheck('ids') == false){
       alert("请选择要完成的任务");
       return;
   }
// 	if(confirm("您确定要执行该操作吗？") == true){
		 document.ff.action = "<%=path%>/fkcl/querypdyqd";
	       $('#ff').ajaxSubmit(function(r){
	    	   
	       	if(r==1){
	       		BOX_show('addOrUpd2');
	       	}else{
	       			       		
	       		var xh=document.getElementsByName('ids');
	       		var s=[];
	       		$('input[name="ids"]:checked').each(function(){
	     			s.push($(this).val());
	     		});   		 		
	       		$('#ifr2').attr('src','<%=path%>/fkcl/queryFkclpdwc?ids='+s);
	       		BOX_show('addOrUpd4');
	       	}
	       });
       
// 	    }
}


function updDiv(sqdh,sqzt){
	document.queryform.action="<%=path%>/fkcl/queryFkclxg?dh="+sqdh+"&zt="+sqzt;
	document.queryform.submit();
}

function querylike(){
	document.queryform.action="<%=path%>/fkcl/queryFkcl";
	document.queryform.submit();
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




function addOrUpd(){
 	if(confirm("您确定要执行该操作吗？") == true){
 		BOX_show('drzDiv');
	var xh=document.getElementsByName('ids');
		var s=[];
		$('input[name="ids"]:checked').each(function(){
 			s.push($(this).val());
 		});   	
	document.addOrUpdfrom.action="<%=path%>/fkcl/addFkcx?ids="+s;
	document.addOrUpdfrom.submit();
	
 	}
}

function addOrUpdwc(){
	if(confirm("您确定要执行该操作吗？") == true){
		BOX_show('drzDiv');
	var xh=document.getElementsByName('ids');	
		var s=[];
		$('input[name="ids"]:checked').each(function(){
 			s.push($(this).val());
 		});   	
	document.addOrUpdfrom2.action="<%=path%>/fkcl/addFkcx?ids="+s;
	document.addOrUpdfrom2.submit();
	
	}
	
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
   	  <div class="question" title="帮助" onclick="javascript:cha('${QXB.QXDM}');"></div>    
      <div class="address">当前位置：${QXB.FQXMC} >> ${QXB.QXMC}</div>
<%--       <input type="text" value="${fkclPage.sqzt}" /> --%>
    <div class="clr"></div>
    <div class="butsea">
      <table  border="0" align="left" cellpadding="0" cellspacing="0"  >
        <tr>
          <td height="35px">
            <div class="addlist_button"> <a href="javascript:plcl();"><span>批量处理</span></a> </div>          
            <div class="addlist_button  ml15"> <a href="javascript:qrwc();"><span>确认完成</span></a> </div>           
          </td>
        </tr>
      </table>
      
      	 <div class="dropdown pull-right">
       <form id="queryform" name="queryform" method="post">
       <input id="wz1" name="wz1" value="${QXB.FQXMC}" type="hidden"></input>
    <input id="wz2" name="wz2" value="${QXB.QXMC}" type="hidden"></input>
	   <div class="btn-group">
		  <button type="button" class="btn btn-search dropdown-toggle" data-toggle="dropdown">搜索 <span class="caret"></span></button>
		  <div class="dropdown-menu search-list pull-right" role="menu" style="width:260px;">
          <table border="0" width="96%"  cellpadding="0" cellspacing="0"  >
          <tr>
          <th>项目名称</th>
	    	<td>
	         <select id="xtdm" name="xtdm">
	         <option value="">-请选择-</option>
	         <c:forEach items="${xtList}" var="map">
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
          <select id="iframename_lzjsrdm" name="lzjsrdm" style="width:150px;">
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
  <input id="wz1" name="wz1" value="${QXB.FQXMC}" type="hidden"></input>
    <input id="wz2" name="wz2" value="${QXB.QXMC}" type="hidden"></input>
          <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
          <th style="text-align:center"><input type="checkbox" id="ids" title="全选/不选"/></th>
<!--             <th><input type="checkbox" id="ids" title="全选/不选" style="padding:0;margin-left:2px;*margin-left:-2px;"/></th> -->
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
<%--          	  <td><input name="ids" type="checkbox" value="${map.sqdh}"/></td> --%>
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
              <c:if test="${map.sqzt eq '1' || map.sqzt eq '2'}">
				<div class="cz_button cz3_1" title="处理" onclick="javascript:updDiv('${map.sqdh}','${map.sqzt}');"></div>
				</c:if>	
				<c:if test="${ map.sqzt eq '3'}">
				<div class="cz_button cz1_6" title="确认完成" onclick="javascript:updDiv('${map.sqdh}','${map.sqzt}');"></div>
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
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="fkclPage" onlyOneShow="true" showListNo="true" action="fkcl/queryFkcl"/>
      </c:if>
    </div>
    <div class="clr"></div>
  </div>
</div>



<div id="addOrUpd" style="display:none; width: 700px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form id="addOrUpdfrom" name="addOrUpdfrom" method="post">

    <div class="popup">
      <div class="Floatleft Pct100 mb10">
        <div class="popup_left">批量处理</div>
        <a href="#" class="btn_close" onclick="javascript:BOX_remove('addOrUpd');sss();"></a> 
      </div>
      <div class="clr"></div>
      <table id="divtab" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
        <tr>
          <th>处理状态：</th>
          <td align="left">
	           	  <select name="zt" id="zt11" class="se150">
	       			<option value="3">接收</option>
	       			<option value="4">退回</option>
	    		  </select>
	           	</td>
          <th>预计完成时间：</th>
          <td align="left">
          <input id="wcyjsj" class="Wdate" type="text" style="width:99%;" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" name="wcyjsj" value="" />
<!--           <input type="text" name="jsxm" id="jsxm" dataType="Limit" min="1" max="20" msg="必填(20个字之内)" /> -->
<!--             <span class="red">*</span> -->
          </td>
        </tr> 
        <tr>
          <th>处理意见：</th>
          <td colspan=3><textarea rows="10"  style="width:98%" name = 'yj'></textarea></td>
		
 		
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
  
  
  <div id="addOrUpd2" style="display:none; width: 700px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form id="addOrUpdfrom2" name="addOrUpdfrom2" method="post">

    <div class="popup">
      <div class="Floatleft Pct100 mb10">
        <div class="popup_left">确认完成</div>
        <a href="#" class="btn_close" onclick="javascript:BOX_remove('addOrUpd2');sss();"></a> 
      </div>
      <div class="clr"></div>
      <table id="divtab" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
        <tr>
          <th>完成状态：</th>
          <td align="left">
	           	  <select name="zt" id="zt" class="se150">
	       			<option value="5">已完成</option>
	       			<option value="6">未完成</option>
	    		  </select>
	           	</td>
          <th>实际完成时间：</th>
          <td align="left">
          <input id="wcyjsj" class="Wdate" type="text" style="width:99%;" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" name="wcyjsj" value="" />
<!--           <input type="text" name="jsxm" id="jsxm" dataType="Limit" min="1" max="20" msg="必填(20个字之内)" /> -->
<!--             <span class="red">*</span> -->
          </td>
        </tr> 
        <tr>
          <th>处理意见：</th>
          <td colspan=3><textarea rows="10" style="width:98%" name = 'yj'></textarea></td>
		
 		
        </tr> 
        
        <tr>
          <td colspan="4" align="center">
          <div class="addlist_button1" style="float:right"><a href="javascript:BOX_remove('addOrUpd2');sss();"><span>取消</span></a> </div>
          <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:addOrUpdwc();" title="保存" ><span>保存</span></a> </div>
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
        <div class="popup_left">批量处理</div>
        <a href="#" class="btn_close" onclick="javascript:BOX_remove('addOrUpd3');sss();"></a> 
      </div>
      <div class="clr"></div>     
      <iframe src="" id="ifr" style="width:100%;height:410px;"border="0" framespacing="0" marginheight="0" marginwidth="0"  frameborder="0" allowTransparency="true"></iframe>
      <div class="clr"></div>
    </div>
  </form>
</div>


<div id="addOrUpd4" style="display:none; width: 700px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form id="addOrUpdfrom4" name="addOrUpdfrom4" method="post">

    <div class="popup">
      <div class="Floatleft Pct100 mb10">
        <div class="popup_left">确认完成</div>
        <a href="#" class="btn_close" onclick="javascript:BOX_remove('addOrUpd4');sss();"></a> 
      </div>
      <div class="clr"></div>     
      <iframe src="" id="ifr2" style="width:100%;height:410px;"border="0" framespacing="0" marginheight="0" marginwidth="0"  frameborder="0" allowTransparency="true"></iframe>
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
<div id="setting"></div>



<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"> </div>
</body>
</html>


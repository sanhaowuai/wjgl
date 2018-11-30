<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%> 
<%@ taglib prefix="uf" uri="UFunction"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.lang.*,java.util.*,java.text.*" %>


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
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/treetable/javascripts/jquery.treeTable.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/treetable/treeTable-my.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>




<link rel="stylesheet" href="<%=path%>/resources/js/plupload/jquery.plupload.queue/css/jquery.plupload.queue.css" type="text/css" />
<script type="text/javascript" src="<%=path%>/resources/js/plupload/plupload.full.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/plupload/jquery.plupload.queue/jquery.plupload.queue.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/plupload/i18n/cn.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/plupload/plupload.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/ckeditor4.1.2/ckeditor.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/My97DatePicker/WdatePicker.js"></script>
<link href="<%=path%>/resources/js/select2-4.0.0-rc.2/dist/css/select2.min.css" rel="stylesheet" />
<script src="<%=path%>/resources/js/select2-4.0.0-rc.2/dist/js/select2.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#ff").baigoCheckall();
  
});
//查询情况反馈
function querylike(){
	document.queryform.action="<%=path%>/qkfkycl/qkfk";
	document.queryform.submit();
}
//删除情况反馈
function delqkfk(){
    if(isCheck('ids') == false){
        alert("请选择要删除的需求");
        return;
    }
    if(confirm("您确定要删除选中的需求吗？") == true){
    	 document.ff.action = "<%=path%>/qkfkycl/depd";
	     $('#ff').ajaxSubmit(function(r){
	   if(r==1){
		   BOX_show('drzDiv');
		document.ff.action = "<%=path%>/qkfkycl/delqkfk";
        $('#ff').ajaxSubmit(function(r){
    	       if(r=="1")
            {
	            alert("删除成功!");
	            querylike();
            }else{
          	  alert("删除失败!");
            }
    	});}else{
    		var xh=document.getElementsByName('ids');
       		var s=[];
       		$('input[name="ids"]:checked').each(function(){
     			s.push($(this).val());
     		});       		 		
       		$('#ifr2').attr('src','<%=path%>/qkfkycl/queryFkclpdwc?ids='+s);
       		BOX_show('addOrUpd4');
    	}
    		
    	});
	    	
    }
}

// //删除情况反馈
// function delqkfk(){
//     if(isCheck('ids') == false){
//         alert("请选择要删除的需求");
//         return;
//     }
//     if(confirm("您确定要删除选中的需求吗？") == true){
<%--     	document.ff.action = "<%=path%>/qkfkycl/delqkfk"; --%>
//         $('#ff').ajaxSubmit(function(r){
//     	       if(r=="1")
//             {
// 	            alert("删除成功!");
// 	            querylike();
//             }else{
//           	  alert("删除失败!");
//             }
//     	});
    		
//     	}
// }

function qurwc(){
	var dh=document.getElementsByName('ids');
	var dhs=[];  
	var g=0;
	  for(var i=0; i<dh.length; i++){    
	    if(dh[i].checked){
	    		dhs[g]=dh[i].value;
	    		g++;
	    }
	  }	
	if(dhs.length > 0){
	if(confirm("您确定要完成选中的需求吗？")==true){
		BOX_show('drzDiv');
		 document.qrwcfrom.action = "<%=path%>/qkfkycl/qurwc?sqdh="+dhs;
	        $('#qrwcfrom').ajaxSubmit(function(r){
	    	       if(r)
	            {
	    	    	alert("确认完成成功！")
	    			querylike();
	            }else{
	            	alert("确认完成失败！")
	            }
	    	});
	  
	}}else{
		alert("请选择要完成的需求")
	}
}
//提交情况反馈
function tjqkfk(){
	var dh=document.getElementsByName('ids');
	var dhs=[];  
	var g=0;
	  for(var i=0; i<dh.length; i++){    
	    if(dh[i].checked){
	    		dhs[g]=dh[i].value;
	    		g++;
	    }
	  }	
	if(dhs.length > 0){
	if(confirm("您确定要提交选中的需求吗？")==true){
		 document.ff.action = "<%=path%>/qkfkycl/sc";
	     $('#ff').ajaxSubmit(function(r){
	   if(r==1){
		   BOX_show('drzDiv');
$.post('<%=path%>/qkfkycl/tjfk?sqdh='+dhs,function(data){
		if(data){
			alert("提交成功！")
			 querylike();
		}else{
			alert("提交失败！")
		}
	});}else{
		var xh=document.getElementsByName('ids');
   		var s=[];
   		var j=0;
   		  for(var i=0; i<xh.length; i++){    
   		    if(xh[i].checked){
   		    	 s[j]=xh[i].value;
   		    	 j++;
   		    }
   		  }	      		 		
   		$('#ifr2').attr('src','<%=path%>/qkfkycl/queryFkclpd?ids='+s);
   		BOX_show('addOrUpd4');
	}
		
	});
	}
	     }else{
		alert("请选择要提交的需求")
	}
}
function tjxg(xz,sqdh){
	if(xz == 1){
	document.tjxz.action="<%=path%>/qkfkycl/qkfktjxg?xz="+xz;
	document.tjxz.submit();}
	else{
		document.tjxz.action="<%=path%>/qkfkycl/queryqkfkByone?xz="+xz+"&sqdh="+sqdh;
		document.tjxz.submit()
	}
}
function toFkcl(){
	
	document.tjxz.action="<%=path%>/qkfkycl/fkcl";
	document.tjxz.submit();	
}
function qrwc(){
	 if(isCheck('ids') == false){
	        alert("请选择要确认完成的需求");
	        return;
	    }
	document.ff.action = "<%=path%>/qkfkycl/qr";
    $('#ff').ajaxSubmit(function(r){
  if(r==1){
	BOX_show('qurwcdiv');
  }else{
 		var xh=document.getElementsByName('ids');
    		var s=[];
    		var j=0;
    		  for(var i=0; i<xh.length; i++){    
    		    if(xh[i].checked){
    		    	 s[j]=xh[i].value;
    		    	 j++;
    		    }
    		  }	      		 		
    		$('#ifr2').attr('src','<%=path%>/qkfkycl/queryFkclqr?ids='+s);
    		BOX_show('addOrUpd4');
 	}
 		
 	});
}
function ckqkfkcl(sqdh){
	window.open('<%=path%>/qkfkxtcx/queryQkfkxtxxbyid?sqdh='+sqdh+'&random='+Math.random()*100000,"查看信息"+sqdh ,'height=600, width=1024, top=100, left=300, titlebar=no,toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no,z-look=yes');
}
function jiazai(){
	$("#lzjsrdm").select2();
	}
</script>
</head>

<body onload="jiazai();">
<div class="Contentbox">
  <div class="mainbg"></div>
  <div class="pd10">
   	  <div class="question" title="帮助" onclick="javascript:cha('${QXB.QXDM}');"></div>   
   	  <div class="address" >当前位置：${QXB.FQXMC} >> ${QXB.QXMC}</div>
   	  <div class="clr"></div>
   	  <div class="butsea">
   	<ul class="nav nav-tabs tabweb mb10"  role="tablist">
	  <li role="presentation" class="active"><a>情况反馈</a></li>
	  <li role="presentation" onclick="javascript:toFkcl();return false;"><a>反馈处理</a></li>  
	</ul>
 <form id="tjxz" name="tjxz" method="post" >
  <input id="wz1" name="wz1" value="${QXB.FQXMC}" type="hidden"></input>
  <input id="wz2" name="wz2" value="${QXB.QXMC}" type="hidden"></input>
 </form>

     <table  border="0" align="left" cellpadding="0" cellspacing="0"  >
        <tr>
          <td height="35px"> 
           	<div class="addlist_button">
					<a href="javascript:void(0);" onclick="tjxg('1');">
            			<span>添加</span>
            		</a>            		   
            	</div>
            	<div class="addlist_button  ml15">
            	 	<a href="javascript:void(0);" onclick="delqkfk();">
            			<span>删除</span>
            		</a> 
            	 </div>
            	 <div class="addlist_button  ml15">
            	 	<a href="javascript:void(0);" onclick="tjqkfk();">
            			<span>提交</span>
            		</a> 
            	 </div>
            	 <div class="addlist_button  ml15">
            	 	<a href="javascript:void(0);" onclick="qrwc();">
            			<span>确认完成</span>
            		</a> 
            	 </div>
           </td>
        </tr>
      </table> 
	 <div class="dropdown pull-right">
       <form id="queryform" name="queryform" method="post">
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
	         <option value="${map.DM}" <c:if test="${map.DM==qkfkyclPage.xtdm}">selected="selected"</c:if>>${map.XTMC}</option>
	         </c:forEach>
	         </select>
	         </td>
	         </tr>
	         <tr>
	         <th>变更类型</th>
	         <td>
	         <select id="bglx" name="bglx">
	         <option  value="">-请选择-</option>
	         <c:forEach items="${bglxList}" var="map">
	         <c:if test="${map.SJDM=='-1'}">
	         <optgroup label="${map.MC}"></optgroup>
	         </c:if>
	         <c:if test="${map.SJDM!='-1'}">
	         <option <c:if test="${map.DM==qkfkyclPage.bglx}">selected="selected"</c:if> value="${map.DM}">&nbsp;&nbsp;${map.MC}</option>
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
	         <option value="${map.DM}" <c:if test="${map.DM==qkfkyclPage.jjcddm}">selected="selected"</c:if>>${map.MC}</option>
	         </c:forEach>
	         </select>
	         </td>
	         </tr>
	         <tr>
	         <th>状态</th>
	         <td>
	         <select id="zt" name="zt">
	         <option <c:if test="${qkfkyclPage.zt==''}">selected="selected"</c:if> value="">-请选择-</option>
	         <option <c:if test="${qkfkyclPage.zt=='0'}">selected="selected"</c:if> value="0">保存</option>
	         <option <c:if test="${qkfkyclPage.zt=='1'}">selected="selected"</c:if> value="1">提交</option>
	         <option <c:if test="${qkfkyclPage.zt=='2'}">selected="selected"</c:if> value="2">已流转</option>
	         <option <c:if test="${qkfkyclPage.zt=='3'}">selected="selected"</c:if> value="3">已接收</option>
	         <option <c:if test="${qkfkyclPage.zt=='4'}">selected="selected"</c:if> value="4">退回</option>
	         <option <c:if test="${qkfkyclPage.zt=='5'}">selected="selected"</c:if> value="5">已确认完成</option>
	         <option <c:if test="${qkfkyclPage.zt=='6'}">selected="selected"</c:if> value="6">已确认未完成</option>
	         <option <c:if test="${qkfkyclPage.zt=='99'}">selected="selected"</c:if> value="99">最终完成</option>
	         <option <c:if test="${qkfkyclPage.zt=='-99'}">selected="selected"</c:if> value="-99">最终未完成</option>
	         <option <c:if test="${qkfkyclPage.zt=='A'}">selected="selected"</c:if> value="A">逾期</option>
	         </select>
	         </td>
	         </tr>
	        <tr>
	        <th>申请时间</th>
	         <td>
	         <input id="qssj" class="Wdate" type="text" style="width:50px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',isShowToday:true,isShowClear:true,maxDate:'#F{$dp.$D(\'jssj\')}'})" name="qssj" value="${qkfkyclPage.qssj}" />
	         </td>
	         </tr>
	         <tr>
	         <th>~</th>
	        <td>
	         <input id="jssj" class="Wdate" type="text" style="width:50px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',isShowToday:true,isShowClear:true,minDate:'#F{$dp.$D(\'qssj\')}'})" name="jssj" value="${qkfkyclPage.jssj}" />
	         </td>
	        </tr>
	        <tr>
	        <th>流转接收人</th>
	        <td>
	        	<select id="lzjsrdm" name="lzjsrdm"  style="width: 150px;">
            		<option value="">-请选择-</option>
            		<c:forEach var="map" items="${jsList}">
            		<option value="${map.YHDM}"<c:if test="${map.YHDM==qkfkyclPage.lzjsrdm}">selected="selected"</c:if>>${map.XM}</option>
            		</c:forEach>
            	</select>
	        </td>
	        </tr>
	        
	          <tr>
	        <th>需求编号</th>
	        <td>
	        	
				<input type="text" id="sQDH"  name="sqdh" value="${qkfkyclPage.sqdh}"/>
	        </td>
	        </tr>
 <tr>
	        <th>变更概述</th>
	        <td>
	        	
				<input type="text" id="bggs"  name="bggs" value="${qkfkyclPage.bggs}"/>
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
            <th><input type="checkbox" id="ids"  title="全选/不选" style="padding:0;margin-left:2px;*margin-left:-2px;"/></th>
            <th>需求编号</th>
            <th>项目名称</th>
            <th>变更概述</th>
            <th>申请人</th>
            <th>变更提出人</th>
            <th>变更类型</th>
            <th>紧急程度</th>
            <th>申请时间</th>
            <th>要求完成时间</th>
            <th>状态</th>
            <th>流转人</th>
            <th>流转接收人</th>
            <th width="90">操作</th>
          </tr>
		  <c:forEach items="${qkfklist}" var="map" varStatus="status">
        	<tr <c:if test="${status.count % 2 eq '0'}">class="bgcol"</c:if>>
         	  <td> 
         	  <input name="ids" type="checkbox" value="${map.sqdh}" style="padding:0;margin-left:2px;*margin-left:-2px;"/>
              </td> 
         	  <td>${map.sqdh}</td>
			  <td>${map.xmmc}</td>
			  <td title="${uf:splitAndFilterString(map.bggs,300000)}">${uf:splitAndFilterString(map.bggs,300)}</td>
			  <td>${map.sqrxm}</td>
			  <td>${map.bgtcrxm}</td>
			  <td>${map.bglxmc}</td>
			  <td>${map.jjcdmc}</td>
			  <td>${map.sqsj}</td>
			  <td>${map.yqwcsj}</td>
			  <td>${map.ztmc}</td>
			  <td>${map.lzrmc}</td>
			  <td>${map.lzjsrmc}</td>
              <td>
               <c:if test="${map.sqzt ne '0'&& map.sqzt ne '4'}"></c:if>
                <c:if test="${map.sqzt eq '0'}">
                <div class="cz_button cz1_1" title="修改" onclick="tjxg('2','${map.sqdh}');"></div>
                </c:if>
                <c:if test="${map.sqzt eq '4'}">
                <div class="cz_button cz1_1" title="修改" onclick="tjxg('2','${map.sqdh}');"></div>
                </c:if>
                
				<div class="cz_button cz2_1" title="查看" onclick="ckqkfkcl('${map.sqdh}');"></div>
				</td>
       		</tr>
          </c:forEach>
        </table>
      </form>
    </div>
   
   <div class="youtube"> 
      <c:if test="${not empty qkfkyclPage}">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="qkfkyclPage" onlyOneShow="true" showListNo="true" action="qkfkycl/qkfk"/>
      </c:if>
    </div>
  
    </div>
 </div>
      <div id="qurwcdiv" style="display:none; width: 500px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form name="qrwcfrom" id="qrwcfrom" method="post">
	<div class="popup">
      <div class="Floatleft Pct100 mb10">
        <div class="popup_left">确认完成</div>
        <a href="#" class="btn_close" onclick="javascript:BOX_remove('qurwcdiv');document.getElementById('lzjsrdm').style.display = 'none';"></a> 
      </div>
      <div class="clr"></div>
      <table id="divtab" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
        <tr>
          <th>完成状态</th>
          <td align="left">
         <select id="zt" name="zt">
         <option value="">-请选择-</option>
         <option value="99">完成</option>
         <option value="-99">未完成</option>
         </select>
          </td>      
        </tr> 
        <tr> 
          <th>完成意见</th>
          <td align="left">
          <textarea rows="5"   name = "yj" style="width:98%"></textarea>
          </td>      
        </tr>
        <tr>
          <td colspan="2" align="center">
          	<div class="addlist_button1" style="float:right">
          	  <a href="#"  title="取消" onclick="javascript:BOX_remove('qurwcdiv');document.getElementById('lzjsrdm').style.display = 'none';" ><span>取消</span></a> 
          	</div>
            <div class="addlist_button1 mr15" style="float:right" >
              <a href="javascript:void(0);" onclick="qurwc();" title="确认" ><span>确认</span></a> 
            </div>
          </td>
        </tr>
      </table>
      <div class="clr"></div>
    </div>
  </form>   
</div>
<div id="addOrUpd4" style="display:none; width: 700px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form id="addOrUpdfrom4" name="addOrUpdfrom4" method="post">

    <div class="popup">
      <div class="Floatleft Pct100 mb10">
        <div class="popup_left">确认提交</div>
        <a href="#" class="btn_close" onclick="javascript:BOX_remove('addOrUpd4');document.getElementById('lzjsrdm').style.display = 'none';"></a> 
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
<div id="setting"></div>  
</body>
</html>


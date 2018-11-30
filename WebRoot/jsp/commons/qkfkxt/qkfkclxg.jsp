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
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>
<link rel="stylesheet" href="<%=path%>/resources/js/plupload/jquery.plupload.queue/css/jquery.plupload.queue.css" type="text/css" />
<script type="text/javascript" src="<%=path%>/resources/js/plupload/plupload.full.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/plupload/jquery.plupload.queue/jquery.plupload.queue.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/plupload/i18n/cn.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/plupload/plupload.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/pub/chooseMxdx.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/My97DatePicker/WdatePicker.js"></script>
<link href="<%=path%>/resources/js/select2-4.0.0-rc.2/dist/css/select2.min.css" rel="stylesheet" />
<script src="<%=path%>/resources/js/select2-4.0.0-rc.2/dist/js/select2.min.js"></script>

<script type="text/javascript" >


function jiazai(){
	$("#iframename_lzjsrdm").select2();
	}

//保存
function save(){
	BOX_show('drzDiv');
	document.ff.action="<%=path%>/qkfkycl/addOrUpdfkcl";
    document.ff.submit();
    
}

function downLoadFj(cclj,scr,ccm,xsm){
	$("#cclj").val(cclj+"/"+scr+"/"+ccm);
	$("#xsm").val(xsm);
	document.ff.action='<%=path%>/upload/downFile';
	document.ff.submit();
}

//返回
function goback(){
	document.xx.action="<%=path%>/qkfkycl/fkcl";
	document.xx.submit();
}

</script>
</head>

<body onload="jiazai();">
<div class="Contentbox">
  <div class="mainbg"></div>
  <div class="pd10">
    <div class="address">当前位置：${qkfkyclPage.wz1} >> ${qkfkyclPage.wz2}</div>
    <div class="clr"></div>
    <div class="butsea"> 
      <table  border="0" align="left" cellpadding="0" cellspacing="0"  >
        <tr>
          <td height="35px">
           <div class="addlist_button"> <a href="javascript:goback();"><span>返回</span></a> </div>
            <div class="addlist_button  ml15"> <a href="javascript:save();"><span>审&nbsp;&nbsp;核</span></a> </div>           
          </td>
        </tr>
      </table>
    </div>
    <div class="clr"></div>
     <form name="xx" method="post" id="xx" >
       <input type="hidden" name="xtdm" id="xtdm" value="${fkclPage.xtdm}" />
      <input type="hidden" name="bglxdm" id="bglxdm" value="${fkclPage.bglxdm}" />
      <input type="hidden" name="jjcddm" id="jjcddm" value="${fkclPage.jjcddm}" />
      <input type="hidden" name="lzjsrdm" id="lzjsrdm" value="${fkclPage.lzjsrdm}" />
      <input type="hidden" name="sqzt" id="sqzt" value="${fkclPage.sqzt}" />
      <input type="hidden" name="qssj" id="qssj" value="${fkclPage.qssj}" />
      <input type="hidden" name="jssj" id="jssj" value="${fkclPage.jssj}" />
      <input id="wz11" name="wz1" value="${qkfkyclPage.wz1}" type="hidden"></input>
    <input id="wz21" name="wz2" value="${qkfkyclPage.wz2}" type="hidden"></input>
    <input type="hidden" name="sqdh" id="sqdh1" value="${fkclPage.sqdh}" />
      <input type="hidden" name="bggs" id="bggs" value="${fkclPage.bggs}" />
      </form>
      <form name="ff" method="post" id="ff" >
       <input id="wz1" name="wz1" value="${qkfkyclPage.wz1}" type="hidden"></input>
    <input id="wz2" name="wz2" value="${qkfkyclPage.wz2}" type="hidden"></input>
      <input  type="hidden"   name="inputPath"     id="cclj"/>
	   <input  type="hidden"   name="filename"     id="xsm"/>
      <input type="hidden" name="sqdh" id="sqdh" value="${sqdh}" />
		      <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse"  class="addlist"  >
          <tr>
            <th width="120px">申请人：</th>
            <td>
            	${fkcl.sqr}
            </td>
            <th width="120px">联系方式：</th>
            <td>
            	${fkcl.sqrlxdh}
            </td>
          </tr>
          
           <tr>
            <th>变更提出人：</th>
            <td>
            	${fkcl.bgtcrxm}
            </td>
            <th>联系方式：</th>
            <td>
            	${fkcl.bgtcrlxdm}
            </td>
          </tr>
          
           <tr>
            <th>项目名称：</th>
            <td>
            	${fkcl.xtmc}
            </td>
            <th>紧急程度：</th>
            <td>
            	${fkcl.jjcdmc}
            </td>
          </tr>
          
           <tr>
            <th>变更类型：</th>
            <td>
            	${fkcl.bglxmc}
            </td>
            <th>流转接收人：</th>
            <td>
            	${fkcl.lzrmc}
            </td>
          </tr>
          
          <tr>
            <th>变更提出时间：</th>
            <td>
            	${fkcl.sqsj}
            </td>
            <th>变更完成时间：</th>
            <td>
            	${fkcl.yqwcsj}
            </td>
          </tr>
          
          <tr >
            <th height="76">变更概述：</th>

            <td colspan="3" >${fkcl.bggs}</td>
            </tr>
          
<!--            <tr > -->
<!--             <th>附件下载：</th> -->

<!--             <td colspan="3" ></td> -->
<!--             </tr> -->
	<tr >
				<th>附件下载</th>
				<td colspan="3">
				 <c:forEach  items="${fjlist}"  var="obj">
					<a  href="javascript:void(0);"   onclick="javascript:downLoadFj('${obj.CCLJ}','${obj.SCR }','${obj.CCM }','${ obj.XSM}');return false;" class="blue">${obj.XSM }</a>
   				 </c:forEach> 
				</td>
			</tr>
 		<tr> 	
         <th>处理状态</th>             
         <td>
          <select name="zt" id="zt" class="se150">
	       			<option value="2">通过</option>
	       			<option value="4">不通过</option>
	    		  </select>
         </td>
		
			<th>流转接收人：</th>
          <td align="left">
          <select id="iframename_lzjsrdm" name="lzjsrxmm" >
          <option value="">请选择</option>
          <c:forEach items="${lzrlist}" var="obj">
			    <option value="${obj.YHDM}" >${obj.XM}</option>
			  </c:forEach>
			  </select>        
          </td>
			</tr>
					                   
          <tr style=" height:45px;" >			
				<th height="76">处理意见</th>		
				<td colspan=3><textarea rows="10" style="width: 98%" name = 'yj'></textarea></td>
			</tr>	
          
        </table>
      </form>
  </div>
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
 <div id="setting"> </div>
</body>
</html>

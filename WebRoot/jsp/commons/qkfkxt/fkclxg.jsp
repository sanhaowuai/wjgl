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
<script type="text/javascript" >


function downLoadFj(cclj,scr,ccm,xsm){
	$("#cclj").val(cclj+"/"+scr+"/"+ccm);
	$("#xsm").val(xsm);
	document.ff.action='<%=path%>/upload/downFile';
	document.ff.submit();
}


$().ready(function(){
	plfileupload({
		url:'<%=path%>',
	    savePath:'fkcl',
	    max_file_size:'10mb' ,
	    max_file_length:5, //上传数量
	    buttonId:'fake_btn',
	    formId:'ff' ,
	    downfiles:${empty listfjjson ? '[]' : listfjjson } // 初值
	},save);
});
//校验数据   填写完全可以上传附件
function testData(){
	
// 		var content=xxnrIframe.getHTML();
		BOX_show('drzDiv');
			$("#fake_btn").click();  //触发隐藏btn 上传附件并调用save方法
			
	}

//保存
function save(){
	
	document.ff.action="<%=path%>/fkcl/addOrUpdfkcl";
    document.ff.submit();
}
// 返回
function goback(){
	
	document.xx.action="<%=path%>/fkcl/queryFkcl";
	document.xx.submit();
}


</script>
</head>

<body>
<div class="Contentbox">
  <div class="mainbg"></div>
  <div class="pd10">
   <div class="address">当前位置：${fkclPage.wz1} >> ${fkclPage.wz2}</div>
    <div class="clr"></div>
    <div class="butsea"> 
      <table  border="0" align="left" cellpadding="0" cellspacing="0"  >
        <tr>
          <td height="35px">
            <div class="addlist_button"> <a href="javascript:goback();"><span>返&nbsp;&nbsp;回</span></a> </div>           
          </td>
        </tr>
      </table>
    </div>
      <form name="xx" method="post" id="xx" >
       <input type="hidden" name="xtdm" id="xtdm" value="${fkclPage.xtdm}" />
      <input type="hidden" name="bglxdm" id="bglxdm" value="${fkclPage.bglxdm}" />
      <input type="hidden" name="jjcddm" id="jjcddm" value="${fkclPage.jjcddm}" />
      <input type="hidden" name="lzjsrdm" id="lzjsrdm" value="${fkclPage.lzjsrdm}" />
      <input type="hidden" name="sqzt" id="sqzt" value="${fkclPage.sqzt}" />
      <input type="hidden" name="qssj" id="qssj" value="${fkclPage.qssj}" />
      <input type="hidden" name="jssj" id="jssj" value="${fkclPage.jssj}" />
      <input type="hidden" name="sqdh" id="sqdh1" value="${fkclPage.sqdh}" />
      <input type="hidden" name="bggs" id="bggs" value="${fkclPage.bggs}" />
      </form>
    <div class="clr"></div>
      <form name="ff" method="post" id="ff" >
      <input type="hidden" name="sqdh" id="sqdh" value="${sqdh}" />  
       <input  type="hidden"   name="inputPath"     id="cclj"/>
	   <input  type="hidden"   name="filename"     id="xsm"/>  
      <input type="hidden" name="fake_btn" id="fake_btn" /><%--   触发上传附件button  --%>
		    <table width="100%" cellpadding="0" cellspacing="0"   class="addlist"  >
          <tr>
            <th width="120px">申请人：</th>
            <td >
            	${fkcl.sqr}
            </td>
            <th width="120px">联系方式：</th>
            <td >
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
            <th>上传附件：</th>
            <td colspan="3">
            	<div id="div_fj">
            		<div style="padding: 10px 10px 10px 0;" >
              			<span>最多只能上传5个附件，并且每个附件不超过10M</span>
             			  <div id="uploader" >
                 			 <p>您的浏览器未安装 Flash, Silverlight, Gears, BrowserPlus 或者支持 HTML5 .</p>
             		      </div>
            		</div>
       	 		</div>
            </td>
          </tr>
         
         
         
         <c:forEach  items="${fbjhlist}"  var="obj">
        <c:if test="${obj.ZT eq '3'}"><input id="lzsj" class="Wdate" type="hidden" style="width:90%;" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',isShowToday:true,isShowClear:true})" name="" value="${obj.LZSJ}" /></c:if>      
			<tr>
		<!-- ************************************************************* -->
		    <c:if test="${obj.ZT eq '1'}"><th>申请状态</th></c:if>
			<c:if test="${obj.ZT eq '2' || obj.ZT eq '4'}"><th>审核状态</th></c:if>
			<c:if test="${obj.ZT eq '3'}"><th>处理状态</th></c:if>			
			
		<!-- ************************************************************* -->	
		    <c:if test="${obj.ZT eq '1'}"><td>提交</td></c:if>
			<c:if test="${obj.ZT eq '2'}"><td>通过</td></c:if>
			<c:if test="${obj.ZT eq '3'}"><td>接收</td></c:if>
			<c:if test="${obj.ZT eq '4'}"><td>退回</td></c:if>				
		<!-- ************************************************************* -->
		    <c:if test="${obj.ZT eq '1' }"><th>申请人</th></c:if>
			<c:if test="${obj.ZT eq '2' }"><th>审核人</th></c:if>
			<c:if test="${obj.ZT eq '3' || obj.ZT eq '4'}"><th>处理人</th></c:if>
			
			
			<!-- ************************************************************* -->
				<c:if test="${obj.ZT eq '1' || obj.ZT eq '2' || obj.ZT eq '3' || obj.ZT eq '4'}"><td>${obj.LZRXM}</td></c:if>								
			</tr>
			
		

			<tr>
<%-- 			    <c:if test="${obj.ZT eq '1'}"><th height="76">申请意见</th></c:if> --%>
				<c:if test="${obj.ZT eq '2'}"><th height="76">审核意见</th></c:if>
				<c:if test="${obj.ZT eq '3'}"><th height="76">处理意见</th></c:if>
				<c:if test="${obj.ZT eq '4'}"><th height="76">退回意见</th></c:if>				
				<c:if test="${obj.ZT eq '2' || obj.ZT eq '3' || obj.ZT eq '4'}"><td colspan="3">${obj.YJ}</td></c:if>
			</tr>
						
 		</c:forEach>
 		
 		<tr> 	
         <c:if test="${sqzt eq '1'||sqzt eq '2'}"><th>处理状态</th></c:if>
         <c:if test="${sqzt eq '3'}"><th>完成状态</th></c:if>
         <!-- ************************************************************* -->	
         <c:if test="${sqzt eq '1'||sqzt eq '2'}"><td>
          <select name="zt" id="zt" class="se150">
	       			<option value="3">接收</option>
	       			<option value="4">退回</option>
	    		  </select>
         </td></c:if>
			<c:if test="${sqzt eq '3'}"><td>
			 <select name="zt" id="zt" class="se150">
	       			<option value="5">已完成</option>
	       			<option value="6">未完成</option>
	    		  </select>
			</td></c:if>			
          <!-- ************************************************************* -->
			<c:if test="${sqzt eq '1'||sqzt eq '2'}"><th>处理人</th></c:if>
			<c:if test="${sqzt eq '3'}"><th>处理人</th></c:if>
			<td>${yhxm}</td>
			</tr>
			
			
			<tr>
			 <!-- ************************************************************* -->
			<c:if test="${sqzt eq '1' || sqzt eq '2' }"><th>预计完成时间：</th></c:if>
			<c:if test="${sqzt eq '3' }"><th>完成时间：</th></c:if>
          <td colspan=3>
          <div style="width: 500px; float: left;">
          <c:if test="${sqzt eq '1' || sqzt eq '2' }"><input id="wcyjsj" class="Wdate" type="text" style="width:90%;" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',isShowToday:true,isShowClear:true,minDate:'#F{$dp.$D(\'sqsj\')}'})" name="wcyjsj" value="" />
          <input id="sqsj" class="Wdate" type="hidden" style="width:90%;" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',isShowToday:true,isShowClear:true})" name="" value="${fkcl.sqsj}" />       
          </c:if>
          <c:if test="${sqzt eq '3' }">
          <input id="wcyjsj" class="Wdate" type="text" style="width:90%;" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',isShowToday:true,isShowClear:true,minDate:'#F{$dp.$D(\'lzsj\')}'})" name="wcyjsj" value="" />
         </c:if>
          </div>
          
          <div class="addlist_button2 ml15" > <a href="javascript:void(0);" onclick="javascript:testData();return false;">
          <c:if test="${sqzt eq '1' || sqzt eq '2' }"><span>处&nbsp;&nbsp;理</span></c:if>
          <c:if test="${sqzt eq '3' }"><span>确认完成</span></c:if>
          </a> </div>
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
<div id="setting"></div>
 
</body>
</html>

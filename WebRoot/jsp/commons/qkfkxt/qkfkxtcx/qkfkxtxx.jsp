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
<title>情况反馈 >>信息查看</title>
<jsp:include page="../../../include/css-main-include.jsp"></jsp:include>
<style type="text/css">
	html, body { height:100%; }
	.Contentbox { width:100%; min-height:100%; height:auto}
	*html .Contentbox { height:100% }
	.address{margin-top:0px}
	.main tr{ height:30px; border:#CCCCCC 1px solid;}
	.main td{ width:100px;height:15px; border:#CCCCCC 1px solid;}
	td.kk {padding-left:20px}
	 td.yy{background-color:rgb(239, 249, 254);}
</style>

<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript">
	 
	 
function downLoadFj(cclj,scr,ccm,xsm){
	$("#cclj").val(cclj+"/"+scr+"/"+ccm);
	$("#xsm").val(xsm);
	document.ff.action='<%=path%>/upload/downFile';
	document.ff.submit();
}
</script>
</head>

<body>
<div class="Contentbox">
  <div class="pd10">
     <div class="address">当前位置：情况反馈 >>信息查看</div>
 
	   	 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="main">
			<tr align="center">
				<td colspan="2" class="yy">申请人</td>
				<td colspan="2" >${qkfkxtFksqbEntity.xqrxm}</td>
				<td colspan="2" class="yy"> 联系方式</td>
				<td colspan="2" >${qkfkxtFksqbEntity.sqrlxdh}</td>
			</tr>

			<tr align="center">
				<td colspan="2" class="yy">变更提出人</td>
				<td colspan="2">${qkfkxtFksqbEntity.bgtcrxm}</td>
				<td colspan="2" class="yy">联系方式</td>
				<td colspan="2" >${qkfkxtFksqbEntity.bgtcrlxdm}</td>
			</tr>

			<tr  align="center">
				<td colspan="2" class="yy">项目名称</td>
				<td colspan="2">${qkfkxtFksqbEntity.xtmc}</td>
				<td colspan="2" class="yy">紧急程度</td>
				<td colspan="2">${qkfkxtFksqbEntity.jjcdmc}</td>
			</tr>

			<tr align="center">
				<td colspan="2" class="yy">变更类型</td>
				<td colspan="2">${qkfkxtFksqbEntity.bglxmc}</td>
				<td colspan="2" class="yy">流转接收人</td>
				<td colspan="2">${qkfkxtFksqbEntity.lzjsrmc}</td>
			</tr>

			<tr align="center">
				<td colspan="2" class="yy">变更提出时间</td>
				<td colspan="2">${qkfkxtFksqbEntity.sqsj}</td>
				<td colspan="2" class="yy">变更完成时间</td>
				<td colspan="2">${qkfkxtFksqbEntity.yqwcsj}</td>
			</tr>

			<tr style=" height:90px;">
				<td  colspan="2" align="center" class="yy" >变更概述</td>
				<td colspan="6" class="kk">${qkfkxtFksqbEntity.bggs}</td>
			</tr>

			<tr >
				<td colspan="2" align="center" class="yy">附件下载</td>
				<td colspan="6" class="kk">
				 <c:forEach  items="${fjlist}"  var="obj">
					<a  href="javascript:void(0);"   onclick="javascript:downLoadFj('${obj.CCLJ}','${obj.SCR }','${obj.CCM }','${ obj.XSM}');return false;" class="blue">${obj.XSM }</a>
   				 	<br>
   				 </c:forEach> 
				</td>
			</tr>
         </table>
       
		 <c:forEach  items="${fbjhlist}"  var="obj">
		 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="main mt5 mb5">
		 <c:if test="${obj.ZT != '0'}">
			<tr>
		<!-- ************************************************************* -->
			<c:if test="${obj.ZT eq '1' || obj.ZT eq '2' || obj.ZT eq '4'}"><td align="center" class="yy">审核状态</td></c:if>
			<c:if test="${obj.ZT eq '3'}"><td align="center" class="yy">处理状态</td></c:if>
			<c:if test="${obj.ZT eq '5' || obj.ZT eq '6' || obj.ZT eq '99'|| obj.ZT eq '-99'}"><td align="center" class="yy">完成状态</td></c:if>
			
		<!-- ************************************************************* -->	
			<c:if test="${obj.ZT eq '1'}"><td class="kk">已提交</td></c:if>
			<c:if test="${obj.ZT eq '2'}"><td class="kk">已流转</td></c:if>
			<c:if test="${obj.ZT eq '3'}"><td class="kk">已接收</td></c:if>
			<c:if test="${obj.ZT eq '5'}"><td class="kk">已确认完成</td></c:if>
			<c:if test="${obj.ZT eq '6'}"><td class="kk">已确认未完成</td></c:if>
			<c:if test="${obj.ZT eq '99'}"><td class="kk">最终完成</td></c:if>
			<c:if test="${obj.ZT eq '-99'}"><td class="kk">最终未完成</td></c:if>
			<c:if test="${obj.ZT eq '4'}"><td class="kk">退回</td></c:if>	
		<!-- ************************************************************* -->
			<c:if test="${obj.ZT eq '1'}"><td align="center" class="yy">申请人</td></c:if>
			<c:if test="${obj.ZT eq '2' || obj.ZT eq '4' }"><td align="center" class="yy">审核人</td></c:if>
			
			<c:if test="${obj.ZT eq '3' || obj.ZT eq '5' || obj.ZT eq '6' }"><td align="center" class="yy">处理人</td></c:if>
			<c:if test="${obj.ZT eq '99' || obj.ZT eq '-99' }"><td align="center" class="yy">申请人确认</td></c:if>
			
			<!-- ************************************************************* -->
				
				<c:if test="${obj.ZT eq '1'|| obj.ZT eq '2' || obj.ZT eq '3' || obj.ZT eq '4'}"><td class="kk">${obj.LZRXM}</td></c:if>
				<c:if test="${obj.ZT eq '5'|| obj.ZT eq '6'}"><td class="kk">${obj.LZRXM}</td></c:if>
				<c:if test="${obj.ZT eq '99'|| obj.ZT eq '-99'}"><td class="kk">${obj.SQRXM}</td></c:if>
				
			<!-- ************************************************************* -->
			<c:if test="${obj.ZT eq '1' || obj.ZT eq '2' || obj.ZT eq '4'}"><td align="center" class="yy">流转接收人</td></c:if>
			<c:if test="${obj.ZT eq '5' || obj.ZT eq '6'}"><td align="center" class="yy">处理接收人</td></c:if>
			<c:if test="${obj.ZT eq '3'}"><td align="center" class="yy"></td></c:if>
			<c:if test="${obj.ZT eq '99' || obj.ZT eq '-99' }"><td align="center" class="yy"></td></c:if>
			<!-- ************************************************************* -->
			
			<c:if test="${obj.ZT eq '1' || obj.ZT eq '2' || obj.ZT eq '4' || obj.ZT eq '5' || obj.ZT eq '6'}"><td align="center"  class="kk">${obj.LZJSRXM}</td></c:if>
			<c:if test="${obj.ZT eq '3' || obj.ZT eq '99' || obj.ZT eq '-99' }"><td align="center"  class="kk"></td></c:if>

			<!-- ************************************************************* -->	
				<c:if test="${obj.ZT eq '1' || obj.ZT eq '2' || obj.ZT eq '4'}"><td align="center" class="yy">流转时间</td></c:if>
				<c:if test="${obj.ZT eq '3' || obj.ZT eq '5' || obj.ZT eq '6'}"><td align="center" class="yy">处理时间</td></c:if>
				<c:if test="${obj.ZT eq '99' || obj.ZT eq '-99'}"><td align="center" class="yy">确认时间</td></c:if>
				
			<td align="center"  class="kk">${obj.LZSJ}</td>
			
				
				
			</tr>
		</c:if>	
			
		<c:if test="${obj.WCYJSJ != null}">
			<tr>
				<c:if test="${obj.ZT eq '3'}"><td align="center" class="yy">预计完成时间</td></c:if>
				<c:if test="${obj.ZT eq '5' || obj.ZT eq '6'}"><td align="center" class="yy">实际完成时间</td></c:if>
				<c:if test="${obj.ZT eq '99'}"><td align="center" class="yy">最终确认完成时间</td ></c:if>
				
				
				<td colspan="7" class="kk">${obj.WCYJSJ}</td>
			</tr>
		</c:if>	

		<c:if test="${obj.ZT != '0' && obj.ZT !='1'}">
			<tr style=" height:45px;" >
				<%-- <c:if test="${obj.ZT eq '1'}"><td align="center" class="yy" >申请意见</td></c:if> --%>
				<c:if test="${obj.ZT eq '2'}"><td align="center" class="yy" >审核意见</td></c:if>
				<c:if test="${obj.ZT eq '3' || obj.ZT eq '5' || obj.ZT eq '6'}"><td align="center" class="yy">处理意见</td></c:if>
				<c:if test="${obj.ZT eq '99'}"><td align="center" class="yy">完成意见</td></c:if>
				<c:if test="${obj.ZT eq '4'}"><td align="center" class="yy">退回意见</td></c:if>
				<c:if test="${obj.ZT eq '-99'}"><td align="center" class="yy">未完成意见</td></c:if>
				<td colspan="7" class="kk">${obj.YJ}</td>
			</tr>
		</c:if>
		
		 <c:if test="${fn:length(obj.fjb) != 0}">
		 
		 <tr>
		 	<td align="center" class="yy">附件下载</td>
		 	<td colspan="7">
		 	<c:forEach  items="${obj.fjb}"  var="fjb">
		 	<a  href="javascript:void(0);"   onclick="javascript:downLoadFj('${fjb.cclj}','${fjb.scr }','${fjb.ccm }','${ fjb.xsmc}');return false;" class="blue">${fjb.xsmc }</a>
		 	<br>
		 	</c:forEach>
		 	</td>
		 	
		 </tr>			 
		 </c:if>
		
		</table>
 		</c:forEach> 	



	   	 
 <div id="Upd" style="display:none; width: 800px;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;" >
    <form method="post"  id="ff"  name="ff">
	   	 <input  type="hidden"   name="inputPath"     id="cclj"/>
	   	 <input  type="hidden"   name="filename"     id="xsm"/>
	   	 </form>
    </div>	   	 
	   	 
	   	 

  </div>
</div>

 
<div id="setting"> </div>
</body>
</html>


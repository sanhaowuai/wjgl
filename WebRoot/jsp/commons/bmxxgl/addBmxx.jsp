<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.lang.*,java.util.*,java.text.*" %>

<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>添加部门信息</title>
<meta content="text/html; charset=utf-8" http-equiv=Content-Type />
 <jsp:include page="../../include/css-main-include.jsp"></jsp:include>
<style type="text/css">
  html, body { height:100%; }
  .Contentbox { width:100%; min-height:100%;height:auto }
  *html .Contentbox { height:100% }
</style>
<!-- CSS end -->
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js"></script>

<link rel="stylesheet" href="<%=path%>/resources/js/plupload/jquery.plupload.queue/css/jquery.plupload.queue.css" type="text/css" />
<script type="text/javascript" src="<%=path%>/resources/js/plupload/plupload.full.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/plupload/jquery.plupload.queue/jquery.plupload.queue.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/plupload/i18n/cn.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/plupload/plupload.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/ckeditor4.1.2/ckeditor.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/pub/chooseMxdx.js"></script>

<script type="text/javascript">
$().ready(function(){
	plfileupload({
	      url:'<%=path%>',
	      savePath:'bmxxgl',
	      max_file_size:'10mb' ,
	      max_file_length:5, //上传数量
	      buttonId:'fake_btn',
	      formId:'ff' ,
	      downfiles:${empty listfjjson ? '[]' : listfjjson } // 初值
	   },save);
});

var code;
var zNodes;
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

//校验数据   填写完全可以上传附件
function testData(flag,obj){
	if(Validator.Validate(document.getElementById('ff'),3) ){
		$("#sffb").val(flag);
		var content= xxnrIframe.getHTML();
		if(content!=""){
			//$(obj).removeAttr('href');//去掉a标签中的href属性
			//$(obj).removeAttr('onclick');//去掉a标签中的onclick事件
			$("#fake_btn").click();  //触发隐藏btn 上传附件并调用save方法
		}else{
	        alert("请填写信息内容!!");
		}
	}
}
//保存方法
function save(){
	/**
	var kjyhfw = "";
	$("input[name='yhfws']").each(function(k,v){
		kjyhfw += $(this).val()+",";
	});
	kjyhfw = kjyhfw.substring(0,kjyhfw.lastIndexOf(","));
	$("#ff_kjyhfw").val(kjyhfw);
	**/
	document.ff.action="<%=request.getContextPath() %>/bmxxgl/addBmxx";
    document.ff.submit();
}
function queryLike(){
    document.ff.action = '<%=path%>/bmxxgl/queryAllBmxx';
    document.ff.submit();
}
//选择用户弹出层
function chooseYh(){
	 var src = "<%=request.getContextPath() %>/bmxxgl/queryToXzbm?random="+Math.random()*100000;
	 $("#tabid_add").attr("src",src);
	 BOX_show('test_con2');
}
//获取收件人
function getSjr(){
	var treeObj = window.frames['tabid_add'].window.$.fn.zTree.getZTreeObj("treeDemo");
	var nodes = treeObj.getCheckedNodes(true);
	var obj = "";
	var ysHtml = $("#yhfw_Div").html();
	var newHtml="";
	for(var i=0;i<nodes.length;i++){
	    var divHtml = $("#yhfw_"+nodes[i].id+"").html();
	    if( divHtml==null || divHtml== ""){
	       //增加收件人隐藏域
	        $("#ff").append("<input type='hidden' id='yhfwInput_"+nodes[i].id+"' name=\"yhfws\" value='"+nodes[i].id+"'/>");
			var mcid = nodes[i].name +"【"+nodes[i].id +"】";
	        newHtml += "<div class='Floatleft mb5 mr5' id='yhfw_"+nodes[i].id+"'><span  class='tag'><span>"+mcid+"</span><a id='span_"+nodes[i].id+"' onclick='onDelZycp(\""+nodes[i].id+"\",\""+nodes[i].name+"\");return false;'>X</a></span></div>";
	    }
	}
  	$(newHtml).insertBefore("#input2");
	BOX_remove('test_con2');
}
//删除收件人
function onDelZycp(yhdm,xm){
    $('#yhfwInput_'+yhdm).remove();//移除input
    $('#yhfw_'+yhdm).remove();//移除div
}

//发布并保存
function fbbbc(flag){
	if(Validator.Validate(document.getElementById('ff'),3) ){
		if(confirm("您是否要发布并保存此条信息？")){		
			$("#sffb").val(flag);
			var content= xxnrIframe.getHTML();
			if(content!=""){
				//$(obj).removeAttr('href');//去掉a标签中的href属性
				//$(obj).removeAttr('onclick');//去掉a标签中的onclick事件
				$("#fake_btn").click();  //触发隐藏btn 上传附件并调用save方法
			}else{
		        alert("请填写信息内容!!");
			}
		}
	}
}
function qxfbxx(flag){
	if(Validator.Validate(document.getElementById('ff'),3) ){
		if(confirm("您是否要取消发布并保存此条信息？")){
			$("#sffb").val(flag);
			var content= xxnrIframe.getHTML();
			if(content!=""){
				//$(obj).removeAttr('href');//去掉a标签中的href属性
				//$(obj).removeAttr('onclick');//去掉a标签中的onclick事件
				$("#fake_btn").click();  //触发隐藏btn 上传附件并调用save方法
			}else{
		        alert("请填写信息内容!!");
			}
		}
	}
}

function mxdxOpen(id){
	var par = id;
	var URL="${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/chooseMxdx/PT_XT_XXFB/XXID/"+par;
    window.open(URL,null,"height=550, width=900,toolbar=no, menubar=no, scrollbars=no, resizable=no, loca tion=no, status=no");
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
  		 <div class="addlist_button"> <a  href="javascript:void(0);" onclick="javascript:queryLike();return false;"><span>返&nbsp;&nbsp;回</span></a> </div>
        	<c:if test="${xxfbbEntity.sffb ne '1' }">
        	<c:if test="${saveflag == '1' || xxfbbEntity.sffb == '0'}">
            	<div class="addlist_button  ml15"> <a id="saveid" onclick="javascript:testData('0',this);return false;"><span>保&nbsp;&nbsp;存</span></a> </div>
            </c:if>
            <div class="addlist_button  ml15"> <a   onclick="javascript:testData('1',this);return false;"><span>发&nbsp;&nbsp;布</span></a> </div>
            </c:if>
            <c:if test="${xxfbbEntity.sffb eq '1'}">
            	<div class="addlist_button  ml15"> <a onclick="javascript:fbbbc('1');return false;"><span>发布并保存</span></a> </div>
            	<div class="addlist_button  ml15"> <a onclick="javascript:qxfbxx('0');return false;"><span>取消发布并保存</span></a> </div>
            </c:if>
      </div>  
    <div class="clr"></div>
    <!--反馈列表-->
      <div>
		      <form name="ff" method="post" id="ff" >
			  <input type="hidden" name="xxid"  value="${xxfbbEntity.xxid}" />
			  <input type="hidden" id="pglfw" name="pglfw" value="${bmxxPage.pglfw}"/>  <%--	管理范围  --%>
			  <input type="hidden" id="pckfw" name="pckfw"  value="${bmxxPage.pckfw}" />
			  <input type=hidden name="pfbksrq"  value="${bmxxPage.pfbksrq}" />
			  <input type=hidden name="pfbjsrq"  value="${bmxxPage.pfbjsrq}" />
			  <input type=hidden name="pxxbt"  value="${bmxxPage.pxxbt}" />
			  <input type="hidden" name="pfbr"  value="${bmxxPage.pfbr}"/>
		  	  <input type="hidden" name="pfbbm"  value="${bmxxPage.pfbbm}"/>
			  <input type="hidden" name="fake_btn" id="fake_btn" /><%--   触发上传附件button  --%>
			   <input type="hidden" name="sffb" id="sffb" /><%--	是否发布  1.是   0.保存  --%>
			   <input type="hidden" name="kjyhfw" id="ff_kjyhfw" value="1"/>
			   <input type="hidden" name="newxxid" id="newxxid" value="${newxxid}" />
		      <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse"  class="addlist"  >
		        <tr>
		          <th width="80">信息标题：</th>
		          <td colspan="3">
		            <input type="text" name="xxbt" value="${xxfbbEntity.xxbt}<c:if test="${saveflag ne '1' && xxfbbEntity.sffb eq '1'}">[修正]</c:if>" dataType="Limit" min="1" max="100" msg="请正确填写标题(100字符内)" style="width:80%;" />
		            <span class="red ml5">*</span>
		          </td>
		        </tr>
	          	<tr>
	            	<th>通知对象：</th>
	            	<td>
            		<input type="text" name="mxdxxsz" id="mxdxxsz" disabled="disabled" value="${xxfbbEntity.mxdxxsz }" style="width:80%;"/>
            	<c:if test="${not empty xxfbbEntity.xxid}"><button type="button" class="btn btn-info"  onclick="javascript:mxdxOpen('${xxfbbEntity.xxid}');;return false;">选择</button></c:if>
            	<c:if test="${empty xxfbbEntity.xxid}"><button type="button" class="btn btn-info"  onclick="javascript:mxdxOpen('${newxxid}');;return false;">选择</button></c:if>					
            		</td>
          		</tr>	            			        
<!-- 		         <tr> -->
		
<!-- 		          <th width="10%">用户类型：</th> -->
<!-- 		          <td width="40%" colspan="3"> -->
<!-- 		            <select name="kjyhlx" id="ff_kjyhlx"    dataType="Require" msg="必选"> -->
<%-- 		                <option value="0" ${xxfbbEntity.kjyhlx eq '0' ? 'selected':'' }> 全部 </option> --%>
<%-- 		                <option value="1" ${xxfbbEntity.kjyhlx eq '1' ? 'selected':'' }  ${xxfbbEntity.kjyhlx==null ||xxfbbEntity.kjyhlx=='' ? 'selected':''}> 教师 </option> --%>
<%-- 		                <option value="2" ${xxfbbEntity.kjyhlx eq '2' ? 'selected':'' }> 学生 </option> --%>
<!-- 		            </select> -->
<!-- 		            <span class="red ml5">*</span> -->
<!-- 		          </td> -->
<!-- 		        </tr> -->
		        <tr>
		          <th width="10%">信息类别：</th>
		          <td width="40%" colspan="3">
		            <select name="xxlb" id="xxlb"    dataType="Require" msg="必选">
		                <c:forEach items="${lb}" var="a">
		                 <option value="${a.DM }" ${xxfbbEntity.xxlb eq a.DM ? 'selected':'' }> ${a.MC } </option>
		                </c:forEach>
		               
		            </select>
		            <span class="red ml5">*</span>
		          </td>
		        </tr>
<!-- 		         <tr > -->
<!-- 		          <th width="10%">面向部门：</th> -->
<!-- 		          <td colspan="3" > -->
<!-- 		              <input type="hidden" name="kjyhfw" id="ff_kjyhfw" /> -->
<!-- 		              <div id="yhfw_Div" style=" min-height:0px; width:100%;float:left;"> -->
<%-- 			              <c:if test="${empty xxfbbEntity.xxid }"  > 添加并且当前用户数据权限不超过3    --%>
<%-- 				           </c:if> --%>
<%-- 				           <c:if test="${not empty xxfbbEntity.xxid }"  >  修改时       --%>
<%-- 			                  <c:forEach items="${xylist}" var="obj" varStatus="i"> --%>
<%-- 			                     <input type="hidden" id="yhfwInput_${obj.YXDM}"  name="yhfws" value="${obj.YXDM}" /> --%>
<%-- 				                 <div class='Floatleft mb5 mr5' id="yhfw_${obj.YXDM}"><span  class="tag"><span>${obj.YXMC}【${obj.YXDM}】</span><a id="span_${obj.YXDM}" onclick="javascript:onDelZycp('${obj.YXDM}','${obj.YXMC}');return false;">X</a></span></div> --%>
<%-- 				              </c:forEach> --%>
<%-- 				           </c:if> --%>
<!-- 		                  <input  type="hidden" id="input2" /> -->
<!-- 		              </div> -->
<!-- 		              <div class="addlist_button mt3"><a class="lxr_co" href="javascript:chooseYh();"><span>选择部门</span></a></div> -->
		              
<!-- 		           </td> -->
<!-- 		         </tr> -->
		        <tr>
		          <th width="80">信息内容：</th>
		          <td colspan="3" align="center" >
		            <div style="padding: 10px 10px 10px 0;">
	            		<textarea name="xxnr" id="xxnr" style="display:none">${xxfbbEntity.xxnr}</textarea>
	                    <iframe id="xxnrIframe" name="xxnrIframe" src="<%=path%>/resources/ewebeditor/ewebeditor.htm?id=xxnr&style=standard650" frameborder="0" scrolling="no" width="100%" height="450"></iframe>
		            </div>
		          </td>
		        </tr>
		        <tr>
		        	<th width="10%" >附件：</th>
		        	<td colspan="3"  width="80%">
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
		
		      </table>
		  </form>
  	</div>
 
    <div class="clr"></div>
  </div>
  <div class="clr"></div>
</div>

<div id="test_con2" style="display:none; width: 400px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
<form id="addOrUpdfrom" name="addOrUpdfrom" method="post">
<input type="hidden" name="zt" id="zt"/><!-- 1：添加  2：修改 -->
<input type="hidden"  id="ysdm"/>
    <div class="popup">
        <div class="clr"></div>
        <div class="Floatleft Pct100 ">
          <div class="popup_left">选择部门</div>
		  <iframe id="tabid_add" name="tabid_add" scrolling="no" src="" border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%; height: 350px;" frameborder="0" allowTransparency="true"></iframe>
		</div>
		 <div class="Floatleft Pct100">
          
            <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:void(0);" title="关闭" name="savBut" onclick="javascript:BOX_remove('test_con2');return false;"><span>关闭</span></a> </div>
            <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:void(0);" title="确定" name="savBut" onclick="javascript:getSjr();return false;"><span>确定</span></a> </div>
        </div>
        <div class="clr"></div>
    </div>
</form>
</div>
<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"> </div>

</body>
</html>


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
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jquery.ztree.core-3.1.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jquery.ztree.excheck-3.1.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/bootstrap.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
	   $("#ff").baigoCheckall();
	});
	//查询
	function queryLike(){
	    document.queryform.action = '<%=path%>/bmxxgl/queryAllBmxx';
	    document.queryform.submit();
	}
	
	function addDiv(){
		 document.ff.action = "<%=path%>/bmxxgl/queryForAddBmxx";
		 document.ff.submit();
	}
	function updateByID(xxid){
		$("#ff_xxid").val(xxid);
		 document.ff.action = "<%=path%>/bmxxgl/queryForUpdateBmxx";
		 document.ff.submit();
	}
	function deleteDiv(){
		  if(isCheck('ids') == false){
		        alert("请选择要删除的信息");
		        return;
		    }else{
	    	if(confirm('您确认要删除选中信息吗?')){
	    		 
	    		document.ff.action = "<%=path%>/bmxxgl/deleteBmxx";
	    		$("#ff").ajaxSubmit(function(result){
	    			 if(result=="0"){
	                     alert("删除成功!!");
	                     queryLike();
	       			 }else{
						alert("删除失败!!");
	         		 }
	    		});
	       	}
	    }
	}
	function fbxx(xxid){
		if(confirm("您确定要发布该信息吗?")){
			var url = "<%=path%>/bmxxgl/updGgSffb"; 
			$.post(url,{xxid:xxid},function(result){
				 if(result=="0"){
					 alert("发布成功!!");
					  queryLike();
				 }else{
		            alert("发布失败!!");
				 }
			},'json');
		}
	}
	//查看回执
	function ckhzByID(xxid){
		$("#ff_xxid").val(xxid);
		document.ff.action = "<%=path%>/bmxxgl/queryForCkhzBmxx";
		document.ff.submit();
	}
	//查看
	function ckByID(xxid){
		 window.open('<%=path%>/bmxxgl/bmxxcxOne?flag=1&xxid='+xxid+'&random='+Math.random()*100000,"查看信息",'height=600, width=1024, top=100, left=300, titlebar=no,toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no,z-look=yes');
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
          <td height="35px"> 
            <div class="addlist_button"> <a href="javascript:addDiv();"><span>添&nbsp;&nbsp;加</span></a> </div>
            <div class="addlist_button  ml15"> <a href="javascript:deleteDiv();"><span>删&nbsp;&nbsp;除</span></a> </div> 
          </td>
        </tr>
      </table>
	 <div class="dropdown pull-right">
       <form name="queryform" method="post" id="queryform" >
	   <div class="btn-group">
		  <button type="button" class="btn btn-search dropdown-toggle" data-toggle="dropdown">搜索 <span class="caret"></span></button>
		  <div class="dropdown-menu search-list pull-right" role="menu" style="width:260px;">
          <table border="0" width="96%"  cellpadding="0" cellspacing="0"  >
		      <tr>
		      	<th width="100">信息类别：</th>
	           	<td>
	           	  <select name="plb" id="plb" >
		             <option value="" >--信息类别--</option>
		        		<c:forEach items="${lb}" var="map" varStatus="status">
		        			<option value='${map.DM}' <c:if test="${bmxxPage.plb eq map.DM}">selected</c:if>>
		     				${map.MC}
		     			</option>
		 				</c:forEach>
		       		</select> 
	           	</td>
		       </tr>
		       <tr>
		        <th>发布人：</th>
	           	<td><input type="text" name="pfbr" id="qf_fbr" value="${bmxxPage.pfbr}"/></td>
		      </tr>
		      <tr>
		        <th>信息标题：</th>
	           	<td><input type="text" name="pxxbt" id="qf_xxbt" value="${bmxxPage.pxxbt}"/></td>
		      </tr>
<!-- 		      <tr> -->
<!-- 		      	<th>部门：</th> -->
<!-- 	           	<td> -->
<!-- 	           	  <select name="pfbbm" id="qf_fbbm"> -->
<!-- 		              <option value="" >--部门--</option> -->
<%-- 		         		<c:forEach items="${yxlist}" var="map" varStatus="status"> --%>
<%-- 		         			<option value='${map.YXDM}' <c:if test="${bmxxPage.pfbbm eq map.YXDM}">selected</c:if>> --%>
<%-- 		      				${map.YXMC} --%>
<!-- 		      			</option> -->
<%-- 		  				</c:forEach> --%>
<!-- 		         </select> -->
<!-- 	           	</td> -->
<!-- 		       </tr> -->
		       <tr>
		        <th>发布起始时间：</th>
	           	<td>
	           	  <div  onclick="javascript:pfbksrq.click();return false;">
	               <input name="pfbksrq" id="qf_ksrq"  value="${bmxxPage.pfbksrq}" type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',maxDate:'#F{$dp.$D(\'qf_jsrq\')}'})" class="Wdate"/>
	        	 </div> 
                </td>
		      </tr>
		       <tr>
		        <th>发布结束时间：</th>
	           	<td>
	           	  <div onclick="javascript:pfbjsrq.click();return false;">
	            	<input name="pfbjsrq" id="qf_jsrq"  value="${bmxxPage.pfbjsrq}" type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',minDate:'#F{$dp.$D(\'qf_ksrq\')}'})" class="Wdate"/> 
	        	  </div> 
	           	</td>
      		</tr>
      	</table> 
	    <div class="divider"></div>
        <div class="clr"></div>
        <div class="addlist_button pull-right mr10"> <a href="javascript:void(0);" onclick="javascript:queryLike();return false;"><span>确定</span></a> </div>
	   </div>
	</div>
    </form>     
   </div>      

    </div>
    <div class="clr"></div>
    <div class="list">
      <form name="ff" method="post" id="ff" >
		 <input type="hidden" id="FQXMC" name="FQXMC" value="${QXB.FQXMC}"/>
			  <input type="hidden" id="QXMC" name="QXMC" value="${QXB.QXMC}"/>
		    <%--   跳页分页传值   开始	  --%>
			  <input type=hidden name="pxxbt"  value="${bmxxPage.pxxbt}" />
			  <input type=hidden name="pfbksrq"  value="${bmxxPage.pfbksrq}" />
			  <input type=hidden name="pfbjsrq"  value="${bmxxPage.pfbjsrq}" />
			  <input type="hidden" name="pglfw"  value="${bmxxPage.pglfw}"/>
			  <input type="hidden" name="pckfw"  value="${bmxxPage.pckfw}" />
			  <input type="hidden" name="pfbr"  value="${bmxxPage.pfbr}"/>
			  <input type="hidden" name="pfbbm"  value="${bmxxPage.pfbbm}"/>
			  <input type="hidden" name="xxid" id="ff_xxid"/>
			 
		<!-- 查询用 -->
        <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
             <th ><input type="checkbox" id="ids" title="全选/不选"  /></th>
             <th>是否已读</th>
             <th>是否发布</th>
             <th>信息标题</th>
             <th>发布人</th>
             <th>发布部门</th>
             <th>发布时间</th>
             <th>通知对象</th>
             <th>操作</th>
          </tr>
          <c:forEach items="${list}" var="obj" varStatus="i">
            <tr <c:if test="${i.count % 2 eq '0'}">class="bgcol"</c:if>>
              <td><input name="ids" type="checkbox" value="${obj.xxid }"  /></td>
              <td><c:if test="${obj.sfyd == '0'}">
		            <img src="<%=path%>/resources/style/blue/images/close.png" title="未读"   id="img_${obj.xxid}" class="mr5"/>  
		         </c:if>
		         <c:if test="${obj.sfyd != '0'}">
		            <img src="<%=path%>/resources/style/blue/images/open.png" title="已读"  id="img_${obj.xxid}" class="mr5"/>  
		         </c:if>
		         <c:if test="${obj.sfyfj == '1'}">
			          <img src="<%=path%>/resources/style/blue/images/sfyfj.png" title="有附件"  class="mr5"/>  
		         </c:if>
		       </td>
		       <td>
	  		  	<c:if test="${obj.sffb eq '1' }">已发布</c:if>
	  		  	<c:if test="${obj.sffb ne '1' }">未发布</c:if>
	  		  </td>
		       <td>
		       	<c:if test="${obj.sfyd == '0'}">
  	   			    <a href="javascript:void(0);" onclick="javascript:ckByID('${obj.xxid}');return false;"   class="blue">${obj.xxbt}</a> 
		         </c:if>
  	   			 <c:if test="${obj.sfyd != '0'}">
  	   				 <a href="javascript:void(0);" onclick="javascript:ckByID('${obj.xxid}',this,'${obj.url}');return false;" class="blue">${obj.xxbt}</a> 
		         </c:if>
		       </td>
		       <td>${obj.fbrxm}</td>
		       <td>${obj.fbrbm}</td>
		       <td>${obj.fbsj_xs}</td>
		       <td>${empty obj.mxdxxsz ? "【类型：全部人员】" : obj.mxdxxsz}</td>
		       <td>
		       <div class="cz_button cz1_1" onclick="javascript:updateByID('${obj.xxid}');return false;" title="修改"></div>
		        <c:if test="${  obj.sffb eq '0'}">
			     	 <div class="cz_button cz3_3" onclick="javascript:fbxx('${obj.xxid}');return false;" title="发布"></div>
			     </c:if>
		       <div class="cz_button cz4_4" onclick="javascript:ckhzByID('${obj.xxid}');return false;" title="浏览记录"></div>
		       </td>
            </tr>
          </c:forEach>
        </table>
      </form>
    </div>
    <div class="youtube"> 
   	  <c:if test="${not empty bmxxPage }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="bmxxPage" onlyOneShow="true" showListNo="true" action="bmxxgl/queryAllBmxx"/>
      </c:if>
    </div>
    <div class="clr"></div>
  </div>
</div>
 
<!-- div --> 
<!-- 添加or修改 -->

<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"> </div>
</body>
</html>


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
<script type="text/javascript" src="<%=path%>/resources/js/My97DatePicker/WdatePicker.js"></script> 

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/bootstrap.js"></script>
<script type="text/javascript">	
	//多选
	$(document).ready(function(){
		$("#ff").baigoCheckall();
	});
	//查询
	function queryLike(){
	    document.queryform.action = '<%=path%>/bmxxgl/queryBmxxcx';
	    document.queryform.submit();
	}

	//查看
	function ckByID(xxid){
		 window.open('<%=path%>/bmxxgl/bmxxcxOne?flag=1&xxid='+xxid+'&random='+Math.random()*100000,"查看信息",'height=600, width=1024, top=100, left=300, titlebar=no,toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no,z-look=yes');
		 queryLike();
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
	 <div class="dropdown pull-right">
       <form name="queryform" method="post" id="queryform" >
	   <div class="btn-group">
		  <button type="button" class="btn btn-search dropdown-toggle" data-toggle="dropdown">搜索 <span class="caret"></span></button>
		  <div class="dropdown-menu search-list pull-right" role="menu" style="width:260px;">
          <table border="0" width="96%"  cellpadding="0" cellspacing="0"  >
		      <tr>
		      	<th width="100">发布人：</th>
	           	<td><input type="text" name="sfbr" id="qf_fbr" value="${bmxxcxPage.sfbr}"/></td>
		       </tr>
		       <tr>
		        <th>信息标题：</th>
	           	<td><input type="text" name="sxxbt" id="qf_xxbt" value="${bmxxcxPage.sxxbt}"/></td>
		      </tr>
		       <tr>
		        <th>发布起始时间：</th>
	           	<td><input name="skssj" id="qf_ksrq" value="${bmxxcxPage.skssj}" type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'qf_jsrq\')}'})" class="Wdate"/></td>
		      </tr>
		       <tr>
		        <th>发布结束时间：</th>
	           	<td><input name="sjssj" id="qf_jsrq" value="${bmxxcxPage.sjssj}" type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'qf_ksrq\')}'})" class="Wdate"/></td>
      		</tr>
      	</table> 
	    <div class="divider"></div>
        <div class="clr"></div>
        <div class="addlist_button pull-right mr10"> <a href="javascript:queryLike();"><span>确定</span></a> </div>
	   </div>
	</div>
    </form>     
   </div>      

    </div>
    <div class="clr"></div>
    <div class="list">
      <form name="ff" method="post" id="ff" >		
		<!-- 查询用 -->
		<input type="hidden" id="FQXMC" name="FQXMC" value="${qxb.FQXMC}"/>
	  <input type="hidden" id="QXMC" name="QXMC" value="${qxb.QXMC}"/>
    <%--   跳页分页传值   开始	  --%>
	  <input type=hidden name="pageCount1"  value="${bmxxcxPage.pageCount eq '0' ? '1' : bmxxcxPage.pageCount}" />
	  <input type=hidden name="pageNo1"  value="${bmxxcxPage.pageNo}" />
	  <input type=hidden name="pageSize1"  value="${bmxxcxPage.pageSize}" />
	  <input type=hidden name="sxxbt"  value="${bmxxcxPage.sxxbt}" />
	  <input type=hidden name="skssj"  value="${bmxxcxPage.skssj}" />
	  <input type=hidden name="sjssj"  value="${bmxxcxPage.sjssj}" />
	  <input type="hidden" name="sfbr"  value="${bmxxcxPage.sfbr}"/>
	  <input type="hidden" name="sfbbm"  value="${bmxxcxPage.sfbbm}"/>
	  <input type="hidden" name="xxid" id="dd_xxid"/>
        <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
            <th>是否已读</th>
             <th>信息标题</th>
             <th>发布人</th>
             <th>发布部门</th>
             <th>发布时间</th>
             <th>操作</th>
          </tr>
          <c:forEach items="${list}" var="obj" varStatus="i">
            <tr <c:if test="${i.count % 2 eq '0'}">class="bgcol"</c:if>>
              <td><c:if test="${obj.sfyd == '0'}">
		            <img src="<%=path%>/resources/style/blue/images/close.png" title="未读"   id="img_${obj.xxid}"  class="mr5"/>  
		         </c:if>
		         <c:if test="${obj.sfyd != '0'}">
		            <img src="<%=path%>/resources/style/blue/images/open.png" title="已读"  id="img_${obj.xxid}"  class="mr5"/>  
		         </c:if>
		         <c:if test="${obj.sfyfj == '1'}">
			          <img src="<%=path%>/resources/style/blue/images/sfyfj.png" title="有附件"   class="mr5"/>  
		         </c:if>
		       </td>
		       <td>
		       	<c:if test="${obj.sfyd == '0'}">
  	   			    <a href="javascript:void(0);" onclick="javascript:ckByID('${obj.xxid}');return false;"  class="blue">${obj.xxbt}</a> 
		         </c:if>
  	   			 <c:if test="${obj.sfyd != '0'}">
  	   				 <a href="javascript:void(0);" onclick="javascript:ckByID('${obj.xxid}');return false;"  class="blue" >${obj.xxbt}</a> 
		         </c:if>
		       </td>
		       <td>${obj.fbrxm}</td>
		       <td>${obj.fbrbm}</td>
		       <td>${obj.fbsj_xs}</td>
		       <td>
		       <div class="cz_button cz2_1" onclick="javascript:ckByID('${obj.xxid}');return false;" title="查看"></div>
		       </td>
            </tr>
          </c:forEach>
        </table>
      </form>
    </div>
    <div class="youtube"> 
   	  <c:if test="${not empty page }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="bmxxcxpage" onlyOneShow="true" showListNo="true" action="bmxxgl/queryBmxxcx"/>
      </c:if>
    </div>
    <div class="clr"></div>
  </div>
</div>
 
<!-- div --> 
<!-- 添加or修改 -->
<div id="addOrUpd" style="display:none; width: 800px;border: 8px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form name="addOrUpdfrom" id="addOrUpdfrom" method="post">
	
	<input type="hidden" id="zjdm" name="zjdm" value=""/>
	<input type="hidden" name="zt" id="zt"/><!-- 1：添加  2：修改 -->
    <div class="popup">
      <div class="Floatleft Pct100 mb10">
          <div class="popup_left">添加/修改</div>
          <a href="#" class="btn_close" onclick="javascript:BOX_remove('addOrUpd');"></a>
      </div>
      <div class="clr"></div>
      <table id="divtab" width="100%" cellpadding="0" cellspacing="0" class="addlist" style="border-collapse:collapse">
      	
      	<tr>
          <th style="width: 65px;">组件名称：</th>
          <td align="left"><input size="40" type="text" name="zjxxmc" id="zjxxmc" dataType="Limit" min="1" max="200" msg="必填(200个字之内)"/><span class="red">*</span></td>
          <th>组件类型：</th>
          <td>
	          <select id="zjlx" name="zjlx">
					<option value="iframe">iframe</option>  
					<option value="mb1">模版1</option>
					<option value="mb2">模版2</option>        
	          </select> 
          </td>          
        </tr>
        <tr>
          <th>组件宽度：</th>
          <td align="left"><input size="7" type="text" name="width" id="width" dataType="Custom" regexp="^[1-9]$|^1[0-2]$" msg = "必填数字(1-12)" /><span class="red">*</span></td>
          <th>组件高度：</th>
          <td align="left"><input size="7" type="text" name="height" id="height" dataType="Custom" regexp="^[1-9]$|^1[0-2]$" msg = "必填数字(1-12)"/><span class="red">*</span></td>          
        </tr> 

        <tr>
          <th>内链地址：</th>
          <td align="left"><input size="40" type="text" name="src" id="src" maxlength="60" dataType="Limit" min="1" max="250" msg="必填(250个字之内)"/><span class="red">*</span></td>
        	<th>更多链接地址:</th>
        	<td align="left"><input size="40" type="text" name="href" id="href" maxlength="60" dataType="Limit" max="50" msg="必填(50个字之内)" Require="false" /></td>          
        </tr>

        <tr>
        <th>模版内容：</th>
        <td align="left" colspan="4">
        	<textarea rows="10" cols="80" name="mbnr" id="mbnr"></textarea>
        </td>
        </tr>
        <tr>
        	<th>模版地址：</th>
        	<td align="left"><input size="40" type="text" name="mbdz" id="mbdz" maxlength="60" dataType="Limit" max="50" msg="必填(50个字之内)" Require="false" /></td>
        	<th>模版数据源:</th>
        	<td align="left"><input size="40" type="text" name="mbsjy" id="mbsjy" maxlength="60" dataType="Limit" max="50" msg="必填(50个字之内)" Require="false" /></td>        	
        </tr> 
        <tr>
          <td colspan="5" align="center">
            <div class="addlist_button1" style="float:right"><a href="javascript:BOX_remove('addOrUpd');" title="取消" ><span>取消</span></a> </div>
            <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:addOrUpd();" title="保存" ><span>保存</span></a></div>
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


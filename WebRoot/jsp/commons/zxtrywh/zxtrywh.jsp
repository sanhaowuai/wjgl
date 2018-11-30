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
<script type="text/javascript" src="<%=path%>/resources/js/bootstrap.js"></script>
<script type="text/javascript">	
	//多选
	$(document).ready(function(){
		$("#ff").baigoCheckall();
	});
	//查询
	function queryLike(){
	    document.queryform.action = '<%=path%>/zxtrywh/queryzxt';
	    document.queryform.submit();
	}
	
	//添加弹出层
	function addDiv(){
		$("#zt_id").val("1");
		$("#xtdm").attr("readonly",false);
		Validator.ClearForm('addOrUpdfrom');
		$("#divtab").find("input[type='text']").val('');
		$("#divtab").find("select").val('');
		$("#divtab").find("textarea").val('');		
		BOX_show('addOrUpd');
	}
	
	//修改弹出层
	function updDiv(ids){
	
		Validator.ClearForm('addOrUpdfrom');
		var url="<%=path%>/zxtrywh/queryOneZxt";
	    var param={'ids':ids};
		$("#zt").val(ids);
		$("#zt_id").val("2");
	    $.post(url,param,function(result){
	    	//zjlxTjXg_2(result.zjlx);
	        $.each(result,function(k, obj){
	            obj=obj==null? '' : obj;
	            $("input[name='"+k+"'],select[name='"+k+"'],textarea[name='"+k+"']").val(obj);
	        })
	    },'json')	 
	    
		BOX_show('addOrUpd');
		
	}
	
	//添加或修改
	function addOrUpd(){
		if(Validator.Validate(document.getElementById('addOrUpdfrom'),3)){
			//var ids = $("#zxtdm").val()+""+$("#yhdm").val();
			 
		//	var zt = $("#zt").val();
		//	var url="<%=path%>/zxtrywh/queryByZxtCount";
		  //  var param={'ids':ids,'zt':zt};
		  //  $.post(url,param,function(result){
		   //     if(result){
		        	document.addOrUpdfrom.action = '<%=path%>/zxtrywh/addOrUpdZxt';
		        	$('#addOrUpdfrom').ajaxSubmit(function(r){
		        			 if(r=="1"){
								alert("操作成功!");
								queryLike();
					    	}else{
								alert("已经为该系统加过用户!");
								queryLike();
					    	}
		        		 
		        	});
			  //  }else{
				  //  alert("此专业代码系统已存在！");
				 //   return;
				//}
		}
	}
	
	
	
	
	//删除
	function delJs(){
	    if(isCheck('ids') == false){
	        alert("请选择要删除的数据");
	        return;
	    }
	    if(confirm("您确定要删除选中的数据吗？") == true){
	        document.ff.action = '<%=path%>/zxtrywh/delZxt';
	        $('#ff').ajaxSubmit(function(r){
	    		if(r="1"){
					alert("删除成功!");
					queryLike();
		    	}else{
					alert("删除失败!");
					queryLike();
		    	}
	    	});
	    }
	}



 

		//选择
function selectyh(){
	var openUrl = '<%=path%>/zxtrywh/queryzxtYh';//弹出窗口的url
	var iHeight=600; //弹出窗口的高度;
	var iWidth=800; //弹出窗口的宽度;
	var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
	var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	window.open(openUrl,"选择用户",'height='+iHeight+', width='+iWidth+', top='+iTop+', left='+iLeft+', titlebar=no,toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no,z-look=yes');
}
//选择教师后返回的结果
function resultjsxx(id,mc) {
	$("#yhdm").val(id);//登录名
		$("#yhmc").val(mc);//登录名
	//$("#mbmc").val(mc);//教师姓名
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
            <div class="addlist_button  ml15"> <a href="javascript:delJs();"><span>删&nbsp;&nbsp;除</span></a> </div> 
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
		      	<th width="100">子系统：</th>
	           	<td>
	           	  <select  name="pzxtdm" >
	                <option value="" > -请选择-   </option> 
	             	<c:forEach items="${zxtList}" var="obj" > 
					<option value="${obj.XTDM}" <c:if test="${page.pzxtdm eq obj.XTDM}">selected="selected" </c:if> >${obj.XTMC}</option>
					</c:forEach>
		          </select> 
	           	</td>
		       </tr>
		       <tr>
		        <th>用户代码/名称：</th>
	           	<td><input type="text" name="pyhmc" value="${page.pyhmc}"/></td>
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
        <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
            <th ><input type="checkbox" id="ids" title="全选/不选" style="padding:0;margin-left:2px;*margin-left:-2px;"/></th>
            <th>系统名称</th>
            <th>系统代码</th>
            <th>用户名称</th> 
            <th>用户角色</th>
            <th width="40px">操作</th>
          </tr>
          <c:forEach items="${List}" var="map" varStatus="i">
            <tr <c:if test="${i.count % 2 eq '0'}">class="bgcol"</c:if>>
              <td>
              	<input name="ids" type="checkbox" value="${map.zxtdm}${map.yhdm}" style="padding:0;margin-left:2px;*margin-left:-2px;"/>                
              </td>
              <td>${map.xtmc}</td>
              <td>${map.zxtdm}</td>
              <td>${map.yhmc}</td>
              <td>${map.yhlxmc}</td>
              <td>
				<div class="cz_button cz1_1" title="修改" onclick="javascript:updDiv('${map.zxtdm}${map.yhdm}');"></div>               
              </td>
            </tr>
          </c:forEach>
        </table>
      </form>
    </div>
    <div class="youtube"> 
   	  <c:if test="${not empty page }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="page" onlyOneShow="true" showListNo="true" action="zxtrywh/queryzxt"/>
      </c:if>
    </div>
    <div class="clr"></div>
  </div>
</div>
 
<!-- div --> 
<!-- 添加or修改 -->
<div id="addOrUpd" style="display:none; width: 800px;border: 8px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form name="addOrUpdfrom" id="addOrUpdfrom" method="post">
	
	<input type="hidden" id="dm" name="dm" value=""/>
	<input type="hidden" name="zt" id="zt_id"/><!-- 1：添加  2：修改 -->
	<input type="hidden" name="idss" id="zt"/>
    <div class="popup">
      <div class="Floatleft Pct100 mb10">
          <div class="popup_left">添加/修改</div>
          <a href="#" class="btn_close" onclick="javascript:BOX_remove('addOrUpd');"></a>
      </div>
      <div class="clr"></div>
      <table id="divtab" width="100%" cellpadding="0" cellspacing="0" class="addlist" style="border-collapse:collapse">      	
        <tr>
          
          <th>系统代码：</th>
          <td>
	          <select id="zxtdm" name="zxtdm" dataType="Require"  msg="必选" >
					<c:forEach items="${zxtList}" var="obj" >
				<option value="${obj.XTDM}"  >${obj.XTMC}</option>
					</c:forEach>
	          </select> 
	          <span class="red">*</span>
          </td>          
        </tr> 
         <tr>
          
          <th>用户代码：</th>
          <td>
	         <input size="40" readonly="readonly" type="text"  name="yhmc" id="yhmc" dataType="Limit" min="1" max="200" msg="必填(200个字之内)" ondblclick="javaScript:selectyh();" title="双击选择用户"/><span class="red">*</span>
             <input size="40" readonly="readonly" type="hidden"  name="yhdm" id="yhdm" />
          </td>          
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


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
	    document.queryform.action = '<%=path%>/zjwh/queryZjwh';
	    document.queryform.submit();
	}
	
	//添加弹出层
	function addDiv(){		
		var qxlb=$("#pqxlb").val();
		if(qxlb == 2){
			alert("报表未开放！");
			return;
		}
		$("#zt").val("1");
		$("#qxlb").val(qxlb);
		if(qxlb == 0){
			$("#xsqxlb").val("框架组件");
		}
		if(qxlb == 1){
			$("#xsqxlb").val("平台组件");
		}		
		Validator.ClearForm('addOrUpdfrom');
		$("#divtab").find("input[type='text']").val('');
		$("#divtab").find("select").val('');
		$("#divtab").find("textarea").val('');		
		BOX_show('addOrUpd');	
	}
	
	//修改弹出层
	function updDiv(zjdm){
		$("#zt").val("2");
		Validator.ClearForm('addOrUpdfrom');
		var url="<%=path%>/zjwh/queryZjwhOne";
	    var param={'zjdm':zjdm};
	    $.post(url,param,function(result){
	    	zjlxTjXg_2(result.zjlx);
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
			
			
			if(confirm("您确定要保存吗？") == true){					
	        	document.addOrUpdfrom.action = '<%=path%>/zjwh/addOrUpdZjwh';
	        	$('#addOrUpdfrom').ajaxSubmit(function(r){
	            	if(r=="1"){
	                	alert("保存成功!");
	            		queryLike();
	                }else{
	                	alert("保存失败!");
	                	queryLike();    
                	}
        		});   
			}
		}
	}	
	
	//删除组件
	function delJs(){
	    if(isCheck('ids') == false){
	        alert("请选择要删除的组件");
	        return;
	    }
	    if(confirm("您确定要删除选中的组件吗？") == true){
	        document.ff.action = '<%=path%>/zjwh/delZjwh';
	        $('#ff').ajaxSubmit(function(r){
	    		if(r=="1"){
					alert("删除成功!");
					queryLike();
		    	}else{
					alert("删除失败!");
					queryLike();
		    	}
	    	});
	    }
	}
	function zjlxTjXg_2(cs){				
		if(cs == ""){
			$("tr[id=mbnrTr]").css('display','');
			$("tr[id=nldz]").css('display','');
			$("#src").attr('dataType','Limit');
			$("#src").attr('min','1');
			$("#src").attr('max','2000');
			$("#src").attr('msg','必填(2000个字之内)');			 
		}else if(cs=="iframe"){			
			$("tr[id=nldz]").css('display','');
			$("tr[id=mbnrTr]").css('display','none');
			$("#src").attr('dataType','Limit');
			$("#src").attr('min','1');
			$("#src").attr('max','2000');
			$("#src").attr('msg','必填(2000个字之内)');	
			$("#mbnr").val("");	
			$("#mbdz").val("");		
			$("#mbsjy").val("");				 			 
		}else if(cs=="mb1" || cs=="mb2"){
			$("#src").val("");
			$("tr[id=mbnrTr]").css('display','');
			$("tr[id=nldz]").css('display','none');
			$("#src").attr('dataType','');
			$("#src").attr('min','');
			$("#src").attr('max','');
			$("#src").attr('msg','');		 
		}		
	}	
	function zjlxTjXg(obj){		
		var cs=$(obj).val();		
		if(cs == ""){
			$("tr[id=mbnrTr]").css('display','');
			$("tr[id=nldz]").css('display','');
			$("#src").attr('dataType','Limit');
			$("#src").attr('min','1');
			$("#src").attr('max','2000');
			$("#src").attr('msg','必填(2000个字之内)');			 
		}else if(cs=="iframe"){			
			$("tr[id=nldz]").css('display','');
			$("tr[id=mbnrTr]").css('display','none');
			$("#src").attr('dataType','Limit');
			$("#src").attr('min','1');
			$("#src").attr('max','2000');
			$("#src").attr('msg','必填(2000个字之内)');	
			$("#mbnr").val("");	
			$("#mbdz").val("");		
			$("#mbsjy").val("");				 			 
		}else if(cs=="mb1" || cs=="mb2"){
			$("#src").val("");
			$("tr[id=mbnrTr]").css('display','');
			$("tr[id=nldz]").css('display','none');
			$("#src").attr('dataType','');
			$("#src").attr('min','');
			$("#src").attr('max','');
			$("#src").attr('msg','');		 
		}		
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
		      	<th width="100">权限类别：</th>
	           	<td>
	           	  <select id="pqxlb" name="pqxlb">
	           	  		<option value="">--全部--</option>
						<option value="0" <c:if test="${page.pqxlb eq '0' }">selected = 'selected'</c:if>>系统组件</option>
						<option value="1" <c:if test="${page.pqxlb eq '1' }">selected = 'selected'</c:if>>门户组件</option> 
						<option value="2" <c:if test="${page.pqxlb eq '2' }">selected = 'selected'</c:if>>报表</option>						        
			        </select>
	           	</td>
		       </tr>
		       <tr>
		        <th>组件名称：</th>
	           	<td><input type="text" name="pzjmc" value="${page.pzjmc}"/></td>
		      </tr>
<!-- 		       <tr> -->
<!-- 		        <th>发布起始时间：</th> -->
<%-- 	           	<td><input name="skssj" id="qf_ksrq" value="${bmxxcxPage.skssj}" type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'qf_jsrq\')}'})" class="Wdate"/></td> --%>
<!-- 		      </tr> -->
<!-- 		       <tr> -->
<!-- 		        <th>发布结束时间：</th> -->
<%-- 	           	<td><input name="sjssj" id="qf_jsrq" value="${bmxxcxPage.sjssj}" type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'qf_ksrq\')}'})" class="Wdate"/></td> --%>
<!--       		</tr> -->
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
            <th width="5%"><input type="checkbox" id="ids" title="全选/不选" style="padding:0;margin-left:2px;*margin-left:-2px;"/></th>
            <th >组件名称</th>
            <th>宽度</th>
            <th>高度</th>
            <th>权限类别</th>
            <th >内链地址</th> 
            <th >模板内容</th> 
            <th>模板地址</th>
            <th>模板数据源</th>
            <th>更多链接地址</th>            
            <th width="120px">操作</th>
          </tr>
          <c:forEach items="${list}" var="map" varStatus="i">
            <tr <c:if test="${i.count % 2 eq '0'}">class="bgcol"</c:if>>
              <td>
              	<input name="ids" type="checkbox" value="${map.qxdm}" style="padding:0;margin-left:2px;*margin-left:-2px;"/>                
              </td>
              <td>${map.zjxxmc}</td>
              <td>${map.width }</td>
              <td>${map.height }</td>
              <c:if test="${map.qxlb == '0' }" >
              		<td>框架组件</td>
              </c:if>
              <c:if test="${map.qxlb == '1' }" >
              		<td>平台组件</td>
              </c:if>
              <c:if test="${map.qxlb == '2' }" >
              		<td>报表</td>
              </c:if>
              <td>${map.src}</td>
              <td><div style="width:200px">${map.mbnr}</div></td>
 
              <td>${map.mbdz}</td>
              <td>${map.mbsjy}</td>
              <td>${map.href}</td>               
              <td>
				<div class="cz_button cz1_1" title="修改" onclick="javascript:updDiv('${map.qxdm}');"></div>               
              </td>
            </tr>
          </c:forEach>
        </table>
      </form>
    </div>
    <div class="youtube"> 
   	  <c:if test="${not empty page }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="page" onlyOneShow="true" showListNo="true" action="zjwh/queryZjwh"/>
      </c:if>
    </div>
    <div class="clr"></div>
  </div>
</div>
 
<!-- div --> 
<!-- 添加or修改 -->
<div id="addOrUpd" style="display:none; width: 800px;border: 8px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form name="addOrUpdfrom" id="addOrUpdfrom" method="post">
	<input type="hidden" id="qxdm" name="qxdm" value=""/>	
	<input type="hidden" id="qxlb" name="qxlb" value=""/>	
	<input type="hidden" name="zt" id="zt"/><!-- 1：添加  2：修改 -->
    <div class="popup">
      <div class="Floatleft Pct100 mb10">
          <div class="popup_left">添加/修改</div>
          <a href="#" class="btn_close" onclick="javascript:BOX_remove('addOrUpd');"></a>
      </div>
      <div class="clr"></div>
      <table id="divtab" width="100%" cellpadding="0" cellspacing="0" class="addlist" style="border-collapse:collapse">      	
      	<tr>
          <th style="width: 100px;">组件名称：</th>
          <td align="left"><input size="40" type="text" name="zjxxmc" id="zjxxmc" dataType="Limit" min="1" max="200" msg="必填(200个字之内)"/><span class="red">*</span></td>
          <th>组件类型：</th>
          <td>
	          <select id="zjlx" name="zjlx" onchange="javascript:zjlxTjXg(this);return false;" dataType="Limit" min="1" max="20" msg="必选" >
	          		<option value="">--请选择--</option>
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
		<tr id="nldz">
			<th >内链地址：</th>
         	<td align="left" colspan="4" ><input size="80" type="text" name="src" id="src" maxlength="2000" /><span class="red">*</span></td>	
		</tr>
        <tr align="left" colspan="4">          
          <th>更多链接地址:</th>
          <td align="left"  colspan="4" ><input size="80" type="text" name="href" id="href" maxlength="2000" dataType="Limit" max="2000" msg="必填(2000个字之内)" Require="false" /></td>          
        </tr>
        <tr id="mbnrTr">
        <th>模版内容：</th>
        <td align="left" colspan="4">
        	<textarea rows="4" style="width:99%" name="mbnr" id="mbnr"></textarea>
        </td>
        </tr>
        <tr id="mbnrTr">
        	<th>模版地址：</th>
        	<td align="left"><input size="30" type="text" name="mbdz" id="mbdz" maxlength="2000" dataType="Limit" max="2000" msg="必填(2000个字之内)" Require="false" /></td>
        	<th>模版数据源:</th>
        	<td align="left"><input size="30" type="text" name="mbsjy" id="mbsjy" maxlength="2000" dataType="Limit" max="2000" msg="必填(2000个字之内)" Require="false" /></td>        	
        </tr>        
        <tr>
        	<th>权限类别:</th>
        	<td colspan="5" ><input style="color:#FF0000;" id="xsqxlb" readOnly="true"/> </td>
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


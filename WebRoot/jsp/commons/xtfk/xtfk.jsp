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
	.Contentbox { width:100%; min-height:100%; height:auto}
	*html .Contentbox { height:100% }
</style>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/ckeditor4.1.2/ckeditor.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/bootstrap.js"></script>
<script type="text/javascript">
	$().ready(function(){
		//初始化全选功能
		$("#ff").baigoCheckall();
	});
	//查询
	function queryLike(){
	    document.queryform.action = '<%=path%>/xtfk/queryXtfk/1';
	    document.queryform.submit();
	}

	//添加弹出层
	function addDiv(){
		Validator.ClearForm('addOrUpdfrom');	
		$("#divtab").find("input[type='text']").val('');
		$("#divtab").find("select").val('');
		fknrIframe.setHTML("");
		clnrIframe.setHTML("");
		BOX_show('addOrUpd');
	}	
	//删除
	function delFk(){
	    if(isCheck('ids') == false){
	        alert("请选择要删除的反馈信息");
	        return;
	    }
	    if(confirm("您确定要删除选中的反馈信息吗？") == true){
	        document.ff.action = "<%=path%>/xtfk/delFk";
	        $("#ff").ajaxSubmit(function(r){
	        	queryLike();
			});
	    }
	}
	//增加反馈信息
	function addFk(){
<%--		for( instance in CKEDITOR.instances ){ CKEDITOR.instances[instance].updateElement(); }--%>
		$("#fknr").val(fknrIframe.getHTML());
		$("#clnr").val(clnrIframe.getHTML());
	 	var url="<%=path%>/xtfk/addFk/1";
	 	$("#addOrUpdfrom").ajaxSubmit({
			url: url,
			beforeSubmit: function () {},
			type:"post",
	        success: function(data) { // data 保存提交后返回的数据，一般为 json 数据
                // 此处可对 data 作相关处理
                if(data == 'success'){
                	alert("添加成功");
                	queryLike();
                }else {
                	alert("添加失败");
                }
                
            }				
		});
	}	
	function updDiv(dm){
		Validator.ClearForm('updDivfrom');	
		$("#divtab_1").find("input[type='text']").val('');
		$("#divtab_1").find("select").val('');
		var url="<%=path%>/xtfk/queryFknrByDm";
	    var param={'dm':dm};
	    $.post(url,param,function(result){
		    $("#updDivfrom_dm").val(result.dm);
		    $("#updDivfrom_fklb").val(result.fklb);
		    $("#updDivfrom_czrlxdh").html(result.czrlxdh);
		    $("#updDivfrom_sfzd").val(result.sfzd);
		    $("#updDivfrom_clbz").val(result.clbz);
		    updfknrIframe.setHTML(result.fknr == null ? "" : result.fknr);
		    updclnrIframe.setHTML(result.clnr== null ? "" : result.clnr);
<%--			CKEDITOR.instances.updDivfrom_fknr.setData(result.fknr); --%>
<%--			CKEDITOR.instances.updDivfrom_clnr.setData(result.clnr); --%>
	    });
	    BOX_show('updDiv');
	}	        	
	//增加反馈信息
	function updFk(){
<%--		for( instance in CKEDITOR.instances ){ CKEDITOR.instances[instance].updateElement(); }--%>

		$("#updDivfrom_fknr").val(updfknrIframe.getHTML());
		$("#updDivfrom_clnr").val(updclnrIframe.getHTML());
	 	var url="<%=path%>/xtfk/updFk/1";
	 	$("#updDivfrom").ajaxSubmit({
			url: url,
			beforeSubmit: function () {},
			type:"post",
	        success: function(data) { // data 保存提交后返回的数据，一般为 json 数据
                // 此处可对 data 作相关处理
                if(data == 'success'){
                	alert("修改成功");
                	queryLike();
                }else {
                	alert("修改失败");
                }
                
            }				
		});
	}

	function updSfzd(dm){
		var  sfzd = $("#sel_sfzd_"+dm).val();		
		$.ajax({
		    url: "<%=path%>/xtfk/updSfzd",
			data:{'dm':dm,'sfzd':sfzd},
			traditional: true,
			type:'post',
			success:function(msg){
				if(msg=='success'){
					alert("修改成功");
					queryLike();
				}else{
					alert("修改失败");
				}
			}
		});	
	}	
	function updClbz(dm){
		var  clbz = $("#sel_clbz_"+dm).val();		
		$.ajax({
		    url: "<%=path%>/xtfk/updClbz",
			data:{'dm':dm,'clbz':clbz},
			traditional: true,
			type:'post',
			success:function(msg){
				if(msg=='success'){
					alert("修改成功");
				}else{
					alert("修改失败");
				}
			}
		});	
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
            <div class="addlist_button"> <a href="javascript:addDiv();"><span>添加反馈</span></a> </div> 
            <div class="addlist_button  ml15"> <a href="javascript:delFk();"><span>删&nbsp;&nbsp;除</span></a> </div> 
          </td>
        </tr>
      </table>
	 <div class="dropdown pull-right">
        <form name="queryform"    method="post"    id="queryform" >
	   <div class="btn-group">
		  <button type="button" class="btn btn-search dropdown-toggle" data-toggle="dropdown">搜索 <span class="caret"></span></button>
		  <div class="dropdown-menu search-list pull-right" role="menu" style="width:300px;">
          <table border="0" width="96%"  cellpadding="0" cellspacing="0"  >
		      <tr>
		      	<th width="120">反馈类别：</th>
	           	<td>
	           	  <select name="fklb">
	            	<option value="" ${empty xtfkPage.fklb ? 'selected' : ''}>全部</option>
	            	<c:forEach items="${fklbbList}" var="map" varStatus="i">
	            		<option value="${map.DM}" ${xtfkPage.fklb eq map.DM ? 'selected' : ''}>${map.MC}</option>
	            	</c:forEach>
	              </select>
	           	</td>
		       </tr>
		       <tr>
		        <th>处理标志：</th>
	           	<td>
	           	  <select name="clbz">
	           		<option value="" ${empty xtfkPage.clbz ? 'selected' : ''}>全部</option>
	           		<option value="1" ${xtfkPage.clbz eq '1' ? 'selected' : ''}>已处理</option>
	           		<option value="0" ${xtfkPage.clbz eq '0' ? 'selected' : ''}>未处理</option>
	              </select>
	           	</td>
		      </tr>
		       <tr>
		        <th>反馈内容：</th>
	           	<td><input type="text" name="ff_fknr"  value="${xtfkPage.ff_fknr}"/></td>
		      </tr>
		       <tr>
		        <th>反馈人姓名/学工号：</th>
	           	<td><input   type="text"  name="fkr"   value="${xtfkPage.fkr}"/></td>
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
        <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
            <th><input type="checkbox" id="ids" title="全选/不选" style="padding:0;margin-left:2px;*margin-left:-2px;"/></th>
            <th>反馈类别</th>
            <th>反馈内容</th>            
            <th>反馈人</th>
            <th>反馈人电话</th>
            <th>反馈时间</th>
            <th>处理内容</th>             
            <th>处理人</th>
            <th>处理时间</th> 
            <th>处理标志</th>            
            <th>是否置顶</th>
          </tr>
          <c:forEach items="${fkList}" var="map" varStatus="i">
            <tr <c:if test="${i.count % 2 eq '0'}">class="bgcol"</c:if>>
              <td>
                <input name="ids" type="checkbox" value="${map.dm}" style="padding:0;margin-left:2px;*margin-left:-2px;"/>
              </td>
              <td>${map.xtfklbmc}</td>
              <td title="点击查看/修改详情">
			  <c:if test="${map.sfzd eq '1'}"><span class="fd_icon icon1"></span></c:if>
              <a href="javascript:updDiv('${map.dm}');"><span style="color: #307ecc;">${uf:substr(map.fknr,0,10)}</span></a> 
              </td>              
              <td>${map.czrxm}</td>
              <td>${map.czrlxdh}</td>
              <td>${map.czsj}</td>
             
              <td title="点击查看/修改详情"><a href="javascript:updDiv('${map.dm}');"><span style="color: #307ecc;">${uf:substr(map.clnr,0,10)}</span></a> </td>              
              <td>${map.clrxm}</td>
              <td>${map.clsj}</td>
              <td>
              <select name="clbz" id="sel_clbz_${map.dm}" onchange="updClbz('${map.dm}')">
           		<option value="1" ${map.clbz eq '1' ? 'selected' : ''}>已处理</option>
           		<option value="0" ${map.clbz eq '0' ? 'selected' : ''}>未处理</option>
              </select>
              </td>               
              <td>
              <select name="sfzd" id="sel_sfzd_${map.dm}" onchange="updSfzd('${map.dm}')">
           		<option value="1" ${map.sfzd eq '1' ? 'selected' : ''}>是</option>
           		<option value="0" ${map.sfzd eq '0' ? 'selected' : ''}>否</option>
              </select> 
              </td>
            </tr>
          </c:forEach>
        </table>
      </form>
  	</div>
    <div class="youtube"> 
      <c:if test="${not empty xtfkPage }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="xtfkPage" onlyOneShow="true" showListNo="true" action="xtfk/queryXtfk/1"/>
      </c:if>
    </div>
    <div class="clr"></div>
  </div>
</div>



<div id="addOrUpd" style="display:none; width: 800px;border: 6px solid #ddd;
-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;
-moz-border-radius: 10px;border-radius: 10px;" >
  <form id="addOrUpdfrom" name="addOrUpdfrom" method="post">
    <div class="popup">
      <div class="Floatleft Pct100 mb10">
        <div class="popup_left">添加反馈</div>
        <a href="#" class="btn_close" onclick="javascript:BOX_remove('addOrUpd');"></a> 
      </div>
      <div class="clr"></div>
      <div style="max-height:300px;overflow:auto;">
      <table id="divtab" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
        <tr>
            <th width=90px">反馈类别：</th>
            <td>
              <select name="fklb" id="addOrUpd_fklb">
            	<c:forEach items="${fklbbList}" var="map" varStatus="i">
            		<option value="${map.DM}" ${xtfkPage.fklb eq map.DM ? 'selected' : ''}>${map.MC}</option>
            	</c:forEach>
              </select>
            </td>
          <th>联系电话：</th>
          <td><input type="text" name="czrlxdh" id="addOrUpd_czrlxdh"/></td>          
        </tr>
        <tr>
          <th>是否置顶：</th>
          <td>
			<select name="sfzd" id="addOrUpd_sfzd">
				<option value="0" selected="selected">否</option>
				<option value="1">是</option>
			</select>		  
		  </td>
          <th>处理标志：</th>
          <td>
			<select name="clbz" id="addOrUpd_clbz">
				<option value="1" selected="selected">已处理</option>
				<option value="0">未处理</option>
			</select>		  
		  </td>		          	
        </tr> 
        <tr>
          <th>反馈内容：</th>
          <td colspan="5" style="text-align: left;">
<%--            <div>--%>
<%--              <textarea class="ckeditor" id="addOrUpd_fknr" name="fknr"></textarea>--%>
<%--              <script>--%>
<%--              	CKEDITOR.replace('addOrUpd_fknr',{toolbar : 'Basic'});--%>
<%--              </script>--%>
<%--            </div>	       --%>
              <textarea name="fknr" id="fknr" style="display:none"></textarea>
			  <iframe id="fknrIframe" name="fknrIframe" src="<%=path%>/resources/ewebeditor/ewebeditor.htm?id=fknr&style=standard650" frameborder="0" scrolling="no" width="100%" height="450"></iframe>
          </td>
        </tr> 
        <tr>
          <th>处理内容：</th>
          <td colspan="5" style="text-align: left;">
<%--            <div>--%>
<%--              <textarea class="ckeditor" id="addOrUpd_clnr" name="clnr"></textarea>--%>
<%--              <script>--%>
<%--              	CKEDITOR.replace('addOrUpd_clnr',{toolbar : 'Basic'});--%>
<%--              </script>--%>
<%--            </div>	       --%>
				<textarea name="clnr" id="clnr" style="display:none"></textarea>
			    <iframe id="clnrIframe" name="clnrIframe" src="<%=path%>/resources/ewebeditor/ewebeditor.htm?id=clnr&style=standard650" frameborder="0" scrolling="no" width="100%" height="450"></iframe>
          </td>
        </tr>               
        <tr>
          <td colspan="6" align="center"><div class="addlist_button1" style="float:right"><a href="#"  title="取消" onclick="javascript:BOX_remove('addOrUpd');" ><span>取消</span></a> </div>
          <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:addFk();" title="保存" ><span>保存</span></a> </div></td>
        </tr>
      </table>
    </div>
    <div class="clr"></div>
  </div>
</form>
</div>

<div id="updDiv" style="display:none; width: 800px;border: 6px solid #ddd;
-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;
-moz-border-radius: 10px;border-radius: 10px;" >
  <form id="updDivfrom" name="updDivfrom" method="post">
	<input type="hidden" name="dm" id="updDivfrom_dm"/>
    <div class="popup">
      <div class="Floatleft Pct100 mb10">
        <div class="popup_left">查看/修改反馈</div>
        <a href="#" class="btn_close" onclick="javascript:BOX_remove('updDiv');"></a> 
      </div>
      <div class="clr"></div>
      <div style="height:300px;overflow:auto;">
      <table id="divtab_1" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
        <tr>
            <th width="90px">反馈类别：</th>
            <td>
              <select name="fklb" id="updDivfrom_fklb">
            	<c:forEach items="${fklbbList}" var="map" varStatus="i">
            		<option value="${map.DM}" ${xtfkPage.fklb eq map.DM ? 'selected' : ''}>${map.MC}</option>
            	</c:forEach>
              </select>
            </td>
          <th width="90px">联系电话：</th>
          <td><span id="updDivfrom_czrlxdh"></span></td>          
        </tr> 
        <tr>
          <th>是否置顶：</th>
          <td>
			<select name="sfzd" id="updDivfrom_sfzd">
				<option value="0" selected="selected">否</option>
				<option value="1">是</option>
			</select>		  
		  </td>
          <th>处理标志：</th>
          <td>
			<select name="clbz" id="updDivfrom_clbz">
				<option value="1" selected="selected">已处理</option>
				<option value="0">未处理</option>
			</select>		  
		  </td>		          	
        </tr>
        <tr>
          <th>反馈内容：</th>
          <td colspan="3"  >
              <textarea name="fknr" id="updDivfrom_fknr" style="display:none"></textarea>
			  <iframe id="updfknrIframe" name="updfknrIframe" src="<%=path%>/resources/ewebeditor/ewebeditor.htm?id=updDivfrom_fknr&style=standard650" frameborder="0" scrolling="no" width="100%" height="450"></iframe>
<%--            <div>--%>
<%--              <textarea class="ckeditor" id="updDivfrom_fknr" name="fknr"></textarea>--%>
<%--              <script>--%>
<%--              	CKEDITOR.replace('updDivfrom_fknr',{toolbar : 'Basic'});--%>
<%--              </script>--%>
<%--            </div>	       --%>
          </td>
        </tr>
        <tr>
          <th>处理内容：</th>
          <td colspan="3" >
              <textarea name="clnr" id="updDivfrom_clnr" style="display:none"></textarea>
			  <iframe id="updclnrIframe" name="updclnrIframe" src="<%=path%>/resources/ewebeditor/ewebeditor.htm?id=updDivfrom_clnr&style=standard650" frameborder="0" scrolling="no" width="100%" height="450"></iframe>
          
<%--            <div>--%>
<%--              <textarea class="ckeditor" id="updDivfrom_clnr" name="clnr"></textarea>--%>
<%--              <script>--%>
<%--              	CKEDITOR.replace('updDivfrom_clnr',{toolbar : 'Basic'});--%>
<%--              </script>--%>
<%--            </div>	       --%>
          </td>
        </tr>                
        <tr>
          <td colspan="6" align="center"><div class="addlist_button1" style="float:right"><a href="#"  title="取消" onclick="javascript:BOX_remove('updDiv');" ><span>取消</span></a> </div>
          <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:updFk();" title="保存" ><span>保存</span></a> </div></td>
        </tr>
      </table>
    </div>
    <div class="clr"></div>
  </div>
</form>
</div>
<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"> </div>
</body>
</html>


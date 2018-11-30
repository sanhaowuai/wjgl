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
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jquery.min.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/bootstrap.js"></script>
<script type="text/javascript">

	$().ready(function(){
			var error =	$("#error").val();
			var flag =	$("#flag").val();
			if(error != null && error != '' && error != '[]'){
				alert(error+'，请重新上传');
			}else{
				if(flag=='1'){
					alert("导入成功");
				}
			}
		});
		
		
	function querylike(){
		document.queryform.action="<%=path%>/jxb/queryJxb";
		document.queryform.submit();
	}
	
	//添加弹出层
	function addDiv(){
		Validator.ClearForm('addOrUpdfrom');
		$("#divtab").find("input[type='text']").val('');
		$("#divtab").find("select").val('');
		BOX_show('addOrUpd');
	}
	
	//修改弹出层
	function updDiv(CMCODE){
		Validator.ClearForm('addOrUpdfrom2');	
		var url="<%=path%>/jxb/queryJxbByCMCODE";
	    var param={'CMCODE':CMCODE};
	    $.post(url,param,function(result){
	    	$("#CMCODE2").val(result.cmcode);
	    	$("#CMCLASSNAME2").val(result.cmclassname);
	    	result.cmclasspeoplenum = result.cmclasspeoplenum==null? '' : result.cmclasspeoplenum;
	    	$("#CMCLASSPEOPLENUM2").val(result.cmclasspeoplenum);
	    	$("#CMADDTIME2").val(result.cmaddtime);
	    	$("#CMWHETHERAVAILABLE2").val(result.cmwhetheravailable);
	    	$("#PINYIN2").val(result.pinyin);
	    },'json');
		BOX_show('addOrUpd2');
	}
	
	//添加
	function add(){	
		if(Validator.Validate(document.getElementById('addOrUpdfrom'),3)){
		document.addOrUpdfrom.action = '<%=path %>/jxb/addJxb';
		$("#addOrUpdfrom").ajaxSubmit(function(result){
			if(result=="1"){
			querylike();
			}else{
				alert("添加失败！！");
			}
			});
		}
	}

	//修改
	function upd(){
		if(Validator.Validate(document.getElementById('addOrUpdfrom2'),3)){
		document.addOrUpdfrom2.action = '<%=path%>/jxb/updJxb';
		$('#addOrUpdfrom2').ajaxSubmit(function(result){
        	if(result == '2'){
        		querylike(); 
        	}else {
	        	alert("修改失败！！");
        	}
		});
		}
	}

    	//导入
	function importExcel() {
	    document.addOrUpdfrom1.action = "<%=path%>/jxb/importJxbList";
	    document.addOrUpdfrom1.submit();
	}

</script>
</head>
<body>
<input type="hidden" value="${error}" id="error" />
<input type="hidden" value="${flag}" id="flag" />
<div class="Contentbox">
  <div class="address"><span class="dzxx">当前位置：实验维护  >> 教学班维护</span></div>
  <div class="clr"></div>
  <div class="butsea">
    <table  border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td height="35px">
          <div class="addlist_button ml15"> <a href="javascript:addDiv();"><span>添&nbsp;&nbsp;加</span></a> </div>
          <div class="addlist_button  ml15"> 
            <a href="<%=request.getContextPath() %>/jxb/exportExcelDemo" title="点击下载"><span>模板下载</span></a>
          </div>
          <div class="addlist_button  ml15"> <a href="javascript:void(0);" onclick="javascript:BOX_show('dr');return false;"><span>导&nbsp;&nbsp;入</span></a> </div>
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
		      	<th width="100">可用否：</th>
	           	<td>
	           	  <select name="CMWHETHERAVAILABLE" id="qf_CMWHETHERAVAILABLE" value="${jxbPage.CMWHETHERAVAILABLE}">
		              <option value="">-请选择-</option>
		              <option value="1" <c:if test="${jxbPage.CMWHETHERAVAILABLE eq '1'}">selected</c:if>>是</option>
		     		  <option value="0" <c:if test="${jxbPage.CMWHETHERAVAILABLE eq '0'}">selected</c:if>>否</option>
		            </select>
	           	</td>
		       </tr>
		       <tr>
		        <th>班级代码/名称：</th>
	           	<td><input type="text" name="keyWOrd" id="qf_CMCLASSNAME" value="${jxbPage.keyWOrd}"  /></td>
		      </tr>
      	</table> 
	    <div class="divider"></div>
        <div class="clr"></div>
        <div class="addlist_button pull-right mr10"> <a href="javascript:void(0);" onclick="javascript:querylike();return false;"><span>确定</span></a> </div>
	   </div>
	</div>
    </form>     
   </div>      
  </div>
  <div class="clr"></div>
  <div class="pd10">
  <div class="list">
    <form name="ff" method="post" id="ff" >
	  <input type="hidden" name="keyWOrd"  value="${jxbPage.keyWOrd}" />
	  <input type="hidden" name="CMWHETHERAVAILABLE" value="${jxbPage.CMWHETHERAVAILABLE}"/>
      <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
        <tr>
          <th width="15%">班级代码</th>
          <th width="20%">班级名称</th>
          <th width="15%">班级人数</th>
          <th width="25%">添加时间</th>
          <th width="15%">是否可用</th>
          <th width="20%">操作</th>
        </tr>
	    <c:forEach items="${jxbList}" var="map" varStatus="status">
       	  <tr <c:if test="${status.count % 2 eq '0'}">class="bgcol"</c:if>>
       	  
       	  <c:if test="${map.CMWHETHERAVAILABLE eq 1}">
            <td>${map.CMCODE }</td>
            <td>${map.CMCLASSNAME }</td>
            <td>${map.CMCLASSPEOPLENUM }</td>
            <td>${map.CMADDTIME}</td>
            <td>${map.CMWHETHERAVAILABLE == '1' ? '是' : '否'}</td>
            <td>
              <div class="cz_button cz1_1" title="修改" onclick="javascript:updDiv('${map.CMCODE}');return false;"></div>
            </td>
          </c:if>
          <c:if test="${map.CMWHETHERAVAILABLE eq 0}">
            <td class="red">${map.CMCODE }</td>
            <td class="red">${map.CMCLASSNAME }</td>
            <td class="red">${map.CMCLASSPEOPLENUM }</td>
            <td class="red">${map.CMADDTIME}</td>
            <td class="red">${map.CMWHETHERAVAILABLE == '1' ? '是' : '否'}</td>
            <td>
              <div class="cz_button cz1_1" title="修改" onclick="javascript:updDiv('${map.CMCODE}');return false;"></div>
            </td>
          </c:if>
           <c:if test="${map.CMWHETHERAVAILABLE eq null or map.CMWHETHERAVAILABLE eq ''}">
            <td class="blue">${map.CMCODE }</td>
            <td class="blue">${map.CMCLASSNAME }</td>
            <td class="blue">${map.CMCLASSPEOPLENUM }</td>
            <td class="blue">${map.CMADDTIME}</td>
            <td class="blue">${map.CMWHETHERAVAILABLE }</td>
            <td>
              <div class="cz_button cz1_1" title="修改" onclick="javascript:updDiv('${map.CMCODE}');return false;"></div>
            </td>
          </c:if>
          
        </tr>
      </c:forEach>
    </table>
  </form>
</div>

  <div class="youtube"> 
    <c:if test="${not empty jxbPage }">
      <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="jxbPage" onlyOneShow="true" showListNo="true" action="jxb/queryJxb"/>
    </c:if>
  </div>
  <div class="clr"></div>
  </div>
</div>

<div id="addOrUpd" style="display:none; width: 400px; -webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000; " >
  <form id="addOrUpdfrom" name="addOrUpdfrom" method="post">
	<input type="hidden" name="CMCODE"  id="CMCODE" value="${JxbEntity.CMCODE}" />
    <div class="popup_title">
      <div class="popup_left">添加</div>
      <a href="javascript:void(0);" class="btn_close" onclick="javascript:BOX_remove('addOrUpd');return false;">X</a> 
    </div>
    <div class="clr"></div>
    <div class="popup">
      <table id="divtab" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
        <tr>
          <th>班级名称：</th>
          <td align="left">
          <input name="CMCLASSNAME" type="text"  id="CMCLASSNAME" dataType="Limit"  msg="请输入正确的实验类型" min="1" max="51"/><span class="red">*</span>
          </td>
        </tr>
        <tr>
          <th>班级人数：</th>
          <td align="left">
          <input name="CMCLASSPEOPLENUM" type="text" id="CMCLASSPEOPLENUM" onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"/>
          </td>
        </tr>
        <tr>
          <th>可用否：</th>
          <td align="left">
            <select name="CMWHETHERAVAILABLE" id="CMWHETHERAVAILABLE" >
              <option value="1" selected="selected">是</option>
     		  <option value="0">否</option>
            </select>
          </td>
        </tr>
        <tr>
          <td colspan="4" align="center"><div class="addlist_button1" style="float:right"><a href="javascript:BOX_remove('addOrUpd');"><span>取消</span></a> </div>
          <div class="addlist_button1 mr15" style="float:right" onclick="javascript:add();return false;" ><a href="javascript:void(0);" title="保存" ><span>保存</span></a> </div></td>
        </tr>
      </table>
      <div class="clr"></div>
    </div>
  </form>
</div>
<div id="addOrUpd2" style="display:none; width: 400px; -webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000; " >
  <form id="addOrUpdfrom2" name="addOrUpdfrom2" method="post">
	<input type="hidden" name="CMCODE"  id="CMCODE2" value="${JxbEntity.CMCODE}" />
      <div class="popup_title">
        <div class="popup_left">修改</div>
        <a href="javascript:void(0);" class="btn_close" onclick="javascript:BOX_remove('addOrUpd2');return false;">X</a> 
      </div>
      <div class="clr"></div>
      <div class="popup">
      <table id="divtab" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
        <tr>
          <th>班级名称：</th>
          <td align="left">
          <input name="CMCLASSNAME" type="text" id="CMCLASSNAME2" dataType="Limit"  msg="请输入正确的实验类型" min="1" max="51"/><span class="red">*</span>
          </td>
        </tr>
        <tr>
          <th>班级人数：</th>
          <td align="left">
          <input name="CMCLASSPEOPLENUM" type="text" id="CMCLASSPEOPLENUM2" onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" 
          />
          </td>
        </tr>
        <tr>
          <th>可用否：</th>
          <td align="left">
            <select name="CMWHETHERAVAILABLE" id="CMWHETHERAVAILABLE2" dataType="Limit" min="1" max="20" msg="必选"><span class="red">*</span>
              <option value="1">是</option>
     		  <option value="0">否</option>
            </select>
          </td>
        </tr>
        <tr>
          <td colspan="3" align="center"><div class="addlist_button1" style="float:right"><a href="javascript:BOX_remove('addOrUpd2');"><span>取消</span></a> </div>
          <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:upd();" title="保存" ><span>保存</span></a> </div></td>
        </tr>
      </table>
      <div class="clr"></div>
    </div>
  </form>
</div>
 
 
 
<form name="addOrUpdfrom1" id="addOrUpdfrom1"  method="post" enctype="multipart/form-data" >
  <div id="dr" style=" display:none; width: 400px; -webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000; " >
       <div class="popup_title">
        <div class="popup_left">批量导入</div>
        <a href="javascript:void(0);" class="btn_close" " onclick="javascript:BOX_remove('dr');">X</a> 
      </div>   
      <div class="clr"></div>
  <div class="popup">
      <table width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
        <tr>
          <th valign="top">文本选择：</th>
          <td align="left">
            <p>
              <input type="file" name="excel" id="excel" />
            </p>
            <p>1、请按模板要求填写。<br/>
               2、Excel文件中不能存在公式。<br/>
               3、每次最多导入999行，文件大小限制在1M以内。<br/>
               4、导入速度和每次导入的数据量有关，请耐心等待。
            </p>
          </td>
        </tr>
        <tr>
          <td colspan="2" align="center">
            <div class="addlist_button1" style="float:right"> <a href="javascript:void(0);"  title="取消" onclick="javascript:BOX_remove('dr');return false;" ><span>取消</span></a> </div>
            <div class="addlist_button1 mr15" style="float:right" > <a href="javascript:void(0);" onclick="javascript:importExcel();return false;" title="保存" ><span>保存</span></a> </div></td>
        </tr>
      </table>
      <div class="clr"></div>
    </div>
  </div> 
</form>  
   
   
<div id="setting"></div>
</body>
</html>


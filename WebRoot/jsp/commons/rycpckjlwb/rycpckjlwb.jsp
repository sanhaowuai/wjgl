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
	//查询
	function queryLike(){
	    document.queryform.action = '<%=path%>/rycpckjlwb/queryRycpckjlwb';
	    document.queryform.submit();
	}
	
	//添加弹出层
	function addDiv(){	
		//$("#zt").val("1");
		Validator.ClearForm('addOrUpdfrom');
		$("#divtab").find("input[type='text']").val('');
		$("#divtab").find("select").val('');
		$("#divtab").find("textarea").val('');		
		BOX_show('addOrUpd');	
	}
	
	//修改弹出层
	function updDiv(yhdm,yylx){
		//$("#zt").val("2");
		Validator.ClearForm('updateform');
		var url="<%=path%>/rycpckjlwb/queryRycpckjlwbOne";
	    var param={'yhdm':yhdm,'yylx':yylx};
	    $.post(url,param,function(result){	    	
	        $.each(result,function(k, obj){
	            obj=obj==null? '' : obj;
	            $("input[name='"+k+"'],select[name='"+k+"'],textarea[name='"+k+"']").val(obj);
	        })
	    },'json')	 
	    $("#upd_yylx").attr("disabled",true);
		BOX_show('update');
	}
	

	
	//添加或修改
	function addOrUpd(bs){
		if(Validator.Validate(document.getElementById('addOrUpdfrom'),3)){
			if(confirm("您确定要保存吗？") == true){	
				if(bs == '1'){			
		        	document.addOrUpdfrom.action = '<%=path%>/rycpckjlwb/addorupdRycpckjlwb';
		        	$('#addOrUpdfrom').ajaxSubmit(function(r){
		            	if(r=="1"){
		                	alert("保存成功!");
		            		queryLike();
		                }else if(r=="2"){
		                	alert("保存失败!");
		                	queryLike();    
	                	}else if(r=="3"){
							alert("用户在应用类型下已存在!");
							queryLike();    
	                    }
	        		});
				}else{
					document.updateform.action = '<%=path%>/rycpckjlwb/addorupdRycpckjlwb';
					 $("#upd_yylx").attr("disabled",false);
		        	$('#updateform').ajaxSubmit(function(r){
		            	if(r=="1"){
		                	alert("保存成功!");
		            		queryLike();
		                }else if(r=="2"){
		                	alert("保存失败!");
		                	queryLike();    
	                	}else if(r=="3"){
							alert("用户在应用类型下已存在!");
							queryLike();    
	                    }
	        		});
				}
        		   
			}
		}
	}	
	
	//删除
	function delJs(yhdm,yylx){	    
	    if(confirm("您确定要删除选中的人员磁盘空间例外表吗？") == true){
	        document.ff.action = '<%=path%>/rycpckjlwb/delRycpckjlwb';
	        $("#delyhdm").val(yhdm);
	        $("#delyylx").val(yylx);
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

	//选择用户
	function xzyh(){
	    $("#iframename").attr("src", "<%=path%>/rycpckjlwb/queryXtryxz");
	    BOX_show1("sel");
	}
	function closeSel(){
		BOX_remove1('sel');
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
		      	<th width="80">应用类型：</th>
	           	<td>
	           	   <select id="pyylx" name="pyylx">
						<option value="">--请选择--</option>
						<option value="1" <c:if test="${page.pyylx eq '1' }">selected = 'selected'</c:if>>邮箱</option> 
						<option value="2" <c:if test="${page.pyylx eq '2' }">selected = 'selected'</c:if>>文件中心</option>						        
			        </select>
	           	</td>
		       </tr>
		       <tr>
		        <th>用户代码 /<br/>用户姓名：</th>
	           	<td><input type="text" name="pyhdm" value="${page.pyhdm}"/></td>
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
     		<input type="hidden" id="delyhdm" name="yhdm" value=""/>
            <input type="hidden" id="delyylx" name="yylx" value=""/>
      </form>	
		<!-- 查询用 -->
        <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
            <th>用户姓名</th>
            <th>存储空间</th>
            <th>应用类型</th>
            <th>备注</th>                        
            <th width="100px">操作</th>
          </tr>
          <c:forEach items="${list}" var="map" varStatus="i">
            <tr <c:if test="${i.count % 2 eq '0'}">class="bgcol"</c:if>>
			  <td>${map.xm}</td>
              <td>${map.cckj }kb</td>
			  <td>
	              <c:if test="${map.yylx eq '1'}">
              			邮箱
              	  </c:if>
	              <c:if test="${map.yylx eq '2'}">
	              		文件中心
	              </c:if>	              
			  </td>			  
              <td>${map.bz}</td>             
              <td>
				<div class="cz_button cz1_1" title="修改" onclick="javascript:updDiv('${map.yhdm}','${map.yylx}');"></div>
				<div class="cz_button cz1_2" title="删除" onclick="javascript:delJs('${map.yhdm}','${map.yylx}');"></div>               
              </td>
            </tr>            
          </c:forEach>
        </table>
      
    </div>
    <div class="youtube"> 
   	  <c:if test="${not empty page }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="page" onlyOneShow="true" showListNo="true" action="rycpckjlwb/queryRycpckjlwb"/>
      </c:if>
    </div>
    <div class="clr"></div>
  </div>
</div>
 
<!-- div --> 
<!-- 添加or修改 -->
<div id="addOrUpd" style="display:none; width: 470px;border: 8px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form name="addOrUpdfrom" id="addOrUpdfrom" method="post">
	<input type="hidden" name="zt" id="zt" value="1"/><!-- 1：添加  2：修改 -->
    <div class="popup">
      <div class="Floatleft Pct100 mb10">
          <div class="popup_left">修改</div>
          <a href="#" class="btn_close" onclick="javascript:BOX_remove('addOrUpd');"></a>
      </div>
      <div class="clr"></div>
      <table id="divtab" width="100%" cellpadding="0" cellspacing="0" class="addlist" style="border-collapse:collapse">      	
      	<tr>
          <th width="150">用户姓名：</th>
          <td align="left">
          <span id="yhxm" class="Floatleft"></span>
          <input size="40" type="hidden" name="yhdm" id="yhdm" dataType="Limit" min="1" max="200" msg="必填(200个字之内)"/><span class="red">*</span>
          <button  class="btn btn-success" type="button" onclick="javascript:xzyh();" value="选择" style="padding: 4px 12px !important;">选择</button>
          </td>
       </tr>
       <tr>
          <th>存储空间[单位:kb]：</th>
          <td> 
	          <input size="7" type="text" name="cckj" id="cckj" dataType="Number" msg="必填数字" /><span class="red">*</span>
          </td>          
        </tr>
        <tr>
          <th>应用类型:</th>
          <td align="left">
          	  <select id="yylx" name="yylx" dataType="Limit" min="1" max="20" msg="必选" >
	          		<option value="">--请选择--</option>
					<option value="1">邮箱</option> 
					<option value="2">文件中心</option>
	          </select> 
	      </td>
	     </tr>
       	<tr>
          <th>备注：</th>
          <td align="left"><input size="7" type="text" name="bz" id="bz" /></td>          
        </tr> 		     
        <tr>
          <td colspan="5" align="center">
            <div class="addlist_button1" style="float:right"><a href="javascript:BOX_remove('addOrUpd');" title="取消" ><span>取消</span></a> </div>
            <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:addOrUpd('1');" title="保存" ><span>保存</span></a></div>
          </td>
        </tr>
        
      </table>
      <div class="clr"></div>
    </div>
  </form>
</div>

<!-- 修改 -->
<div id="update" style="display:none; width: 470px;border: 8px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form name="updateform" id="updateform" method="post">
	<input type="hidden" name="zt" id="upd_zt" value="2"/><!-- 1：添加  2：修改 -->
    <div class="popup">
      <div class="Floatleft Pct100 mb10">
          <div class="popup_left">修改</div>
          <a href="#" class="btn_close" onclick="javascript:BOX_remove('update');"></a>
      </div>
      <div class="clr"></div>
      <table id="divtab" width="100%" cellpadding="0" cellspacing="0" class="addlist" style="border-collapse:collapse">      	
      	<tr>
          <th width="150">用户姓名：</th>
          <td align="left">
          <input type="text" name="xm" id="xm" readOnly="true"/>
          <input size="40" type="hidden" name="yhdm" id="upd_yhdm" dataType="Limit" min="1" max="200" msg="必填(200个字之内)"/>          
          </td>
       </tr>
       <tr>
          <th>存储空间[单位:kb]：</th>
          <td>
	          <input size="7" type="text" name="cckj" id="upd_cckj" dataType="Number" msg="必填数字" /><span class="red">*</span>
          </td>          
        </tr>
        <tr>
          <th>应用类型:</th>
          <td align="left">
          	  <select id="upd_yylx" name="yylx" dataType="Limit" min="1" max="20" msg="必选" >
	          		<option value="">--请选择--</option>
					<option value="1">邮箱</option> 
					<option value="2">文件中心</option>
	          </select> 
	      </td>
	     </tr>
       	<tr>
          <th>备注：</th>
          <td align="left"><input size="7" type="text" name="bz" id="upd_bz" /></td>          
        </tr> 		     
        <tr>
          <td colspan="5" align="center">
            <div class="addlist_button1" style="float:right"><a href="javascript:BOX_remove('update');" title="取消" ><span>取消</span></a> </div>
            <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:addOrUpd('2');" title="保存" ><span>保存</span></a></div>
          </td>
        </tr>
        
      </table>
      <div class="clr"></div>
    </div>
  </form>
</div>


<div id="sel" style=" display:none; width: 800px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <div class="popup">
    <div class="Floatleft Pct100 mb10">
      <div class="popup_left">选择用户</div>
      <a href="#" class="btn_close" onclick="javascript:BOX_remove1('sel');"></a> 
    </div>
    <div class="clr"></div>
        <iframe id="iframename" name="iframename" src="" border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%; height: 400px;" frameborder="0" allowTransparency="true"></iframe>
  </div>
</div>
<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"> </div>
</body>
</html>


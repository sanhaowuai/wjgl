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
<script type="text/javascript">
	$(document).ready(function(){
	   $("#ff").baigoCheckall();
	});
	//查询
	function queryLike(){
	    document.ff.action = '<%=path%>/xxtc/queryXxtc';
		  document.ff.submit();
	}
	
	//添加弹出层
	function addDiv(){
		$("#zt").val("1");
		xxnrIframe.setHTML("");
		Validator.ClearForm('addOrUpdfrom');
		$("#divtab").find("input[type='text']").val('');
		$("#divtab").find("select").val('');
		$("#divtab").find("textarea").val('');
		$("#id_add").attr("disabled",false);
	//	$("#btn_id").attr("disabled",false);
	//	$("#inco_add").attr("disabled",false);
	       		 $("#fwlj_add").attr("disabled",false);
	        	 $("#ms_add").attr("disabled",false);
	          	 $("#tcfs_add").attr("disabled",false);
	          	 $("#sfyd_add").attr("disabled",false);
	          	 $("#sfsd_add").attr("disabled",false);
	             $("#nww_add").attr("disabled",false);
	             $("#kyf_add").attr("disabled",false);
	              $("#sfwzms_add").attr("disabled",false);
	             $("#wzmsnr_add").attr("disabled",false);
		BOX_show('addOrUpd');
	}
	
	//修改弹出层
	function updDiv(Xxtcdm){
				// $("#inco_add").attr("disabled",false);
	       		 $("#fwlj_add").attr("disabled",false);
	        	 $("#ms_add").attr("disabled",false);
	          	 $("#tcfs_add").attr("disabled",false);
	          	 $("#sfyd_add").attr("disabled",false);
	          	 $("#sfsd_add").attr("disabled",false);
	             $("#nww_add").attr("disabled",false);
	             $("#kyf_add").attr("disabled",false);
	            // $("#btn_id").attr("disabled",false);
	             $("#wzmsnr_add").attr("disabled",false);
	             $("#sfwzms_add").attr("disabled",false);
	             $("#div_addclass").removeClass();
		$("#zt").val("2");
		Validator.ClearForm('addOrUpdfrom');
		var url="<%=path%>/xxtc/queryOneXxtc";
	    var param={'Xxtcdm':Xxtcdm};
	    $.post(url,param,function(result){
	        $.each(result,function(k, obj){
	            obj=obj==null? '' : obj;
	            $("input[name='"+k+"'],select[name='"+k+"']").val(obj);
	              $("textarea[name='"+k+"']").val(obj);
	            
	            if(k=='wzmsnr')
	            {
	            xxnrIframe.setHTML(obj);
	            }
		            if(k=='sfsd')
		            {
			            if(obj=='1')
			            {
				            // $("#inco_add").attr("disabled",true);
				       		 $("#fwlj_add").attr("disabled",true);
				        	 $("#ms_add").attr("disabled",true);
				          	 $("#tcfs_add").attr("disabled",true);
				          	 $("#sfyd_add").attr("disabled",true);
				          	 $("#sfsd_add").attr("disabled",true);
				             $("#nww_add").attr("disabled",true);
				             $("#kyf_add").attr("disabled",true);
				            // $("#btn_id").attr("disabled",true);
				             $("#sfwzms_add").attr("disabled",true);
				             $("#wzmsnr_add").attr("disabled",true);
			            }
		            }
		            
		            if(k=='icon')
		            {
		            	$("#div_addclass").removeClass();
		            	$("#div_addclass").addClass(obj);
		            }
		            if(k=='sfwzms'){
						 if(obj=='1'){
						$("#wzmsnr_add").attr("disabled",false);
						}
						else{
						$("#wzmsnr_add").attr("disabled",true);
						}
					}
					 
	        })
	    },'json')
	    $("#id_add").attr("disabled",true);
		BOX_show('addOrUpd');
	}
	
		//添加或修改
	function addOrUpd(){
	 			$("#div_addclass").removeClass();
	       		 $("#fwlj_add").attr("disabled",false);
	        	 $("#ms_add").attr("disabled",false);
	          	 $("#tcfs_add").attr("disabled",false);
	          	 $("#sfyd_add").attr("disabled",false);
	          	 $("#sfsd_add").attr("disabled",false);
	             $("#nww_add").attr("disabled",false);
	             $("#kyf_add").attr("disabled",false);
	            // $("#btn_id").attr("disabled",false);
	              $("#id_add").attr("disabled",false);
	                $("#wzmsnr_add").attr("disabled",false);
	                  $("#sfwzms_add").attr("disabled",false);
	               var sfwz=   $("#sfwzms_add").val();
	                  if(sfwz=='1'){
	                    var nr=$("#wzmsnr_add").val();
		                    if(nr==''){
		                    alert("请填写文字描述");
		                    return;
		                    }
	                  }else{
	                  var fwlj=$("#fwlj_add").val();
	                	  if(fwlj==''){
		                    alert("请填写访问路径");
		                    return;
		                    }
	                  }
	                  	$("#wzmsnr").val(xxnrIframe.getHTML());
		if(Validator.Validate(document.getElementById('addOrUpdfrom'),3)){
		
			 document.addOrUpdfrom.action = "<%=path%>/xxtc/addOrUpdXxtc";
	        $('#addOrUpdfrom').ajaxSubmit(function(r){
	    	       if(r=="1")
	            {
		            alert("操作成功!");
		          queryLike();
	            }else{
	          	  alert("代码重复,请重新填写!");
	            }
	    	});
		}
	}
	
	
	
	
	//删除角色
	function delJs(){
	    if(isCheck('ids') == false){
	        alert("请选择要删除的记录");
	        return;
	    }
	    if(confirm("您确定要删除选中的记录吗？") == true){
	        document.ff.action = "<%=path%>/xxtc/delXxtc";
	        $('#ff').ajaxSubmit(function(r){
	    	       if(r=="1")
	            {
		            alert("删除成功!");
		              queryLike();
	            }else{
	          	  alert("删除失败!");
	            }
	    	});
	    }
	}
	
	
function queryIcon(){
	var openUrl = '<%=path%>/jsp/commons/bootstrapdemo/Fontawesome.jsp';//弹出窗口的url
	var iHeight=550; //弹出窗口的高度;
	var iWidth=900; //弹出窗口的宽度;
	var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
	var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	window.open(openUrl,"选择按钮",'height='+iHeight+', width='+iWidth+', top='+iTop+', left='+iLeft+', titlebar=no,toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no,z-look=yes');
}
function queryLj(){
	var openUrl = '<%=path%>/xxtc/queryAllWj';//弹出窗口的url
	var iHeight=550; //弹出窗口的高度;
	var iWidth=900; //弹出窗口的宽度;
	var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
	var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	window.open(openUrl,"选择按钮",'height='+iHeight+', width='+iWidth+', top='+iTop+', left='+iLeft+', titlebar=no,toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no,z-look=yes');
}
//选择教师后返回的结果
function resultIcon(type) {

	$("#inco_add").val(type); 
	$("#div_addclass").removeClass();
	$("#div_addclass").addClass(type);
}
function resultLj(type){
$("#fwlj_add").val(type); 
}

//是否文字描述
function sfwjms()
{
var sfwzms_add=$("#sfwzms_add").val();
	if(sfwzms_add=='1'){
	$("#wzmsnr_add").attr("disabled",false);
	}
	else{
	$("#wzmsnr_add").attr("disabled",true);
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
            <div class="addlist_button"> <a href="javascript:addDiv();"  ><span>添&nbsp;&nbsp;加</span></a> </div>
            <div class="addlist_button  ml15"> <a href="javascript:delJs();"><span>删&nbsp;&nbsp;除</span></a> </div> 
          </td>
        </tr>
      </table>
    </div>
    <div class="clr"></div>
    <div class="list">
      <form name="ff" method="post" id="ff" >
<!--   		<input type="hidden" name="pageCount"  value="${page.pageCount}" />-->
<!--		<input type="hidden" name="pageNo"  value="${page.pageNo}" />-->
<!--		<input type="hidden" name="pageSize"  value="${page.pageSize}" />-->
		<!-- 查询用 -->
        <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
            <th><input type="checkbox" id="ids"  title="全选/不选" style="padding:0;margin-left:2px;*margin-left:-2px;"/></th>
            <th>代码</th>
            <th>是否阅读</th> 
            <th>弹出方式</th>
            <th>描述</th>
            <th>显示顺序</th>
<!--            <th>是否锁定</th>-->
            <th>是否可用</th>
            <th>内外网</th>
            <th>inco(图标)</th> 
            <th>访问路径</th>
            <th>是否文字描述</th>
            <th>操作</th>
          </tr>
          <c:forEach items="${list}" var="map" varStatus="i">
            <tr <c:if test="${i.count % 2 eq '0'}">class="bgcol"</c:if>>
              <td>
              <c:if test="${map.sfsd eq '1'}">
               <div class="lock"></div>
              </c:if>
              <c:if test="${map.sfsd ne '1'}">
               <input name="ids" type="checkbox" value="${map.id}" style="padding:0;margin-left:2px;*margin-left:-2px;"/>
              </c:if>
              </td> 
              <td>${map.id}</td>
              <td> 
              <c:if test="${map.sfyd eq '1'}">是</c:if>
              <c:if test="${map.sfyd eq '0'}">否</c:if>
              </td>
              <td>${map.tcfs}</td> 
              <td>${map.ms}</td>
              <td>${map.xssx}</td>
<!--              <td>-->
<!-- 				<c:if test="${map.sfsd eq '1'}">是</c:if>-->
<!--                <c:if test="${map.sfsd eq '0'}">否</c:if>-->
<!--			  </td>-->
              <td>
 				<c:if test="${map.kyf eq '1'}">是</c:if>
                <c:if test="${map.kyf eq '0'}">否</c:if>
			  </td>
              <td>
 				<c:if test="${map.nww eq '1'}">内网</c:if>
                <c:if test="${map.nww eq '0'}">外网</c:if>
              </td>
              <td><div class=" ${map.icon} FONT14" ></div> ${map.icon}</td> 
              <td>${map.fwlj}</td> 
               <td>
 				<c:if test="${map.sfwzms eq '1'}">是</c:if>
                <c:if test="${map.sfwzms eq '0'}">否</c:if>
              </td>
              <td>
				<div class="cz_button cz1_1" title="修改" onclick="javascript:updDiv('${map.id}','${map.sfsd}');"></div>               
              </td>
            </tr>
          </c:forEach>
        </table>
      </form>
    </div>
    <div class="youtube"> 
   	  <c:if test="${not empty page }">
        <ff:page mhFrom="ff" showReSize="true" listPageCount="5" field="page" onlyOneShow="true" showListNo="true" action="xxtc/queryXxtc"/>
      </c:if>
    </div>
    <div class="clr"></div>
  </div>
</div>
 
<!-- div --> 
<!-- 添加or修改 -->
<div id="addOrUpd" style="display:none; width: 850px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form name="addOrUpdfrom" id="addOrUpdfrom" method="post">
	<input type="hidden" name="zt" id="zt"/><!-- 1：添加  2：修改 -->
    <div class="popup">
      <div class="Floatleft Pct100 mb10">
          <div class="popup_left">添加/修改</div>
          <a href="javaScript:void(0)" class="btn_close" onclick="javascript:BOX_remove('addOrUpd');"></a>
      </div>
      <div class="clr"></div>
      <div style="width:100%; height:350px; overflow:auto">
      <table id="divtab" width="100%" cellpadding="0" cellspacing="0" class="addlist" style="border-collapse:collapse">
      	<tr>
          <th style="width:120px">代码：</th>
          <td   align="left"><input type="text" name="id" id="id_add" dataType="Number" maxlength="10" msg="必填数字(200字之内)"/><span class="red">*</span></td>
          <th style="width:120px">显示顺序：</th>
          <td align="left"><input type="text" name="xssx" id="xssx_add"    dataType="Number" msg="必填数字" maxlength="10"/><span class="red">*</span></td>
        </tr>
            <tr>
          <th>ICON（图标）：</th>
          <td align="left">
           <div id="div_addclass"></div>
            <input type="text" name="icon" id="inco_add" dataType="Limit" min="1" max="50" msg="50个字之内"   readonly="readonly" style="width:170px !important;"/>
            <button type="button" class="btn btn-success" id="btn_id" onclick="javaScript:queryIcon();" value="选择" style="padding: 4px 12px !important;">选择</button>
          </td>
        <th>访问路径：</th>
          <td align="left"><input type="text" name="fwlj" id="fwlj_add" dataType="Limit" min="0" max="200" msg="200个字之内" style="width:170px !important;"/> 
          <button type="button" class="btn btn-success" id="btnLj_id" onclick="javaScript:queryLj();" value="选择" style="padding: 4px 12px !important;">选择</button>
          </td>
        </tr>
         <tr>
          <th>描述：</th>
          <td align="left"><input type="text" name="ms" id="ms_add" dataType="Limit" min="1" max="100" msg="100个字之内"/><span class="red">*</span></td>
         <th>弹出方式：</th>
            <td>
            <select name="tcfs" id="tcfs_add"  dataType="Limit" min="1" max="20" msg="必选">
<!--     		  <option value="" >--请选择--</option>-->
              <option value="_div" >_div</option>
     		  <option value="_self" >_self</option>
     		  <option value="_blank" >_blank</option>
     		  <option value="_parent" >_parent</option>
     		   <option value="_top" >_top</option>
     		    <option value="_tab" >_tab</option>
            </select>
            <span class="red">*</span>
            </td>
        </tr>
        
        <tr>
          <th>是否阅读：</th>
          <td align="left">
          
          
           <select name="sfyd" id="sfyd_add"  dataType="Limit" min="1" max="20" msg="必选">
<!--     		  <option value="" >--请选择--</option>-->
              <option value="1" >是</option>
     		  <option value="0" >否</option>
            </select>
          
		 <span class="red">*</span>
		</td>
			 
            
            
            <th>内外网：</th>
            <td>
            <select name="nww" id="nww_add"  dataType="Limit" min="1" max="20" msg="必选">
<!--     		  <option value="" >--请选择--</option>-->
              <option value="1" >内网</option>
     		  <option value="0" >外网</option>
            </select>
          <span class="red">*</span>
            </td>      
        </tr>
         
         <tr>
           <th>可用否：</th>
            <td  >
       			   <select name="kyf" id="kyf_add"  dataType="Limit" min="1" max="20" msg="必选">
<!--     		  <option value="" >--请选择--</option>-->
              <option value="1" >可用</option>
     		  <option value="0" >不可用</option>
            </select>
          <span class="red">*</span>
            </td>         
             <th>是否文字描述：</th>
            <td  >
       			   <select name="sfwzms" id="sfwzms_add"  dataType="Limit" min="1" max="20" msg="必选" onchange="javaScript:sfwjms();">
<!--     		  <option value="" >--请选择--</option>-->
 			  <option value="0" >否</option>
              <option value="1" >是</option>
            </select>
          <span class="red">*</span>
            </td>   
         </tr> 
          <tr>
           <th>文字描述内容：</th>
            <td colspan="3">
            <textarea rows="5" cols="100" id="wzmsnr" name="wzmsnr" style="display:none"></textarea> 
            <iframe id="xxnrIframe" name="xxnrIframe" src="<%=path%>/resources/ewebeditor/ewebeditor.htm?id=wzmsnr&style=standard650" frameborder="0" scrolling="no" width="100%" height="200"></iframe>
            </td>         
         </tr> 
        <tr>
          <td colspan="4" align="center">
            <div class="addlist_button1" style="float:right"><a href="javascript:BOX_remove('addOrUpd');" title="取消" ><span>取消</span></a> </div>
            <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:addOrUpd();" title="保存" ><span>保存</span></a></div>
          </td>
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


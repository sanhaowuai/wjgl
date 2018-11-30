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
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/bootstrap.js"></script>
<script type="text/javascript">
	
	
	function querylike(){
		document.queryform.action="<%=path%>/gzlgwgl/queryRygwgl";
		document.queryform.submit();
	}
	
	//添加弹出层
	function addDiv(){
		$("#zt").val("1");	
		$("#xm_tj").attr("ondblclick","javascript:selectKcForwb();");
		$("#xm_tj").attr("title","双击选择课程");
		Validator.ClearForm('addOrUpdfrom');
		$("#divtab").find("input[type='text']").val('');
		$("#divtab").find("select").val('');
// 		$("#zgh").attr("readonly",false);
// 		  document.getElementById("bszplj_id").src="";
		BOX_show('addOrUpd');
// 		$('#myModal_execute').modal('show');
		
	}
	//修改菜单权限弹出
	function updDiv(rygwdm){
		$("#zt").val("2");	 
// 		alert(rygwdm);
		$("#rygwdm_ssss").val(rygwdm);
		$("#xm_tj").removeAttr("ondblclick");
		$("#xm_tj").removeAttr("title");
		  
		
		var url = "<%=path%>/gzlgwgl/queryRygwdm";
		var zhi = {'rygwdm':rygwdm};
		$.post(url,zhi,function(result){		
			
			     if (result != null) {
                        $.each(result, function (k, obj) {
                            obj = obj == null ? '' : obj;
                            $("input[id='" + k + "_tj"+"'],select[id='" + k +"_tj"+"']").val(obj);                        

                        });
                    }
		})
		BOX_show('addOrUpd');
	}

	
	//删除学生
	function delJs(){
	    if(isCheck('ids') == false){
	        alert("请选择要删除的人员");
	        return;
	    }
	    if(confirm("您确定要删除选中的人员吗？") == true){
	        document.ff.action = "<%=path%>/gzlgwgl/delRy";
	        $('#ff').ajaxSubmit(function(r){
	        	if(r == null || r == ""){
					alert("删除成功！");
					querylike();
				}else {
					alert("删除失败！");
					querylike();
				}
	        });
	    }
	}
	//添加或修改
	function addOrUpd(){	
		var i = $("#zt").val();
		
		if(i==1){
			if(Validator.Validate(document.getElementById('addOrUpdfrom'),3)){
				
				document.addOrUpdfrom.action = "<%=path%>/gzlgwgl/queryRyyz";
				$("#addOrUpdfrom").ajaxSubmit(function(s){
					if(s==0){
						document.addOrUpdfrom.action = "<%=path%>/gzlgwgl/addRygwgl";
						$("#addOrUpdfrom").ajaxSubmit(function(result){
							if(result=="0"){
								alert("添加成功！");
								querylike();
							}else{
								alert("添加失败！");
								querylike();
							}
							
							
						});
					}else{
						alert("该人员已存在该岗位！");
						
					}
					
					
				});
				
				
	 		
			}
		}else{
			if(Validator.Validate(document.getElementById('addOrUpdfrom'),3)){
				
				document.addOrUpdfrom.action="<%=path%>/gzlgwgl/queryRyyz";
				$("#addOrUpdfrom").ajaxSubmit(function(s){
					if(s==0){
						document.addOrUpdfrom.action="<%=path%>/gzlgwgl/updRycd";
						$("#addOrUpdfrom").ajaxSubmit(function(r){
							if(r == null || r == ""){
								alert("修改成功！");
								querylike();
							}else {
								alert("修改失败！");
								querylike();
							}

						});
					}else{
						alert("该人员已存在该岗位！");
					}
					

				});
				
				
	 		
			}
		}
		
		
	}
	




$(document).ready(function(){
	
	
		var app="";
		var gwdm=$('#gwdm_f').val();
		var url = "<%=path%>/gzlgwgl/queryGwmcry";
		$.post(url,function(result){
			app+="<option value=''>请选择</option>";
			$.each(result,function(key,value){
				if(value.sjgwdm=='-1'){
					if(value.gwdm==gwdm){
					app+="<option value='"+value.gwdm+"' selected >"+value.gwmc+"</option>";
					}else{
					app+="<option value='"+value.gwdm+"'>"+value.gwmc+"</option>";
					}
				}else{
					var ss="";
					for(var i=0;value.sjgwdm.length>i;i++ ){
						 ss= ss+"&nbsp;&nbsp;";
					}	
					if(value.gwdm==gwdm){
					app+="<option value='"+value.gwdm+"' selected >"+ss+value.gwmc+"</option>";
						}else{
					app+="<option value='"+value.gwdm+"'>"+ss+value.gwmc+"</option>";
					}
				}
							
					
			})
			$("#gwdm").append(app);
			$("#gwdm_tj").append(app);
			
		})
		$("#ff").baigoCheckall();
        
	});
	
// 取消
function onClear() {
    BOX_remove1('xzkcDiv');
}


// 选择课程
function selectKcForwb() {
	
    Validator.ClearForm('xzkcform');
    $("#divtab").find("input[type='text']").val('');
    $("#divtab").find("select").val('');
    var src = "<%=request.getContextPath()%>/gzlgwgl/queryRyxz";
    $("#xzkclist").attr("src", src);

    $("#_save").attr("href","javascript:saveForwb();");

    BOX_show1('xzkcDiv');
}
function addYh(yhdm,xm) {
	$("#yhdm_tj").val(yhdm);
	$("#xm_tj").val(xm);
	BOX_remove('xzkcDiv');
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
       <form id="queryform" name="queryform" method="post">
	   <div class="btn-group">
		  <button type="button" class="btn btn-search dropdown-toggle" data-toggle="dropdown">搜索 <span class="caret"></span></button>
		  <div class="dropdown-menu search-list pull-right" role="menu" style="width:260px;">
          <table border="0" width="96%"  cellpadding="0" cellspacing="0"  >
		           <tr>
		        <th>岗位：</th>
	           	<td>
	           	  <select name="gwdm" id="gwdm" class="se150">
	    		  </select>
	           	</td>
		      </tr>
		       <tr>
		        <th>职工号/姓名：</th>
	           	<td><input type="text" name="xh" id="xh" value="${page.xh}"  /></td>
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
    <div class="list">
      <form name="ff" method="post" id="ff" >
		<input type="hidden" name="gwdm" id="gwdm_f" value="${page.gwdm}" />
        <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
            <th><input type="checkbox" id="ids" title="全选/不选" style="padding:0;margin-left:2px;*margin-left:-2px;"/></th>
           <th>用户代码</th>
             <th>用户名称</th>
             <th>岗位代码</th>
             <th>岗位名称</th>      
            <th width="90">操作</th>
          </tr>
	      <c:forEach items="${rygw_list}" var="map" varStatus="status">
                        <tr <c:if test="${status.count % 2 eq '0'}">class="bgcol"</c:if>>  
                                
                            <td><input name="ids" type="checkbox" value="${map.RYGWDM}" style="padding:0;margin-left:2px;*margin-left:-2px;"/></td>
                            <td>${map.YHDM}</td>
                            <td>${map.YHXM}</td>
                            <td>${map.GWDM}</td>
                            <td>${map.GWMC}</td>
							<td>							
							<div class="cz_button cz1_1" title="修改" onclick="javascript:updDiv('${map.RYGWDM}');"></div>	
<%-- 							<div class="cz_button cz3_6" title="修改密码" onclick="javascript:updMmDiv('${map.RYGWDM}');"></div>													 --%>
							</td>
                        </tr>
                    </c:forEach>
        </table>
      </form>
    </div>

    <div class="youtube"> 
      <c:if test="${not empty page }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="page" onlyOneShow="true" showListNo="true" action="gzlgwgl/queryRygwgl"/>
      </c:if>
    </div>
    <div class="clr"></div>
  </div>
</div>




<div id="addOrUpd" style="display:none; width: 700px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form id="addOrUpdfrom" name="addOrUpdfrom" method="post">
<%-- 	<input type="hidden" name="dmmc"  value="${jsglPage.dmmc}" /> --%>
	<input type="hidden" name="zt" id="zt"/><!-- 1：添加  2：修改 -->
<%-- 	<input type="hidden" id="yx" value="${jsglPage.jsyxdm}" /> --%>
<%-- 	<input type="hidden" id="jys" value="${jsglPage.jsjysdm}" /> --%>
<!-- 	<input type="hidden" name="glyx" id="glyx" /> -->
	<input type="hidden" name="rygwdm" id="rygwdm_ssss"/>
    <div class="popup">
      <div class="Floatleft Pct100 mb10">
        <div class="popup_left">添加/修改</div>
        <a href="#" class="btn_close" onclick="javascript:BOX_remove('addOrUpd');"></a> 
      </div>
      <div class="clr"></div>
      <table id="divtab" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
        <tr>
          <th>人员姓名：</th>
          <td align="left" id="rxxm_td"><input type="text" name="xm" id="xm_tj"  dataType="Limit" min="1" max="15" msg="必填" ondblclick="javascript:selectKcForwb();" title="双击选择课程" readonly="readonly"/>
            <span class="red">*</span>
            <input type="hidden" name="yhdm" id="yhdm_tj" />
            </td>
        </tr>  
        <tr>
         <th>岗位：</th>
          <td align="left">
           <select name="gwdm" id="gwdm_tj" dataType="Limit" min="1" max="20" msg="必选" >
	    		  </select>
<!--           <input type="text" name="jsxm" id="jsxm" dataType="Limit" min="1" max="20" msg="必填(20个字之内)" /> -->
            <span class="red">*</span>
          </td>     
        </tr>
              <tr>
          <td colspan="4" align="center">
          <div class="addlist_button1" style="float:right"><a href="javascript:BOX_remove('addOrUpd');"><span>取消</span></a> </div>
          <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:addOrUpd();" title="保存" ><span>保存</span></a> </div>
          </td>
        </tr>      
      </table>
      <div class="clr"></div>
    </div>
  </form>
</div>
  

        <!--选择用户-->
        <div id="xzkcDiv" style="display:none; width: 700px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
            <form name="xzkcform" id="xzkcform" method="post" >
               
                <div class="popup">
                    <div class="Floatleft Pct100 mb5">
                        <div class="popup_left">选择用户</div>
                        <a href="#" class="btn_close" onclick="onClear();return false;"></a>
                    </div>
                    <div class="clr"></div>
                    <table cellspacing="0" cellpadding="0"   width="100%" align="center" border="0">
                        <tr>
                            <td style="height:200px;border:none;">
                                <iframe name="xzkclist" id="xzkclist" src="" marginwidth="0" marginheight="0" frameborder="0" width="100%" height="400px"></iframe>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="border:none;" height="35">
                                <div class="addlist_button1 mr10" style="float:right"><a href="javascript:onClear(); "><span>取消</span></a> </div>
<!--                                 <div class="addlist_button1 mr15" style="float:right" ><a id="_save" href="javascript:save();" title="保存" ><span>保存</span></a> </div> -->
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"> </div>
</body>
</html>


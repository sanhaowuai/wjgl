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
<title>北京赢科后台管理系统</title>
<jsp:include page="../../include/css-main-include.jsp"></jsp:include>
<STYLE type="text/css">
  html, body { height:100%; }
  .Contentbox { width:100%; min-height:100%;height:auto }
  *html .Contentbox { height:100% }
</STYLE>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	   $("#ff").baigoCheckall();
	});
	function querylike(){
		document.queryform.action="<%=path%>/jxcdgl/queryJxcdgl";
		document.queryform.submit();
	}
	
	//添加弹出层
	function addDiv(){
		$("#zt").val("1");	
		Validator.ClearForm('addOrUpdfrom');
		$("#divtab").find("input[type='text']").val('');
		$("#divtab").find("select").val('');
		$("#ff_lhdm option").eq(0).nextAll().remove();
		$("#ff_dm").attr("readonly",false);
		BOX_show('addOrUpd');
		
	}
	
	//修改弹出层
	function updDiv(dm){
		$("#zt").val("2");
		Validator.ClearForm('addOrUpdfrom');
		var url="<%=path%>/jxcdgl/queryJxcdByDm";
	    var param={'dm':dm};
	    $.post(url,param,function(result){
	    	$("#ff_dm").val(result.dm);
	    	$("#ff_mc").val(result.mc);   	
	    	$("#ff_xiaoqudm").val(result.xiaoqu);
	    	result.lc = result.lc == null? '' : result.lc;
	    	$("#lc").val(result.lc);
	    	$("#cdlb").val(result.cdlb);
	    	$("#zws").val(result.zws);
	    	result.symj = result.symj == null? '' : result.symj;
	    	$("#symj").val(result.symj);
	    	result.jzmj = result.jzmj == null? '' :result.jzmj;
	    	$("#jzmj").val(result.jzmj);
	    	$("#sfpks").val(result.sfpks);
	    	$("#sfkj").val(result.sfkj);
	    	$("#sfpk").val(result.sfpk);
	    	$("#sfpsy").val(result.sfpsy);
	    	$("#sfpsj").val(result.sfpsj);
	    	$("#sfjtjs").val(result.sfjtjs);
	    	result.jc = result.jc == null? '' :result.jc;
	    	$("#jc").val(result.jc);
	    	$("#zjm").val(result.zjm);
	    	$("#kszws").val(result.kszws);
	    	$("#sfyjsy").val(result.sfyjsy);
	    	$("#sfbjsy").val(result.sfbjsy);
	    	$("#ff_kyf").val(result.kyf);
	          	//联动赋值
	            var url1 = "<%=request.getContextPath()%>/jxcdgl/queryJxlByXiaoqu";
	            var param1 = {'yxdm':result.xiaoqu};
	            jQuery.post(url1,param1,function (ret){
	                if(null != ret){
	                    $("#ff_lhdm").empty();   
	                    $("#ff_lhdm").append("<option value=''>--请选择--</option>");
	                    $.each(ret,function(key,value){
	                        if(result.lhdm == value.dm){
	                            $("#ff_lhdm").append("<option value='"+value.dm+"' selected>"+value.mc+"</option>");
	                        }else{
	                            $("ff_lhdm").append("<option value='"+value.dm+"'>"+value.mc+"</option>");
	                        }
	                    })
	                }else{
	                    return;
	                }
	            },'json'); 
	
	            
	    },'json')
	    
	    
	    $("#ff_dm").attr("readonly",true);
		BOX_show('addOrUpd');
	}
	
	//添加或修改
	function addOrUpd(){
	  	 var money=$("#lc").val();
			
		if(Validator.Validate(document.getElementById('addOrUpdfrom'),3)){
					if(!CheckNumber(money)){
		            alert("楼层只允许添加3位整数");
		            return;
					}
			document.addOrUpdfrom.action="<%=path%>/jxcdgl/queryByDmCount";
			$("#addOrUpdfrom").ajaxSubmit(function(result){
		        if(result){
		        	document.addOrUpdfrom.action = '<%=path%>/jxcdgl/addJxcdglSz';
		        	$("#addOrUpdfrom").ajaxSubmit(function(r){
						document.addOrUpdfrom.action="<%=path%>/jxcdgl/queryJxcdgl";
						document.addOrUpdfrom.submit();
					});
			    }else{
				    alert("此教学场地已存在！");
				    return;
				}
		    },'json')
		}
	}
	
	//删除教学场地
	function delJxcd(){
	    if(isCheck('ids') == false){
	        alert("请选择要删除的教学场地");
	        return;
	    }
	    if(confirm("您确定要删除选中的教学场地吗？") == true){
	        document.ff.action = "<%=path%>/jxcdgl/delJxcd";
	        $("#ff").ajaxSubmit(function(r){
				document.ff.action="<%=path%>/jxcdgl/queryJxcdgl";
				document.ff.submit();
			});
	    }
	}
	
	function changeXiaoquDiv(obj){
		
		var xiaoqu;
		var jxl;
		xiaoqu = "#ff_xiaoqudm";
		jxl = "#ff_lhdm";
	   var yxdm = $(xiaoqu).val();
	   if(yxdm!=""){
		  //$(z).find("option:gt(0)").remove();
		   var option="";
		   var url = "<%=path%>/jxcdgl/queryJxlByXiaoqu" 
		   $.post(url,{yxdm:yxdm},function(result){
			   $(jxl).empty();
			   $(jxl).append("<option value=''>--请选择教学楼--</option>");   
		       $.each(result,function(key,value){  	   	   		
	  	   	   if(value.yxdm == $("#ff_lhdm").val()){             
	               option+="<option value='"+value.dm+"' selected>"+value.mc+"</option>";
	           }else{
	        	   option+="<option value='"+value.dm+"'>"+value.mc+"</option>";
	           }
	  	   	   })
		       $(jxl).append(option);
		   },'json');
	   }else{
	   	   $(jxl).empty();
	   	   $(jxl).append("<option value=''>--请选择教学楼--</option>");
	   	   $(jxl).append(option);
	   }
	}
	
	//使用部门分配
	function queryYx(sybm,dm){
		$("#iframename").attr("src","<%=path%>/jxcdgl/queryYx?sybm="+sybm+"&dm="+dm);
		BOX_show('yx');
	}
	
	function closeDiv(div_name){
		document.ff.action="<%=path%>/jxcdgl/queryJxcdgl";
		document.ff.submit();
	}
	
	//验证是否是数字 或者 小数点后2位数字
	function CheckNumber(number){
			  var verify =/^\d{3}$/;
			  //var verify =/^\[1-9]\[1-9]\[1-9]$/;
			  if(verify.test(number)){
			    return true;
			  }else{
			    return false;
			  }
	}
</script>
</head>
  
<body>
    
    <div class="clr"></div>
<%--    <div class="Menubox">--%>
<%--      <ul>--%>
<%--        <li><a href="<%=path%>/zylbgl/queryZylbgl">专业类别</a></li>--%>
<%--        <li><a href="<%=path%>/rxlxgl/queryRxlxgl">入校类型</a></li>--%>
<%--        <li><a href="<%=path%>/dqgl/queryDqgl">地区</a></li>--%>
<%--        <li><a href="<%=path%>/cdlbgl/queryCdlbgl">场地类别</a></li>--%>
<%--        <li><a href="<%=path%>/xnxqgl/queryXnxqgl">学年学期</a></li>--%>
<%--        <li><a href="<%=path%>/gwlxgl/queryGwlxgl">岗位类型</a></li>--%>
<%--        <li><a href="<%=path%>/gwgl/queryGwgl">岗位</a></li>--%>
<%--        <li><a href="<%=path%>/njgl/queryNjgl">年级</a></li>--%>
<%--        <li class="hover">教学场地</li>--%>
<%--        <li><a href="<%=path%>/jxlgl/queryJxlgl">教学楼</a></li>--%>
<%--        <li><a href="<%=path%>/jyslxgl/queryJyslxgl">教研室类型</a></li>--%>
<%--        <li><a href="<%=path%>/jysgl/queryJysgl">教研室</a></li>--%>
<%--        <li><a href="<%=path%>/xiaoqugl/queryXiaoqugl">校区</a></li>--%>
<%--        <li><a href="<%=path%>/klgl/queryKlgl">科类</a></li>--%>
<%--        <li><a href="<%=path%>/bjgl/queryBjgl">班级</a></li>--%>
<%--      </ul>--%>
<%--    </div> --%>
    <div class="butsea">
      <table  border="0" align="left" cellpadding="0" cellspacing="0"  >
        <tr>
          <td height="35px">
            <div class="addlist_button"> <a href="javascript:addDiv();"><span>添&nbsp;&nbsp;加</span></a> </div>
            <div class="addlist_button  ml15"> <a href="javascript:delJxcd();"><span>删&nbsp;&nbsp;除</span></a> </div>
          </td>
        </tr>
      </table>
      <form id="queryform" name="queryform" method="post">
        <table  border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td >名称：</td>
            <td><input type="text" name="dmmc" id="qf_dm" value="${jxcdglPage.dmmc}"  /></td>
            <td ><div class="addlist_button2"> <a href="javascript:void(0);" onclick="javascript:querylike();return false;"><span>搜&nbsp;&nbsp;索</span></a> </div></td>
          </tr>
        </table>
      </form>
    </div>
    <div class="clr"></div>
    <div class="list">
      <form name="ff" method="post" id="ff" >
        <input type="hidden" name="pageCount"  value="${jxcdglPage.pageCount}" />
        <input type="hidden" name="pageNo"  value="${jxcdglPage.pageNo}" />
        <input type="hidden" name="pageSize"  value="${jxcdglPage.pageSize}" />
        <input type="hidden" name="dmmc"  value="${jxcdglPage.dmmc}" />
        <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
            <th width="6%"><input type="checkbox" id="ids" title="全选/不选" style="padding:0;margin-left:2px;*margin-left:-2px;"/></th>
            <th>场地代码</th>
            <th>场地名称</th>
            <th>楼号</th>
            <th>校区</th>
            <th>场地类型</th>
            <th>可用否</th>
            <th width="15%">操作</th>
          </tr>
          <c:forEach items="${jxcdList}" var="map" varStatus="status">
  	        <tr <c:if test="${status.count % 2 eq '0'}">class="bgcol"</c:if>>
		   	  <td><input name="ids" type="checkbox" value="${map.dm}" style="padding:0;margin-left:2px;*margin-left:-2px;"/></td>
		   	  <td>${map.dm}</td>
		   	  <td>${map.mc}</td>
		   	  <td>${map.jxlmc}</td>
		   	  <td>${map.xiaoqumc}</td>
		   	  <td>${map.cdlb}</td>
		   	  <td>${map.kyf eq '1' ? '可用' : '不可用'}</td>
		      <td><div class="cz_button cz1_1" title="修改" onclick="javascript:updDiv('${map.dm}');"></div>
      	          <div class="cz_button cz1_6"  title="使用部门分配" onclick="javascript:queryYx('${map.sybm}','${map.dm}');"></div>
              </td>
 		    </tr>
		  </c:forEach>
        </table>
      </form>
    </div>
    <div class="youtube01"> 
      <c:if test="${not empty jxcdglPage }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="jxcdglPage" onlyOneShow="true" showListNo="true" action="jxcdgl/queryJxcdgl"/>
      </c:if>
    </div>
    <div class="clr"></div>
 

<div id="addOrUpd" style="display:none; border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form id="addOrUpdfrom" name="addOrUpdfrom" method="post">
    <input type="hidden" name="pageCount"  value="${jxcdglPage.pageCount eq '0' ? '1' : jxcdglPage.pageCount}" />
    <input type="hidden" name="pageNo"  value="${jxcdglPage.pageNo eq '0' ? '1' : jxcdglPage.pageNo}" />
    <input type="hidden" name="pageSize"  value="${jxcdglPage.pageSize}" />
    <input type="hidden" name="dmmc"  value="${jxcdglPage.dmmc}" />
    <input type="hidden" name="zt" id="zt"/><!-- 1：添加  2：修改 -->
    <div class="popup">
      <div class="Floatleft Pct100 mb10">
        <div class="popup_left">添加/修改</div>
        <a href="#" class="btn_close" onclick="javascript:BOX_remove('addOrUpd');"></a>
      </div>
      <div class="clr"></div>
      <div style="width:100%; height:300px; overflow:auto">
      <table id="divtab" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
        <tr>
          <th>场地代码：</th>
          <td align="left"><input type="text" name="dm" id="ff_dm"  dataType="Number" msg="请填写数字" maxlength="10"/>
            <span class="red">*</span>
          </td>
          <th>场地名称：</th>
          <td align="left"><input type="text" name="mc" id="ff_mc" dataType="Limit" min="1" max="20" msg="必填(20个字之内)" />
            <span class="red">*</span>
          </td>
        </tr>
        <tr>
          <th>校区：</th>
          <td align="left">
            <select name="xiaoqu" id="ff_xiaoqudm" onchange="javascript:changeXiaoquDiv(this);return false;" dataType="Limit" min="1" max="20" msg="必选">
              <option value="">--请选择校区--</option>
        	  <c:forEach items="${xiaoqulist}" var="map" varStatus="status">
    	        <option value='${map.dm}'>
			 	  ${map.mc}
			    </option>
              </c:forEach>
            </select>
            <span class="red">*</span>
          </td>
          <th>教学楼：</th>
          <td align="left">
            <select name="lhdm" id="ff_lhdm" dataType="Limit" min="1" max="20" msg="必选">
           	  <option value="" >--请选择教学楼--</option>
            </select>
            <span class="red">*</span>
          </td>
        </tr>
        <tr>
     	  <th>楼层：</th> 
     	  <td align="left"><input type="text" name="lc" id="lc"   />
     	    <span class="red">*</span>
     	  </td>
     	  <th>场地类别：</th>
     	  <td align="left">
     	    <select name="cdlb" id="cdlb" dataType="Limit" min="1" max="20" msg="必选">
           	  <option value="">--请选择场地类别--</option>
       		  <c:forEach items="${cdList}" var="map" varStatus="status">
       	        <option value='${map.dm}'>
    	           ${map.mc}
    	        </option>
 		      </c:forEach>
            </select>
            <span class="red">*</span>
          </td>
        </tr>
        <tr>
          <th>座位数：</th>
          <td><input type="text" name="zws" id="zws"  dataType="Integer" msg="请填写整数" /></td>
          <th>使用面积：</th>
          <td><input type="text" name="symj" id="symj" /></td>
        </tr>
        <tr>
       	  <th>建筑面积：</th>
       	  <td><input type="text" name="jzmj" id="jzmj" /></td>
       	  <th>简称：</th>
       	  <td><input type="text" name="jc" id="jc" /></td>
        </tr>
        <tr>
       	  <th>助记码：</th>
       	  <td><input type="text" name="zjm" id="zjm" /></td>
       	  <th>考试座位数：</th>
       	  <td><input type="text" name="kszws" id="kszws" /></td>
        </tr>
        <tr>
       	  <th>是否安排考试：</th>
       	  <td>
       	    <select name="sfpks" id="sfpks">
       	      <option value="">--请选择--</option>
       	      <option value="1">是</option>
              <option value="0">否</option>
       	    </select>
       	  </td>
       	  <th>是否可借用：</th>
       	  <td>
       	    <select name="sfkj" id="sfkj">
		      <option value="">--请选择--</option>
		      <option value="1">是</option>
		      <option value="0">否</option>
       	    </select>
       	  </td>
        </tr>
        <tr>
       	  <th>是否排课：</th>
       	  <td>
       	    <select name="sfpk" id="sfpk">
	       	  <option value="">--请选择--</option>
	       	  <option value="1">是</option>
	       	  <option value="0">否</option>
       	    </select>
       	  </td>
       	  <th>是否可安排实验：</th>
       	  <td>
       	    <select name="sfpsy" id="sfpsy">
	       	  <option value="">--请选择--</option>
	       	  <option value="1">是</option>
	       	  <option value="0">否</option>
       	    </select>
       	  </td>
        </tr>
        <tr>
          <th>是否可安排实践：</th>
	      <td>
	        <select name="sfpsj" id="sfpsj">
	       	  <option value="">--请选择--</option>
	       	  <option value="1">是</option>
	       	  <option value="0">否</option>
	       	</select>
	      </td>
	      <th>是否阶梯教室：</th>
	      <td>
	       	<select name="sfjtjs" id="sfjtjs">
	       	  <option value="">--请选择--</option>
	       	  <option value="1">是</option>
	       	  <option value="0">否</option>
	       	</select>
	      </td>
        </tr>
        <tr> 
       	  <th>是否教研使用：</th>
       	  <td>
       	    <select name="sfyjsy" id="sfyjsy">
       	      <option value="">--请选择--</option>
       	      <option value="1">是</option>
       	      <option value="0">否</option>
       	    </select>
       	  </td>
       	  <th>是否本教使用：</th>
       	  <td>
       	    <select name="sfbjsy" id="sfbjsy">
       	      <option value="">--请选择--</option>
       	      <option value="1">是</option>
       	      <option value="0">否</option>
       	    </select>
       	  </td>
        </tr>
        <tr>
          <th>可用否：</th>
          <td colspan="3" align="left">
            <select name="kyf" id="ff_kyf">
              <option value="1" selected="selected">可用</option>
              <option value="0">不可用</option>
            </select>
          </td>
        </tr>
        <tr>
          <td colspan="4" align="center"><div class="addlist_button1" style="float:right"><a href="javascript:BOX_remove('addOrUpd');"><span>取消</span></a> </div>
             <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:addOrUpd();" title="保存" ><span>保存</span></a> </div>
          </td>
        </tr>
      </table>
      </div>
      <div class="clr"></div>
    </div>
  </form>
</div>

<div id="yx" style="display:none; width: 550px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <div class="popup">
    <div class="Floatleft Pct100 mb10">
      <div class="popup_left">使用部门分配</div>
      <a href="#" class="btn_close" onclick="javascript:closeDiv('yx');"></a>
    </div>
    <div class="clr"></div>
    <div class="Floatleft Pct100 ">
      <iframe id="iframename" name="iframename" src="" border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%; height: 300px;" frameborder="0" allowTransparency="true"></iframe>
	</div>
    <div class="clr"></div>
  </div>
</div>
<div id="setting"> </div>  
</body>
</html>

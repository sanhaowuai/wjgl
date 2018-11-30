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
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript">
$(document).ready(function(){
   $("#ff").baigoCheckall();
});
	function querylike(){
		document.queryform.action="<%=path%>/bjgl/queryBjgl";
		document.queryform.submit();
	}

    //添加弹出层
	function addDiv(){
		$("#zt").val("1");
		Validator.ClearForm('addOrUpdfrom');	
		$("#divtab").find("input[type='text']").val('');
		$("#divtab").find("select").val('');
		$("#xh").attr("readonly",false);
	    $("#ff_bjdm").attr("readonly",false);		
		BOX_show('addOrUpd');
	}

	//修改弹出层
	function updDiv(bjdm){
	//	$.ajaxSetup({
	//		  async: false
	//		});
	  $("#zt").val("2");
	  $("#ff_bjdm").attr("readonly",true);	
	  Validator.ClearForm('addOrUpdfrom');
	  var url="<%=path%>/bjgl/queryBjByDm";
	  var param={'bjdm':bjdm};
	  $.post(url,param,function(result){
	  	$("#ff_bjdm").val(result.bjdm);	
	  	$("#ff_bjmc").val(result.bjmc);
	  	$("#ff_ssydm").val(result.xydm);
	  	$("#ff_ssnjdm").val(result.nj);
	  	$("#ff_ssxiaoqudm").val(result.xiaoqu);
	    $("#ff_kyf").val(result.kyf);
	    result.bjjc = result.bjjc == null? '' : result.bjjc;
	    $("#ff_bjjc").val(result.bjjc);
	    result.zjm = result.zjm == null? '': result.zjm;
	    $("#ff_zjm").val(result.zjm);
	    result.bjrs = result.bjrs == null? '':result.bjrs;
	    $("#ff_bjrs").val(result.bjrs);
	    result.zyfx = result.zyfx == null? '' : result.zyfx ;
	    $("#ff_zyfx").val(result.zyfx);
	    $("#ff_sfpkbj").val(result.sfpkbj);
	    $("#ff_bjlx").val(result.bjlx);
	    $("#glyx").val(result.glyx);
	    $("#ff_tgyx").val(result.tgyx);
	        //联动赋值
	        var ff_ssydm = $("#ff_ssydm").val();
	        var ff_ssxdm = $("#ff_ssxdm").val();
	        var url1 = "<%=path%>/pubXByYx/queryXByYx";
	        var param1 = {'yxdm':result.xydm};
	        $.post(url1,param1,function (ret){
	            if(ret.length > 0){
	                $("#ff_ssxdm").empty(); 
	                $("#ff_ssxdm").append("<option value=''>--请选择--</option>");
	                $.each(ret,function(key,value){
	                    if(result.xdm == value.YXDM){
	                        $("#ff_ssxdm").append("<option value='"+value.YXDM+"' selected>"+value.YXMC+"</option>");
	                    }else{
	                        $("#ff_ssxdm").append("<option value='"+value.YXDM+"'>"+value.YXMC+"</option>");
	                    }
	                })
	            }else{
	                return;
	            }
	        });
	
	        var url2 = "<%=request.getContextPath()%>/pubZyByYx/queryZyByYx";
	        var param2 = {'xdm':result.xdm,'xydm':result.xydm};
	        jQuery.post(url2,param2,function (ret){
	            if(ret.length > 0){
	                $("#ff_sszydm").empty();   
	                $("#ff_sszydm").append("<option value=''>--请选择--</option>");
	                $.each(ret,function(key,value){
	                    if(result.zydm == value.ZYDM){
	                        $("#ff_sszydm").append("<option value='"+value.ZYDM+"' selected>"+value.ZYMC+"</option>");
	                    }else{
	                        $("#ff_sszydm").append("<option value='"+value.ZYDM+"'>"+value.ZYMC+"</option>");
	                    }
	                })
	            }else{
	                return;
	            }
	        },'json'); 
	        
	  },'json')
	  $("#xh").attr("readonly",true);
		BOX_show('addOrUpd');
	}

	//添加或修改
	function addOrUpd(){
		if(Validator.Validate(document.getElementById('addOrUpdfrom'),3)){		
			var bjdm = $("#ff_bjdm").val();
			var zt = $("#zt").val();
			var url="<%=path%>/bjgl/queryByDmCount";
		    var param={'bjdm':bjdm,'zt':zt};
		    $.post(url,param,function(result){
		        if(result){
		        	document.addOrUpdfrom.action = '<%=path%>/bjgl/addBjglSz';
		        	 $('#addOrUpdfrom').ajaxSubmit(function(r){
		        		 document.ff.action="<%=path%>/bjgl/queryBjgl";
			        	 document.ff.submit();
		        	 });
			    }else{
				    alert("此班级代码已存在！");
				    return;
				}
		    },'json')
		}
	}

	function changeYDiv(obj){
	   var xydm = $(obj).val();
		  //$(z).find("option:gt(0)").remove();
		   var option="";
		   var url = "<%=path%>/pubXByYx/queryXByYx";
		   $.post(url,{'yxdm':xydm},function(result){
			   $("#ff_ssxdm").empty();
			   $("#ff_ssxdm").append("<option value=''>--请选择系--</option>");   
		       $.each(result,function(key,value){
	        	   option+="<option value='"+value.YXDM+"'>"+value.YXMC+"</option>";
	  	   	   })
		       $("#ff_ssxdm").append(option);
		   },'json');
		   
		   var url1 = "<%=path%>/bjgl/querySfglbm";
		   $.post(url1,{'yxdm':xydm},function(result){
		       if(result == '1'){
		       	   $("#glyx").val(xydm);
		       }
		   },'json')
		   
		   $("#ff_sszydm").empty();
		   $("#ff_sszydm").append("<option value=''>--请选择专业--</option>");
		   var url2 = "<%=path%>/pubZyByYx/queryZyByYx";
		   $.post(url2,{'xydm':xydm},function(result){
		        var option2 = "";
		        $.each(result,function(key,value){
	        	     option2+="<option value='"+value.ZYDM+"'>"+value.ZYMC+"</option>";
		        })
		        $("#ff_sszydm").append(option2);
		   },'json')
	}
	
	function changeXDiv(obj){
		var xydm = $(obj).val();
		var url1 = "<%=path%>/bjgl/querySfglbm";
		   $.post(url1,{'yxdm':xydm},function(result){
		       if(result == '1'){
		       	   $("#glyx").val(xydm);
		       }
		   },'json')
		
		
		if(xydm==null || xydm==''){
			var xydm=$("#ff_ssydm").val();
		    var url="<%=path%>/pubZyByYx/queryZyByYx";
		}else{
	        var url = "<%=path%>/pubZyByX/queryZyByX";
		}
		$("#ff_sszydm").empty();
		$("#ff_sszydm").append("<option value=''>--请选择专业--</option>");
		$.post(url,{'xydm':xydm},function(result){
		    var option = "";
		    $.each(result,function(key,value){
	        	 option+="<option value='"+value.ZYDM+"'>"+value.ZYMC+"</option>";
		    })
		    $("#ff_sszydm").append(option);
		},'json')
		    
	}
	
	//删除班级
	function delBj(){
	    if(isCheck('ids') == false){
	        alert("请选择要删除的班级");
	        return;
	    }
	    if(confirm("您确定要删除选中的班级吗？") == true){
	        document.ff.action = "<%=path%>/bjgl/delBj";
	        $('#ff').ajaxSubmit(function(r){
	   		 document.ff.action="<%=path%>/bjgl/queryBjgl";
	       	 document.ff.submit();
	   	 });
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
            <div class="addlist_button  ml15"> <a href="javascript:delBj();"><span>删&nbsp;&nbsp;除</span></a> </div>
          </td>
        </tr>
      </table>
      <form id="queryform" name="queryform" method="post">
        <table  border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td >名称：</td>
            <td><input type="text" name="dmmc" id="qf_dm" value="${bjglPage.dmmc}"  /></td>
            <td ><div class="addlist_button2"> <a href="javascript:void(0);" onclick="javascript:querylike();return false;"><span>搜&nbsp;&nbsp;索</span></a> </div></td>
          </tr>
        </table>
      </form>
    </div>
    <div class="clr"></div>
    <div class="list">
      <form name="ff" method="post" id="ff" >
<!--        <input type="hidden" name="pageCount"  value="${bjglPage.pageCount}" />-->
<!--		<input type="hidden" name="pageNo"  value="${bjglPage.pageNo}" />-->
<!--		<input type="hidden" name="pageSize"  value="${bjglPage.pageSize}" />-->
		<input type="hidden" name="dmmc"  value="${bjglPage.dmmc}" />
        <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
          <tr>
            <th width="6%"><input type="checkbox" title="全选/不选" id="ids" style="padding:0;margin-left:2px;*margin-left:-2px;"/></th>
            <th>班级代码</th>
            <th>班级名称</th>
            <th>所属学院</th>
            <th>所属系</th>
            <th>所属专业</th>
            <th>所在年级</th>
            <th>所在校区</th>
            <th>可用否</th>
            <th width="50px">操作</th>
          </tr>
          <c:forEach items="${bjList}" var="map" varStatus="status">
    	    <tr <c:if test="${status.count % 2 eq '0'}">class="bgcol"</c:if>>
	          <td><input name="ids" type="checkbox" value="${map.bjdm}" style="padding:0;margin-left:2px;*margin-left:-2px;"/></td>
	          <td>${map.bjdm}</td>
     	      <td>${map.bjmc}</td>
     	      <td>${map.yxmc}</td>
     	      <td>${map.xmc}</td>
     	      <td>${map.zymc}</td>
     	      <td>${map.njmc}</td>
     	      <td>${map.mc}</td>
     	      <td>${map.kyf eq '1' ? '可用' : '不可用'}</td>
              <td>
              	<div class="cz_button cz1_1" title="修改" onclick="javascript:updDiv('${map.bjdm}');"></div>
              </td>
   		    </tr>
  		  </c:forEach>
        </table>
      </form>
    </div>
    <div class="youtube"> 
      <c:if test="${not empty bjglPage }">
        <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="bjglPage" onlyOneShow="true" showListNo="true" action="bjgl/queryBjgl"/>
      </c:if>
    </div>
    <div class="clr"></div>
  </div>
</div>

<div id="addOrUpd" style="display:none; width: 780px; border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form id="addOrUpdfrom" name="addOrUpdfrom" method="post">
  <input type="hidden" name="pageCount"  value="${bjglPage.pageCount eq '0' ? '1' : bjglPage.pageCount}" />
  <input type="hidden" name="pageNo"  value="${bjglPage.pageNo eq '0' ? '1' : bjglPage.pageNo}" />
  <input type="hidden" name="pageSize"  value="${bjglPage.pageSize}" />
  <input type="hidden" name="dmmc"  value="${bjglPage.dmmc}" />
  <input type="hidden" name="zt" id="zt"/><!-- 1：添加  2：修改 -->
  <input type="hidden" name="glyx" id="glyx"/>
  <div class="popup">
    <div class="Floatleft Pct100 mb10">
      <div class="popup_left">添加/修改</div>
      <a href="#" class="btn_close" onclick="javascript:BOX_remove('addOrUpd');"></a>
    </div>
    <div class="clr"></div>
       <table id="divtab" width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
        <tr>
          <th>班级代码：</th>
          <td align="left"><input type="text" name="bjdm" id="ff_bjdm"  dataType="Number" min="1" max="15" msg="必填数字(15个字之内)"/>
            <span class="red">*</span>
          </td>
          <th>班级名称：</th>
          <td align="left"><input type="text" name="bjmc" id="ff_bjmc" dataType="Limit" min="1" max="20" msg="必填(20个字之内)" />
            <span class="red">*</span>
          </td>
        </tr> 
        <tr>
          <th>所属学院：</th>
          <td align="left">
            <select name="xydm" id="ff_ssydm" onchange="javascript:changeYDiv(this);return false;" dataType="Limit" min="1" max="20" msg="必选">
              <option value="" name="xydm">--请选择学院--</option>
              <c:forEach items="${yxlist}" var="map" varStatus="status">
                <option value='${map.YXDM}'>${map.YXMC}</option>
		      </c:forEach>
            </select>
            <span class="red">*</span>
          </td>
          <th>所属系：</th>
          <td align="left">
            <select name="xdm" id="ff_ssxdm" onchange="javascript:changeXDiv(this);return false;" >
              <option value="">--请选择系--</option>
            </select>	
          </td>
        </tr> 
	    <tr>
          <th>所属专业：</th>
          <td align="left">
            <select name="zydm" id="ff_sszydm" >
              <option value="">--请选择专业--</option>
            </select>
          </td>
          <th>托管院系：</th>
          <td align="left">
            <select name="tgyx" id="ff_tgyx" >
              <option value="">--请选择托管院系--</option>
              <c:forEach items="${yxLists}" var="map">
                <option value="${map.yxdm}">
                  <c:choose>
           		    <c:when test="${map.sjyxdm eq '0'}">
           		         ${map.yxmc}
           			</c:when>
                	<c:otherwise>
                		 &nbsp;&nbsp;&nbsp;&nbsp;${map.yxmc}
                	</c:otherwise>
                  </c:choose>
                </option>
              </c:forEach>
            </select>
          </td>
        </tr> 
        <tr>
          <th>班级简称：</th>
          <td align="left"><input type="text" name="bjjc" id="ff_bjjc" /></td>
          <th>助记码：</th>
          <td align="left"><input type="text" name="zjm" id="ff_zjm" /></td>
        </tr> 
		<tr>
          <th>年级：</th>
          <td align="left">
            <select name="nj" id="ff_ssnjdm" >
          	  <option value="">--请选择年级--</option>
          	  <c:forEach items="${njlist}" var="map" varStatus="status">
        	    <option value='${map.NJ}'>
     	             ${map.NJMC}
     	        </option>
  		      </c:forEach>
            </select>
          </td>
          <th>校区：</th>
          <td align="left">
            <select name="xiaoqu" id="ff_ssxiaoqudm">
          	  <option value="">--请选择校区--</option>
          	  <c:forEach items="${xiaoqulist}" var="map" varStatus="status">
        	    <option value='${map.dm}'>
     	            ${map.mc}
     	        </option>
  		      </c:forEach>
            </select>
          </td>
        </tr> 
        <tr>
          <th>班级人数：</th>
          <td align="left"><input type="text" name="bjrs" id="ff_bjrs"/ dataType="Number" msg="必填整数" require="false"></td>
<!--          <th>专业方向：</th>-->
<!--          <td align="left"><input type="text" name="zyfx" id="ff_zyfx" /></td>-->
          <th>班级类型：</th>
          <td align="left">
            <select name="bjlx" id="ff_bjlx">
              <option value="" selected="selected">--请选择班级类型--</option>
              <option value="1">行政班</option>
              <option value="2">教学班</option>
            </select>
          </td>
        </tr> 
        <tr>
          <th>是否排课班级：</th>
          <td align="left">
            <select name="sfpkbj" id="ff_sfpkbj">
              <option value="" selected="selected">是否排课班级</option>
              <option value="1" >是</option>
              <option value="0">否</option>
            </select>
          </td>
          <th>可用否：</th>
          <td align="left" colspan="3">
            <select name="kyf" id="ff_kyf">
          	  <option value="1" selected="selected">是</option>
          	  <option value="0">否</option>
            </select>
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
<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"> </div>   
</body>
</html>

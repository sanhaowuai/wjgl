<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.lang.*,java.util.*,java.text.*" %>


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

<link href="<%=path%>/resources/js/treetable/stylesheets/master.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/js/treetable/stylesheets/jquery.treeTable.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/resources/js/selectJs/css/bootstrap-select.min.css"><!-- 下拉框复选 -->
<style type="text/css">
  html, body { height:100%; }
  .Contentbox { width:100%; min-height:100%;height:auto }
  *html .Contentbox { height:100% }
  
  .bootstrap-select.btn-group .dropdown-toggle .filter-option{
     	line-height: 24px;
 		height: 24px;
     	}
     	.dropdown-menu{margin-top:-1px}
.dropdown-menu ul{border:0!important;box-shadow: 0px 0px 0px rgba(0, 0, 0, 0.3) !important;}
.dropdown-menu li{height:34px;}
.dropdown-menu li a{display:block;height:34px;}
</style>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/treetable/javascripts/jquery.treeTable.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/treetable/treeTable-my.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>



<link rel="stylesheet" href="<%=path%>/resources/js/plupload/jquery.plupload.queue/css/jquery.plupload.queue.css" type="text/css" />
<script type="text/javascript" src="<%=path%>/resources/js/plupload/plupload.full.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/plupload/jquery.plupload.queue/jquery.plupload.queue.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/plupload/i18n/cn.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/plupload/plupload.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/ckeditor4.1.2/ckeditor.js"></script>
<%-- <script type="text/javascript" src="<%=path%>/resources/js/bootstrap.js"></script><!-- 下拉框复选 --> --%>
<%-- <script type="text/javascript" src="<%=path%>/resources/js/selectJs/js/bootstrap-select.min.js"></script><!-- 下拉框复选 --> --%>
<script type="text/javascript">

$().ready(function(){
	treetable();
	plfileupload({
	      url:'<%=path%>',
	      savePath:'helpupload',
	      max_file_size:'10mb' ,
	      max_file_length:1, //上传数量
	      buttonId:'fake_btn',
	      formId:'ff' ,
	      filters : (	[
		{title : "全部可上传类型", extensions : "zip"}
			     		]),
		   downfiles:${empty listfjjson ? '[]' : listfjjson }
	   },save);
	
});
   //添加只能填报菜单
	function addzntbcd(){
		$("#zntbiframe").attr("src","<%=path %>/jsp/formbj/selectfile.jsp?r="+Math.random());
		BOX_show('add_zntb');
	}
	function seturl(url){
		
		$('#fwlj').val(url)
		
		BOX_remove('add_zntb')
	}
	//校验数据   填写完全可以上传附件
	function testData(){
		if(Validator.Validate(document.getElementById('ff'),3) ){
			if(confirm("确认要上传此压缩包吗？(会清空所有帮助信息！)")){
				$("#fake_btn").click();  //触发隐藏btn 上传附件并调用save方法
			}
		}
	}
	//保存方法
	function save(){
		document.ff.action="<%=path%>/qxcdgl/Dryswjj";
	    document.ff.submit();
	}
	$.ajaxSetup({
	    async : false
	});
	function expandall(){
	    var zhi=$('tr[id^=node]');
	    zhi.each(function(i,val){
	        $(val).expand();
	    });
	}
	
	function collapseall(){
	    var zhi=$('tr[id^=node]');
	    zhi.each(function(i,val){
	        $(val).collapse();
	    });
	}
	
	//查询所有父级权限
	function queryFqxdm(){
		var app="";
		var url = "<%=path%>/gzlgwgl/queryGwmc";
		$.post(url,function(result){
			app+="<option value='-1'>最上级</option>";
			$.each(result,function(key,value){
				if(value.sjgwdm=='-1'){
					app+="<option value='"+value.gwdm+"'>&nbsp;&nbsp;"+value.gwmc+"</option>";
				}else{
					var ss="&nbsp;&nbsp;";
					for(var i=0;value.sjgwdm.length>i;i++ ){
						 ss= ss+"&nbsp;&nbsp;";
					}	
					app+="<option value='"+value.gwdm+"'>"+ss+value.gwmc+"</option>";
				}
							
					
			})
			$("#sjgwdm").append(app);
		})
	}
		
	//添加菜单权限弹出
	function addQxcd(){ 
		$("#sjgwdm").attr("disabled", false);
		$("#gwdm").val("");
		$("#gwmc").val("");
		$("#kyf").val("1");
		$("#sjgwdm").children().remove();
		$("#ssyx").val("");
		$("#qxcd_addOrUpd").val("0");   //0为添加
		queryFqxdm();
		
		BOX_show('add');
	}
	
	
	
	//修改菜单权限弹出
	function updQxcd(gwdm){
		$("#qxcd_addOrUpd").val("1");   //1为修改
		$("#sjgwdm").children().remove();
		queryFqxdm();
		$("#gwdm").val(gwdm);
		var url = "<%=path%>/gzlgwgl/queryByGwdm";
		var zhi = {'gwdm':gwdm};
		$.post(url,zhi,function(result){		
			
			     if (result != null) {
                        $.each(result, function (k, obj) {
                            obj = obj == null ? '' : obj;
                            $("input[id='" + k + "'],select[id='" + k + "']").val(obj);
//                             $("textarea[id='" + k + "']").html(obj);
                            $("input[name='" + k + "']").each(function () {
                                if ($(this).val() == obj) {
                                    $(this).attr("checked", 'true');
                                }
                            });                         

                        });
                    }
		})
		$("#sjgwdm").attr("disabled", true);
		BOX_show('add');
	}
	
	
	//查询
	function querylike(){
		document.form2.action="<%=path%>/gzlgwgl/queryGzlgwgl";
		document.form2.submit();
	}

	
	//添加权限菜单和修改权限菜单
	function addOrUpt(){
		var i = $("#qxcd_addOrUpd").val();
		if(i==0){      //添加操作
		if(Validator.Validate(document.getElementById('form1'),3)){
			document.form1.action = "<%=path%>/gzlgwgl/addGzlgwgl";
			$("#form1").ajaxSubmit(function(result){
				if(result=="0"){
					alert("添加成功！");
					querylike();
				}else{
					alert("添加失败！");
					querylike();
				}
				
				
			});
		}
									
		}else{         //修改操作
			if(Validator.Validate(document.getElementById('form1'),3)){
				
				$("#sjgwdm").attr("disabled", false);
				document.form1.action="<%=path%>/gzlgwgl/updGwcd";
				$("#form1").ajaxSubmit(function(r){
					if(r == null || r == ""){
						alert("修改成功！");
						querylike();
					}else {
						alert("修改失败！");
						querylike();
					}

				});
			}
			
		}
		
	}
	
	//删除权限菜单方法
	function deleteGw(gwdm,gwmc){
		if(confirm("确认删除【"+gwmc+"】岗位吗？")){
			document.form2.action="<%=path%>/gzlgwgl/delGw?gwdm="+gwdm;
			$("#form2").ajaxSubmit(function(r){
				alert("删除成功！");
				querylike();
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
    <form name="drform" id="drform"  method="post"  >
   		 <input  type="hidden"   name="inputPath" id="cclj" value="dcsj.ser"/>
   		 <input  type="hidden"   name="filename"  id="xsm" value="xt_help.ser"/>
   	</form>
   	<input type="hidden" id="qxdmByJs" value="" />
    <input type="hidden" id="fqxdmByJs" value="" />
    <form name="form2" id="form2" method="post">
    <div class="butsea">
      <table  border="0" align="left" cellpadding="0" cellspacing="0"  >
        <tr>
          <td height="35px">          
            	<div class="addlist_button">
					<a href="javascript:void(0);" onclick="javascript:addQxcd();">
            			<span>添加</span>
            		</a>
            	</div>           	
          </td>
        </tr>
      </table>
      
<!--       <table  border="0" align="right" cellpadding="0" cellspacing="0"  > -->
<!--           <tr> -->
<!--             <td >权限角色：</td> -->
<!--             <td> -->
<!--              <select name="cxjsdm" id="cxjsdm"> -->
<!--               <option value=''>---请选择---</option> -->
<%--   			  <c:forEach items="${jslist}" var="map" varStatus="status"> --%>
<%-- 		      		<option value='${map.jsdm}' <c:if test="${map.jsdm eq cxjsdm}">selected</c:if>>${map.jsmc}</option> --%>
<%-- 		      </c:forEach> --%>
<!-- 		     </select> -->
<!-- 		    </td> -->
<!--             <td ><div class="addlist_button2"> <a href="javascript:void(0);" onclick="javascript:querylike();return false;"><span>搜&nbsp;&nbsp;索</span></a> </div></td> -->
<!--          </tr> -->
<!--       </table> -->
    </div>
    </form>
    <div class="clr"></div>
    <div class="list">
      <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line" id="zbtable">
        <thead>
          <tr>
            <th>
         	  <span class="Floatleft" style="padding:0px">岗位名称  </span>
              <a href="javascript:void(0);" onclick="javascript:expandall();return false;" class="open_but" title="展开"><i class="glyphicon glyphicon-circle-arrow-down"></i></a>
              <a href="javascript:void(0);" onclick="javascript:collapseall();return false;" class="close_but" title="收起"><i class="glyphicon glyphicon-remove-circle"></i></a>
        	</th>       
<!--             <th>岗位代码</th> -->
<!--             <th>上级岗位代码</th> -->
            <th>所属院系</th>
            <th>可用否</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${gwgl_list}" var="qxcd" varStatus="status">
            <tr id="node${qxcd.treedm}"  class=" ${status.count%2==0 ? 'bgcol':'' }  <c:choose><c:when test='${qxcd.sjgwdm==-1}'>parent</c:when><c:otherwise>child</c:otherwise></c:choose>
              <c:choose><c:when test='${qxcd.treefdm==null}'></c:when><c:otherwise>child-of-node</c:otherwise></c:choose>${qxcd.treefdm}"style="line-height:30px;">
	            <td>
	            <c:if test="${qxcd.sfzzdj eq '0'}">&nbsp;&nbsp;</c:if>
	            <span class="<c:choose><c:when test='${qxcd.sjgwdm==-1}'>folder</c:when><c:otherwise>file</c:otherwise></c:choose>">
	              &nbsp;</span><span>${qxcd.gwmc}</span>
	            </td>
<%-- 		        <td>${qxcd.gwdm}</td> --%>
<!-- 		        <td> -->
<%-- 		         ${qxcd.sjgwdm} --%>
<!-- 		        </td> -->
		        <td>
		        ${qxcd.ssyxmc}
		        </td>
		        <td>
		          <c:choose>
		            <c:when test="${qxcd.kyf == 1}">可用</c:when>
		            <c:otherwise>不可用</c:otherwise>
		          </c:choose>
		      </td>
		      <td>
		        <div class="cz_button cz1_1" title="修改" onclick="javascript:updQxcd('${qxcd.gwdm}');"></div>
		        <div class="cz_button cz1_2" title="删除" onclick="javascript:deleteGw('${qxcd.gwdm}','${qxcd.gwmc}');"></div>
		      </td>
	        </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
    <div class="clr"></div>
  </div>
</div>


<!-- 添加权限菜单 -->
<div id="add" style="display:none; width: 450px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <form name="form1" id="form1" method="post">
  
    <input type="hidden" id="qxcd_addOrUpd" value="" />
    <input type="hidden" id="gwdm" value="" name="gwdm" />
    <div class="popup">
      <div class="Floatleft Pct100 mb10">
        <div class="popup_left">添加/修改</div>
        <a href="#" class="btn_close" onclick="javascript:BOX_remove('add');"></a>
      </div>
      <div class="clr"></div>
      <table width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
        <tr>
          <th>岗位名称：</th>
          <td align="left"><input type="text" name="gwmc" id="gwmc"  dataType="Limit" min="1" max="100" msg="<br/>请填写岗位名称(100字符之内)" />
            <span class="red">*</span>
          </td>
        </tr>
        <tr>
          <th>父级岗位：</th>
           <td align="left"><select name="sjgwdm" id="sjgwdm" > </select>
             <span class="red">*</span>
           </td>
        </tr>
    
        <tr>
          <th>所属院系：</th>
           <td align="left">
           <select name="ssyx" id="ssyx" >
            <option value="">--请选择--</option>
	      		    <c:forEach items="${yxlist}" var="map" >
	       		      <option value='${map.YXDM}'>
	    		         ${map.YXMC}
	    	          </option>
	    	          </c:forEach>
            </select>
             
           </td>
        </tr>
        
        <tr>
          <th> 可用否：</th>
          <td align="left">
            <select name="kyf" id="kyf">
              <option value="1">可用</option>
              <option value="0">不可用</option>
            </select><span class="red">*</span>
          </td>
        </tr>
        <tr>
          <td colspan="2" align="center"><div class="addlist_button1" style="float:right"><a href="#"  title="取消" onclick="javascript:BOX_remove('add');" ><span>取消</span></a> </div>
          <div class="addlist_button1 mr15" style="float:right" ><a href="javascript:void(0);" onclick="javascript:addOrUpt();" title="保存" ><span>保存</span></a> </div></td>
        </tr>
      </table>
      <div class="clr"></div>
    </div>
  </form>
</div>

<!-- end -->
<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>

<div id="setting"></div>
</body>
</html>


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

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>北京赢科后台管理系统</title>
<jsp:include page="../../include/css-boostrap-include.jsp"></jsp:include>
<style type="text/css">
  html, body { height:100%; }
  .Contentbox { width:100%; min-height:100%;height:auto }
  *html .Contentbox { height:100% }
  .light{width:auto;float:left;margin:0 2px;}
  .light>span{display:inline-block; width:15px; height:15px;margin-top:5px;border-radius:50%;}
  .red> span{ background:red;}
  .blue> span{ background:blue;}
  .green> span{ background:green;}
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
	//从服务获取咨询信息
	
	function queryRwrzb(id){
		$("#myModal_ex").html("");
		var url = '<%=path%>/executeSQLTaskController/queryExecuteSQLTaskToSinJson';
		$.ajax({ 
			url:url,
			dataType:'jsonp',
			jsonp:'callback',
			data:{//发送给servlet的数据 
				id:id
			},
			async:false,
			success: function(json){
				$("#myModal_clsql").val(json.clsql);
				$("#myModal_id").val(json.id);
				if(json.yccxrows == '0'){
					$("#myModal_clsqlrows").html("<span style=\"background: blue;\">【"+json.clsqlrows+"】</span>");
				}else {
					$("#myModal_clsqlrows").html("<span style=\"background: red;\">【"+json.clsqlrows+"】</span>");
				}
			},
		     error: function(XmlHttpRequest, textStatus, errorThrown) {
		    	 alert(errorThrown);
		    } 				
		});
		$('#myModal').modal('show')
	
	}
	
	function executeExecuteSQLTaskToSin(){
		if(confirm("您确定要执行么？") == true){
			$("#myModal_ex").html("数据加载中...");
			$("#myModal_ff").ajaxSubmit({
			     type: "post",
				dataType:'jsonp',
				jsonp:'callback',
			     url: "<%=path%>/executeSQLTaskController/executeExecuteSQLTaskToSin",
			     success: function(json){
						$("#myModal_clsqlrows").html("<span style=\"background: red;\">【"+json.clsqlrows+"】</span>");
						loadJsonp();
						$("#myModal_ex").html("数据加载完成");
			     },
			     error: function(XmlHttpRequest, textStatus, errorThrown) {
			    	 $("#myModal_ex").html(XmlHttpRequest.responseText);
			    } 		     
			 });			
		}
		
		
	}
	function loadJsonp(){
		$("#Tab1 tr:gt(0)").remove(); 
		var url = '<%=path%>/executeSQLTaskController/queryExecuteSQLTaskToList/${gnbs}';
		$.ajax({ 
			url:url,
			dataType:'jsonp',
			jsonp:'callback',
			data:{//发送给servlet的数据 
				mc:$("#qf_mc").val()
			},
			async:false,
			success: function(json){
				var trHtml = "";
				for(var i=0;i<json.length;i++){
					trHtml += "<tr>";
					if(json[i].yxzt == '1'){
						trHtml +=	"<td><div style=\"cursor: pointer;\" onclick=\"javascript:loadRwrzJsonp('3','"+json[i].id+"');\" class=\"light green\" ><span title=\"运行中,点击查看执行日志\"></span></div></td>";
					}else {
						trHtml +=	"<td><div style=\"cursor: pointer;\"  onclick=\"javascript:loadRwrzJsonp('3','"+json[i].id+"');\" class=\"light red\"><span title=\"停止中,点击查看执行日志\"></span></div></td>";
					}
					 trHtml +=   "<td><div style=\"width: 100px;overflow:hidden; text-overflow:ellipsis; white-space:nowrap;\">"+json[i].id+"</div></td>"+
			             "<td><div style=\"width: 80px;overflow:hidden; text-overflow:ellipsis; white-space:nowrap;\" title="+(json[i].mc==null?"":json[i].mc)+">"+(json[i].mc==null?"":json[i].mc)+"<div></td>"+
			             "<td><div style=\"width: 80px;overflow:hidden; text-overflow:ellipsis; white-space:nowrap;\" title="+(json[i].ms==null?"":json[i].ms)+">"+(json[i].ms==null?"":json[i].ms)+"</div></td>"+
			             "<td ><div title="+(json[i].clsql==null?"":json[i].clsql)+" style=\"width: 150px;overflow:hidden; text-overflow:ellipsis; white-space:nowrap;\">"+(json[i].clsql==null?"":json[i].clsql)+"</div></td>"+
<%--			        if(json[i].yccxrows == '0'){       --%>
<%--			        	 trHtml +=     "<td><a href=\"javascript:void(0);\" onclick=\"queryRwrzb('"+json[i].id+"')\"><span style=\"background: blue;\">【"+json[i].yccxrows+"】</span></a></td>";--%>
<%--			        }else {--%>
<%--			        	trHtml +=     "<td><a href=\"javascript:void(0);\" onclick=\"queryRwrzb('"+json[i].id+"')\"><span style=\"background: red;\">【"+json[i].yccxrows+"】</span></a></td>";--%>
<%--			        	--%>
<%--			        }     --%>
			             "<td>"+(json[i].clsqlrows==null?"":json[i].clsqlrows)+"</td>"+
			             "<td>"+(json[i].cron==null?"":json[i].cron)+"</td>"+
// 			             "<td>"+(json[i].zhxgrdm==null?"":json[i].zhxgrdm)+json[i].yccxrows+"</td>"+
// 			             "<td>"+json[i].zhxgsj+"</td>"+
			             "<td>"+
			             "<div class=\"cz_button cz_bg1\" onclick=\"javascript:updateByID('"+json[i].id+"');return false;\" title=\"修改\"><span class=\"glyphicon glyphicon-pencil\"></span></div>"+
			             "<div class=\"cz_button cz_bg3\" onclick=\"javascript:delByID('"+json[i].id+"');return false;\" title=\"删除\"><span class=\"glyphicon glyphicon-remove\"></span></div>"+
 			             "<div class=\"cz_button cz_bg2\" onclick=\"javascript:addJob('"+json[i].id+"');return false;\" title=\"启动任务\"><span class=\"glyphicon glyphicon-play-circle\"></span></div>"+
 			             "<div class=\"cz_button cz_bg3\" onclick=\"javascript:removeJob('"+json[i].id+"');return false;\" title=\"停止任务\"><span class=\"glyphicon glyphicon-off\"></span></div>"+
			             "</td>"+
			          "</tr>";
				}
				trHtml += "</tbody>";
				$("#Tab1").append(trHtml);//在table最后面添加一行
				//loadJobJsonp();
			},
		     error: function(XmlHttpRequest, textStatus, errorThrown) {
		    	 alert(errorThrown);
		    } 				
		});
	}
	function loadRwrzJsonp(rwlx,rwid){
		$('#cron_iff').attr('src','<%=path%>/executeSQLTaskController/queryRwrzbPage?rwlx='+rwlx+"&rwid="+rwid);
		$('#myModal_detail').modal('show')
	}	
	function loadJobJsonp(){
		var url = '<%=path%>/executeSQLTaskController/listJob';
		$.ajax({ 
			url:url,
			dataType:'jsonp',
			jsonp:'callback',
			async:false,
			success: function(json){
				for(var i=0;i<json.length;i++){
					$("#span_"+json[i].id).html("运行中");
				}
			},
		     error: function(XmlHttpRequest, textStatus, errorThrown) {
		    	 alert(errorThrown);
		    } 				
		});
	}	
	//多选
	$(document).ready(function(){
		loadJsonp();
	});
	//查询
	function queryLike(){
		loadJsonp();
	}

	//新增
	function addDiv(){
		var randomNu = (new Date().getTime()) ^ Math.random();//解决IE缓存问题
		var oAction = new Action("<%=path%>/executeSQLTaskController/queryExecuteSQLTaskToSin/add?_="+randomNu);
		//oAction.setParameter("mbdmOrZddm", mbdmOrZddm);
		oAction.doOpenWinAction();		
	}

	//修改
	function updateByID(id){
		var randomNu = (new Date().getTime()) ^ Math.random();//解决IE缓存问题
		var oAction = new Action("<%=path%>/executeSQLTaskController/queryExecuteSQLTaskToSin/upd?_="+randomNu);
		oAction.setParameter("id", id);
		oAction.doOpenWinAction();		
	}
	function delByID(id){
		if(confirm("您确定要删除么？") == true){
			$.ajax({
			     type: "post",
			     url: "<%=path%>/executeSQLTaskController/shumitExecuteSQLTaskToSin/del",
				 data:{//发送给servlet的数据 
					id:id
				 },
			     dataType: "json",
			     success: function(result){
						if(result > 0){
							alert("操作成功");
							loadJsonp();
						}else {
							alert("操作失败");
						}
			     }
				,
			     error: function(XmlHttpRequest, textStatus, errorThrown) {
			    	 alert(XMLHttpRequest.responseText);
			    } 
			 });		
		}
	}
	function addJob(vid){
		var randomNu = (new Date().getTime()) ^ Math.random();//解决IE缓存问题
		var oAction = "<%=path%>/executeSQLTaskController/addJob/"+vid;
		$.ajax({  
   			url:oAction,
		    success: function(result){
					if(result== "success"){
						alert("启动成功");
						loadJsonp();
						//loadJobJsonp();
						//opener.loadJsonp();
						//window.close();
					}else {
						alert("启动失败"+result);
					}
		     }		
     	});		
	}
	function removeJob(vid){
		var randomNu = (new Date().getTime()) ^ Math.random();//解决IE缓存问题
		var oAction = "<%=path%>/executeSQLTaskController/removeJob/"+vid;
		$.ajax({  
   			url:oAction,
		    success: function(result){
					if(result== "success"){
						alert("已停止");
						loadJsonp();
						loadJobJsonp();
						//opener.loadJsonp();
						//window.close();
					}else {
						alert("操作失败"+result);
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
   	  <div class="question" title="帮助" onclick="javascript:cha('${QXB.QXDM}');">
   	  <span class="glyphicon glyphicon-question-sign"></span>
   	  </div>    
      <div class="address">
       <ol class="breadcrumb  ">
          <li> <span class="glyphicon glyphicon-home pull-left"></span> </li>
		  <li>当前位置：</li>
		  <li><a href="#">${QXB.FQXMC}</a></li>
		  <li class="active">${QXB.QXMC}</li>
		</ol>          
      </div>
    <div class="clr"></div>
    <div class="butsea">
      <div class="pull-left Pct35"> 
        <div class="light red"><span title="停止中"></span>&nbsp;停止中</div> 
<!--         <div class="light blue"><span title="有异常"></span>&nbsp;有异常</div>  -->
        <div class="light green"><span title="运行中"></span>&nbsp;运行中</div>   
      	<button class="btn btn-info ml5" type="button" onclick="javascript:addDiv();">添加</button>
      	
      </div>
       <div class="pull-right Pct65">
       <form class="form-horizontal" role="form">
        <table  border="0" align="right" cellpadding="0" cellspacing="0"  >
          <tr>
<!--             <td> -->
<!-- 				<input type="checkbox" id="qf_sfyyc">            -->
<!--             </td>           -->
<!--             <td><label for="inputEmail3" class="control-label">是否不包含正常任务：</label></td> -->

            <td><input type="text" class="form-control pull-left" name="sfbr" id="qf_mc" value="${bmxxcxPage.sfbr}"  placeholder="名称" style="width:300px !important;"/></td>
            <td>
             <button class="btn btn-search" type="button" onclick="javascript:queryLike();">搜 索</button>  
            </td>
          </tr>
        </table>  
        </form>     
       </div> 
    </div>
    <div class="clr"></div>
    <div class="list"> 
        <table  class="table table-bordered bot_line" id="Tab1">
         <thead>
          <tr>
          	 <th></th>
             <th><div class="pull-left">ID</div>
<!--                <DIV CLASS="LIGHT RED"><SPAN TITLE="停止中"></SPAN></DIV>  -->
<!--                <DIV CLASS="LIGHT BLUE"><SPAN TITLE="有异常"></SPAN></DIV>  -->
<!--                <DIV CLASS="LIGHT GREEN"><SPAN TITLE="运行中"></SPAN></DIV>  -->
             </th>
             <th >名称</th>
             <th>描述</th>
             <th>处理SQL</th>
             <th>影响行数</th>
             <th>执行频率</th>
<!--              <th>最后修改人</th> -->
<!--              <th>最后修改时间</th> -->
             <th></th>
          </tr>
          </thead>          
        </table>
      </form>
    </div>
<!--     <div class="youtube">  -->
<!-- 		 <nav> -->
<!-- 		  <ul class="pagination pagination-sm"> -->
<!-- 		    <li class="disabled"><a href="#">&laquo;</a></li> -->
<!-- 		    <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li> -->
<!-- 		    <li><a href="#">2</a></li> -->
<!-- 		    <li><a href="#">3</a></li> -->
<!-- 		    <li><a href="#">4</a></li> -->
<!-- 		    <li><a href="#">5</a></li> -->
<!-- 		    <li><a href="#">&raquo;</a></li> -->
<!-- 		  </ul> -->
<!-- 		</nav> -->
<!--     </div> -->
    <div class="clr"></div>
  </div>
</div>
<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>

<div class="modal fade" id="myModal_detail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document"  style="width:800px;">
    <div class="modal-content popborder">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"  >&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">执行日志</h4>
      </div>
      <div class="modal-body">
			<iframe id="cron_iff" name="iff" src="" border="0" framespacing="0" marginheight="0" 
			marginwidth="0" style="width: 100%; height: 400px;" frameborder="0" allowTransparency="true"></iframe>
      </div>
    </div>
  </div>
</div>
</body>
</html>

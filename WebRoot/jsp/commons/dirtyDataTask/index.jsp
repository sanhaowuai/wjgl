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
	//多选
	$(document).ready(function(){
		$("#ff").baigoCheckall();
	});
	function loadJsonp(){
		$("#Tab1 tr:gt(0)").remove(); 
		var url = '<%=path%>/dirtyDataTaskController/queryDirtyDataTaskToList/${gnbs}';
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
					trHtml += "<tr>"+
		              			"<td><input name=\"ids\" type=\"checkbox\" value=\""+json[i].id+"\" style=\"padding:0;margin-left:2px;*margin-left:-2px;\"/></td>"+
								"<td><div class=\"cz_button cz_bg1\" onclick=\"javascript:loadRwrzJsonp('2','"+json[i].id+"');return false;\" title=\"执行日志\"><span class=\"glyphicon glyphicon-map-marker\"></span></div></td>"+
								"<td><div style=\"width: 80px;overflow:hidden; text-overflow:ellipsis; white-space:nowrap;\">"+json[i].id+"</div></td>"+
			             		"<td><div style=\"width: 80px;overflow:hidden; text-overflow:ellipsis; white-space:nowrap;\" title="+(json[i].mc==null?"":json[i].mc)+">"+(json[i].mc==null?"":json[i].mc)+"<div></td>"+
			             		"<td><div style=\"width: 80px;overflow:hidden; text-overflow:ellipsis; white-space:nowrap;\" title="+(json[i].ms==null?"":json[i].ms)+">"+(json[i].ms==null?"":json[i].ms)+"</div></td>"+
			             		"<td><div title="+(json[i].wheresql==null?"":json[i].deletesql)+" style=\"width: 150px;overflow:hidden; text-overflow:ellipsis; white-space:nowrap;\">"+(json[i].deletesql==null?"":json[i].deletesql)+"</div></td>"+
			             		"<td><div title="+(json[i].tablename==null?"":json[i].tablename)+" style=\"width: 150px;overflow:hidden; text-overflow:ellipsis; white-space:nowrap;\">"+(json[i].tablename==null?"":json[i].tablename)+"</div></td>"+
			             		"<td><div title="+(json[i].wheresql==null?"":json[i].wheresql)+" style=\"width: 150px;overflow:hidden; text-overflow:ellipsis; white-space:nowrap;\">"+(json[i].wheresql==null?"":json[i].wheresql)+"</div></td>"+			             		
			             		"<td><div style=\"width: 10px;overflow:hidden; text-overflow:ellipsis; white-space:nowrap;\">"+(json[i].yxhs==null?"":json[i].yxhs)+"</div></td>"+
			             		"<td>"+
			             		"<div class=\"cz_button cz_bg1\" onclick=\"javascript:updateByID('"+json[i].id+"');return false;\" title=\"修改\"><span class=\"glyphicon glyphicon-pencil\"></span></div>"+
			             		"<div class=\"cz_button cz_bg3\" onclick=\"javascript:delByID('"+json[i].id+"');return false;\" title=\"删除\"><span class=\"glyphicon glyphicon-remove\"></span></div>"+
				          		"<div class=\"cz_button cz_bg2\" onclick=\"javascript:addJob('"+json[i].id+"');return false;\" title=\"执行\"><span class=\"glyphicon glyphicon-play-circle\"></span></div>"+
			             		"</td>"+
			         		   "</tr>";
				}
				trHtml += "</tbody>";
				$("#Tab1").append(trHtml);//在table最后面添加一行
			},
		     error: function(XmlHttpRequest, textStatus, errorThrown) {
		    	 alert(errorThrown);
		    } 				
		});
	}
	function loadRwrzJsonp(rwlx,rwid){
		$("#table_2 tr:gt(0)").remove(); 
		var url = '<%=path%>/exceptionTaskController/queryRwrzb/';
		$.ajax({ 
			url:url,
			dataType:'jsonp',
			jsonp:'callback',
			data:{//发送给servlet的数据 
				rwlx:rwlx,
				rwid:rwid
			},
			async:false,
			success: function(json){
				var trHtml = "";
				for(var i=0;i<json.length;i++){
					trHtml += "<tr>" + 
							  "<td>"+json[i].zxsj+"</td>"+
							  "<td>"+json[i].zxrdm+"</td>"+
							  "<td>"+json[i].zxsql+"</td>"+
							  "<td>"+json[i].yxhs+"</td>";
				}
				
				$("#table_2").append(trHtml);//在table最后面添加一行
				$('#myModal_detail').modal('show')
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
		Validator.ClearForm('myModal_addorUpd_ff');
		$("#myModal_addorUpd_tab").find("input[type='text']").val('');
		$("#myModal_addorUpd_tab").find("select").val('');
		$("#myModal_addorUpd_tab").find("textarea").val('');
		
	    $.post("<%=path%>/dirtyDataTaskController/getGuid",{},function(result){
			$("#myModal_addorUpd_id").val(result);
	    });	
		
		$("#myModal_addorUpd_method").val('add');
		$('#myModal_addorUpd').modal('show');
	}
	function shumitDirtyDataTaskToSin(){
		if(Validator.Validate(document.getElementById('myModal_addorUpd_ff'),3) ){
			if(confirm("您确定要保存么？") == true){
				$("#myModal_addorUpd_id").removeAttr("disabled");
				$("#myModal_addorUpd_ff").ajaxSubmit({
				     type: "post",
				     url: "<%=path%>/dirtyDataTaskController/shumitDirtyDataTaskToSin/"+$("#myModal_addorUpd_method").val(),
				     dataType: "json",
				     success: function(result){
							if(result > 0){
								alert("操作成功");
								loadJsonp();
								$('#myModal_addorUpd').modal('hide');
							}else {
								alert("操作失败");
							}
				     },
				     error: function(XmlHttpRequest, textStatus, errorThrown) {
				  
				    	 alert(errorThrown);
				    } 		     
				 });		
			}
		}
	}
	
	
	//修改
	function updateByID(id){
		Validator.ClearForm('myModal_addorUpd_ff');
		$("#myModal_addorUpd_tab").find("input[type='text']").val('');
		$("#myModal_addorUpd_tab").find("select").val('');
		$("#myModal_addorUpd_tab").find("textarea").val('');
		$("#myModal_addorUpd_method").val('upd');		
		var url = '<%=path%>/dirtyDataTaskController/queryDirtyDataTaskToSinJson';
		$.ajax({ 
			url:url,
			dataType:'jsonp',
			jsonp:'callback',
			async:false,
			data:{//发送给servlet的数据 
				id:id
			},			
			success: function(json){
		        $.each(json,function(k, obj){
		            obj=obj==null? '' : obj;
		            $("input[id='myModal_addorUpd_"+k+"'],select[id='myModal_addorUpd_"+k+"'],textarea[id='myModal_addorUpd_"+k+"']").val(obj);
		        })
		        $("#myModal_addorUpd_id").attr("readonly",true);
		        $('#myModal_addorUpd').modal('show');
			},
		     error: function(XmlHttpRequest, textStatus, errorThrown) {
		    	 alert(errorThrown);
		    } 				
		});	
	}

	function delByID(id){
		if(confirm("您确定要删除么？") == true){
			$.ajax({
			     type: "post",
			     url: "<%=path%>/dirtyDataTaskController/shumitDirtyDataTaskToSin/del",
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
			    	 alert(errorThrown);
			    } 
			 });		
		}
	}
	
	/****执行*************************************************/
	function executeDirtyDataTaskToSin(){
		if(Validator.Validate(document.getElementById('myModal_execute_ff'),3) ){
			if(confirm("您确定要执行么？") == true){
				$("#myModal_execute_ex").html("数据加载中...");
				$("#myModal_execute_id").removeAttr("disabled");
				$("#myModal_execute_ff").ajaxSubmit({
				     type: "post",
				     url: "<%=path%>/dirtyDataTaskController/executeDirtyDataTaskToSin",
						dataType:'jsonp',
						jsonp:'callback',
				     success: function(result){
					 	$("#myModal_execute_yxhs").html("<span style=\"background: red;\">【"+result.yxhs+"】</span>");
					 	$("#myModal_execute_ex").html("数据加载完成");
					 	loadJsonp();
				     },
                    error: function(XMLHttpRequest, textStatus, errorThrown) {
                    	$("#myModal_execute_ex").html(XMLHttpRequest.responseText);
                    }		     
				 });		
			}
		}
	}
	
	
	
	//执行
	function addJob(id){
		Validator.ClearForm('myModal_execute_ff');
		$("#myModal_execute_tab").find("input[type='text']").val('');
		$("#myModal_execute_tab").find("select").val('');
		$("#myModal_execute_tab").find("textarea").val('');	
		$("#myModal_execute_ex").html("");
		var url = '<%=path%>/dirtyDataTaskController/queryDirtyDataTaskToSinJson';
		$.ajax({ 
			url:url,
			dataType:'jsonp',
			jsonp:'callback',
			async:false,
			data:{//发送给servlet的数据 
				id:id
			},			
			success: function(json){
		        $.each(json,function(k, obj){
		            obj=obj==null? '' : obj;
		            $("input[id='myModal_execute_"+k+"'],select[id='myModal_execute_"+k+"'],textarea[id='myModal_execute_"+k+"']").val(obj);
		        });
		        $("#myModal_execute_id").attr("readonly",true);
		        $('#myModal_execute').modal('show');
			},
		     error: function(XmlHttpRequest, textStatus, errorThrown) {
		    	 alert(errorThrown);
		    } 				
		});	
	}
	function executeDirtyDataTaskToBatch(){
		if(isCheck('ids') == false){
	        alert("请选择要执行的数据");
	        return;
	    }
	    if(confirm("您确定要批量执行清理？") == true){
	        document.ff.action = "<%=path%>/dirtyDataTaskController/executeDirtyDataTaskToBatch";
	        $('#ff').ajaxSubmit(function(result){
				if(result== "success"){
					alert("批量执行清理成功");
					loadJsonp();
					//loadJobJsonp();
					//opener.loadJsonp();
					//window.close();
				}else {
					alert("批量执行清理失败"+result);
				}
	        	
	    	});
	    }
	}	
	function loadRwrzJsonp(rwlx,rwid){
		$('#cron_iff').attr('src','<%=path%>/exceptionTaskController/queryRwrzbPage?rwlx='+rwlx+"&rwid="+rwid);
		$('#myModal_detail').modal('show')
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
      	<button class="btn btn-info ml5" type="button" onclick="javascript:addDiv();">添加</button>
		<button class="btn btn-info ml5" type="button" onclick="javascript:executeDirtyDataTaskToBatch();">批量执行清理</button>      	
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
	  <form name="ff" method="post" id="ff" >    
        <table  class="table table-bordered bot_line" id="Tab1">
         <thead>
          <tr>
			 <th><input type="checkbox" id="ids" title="全选/不选" style="padding:0;margin-left:2px;*margin-left:-2px;"/></th>          
          	 <th></th>
             <th><div class="pull-left">ID</div></th>
             <th>名称</th>
             <th>描述</th>
             <th>DeleteSQL</th>
             <th>表名</th>
             <th>WhereSQL</th>
             <th>影响行数</th>
             <th></th>
          </tr>
          </thead>          
        </table>
      </form>
    </div>
    <div class="clr"></div>
  </div>
</div>
<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>

<form name="myModal_addorUpd_ff" method="post" id="myModal_addorUpd_ff" >
<input name="method" id="myModal_addorUpd_method" type="hidden"/>
<!-- 添加弹出框 -->
<div class="modal fade" id="myModal_addorUpd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document"  style="width:800px;">
    <div class="modal-content popborder">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"  >&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">添加/修改</h4>
      </div>
      <div class="modal-body">
         <table  class="addlist table-bordered"  id="myModal_addorUpd_tab">
           <tr>
             <th style="text-align:left;">ID</th>
             <th style="text-align:left;">名称</th>
           </tr>
           <tr>
             <td style="text-align:left;"><input type="text" id="myModal_addorUpd_id" name="id" class="form-control" maxlength=36 dataType="Limit" min="1" max="100" msg="请填写ID"/></td>
             <td style="text-align:left;"><input type="text" id="myModal_addorUpd_mc" name="mc" class="form-control"/></td>
           </tr> 
           <tr>
             <th style="text-align:left;" colspan="2">描述</th>
           </tr>                     
           <tr>
             <td colspan="2"><textarea class="form-control" rows="2" id="myModal_addorUpd_ms" name="ms"></textarea></td>
           </tr>           
           <tr>
             <th style="text-align:left;">DeleteSQL</th>
             <th style="text-align:left;">表名</th>
           </tr>
           <tr>
             <td style="text-align:left;">
		      <select class="form-control" name="deletesql" id="myModal_addorUpd_deletesql">
		      	  <option value="delete from">delete from</option>
				  <option value="truncate table ">truncate table</option>
				</select>              
             </td>
             <td style="text-align:left;"><input type="text" name="tablename" class="form-control" id="myModal_addorUpd_tablename"/></td>
           </tr>
           <tr>
             <th style="text-align:left;" colspan="2">WhereSQL</th>
           </tr>                     
           <tr>
             <td colspan="2"><textarea class="form-control" rows="2" id="myModal_addorUpd_wheresql" name="wheresql"></textarea></td>
           </tr>                                                   
         </table>
      </div>
      <div class="modal-footer mt1">
        <button type="button" class="btn btn-info" onclick="shumitDirtyDataTaskToSin();">保存</button>
        <button type="button" class="btn btn-info" data-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div>
</form>

<form name="myModal_execute_ff" method="post" id="myModal_execute_ff" >
<!-- 添加弹出框 -->
<div class="modal fade" id="myModal_execute" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document"  style="width:800px;">
    <div class="modal-content popborder">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"  >&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">执行窗口</h4>
      </div>
      <div class="modal-body">
         <table  class="addlist table-bordered"  id="myModal_execute_tab">
           <tr>
             <th style="text-align:left;">ID</th>
             <th style="text-align:left;">名称</th>
           </tr>
           <tr>
             <td style="text-align:left;"><input type="text" id="myModal_execute_id" name="id" class="form-control" maxlength=36 dataType="Limit" min="1" max="100" msg="请填写ID"/></td>
             <td style="text-align:left;"><input type="text" id="myModal_execute_mc" name="mc" class="form-control"/></td>
           </tr> 
           <tr>
             <th style="text-align:left;" colspan="2">描述</th>
           </tr>                     
           <tr>
             <td colspan="2"><textarea class="form-control" rows="2" id="myModal_execute_ms" name="ms"></textarea></td>
           </tr>           
           <tr>
             <th style="text-align:left;">DeleteSQL</th>
             <th style="text-align:left;">表名</th>
           </tr>
           <tr>
             <td style="text-align:left;">
		      <select class="form-control" name="deletesql" id="myModal_execute_deletesql">
		      	  <option value="delete from">delete from</option>
				  <option value="truncate table ">truncate table</option>
				</select>              
             </td>
             <td style="text-align:left;"><input type="text" name="tablename" class="form-control" id="myModal_execute_tablename"/></td>
           </tr>
           <tr>
             <th style="text-align:left;" colspan="2">WhereSQL</th>
           </tr>                     
           <tr>
             <td colspan="2"><textarea class="form-control" rows="2" id="myModal_execute_wheresql" name="wheresql"></textarea></td>
           </tr>                     
           <tr>
             <td colspan="2">影响行数<span id="myModal_execute_yxhs"></td>
           </tr> 
           <tr>
             <td colspan="2"><span id="myModal_execute_ex"></span></td>
           </tr>                                                                       
         </table>
      </div>
      <div class="modal-footer mt1">
        <button type="button" class="btn btn-info" onclick="executeDirtyDataTaskToSin();">执行SQL</button>
        <button type="button" class="btn btn-info" data-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div>
</form>

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

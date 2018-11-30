<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/jsp/jsqlquery/include/jquery-eayui_include.jsp"/>
<link href="<%=path%>/resources/style/icon/icon.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="importfile" style="display:none">
         <form id="impform" method="post" enctype="multipart/form-data">
             <input class="easyui-filebox"  name="impfile" style="width:300px">
         </form>
</div>
<div id="mm" class="easyui-menu">
	 
	<div id="impfile"       data-options="fun:'imp'"     >导入</div>
	<div id="deletefile"    data-options="fun:'del',iconCls:'icon-del'">删除</div>
	
	<div id="impfilerootAll" data-options="fun:'improotAll'"    >导入全部数据到当前数据源</div>
	<div id="impfileroot" data-options="fun:'improot'"    >导入到跟目录</div>
    <div id="onqueryID" data-options="fun:'onqueryID',iconCls:'icon-info'">获取ID</div>
	
</div>
  <div id="cc" class="easyui-layout" data-options="fit:true" >
    <div data-options="region:'west',title:'文件',split:true" style="width:400px;height:100%">
			<div   class="easyui-layout" data-options="fit:true,border:false" >
			    <div data-options="region:'north',border:false" style="overflow:hidden">
    	              <select id="datasourceName" data-options="fit:true,border:false"  class="easyui-combobox" prompt="数据源" style="width:100%;"></select>
			    </div>
			    <div data-options="region:'center',border:false" >
    	             <table id="sql_zxxb_list_data" cellspacing="0" data-options="fit:true,border:false"  cellpadding="0" class="easyui-treegrid"></table>
			    </div>
			</div>    </div>

	<div data-options="region:'center',title:'  ' "   >
       <iframe src="" border=0 style=" borfer:0px ;width:100%;height:100%"></iframe>
	</div>
	</div>
	<form id="sql_zxxb_list_data_ff" class="easyui-form" method="post" data-options="novalidate:true">
    				<input type="hidden" name="id" id="sql_zxxb_list_data_ff_id"/>
    				<input type="hidden" name="lx" id="sql_zxxb_list_data_ff_lx" value="3"/>
    				<input type="hidden" name="mc_1" id="sql_zxxb_list_data_ff_mc"/>
    				<input type="hidden" name="zt" id="sql_zxxb_list_data_ff_zt"/>
    </form>
</body>
<script type="text/javascript">
var _noed_target
function ondelSqlZxxb(){
	$('#sql_zxxb_list_data_ff_zt').val('3');
	var node = $('#sql_zxxb_list_data').treegrid('getSelected');
	if(node.id == "" || node.id == null){
		$.messager.alert('提示','请选择!','warning');
		return ;
	}else {
		$('#sql_zxxb_list_data_ff_id').val(node.id);
		$('#sql_zxxb_list_data_ff_mc').val(node.mc);
		delsubmitFormSqlZxxb();
	}
}
function delsubmitFormSqlZxxb(){
	var randomNu = (new Date().getTime()) ^ Math.random();//解决IE缓存问题
	var url = "";
	var zt = $('#sql_zxxb_list_data_ff_zt').val();
	if(zt == 1){
		url = "<%=path%>/Jsqlquery/addSqlZxxb?_"+randomNu;
	}else if(zt == 2){
		url = "<%=path%>/Jsqlquery/updSqlZxxb?_"+randomNu;
	}else if(zt == 3){
		url = "<%=path%>/Jsqlquery/delSqlZxxb?_"+randomNu;
	}
	$.messager.confirm('提示', '你确定要执行操作么?', function(r){
		if(r){
			$('#sql_zxxb_list_data_ff').form('submit',{
				url:url,
				success: function(data){
					var data = eval('(' + data + ')');  // change the JSON string to javascript object
					//alert(data);
					if (data.success){
 					$('#sql_zxxb_list_data_window').window('close');
 					$('#sql_zxxb_list_data').treegrid('clearSelections');
						$('#sql_zxxb_list_data').treegrid('reload');
						$.messager.alert('提示',data.message,'info');
						$('#tt_tabs').tabs('close',$('#sql_zxxb_list_data_ff_mc').val());
					}else {
						$.messager.alert('提示',data.message,'info');
					}
				}
			});
		}
	});
}
function onqueryID(){
	var node = $('#sql_zxxb_list_data').treegrid('getSelected');
	if(node.id == "" || node.id == null){
		$.messager.alert('提示','请选择!','warning');
		return ;
	}else {
		if(node.sjqlx == '1'){
			alert('zxxb_id='+node.id);
		}else if(node.sjqlx == '2' || node.sjqlx == '7'){
			alert('Jsqlquery/htmlSelectCodeEngine/'+node.id);
		}else if(node.sjqlx == '3' ||node.sjqlx == '4'){
			alert('新增地址：Jsqlquery/htmlInsertCodeEngine?zxxb_id='+node.id+'<br>修改地址：Jsqlquery/htmlSelectCodeByIDEngine?zxxb_id='+node.id);
		}else if(node.sjqlx == '5' ){
			alert('Jsqlquery/htmlTabCodeEngine?zxxb_id='+node.id);
		}else if(node.sjqlx == '6'){
			alert('Jsqlquery/htmlLayoutCodeEngine?zxxb_id='+node.id);
		}
		
	}
}
  $(document).ready(function(){
	   
	   $('#datasourceName').combobox({
			url: '<%=path%>/Jsqlquery/readDynamicDataSource',
			queryParams:{'power':'admin'},
            valueField: 'value',
            textField: 'key',
			method: 'post',
			onChange:function(newValue,oldValue){
				 
				$("#sql_zxxb_list_data").treegrid("reload",{'sjymc':newValue,'power':'admin'});
			}
		});
	   
		$('#sql_zxxb_list_data').treegrid({
		    url:'<%=path%>/Jsqlquery/querySqlZxxbListData3ForPower',
			queryParams:{'sjymc':'','power':'admin'},
		    method: 'post',
			singleSelect:true,//是否单选
		    fitColumns: true,
		    idField: 'id',
		    treeField: 'mc',
		    fit:true,
		    loadMsg:'加载中,请稍后...',
		    columns:[[
		    	 {title:'名称',field:'mc'}
		    ]],
		    onContextMenu: function(e,row){
				e.preventDefault();
				_noed_target = row.target
				$('#mm').menu('hideItem', $('#impfile')[0]);
				$('#mm').menu('hideItem', $('#impfileroot')[0]);
				$('#mm').menu('hideItem', $('#impfilerootAll')[0]);
				$('#mm').menu('hideItem', $('#onqueryID')[0]);
				if(row.sjqlx == '0'   ||row.rowid == 0){
					$('#mm').menu('showItem', $('#impfile')[0]);
					$('#mm').menu('showItem', $('#impfileroot')[0]);
					$('#mm').menu('showItem', $('#impfilerootAll')[0]);
				 }
				
				  
				if(row.id == '0'  ){
					$('#mm').menu('hideItem', $('#deletefile')[0]);
					$('#mm').menu('hideItem', $('#impfile')[0]);
					$('#mm').menu('showItem', $('#impfileroot')[0]);
					$('#mm').menu('showItem', $('#impfilerootAll')[0]);
				 }else if(row.sjqlx != '0' &&  row.sjqlx != '1'){
					 $('#mm').menu('showItem', $('#onqueryID')[0]);
				 }
				$('#mm').menu('show',{
					left: e.pageX,
					top: e.pageY,
					onClick:function(a){
						
						if(a.fun=='improot'){
							onImportZxxb('0')
						}else if(a.fun=='improotAll'){
							onImportZxxbAll('0')
						}else if(a.fun=='imp') {
						onImportZxxb(row.id)
						}else if(a.fun=='del') {
							ondelSqlZxxb()
						}else if(a.fun=='onqueryID') {
							onqueryID()
						}
					}

				});
			},
			 onClickRow:function(node){
				
				 var url=""
					    if(node.sjqlx == '0' || node.sjqlx == null  || node.sjqlx == ''){
					    	return false
					    }else if(node.sjqlx == '1'){
							//url='zxxb_id='+node.id
							return false
						}else if(node.sjqlx == '2'){
							url='Jsqlquery/htmlSelectCodeEngine/'+node.id
						}else if(node.sjqlx == '3' ||node.sjqlx == '4'){
							url='Jsqlquery/htmlInsertCodeEngineByYl?zxxb_id='+node.id
						}else if(node.sjqlx == '5' ){
							url='Jsqlquery/htmlTabCodeEngine?zxxb_id='+node.id;
						}else if(node.sjqlx == '6'){
							url='/Jsqlquery/htmlLayoutCodeEngine?zxxb_id='+node.id
						}else if(node.sjqlx == '7'){
							url='Jsqlquery/htmlSelectCodeEngine/'+node.id;
						}
				 
// 				 $("#cc").layout("panel", "center").panel({
// 					 href:
// 				 })
				 $("#cc").layout("panel", "center").find('iframe').attr("src","<%=path%>/"+url)
			},
			onLoadSuccess: function () {
				$('#sql_zxxb_list_data').treegrid('collapseAll')
				// $('#sql_zxxb_list_data').tree("expandAll",_noed_target);
			}
	 });
	  
  })
	function onImportZxxb(pid){
        
		var randomNu = (new Date().getTime()) ^ Math.random();//解决IE缓存问题
		var sjymc=$('#datasourceName').combobox('getValue')
		if(sjymc==null || sjymc=='' || sjymc==undefined){
			
			$.messager.alert('提示','请选择数据源!','warning');
			return false;
		}
		//var node = $('#sql_zxxb_list_data').treegrid('getSelected');
		if(pid == "" || pid == null){
			$.messager.alert('提示','请选择!','warning');
			return ;
		}else {
	        $('#importfile').dialog({
	            title: '导入',
	            width: 400,
	            height: 200,
	            buttons:[{
					text:'Save',
					handler:function(){
				         $('#impform').form('submit', {
				        	    url:"<%=path%>/ExportFile/imp?zxxb_id="+pid+"&sjymc="+sjymc+"&r="+randomNu,
				        	    onSubmit: function(){
				        	    	 
				        	    },
				        	    success:function(data){
				        	    	$('#importfile').dialog('close')
				        	    	$.messager.alert('提示','导入成功');
				        	    	var val=$('#datasourceName').combobox('getValue')
				        	    	$("#sql_zxxb_list_data").treegrid("reload",{'sjymc':val,'power':'admin'});
				        	    }
				        	});
					}
				},{
					text:'Close',
					handler:function(){
						 $('#importfile').dialog('close')
						
					}
				}]
	         })

	      
		}
		
	}
  
	function onImportZxxbAll(pid){
        
		var randomNu = (new Date().getTime()) ^ Math.random();//解决IE缓存问题
		var sjymc=$('#datasourceName').combobox('getValue')
		if(sjymc==null || sjymc=='' || sjymc==undefined){
			
			$.messager.alert('提示','请选择数据源!','warning');
			return false;
		}
		//var node = $('#sql_zxxb_list_data').treegrid('getSelected');
		if(pid == "" || pid == null){
			$.messager.alert('提示','请选择!','warning');
			return ;
		}else {
	        $('#importfile').dialog({
	            title: '导入全部数据',
	            width: 400,
	            height: 200,
	            buttons:[{
					text:'Save',
					handler:function(){
						if(confirm("导入全部数据，将会清空当前数据源数据，并且重新将数据导入至数据库中，是否要继续？") == true){
					         $('#impform').form('submit', {
					        	    url:"<%=path%>/ExportFile/impAll?zxxb_id="+pid+"&sjymc="+sjymc+"&r="+randomNu,
					        	    onSubmit: function(){
					        	    	 
					        	    },
					        	    dataType:"json",
					        	    error : function (data){
				                        $('#errorwin_mess').html(data.responseText);
				                        $('#errorwin').window('open');
				         	        },					        	    
					        	    success:function(data){
					        	    	if(data=='true'){
						        	    	$('#importfile').dialog('close')
						        	    	$.messager.alert('提示','导入成功');
						        	    	var val=$('#datasourceName').combobox('getValue')
						        	    	$("#sql_zxxb_list_data").treegrid("reload",{'sjymc':val,'power':'admin'});					        	    		
					        	    	}else {
					                        $('#errorwin_mess').html(data);
					                        $('#errorwin').window('open');
					        	    	}

					        	    }
					        	});							
						}

					}
				},{
					text:'Close',
					handler:function(){
						 $('#importfile').dialog('close')
						
					}
				}]
	         })

	      
		}
		
	}  
</script>
		<div id="errorwin" class="easyui-window" title="Error" data-options="modal:false,closed:true" style="width:80%;height:80%;padding:10px;">
			<div class="easyui-layout" data-options="fit:true">
				<div data-options="region:'center'" style="padding:10px;width:40%">
					<p id="errorwin_mess"></p>
				</div>
			</div>
		</div>
</html>
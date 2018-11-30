<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
double randomNum = Math.random();

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  	<head>
		<meta charset="UTF-8">
		<title></title>
 		<jsp:include page="../../include/css-main-include.jsp"></jsp:include>		
		<link rel="stylesheet" type="text/css" href="<%=path%>/resources/js/jquery-easyui-1.4/themes/metro/easyui.css">
		<link rel="stylesheet" type="text/css" href="<%=path%>/resources/js/jquery-easyui-1.4/themes/icon.css">
		<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/jquery-easyui-1.4/jquery.min.js"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/jquery-easyui-1.4/jquery.easyui.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=path%>/resources/js/jquery-easyui-1.4/themes/color.css">
		<style>
		.combobox-item-selected{width:100%; height:24px; clear:both}
		</style>
  	</head>
	<body style="width:100%;heighgtL100%;">
		<div class="easyui-layout" data-options="fit:true">
			<!-- 右边 参数列表-->
			<div data-options="region:'center',border:false">
				<div id="list_data_angnb_tb" style="padding:3px">
					<a href="javascript:void(0);" onclick="javascript:queryAngnbList();return false;" class="easyui-linkbutton c6" style="height: 20px;">刷新数据</a>
					<a href="javascript:void(0);" onclick="javascript:removeit();return false;" class="easyui-linkbutton c6" style="height: 20px;">删除</a>
					<a href="javascript:void(0);" onclick="javascript:append();return false;" class="easyui-linkbutton c6" style="height: 20px;">新增</a>
					<a href="javascript:void(0);" onclick="javascript:accept();return false;" class="easyui-linkbutton c6" style="height: 20px;">保存</a>
					<a href="javascript:void(0);" onclick="javascript:reject();return false;" class="easyui-linkbutton c6" style="height: 20px;">取消</a>
				</div>				
				<table id="list_data_angnb" cellspacing="0" cellpadding="0"></table>
			</div>			
			<!-- 下 -->		
		</div>
		<script type="text/javascript">
			var randomNu = (new Date().getTime()) ^ Math.random();//解决IE缓存问题
			var _editIndex = undefined;
			
			function queryAngnbList(){
	       		$('#list_data_angnb').datagrid('reload');//刷新
			}
			//新增表关系
			
			function  endEditing(){
				if (_editIndex == undefined){return true}
				if ($('#list_data_angnb').datagrid('validateRow', _editIndex)){
					$('#list_data_angnb').datagrid('endEdit', _editIndex);
					_editIndex = undefined;
					return true;
				} else {
					return false;
				}
			}	
		
			function append(){
				if (endEditing()){
					$('#list_data_angnb').datagrid('appendRow',{andm:''});
					_editIndex = $('#list_data_angnb').datagrid('getRows').length-1;
					$('#list_data_angnb').datagrid('selectRow', _editIndex).datagrid('beginEdit', _editIndex);
				}
			}	
			function accept(){
				if (endEditing()){
					var c = $('#list_data_angnb').datagrid('getChanges');
					var _data = {'data':c};
					if(c.length > 0){
						var url = '<%=path%>/ymqxgl/updOrAddAngnb?_'+randomNu;						
	 		       		$.ajax({
		         	        traditional:true,//这使json格式的字符不会被转码
		         	        type: "POST", 
			                contentType : 'application/json;charset=utf-8', //设置请求头信息
			                dataType:"json",
			                data:JSON.stringify(_data), //将Json对象序列化成Json字符串，JSON.stringify()原生态方法	         	        
		         	     	url:url,
		         	        success : function (data) {
		    					if (data.success){
		    						queryAngnbList();
		    						$('#list_data_angnb').datagrid('acceptChanges');	    						
									$.messager.alert('提示',data.message,'info');
		    					}else {
		    						$.messager.alert('提示',data.message,'info');
		    					}	         	        	
								console.log(data);
		         	        },
		         	        error : function (data){
		         	           console.log(data.responseText);
		         	        }
		         	    });						
					}
					_editIndex = undefined;
 		       		$('#list_data_angnb').datagrid("unselectAll"); 		       		
				}
			}
			function removeit(){
				var row = $('#list_data_angnb').datagrid("getSelected");
				console.log(row);
				if(row.andm == null || row.andm == ""){
					return ;
				}else {
 		       		$.ajax({
	         	        traditional:true,//这使json格式的字符不会被转码
	         	        //data: c,
	         	        type: "POST", 
		                //contentType : 'application/json;charset=utf-8', //设置请求头信息
		                dataType:"json",
		                data:{andm:row.andm}, //将Json对象序列化成Json字符串，JSON.stringify()原生态方法	         	        
	         	     	url:'<%=path%>/ymqxgl/delAngnb?_'+randomNu,
	         	        success : function (data) {
	    					if (data.success){
	    						queryAngnbList();
	    						$('#list_data_angnb').datagrid('acceptChanges');	    						
								$.messager.alert('提示',data.message,'info');
	    					}else {
	    						$.messager.alert('提示',data.message,'info');
	    					}	         	        	
							console.log(data);
	         	        },
	         	        error : function (data){
	         	           console.log(data.responseText);
	         	        }
	         	    });					
				}
				_editIndex = undefined;
		       	$('#list_data_angnb').datagrid("unselectAll"); 				
			}
			function reject(){
				$('#list_data_angnb').datagrid('rejectChanges');
				_editIndex = undefined;
			}				
			
			
			var _data_kfy = [{
		        "id":'1',
		        "text":"是"
		    },{
		        "id":'0',
		        "text":"否"
		    }];	
			var _data_tcfs = [{
		        "id":'iFrame',
		        "text":"iFrame"
		    },{
		        "id":'_blank',
		        "text":"_blank"
		    },{
		        "id":'_self',
		        "text":"_self"
		    },{
		        "id":'_parent',
		        "text":"_parent"
		    },{
		        "id":'_top',
		        "text":"_top"
		    }];	
			var _data_icon = [{
		        "id":'cz1_1',
		        "text":"<a class='cz_button cz1_1'></a>"
		    },{
		        "id":'cz1_2',
		        "text":"<a class='cz_button cz1_2'></a>"
		    },{
		        "id":'cz1_3',
		        "text":"<a class='cz_button cz1_3'></a>"
		    },{
		        "id":'cz1_4',
		        "text":"<a class='cz_button cz1_4'></a>"
		    },{
		        "id":'cz1_5',
		        "text":"<a class='cz_button cz1_5'></a>"
		    },{
		        "id":'cz1_6',
		        "text":"<a class='cz_button cz1_6'></a>"
		    },{
		        "id":'cz2_1',
		        "text":"<a class='cz_button cz2_1'></a>"
		    },{
		        "id":'cz2_2',
		        "text":"<a class='cz_button cz2_2'></a>"
		    },{
		        "id":'cz2_3',
		        "text":"<a class='cz_button cz2_3'></a>"
		    },{
		        "id":'cz2_4',
		        "text":"<a class='cz_button cz2_4'></a>"
		    },{
		        "id":'cz2_5',
		        "text":"<a class='cz_button cz2_5'></a>"
		    },{
		        "id":'cz2_6',
		        "text":"<a class='cz_button cz2_6'></a>"
		    },{
		        "id":'cz3_1',
		        "text":"<a class='cz_button cz3_1'></a>"
		    },{
		        "id":'cz3_2',
		        "text":"<a class='cz_button cz3_2'></a>"
		    },{
		        "id":'cz3_3',
		        "text":"<a class='cz_button cz3_3'></a>"
		    },{
		        "id":'cz3_4',
		        "text":"<a class='cz_button cz3_4'></a>"
		    },{
		        "id":'cz3_5',
		        "text":"<a class='cz_button cz3_5'></a>"
		    },{
		        "id":'cz3_6',
		        "text":"<a class='cz_button cz3_6'></a>"
		    },{
		        "id":'cz4_1',
		        "text":"<a class='cz_button cz4_1'></a>"
		    },{
		        "id":'cz4_2',
		        "text":"<a class='cz_button cz4_2'></a>"
		    },{
		        "id":'cz4_3',
		        "text":"<a class='cz_button cz4_3'></a>"
		    },{
		        "id":'cz4_4',
		        "text":"<a class='cz_button cz4_4'></a>"
		    },{
		        "id":'cz4_5',
		        "text":"<a class='cz_button cz4_5'></a>"
		    },{
		        "id":'cz4_6',
		        "text":"<a class='cz_button cz4_6'></a>"
		    },{
		        "id":'cz5_1',
		        "text":"<a class='cz_button cz5_1'></a>"
		    },{
		        "id":'cz5_2',
		        "text":"<a class='cz_button cz5_2'></a>"
		    },{
		        "id":'cz5_3',
		        "text":"<a class='cz_button cz5_3'></a>"
		    },{
		        "id":'cz5_4',
		        "text":"<a class='cz_button cz5_4'></a>"
		    },{
		        "id":'cz5_5',
		        "text":"<a class='cz_button cz5_5'></a>"
		    },{
		        "id":'cz5_6',
		        "text":"<a class='cz_button cz5_6'></a>"
		    },{
		        "id":'cz6_1',
		        "text":"<a class='cz_button cz6_1'></a>"
		    },{
		        "id":'cz6_2',
		        "text":"<a class='cz_button cz6_2'></a>"
		    },{
		        "id":'cz6_3',
		        "text":"<a class='cz_button cz6_3'></a>"
		    },{
		        "id":'cz6_4',
		        "text":"<a class='cz_button cz6_4'></a>"
		    },{
		        "id":'cz6_5',
		        "text":"<a class='cz_button cz6_5'></a>"
		    },{
		        "id":'cz6_6',
		        "text":"<a class='cz_button cz6_6'></a>"
		    }];		
			
			$(document).ready(function(){
				$('#list_data_angnb').datagrid({
					title:'', 
		       		border: true, 
		        	fit: true,//自动大小 
		        	fitColumns:true,
		    		url:'<%=path%>/ymqxgl/queryAngnbList?_'+randomNu,
		        	singleSelect:true,//是否单选 
		        	loadMsg:'数据加载中,请稍后...' ,
		        	toolbar: '#list_data_angnb_tb',
		        	queryParams: {},
		            onDblClickCell : function (index, field) {
		           		 //双击开启编辑行
		    			if (_editIndex != index){
		    				if (endEditing()){
		    					_editIndex = index;
		    					$('#list_data_angnb').datagrid('selectRow', index).datagrid('beginEdit', index);
		    					var ed = $('#list_data_angnb').datagrid('getEditor', {index:index,field:field});
		    					if (ed){
		    						($(ed.target).data('textbox') ? $(ed.target).textbox('textbox') : $(ed.target)).focus();
		    					}
		    				} else {
		    					setTimeout(function(){
		    						$('#list_data_angnb').datagrid('selectRow', _editIndex);
		    					},0);
		    				}
		    			}		                
		            },		        	
		    		columns:[[
						{field:'andm',title:'代码',align:'left',hidden:true}
						,{field:'xssx',title:'顺序',align:'center',width:'70px',editor:{type:'numberspinner',options:{required:true}}}
						,{field:'anmc',title:'按钮名称',align:'center',width:'70px',editor:{type:'textbox',options:{required:true}}}
						,{field:'kyf',title:'可用否',width:'70px',align:'center'
							,formatter:function(value,row){
								if(row.kyf == '1'){
									return "是";
								}else {
									return "否";
								}
							}							
							,editor:{
								type:'combobox',
								options:{
									valueField:'id',
									textField:'text',
									data:_data_kfy,
									editable:false,
									required:true
								}
							}							
						}						
						,{field:'title',title:'提示',align:'center',width:'150px',editor:{type:'textbox',options:{required:true}}}
						
						,{field:'icon',title:'图标',width:'80px',align:'center'
							,editor:{
								type:'combobox',
								options:{
									valueField:'id',
									textField:'text',
									data:_data_icon,
									editable:false,
									required:true
								}
							}								
						}
						
						,{field:'tcfs',title:'弹出方式',width:'70px',align:'center'
							,editor:{
								type:'combobox',
								options:{
									valueField:'id',
									textField:'text',
									data:_data_tcfs,
									editable:false,
									required:true
								}
							}							
						}
						,{field:'fwlj',title:'访问路径',width:'300px',align:'center',editor:{type:'textbox',options:{required:true}}}
		    		]]
		    	});				
				
			});
		</script>		
		
	</body>
</html>

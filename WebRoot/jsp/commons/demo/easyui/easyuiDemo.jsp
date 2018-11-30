<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html style="width:100%;heighgtL100%;">
  <head>
	<meta charset="UTF-8">
	<title>站群管理系统 - 欢迎来到站群管理系统</title>
	<jsp:include page="/jsp/include/jquery-eayui_include.jsp"/>
  </head>
<body>
	
	<table id="list_data" cellspacing="0" cellpadding="0"></table>  
	<script type="text/javascript">
		var randomNu = (new Date().getTime()) ^ Math.random();//解决IE缓存问题
		$('#list_data').datagrid({
			title:'easyui表格演示', 
        	iconCls:'icon-edit',//图标 
        	width: 700,
        	height: 'auto', 
        	nowrap: false, 
        	striped: true, 
       		border: true, 
        	collapsible:false,//是否可折叠的 
        	fit: true,//自动大小 
    		url:path+'/demo/queryNjListData?_'+randomNu,
    		remoteSort:false,  
        	idField:'nj', 
        	singleSelect:true,//是否单选 
        	pagination:true,//分页控件 
        	rownumbers:true,//行号
        	loadMsg:'数据加载中,请稍后...' ,
    		columns:[[
    			{field:'ck',checkbox:true},
    			{field:'NJ',title:'年级',width:240,sortable:true},
     			{field:'NJMC',title:'年级名称',width:70,align:'left',sortable:true},   			
    			{field:'KYF',title:'可用', width:30,align:'center',
    				formatter: function(value,row,index){
						if (row.KYF == '1'){
							return '是'
						} else {
							return '否';
						}
					}
				},
				{field:'opt',title:'操作', width:80,
    				formatter: function(value,row,index){   
                        var e = '<a href="#" mce_href="#" onclick="editRow(\''+ row.nj + '\',\''+ row.nj + '\')">编辑</a> ';  
                        return e;	
					}
				}
				
    		]],
    		toolbar: [{ 
            	text: '添加', 
            	iconCls: 'icon-add', 
            	handler: function() { 
                	
            	} 
        	}, '-',{ 
            	text: '删除', 
            	iconCls: 'icon-remove', 
            	handler: function(){ 
                	
            	} 
        	}]
    	});
		var p = $('#list_data').datagrid('getPager'); 
    	$(p).pagination({ 
    		pageSize: 10,//每页显示的记录条数，默认为10 
        	pageList: [5,10,15],//可以设置每页记录条数的列表 
        	beforePageText: '第',//页数文本框前显示的汉字 
        	afterPageText: '页    共 {pages} 页',
        	displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'
    	}); 
    	
    	
	</script>
</body>
</html>

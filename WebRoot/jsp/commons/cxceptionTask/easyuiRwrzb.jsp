<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html style="width:100%;heighgtL100%;">
  <head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" type="text/css" href="<%=path%>/resources/js/jquery-easyui-1.4/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/resources/js/jquery-easyui-1.4/themes/icon.css">
	<script type="text/javascript" src="<%=path%>/resources/js/jquery-easyui-1.4/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path%>/resources/js/jquery-easyui-1.4/jquery.easyui.min.js"></script>
  </head>
<body>
	<table id="list_data" cellspacing="0" cellpadding="0"></table>  
	<script type="text/javascript">
		var randomNu = (new Date().getTime()) ^ Math.random();//解决IE缓存问题
		$('#list_data').datagrid({
			title:'', 
        	iconCls:'icon-edit',//图标 
        	width: 700,
        	height: 'auto', 
        	nowrap: false, 
        	striped: true, 
       		border: true, 
        	collapsible:false,//是否可折叠的 
        	fit: true,//自动大小 
    		url:'<%=path%>/exceptionTaskController/queryRwrzb?rwid=${rwrzbJsonPage.rwid}&rwlx=${rwrzbJsonPage.rwlx}&_'+randomNu,
    		remoteSort:false,  
        	idField:'id', 
        	singleSelect:true,//是否单选 
        	pagination:true,//分页控件 
        	rownumbers:true,//行号
        	loadMsg:'数据加载中,请稍后...' ,
    		columns:[[
    			{field:'zxsj',title:'执行时间',width:240,sortable:true},
     			{field:'zxrdm',title:'执行人',width:70,align:'left',sortable:true},   
    			{field:'zxsql',title:'执行SQL',width:240,sortable:true},
     			{field:'yxhs',title:'影响行数',width:70,align:'left',sortable:true},     			
    		]]
    	});
		var p = $('#list_data').datagrid('getPager'); 
    	$(p).pagination({ 
    		pageSize: 10,//每页显示的记录条数，默认为10 
        	pageList: [5,10,15,50,100,500,1000],//可以设置每页记录条数的列表 
        	beforePageText: '第',//页数文本框前显示的汉字 
        	afterPageText: '页    共 {pages} 页',
        	displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'
    	}); 
    	
    	
	</script>
</body>
</html>

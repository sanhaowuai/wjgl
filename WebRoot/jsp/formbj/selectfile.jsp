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
	 
	<div id="impfile" data-options="root:false"     >导入</div>
	<div id="impfileroot" data-options="root:true"    >导入到跟目录</div>
	
</div>
  <div id="cc" class="easyui-layout" data-options="fit:true" >
    <!-- ====================================================================================================================== -->
    <div data-options="region:'west',title:'文件',split:true" style="width:400px;height:100%">
			<div   class="easyui-layout" data-options="fit:true,border:false" >
			    <div data-options="region:'north',border:false" style="overflow:hidden">
    	              <select id="datasourceName" data-options="fit:true,border:false"  class="easyui-combobox" prompt="数据源" style="width:100%;"></select>
			    </div>
			    <div data-options="region:'center',border:false" >
    	             <table id="sql_zxxb_list_data" cellspacing="0" data-options="fit:true,border:false"  cellpadding="0" class="easyui-treegrid"></table>
			    </div>
			</div>
	 </div>

	</div>
</body>
<script type="text/javascript">
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
		   
			onClickRow:function(row){
			 
			},
			onDblClickCell: function(index,node,value){
				if(node.id == "" || node.id == null){
					$.messager.alert('提示','请选择!','warning');
					return ;
				}else {
					var url=""
					if(node.sjqlx == '0' || node.sjqlx == '' ||node.sjqlx == null){
						url=''
							return false
					}else if(node.sjqlx == '1'){
						url=''
						   return false
					}else if(node.sjqlx == '2'){
						url='/Jsqlquery/htmlSelectCodeEngine/'+node.id
					
					}else if(node.sjqlx == '3' ||node.sjqlx == '4'){
						url='/Jsqlquery/htmlInsertCodeEngine?zxxb_id='+node.id
					   
					}else if(node.sjqlx == '5' ){
						url='/Jsqlquery/htmlTabCodeEngine?zxxb_id='+node.id;
					}else if(node.sjqlx == '6'){
						url='/Jsqlquery/htmlLayoutCodeEngine?zxxb_id='+node.id
					}else if(node.sjqlx == '7'){
						url='/Jsqlquery/htmlSelectCodeEngine/'+node.id;
					}
					
				}
				
				window.parent.seturl(url)
            },
			onLoadSuccess: function () {
				$('#sql_zxxb_list_data').treegrid('collapseAll')
			}
	 });
	  
  })
	function onImportZxxb(pid){
        
		var randomNu = (new Date().getTime()) ^ Math.random();//解决IE缓存问题
		 
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
				        	    url:"<%=path%>/ExportFile/imp?zxxb_id="+pid+"&r="+randomNu,
				        	    onSubmit: function(){
				        	        
				        	    },
				        	    success:function(data){
				        	        alert(data)
				        	    }
				        	});
					}
				},{
					text:'Close',
					handler:function(){
						
						
					}
				}]
	         })

	      
		}
		
	}
</script>
</html>
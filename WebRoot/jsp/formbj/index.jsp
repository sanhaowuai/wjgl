<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>表单设计器</title>
		<jsp:include page="/jsp/jsqlquery/include/jquery-eayui_include.jsp"/>
		<link href="<%=path%>/resources/js/treetable/stylesheets/jquery.treeTable.css" rel="stylesheet" type="text/css" />
		<link href="<%=path%>/resources/style/icon/icon.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=path%>/resources/js/treetable/javascripts/jquery.treeTable.js"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/formbj/jquery.edatagrid.js"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/formbj/javascriptmethod.js"></script>
</head>
<style>
/* .zujian ,.layoutTarget{ */
/*   border: dashed 1px #000 */
/* } */
table.zujian , td.zujian {
  border: solid 1px #ddd
}
td.selectedTD {
background: #ffffaa;
}

td.form-group{
  margin:2px;

}
.kv-avatar.form-group{
  margin:auto;

}
.layoutiframe.container-fluid{
   overflow:hidden;
   background:#fff;
   border:solid 1px #000 ;
}
.layoutiframe {
    border:1px solid #000;
    padding-top:5px;
    padding-bottom:5px;
    box-sizing:border-box;

}
.layoutiframe.row{
   background:#DDDDDD;
   overflow:hidden;
   border-left: 2px;
   border-right: 2px;

}
.layoutiframe .layoutiframe.row:not(:first-child){
   margin-top:5px;
}
td .radio-inline input[type="radio"] {
			 margin-left:1px;
 }
td .checkbox-inline input[type="checkbox"] {
			 margin-left:1px;
 }
.layoutiframe *[class*=col-]{
  // overflow:scroll;
   padding:4px;
   background:#eeeeee;
   border:solid  5px rgba(255, 255, 255, 0) ;
   box-shadow: 0px 0px 0px 1px #000 inset;
}

.layoutiframe td   *[class*=col-]{
   overflow:hidden;

   background:none;
   border:0px ;
   box-shadow: 0px 0px 0px 0px #000 inset;
}
/* .layoutiframe *[class*=col-]:first-child{ */

/*    border-left:solid 4px #fff ; */

/*  } */
/*  .layoutiframe *[class*=col-]:last-child{ */
/*     border-right:solid 4px #fff ; */
/* } */

.darg_tag{
 z-index:99999;
}
.control-label {
  text-align:left;
}

body{
-webkit-touch-callout: none; /* iOS Safari */
-webkit-user-select: none; /* Chrome/Safari/Opera */
-khtml-user-select: none; /* Konqueror */
-moz-user-select: none; /* Firefox */
-ms-user-select: none; /* Internet Explorer/Edge */
user-select: none; /* Non-prefixed version, currently
not supported by any browser */
}
.CodeMirror{
 Set height, width, borders, and global font properties here
  font-family: monospace;
  height: 100%;
  background:#FFFFEE
}
.CodeMirror pre {
  font-weight:bold;
  font-size: inherit;
}
/*          table{margin:10px 0 0;} */
/* 			td,th{border: 1px solid #ddd;color: #787878;padding: 6px;} */
/* 			label{color: #787878;margin-right:5px;} */
.kv-avatar .krajee-default.file-preview-frame,.kv-avatar .krajee-default.file-preview-frame:hover {
    margin: 0;
    padding: 0;
    border: none;
    box-shadow: none;
    text-align: center;
}
.kv-avatar .file-input {
    display: table-cell;
    max-width: 220px;
}
.kv-reqd {
    color: red;
    font-family: monospace;
    font-weight: normal;
}
DIV.checkbox {
 padding: 0px 5px 0px 0px;
}
DIV.radio {
 padding: 0px 5px 0px 0px;
}
.selectdzujian{
   background:#ffffaa;
}
DIV.clickzujian{
   border:'1px solid #FFDDDD';
}
.formtitlebackground{
 background:#eeeeee;
 text-align:center
}
.panletable{margin:0 auto}
</style>
<body>
<div id="targetsetdialog"  class="easyui-dialog"  closed="true"  >Dialog Content.</div>
	<div id="styleEdit" class="easyui-dialog" closed="true" title="编辑样式" style="width:850px;height:450px;"
	       data-options="iconCls:'icon-save',resizable:true,modal:true">
		     <div id="cc" class="easyui-layout" data-options="fit:true" style="width:600px;height:400px;">

			    <div id="styleselectlist" data-options="region:'west',title:'West',split:true" style="width:300px;">
			    </div>
			    <div data-options="region:'center',fit:true,title:'center title'"  >
				    <div id="editTagPreview" class="easyui-panel" title="预览" style="width:100%;height:250px;background:#fafafa;"  >
		           </div>
			       <input class="editclass easyui-tagbox"   data-options="valueField: 'id',
									textField: 'text',
									//groupField: 'type',
									limitToList: true,
									hasDownArrow: true,
									labelWidth:40,
									label:'已选',
									prompt: 'Select a class'" style="width:100%">
					    </div>
			</div>
	</div>
    <div id="tabmm" class="easyui-menu" style="width:120px;">
         <div id="mm-tabclose" data-options="name:1">关闭</div>
        <div id="mm-tabcloseall" data-options="name:2">全部关闭</div>
        <div id="mm-tabcloseother" data-options="name:3">关闭其他</div>
<!--         <div class="menu-sep"></div> -->
<!--         <div id="mm-tabcloseright" data-options="name:4">当前页右侧全部关闭</div> -->
<!--         <div id="mm-tabcloseleft" data-options="name:5">当前页左侧全部关闭</div> -->

    </div>


        <div id="tab-tools" style="display:none">
	        <a id="" href="#" class="editbutton layoutbutton easyui-linkbutton power" style="display:none" onClick="queryyulan()">预览</a>
	        <a id="" href="#" class="tabsbutton easyui-linkbutton " style="display:none" onClick="queryyulan()">预览</a>
	        <a id="" href="#" class="editbutton easyui-linkbutton"  style="display:none"onClick="saveform()" >保存表单</a>
	        <a id="" href="#" class="tabsbutton layoutbutton easyui-linkbutton"  style="display:none"onClick="saveform()" >保存</a>
	        <a id="" href="#" class="editbutton easyui-linkbutton"  style="display:none" onClick="tjform()"  >添加字段</a>
	        <a id="" href="#" class="editbutton easyui-linkbutton"  style="display:none" onClick="editformstyle1()"  >分列表单</a>
	        <a id="" href="#" class="editbutton easyui-linkbutton"  style="display:none" onClick="editformstyle2()"  >单列表单</a>
	        <a id="" href="#" class="editbutton easyui-linkbutton"  style="display:none" onClick="addzujian()"  >添加空白组件</a>
	        <a id="" href="#" class="tabsbutton easyui-linkbutton"  style="display:none" onClick="addwebtabs()"  >添加选项卡</a>
	        <a id="" href="#" class="tabsbutton easyui-linkbutton"  style="display:none" onClick="delwebtabs()"  >删除选项卡</a>
        	<a id="btn" href="#" class="editbutton layoutbutton easyui-linkbutton"  style="display:none" onClick="bhdyg()"  >合并单元格</a>
        	<a id="btn" href="#" class="editbutton layoutbutton easyui-linkbutton"  style="display:none"  onClick="addbj()" >添加布局</a>
        	<a id="btn" href="#" class="editbutton layoutbutton easyui-linkbutton"  style="display:none"  onClick="addtag()" >添加标签</a>
	     </div>

                <div id="menu" class="easyui-menu" >
				    <div id="m-selectPanert">选择父标签</div>
				    <div id="m-delete">删除</div>
				    <div id="m-kuolie">扩列</div>
				    <div id="m-deleteall">全部删除</div>
			    </div>

<div id="addform" style="display:none">
  <table id="addformcol" cellspacing="0" cellpadding="0"></table>
 </div>
<div id="addkbzj" style="display:none">
  <div>
     <input class="easyui-textbox" id="_addzjname" data-options="label:'Name'" style="width:300px"/>
    </div>
     <div>
     <input class="easyui-textbox" id="_addzjtext" data-options="label:'Text'" style="width:300px"/>
     </div>
</div>

<div id="mtckdygx" style="display:none">
         <table id="mtckdygxpropertygrid"  class="easyui-propertygrid" data-options="showGroup:true"  >
		 </table>
</div>
<div id="importfile" style="display:none">
         <form id="impform" method="post" enctype="multipart/form-data">
             <input class="easyui-filebox"  name="impfile" style="width:300px">
         </form>


</div>

 <div id="yulan" class="easyui-window" title="预览" style="width:600px;height:400px"
        data-options="iconCls:'icon-save',closed:true,modal:true">
    Window Content
</div>
		<div id="mmTatget" class="easyui-menu" style="width:120px;display:none">

		</div>
		<div id="mm" class="easyui-menu">
	<div id="_onaddSqlZxxb" onclick="onaddSqlZxxb()" data-options="iconCls:'icon-add'">添加子信息</div>
	<div id="copyZxxb" onclick="copyZxxb()" data-options="iconCls:'icon-add'">功能复制</div>
	<div  id="onqueryID_" onclick="onqueryID()" data-options="iconCls:'icon-info'">获取ID</div>
	<div id="onupdSqlZxxb_" onclick="onupdSqlZxxb()" data-options="iconCls:'icon-edit'">修改</div>
	<div id="ondelSqlZxxb_" onclick="ondelSqlZxxb()" data-options="iconCls:'icon-del'">删除</div>
	<div id="expfile" onclick="onExportZxxb()"  >导出</div>
	<div id="impfile" onclick="onImportZxxb()"  >导入</div>
	<div id="impfileroot" data-options="fun:'improot'">导入到跟目录</div>
	<div id="exportAll" onclick="onExportZxxbAll()">导出全部数据</div>

</div>
<div id="mm2" class="easyui-menu">
       <div onclick="onaddSqlZxxb()" data-options="iconCls:'icon-add'">添加子信息</div>
</div>
<div id="mm3" class="easyui-menu">
       <div onclick="onqueryID()" data-options="iconCls:'icon-info'">获取ID</div>
</div>
<div id="sql_zxxb_list_data_window" class="easyui-window" title="添加/修改" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:410px;height:340px;padding:10px;">
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center'" style="padding:10px;" class="easyui-panel">
				 <div style="padding:0px 0px 0px 0px">
    			<form id="sql_zxxb_list_data_ff" class="easyui-form" method="post" data-options="novalidate:true">
    				<input type="hidden" name="id" id="sql_zxxb_list_data_ff_id"/>
    				<input type="hidden" name="lx" id="sql_zxxb_list_data_ff_lx" value="3"/>
    				<input type="hidden" name="mc_1" id="sql_zxxb_list_data_ff_mc"/>
    				<input type="hidden" name="zt" id="sql_zxxb_list_data_ff_zt"/>
    				<table cellpadding="0">
    					<tr>
    						<td><span style="font-size: 14px;">上级:</span></td>
    						<td>
    							<select id="zxxbsj" class="easyui-combogrid" name="pid" data-options="required:true,missingMessage:'必选'" style="width:200px;"></select>
    						</td>
    					</tr>
    					<tr>
    						<td><span style="font-size: 14px;">类型:</span></td>
    						<td>
    							<select id="sjqlx" class="easyui-combogrid" name="sjqlx" data-options="required:true,missingMessage:'必选'" style="width:200px;">
    							    <option value="0" >文件夹</option>
    							    <option value="1" >属性区</option>
    							    <option value="2" >列表区</option>
    							    <option value="3" >表单区</option>
    							    <option value="4" >表单区（1对n表）</option>
    							    <option value="5" >选项卡</option>
    							    <option value="6" >分区页</option>
    							    <option value="7" >树形表格</option>
    							</select>
    						</td>
    					</tr>
      					<tr>
    						<td><span style="font-size: 14px;">页面样式:</span></td>
    						<td>
    							<select id="ymcss" class="easyui-combogrid" name="ymcss" data-options="required:false" style="width:200px;">
    							    <option value="3">默认风格</option>
    							    <option value="1">绿色风格</option>
    							    <option value="2">桔红风格</option>
    							</select>
    						</td>
    					</tr>
    					<tr>
    						<td><span style="font-size: 14px;">名称:</span></td>
    						<td><input class="easyui-textbox" style="width:200px;" type="text" name="mc" data-options="required:true,missingMessage:'必填'"></input></td>
    					</tr>
      					<tr>
    						<td><span style="font-size: 14px;">工作流业务代码:</span></td>
    						<td>
								<select id="gzl_ywlcdm" data-options="required:false"  name="gzl_ywlcdm" class="easyui-combobox" style="width:200px;"></select>
    						</td>
    					</tr>
    				</table>
    			</form>
    		</div>
		</div>
		<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="javascript:submitFormSqlZxxb()" style="width:80px">保存</a>
			<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="javascript:$('#sql_zxxb_list_data_window').window('close')" style="width:80px">关闭</a>
		</div>
	</div>
</div>
<!-- ========================================================================================================================== -->

  <div id="cc" class="easyui-layout" data-options="fit:true" >
<!--      <div data-options="region:'north',buttons:'#mtoolbar' " style="height:30px;"> -->
<!--            上区 -->
<!--      </div> -->

    <!-- ====================================================================================================================== -->
    <div data-options="region:'west',title:'项目',split:true" style="width:200px;height:100%">
			<div   class="easyui-layout" data-options="fit:true,border:false" >
			    <div data-options="region:'north',border:false" style="overflow:hidden">
    	              <select id="datasourceName" data-options="fit:true,border:false"  class="easyui-combobox" prompt="数据源" style="width:100%;"></select>
			    </div>
			    <div data-options="region:'center',border:false" >
    	             <table id="sql_zxxb_list_data" cellspacing="0" data-options="fit:true,border:false"  cellpadding="0" class="easyui-treegrid"></table>
			    </div>
			</div>
    </div>

	<div data-options="region:'center',title:'',border:false"   >
<!-- 	   <div class="easyui-panel" title="Head on Left" halign="left" titleDirection="up" style="width:700px;height:120px;"> -->
<!-- 	   </div> -->
		<div id="tt_tabs" class="easyui-tabs"  pill="true" narrow="true" tools='#tab-tools'  style="height:100%" >
		</div>
	</div>
	</div>
</body>


 <script type="text/javascript">


    var $_selectthis

    var jspath='<%=path%>'
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
    function editformstyle1(){
    	   var  $tab = $('#tt_tabs').tabs('getSelected');
    	        $tab.find('table.zujian').find('td').each(function(i,dom){
    	        	if($(dom).find('.form-group').size()>0){

    	        		if ($(dom).find('label').is(':visible')){
    	        			if($(dom).find('input,select,textarea').is('[type=radio],[type=checkbox]')){
    	        				var $newtd=$('<td class="zujian grid formtitlebackground" ></td>')
		    	        		var $label=$(dom).find('label').eq(0).clone()
    	        				$label.removeAttr('for')
		    	        		$label.addClass('zujian')
		    	        		$newtd.append($label.removeClass('col-sm-3'))
		    	        		$(dom).find('label').eq(0).hide()
		    	        		$(dom).find('label')
		    	        		$(dom).find('.form-control')
		    	        		.parent()
		    	        		.removeClass('col-sm-9')
		    	        		.addClass('col-sm-12')
		    	        		$(dom).before($newtd)

    	        			}else{
		    	        		var $newtd=$('<td class="zujian grid formtitlebackground" ></td>')
		    	        		var $label=$(dom).find('label').clone()
		    	        		$label.removeAttr('for')
		    	        		$label.addClass('zujian')
		    	        		$newtd.append($label.removeClass('col-sm-3'))
		    	        		$(dom).find('label').hide()
		    	        		$(dom).find('label')
		    	        		$(dom).find('.form-control')
		    	        		.parent()
		    	        		.removeClass('col-sm-9')
		    	        		.addClass('col-sm-12')
		    	        		$(dom).before($newtd)
    	        			}


    	        		}
    	        	}

    	        })
    }

    function editformstyle2(){
    	   var  $tab = $('#tt_tabs').tabs('getSelected');
    	        $tab.find('table.zujian').find('td').each(function(i,dom){
    	        	if($(dom).find('.form-group.selectedZuJian').size()>0){
    	        		$(dom).find('label').eq(0).show();
    	        		$(dom).find('label').eq(0).next().removeClass('col-sm-12').addClass('col-sm-9')
    	        	}
    	        })
    }

    function addzujian(){
    	//addkbzj
     $('#addkbzj').dialog({
    		title: '添加空白组件',
    	    width: 400,
    	    height: 200,
    	    buttons:[{
				text:'Save',
				handler:function(){
					   var  $tab = $('#tt_tabs').tabs('getSelected');
					   var html=v_Bootstrap_input2_text_html()
 						var $dom=$(html)
 						$dom.find('label').find('span').text($('#_addzjtext').textbox('getValue'))
 						$dom.find('input').attr('name',$('#_addzjtext').textbox('getValue'))
                        $tab.find('.mtarget').find('form').append($dom)
				}
			}]

     })
  }

    function addwebtabs(){
    	var num = Math.random()*700 + 800;
    	    num = parseInt(num, 10);
    	 var  $tab = $('#tt_tabs').tabs('getSelected');

    	 var  _tabmain=''
         if($tab.find('.nav-tabs').size()==0){
        	 _tabmain+=  '<ul class="nav nav-tabs" role="tablist">'
        	 _tabmain+=  '</ul>'
        	 _tabmain+=  ' <div class="tab-content" style="width:100%;height:100%">'
        	 _tabmain+=  '</div>'

         }
    	 $tab.find('.form-horizontal').append($(_tabmain))
    	 var  $b_tabs=$tab.find('.nav-tabs')
    	 var  $tab_content=$tab.find('.tab-content')
    	 var  _li =''
			  _li += '  <li role="presentation" class="">'
			  _li += '         <a href="#FRAME'+num+'" aria-controls="home" role="tab" data-toggle="tab" aria-expanded="false" sjdjdz="70E918B310E64998A89CB1E7E4E7F14F">new</a>'
			  _li += '  </li>'
    	     $b_tabs.append(_li)
    	 var _div=''
			 _div+='<div role="tabpanel" class="tab-pane" id="FRAME'+num+'" style="width:100%;height:100%">'
			 _div+='<iframe class="tab" src="" border="0" style="width:100%;height:100%;border:0px" zxxb_id="FRAME'+num+'"/>'
			 _div+='</div>'
		     $tab_content.append(_div)
    }

    function delwebtabs(){

    	$('.active').remove()
    }
    function selectdygx(){
	     $('#mtckdygx').dialog({
	    		title: '模态窗口设置',
	    	    width: 400,
	    	    height: 500,
	    	    buttons:[{
					text:'Save',
					handler:function(){
						   var $tab = $('#tt_tabs').tabs('getSelected');
						   var data = $('#mtckdygxpropertygrid').propertygrid('getData').rows
						   var $_button = $_selectthis.find('.input-group-addon').find('.sbutton')
						   var len = data.length;
						   for(var i=(len-1);i>=0;i--){
							   delete data[i]['editor']
							   if(data[i]['value']=='' || data[i]['value'] == null){
								   data.splice(i,1);
							   }
						   }

						   $_button.attr('_data',JSON.stringify(data))

						    $('#mtckdygx').dialog('close')
					}
				}],
	          onOpen:function(){
	        	    var data=new Array()
	        		var _data=new Array()
	        		_data.push({value:'',name:'无'})
	        		var  $tab = $('#tt_tabs').tabs('getSelected');
	        		 $tab.find('form').find('.form-group').each(function(i,dom){
	        				var $o =  $(dom).find('input,select,textarea').eq(0)
	        				_data.push({value:$o.attr('name'),name:$(dom).find('label').find('span').text()})
	        		})
	        		var $_button = $_selectthis.find('.input-group-addon').find('.sbutton')
	        		var olddata=eval('('+$_button.attr('_data')+')')
	        		var w_id=$_button.attr("sjdjdz")
	        			 var coldata=new Array()
						 $.ajax({
							    async:false,
						        url: jspath+'/Jsqlquery/queryModelWindowsById',
						        data:{id:w_id},
						        success: function(result){
						        	coldata = result;
						        	$.each(result,function(i,datas){
						        		var _d =new Array()
						        		if (olddata != undefined ){
							        	var _d = $.grep(olddata,function(da,i){
								        	return	da.field==datas.value
								        	})
						        		}
								        	var defvalue
								        	if (_d.length>0){
								        		defvalue=_d[0].value
								        	}
							        	    if(defvalue==undefined){
							        	    	defvalue=''
							        	    }
						        		   data.push( { "name": ""+datas.name+"", "group": "属性", "value": ""+ defvalue +"","field": ""+datas.value+"",  "editor": { "type": 'combobox',
						        			"options": {
						        				valueField:'value',
						        				textField:'name',
						        				data:_data
						        	    	    }}})
						        	})

							   },
						       dataType: 'JSON'
						   });

	        		  $('#mtckdygxpropertygrid').propertygrid({
	        			  fitColumns:true,
	        				columns:[[
	        					{field:'name',title:'返回值' ,formatter: function(value,row,index){
	        						return value
	        					}
	        					},
	        					{field:'value',title:'组件' ,width:80,
	        						formatter: function(value,row,index){
	        							var _map
	        							if(row.editor!=undefined){
	        							   if(row.editor.options.data!=undefined){
	        								     _map=$.grep(row.editor.options.data,function(obj,i){
	        									   return obj.value==value || obj.id==value
	        								   })
	        						        if (_map.length>0){
	        								return _map[0].name;
	        							    }else{
	        							    	return value;
	        							    }
	        							   }
	        							}

	        							return value;
	        						}
	        					}
	        				]]
	        			});


	        	  $('#mtckdygxpropertygrid').propertygrid('loadData',  data)

	          }
	     })

	}
    function selectcxcsdygx(value){
    	 var  $tab = $('#tt_tabs').tabs('getSelected');
    	 var coldata=new Array()
    	 var $sel_iframe=$tab.find('.clickzujian.selectedZuJian').eq(0)
    	 var  iframesrc= $sel_iframe.attr('iframesrc')
    	 var  datasourceName=$('#datasourceName').combobox('getValue')
    	 var  targets=eval('('+$sel_iframe.attr("targets")+')')

    	 			 $.ajax({
							    async:false,
						        url: jspath+'/Jsqlquery/queryModelWindowsById',
						        data:{id:iframesrc },
						        success: function(result){
						        	coldata = result;
							    },
						       dataType: 'JSON'
						   });
	     $('#mtckdygx').dialog({
	    		title: '子窗口查询设置',
	    	    width: 400,
	    	    height: 500,
	    	    buttons:[{
					text:'Save',
					handler:function(){
						   var  $tab = $('#tt_tabs').tabs('getSelected');
						   var data = $('#mtckdygxpropertygrid').propertygrid('getData').rows
						   var len = data.length;
						   for(var i=(len-1);i>=0;i--){
							   delete data[i]['editor']
							   if(data[i]['value']=='' || data[i]['value'] == null){
								   data.splice(i,1);
							   }
						   }


						   jQuery.extend( targets["_"+value], {"duiying":data});

						   $sel_iframe.attr('targets',JSON.stringify(targets))
						   $('#mtckdygx').dialog('close')
					}
				}],
	          onOpen:function(){
	        	    var data=new Array()
	        		var _data=new Array()
	        		_data.push({value:'',name:'无'})
	        		var  $tab = $('#tt_tabs').tabs('getSelected');


						 $.ajax({
							    async:false,
						        url: jspath+'/Jsqlquery/cxtjb',
						        data:{zxxb_id:value},
						        success: function(result){

						        	$.each(result,function(i,datas){


								        	var defvalue
								        	var l=new Array()
								        	if (targets["_"+value]!=undefined && targets["_"+value].duiying!=undefined){

								        	  l=$.grep( targets["_"+value].duiying ,function(dd,i){

								        		return datas.sxdm==dd.field
								        	})
								        	if (l.length>0){
								        		defvalue=l[0].value
								        	}
								        	}
							        	    if(defvalue==undefined){
							        	    	defvalue=''
							        	    }
								        	   if (datas.sxdm!=null){
						        		       data.push( { "name": ""+datas.bt+"",   "value": ""+ defvalue +"","field": ""+datas.sxdm+"",  "editor": { "type": 'combobox',
						        			   "options": {
						        				valueField:'value',
						        				textField:'name',
						        				data:coldata
						        	    	    }}})
								        	   }
						        	})

							   },
						       dataType: 'JSON'
						   });
	        		  $('#mtckdygxpropertygrid').propertygrid({
	        			  fitColumns:true,
	        				columns:[[
	        					{field:'name',title:'查询条件' },
	        					{field:'field',title:'属性名称',hidden:true },
	        					{field:'value',title:'列表字段' ,width:80,
	        						formatter: function(value,row,index){
	        							var _map
	        							if(row.editor!=undefined){
	        							   if(row.editor.options.data!=undefined){
	        								     _map=$.grep(row.editor.options.data,function(obj,i){
	        									   return obj.value==value || obj.id==value
	        								   })
	        						        if (_map.length>0){
	        								return _map[0].name;
	        							    }else{
	        							    	return value;
	        							    }
	        							   }
	        							}

	        							return value;
	        						}
	        					}
	        				]]
	        			});

	        		  $('#mtckdygxpropertygrid').propertygrid('loadData',[])

	        	  $('#mtckdygxpropertygrid').propertygrid('loadData',  data)

	          }
	     })

	}
	function addbj(){
		var  $tab = $('#tt_tabs').tabs('getSelected');
		$tab.find('.mtarget').find('selectedZuJian');
		var sjqlx=$tab.panel('options').row.sjqlx
        var html='<table rows="2" cols="2" cellspacing="0" cellpadding="0" class="  zujian panletable selectedZuJian"   border="0"  >'
        	html+=' <tbody>'
           	html+='<tr class="zujian">'
        	html+='  <td class="zujian grid" style="width:260px;height:30px" ></td>'
        	html+='  <td class="zujian grid" style="width:260px;height:30px"></td>'
        	html+=' </tr>'
        	html+='<tr class="zujian">'
        	html+='  <td class="zujian grid" style="width:260px;height:30px" ></td>'
        	html+=' <td class="zujian grid"  style="width:260px;height:30px" ></td>'
        	html+=' </tr>'
        	html+='</tbody>'
        	html+='</table>'
		    if  (sjqlx=='6'	){
		       var $selectedZuJian = $tab.find('.selectedZuJian')
		           var name="N"+getIdName()
				   html='<div name="'+name+'" class="layoutiframe  layoutTarget" > </div>'
			   if ($selectedZuJian.size()==0){
				   $tab.find('.mtarget').find('form').append($(html))
			   }else{
				   $selectedZuJian.append($(html))
			   }
		    }else{
			     $tab.find('.mtarget').find('form').append($(html))
		    }

        }
	function addtag(){
		var  $tab = $('#tt_tabs').tabs('getSelected');
	       var $selectedZuJian = $tab.find('.selectedZuJian')
           var name="N"+getIdName()
		   html='<div class="tag zujian alert  alert-danger">'
		   html+='<div class="media">'
		   html+='<div class="icons media-left media-top">'
		   html+=' <p style=" font-size:3em" class="glyphicon glyphicon-user"/>	'
		   html+='		   </div>'
		   html+='		   <div class="media-body">'
		   html+='		     <h4 class="media-heading">标题</h4>'
		   html+='<p>提示内容，维护说明文字</p>'
		   html+='</div>'
		   html+='</div>'
		   html+='</div>'

	   if ($selectedZuJian.size()==0){
		   $tab.find('.mtarget').find('form').append($(html))
	   }else{
		   $selectedZuJian.append($(html))
	   }

        }
	function tjform(){
    	$('#addform').dialog({
    		title: '选择字段',
    	    width: 400,
    	    height: 500,
    	    closed: false,
    	    cache: false,
    	    modal: true,
    	    buttons:[{
				text:'确定',
				handler:function(){
					   var data=[{name:'xh',text:'学号'},{name:'xm',text:'姓名'},{name:'xb',text:'性别'},{name:'bj',text:'班级'}]

					   var  $tab = $('#tt_tabs').tabs('getSelected');
	    			   var row=$tab.panel('options').row
					   var  $tab = $('#tt_tabs').tabs('getSelected');
					   var rows= $('#addformcol').datagrid('getSelections')
					   	$tab.find('.mtarget').find('form').find('[name]').each(function(i,dom){
			    				 var _name= $(dom).attr('name')

			    				 var rs= $.grep(rows,function(row,i){

			    					 return  (row.bm+'_'+row.col==_name)
			    				 })
			    				 if(rs.length==0){
			    					 $(dom).parents('.form-group').remove()
			    				 }
			    	    })
					   $.each(rows,function(i,r){
						if($tab.find('.mtarget').find('form').find('[name='+r.bm+'_'+r.col+']').size()==0){
							var html=v_Bootstrap_input2_text_html()
	   						var $dom=$(html)
	   						$dom.find('label').find('span').text(r.colzs)
	   						$dom.find('input').attr('name',r.bm+'_'+r.col)
	                        $tab.find('.mtarget').find('form').append($dom)
						 }
					    })
					   $('#addform').dialog('close')
				}
			},{
				text:'关闭',
				handler:function(){
					$('#addform').dialog('close')
				}
			}],
			onOpen:function(){
				 // var row= $('#sql_zxxb_list_data').treegrid('getSelected')
				  var  $tab = $('#tt_tabs').tabs('getSelected');
	    		  var row=$tab.panel('options').row
					$('#addformcol').datagrid({
			       		border: true,
			       		title:'',
			        	fit: true,//自动大小
			        	fitColumns:true,
			    		url:'<%=path%>/Jsqlquery/querySqlYwbColListData?_'+randomNu,
			    		queryParams:{'zxxb_id':row.pid},
			        	loadMsg:'数据加载中,请稍后...' ,
			    		columns:[[
			    			 {field:'ck',checkbox:true}
			    			,{field:'zxxb_id',title:'zxxb_id',align:'center',hidden:true}
							,{field:'sx',title:'显示顺序',align:'center',width:'50px',editor:{type:'numberspinner',options:{required:true}},hidden:true}
							,{field:'tjsql',title:'条件',align:'center',width:'80px',hidden:true}
							,{field:'bm',title:'列名',align:'left',width:'150px'
								,formatter:function(value,row){
									return row.bm+"."+ row.col+"["+row.colzs+"]";
								}
							}
							,{field:'tjsql2',title:'筛选器',align:'center',width:'80px',hidden:true}
							,{field:'mrz',title:'默认值',align:'center',width:'80px',hidden:true}
	 						,{field:'col',title:'列名',align:'center',width:'100px',hidden:true}
							,{field:'colzs',title:'列注释',align:'center',width:'100px',hidden:true}
							,{field:'colbm',title:'列别名',align:'center',width:'100px',editor:{type:'textbox',options:{required:false}}}

							,{field:'jggs',title:'输出公式',align:'center',width:'80px',hidden:true}
							,{field:'sffz',title:'是否分组',align:'center',width:'80px',hidden:true}
							,{field:'pxlx',title:'排序类型',align:'center',width:'80px',hidden:true}
							,{field:'pxsx',title:'排序顺序',align:'center',width:'80px',hidden:true}
							,{field:'sfxz',title:'是否新增',align:'center',width:'60px',hidden:true}
			    		]],
			    		onLoadSuccess:function(){
			    			 var  $tab = $('#tt_tabs').tabs('getSelected');
			    			 $tab.find('.mtarget').find('form').find('[name]').each(function(i,dom){
			    				 var _name= $(dom).attr('name')
			    				 var pageRows=$('#addformcol').datagrid('getRows')
			    				 $.each(pageRows,function(i,row){
			    					 if (row.bm+'_'+row.col==_name){//
			    						 var _indexrow=$('#addformcol').datagrid('getRowIndex',row)
			    						 $('#addformcol').datagrid('selectRow',_indexrow)
			    					 }
			    				 })
			    			 })

			    		}
			    	});
			}
    	  }
    	)
    }

	function saveform(){
 	   $('.selectedTD').removeClass('selectedTD')
 	   var  $tab = $('#tt_tabs').tabs('getSelected');
		  // var row= $('#sql_zxxb_list_data').treegrid('getSelected')
		    var  $tab = $('#tt_tabs').tabs('getSelected');
	        var row=$tab.panel('options').row

 	     	var myTextarea = $tab.find('.template')[0];
//  	        var _CodeMirrorEditor = CodeMirror.fromTextArea(myTextarea, {
//                mode: {
//                    name: "text/html"
//                },
// 			    lineNumbers: true
// 	        })

		    var param={
				   zxxb_id:row.id,
				   html_code:$tab.find('.mtarget').find('form').html()
		   }
		   $.ajax({
	  	        dataType: "json",
	  	        data: param,
	  	        type: "POST",
	  	        url: '<%=path%>/Jsqlquery/updZxxbHtmlCode',
	  	        success : function (data) {
	  	        	$.messager.alert('提示','保存成功');
	  	        }
	  	    });
 }

	function bhdyg(){
	    if(str+std+etr+etd!=0 && $(v_this)[0]!=undefined){
		    if($(v_this)[0].tagName=='TABLE'){
		    	  $(v_this).find('tr:eq('+str+') > td:eq('+std+')').html(' ').attr('colspan',etd-std+1).attr('rowspan',etr-str+1).removeClass('selectedTD')
		    	  $(v_this).find('.selectedTD').hide()
		    	  var c_row=$(v_this).find('tr:gt('+(str)+'):lt('+(etr-str)+'),tr:eq('+(str)+')')
		    }else if  ($(v_this)[0].tagName=='TH' ||$(v_this)[0].tagName=='TD' ||$(v_this)[0].tagName=='TR') {
		    	 $(v_this).parents('table').find('tr:eq('+str+') > td:eq('+std+')').html(' ').attr('colspan',etd-std+1).attr('rowspan',etr-str+1).removeClass('selectedTD')
		   		 $(v_this).parents('table').find('.selectedTD').hide()
		    }
     }
	$('.selectedTD').removeClass('selectedTD')
    str=0
    std=0
    etr=0
    etd=0
}
 var randomNu = (new Date().getTime()) ^ Math.random();//解决IE缓存问题
	function queryyulan(){
		//var row= $('#sql_zxxb_list_data').treegrid('getSelected')
		var  $tab = $('#tt_tabs').tabs('getSelected');
	    var row=$tab.panel('options').row
		var content
		if (row.sjqlx=='3' ||row.sjqlx=='4'  ){
			content='<iframe style="width:100%;height:100%" src="<%=path%>/Jsqlquery/htmlInsertCodeEngineByYl?zxxb_id='+row.id+'"/>'
		}else if (row.sjqlx=='5') {
			content='<iframe style="width:100%;height:100%" src="<%=path%>/Jsqlquery/htmlTabCodeEngine?zxxb_id='+row.id+'"/>'
		}else if (row.sjqlx=='2') {
			content='<iframe style="width:100%;height:100%" src="<%=path%>/Jsqlquery/htmlSelectCodeEngine/'+row.id+'"/>'
		}else if (row.sjqlx=='6') {
			content='<iframe style="width:100%;height:100%" src="<%=path%>/Jsqlquery/htmlLayoutCodeEngine?zxxb_id='+row.id+'"/>'
		}else if (row.sjqlx=='7') {
			content='<iframe style="width:100%;height:100%" src="<%=path%>/Jsqlquery/htmlSelectCodeEngine/='+row.id+'"/>'
		}
		$('#yulan').window({
		    width:600,
		    height:400,
		    modal:true,
		    closed:false,
		    content:content
		});
	}
 var CodeMirrorEditor;
	function onDatasourceName(){

		$("#sql_zxxb_list_data").treegrid("reload",{'sjymc':$('#sql_zxxb_list_data_ff_sjymc').val(),'power':'${power}'});
	}
	$('#sql_zxxb_list_data').treegrid({
	    url:'<%=path%>/Jsqlquery/querySqlZxxbListData3ForPower',
		queryParams:{'sjymc':$('#sql_zxxb_list_data_ff_sjymc').val(),'power':'${power}'},
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
			$('#mm').menu('showItem', $('#_onaddSqlZxxb')[0]);
			$('#mm').menu('showItem', $('#copyZxxb')[0]);
			$('#mm').menu('hideItem', $('#expfile')[0]);
			$('#mm').menu('hideItem', $('#impfile')[0]);
			$('#mm').menu('hideItem', $('#impfileroot')[0]);
			$('#mm').menu('hideItem', $('#exportAll')[0]);
			var rowid = row.id;


			if(rowid != '0'){
				if(row.sjqlx != '1' && row.sjqlx != '0'){
					$('#mm').menu('hideItem', $('#_onaddSqlZxxb')[0]);
					$('#mm').menu('hideItem', $('#copyZxxb')[0]);
				}

				$(this).treegrid('select', row.id);
				if('${power}' == 'user'){
					$('#mm3').menu('show',{
						left: e.pageX,
						top: e.pageY
					});
				}else {
					$('#mm').menu('showItem', $('#copyZxxb')[0]);
					$('#mm').menu('showItem', $('#onqueryID_')[0]);
					$('#mm').menu('showItem', $('#onupdSqlZxxb_')[0]);
					$('#mm').menu('showItem', $('#ondelSqlZxxb_')[0]);
					$('#mm').menu('show',{
						left: e.pageX,
						top: e.pageY
					});
				}



			}else if(rowid == '0'){
				if('${power}' != 'user'){
					$('#mm').menu('showItem', $('#_onaddSqlZxxb')[0]);
					$('#mm').menu('hideItem', $('#copyZxxb')[0]);
					$('#mm').menu('hideItem', $('#expfile')[0]);
					$('#mm').menu('hideItem', $('#impfile')[0]);
					$('#mm').menu('hideItem', $('#onupdSqlZxxb_')[0]);
					$('#mm').menu('hideItem', $('#ondelSqlZxxb_')[0]);
					$('#mm').menu('hideItem', $('#onqueryID_')[0]);
					$('#mm').menu('showItem', $('#impfileroot')[0]);
					$('#mm').menu('showItem', $('#exportAll')[0]);
					$('#mm').menu('show',{
						left: e.pageX,
						top: e.pageY
					});
				}

			}else if('${power}' != 'user'){

				$(this).treegrid('select', row.id);
				$('#mm2').menu('show',{
					left: e.pageX,
					top: e.pageY
				});
			}
			if(row.sjqlx == '0' || row.sjqlx == '1' ||row.rowid == 0){
				$('#mm').menu('showItem', $('#expfile')[0]);
			}
			if(row.sjqlx == '0'   ||row.rowid == 0){
				$('#mm').menu('showItem', $('#impfile')[0]);
			}

		},
		 onClickRow:function(row){
			var _type=''
			 $('.editbutton').hide()
		     $('.tabsbutton').hide()
			if(row.sjqlx=='1'){
				_type='属性'

			}else if(row.sjqlx=='2'){
				_type='列表'
					$('.editbutton').hide()
			}else if(row.sjqlx=='3' || row.sjqlx=='4' ){
				_type='表单'
					$('.editbutton').show()
			}else if(row.sjqlx=='5'){
				_type='标签'
			    $('.tabsbutton').show()
			}else if(row.sjqlx=='6'){
				_type='分区'
			}else if(row.sjqlx=='7'){
				_type='树形结构'
			}
     		var _title=''+ _type + "-" + row.mc
			var tt_tabs = $('#tt_tabs');
			if(row.id != '0'){
				if (tt_tabs.tabs('exists', _title)){//如果tab已经存在,则选中并刷新该tab
         		tt_tabs.tabs('select', _title);
     		}else {
     			   var content="";
			       var row= $('#sql_zxxb_list_data').treegrid('getSelected')
			       console.log(row.iconCls);
				   $.ajax({
			  	        dataType: "json",
			  	        data: {zxxb_id:row.id},
			  	        type: "POST",
			  	        url: '<%=path%>/Jsqlquery/queryZxxbHtmlCodeInsertDataById',
			  	        success : function (data) {
			  	        if(row.sjqlx=='1'){
			  	        	var content = '<div style="height:100%" ><iframe src="<%=path%>/Jsqlquery/formquery/main?rolepower=${power}&zxxb_id='+row.id+'&sjymc='+row.sjymc+'"  style="border:0px;width:100%;height:100%" frameborder="0" scrolling="no"></iframe></div>';
				  	  		$('#tt_tabs').tabs('add',{

				  	  		    iconCls:row.iconCls,
								title: _title,
								row:row,
								content:content,
								closable: true,
							});
				  	  //	$('#tt_tabs').tabs('getTab',_title).panel('options').content.find('iframe').css('height:100%')
			  	      	}else if(row.sjqlx=='2'){
			  	        	var content = '<div style="height:100%" ><iframe src="<%=path%>/Jsqlquery/formquery/main_list?rolepower=${power}&zxxb_id='+row.id+'&sjymc='+row.sjymc+'"  style="border:0px;width:100%;height:100%" frameborder="0" scrolling="no"></iframe></div>';
				  	  		$('#tt_tabs').tabs('add',{

				  	  		    iconCls:row.iconCls,
								title: _title,
								row:row,
								content:content,
								closable: true,
							});
			  	      	}else if(row.sjqlx=='7'){
			  	        	var content = '<div style="height:100%" ><iframe src="<%=path%>/Jsqlquery/formquery/main_list?rolepower=${power}&zxxb_id='+row.id+'&sjymc='+row.sjymc+'"  style="border:0px;width:100%;height:100%" frameborder="0" scrolling="no"></iframe></div>';
				  	  		$('#tt_tabs').tabs('add',{

				  	  		    iconCls:row.iconCls,
								title: _title,
								row:row,
								content:content,
								closable: true,
							});
			  	        }else if(row.sjqlx=='3' || row.sjqlx=='4' || row.sjqlx=='5'|| row.sjqlx=='6'){


			  	  		$('#tt_tabs').tabs('add',{
			  	  		    iconCls:row.iconCls,
							title: _title,
							//content:t,
							row:row,
							href:'<%=path%>/jsp/formbj/content.jsp',
							closable: true
						});

			  	        }
			  	        }
			  	    });
     		  }
			}
		},
		onLoadSuccess:function(){
		//	$('#sql_zxxb_list_data').treegrid('collapseAll')
		}
 });
	//验证表单和提交表单
	function submitFormSqlZxxb(){
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
					onSubmit:function(param){
						if($('#datasourceName').combobox('getValue')==null || $('#datasourceName').combobox('getValue')==''){
							alert("请选择数据源");
							return false;
						}
						param.sjymc = $('#datasourceName').combobox('getValue');
						var isValid = $(this).form('enableValidation').form('validate');
						return isValid;
					},
					success: function(data){
 					var data = eval('(' + data + ')');  // change the JSON string to javascript object
 					//alert(data);
 					if (data.success){
     					$('#sql_zxxb_list_data_window').window('close');
     					$('#sql_zxxb_list_data').treegrid('clearSelections');
							$('#sql_zxxb_list_data').treegrid('reload');
							$.messager.alert('提示',data.message,'info');
 					}else {
 						$.messager.alert('提示',data.message,'info');
 					}
					}
				});
			}
		});
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

	function onaddSqlZxxb(){

		$('#sql_zxxb_list_data_ff').form('clear');
		var randomNu = (new Date().getTime()) ^ Math.random();//解决IE缓存问题
		$('#sql_zxxb_list_data_ff_zt').val('1');
		$('#sql_zxxb_list_data_ff_lx').val('3');
		var node = $('#sql_zxxb_list_data').treegrid('getSelected');
		var sjymc=$('#datasourceName').combobox('getValue')

		if(node == null ||node.id == "" || node.id == null){
			$.messager.alert('提示','请选择上级!','warning');
			return ;
		}else if(sjymc==null || sjymc == ''){
			$.messager.alert('提示','请选择数据源!','warning');
			return ;
		}else {
			$('#zxxbsj').combotree({
 			url: '<%=path%>/Jsqlquery/querySqlZxxbListData3?_='+randomNu,
 			 queryParams:{'sjymc':$('#datasourceName').combobox('getValue')},
             valueField: 'id',
             textField: 'mc',
 			 method: 'post'
 		});
			$('#sjqlx').combobox({disabled:false});
			$('#ymcss').combobox({disabled:false});
			//$('#cc').combotree('tree')
			$('#zxxbsj').combotree('setValue', node.id);
			$('#sql_zxxb_list_data_window').window('open');
		}
	}
	function onupdSqlZxxb(){
		$('#sjqlx').combobox({disabled:false});
		$('#ymcss').combobox({disabled:false});
		var randomNu = (new Date().getTime()) ^ Math.random();//解决IE缓存问题
		$('#sql_zxxb_list_data_ff_zt').val('2');
		var node = $('#sql_zxxb_list_data').treegrid('getSelected');
		if(node.id == "" || node.id == null){
			$.messager.alert('提示','请选择!','warning');
			return ;
		}else {
			$('#zxxbsj').combotree({
 			url: '<%=path%>/Jsqlquery/querySqlZxxbListData3?_='+randomNu,
 			queryParams:{'sjymc':$('#datasourceName').combobox('getValue')},
             valueField: 'id',
             textField: 'mc',
 			method: 'post',
 			onBeforeSelect: function (node) {

             }
 		});
			$('#sql_zxxb_list_data_ff_id').val(node.id);
			$('#sql_zxxb_list_data_ff').form('load', '<%=path%>/Jsqlquery/querySqlZxxbListDataByid?id='+node.id+'&_='+randomNu);
			$('#sql_zxxb_list_data_window').window('open');
		}

	}
	function onExportZxxb(){
		$('#sjqlx').combobox({disabled:false});
		$('#ymcss').combobox({disabled:false});
		var randomNu = (new Date().getTime()) ^ Math.random();//解决IE缓存问题
		$('#sql_zxxb_list_data_ff_zt').val('2');
		var node = $('#sql_zxxb_list_data').treegrid('getSelected');
		if(node.id == "" || node.id == null){
			$.messager.alert('提示','请选择!','warning');
			return ;
		}else {

		 var id=	$('#sql_zxxb_list_data_ff_id').val(node.id);
	      window.location.href="<%=path%>/ExportFile/exp?zxxb_id="+node.id+"&_="+randomNu
		}

	}
	/**根据数据源名称导出全部数据
	 * @author Ding Qi Ming
	 * @since 2017.11.17
	 */
	function onExportZxxbAll(){
		$('#sjqlx').combobox({disabled:false});
		$('#ymcss').combobox({disabled:false});
		var randomNu = (new Date().getTime()) ^ Math.random();//解决IE缓存问题
		var sjymc=$('#datasourceName').combobox('getValue')
		if(sjymc==null || sjymc=='' || sjymc==undefined){
			$.messager.alert('提示','请选择数据源!','warning');
			return false;
		}
		$('#sql_zxxb_list_data_ff_zt').val('2');
		window.location.href="<%=path%>/ExportFile/expAll?sjymc="+sjymc+"&_="+randomNu;

	}
	function onImportZxxb(){
		$('#sjqlx').combobox({disabled:false});
		$('#ymcss').combobox({disabled:false});
		var sjymc=$('#datasourceName').combobox('getValue')
		var randomNu = (new Date().getTime()) ^ Math.random();//解决IE缓存问题
		$('#sql_zxxb_list_data_ff_zt').val('2');
		var node = $('#sql_zxxb_list_data').treegrid('getSelected');
		if(node.id == "" || node.id == null){
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
				        	    url:"<%=path%>/ExportFile/imp?zxxb_id="+node.id+"&sjymc="+sjymc+"&r="+randomNu,
				        	    onSubmit: function(){

				        	    },
				        	    success:function(data){
				        	    	var val=$('#datasourceName').combobox('getValue')
				        	    	$("#sql_zxxb_list_data").treegrid("reload",{'sjymc':val,'power':${power}});
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
	function copyZxxb(){

		var randomNu = (new Date().getTime()) ^ Math.random();//解决IE缓存问题
		var node = $('#sql_zxxb_list_data').treegrid('getSelected');
		if(node.id == "" || node.id == null){
			$.messager.alert('提示','请选择!','warning');
			return ;
		}else {
			var url = '<%=path%>/Jsqlquery/copyZxxb?_'+randomNu;
       		$.ajax({
    	       type: "POST",
               dataType:"json",
               data:{id:node.id}, //将Json对象序列化成Json字符串，JSON.stringify()原生态方法
    	     	url:url,
    	        success : function (data) {
					if (data.success){
						$.messager.alert('提示',data.message,'info');
						$("#sql_zxxb_list_data").treegrid("reload",{'sjymc':node.sjymc});
					}else {
						$.messager.alert('提示',data.message,'info');
					}

    	        },
    	        error : function (data){
    	           console.log(data.responseText);
    	        }
    	    });
		}
	}
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
  $(document).ready(function(){

	   $('#tt_tabs').tabs({'onSelect':function(index,title){
		   var  $tab = $('#tt_tabs').tabs('getTab',title);
		   var row=$tab.panel('options').row
 	       if('${power}' == 'user'){
  	        	if(row.power == '1'){
 	  	   		   if(row.sjqlx=='3' || row.sjqlx=='4'){
	  				   $('.editbutton').show()
	  			   }else{
	  				   $('.editbutton').hide()
	  			   }
	  			   if(row.sjqlx=='6'||row.sjqlx=='7'){
	  				   $('.layoutbutton').show()
	  			   }
  	        	}else {
  	        		$('.editbutton').hide()
  	        		$('.power').show()
  	        	}
  	       }else{
	  	   		   if(row.sjqlx=='3' || row.sjqlx=='4'){
	  				   $('.editbutton').show()
	  			   }else{
	  				   $('.editbutton').hide()
	  			   }
	  			   if(row.sjqlx=='6'||row.sjqlx=='7'){
	  				   $('.layoutbutton').show()
	  			   }
  	       }
	   },
       onContextMenu:function(e, title,index){
           e.preventDefault();
           if(index>=0){
               $('#tabmm').menu('show', {
                   left: e.pageX,
                   top: e.pageY
               }).data("tabTitle", title);
           }
       }
	   })
	  $("#tabmm").menu({
                onClick : function (item) {
                    closeTab(this, item.name);
                }
       });

	    function closeTab(menu, type) {
            var allTabs = $("#tt_tabs").tabs('tabs');
            var allTabtitle = [];
            $.each(allTabs, function (i, n) {
                var opt = $(n).panel('options');
                if (opt.closable)
                    allTabtitle.push(opt.title);
            });
            var curTabTitle = $(menu).data("tabTitle");
            var curTabIndex = $("#tt_tabs").tabs("getTabIndex", $("#tt_tabs").tabs("getTab", curTabTitle));
            switch (type) {
                case 1:
                    $("#tt_tabs").tabs("close", curTabIndex);
                    return false;
                    break;
                case 2:
                    for (var i = 0; i < allTabtitle.length; i++) {
                        $('#tt_tabs').tabs('close', allTabtitle[i]);
                    }
                    break;
                case 3:
                    for (var i = 0; i < allTabtitle.length; i++) {
                        if (curTabTitle != allTabtitle[i])
                            $('#tt_tabs').tabs('close', allTabtitle[i]);
                    }
                    $('#tt_tabs').tabs('select', curTabTitle);
                    break;
                case 4:


                    for (var i = curTabIndex; i < allTabtitle.length; i++) {
                        $('#tt_tabs').tabs('close', allTabtitle[i]);
                    }
                    $('#tt_tabs').tabs('select', curTabTitle);
                    break;
                case 5:


                    for (var i = 0; i < curTabIndex-1; i++) {
                        $('#tt_tabs').tabs('close', allTabtitle[i]);
                    }
                    $('#tt_tabs').tabs('select', curTabTitle);
                    break;
            }

        }
		$('mytag').each(function(i,dom){
	    	  var label=$(dom).attr('label')
	    	  var $newDom=$("<div style='float:left;width:100%;'><select tablename='"+$(dom).attr("tablename")+"' sxdm='"+$(dom).attr("sxdm")+"' sxmc='"+$(dom).attr("sxmc")+"'  csm='"+$(dom).attr("csm")+"' id='"+$(dom).attr("id")+"' name='"+$(dom).attr("sxdm")+"'></select></div>")
		       $.ajax({
		  	        dataType: "json",
		  	        type: "POST",
		  	        data: {
		  	        	tablename:$(dom).attr("tablename"),
		  	        	sxmc:$(dom).attr("sxmc"),
		  	        	sxdm:$(dom).attr("sxdm"),
		  	        	zxxb_id:$(dom).attr("zxxb_id")
		  	        },
		  	        url: '<%=path%>/Jsqlquery/queryCombobox',
		  	        success : function (data) {
		  	        	$newDom.find('select').append('<option value="">--请选择--</option>');
		  	        	 $.each(data,function(i,o){
		  	              var $_options=$('<option value="'+o[$(dom).attr('sxdm')]+'"> '+o[$(dom).attr('sxmc')]+'</option>')
		  	                  $newDom.find('select').append($_options)
		  	        	  })
		  	        }
		       });
	    	  if($(dom).attr('ldmb')!=undefined && $(dom).attr('ldmb')!=''){
	    		  $newDom.find('select').on('change',function( ){
	    			  //console.log($newDom.find('select').val())
	    			  var $_target=$('#'+$(dom).attr('ldmb'))
	    			  $_target.html('')
		   		       $.ajax({
				  	        type: "POST",
				  	        data: {
				  	        	tablename:$_target.attr("tablename"),
				  	        	sxmc:$_target.attr("sxmc"),
				  	        	sxdm:$_target.attr("sxdm"),
				  	        	zxxb_id:$(dom).attr("zxxb_id"),
				  	        	csm:$(dom).attr("csm"),
				  	        	csz: $newDom.find('select').val()
				  	        },
				  	        url: '<%=path%>/Jsqlquery/queryCombobox',
				  	        success : function (data) {
				  	        	 $_target.append('<option value="">--请选择--</option>');
				  	        	 $.each(data,function(i,o){
				  	              var $_options=$('<option value="'+o[$_target.attr('sxdm')]+'"> '+o[$_target.attr('sxmc')]+'</option>')
				  	                  $_target.append($_options)
				  	        	  })
				  	        }
				       });


	    		  })
	    	  }
	    	  $(dom).replaceWith($newDom);

	     })
		$('#datasourceName').combobox({
			url: '<%=path%>/Jsqlquery/readDynamicDataSource',
			queryParams:{'power':'${power}'},
            valueField: 'value',
            textField: 'key',
			method: 'post',
			onChange:function(newValue,oldValue){
				$('#sql_zxxb_list_data_ff_sjymc').val(newValue);
				$("#sql_zxxb_list_data").treegrid("reload",{'sjymc':newValue,'power':'${power}'});
			}
		});
		$('#gzl_ywlcdm').combobox({
			url: '<%=path%>/Jsqlquery-gzl/queryYwlcdms',
			queryParams:{},
            valueField: 'ywlcdm',
            textField: 'ywlcmc',
			method: 'post'
		});
		$('#formstyle').combobox({
			disabled:true,
			onChange:function(newValue,oldValue){
				$('#_form').removeClass(oldValue);
				$('#_form').addClass(newValue);
				$('#_form').find('.form-group').each(function(i,Dom){
					var $oldDom=$(Dom)
					var $newDom
				if  (newValue=='form-horizontal'){
					  $newDom = $(v_Bootstrap_input2_text_html())
					  $newDom.parents('td').css('padding','0px')
				}else{
					  $newDom = $(v_Bootstrap_input_text_html())
					  $newDom.parents('td,th').css('padding','6px')
				}
					$newDom.find('label').text($oldDom.find('label').text())
					$newDom.find('input').attr('name',$oldDom.find('input').attr('name'))
				    $(Dom).replaceWith($newDom);
				})
				if  (newValue=='form-horizontal'){
					  $('#_form').find('td,th').css('padding','auto')
					  $('#_form').find('label').css('margin-right','auto')
				}else{
					  $('#_form').find('td,th').css('padding','6px')
					  $('#_form').find('label').css('margin-right','5px')
				}
			}

		})
		    $(document).on('click' ,'.form-group.zujian ,label.zujian',function(e){
		       var data=new Array()
		       var eventdata=new Array()
		       $_selectthis=$(this);


		       var treenote={id:"root",text:"页面结构",children:[]}
		       getzujian(  $('#tt_tabs').tabs('getSelected').find('form') ,treenote )

			   var _array=new Array()
				  _array.push( { "name": "显示名称", "group": "属性", "value": ""+  0 +"","field": "xsmc"})


		       if($(this).prop('tagName')!='LABEL'){
		       data.push(v_BootStrap_input_id(this));
		       data.push(v_BootStrap_zujian_id(this));
		       data.push(v_BootStrap_input_name(this));
		       data.push(v_BootStrap_input_readonly(this));
		       data.push(v_BootStrap_input_hidden(this));
		       loadzjevent(this,eventdata)
		       }
		       data.push(v_BootStrap_input_text(this));
		       var $dom=  $(this).find('input[readonly],select[readonly],textarea[readonly]')
		  	   var defValue
		  	  // if ($dom.size()>0){
		         data.push(v_BootStrap_input_defValue(this));
		  	  // }
		       if($(this).prop('tagName')!='LABEL'){
		       data.push(v_BootStrap_formcontroltype(this));
		       data.push(v_BootStrap_input_sronly(this));
		       }
		       loadbvjson(this,data)
		       if($(this).find('select').size()>0||$(this).find('input[type=checkbox]').size()>0||$(this).find('input[type=radio]').size()>0){
		    	 selectMultiple(this,data)
		    	 liandong(this,data)

		         data.push(v_dropdown_item(this))
		         data.push(v_BootStrap_input_item(this));
		       }
		       if($(this).find('.sbutton').size()>0){ //
		         textbuttonliandong(this,data)
		       }

			   var  $tab = $('#tt_tabs').tabs('getSelected');
			   $tab.find('.window_property').propertygrid('loadData',  data);
			   $tab.find('.zujuanevent').propertygrid('loadData',eventdata)
			   $(this).MychangeSize()
			   return false
			 })
		    $(document).on('click','.panletable.zujian,td.zujian,div.tag.alert',function(){
				 var _this= $(this)
				 var data=new Array()
				 if($(_this).prop('tagName')=='TABLE'){
				 data.push( v_TableRow(_this));
				 data.push(v_TableCol(_this));
				 }else if($(_this).prop('tagName')=='TD') {
					 var  $tab = $('#tt_tabs').tabs('getSelected');
					 var data =new Array()
			    	  tdload(this,data)
			    	  $tab.find('.window_property').propertygrid('loadData',  data);
				 }else if($(_this).is('div.tag.alert') ) {
					 var  $tab = $('#tt_tabs').tabs('getSelected');
					 var data =new Array()
			    	  tagload(this,data)
			    	  $tab.find('.window_property').propertygrid('loadData',  data);
				 }
				 var $tab = $('#tt_tabs').tabs('getSelected');
				     $tab.find('.window_property').propertygrid('loadData',  data);
				 $(this).MychangeSize()
				 return false
		    })
		    $(document).on('click','td.zujian,label.zujian,div.layoutTarget',function(){
				 $(this).MychangeSize()
				 return false
		    })
		    $(document).on('click','*[class*=col-]',function(){
		    	  if($(this).is('.layoutiframe.layoutTarget')){

		    	  var $tab = $('#tt_tabs').tabs('getSelected');
		          var data =new Array()
		    	  layoutload(this,data)
		    	  var defdata=eval('('+$(this).attr("targets")+')')
		    	  if(defdata==undefined){
		    		  defdata={}
		    	  }


		    	  $tab.find('.window_property').propertygrid('loadData',  data);
		          var _tis=this
					var data2=new Array()
					$tab.find('[iframesrc]').each(function(i,dom){
						    if($(dom).attr('iframesrc')!=$(_tis).attr('iframesrc')){
						    	var _ck=false
						    	if (defdata["_"+$(dom).attr('iframesrc')]!=undefined){
						    		_ck=true
						    	}
							   data2.push({value:$(dom).attr('iframesrc'),title:$(dom).attr('title'),checked:_ck})
						    }
					})
// 					$tab.find('.tragetgrid').datagrid('loadData',data2)
// 					var rowData=$tab.find('.tragetgrid').datagrid("getRows")
//                      $.each(rowData,function(idx,val){//遍历JSON
//                       if(val.checked ){
//                           $tab.find('.tragetgrid').datagrid("selectRow", idx);//如果数据行为已选中则选中改行
//                        }
//                      });
			var targets=new Array()
			 	     $tab.find('.mtarget').find('div[title]').each(function(i,dom){
			 		   targets.push({name:$(dom).attr('name'),title:$(dom).attr('title')})
			 	   })
			   var modata
			   var  datasourceName=$('#datasourceName').combobox('getValue')
	      $.ajax({
			    async:false,
			    data:{sjymc:datasourceName},
		        url: jspath+'/Jsqlquery/queryListWindows',
		        success: function(result){
		        	modata = result;
			     },
		       dataType: 'JSON'
	    });
		 $tab.find('.eventgrid').edatagrid({
		    singleSelect:true,
		    fit:true,
		    height:500,
			toolbar: [{
				iconCls: 'icon-add',
				handler: function(){
// 					  $tab.find('.eventgrid').edatagrid('addRow')
// 					  $tab.find('.eventgrid').edatagrid('saveRow')
                      var row =  $tab.find('.eventgrid').datagrid('getSelected');
                      var rowIndex =  $tab.find('.eventgrid').datagrid('getRowIndex', row);
					  targetseting('addRow',0)
				}
			},'-',{
				iconCls: 'icon-remove',
				handler: function(){
					   var  $tab = $('#tt_tabs').tabs('getSelected');
					   var row =  $tab.find('.eventgrid').datagrid('getSelected');
					   if (row){
					         var rowIndex =  $tab.find('.eventgrid').datagrid('getRowIndex', row);
					         $tab.find('.eventgrid').edatagrid('editRow',rowIndex);
					         $tab.find('.eventgrid').edatagrid('deleteRow', rowIndex);
					   }
					  $tab.find('.eventgrid').edatagrid('saveRow')

				}
			}],
		   autoSave:false,
		   columns:[[
		        {field:'name',title:'名称',width:100,editor:{type:'textbox'}},
		    	{field:'seting',title:'修改',width:40,	 formatter: function(value,row,index){

					return '<a id="" href="#" class="layouteditbutton easyui-linkbutton l-btn l-btn-small" onclick=" targetseting(\'editRow\','+index+')"  group=""><span class="l-btn-left"><span class="l-btn-text">设置</span></span></a>'

			    }},
		        {field:'eventsource',title:'事件源',width:45 ,hidden:true
			    	,editor:{type:'combobox',options:{
		        	    valueField:'id',
		        	    textField:'text',
		        	    data:[
		        	    	{id:'row',text:'行'},
		        	    	{id:'button',text:'按钮'}
		        	    ]
		        } },
		        formatter: function(value,row,index){

		    	     if(value=='row'){
		    	    	 return '行'
		    	     }else{
		    	    	 return '按钮'
		    	     }
		          }
		        },
		        {field:'target',title:'目标',width:100,
				    formatter: function(value,row,index){
				    	var targetdata = $('#targetsetdialog').dialog('options').targets
				    	  var targetdata=new Array()
				  	  var $tab = $('#tt_tabs').tabs('getSelected');
				  	     $tab.find('.mtarget').find('div[title]').each(function(i,dom){
				  	    	targetdata.push({name:$(dom).attr('name'),title:$(dom).attr('title')})
				  	     })
				    	var l=new Array();
				    	l=$.grep(targetdata,function(d){
				    		return d.name==value
				    	})
				    	if(l.length>0){
				    		return l[0].title
				    	}
			    	    return value
			          }
			     ,align:'center',editor:{type:'combobox',options:{
	        	    valueField:'name',
	        	    textField:'title',
	        	    data:targets

	        	}}},


		        {field:'openwindow',title:'窗口',width:100,align:'center',    formatter: function(value,row,index){
		        	 var modata
			     		var  datasourceName=$('#datasourceName').combobox('getValue')
			     	      $.ajax({
			     			    async:false,
			     			    data:{sjymc:datasourceName},
			     		        url: jspath+'/Jsqlquery/queryListWindows',
			     		        success: function(result){
			     		        	modata = result;
			     			     },
			     		       dataType: 'JSON'
			     	    });
			    	var l=new Array();
			    	l=$.grep(modata,function(d){
			    		return d.value==value
			    	})
			    	if(l.length>0){
			    		return l[0].name
			    	}
		    	    return value
		          },editor:{type:'combobox',options:{
	        	    valueField:'value',
	        	    textField:'name',
	        	    data:modata

	       		}}},
		        {field:'thisiframe',title:'原窗口',width:100,align:'right',hidden:true},
		        {field:'duiyinggx',title:'对应',width:100,align:'right',hidden:true},
		        {field:'url',title:'url',width:100,align:'right',hidden:true},
		        {field:'icon',title:'icon',width:100,align:'right',hidden:true},
		        {field:'windowtype',title:'windowtype',width:100,align:'right',hidden:true},
		        {field:'sjqlx',title:'sjqlx',width:100,align:'right',hidden:true},
		        {field:'usewindow',title:'usewindow',width:100,align:'right',hidden:true},
		        {field:'tjdm',title:'tjdm',width:100,align:'right',hidden:true}
		    ]],
		    onSave:function(){
               var row=$(this).edatagrid('getRows')

               var $list_group = $tab.find('.clickzujian.selectedZuJian').find('.list-group')
               if ($list_group.size()==0){
            	   $list_group=$(" <ul class='list-group'></ul>").appendTo($tab.find('.clickzujian.selectedZuJian'))
               }
               $list_group.find('.list-group-item').remove()
               $.each(row,function(i,data){
            	    var modata = $('#targetsetdialog').dialog('options').modata
            	    data.duiyinggx=eval('('+data.duiyinggx+')')
            	    var icon
            	    if (data.icon==undefined || data.icon=='' ){
            	    	icon='glyphicon glyphicon-th'
            	    }else{
            	    	icon=data.icon
            	    }
            	    $list_group.append("<li class='list-group-item' tjdm="+data.tjdm+" usewindow="+data.usewindow+" targetwindow="+data.target+" url="+data.url+" openwindow="+data.openwindow+" eventsource="+data.eventsource+" name="+data.thisiframe+"  _data='"+JSON.stringify(data)+"' ><button data-toggle='tooltip' data-placement='top'   type='button' class='dynamicbtn btn btn-info btn-xs'  title='"+data.name+"'><i class='"+icon+"'></i></button> <span eventsource='"+data.eventsource+"' class='badge'>"+data.eventsource+"</span></li>")
            	    data.duiyinggx=JSON.stringify(data.duiyinggx)
                 })
		       }
	         })
	       	    var taregetarray=new Array()
		          $(this).find('.list-group-item').each(function(i,dom){
		        	  var n_data=eval('('+$(dom).attr('_data')+')')
		        	  n_data.duiyinggx=JSON.stringify(n_data.duiyinggx)
		        	  taregetarray.push(n_data);
		          })
		          $tab.find('.eventgrid').edatagrid('loadData',taregetarray)

				 return false
	     }
       })


		$(document).on('contextmenu','.zujian , .layoutTarget',function(e){
			e.preventDefault();
			var _this=$(this)
			$('#menu').menu('showItem', $('#m-selectPanert')[0]);
			$('#menu').menu('showItem', $('#m-deleteall')[0]);
			$('#menu').menu('showItem', $('#m-delete')[0]);
			$('#menu').menu('hideItem', $('#m-kuolie')[0]);
			if($(this).prop('tagName')=='TD'){
				//$('#menu').menu('hideItem', $('#m-deleteall')[0]);
				//$('#menu').menu('hideItem', $('#m-delete')[0]);
				$('#menu').menu('showItem', $('#m-kuolie')[0]);
			}
			$('#menu').menu('show', {
				left: e.pageX,
				top: e.pageY,
				onClick:function(item){
					if((item.id.split('-')[1]=='insert'))
					 var chtml=new ZuJianHtmlCreate("")
					if (item.id=='m-delete'){
						//delete _mainObject[$(_this).attr('id')]
						$(_this).find('*').each(function(i,dom){
							if($(dom).attr('id')!= undefined ){
							//	delete _mainObject[$(dom).attr('id')]
							}
						})
						$(_this).remove()
						$('.selectedzujiandian').remove()
					}else if (item.id=='m-selectPanert'){
						$(_this).parent("[name!='']").trigger('click')
					}else if (item.id=='m-deleteall'){
						$(_this).parents('form').children().remove()
						  _mainObject={}
					}else if (item.id.split('-')[1]=='insert') {
						var $appendDom
						if (item.id.split('-')[2]=='panle'){
							$appendDom=chtml.panle()
						}else if(item.id.split('-')[2]=='panletable'){
							$appendDom= chtml.panletable()
						}else if (['text','password','checkbox','radio','button'].indexOf(item.id.split('-')[2])>=0) {
							$appendDom= chtml.input(item.id.split('-')[2])
						}else if (item.id.split('-')[2]=='select') {
							$appendDom= chtml.select()
						}

						if (item.id.split('-')[3]=='before'){
							$(_this).before( $appendDom )
						}else if (item.id.split('-')[3]=='after'){
							$(_this).after( $appendDom )
						}else if (item.id.split('-')[3]=='inside'){
							$(_this).append( $appendDom )
						}else if (item.id.split('-')[3]=='external'){
							var $p= $appendDom
							$(_this).before( $p )
							$(_this).appendTo( $p )
						}
					}else if (item.id=='m-kuolie'){
						var colspan =$(_this).attr('colspan')
						if (colspan==undefined){
							colspan=1
						}

						$(_this).attr('colspan',colspan+1)
					}
				}
			});
			return false
		});
  })
    function targetseting(method,index){
	  var targets=new Array()
	  var $tab = $('#tt_tabs').tabs('getSelected');
	     $tab.find('.mtarget').find('div[title]').each(function(i,dom){
		   targets.push({name:$(dom).attr('name'),title:$(dom).attr('title')})
	     })
	    var iframename =$tab.find('.clickzujian.selectedZuJian').attr('name')
	    var modata
		var  datasourceName=$('#datasourceName').combobox('getValue')
	      $.ajax({
			    async:false,
			    data:{sjymc:datasourceName},
		        url: jspath+'/Jsqlquery/queryListWindows',
		        success: function(result){
		        	modata = result;
			     },
		       dataType: 'JSON'
	    });

	     var usewindow=$.grep(modata,function(d,i){
	    	 return $('li[targetwindow='+iframename+'][openwindow='+d.value+']').size()>0
	     })


	  $('#targetsetdialog').dialog({
		    title: '目标窗口设置',
		    width: 400,
		    height: 500,
		    top:50,
		    closed: false,
		    cache: false,
		    href: '<%=path%>/jsp/formbj/targetsetdialog.jsp',
		    modal: true,
		    targets:targets,
		    modata:modata,
		    usewindow:usewindow,
		    buttons:[{
				text:'Save',
				handler:function(){
				var $tab = $('#tt_tabs').tabs('getSelected');

				var data = $('#openwindowpropertygrid').propertygrid('getData').rows
				   var len = data.length;
				   for(var i=(len-1);i>=0;i--){
					   delete data[i]['editor']
					   if(data[i]['value']=='' || data[i]['value'] == null){
						   data.splice(i,1);
					   }
				}
				if(method=='addRow'){

				$tab.find('.eventgrid').edatagrid('appendRow',{
					name:$('#TARGETSETFORM_NAME').textbox('getValue'),
					eventsource:$('#TARGETSETFORM_EVENTSOURCE').combobox('getValue'),
					target:$('#TARGETSETFORM_TARGET').combobox('getValue'),
					openwindow:$('#TARGETSETFORM_OPENWINDOW').combobox('getValue'),
					url:$('#TARGETSETFORM_URL').val(),
					windowtype:$('#TARGETSETFORM_WINDOWTYPE').combobox('getValue'),
					icon:$('#TARGETSETFORM_ICON').combobox('getValue'),
					sjqlx:$('#TARGETSETFORM_SJQLX').val(),
					usewindow:JSON.stringify($('#TARGETSETFORM_USEWINDOW').tagbox('getValues')),
					tjdm: $('#TARGETSETFORM_TJDM').textbox('getValue'),
					thisiframe:iframename,
					duiyinggx:JSON.stringify(data)
				})
				}else{
					console.log( "tagbox.getValues ")
					console.log($('#TARGETSETFORM_USEWINDOW').tagbox('getValues'))
					$tab.find('.eventgrid').edatagrid('updateRow',{
	                    index:index,
						row:{
						name:$('#TARGETSETFORM_NAME').textbox('getValue'),
						eventsource:$('#TARGETSETFORM_EVENTSOURCE').combobox('getValue'),
						target:$('#TARGETSETFORM_TARGET').combobox('getValue'),
						openwindow:$('#TARGETSETFORM_OPENWINDOW').combobox('getValue'),
						url:$('#TARGETSETFORM_URL').val(),
						windowtype:$('#TARGETSETFORM_WINDOWTYPE').combobox('getValue'),
						icon:$('#TARGETSETFORM_ICON').combobox('getValue'),
						sjqlx:$('#TARGETSETFORM_SJQLX').val(),
						usewindow:JSON.stringify($('#TARGETSETFORM_USEWINDOW').tagbox('getValues')),
						tjdm: $('#TARGETSETFORM_TJDM').textbox('getValue'),
						thisiframe:iframename,
						duiyinggx:JSON.stringify(data)
					}})

				}
				$tab.find('.eventgrid').edatagrid('editRow',index)
				$tab.find('.eventgrid').edatagrid('saveRow')
				  $('#targetsetdialog').dialog('close')
				}

			},{
				text:'Close',
				handler:function(){
					  $('#targetsetdialog').dialog('close')
				}
			}],
			onLoad:function(){
				console.log($('li[targetwindow='+iframename+']'))
		        if (method == 'addRow'){
					$('#targetsetform').form('clear')
				}else{
					var $tab = $('#tt_tabs').tabs('getSelected');
					$tab.find('.eventgrid').edatagrid('selectRow', index)
					var row = $tab.find('.eventgrid').edatagrid('getSelected')
					$('#targetsetform').form('load', row)
					$('#TARGETSETFORM_USEWINDOW').tagbox('setValues',eval('('+row.usewindow+')'))
				}
              }
			});
		}

		function getIdName() {
			return Math.round(Math.random() * 100000000)
		}
	</script>

</html>
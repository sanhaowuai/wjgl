$(document).ready(function(){
	
var gridevents  =	[
		         {action:'查询',params:'{xh:xh}',isrequestserver:'是',actioncode:'GridQueryAction'},
		         {action:'添加',params:'{xh:xh}',isrequestserver:'是',actioncode:'GridAddAction'},
		         {action:'修改',params:'{xh:xh}',isrequestserver:'是',actioncode:'GridUpdateAction'},
		         {action:'删除',params:'{xh:xh}',isrequestserver:'是',actioncode:'GridDeleteAction'},
		         {action:'显示',params:'{xh:xh}',isrequestserver:'是',actioncode:'_show'},
		         {action:'隐藏',params:'{xh:xh}',isrequestserver:'是',actioncode:'_hide'}
		        ]
var formevents  =	[
    		         {action:'提交',params:'{xh:xh}',isrequestserver:'是',actioncode:'FromSubmitAction'},
    		         {action:'加载',params:'{xh:xh}',isrequestserver:'是',actioncode:'FromAjaxLoadAction',url:'' },
    		         {action:'显示',params:'{xh:xh}',isrequestserver:'是',actioncode:'_show'},
    		         {action:'隐藏',params:'{xh:xh}',isrequestserver:'是',actioncode:'_hide'},
    		        ]
var pageevents  =[
                  {action:'查询',params:'{xh:xh}',isrequestserver:'是',actioncode:'GridQueryAction',url:'' }
                 ]
var selectevents  =[
                  {action:'加载',params:'{xh:xh}',isrequestserver:'是',actioncode:'SelectLoadAction',url:'' }
                  ]
var ajaxTablevents  =[
                    {action:'加载',params:'{xh:xh}',isrequestserver:'是',actioncode:'LoadAjaxTable',url:'' }
                    ]
var ajaxDcardvents  =[
                      {action:'加载',params:'{xh:xh}',isrequestserver:'是',actioncode:'LoadAjaxDcard',url:'' }
                   ]
var panleevents  =[
  		         {action:'显示',params:'{xh:xh}',isrequestserver:'是',actioncode:'_show'},
		         {action:'隐藏',params:'{xh:xh}',isrequestserver:'是',actioncode:'_hide'}
  		         ]
var Dialogevents  =[
                   {action:'打开',params:'{xh:xh}',isrequestserver:'是',actioncode:'_open'},
                   {action:'关闭',params:'{xh:xh}',isrequestserver:'是',actioncode:'_close'}
                   ]
$('#eventTree').tree({
	            data:[{"id":'aa',
	                   "text":"事件列表",
	                   "children":[
	                               {"id":"click",   "text":"Click"},
	                               {"id":"dblclick",   "text":"dblclick"},
	                               {"id":"change",   "text":"change"}
	                              ]
	                  }],
		        onClick:function(node){
		            var eventType = node.id
		            $('#editEvent').dialog({
		                title: 'My Dialog',
		                width: 828,
		                height: 674,
		                closed: false,
		                cache: false,
		                href: path+'/jsp/ymbj/editevent.jsp',
		                modal: true,
		                resizable:false,
		                onLoad:function(){
				            var treenote={id:"pagedomroot",value:"pagedomroot",name:"页面",text:"页面",children:[]}
				            getzujian(  $('#mtarget') ,treenote )
				            $('#pagedom').tree('loadData', [treenote] );
								$('#P_PropertyGrid').propertygrid({
							    method:'get',
							    showGroup:true,
							    scrollbarSize:0,
							    columns:[[
							     {field:'name',title:'Name',width:70,sortable:false},
							     {field:'value',title:'Value',width:200,sortable:false}
							    ]] ,
							    })
							    $('#eventPropertyGrid').propertygrid({
							    method:'get',
							    showGroup:true,
							    scrollbarSize:0,
//							    columns:[[
//
//							     {field:'action',title:'动作',width:70,sortable:false},
//							     {field:'actioncode',title:'动作代码',width:200,sortable:false} ,
//							     {field:'params',title:'参数',width:200,sortable:false}  ,
//							     {field:'isrequestserver',title:'是否访问服务器',width:100,align:'right',hidden:true},
//							     {field:'zjid',title:'zjid',width:100,align:'right',hidden:false},
//							     {field:'targetid',title:'targetid',width:100,align:'right',hidden:false},
//							     {field:'evettype',title:'eventtype',width:100,align:'right',hidden:false},
//					             {field:'url',title:'url',width:100,align:'right',"editor": { "type": 'combobox',
//						    			 "options":  { "valueField": 'result',
//						    				 "textField": 'result',
//						    				 onChange:function(newValue,oldValue){
//						    					 $(target).find('tr:eq(1)').attr('items',newValue)
//						    					  _mainObject[$(target).attr('id')]['DATASOURCERESULT']=newValue
//						    				 },
//						    				 url:path+'/ymwh/loadResultByYmId?ymid='+$('#mtarget').attr('saveid'),
//						    				  "required": true}
//						    		 } },
//							    ]]
							    })

							    
						       $('#pagedom').tree({'onClick':function(node){
						        	$('#P_PropertyGrid').propertygrid({data:[]})
						        	

						        	
						        	$('#eventPropertyGrid').propertygrid({data:[]})
						        	 
						        	
						        	if(node.id=="pagedomroot"){
						        		$('#P_PropertyGrid').propertygrid('appendRow',{name:'id',field:'id',value:node.id})
						        		$('#P_PropertyGrid').propertygrid('appendRow',{name:'name',field:'name',value:node.text})
						        	}else{
							        	$('#P_PropertyGrid').propertygrid('appendRow',v_id(node.id))
							        	$('#P_PropertyGrid').propertygrid('appendRow',v_name(node.id))
						       }
						        	
						     var mewdata
                             if ($('#P_PropertyGrid').propertygrid('getFieldValue','id')=='pagedomroot'){
						    	 mewdata=   pageevents
						     } else if (_mainObject[$('#P_PropertyGrid').propertygrid('getFieldValue','id')].DOMTYPE=='form'){
						    	 mewdata=   formevents
						     } else if (_mainObject[$('#P_PropertyGrid').propertygrid('getFieldValue','id')].DOMTYPE=='select'){
						    	 mewdata=   selectevents
						     } else if (_mainObject[$('#P_PropertyGrid').propertygrid('getFieldValue','id')].DOMTYPE=='grid'){
						    	 mewdata=   ajaxTablevents
						     } else if (_mainObject[$('#P_PropertyGrid').propertygrid('getFieldValue','id')].DOMTYPE=='dcard'){
						    	 
						    	 mewdata= ajaxDcardvents
						     } else if (_mainObject[$('#P_PropertyGrid').propertygrid('getFieldValue','id')].DOMTYPE=='Dialog'){
						    	 
						    	 mewdata= Dialogevents
						     }
					        	var prams={
						        		ymid:$('#mtarget').attr('saveid'),
						        		zjid: $('#pg').propertygrid('getFieldValue','id'),
						        		targetid:node.id,
						        		eventtype:eventType
						        	}
						        	
		         			  	    $.ajax({
		         			  	        dataType: "JSON",
		         			  	        traditional:true,//这使json格式的字符不会被转码
		         			  	        data: prams,
		         			  	        type: "POST",
		         			  	        url: path+'/ymwh/loadEvents',
		         			  	        success : function (data) {
		         			  	        	 
		         			  	        	$.each(data,function(i,row){
		         			  	        		row.group=row.groups
		         			  	        		var colname=$('#eventDataGrid').datagrid('options').columns[0]
		    				                	$.each(row,function(k,col){
		    					                	  var c=$.grep(colname,function(kk,vv){
		    					                			return kk.field==k
		    					                		})
		    					                		 if(c.length>0){
		    					                			 $('#eventPropertyGrid').propertygrid('appendRow',{name:c[0].title,field:c[0].field,value:col,group:row.action+row.targetid,editor:c[0].editor})
		    					                		 }
		    					                	})
		    					                	$('#eventPropertyGrid').propertygrid('appendRow',{name:'目标ID',field:'targetid',value:row.targetid,group:row.action+row.targetid})
		    					                	$('#eventPropertyGrid').propertygrid('appendRow',{name:'组件ID',field:'zjid',value:row.zjid,group:row.action+row.targetid})
		    					                	$('#eventPropertyGrid').propertygrid('appendRow',{name:'事件',field:'eventtype',value:row.eventtype,group:row.action+row.targetid})
		    	 
		    							        	
//		         			  	        		console.dir(colname)
//		         			  	        		console.dir(col)
		         			  	        	})
		         			  	        	 
		         			  	        },
		         			  	        error : function (data){
		         			  	           console.log(data.responseText);
		         			  	        }
		         			  	    });
						     
						    $('#eventDataGrid').datagrid({
								singleSelect:true,
							    columns:[[
							              {field:'action',title:'动作',width:100},
							              {field:'params',title:'参数',width:100,hidden:true,editor:'textbox'},
							              {field:'isrequestserver',title:'是否访问服务器1',width:100,align:'right'},
							              {field:'actioncode',title:'value',width:100,align:'right' },
							              {field:'url',title:'url',width:100,align:'right',"editor": { "type": 'combobox',
							    			     "options":  { "valueField": 'requesturl',
								    				 "textField": 'methodname',
								    				  onChange:function(newValue,oldValue){
								    					 $(target).find('tr:eq(1)').attr('items',newValue)
								    					  _mainObject[$(target).attr('id')]['DATASOURCERESULT']=newValue
								    				 },
								    				 url:path+'/ymwh/loadRequestPathByYmId?ymid='+$('#mtarget').attr('saveid'),
								    				  "required": true}
								    	  } ,hidden:true},
							          ]],
							    data:mewdata,
				                onDblClickRow:function(index,row){
				                	//$('#eventPropertyGrid').propertygrid('loadData',[])
				                	var groups=$('#eventPropertyGrid').propertygrid('groups')
				                	 
				                	var v_targetid = $('#P_PropertyGrid').propertygrid('getFieldValue','id')
				                	var v_zjid = $('#pg').propertygrid('getFieldValue','id')
				                	 
				                	var count=$.grep(groups,function(kk,vv){
				                			return kk.value==row.action+v_targetid
				                		})
				                	if (count <= 0)	{
				                    row.params='.'+v_zjid
				                	var colname=$('#eventDataGrid').datagrid('options').columns[0]
				                	$.each(row,function(k,col){
				                	  var c=$.grep(colname,function(kk,vv){
				                			return kk.field==k
				                		})
				                		$('#eventPropertyGrid').propertygrid('appendRow',{name:c[0].title,field:c[0].field,value:col,group:row.action+v_targetid,editor:c[0].editor})
				                	})
				                	$('#eventPropertyGrid').propertygrid('appendRow',{name:'目标ID',field:'targetid',value:v_targetid,group:row.action+v_targetid})
				                	$('#eventPropertyGrid').propertygrid('appendRow',{name:'组件ID',field:'zjid',value:v_zjid,group:row.action+v_targetid})
				                	$('#eventPropertyGrid').propertygrid('appendRow',{name:'事件',field:'eventtype',value:eventType,group:row.action+v_targetid})
						        	var total=$('#eventPropertyGrid').propertygrid('getData').total
						        	for (var index_=0 ; index_< total; index_++){
						        		$('#eventPropertyGrid').propertygrid('beginEdit',0)
						        	}
				                   }
				                 }
							    })
						        }});
		                     },
		                     buttons:[{
		         				text:'Save',
		         				handler:function(){
		         					
		         					var groups = $('#eventPropertyGrid').propertygrid('groups')
		         					var arrays=new Array()
		         					$.each(groups,function(i,obj){
		         						var eventsobj=new Object()
		         						$.each(obj.rows,function(i,v){
		         							eventsobj[v.field]=v.value
		         						})
		         						eventsobj['ymid']=$('#mtarget').attr('saveid')
		         						arrays.push(eventsobj)
		         					})
		         					 
							        var ymwhXmbEntry = {
							  			 id:$('#mtarget').attr('saveid'),
										 html:$('#mtarget').html(),
										 text:$('#xm_tree').treegrid('getSelected').xmmc,
										 _mainObject:_mainObject,
										 eventEntrys:arrays,
							  	    };
		         					var rows=$('#eventPropertyGrid').propertygrid('getData').rows
		         					$.each(rows,function(i,row){
		         						row.ymid=$('#mtarget').attr('saveid');
		         					})
		         					load()
		         			  	    $.ajax({
		         			  	        dataType: "JSON",
		         			  	        contentType:'application/json;charset=UTF-8',//关键是要加上这行
		         			  	        traditional:true,//这使json格式的字符不会被转码
		         			  	        data: JSON.stringify(ymwhXmbEntry),
		         			  	        type: "POST",
		         			  	        url: path+'/ymwh/saveEvents',
		         			  	        success : function () {
		         			  	        	disLoad()
		         			  	        	$('#tb_save').trigger('click')
		         			  	        	//$.messager.alert('提示','页面已保存！');
		         			  	        },
		         			  	        error : function (data){
		         			  	           console.log(data.responseText);
		         			  	        }
		         			  	    });
		         				}
		         				}
		         			  ,{
		         				text:'Close',
		         				handler:function(){
		         					//...
                                }
		         			 }]
		            })
		    }
		});

		var v_id = function(id)
		{
		  var node=_mainObject[id]
		  return { "name": "ID","field":"id", "group": "属性", "value": ""+    node['ID'] +"", "field": "id"
		  }
		}
		var v_name = function(id)
		{
			
		  var node=_mainObject[id]
		  return  { "name": "name", "group": "属性", "value": ""+  node['NAME'] +"", "field": "name" }
		}
		
		 
       
})
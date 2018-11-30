var savehandler=function(){
    var $_dg = $('#codelogic-tmpl-propertygrid')
    var node=$_dg.propertygrid('options').node
    var row =$_dg.propertygrid('getSelected');
    var rownum = $_dg.propertygrid("getRowIndex",row)
    var rows = $_dg.propertygrid('getRows')
    var datalist=new Array()
    if("variable-definition"== node.ntype){
        $.each(rows,function(i,obj){
        	datalist.push({field:obj.field,value:obj.value,datatype:null})
        })
        if(rows[0]){
        	datalist[1].datatype=rows[0].value
        }
    }else{
        $.each(rows,function(i,obj){
        	datalist.push({field:obj.field,value:obj.value})
        })
    }
    if("param"== node.ntype){


    }

    if("condition-then"== node.ntype || "condition-other"== node.ntype ){
	    $('#mainTree').tree('update', {
	    	target: node.target,
	    	datalist: datalist,
	    	text: $('#editnodetext').textbox('getValue')
	    });
    }else{
	    $('#mainTree').tree('update', {
	    	target: node.target,
	    	datalist: datalist,
	    	text: $('#editnodetext').textbox('getValue')
	    });
    }
    $('#savadatabtn1').trigger('click')
}

var sqlParamEditHandler=function(e){
	var $_dg = $('#codelogic-tmpl-propertygrid')
    var rows = $_dg.datagrid('getRows')
    var keycolArray =rows[3].value.replace(/ /g,'').split(',')
    var updatecolArray= rows[2].value.replace(/ /g,'').split(',')
    var sqlparamArray=new Array()
	console.log(_usableVariable)
//    var paramArray = new Array()
//	$.each(_usableVariable,function(i,data){
//		paramArray.push(data[1])
//	})
    $.each(updatecolArray,function(i,d){
       sqlparamArray.push( {"name":d,"value":"","group":"修改字段","editor":{type:"combobox","options":{ "valueField": 'value', "textField": 'value'
      ,"data":_usableVariable }}})
    })
    $.each(keycolArray,function(i,d){
       sqlparamArray.push( {"name":d,"value":"","group":"参数","editor":{type:"combobox","options":{ "valueField": 'value', "textField": 'value'
       ,"data":_usableVariable}}})
    })
    $('#datawindweditdg').dialog({
     title: 'update',
     width: 600,
     height: 540,
     closed: false,
     cache: false,
     href:HTTP_REQUEST_PATH+'/jsp/formbj/sqleditparam.jsp',
     modal: true,
     onResize:function(){
     $('#sqlparampropertygrid').propertygrid('loadData', sqlparamArray);
     },
     buttons:[
      {
        text:"保存",
        handler:function(){
       	  var rows = $('#sqlparampropertygrid').propertygrid('getRows')
       	  var str_prepareStatement=" connection.prepareStatement(StrSQL); \n"
       	  var str_setString = ""
          var executeUpdate=" pstmt.executeUpdate();"
          var  sqlparamArray =new Array()
       	  $.each(rows,function(i,data){
         	  str_setString += " pstmt.setString("+i+", "+data.value+");\n"
         	  sqlparamArray.push(data.value)
       	  })
         var $_dg = $('#codelogic-tmpl-propertygrid')
        $_dg.propertygrid('updateRow',{
	index: 6,
	row: {
		 value:JSON.stringify(sqlparamArray)
	}
});
          console.log(JSON.stringify(sqlparamArray))
          $('#datawindweditdg').dialog('close')
//       	  var row = $('#{{id}}dg').datagrid('getSelected')
//       	  console.log("String StrSQL=\""+row.sqlcode+"\"")
//       	  console.log(str_prepareStatement)
//       	  console.log(str_setString)
//       	  console.log(executeUpdate)
        }
    }

     ],
     onLoad:function(){
         var $_dg = $('#codelogic-tmpl-propertygrid')
         var rows = $_dg.propertygrid('getRows')
    	 var values = rows[6].value

         var obj = JSON.parse(values);
         $.each(obj,function(i,o){
        	 $('#sqlparampropertygrid').propertygrid('updateRow',{
        		 index:i,
        		 row:{
        			 value:o
        		 }
        	 })

         })
     }
});
    }
var sqlAddHandler=function(){
    $('#datawindweditdg').dialog({
        title: 'update',
        width: 800,
        height: 640,
        closed: false,
        cache: false,
        modal: true,
     	 buttons:[{
   			text:'Save',
   			handler:function(e){
            var datasourceName=   $('#datasourceName').combobox('getValue')
            var tablename=   $('#tablename').combobox('getValue')
   			var wherefs	=$('#wherefs').datalist('getSelected')
   			var updatefs	=	$('#updatefs').datalist('getSelected')
   			var updatecol	=	$('#updatecol').datalist('getSelections')
   			var wherecol	=	$('#wherecol').datalist('getSelections')
               var updatesql ='UPDATE  ' +tablename +' set  '
               var selectSql ='SELECT   '
               var insertsql ='INSERT INTO ' +tablename +' ('
               var insertsqlvalues ='values ('
               var updatecolstring=''
               var keycol=''
               var deletesql ='DELETE FROM '+tablename
               $.each(updatecol,function(i,res){
                       if(i==0){
                          updatesql +=res.col+'=? '
                          insertsql +=res.col+' '
                          selectSql +=res.col+' '
                          updatecolstring +=res.col+' '
                          insertsqlvalues +='? '
                       }else{
                          updatesql +=' , '+res.col+'=?'
                          insertsql +=' , '+res.col+''
                          selectSql +=' , '+res.col+''
                          updatecolstring +=' , '+res.col+''
                          insertsqlvalues +=' , ? '
                       }
               })
                          insertsql +=' )    '
                        	  selectSql +='  from   '+tablename+'  '
                          insertsqlvalues +=' )  '
                          insertsql+=insertsqlvalues
               $.each(wherecol,function(i,res){
                       if(i==0){
                          updatesql +=' where '+res.col+'=? '
                          deletesql +=' where '+res.col+'=? '
                          selectSql +=' where '+res.col+'=? '

                          keycol +=''+res.col+''
                       }else{
                          updatesql +=' , '+res.col+'=? '
                          deletesql +=' , '+res.col+'=? '
                          keycol +=','+res.col+''
                       }
               })
              var _newData={
       	          sqlcode: null,
       	          handle: 'UPDATE',
       	          keycol: keycol,
       	          updatecol: updatecolstring,
       	          tablename:tablename,
       	          datasource:$('#datasourceName').combobox('getValue')
                   }
              var selrow = $('#updatefs').datalist('getSelected')
              if('INSERT'==selrow.value){
            	  _newData.sqlcode = insertsql
            	  _newData.handle="INSERT"
              }else  if('UPDATE'==selrow.value){
            	  _newData.sqlcode = updatesql
            	  _newData.handle="UPDATE"
              }else  if('DELETE'==selrow.value){
            	  _newData.sqlcode = deletesql
            	  _newData.handle="DELETE"
              }else  if('SELECT'==selrow.value){
            	  _newData.sqlcode = selectSql
            	  _newData.handle="SELECT"
              }
              var rows = $('#codelogic-tmpl-propertygrid').propertygrid('getRows')
              $.each(rows,function(i,o){
            		 var field = o.field
                   	 var _value
                     $.each(_newData,function(key,val){
                   		  if  (  key==field){
                   			_value=val
                   		  }
            	      })
                       if (_value)  {
            	    	$('#codelogic-tmpl-propertygrid').propertygrid('updateRow',{
                   			index: i,
                   			row: {
                   				value:_value
                   			}
                   		});
                       }
              })
   			  $('#datawindweditdg').dialog('close')
   			}
   			},{
   				text:'Close',
   				handler:function(){
   				 $('#datawindweditdg').dialog('close')
   				}
   			}],
   			onLoad:function(){
   				var rows =$('#codelogic-tmpl-propertygrid').propertygrid('getRows')
   				$('#datasourceName').combobox('setValue',rows[5].value)



   				$('#tablename').combogrid({
   					onLoadSuccess:function(){
                    	$('#tablename').combogrid('setValue',rows[4].value)
                    }
   				})
   			}
   });
   $('#datawindweditdg').dialog('refresh', HTTP_REQUEST_PATH+'/jsp/formbj/sqledit.jsp');
 }
var calculationAddHandler=function(){
    $('#datawindweditdg').dialog({
        title: 'update',
        width: 600,
        height: 540,
        closed: false,
        cache: false,
        modal: true,
     	buttons:[{
   			text:'Save',
   			handler:function(e){
	        	 var $_dg = $('#calculationeditdg')
	             var row =$_dg.edatagrid('getSelected');
	             var rownum = $_dg.edatagrid("getRowIndex",row)
	             $_dg.edatagrid("saveRow",rownum)
	             $_dg.edatagrid('getRows')
	             var node = $('#codelogic-tmpl-propertygrid').propertygrid('options').node
	             $('#mainTree').tree('update', {
	        		target: node.target,
	        		datalist: $_dg.edatagrid('getRows')

	        	 });
	        	 $('#datawindweditdg').dialog('close')
   			 }
   			},{
   				text:'Close',
   				handler:function(){
   				 $('#datawindweditdg').dialog('close')
   				}
   			}],
   			onLoad:function(){

	        	 var rows = $('#codelogic-tmpl-propertygrid').datagrid('getRows')
                 console.log(rows)
   			}
   });
   $('#datawindweditdg').dialog('refresh', HTTP_REQUEST_PATH+'/jsp/formbj/calculationedit.jsp');
 }
var conditionAddHandler=function(){
    $('#datawindweditdg').dialog({
        title: 'update',
        width: 600,
        height: 540,
        closed: false,
        cache: false,
        modal: true,
     	buttons:[{
   			text:'Save',
   			handler:function(e){
	        	 var $_dg = $('#conditioneditdg')
	             var row =$_dg.edatagrid('getSelected');
	             var rownum = $_dg.edatagrid("getRowIndex",row)
	             $_dg.edatagrid("saveRow",rownum)
	             $_dg.edatagrid('getRows')
	             var node = $('#codelogic-tmpl-propertygrid').propertygrid('options').node
	             $('#mainTree').tree('update', {
	        		target: node.target,
	        		datalist: $_dg.edatagrid('getRows')

	        	 });
	        	 $('#datawindweditdg').dialog('close')
   			 }
   			},{
   				text:'Close',
   				handler:function(){
   				 $('#datawindweditdg').dialog('close')
   				}
   			}],
   			onLoad:function(){

	        	 var rows = $('#codelogic-tmpl-propertygrid').datagrid('getRows')
                 console.log(rows)
   			}
   });
   $('#datawindweditdg').dialog('refresh', HTTP_REQUEST_PATH+'/jsp/formbj/conditionedit.jsp');
 }

var code_tmpl = function() {
	return {
		"root" : {
			types : "propertygrid",
			tmpldata : [ ]
		},
		"sourelogic" : {
			types : "propertygrid",
			tmpldata : [ ]
		},
		"controllogic" : {
			types : "propertygrid",
			tmpldata : [  ]
		},
		"step" : {
			types : "propertygrid",
			tmpldata : [{"name":" 备注","field":"comments" ,"value":"" ,"editor":"text"} ],
			     tools:[ {
			         text :'保存',
			    	 iconCls:'icon-save',
			         onClick:savehandler
			     }]
		 },
		"param" : {
			types : "propertygrid",
			tmpldata : [{"name":" 变量","field":"variable","value":"","editor":{id:"aaa", type:"combogrid","options":{ "idField": 'value', "textField": 'value'
				,editable:false
				,columns:[[
		                {field:'value',title:'值',width:100},
		                {field:'datatype',title:'类型',width:100}

		            ]],onChange:function(n,o){
                        var g = $(this).combogrid('grid');	// get datagrid object
                        var r = g.datagrid('getSelected');
                	 	$('#codelogic-tmpl-propertygrid').propertygrid('updateRow',{
                   			index:2,
                   			row:{
                             value:r.datatype
                   			}
                   		});
                	 	$('#codelogic-tmpl-propertygrid').propertygrid('updateRow',{
                	 		index:1,
                	 		row:{
                	 			value:n
                	 		}
                	 	});
		            },"data":getParam() }}},
			     {"name":"key","field":"key","value":"","editor": "textbox"},
			     {"name":"datatype","field":"datatype","value":""}],
			     tools:[ {
			    	 text:'保存',
			         iconCls:'icon-save',
			         onClick:savehandler
			     }]
		},
		"condition" : {
			types : "propertygrid",
			tmpldata : []
		},
		"condition-then" : {
			types : "propertygrid",
			tmpldata : [
				{"name":" 备注","field":"comments" ,"value":"" ,"editor":"text"}
			   ,{"name":" rows","field":"rows" ,"value":"" }
			],
		    tools:[ {
			     text:'保存',
			     group:'1',
			     iconCls:'icon-save',
		         onClick:savehandler
		     }, {
		    	 text:'编辑',
		    	 group:'1',
		    	 iconCls:'icon-edit',
		         onClick:conditionAddHandler
		     }
		     ]
		},
		"condition-other" : {
			types : "propertygrid",
			tmpldata : []
		},
		"variable-definition" : {
			types : "propertygrid",
			tmpldata : [ {
				"name" : "类型",
				"field" : "types",
				"value" : "",
				"editor" : {
					"type" : 'combobox',
					"options" : { "valueField" : 'value', "textField" : 'name',  onChange : function(newValue, oldValue) {  }, "data" : [ { value : 'String', name : '字符' }, { value : 'Integer', name : '数字' }, { value : 'Map', 	name : 'Map' }, { value : 'List', name : 'List' } ]
					}
				}
			}, {
				"name" : " 变量名称",
				"field" : "variable",
				"value" : "",
				"editor" : "textbox"
			} ],
		    tools:[ {
		    	 text:'保存2',
		    	 iconCls:'icon-save',
		         onClick:savehandler
		     }]
		},
		"assignment" : {
			types : "propertygrid",
			tmpldata : [ {
				"name" : "类型",
				"field" : "types",
				"value" : "",
				"editor" : {
					"type" : 'combobox',
					"options" : {
						"valueField" : 'value',
						"textField" : 'name',
						onChange : function(newValue, oldValue) {
						},
						"data" : [ {
							value : 'String',
							name : '字符'
						}, {
							value : 'Integer',
							name : '数字'
						}, {
							value : 'Map',
							name : 'Map'
						}, {
							value : 'List',
							name : 'List'
						} ]
					}
				}
			}, {
				"name" : " 变量",
				"field" : "variable",
				"value" : "",
				"editor" : {
				 type : "combogrid",
					"options" : {
						"idField": 'value', "textField": 'value',editable:false
							 ,columns:[[
					                {field:'value',title:'值',width:100},
					                {field:'datatype',title:'类型',width:100}
					            ]],onChange:function(){
					            	 var g = $(this).combogrid('grid');	// get datagrid object
				                        var r = g.datagrid('getSelected');
				                	 	$('#codelogic-tmpl-propertygrid').propertygrid('updateRow',{
				                   			index:0,
				                   			row:{
				                             value:r.datatype
				                   			}
				                   		});
					            },

						"data" :_usableVariable
					}
				}
			}, {
				"name" : "值",
				"field" : "value",
				"editor" : {
					 type : "combogrid",
						"options" : {
 							"editable":true,
 							"idField": 'value', "textField": 'value',"valueFile":"value"
								 ,columns:[[
						                {field:'value',title:'值',width:100},
						                {field:'datatype',title:'类型',width:100}
						            ]],onChange:function(n,o){
						            },

							"data" :_usableVariable
						}
					}
			}, {
				"name" : "操作",
				"field" : "handler",
				"value" : "",
				"editor" : {
					"type" : 'combobox',
					"options" : {
						"valueField" : 'value',
						"textField" : 'name',
						 editable:false,
						onChange : function(newValue, oldValue) {
						},
						"data" : [ {
							value : 'assignment',
							name : '赋值'
						}, {
							value : 'put',
							name : 'PUT'
						}, {
							value : 'add',
							name : 'ADD'
						} ]
					}
				}
			}, {
				"name" : "key",
				"field" : "key",
				"value" : "",
				"editor" : "textbox"
			} ],
		    tools:[ {
                 text:'保存',
		         iconCls:'icon-save',
		         onClick:savehandler
		     }]
		},
		"calculation" : {
			types : "propertygrid",
			tmpldata : [
				{"name":" 备注","field":"comments" ,"value":"" ,"editor":"text"}
			   ,{"name":" rows","field":"rows" ,"value":"" }
			   ,{"name":"返回值","field":"returnvalue","value":"","editor":{id:"aaa", type:"combogrid","options":{ "idField": 'value', "textField": 'value'
					,editable:false,columns:[[
			                {field:'value',title:'值',width:100},
			                {field:'datatype',title:'类型',width:100}

			            ]],onChange:function(){
			            	 var g = $(this).combogrid('grid');	// get datagrid object
		                        var r = g.datagrid('getSelected');
		                	 	$('#codelogic-tmpl-propertygrid').propertygrid('updateRow',{
		                   			index:3,
		                   			row:{
		                             value:r.datatype
		                   			}
		                   		});
			            },"data": _usableVariable}}},
			            {"name":" 返回值类型","field":"returnType" ,"value":"" }
			],
		    tools:[ {
			     text:'保存',
			     group:'1',
			     iconCls:'icon-save',
		         onClick:savehandler
		     }, {
		    	 text:'编辑',
		    	 group:'1',
		    	 iconCls:'icon-edit',
		         onClick:calculationAddHandler
		     }
		     ]
		},
		"order-code" : {
			types : "propertygrid",
			tmpldata : []
		},
		"sql" : {
			types : "propertygrid",
			tmpldata : [
				{"name":" sqlcode","field":"sqlcode","value":""},
				{"name":" 执行语句","field":"handle","value":""},
				{"name":" 修改字段","field":"updatecol","value":""},
				{"name":" 主键","field":"keycol","value":""},
				{"name":" 表名","field":"tablename","value":""},
				{"name":" 数据源","field":"datasource","value":""},
				{"name":" 参数","field":"sqlparam","value":""},
				{"name":"返回值","field":"returnvalue","value":"","editor":{id:"aaa", type:"combogrid","options":{ "idField": 'value', "textField": 'value'
					,editable:false,columns:[[
			                {field:'value',title:'值',width:100},
			                {field:'datatype',title:'类型',width:100}

			            ]],onChange:function(){
			            	 var g = $(this).combogrid('grid');	// get datagrid object
		                        var r = g.datagrid('getSelected');
		                	 	$('#codelogic-tmpl-propertygrid').propertygrid('updateRow',{
		                   			index:8,
		                   			row:{
		                             value:r.datatype
		                   			}
		                   		});
			            },"data": _usableVariable}}},
			   {"name":" 返回值类型","field":"returntype","value":""},
			],
		  tools:[ {
			     text:'保存',
			     group:'1',
			     iconCls:'icon-save',
		         onClick:savehandler
		     }, {
		    	 text:'编辑',
		    	 group:'1',
		    	 iconCls:'icon-add',
		         onClick:sqlAddHandler
		     }, {
			text:'参数设置',
			group:'1',
			iconCls:'icon-add',
			onClick:sqlParamEditHandler
		}
		     ]
		},
		"for" : {
			types : "propertygrid",
			tmpldata : [{"name":"集合数据","field":"variable","value":"","editor":{id:"aaa", type:"combogrid","options":{ "idField": 'value', "textField": 'value'
				 ,columns:[[
		                {field:'value',title:'值',width:100},
		                {field:'datatype',title:'类型',width:100}

		            ]],onChange:function(){
                        var g = $(this).combogrid('grid');	// get datagrid object
                        var r = g.datagrid('getSelected');
                	 	$('#codelogic-tmpl-propertygrid').propertygrid('updateRow',{
                   			index:1,
                   			row:{
                             value:r.datatype
                   			}
                   		});
		            },"data":getArrayParam() }}},
		         {"name":"集合类型","field":"datatype","value":""},
			     {"name":"项目","field":"key","value":"","editor": "textbox"},
			     {
						"name" : "项目类型",
						"field" : "types",
						"value" : "",
						"editor" : {
							"type" : 'combobox',
							"options" : { "valueField" : 'value', "textField" : 'name',  onChange : function(newValue, oldValue) {  }, "data" : [ { value : 'String', name : '字符' }, { value : 'Integer', name : '数字' }, { value : 'Map', 	name : 'Map' }, { value : 'List', name : 'List' } ]
							}
						}
					}
 ]
		}
	}
}
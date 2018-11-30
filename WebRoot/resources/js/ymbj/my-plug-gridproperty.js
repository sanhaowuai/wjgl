var v_GridDataSource=function(target){
	  var _toolbar ='<div class="SelectDataSource_tb"> '
		  _toolbar+='<input id="datasourceselectid" class="easyui-textbox" style="width:380px;height:32px">'
		  _toolbar+='<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" style="width:60px;height:32px" >查询</a>'
		  _toolbar+='</div>'
	 

	  var selectDisplayEditor={ "type": 'combobox',
		          "options": { "valueField": 'value', "textField": 'name',
		              "data":[ ],
		               onChange:function(newValue,oldValue){
                           _mainObject[$(target).attr('id')]['DISPLAYCOLUMN']=newValue
                           $(target).attr('displaycolumn',newValue)
                       },
		              "required": true}}
	  var selectValueEditor={ "type": 'combobox',
	          "options": { "valueField": 'value', "textField": 'name',
	              "data":[],
	              onChange:function(newValue,oldValue){
	            	   
                      _mainObject[$(target).attr('id')]['VALUECOLUMN']=newValue
                      $(target).attr('valuecolumn',newValue)
                  },
	              "required": true}}
	  var DisplayEditor
	  var Change=function(newValue,oldValue){
            $('.SelectDataSource_tb').find('INPUT').textbox()
			$('.SelectDataSource_tb').find('A').linkbutton({
				onClick:function(){
					$('.combogrid-f').combogrid('grid').datagrid('reload');
				}
			})
		   $('.SelectDataSource_tb').find('INPUT').on('keydown',function (e) {
                if (e.keyCode == 13) {
                	$('.combogrid-f').combogrid('grid').datagrid('reload');
                }
            });
		  _mainObject[$(target).attr('id')]['DATASOURCE']= newValue
		    
		  }
		var v_options={
			        toolbar:_toolbar,
		            panelWidth:550,
		            panelHeight:450,
		            value:'001',
		            idField:'id',
		            textField:'comments',
		            //data:v_data,
		            url:path+'/ymwh/loadDataSource',
		            pagination: true,           //是否分页
		            rownumbers: true,           //序号
		            queryParams:{key:function(){
		            	return $('#datasourceselectid').val()
		            }},
		            columns:[[
		                {field:'tablename',title:'表名',width:220},
		                {field:'comments',title:'备注',width:220},
		                {field:'url',title:'url',width:120,hidden:true},
		                {field:'id',title:'id',width:30}
		            ]],
	                onChange:Change
		}
	     this.DataSourceType=function(){
		   
		    var node=_mainObject[$(target).attr('id')]
			return { "name": "数据源类型", "value": ""+node['DATASOURCETYPE']+"", "group": "数据", "field": "position",
				"editor": { "type": 'combobox',
			                "options":  { "valueField": 'value',
			                	          "textField": 'name',
			        	                   onChange:function(newValue,oldValue){
			     	                           _mainObject[$(target).attr('id')]['DATASOURCETYPE']=newValue
			                             },
								         "data":[
								             {value:'输入',name:'输入'},
								             {value:'数据库',name:'数据库'}
								            ],
			                             "required": true}
			             }
			   }
	     }
		this.RequestUrl=function(){
			var node=_mainObject[$(target).attr('id')]
			 if($(target).getDomOption().DATASOURCEURL== undefined){
	    		 $(target).getDomOption().DATASOURCEURL==''
	    	 }
			 var defvalue= $(target).getDomOption().DATASOURCEURL
			  return { "name":"数据来源", "group": "数据", "height":"100px", "value": ""+defvalue+"", "field": "DATASOURCEURL",
			         "editor":{ "type": 'combobox',  "options":  { "valueField": 'requesturl',
	 				 "textField": 'methodname',
					  onChange:function(newValue,oldValue){
						 $(target).find('tr:eq(1)').attr('requesturl',newValue)
						  _mainObject[$(target).attr('id')]['DATASOURCEURL']=newValue
						  $(target).setDomOption({'DATASOURCEURL':newValue})
					 },
					 url:path+'/ymwh/loadRequestPathByYmId?ymid='+$('#mtarget').attr('saveid'),
					  "required": true}
	          }
	        }
		}
	     this.DataSourceResponseType=function(){
			   
			    var node=_mainObject[$(target).attr('id')]
			    var defvalue=node['DATASOURCERESPONSETYPE']==undefined?'HTTP':node['DATASOURCERESPONSETYPE']
			    if ( $(target).getDomOption().DATASOURCERESPONSETYPE==undefined ) {
			    	$(target).setDomOption({DATASOURCERESPONSETYPE:'HTTP'})
			     }
			    defvalue=$(target).getDomOption().DATASOURCERESPONSETYPE
				return { "name": "数据返回方式", "value": ""+defvalue+"", "group": "数据", "field": "DATASOURCERESPONSETYPE",
					"editor": { "type": 'combobox',
				                "options":  { "valueField": 'value',
				                	          "textField": 'name',
				        	                   onChange:function(newValue,oldValue){
				     	                           _mainObject[$(target).attr('id')]['DATASOURCERESPONSETYPE']=newValue
				     	                           $(target).find('tr:eq(1)').attr('responsetype',newValue)
				     	                           $(target).setDomOption({DATASOURCERESPONSETYPE:newValue})
				     	                           
				                             },
									         "data":[
									             {value:'AJAX',name:'AJAX'},
									             {value:'HTTP',name:'HTTP'}
									            ],
				                             "required": true}
				             }
				   }
		  }
	     this.DataSourceResult=function(){
	    	 
	         console.log($(target).getDomOption())
	    	 if($(target).getDomOption().DATASOURCERESULT== undefined){
	    		 $(target).getDomOption().DATASOURCERESULT==''
	    	 }
	    	 var node=_mainObject[$(target).attr('id')]
	    	 return { "name": "结果集", "value": ""+$(target).getDomOption().DATASOURCERESULT+"", "group": "数据", "field": "DATASOURCERESULT",
	    		 "editor": { "type": 'combobox',
	    			 "options":  { "valueField": 'result',
	    				 "textField": 'result',
	    				 onChange:function(newValue,oldValue){
	    					 $(target).find('tr:eq(1)').attr('items',newValue)
	    					 _mainObject[$(target).attr('id')]['DATASOURCERESULT']=newValue
	    					 $(target).setDomOption({'DATASOURCERESULT':newValue})
	    				 },
	    				 url:path+'/ymwh/loadResultByYmId?ymid='+$('#mtarget').attr('saveid'),
	    				  "required": true}
	    		 }
	    	 }
	     }
	     this.DataSource=function(){
		 var node=_mainObject[$(target).attr('id')]
		     return { "name": "实体", "group": "数据", "height":"100px", "value": ""+node['DATASOURCE']+"", "field": "SelectDataSource",
		         "editor": {  "type":"combogrid","options":v_options }}
	     }
		 this.columnSelect=function(){
			 var node=_mainObject[$(target).attr('id')]
			 return  { "name": "字段", "value": ""+node['DISPLAYCOLUMN']+"", "group": "数据", "field": "tableColumnSelect"}
		 }
		 this.Value=function(){
			  var node=_mainObject[$(target).attr('id')]
			  return  { "name": "值", "value": ""+node['VALUECOLUMN']+"",  "group": "数据", "field": "SelectDataValue",
				   "editor": selectValueEditor }
		 }
	    
		 this.setDisplayEditor=function(){
			$('#pg').propertygrid('beginEdit',5)
			 DisplayEditor=$('#pg').propertygrid('getEditor',{index:5,filed:'value'})
			 
		 }
	}
 
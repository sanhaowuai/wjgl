var v_SelectDataSource=function(target){
  var _toolbar ='<div class="SelectDataSource_tb">'
	  _toolbar+='<input class="easyui-textbox" style="width:380px;height:32px">'
	  _toolbar+='<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" style="width:60px;height:32px" >查询</a>'
	  _toolbar+='</div>'
 

  var selectDisplayEditor={ "type": 'combobox',
	      "options": { "valueField": 'value', "textField": 'name',
	              "data":[
	                      
	                     ],
	             
	              "required": true}}
  var selectValueEditor={ "type": 'combobox',
          "options": { "valueField": 'value', "textField": 'name',
              "data":[
                       
                     ],
             
              "required": true}}
  var DisplayEditor
  var Change=function(newValue,oldValue){
	      
         var SelectDataSource_tb= $(_toolbar)
		 $(SelectDataSource_tb).find('A').linkbutton({
				onClick:function(){
					$('.combogrid-f').combogrid('grid').datagrid('reload',{key:$(SelectDataSource_tb).find('input:eq(0)').eq(0).val()});
				}
			})
		$('.easyui-textbox').find('INPUT').textbox()
	    //_mainObject[$(target).attr('id')]['DATASOURCE']= newValue
	    $(target).setDomOption({'DATASOURCE':newValue})
	    $.post(path+'/ymwh/loadDataSourceColumn',{dataSourceID:newValue},function(data){
		  if(data.length>0){
	      $('#pg').propertygrid('beginEdit',5)
		  var display_target=$('#pg').propertygrid('getEditor',{index:5,field:'value'}).target
		     display_target.combobox({
		    	 "valueField": 'columns',
		    	 "textField": 'comments',
	             "data":data, onChange:function(newValue,oldValue){
	   	            	 // _mainObject[$(target).attr('id')]['DISPLAYCOLUMN']=newValue
	   	            	  $(target).attr('displaycolumn',newValue)
	   	            	   $(target).setDomOption({'DISPLAYCOLUMN':newValue})
	   	                 },
	             "required": true,
		     })
		     display_target.combobox("setValue","")
		 $('#pg').propertygrid('beginEdit',6)
	     var value_target=$('#pg').propertygrid('getEditor',{index:6,field:'value'}).target
	         value_target.combobox({
	    	 "valueField": 'columns',
	    	 "textField": 'comments',
	    	 "data":data,onChange:function(newValue,oldValue){
	   	            	//  _mainObject[$(target).attr('id')]['VALUECOLUMN']=newValue
	   	            	 $(target).attr('valuecolumn',newValue)
	   	            	  $(target).setDomOption({'VALUECOLUMN':newValue})
   	                 },
	    	  "required": true,
	    	         
	     })
	        value_target.combobox("setValue","")
		  }
	    })
	  }

	var v_options={
		        toolbar:_toolbar,
	            panelWidth:480,
	            panelHeight:375,
	            value:'',
	            idField:'tablename',
	            textField:'comments',
	            //data:v_data,
	            url:path+'/ymwh/loadDataSource',
	            pagination: true,           //是否分页
	            rownumbers: true,           //序号
	            queryParams:{key:function(){
	            	return $('#datasourceselectid').val()
	            }},
	            columns:[[
	                {field:'tablename',title:'表名',width:200},
	                {field:'comments',title:'备注',width:200},
	                {field:'url',title:'url',width:120,hidden:true},
	                {field:'id',title:'id',width:120,hidden:true}
	            ]],
	            onLoadSuccess:function(){
	            var SelectDataSource_tb= $('.SelectDataSource_tb')
	       		 $(SelectDataSource_tb).find('A').linkbutton({
	 				onClick:function(){
	 					$('.combogrid-f').combogrid('grid').datagrid('reload',{key:$(SelectDataSource_tb).find('input:eq(0)').eq(0).val()});
	 				}
	 			})
	 			$(SelectDataSource_tb).find('INPUT').textbox()
	 			$(SelectDataSource_tb).find('INPUT').on('keydown',function (e) {
	                if (e.keyCode == 13) {
	 					$('.combogrid-f').combogrid('grid').datagrid('reload',{key:$(SelectDataSource_tb).find('input:eq(0)').eq(0).val()});
	                }
	            });
	            Change()
	            },
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
	 this.createResult=function(){
		 return  { "name": "结果集", "value": "", "group": "数据", "field": "createResult"}
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
					 $(target).attr('requesturl',newValue)
					  //_mainObject[$(target).attr('id')]['DATASOURCEURL']=newValue
					  $(target).setDomOption({DATASOURCEURL:newValue})
				 },
				 url:path+'/ymwh/loadRequestPathByYmId?ymid='+$('#mtarget').attr('saveid'),
				  "required": true}
          }
        }
	}
	this.ParamsTarget=function(){
		var node=_mainObject[$(target).attr('id')]
		return  { "name": "参数目标", "group": "属性", "value": ""+  node['NAME'] +"", "field": "name","editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
		    $(target).attr('name',newValue)
		    _mainObject[$(target).attr('id')]['NAME']=newValue
		  }}}}
	}
	 
    this.DataSourceResult=function(){
   	 
   	 var node=_mainObject[$(target).attr('id')]
   	 if($(target).getDomOption().DATASOURCERESULT== undefined){
 		 $(target).getDomOption().DATASOURCERESULT==''
 	 }
	 var defvalue= $(target).getDomOption().DATASOURCERESULT
   	 return { "name": "结果集", "value": ""+defvalue+"", "group": "数据", "field": "DATASOURCERESULT",
   		 "editor": { "type": 'combobox',
   			 "options":  { "valueField": 'result',
   				 "textField": 'result',
   				 onChange:function(newValue,oldValue){
   					 $(target).attr('items',newValue)
   					/// _mainObject[$(target).attr('id')]['DATASOURCERESULT']=newValue
   					 $(target).setDomOption({DATASOURCERESULT:newValue})
   				 },
   				 url:path+'/ymwh/loadResultByYmId?ymid='+$('#mtarget').attr('saveid'),
   				  "required": true}
   		 }
   	 }
    }

     this.DataSource=function(){
	  var node=_mainObject[$(target).attr('id')]
	  if($(target).getDomOption().DATASOURCE== undefined){
 		 $(target).getDomOption().DATASOURCE==''
 	 }
	 var defvalue= $(target).getDomOption().DATASOURCE
	 return { "name": "表", "group": "数据", "height":"100px", "value": ""+defvalue+"", "field": "SelectDataSource",
	         "editor": { "id":"SelectDataSource", "type":"combogrid","options":v_options }}
     }
	 this.Display=function(){
		 var node=_mainObject[$(target).attr('id')]
		  if($(target).getDomOption().DISPLAYCOLUMN== undefined){
		 		 $(target).getDomOption().DISPLAYCOLUMN==''
		 	 }
		  var defvalue= $(target).getDomOption().DISPLAYCOLUMN
		 return  { "name": "显示", "value": ""+defvalue+"", "group": "数据", "field": "SelectDataDisplay",
				"editor":selectDisplayEditor}
	 }
	 this.Value=function(){
		  var node=_mainObject[$(target).attr('id')]
		  if($(target).getDomOption().VALUECOLUMN== undefined){
		 		 $(target).getDomOption().VALUECOLUMN==''
		 	 }
		  var defvalue= $(target).getDomOption().VALUECOLUMN
		  return  { "name": "值", "value": ""+defvalue+"",  "group": "数据", "field": "SelectDataValue",
			   "editor": selectValueEditor }
	 }
     this.DataSourceResponseType=function(){
		   
		    var node=_mainObject[$(target).attr('id')]
		    var defvalue//=node['DATASOURCERESPONSETYPE']==undefined?'HTTP':node['DATASOURCERESPONSETYPE']
		    if ( $(target).getDomOption().DATASOURCERESPONSETYPE==undefined ) {
		    	$(target).setDomOption({DATASOURCERESPONSETYPE:'HTTP'})
		     }
		    defvalue=$(target).getDomOption().DATASOURCERESPONSETYPE
			return { "name": "返回方式", "value": ""+defvalue+"", "group": "数据", "field": "DATASOURCERESPONSETYPE",
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
	 this.setDisplayEditor=function(){
		$('#pg').propertygrid('beginEdit',5)
		 DisplayEditor=$('#pg').propertygrid('getEditor',{index:5,filed:'value'})
		 
	 }
}
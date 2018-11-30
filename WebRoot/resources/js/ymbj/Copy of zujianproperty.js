


var v_name = function(target)
{
	
  var node=_mainObject[$(target).attr('id')]
  return  { "name": "name", "group": "属性", "value": ""+  node['NAME'] +"", "field": "name","editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
    $(target).attr('name',newValue)
    _mainObject[$(target).attr('id')]['NAME']=newValue
  }}}}
}

var v_id = function(target)
{
  var node=_mainObject[$(target).attr('id')]
  return { "name": "id", "group": "属性", "value": ""+    node['ID'] +"", "field": "id","editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
      $(target).attr('id',newValue)
      _mainObject[$(target).attr('id')]['ID']=newValue
  }}}}
}
var v_borderStyle=function(target){
	  return  { "name": "边框", "group": "属性", "value": ""+$(target).css('borderStyle')+"", "field": "border","editor":{"type":"combobox" ,"options": {
			"valueField": 'value', "textField": 'name',
			"data":[{value:'none',name:'none'},
		             {value:'solid',name:'solid'} 
		           ],"required":true, 
		          onChange:function(newValue,oldValue){
		   $(target).css('borderStyle',newValue)
	 }}}}
	}
var v_borderWidth=function(target){
	
	return { "name": "边框宽度", "group": "属性", "value": ""+  $(target).css('borderWidth') +"", "field": "borderWidth","editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
		$(target).css('borderWidth',newValue)
	 }}}}
}

var v_borderColor = function(target){
	return { "name": "边框颜色", "group": "属性", "field": "borderColor","value": ""+ $(target).getHexColor('borderColor') +"", 
		 "editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
			         $(target).css('borderColor',newValue)
	            }}}
	}
}

var v_width=function(target){
	return { "name": "宽度", "group": "样式", "value": ""+  $(target).attr('_width') +"", "field": "width","editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
	    $(target).css('width',newValue)
	    $(target).attr('_width',newValue)
	    }}}}
}

var v_height=function(target){
    return { "name": "高度", "group": "样式", "value": ""+  $(target).attr('_height') +"", "field": "height","editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
		    $(target).css('height',newValue)
		    $(target).attr('_height',newValue)
	}}} }
}

var v_top=function(target){
    return  { "name": "top", "group": "样式", "value": ""+  $(target).offset().top +"", "field": "top","editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
        $(target).css('margin-top',"10px")
        $(target).attr('_top',newValue)
    }}}}
}

var v_left=function(target){
    return   { "name": "left", "group": "样式", "value": ""+  $(target).offset().left +"", "field": "left","editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
        $(target).css('margin-left',"10px")
        $(target).attr('_left',newValue)
        }}}}
}
var v_position=function(target){
	return { "name": "position", "value": ""+$(target).css('position')+"", "group": "样式", "field": "position",  
		"editor": { "type": 'combobox',
	                "options":  { "valueField": 'value', "textField": 'name',   
	        	                 onChange:function(newValue,oldValue){
	     	                           $(target).css('position',newValue)
	                             },
						         "data":[
						             {value:'absolute',name:'absolute'},
						             {value:'relative',name:'relative'},
						             {value:'float',name:'float'},
						             {value:'static',name:'static'}
						            ],
	                             "required": true}
	             }
	       }
}

var v_float=function(target){
	return { "name": "浮动", "value": ""+$(target).css('float')+"", "group": "样式", "field": "float", 
		"editor": { "type": 'combobox',
	                "options": { "valueField": 'value', "textField": 'name',
	                	       onChange:function(newValue,oldValue){
	     	                       $(target).css('float',newValue)
	                           },
	                           "data":[
	                                   {value:'left',name:'left'},
	                                   {value:'right',name:'right'},
	                                   {value:'none',name:'none'}
	                                   ],
	                           "required": true}}}
	
	
}
var v_clear=function(target){
  return	{ "name": "清除浮动", "value": ""+$(target).css('clear')+"", "group": "样式", "field": "clear", 
	    "editor": { "type": 'combobox',
	                 "options": { "valueField": 'value', "textField": 'name',   
	                	           onChange:function(newValue,oldValue){
	  	                                     $(target).css('clear',newValue)
	                                        },
								 "data":[
									 {value:'all',name:'all'},
									 {value:'both',name:'both'},
									 {value:'inherit',name:'inherit'},
									 {value:'initial',name:'initial'},
									 {value:'left',name:'left'},
									 {value:'none',name:'none'},
									 {value:'right',name:'right'}
								   ],
	                              "required": true}}}
}  
var v_text=function(target){
	return { "name": "text", "group": "属性", "value": ""+  $(target).text() +"","field": "text",  "editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
        $(target).text(newValue)
    }}}}
}
var v_value=function(target){
	return  { "name": "value", "group": "属性", "value": ""+  $(target).val() +"","field": "value", "editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
        $(target).val(newValue)
    }}} }
}
var v_TextareaRow=function(target){
	return  { "name": "行", "group": "属性", "value": ""+  $(target).attr('rows') +"","field": "TextareaRow", "editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
        $(target).attr('rows',newValue)
    }}} }
}
var v_TextareaCol=function(target){
	return  { "name": "列", "group": "属性", "value": ""+  $(target).attr('cols') +"","field": "TextareaCol", "editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
    $(target).attr('cols',newValue)
    }}} }
}

var v_TableRow=function(target){
	return { "name": "行", "group": "属性", "value": ""+  $(target).attr('rows') +"","field": "TableRow", "editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
        $(target).attr('rows',newValue)
        var newrow =$(target).find('tr').eq(0).clone()
        $(newrow).find('tr > td').addClass("zujian")
        var _rows=$(target).find('tr').size()
        var _temp_table=$('<table></table>')
        if (_rows > newValue){
        	$(target).find('tr:gt('+(newValue-1)+')').each(function(i,delete_tr){
        		$(delete_tr).find('td').each(function(j,delete_td){
        			console.log('console.log($(delete_td).attr())'+$(delete_td).attr('id'))
        			delete _mainObject[$(delete_td).attr('id')]
        		})
        			delete _mainObject[$(delete_tr).attr('id')]
        	})
        	$(target).find('tr:gt('+(newValue-1)+')').remove()
        }else if (_rows < newValue){
        	var rowindex=$(target).find('tr').size()
        	for (var i=0 ;i< newValue-1 ; i++ ){
        		 var ntr=$(newrow).clone()
        		 var trid=$(target).attr('id')+'_tr_'+(rowindex+i)
        		 $(ntr).attr('id',trid)
        		 $(ntr).attr('_name',trid)
        		 $(ntr).find('td').each(function(_I,_td){
        		 	$(_td).attr('id',trid+'_td_'+_I)
        		 	$(_td).attr('_name',trid+'_td_'+_I)
          		  var nodeObject_td=new Object()
        		 	  nodeObject_td.id=$(_td).attr('id')
           	          nodeObject_td._width='auto'
           	    	  nodeObject_td._height='auto'
           	    	  nodeObject_td.name=$(_td).attr('_name')
               	     _mainObject[$(_td).attr('id')]=nodeObject_td
        		 })
        		  var nodeObject_tr=new Object()
        		      nodeObject_tr.id=$(ntr).attr('id')
            	      nodeObject_tr._width='auto'
            	      nodeObject_tr._height='auto'
            	      nodeObject_tr.name=$(ntr).attr('_name')
                	 _mainObject[$(ntr).attr('id')]=nodeObject_tr
        		 $(target).append(ntr)
        	 }
        }
        }}} }
}


var v_TableCol=function(target){
	return   {"name": "列", "group": "属性", "value": ""+  $(target).attr('cols') +"","field": "TableCol", "editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
        $(target).attr('cols',newValue) 
        var _rows=$(target).find('tr').size()
        var _cols=newValue-oldValue
        if ( _cols < 0) {
        	$(target).find('tr').each(function(i,tr){
        		$(tr).find('td').each(function(j,delete_td){
        			console.log("newValue")
        			console.log(newValue+"==="+j)
        			if(j>=newValue){
        			delete _mainObject[$(delete_td).attr('id')]
        			$(delete_td).remove()
        			}
        		})
        		//$(tr).find('td:gt('+(newValue)+')').remove()
        	})
        }else if(_cols > 0){
        	$(target).find('tr').each(function(i,tr){
        	
        	    for (var ii=0; $(tr).find('td').size()< newValue  ;ii++)	{
        	        var tdsize=$(tr).find('td').size();
        	    	var trid=$(tr).attr('id')
        	    	$(tr).append('<td id="'+trid+'_td_'+tdsize+'" _name="'+trid+'_td_'+tdsize+'" class="zujian">text</td>')
            		  var nodeObject_td=new Object()
      		 	      nodeObject_td.id=trid+'_td_'+tdsize
         	          nodeObject_td._width='auto'
         	    	  nodeObject_td._height='auto'
         	    	  nodeObject_td.name=trid+'_td_'+tdsize
             	     _mainObject[trid+'_td_'+tdsize]=nodeObject_td
        	    }
        	})
        }
        }}} }
}
var v_SelectItem=function( target ){
	 var _option=$(target).find('option')
	 var _optiontext=""
	 $(_option).each(function(i,k){
	    	if ($(k).attr('value')!=undefined ){
	    	_optiontext+=$(k).text()+","+$(k).attr('value')+'\n'
	    	}
	  })
  return { "name": "item", "group": "item", "height":"100px", "value": ""+_optiontext+"","field": "SelectItem", 
		     "editor": {  "type":"textbox",
		    	          "options": { "height":"100",  "multiline":true, 
		    	           onChange:function(newValue,oldValue){
				   	      var _array=newValue.split('\n');
				   	      $(target).html('')
				   	      $.each(_array,function(i,k){
				   		    if (k!="" && k!=undefined ){
				   		      $(target).append('<option value='+k.split(',')[1]+'>'+k.split(',')[0]+'</option>') 
				   		    }
				   	      })
     }}} }
}
  var v_SelectDataSource=function(target){
  var _toolbar ='<div id="SelectDataSource_tb"> '
	  _toolbar+='<input class="easyui-textbox" style="width:380px;height:32px">'
	  _toolbar+='<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" style="width:60px;height:32px" >查询</a>'
	  _toolbar+='</div>'
 

  var selectDisplayEditor={ "type": 'combobox',
	          "options": { "valueField": 'value', "textField": 'name',
	              "data":[
	                      {value:'yxmc',name:'院系名称'},
	                      {value:'yxdm',name:'院系代码'} 
	                     ],
	             
	              "required": true}}
  var selectValueEditor={ "type": 'combobox',
          "options": { "valueField": 'value', "textField": 'name',
              "data":[
                      {value:'yxmc',name:'院系名称'},
                      {value:'yxdm',name:'院系代码'} 
                     ],
             
              "required": true}}
  var DisplayEditor
  var Change=function(newValue,oldValue){
		//$('#SelectDataSource_tb').find('A').linkbutton()
		//$('#SelectDataSource_tb').find('INPUT').textbox()
	  $.post(path+'/ymwh/loadDataSourceColumn',{dataSourceID:newValue},function(data){
		  console.log("data")
		 console.log(data)
	     _mainObject[$(target).attr('id')]['DATASOURCE']= newValue
	     $('#pg').propertygrid('beginEdit',5)
		 var display_target=$('#pg').propertygrid('getEditor',{index:5,field:'value'}).target
		     display_target.combobox({
		    	 "valueField": 'columns',
		    	 "textField": 'comments',
	             "data":data, onChange:function(newValue,oldValue){  
	   	            	  _mainObject[$(target).attr('id')]['DISPLAYCOLUMN']=newValue
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
	   	            	  _mainObject[$(target).attr('id')]['VALUECOLUMN']=newValue
   	                 },
	    	  "required": true,
	    	         
	     })
	        value_target.combobox("setValue","")
	    })
	  }

	
	//测试数据
	var v_data=[
	            {'id':'001','tablename':'dm_yxb','comments':'院系表','url':'/dataSourse_yxb.do'},
	            {'id':'002','tablename':'dm_yxb','comments':'专业表','url':'/dataSourse_yxb.do'},
	            {'id':'003','tablename':'dm_yxb','comments':'年级表','url':'/dataSourse_yxb.do'},
	            {'id':'004','tablename':'dm_yxb','comments':'方向表','url':'/dataSourse_yxb.do'}
	           ]
	
	
	var v_options={
		        toolbar:_toolbar,
	            panelWidth:450,
	            value:'001',
	            idField:'id',
	            textField:'comments',
	            //data:v_data,
	            url:path+'/ymwh/loadDataSource',
	            pagination: true,           //是否分页  
	            rownumbers: true,           //序号  
	            columns:[[
	                {field:'tablename',title:'表名',width:60},
	                {field:'comments',title:'备注',width:100},
	                {field:'url',title:'url',width:120},
	                {field:'id',title:'id',width:120}
	            ]],
                onChange:Change
	}
     this.DataSourceType=function(){
	   
	    var node=_mainObject[$(target).attr('id')]
		return { "name": "数据源类型", "value": ""+node['DATASOURCETYPE']+"", "group": "item", "field": "position",  
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
  
     this.DataSource=function(){
	  var node=_mainObject[$(target).attr('id')]
	     return { "name": "数据源", "group": "item", "height":"100px", "value": ""+node['DATASOURCE']+"", "field": "SelectDataSource", 
	         "editor": {  "type":"combogrid","options":v_options }}
     }
	 this.Display=function(){ 
		 var node=_mainObject[$(target).attr('id')]
		 return  { "name": "显示", "value": ""+node['DISPLAYCOLUMN']+"", "group": "item", "field": "SelectDataDisplay", 
				"editor":selectDisplayEditor}
	 }
	 this.Value=function(){ 
		  var node=_mainObject[$(target).attr('id')]
		  return  { "name": "值", "value": ""+node['VALUECOLUMN']+"",  "group": "item", "field": "SelectDataValue", 
			   "editor": selectValueEditor }
	 }
    
	 this.setDisplayEditor=function(){
		$('#pg').propertygrid('beginEdit',5)
		 DisplayEditor=$('#pg').propertygrid('getEditor',{index:5,filed:'value'})
		 console.log(DisplayEditor)
	 }
}

 
 var v_BootStrap_input_sronly=function(target){
		var defValue= $(target).find('label').hasClass('sr-only')?'1':'0';
		return { "name": "隐藏说明", "group": "属性", "value": ""+  defValue +"","field": "sronly",  "editor": { "type": 'combobox',
			"options": { "valueField": 'value', "textField": 'name',
				onChange:function(newValue,oldValue){
					 if("1"==newValue){
						 $(target).find('label').addClass('sr-only')
					 }else{
						 $(target).find('label').removeClass('sr-only')
						 
					 }
				},
				"data":[
					{value:'0',name:'否'},
					{value:'1',name:'是'}
					],
					"required": true}}}
	}
 var v_BootStrap_input_readonly=function(target){
	 var defValue=  $(target).find('input,select,textarea').attr('readonly')
	 if (defValue=='readonly'){
		 defValue=='1'
	 }else{
		 defValue=='0'
	 }
	 return { "name": "只读", "group": "属性", "value": ""+  defValue +"","field": "readonly",  "editor": { "type": 'combobox',
		 "options": { "valueField": 'value', "textField": 'name',
			 onChange:function(newValue,oldValue){
				 if ($(target).find('input,select,textarea').size()>0){
					   if (newValue=='1'){
						   $(target).find('input,select,textarea').attr('readonly','readonly')
					   }else{
						   $(target).find('input,select,textarea').removeAttr('readonly')
					   }
					 
				 }
			 },
			 "data":[
				 {value:'0',name:'否'},
				 {value:'1',name:'是'}
				 ],
				 "required": true}}}
 }
 var v_BootStrap_input_name=function(target){
		var defValue
		if ($(target).find('input').size()>0){
			defValue = $(target).find('input').attr('name')
		}else if ($(target).find('select').size()>0){
			defValue = $(target).find('select').attr('name')
		}
		return { "name": "name", "group": "属性", "value": ""+  $(target).find('input').attr('name') +"","field": "text",  "editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
			if ($(target).find('input').size()>0){
				 $(target).find('input').attr('name',newValue)
			}else if ($(target).find('select').size()>0){
				 $(target).find('select').attr('name',newValue)
			}
			$(target).attr('name',newValue)
		}}}}
}
var v_BootStrap_check_text=function(target){
		return { "name": "text", "group": "属性", "value": ""+  $(target).find('label').find('span').text() +"","field": "text",  "editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
			$(target).find('label').find('span').text(newValue)
		}}}}
 }
var v_BootStrap_input_text=function(target){
	
	return { "name": "text", "group": "属性", "value": ""+  $(target).find('label').text() +"","field": "text",  "editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
		$(target).find('label').text(newValue)
	}}}}
}

var v_Bootstrap_input_text_html=function(){
	var key=getIdName()
	var html='<div id="'+key+'"  class="zujian form-group">';
	html+='<label for="'+key+'_"> text </label>';
	html+='<input type="text" class="form-control"  id="'+key+'_" placeholder=" "/>';
	html+='</div>';
	return html
}
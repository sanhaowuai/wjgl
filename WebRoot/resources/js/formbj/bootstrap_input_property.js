
$.extend($.fn.datagrid.defaults.editors, {
	tagbox: {
		init: function(container, options){
			var input = $('<input id="tb" type="text" style="width:100%">').appendTo(container);
			return input.tagbox(options);
		},
		destroy: function(target){
			$(target).remove();
		},
		getValue: function(target){
			console.log( $(target).tagbox("getValues"))
			return $(target).tagbox("getValues");
		},
		setValue: function(target, value){
			console.log(value)
			$(target).tagbox('setValue',value );
		},
		resize: function(target, width){
			$(target)._outerWidth(width);
		}
	}
});
var bootstrapiconsjson=[
	{value:" ",id:'',text:'无'},
	    {value:"glyphicon-th-list",id:'glyphicon glyphicon-th-list',text:'list'},
 	    {value:"glyphicon-plus",id:'glyphicon glyphicon-plus',text:'plus'},
 	    {value:"glyphicon-plus",id:'glyphicon glyphicon-minus',text:'minus'},
    	{value:"glyphicon-plus",id:'glyphicon glyphicon-trash',text:'trash'},
    	{value:"glyphicon-plus",id:'glyphicon glyphicon-search',text:'search'},
    	{value:"glyphicon-remove",id:'glyphicon glyphicon-remove',text:'remove'},
    	{value:"glyphicon-pencil",id:'glyphicon glyphicon-pencil',text:'pencil'},
    	{value:"glyphicon-th",id:'glyphicon glyphicon-th',text:'th'},
    	{value:"glyphicon-user",id:'glyphicon glyphicon-user',text:'user'}
	]
var Localmethods = {
		condition:function(){},
		showdom:{
            comments:'显示元素',
            args:[
            	{comments:'目标'}
            ],
			run:function(target,value){
			 $(''+target).show();
			 $(''+target).html($(value).val());
		    }
	    },
	    hidedom:{
            comments:'隐藏元素',
            args:[
            	{comments:'目标'}
            ],
			run:function(target,value){
			 $(''+target).hide();
			 $(''+target).html($(value).val());
		    }
	    },
	    HideOrShowDom:{
            comments:'隐藏隐藏元素',
            args:[
            	{comments:'目标'}
            ],
			run:function(target,isShow,value){

			 if (isShow){
			 $(''+target).show();
			 }else{
			 $(''+target).hide();
			 }
			 $(''+target).html($(value).val());
		    }
	    },
	    editCss:{
            comments:'改变样式',
            args:[
            	{comments:'目标'}
            ],
			run:function(target,isShow,css){
			 if (isShow){
			    $(''+target).css(css);
			 }
		    }
	    },
	 }
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
 var v_BootStrap_input_hidden=function(target){
	 var defValue= $(target).attr('_hidden');
	 return { "name": "隐藏", "group": "属性", "value": ""+  defValue +"","field": "sronly",  "editor": { "type": 'combobox',
		 "options": { "valueField": 'value', "textField": 'name',
			 onChange:function(newValue,oldValue){
					 $(target).attr('_hidden',newValue)
			 },
			 "data":[
				 {value:'false',name:'否'},
				 {value:'true',name:'是'}
				 ],
				 "required": true}}}
 }
 var v_BootStrap_input_uploadtype=function(target){
	 var defValue= $(target).find('input').attr('uploadtype');
	 return { "name": "上传样式", "group": "属性", "value": ""+  defValue +"","field": "uploadtype",  "editor": { "type": 'combobox',
		 "options": { "valueField": 'value', "textField": 'name',
			 onChange:function(newValue,oldValue){
				 $(target).find('input').attr('uploadtype',newValue)

				 if("image"==newValue){
					 $(target).find('label').addClass('sr-only')
					 $(target).find('.form-control').paretns('div').addClass('kv-avatar,center-block,text-center')
				 }else{
					 $(target).find('label').removeClass('sr-only')
					 $(target).find('.form-control').paretns('div').removeClass('kv-avatar,center-block,text-center')
				 }
			 },
			 "data":[
				 {value:'default',name:'普通'},
				 {value:'image',name:'图片'}
				 ],
				 "required": true}}}
 }
 var v_BootStrap_input_defValue=function(target){
	 var defValue=  $(target).find('input,select,textarea').eq(0).val()
	 if ($(target).find('select[defvalue]').size()>0){

		 defValue=$(target).find('select[defvalue]').attr('defvalue')
	 }
	 return { "name": "默认值", "group": "属性", "value": ""+  defValue +"","field": "defValue",  "editor": { "type": 'combobox',
		 "options": { "valueField": 'value', "textField": 'name',
			 onChange:function(newValue,oldValue){
				 if ($(target).find('input,textarea').size()>0){
					 $(target).find('input,textarea').eq(0).attr('value',newValue)
				 }
				 if ($(target).find('select').size()>0){
					 $(target).find('select').eq(0).attr('defvalue',newValue)
					 $(target).find('select').eq(0).find('option').removeAttr('selected')
					 $(target).find('select').eq(0).val(newValue)
					 $(target).find('select').eq(0).find('option[value='+newValue+']').attr('selected','selected')
				 }
			 },
			 "data":[
				 {value:'#_GLOBAL_USERCODE#',name:'用户代码'},
				 {value:'#_GLOBAL_USERNAME#',name:'用户姓名'},
				 {value:'#_GLOBAL_SYSDATE#',name:'当前时间'},
				 {value:'#_GLOBAL_GUID#',name:'GUID'},
				 {value:'#_GLOBAL_XTDM#',name:'系统代码'}
				 ],
				 "required": true}}}
 }
 var v_BootStrap_input_readonly=function(target){
	 var $dom=  $(target).find('input[readonly],select[readonly],textarea[readonly]')
	 var defValue

	 if ($dom.size()>0){
	    	defValue='true'
	 }else{
		 defValue='0'
	 }
	 return { "name": "只读", "group": "属性", "value": ""+  defValue +"","field": "readonly",  "editor": { "type": 'combobox',
		 "options": { "valueField": 'value', "textField": 'name',
			 onChange:function(newValue,oldValue){
				 if( oldValue!='' && oldValue!=null ){
				 if ($(target).find('input,textarea').size()>0){
					   if (newValue=='true'){
						   $(target).find('input,textarea').attr('readonly','true')
//						  if ( $(target).find('.input-group-addon').size()>0){
//							  $(target).find('.input-group-addon').find('.sbutton').attr('disabled','true')
//						  }
					   }else{
							   $(target).find('input,textarea').removeAttr('readonly')

					   }

				 }
				 if ($(target).find('select').size()>0){

					   if (newValue=='true'){

						   $(target).find('select').attr('readonly','true')
					   }else{
						   $(target).find('select').removeAttr('readonly')
					   }

				 }
				 $(target).trigger('click')
				 }


			 },
			 "data":[
				 {value:'0',name:'否'},
				 {value:'true',name:'是'}
				 ],
				 "required": true}}}
 }
 var v_BootStrap_input_name=function(target){
		var defValue
		var $f=$(target).find('input,select,textarea')
		if ($f.size()>0){
			defValue =$f.eq(0).attr('name')
		}
		return { "name": "name", "group": "属性", "value": ""+  defValue +"","field": "text"
//			,  "editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
//
//			if ($(target).find('input').size()>0){
//				 $(target).find('input').attr('name',newValue)
//			}else if ($(target).find('select').size()>0){
//				 $(target).find('select').attr('name',newValue)
//			}
//			$(target).attr('name',newValue)
//		}}}
		}
}
 var v_BootStrap_input_id=function(target){
	 var defValue
		var $f=$(target).find('input,select,textarea')
		if ($f.size()>0){
			defValue =$f.eq(0).attr('id')
		}
	 return { "name": "表单元素ID", "group": "属性", "value": ""+  defValue +"","field": "text", "editor": {"type":"textbox" ,"options": {"readonly":true}} }
 }
 var v_BootStrap_zujian_id=function(target){
	 var defValue
	 var $f=$(target)
	 if ($f.size()>0){
		 defValue =$f.eq(0).attr('id')
	 }
	 return { "name": "组件ID", "group": "属性", "value": ""+  defValue +"","field": "text", "editor": {"type":"textbox" ,"options": {"readonly":true}} }
 }
 var v_BootStrap_input_labelwidth=function(target){
	 var defValue

	 var cls = $(target).attr('class')
	 var result =/col-sm-[0-9]*/g;     //^开头$结尾
	 var val = result.exec(cls);  // 返回一个数组.
	 var vals = val[0];

	 return { "name": "name", "group": "属性", "value": ""+  vals +"","field": "text",  "editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
		 if ($(target).find('input').size()>0){
			 $(target).find('input').attr('name',newValue)
		 }else if ($(target).find('select').size()>0){
			 $(target).find('select').attr('name',newValue)
		 }
		 $(target).attr('name',newValue)
	 }}}}
 }
 var v_BootStrap_formcontroltype=function(target){
	 var defValue
	 if($(target).find('input').size()>0){
		  defValue =$(target).find('input').attr('type')
		 if($(target).find('input').hasClass('form_datetime')){
		     defValue= 'datetime'
		 }else if($(target).find('input').hasClass('form_date')){
			 defValue= 'date'
		 }else if($(target).find('input').hasClass('form_yearmonth')){
			 defValue= 'yearmonth'
		 }else if($(target).find('input').hasClass('form_yearyear')){
			 defValue= 'yearyear'
		 }else if($(target).find('input').hasClass('form_time')){
			 defValue= 'time'
		 }else if($(target).find('[uploadtype=image]').size()>0){
			 defValue= 'imagefile'
		 }else if($(target).find('.input-group-addon').size()>0){
			 defValue= 'textbutton'
		 }
	 }else  if($(target).find('select').size()>0){
		 defValue ='select'
	 }else  if($(target).find('textarea').size()>0){
		 defValue ='textarea'
	         if( $(target).find('iframe').size()>0){
				 defValue= 'ewebediter'
			 }
	 }

return { "name": "类型", "group": "属性", "value": ""+  defValue +"","field": "type", "editor": { "type": 'combobox',
			"options": { "valueField": 'value', "textField": 'name',
				onChange:function(newValue,oldValue){
				var $oldDom=$(target)
					var $newDom
					var oldlabel
					var oldname
					var oldid
					oldlabel=$oldDom.find('label').text()
				    oldname= $oldDom.find('[name]').eq(0).attr('name')
				    $oldDom.removeClass('kv-avatar,center-block,text-center')

				    if( oldValue!='' && oldValue!=null ){
				    if (newValue=='text'){
					  $newDom = $(v_Bootstrap_input2_text_html())
				    }else if (newValue=='textbutton'){
				     $newDom = $(v_Bootstrap_input2andbutton_text_html())
				    }else if (newValue=='password'){
				      $newDom = $(v_Bootstrap_input2_password_html())
				    }else if(newValue=='select'){
				    	$newDom = $(v_Bootstrap_input2_select_html())
				    	oldid=$newDom.find('select,input,textarea').eq(0).attr('id')
				    	var  $tab = $('#tt_tabs').tabs('getSelected');
				    	var	 row=$tab.panel('options').row
				    	//$newDom.find('select').after('<mytag id="'+oldid+'"   tablename="" name="'+oldname+'" sxdm=""   sxmc="" zxxb_id="'+row.id+'" ldmb csm="" ></mytag>')
				    }else if(newValue=='ewebediter'){
				    	$newDom = $(v_Bootstrap_input2_eWebEditer_html())
 				    }else if(newValue=='textarea'){
				    	$newDom = $(v_Bootstrap_input2_textarea_html())
 				    }else if(newValue=='file'){
 				    	$newDom = $(v_Bootstrap_input2_file_html())
 				    }else if(newValue=='imagefile'){
 				    	$oldDom.attr("style","")

 				    	$oldDom.addClass('kv-avatar center-block text-center')
 				    	$newDom = $(v_Bootstrap_input2_imagefile_html())
				    }else if(newValue=='checkbox'){
				    	$newDom = $(v_Bootstrap_input2_checkbox_html())
				    }else if(newValue=='radio'){
				    	$newDom = $(v_Bootstrap_input2_radio_html())
				    }else if(newValue=='date'){
				    	$newDom =$( v_Bootstrap_input_formdata_html())
				    }else if(newValue=='time'){
				    	$newDom =$( v_Bootstrap_input_formtime_html())
				    }else if(newValue=='datetime'){
				    	$newDom =$( v_Bootstrap_input_formdatatime_html())
				    }else if(newValue=='yearmonth'){
				    	$newDom =$( v_Bootstrap_input_yearmonth_html())
				    }else if(newValue=='yearyear'){
				    	$newDom =$( v_Bootstrap_input_yearyear_html())
				    }

				         var lableihidden=$oldDom.find('label').is(':visible')==false

 					 	 $newDom.find('label').eq(0).find('span').eq(0).text($oldDom.find('label').find('span').eq(0).text())
					 	 $newDom.find('[name]').attr('name',oldname)

					 	 $oldDom.html($newDom.html());
						 if(lableihidden){
							  $(target).find('label').eq(0).hide()


							  $(target).find('input,textarea,select').parents('.col-sm-9').eq(0).removeClass('.col-sm-9').addClass('.col-sm-12')

						 }
 					 	  $(target).trigger('click')
 					}
				},
				"data":[
					{value:'text',name:'文本框'},
					{value:'password',name:'密码'},
					{value:'select',name:'选择框'},
					{value:'textbutton',name:'选择弹出框'},
					{value:'checkbox',name:'复选框'},
					{value:'radio',name:'单选按钮'},
					{value:'textarea',name:'多行文本框'},
					{value:'ewebediter',name:'eWebEditer'},
					{value:'file',name:'文件'},
					{value:'imagefile',name:'图片文件'},
					{value:'yearyear',name:'时间：年'},
					{value:'yearmonth',name:'时间：年月'},
					{value:'date',name:'时间：年月日'},
					{value:'datetime',name:'时间：年月日时分秒'},
					{value:'time',name:'时间：时分秒'}
					],
					"required": true}}}
 }
var v_BootStrap_check_text=function(target){
		return { "name": "text", "group": "属性", "value": ""+  $(target).find('label').find('span').text() +"","field": "text",  "editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
			$(target).find('label').find('span').text(newValue)
		}}}}
 }
var v_dropdown_item=function(target){
	var defObj=$(target).find('mytag').attr('zjdm')
//	defObj={tablename:  $(target).find('mytag').attr('tablename') ,
//			xsmc:   $(target).find('mytag').attr('xsmc')  ,
//			xsdm:  $(target).find('mytag').attr('xsdm') }
	var _data=new Array()
	 $.ajax({
	    async:false,
        url: jspath+'/Jsqlquery/queryCxtjGgk',
        success: function(result){
		_data = result;
	   },
       dataType: 'JSON'
      });

	return { "name": "下拉组件", "group": "属性", "value": ""+defObj+"","field": "type", "editor": { "type": 'combobox',
		"options": { "valueField": 'id', "textField": 'name',
			onChange:function(newValue,oldValue){
				if ( $(target).find('mytag').size()==0){
				    var oldname
					var oldid
			    	oldid=$(target).find('select,input,textarea').eq(0).attr('id')
			    	oldname= $(target).find('[name]').eq(0).attr('name')
			    	var row= $('#sql_zxxb_list_data').treegrid('getSelected')
			    	var  $tab = $('#tt_tabs').tabs('getSelected');
	    					   row=$tab.panel('options').row
			    	$(target).find('select').after('<mytag id="'+oldid+'"   tablename="" name="'+oldname+'" sxdm=""   sxmc="" zxxb_id="'+row.id+'" ldmb csm="" ></mytag>')
			    	$(target).find('mytag').attr('tablename',newValue)
				   }
				var _thisdata=$(this).parents('td').find('.datagrid-editable-input').eq(0).combobox('options').data

				if( oldValue!='' && oldValue!=null ){

			    	var _newValue = $.grep(_thisdata,function(obj,i){
			    		return obj.id==newValue;
			    	})
			    	if (_newValue.length>0){
			    	$(target).find('mytag').attr('tablename',_newValue[0].tablename)
			    	$(target).find('mytag').attr('sxdm',_newValue[0].sxdm)
			    	$(target).find('mytag').attr('sxmc',_newValue[0].sxmc)
			    	$(target).find('mytag').attr('zjdm',newValue)
			    	}
			    	$(target).trigger('click')
			    }
			},
			 data: _data,
			 "required": true}}}
}
var v_BootStrap_input_text=function(target){
	var defValue
	if($(target).prop('tagName')=='LABEL'){
		defValue =$(target).find('span').text()
	}else{
		defValue=$(target).find('label.control-label').find('span').text()
	}
	return { "name": "text", "group": "属性", "value": ""+  defValue +"","field": "text",  "editor": {"type":"textbox" ,"options": {"required":true, onChange:function(newValue,oldValue){
		$(target).find('label.control-label').find('span').text(newValue)
		var _id=$(target).find('[name]').eq(0).attr('id')
		//$('label[for='+_id+']').find('span').text(newValue)
		if($(target).prop('tagName')=='LABEL'){
			$(target).find('span').text(newValue)
		}
	}}}}
}

var v_BootStrap_input_item=function(target){
	var defValue=''
	if($(target).find('select').size()>0){
		$(target).find('select').find('option').each(function(i,op){
			if($(op).attr('value')!=undefined){
				defValue+=$(op).text()+","+$(op).attr('value')+'\n'
			}
		})
	}else if($(target).find('input[type=checkbox]').size()>0){
		$(target).find('.checkbox-inline').each(function(i,dom){

			defValue+=$(dom).find('span').text()+","+$(dom).find('input').attr('value')+'\n'
		})
	}else if($(target).find('input[type=radio]').size()>0){
		$(target).find('.radio-inline').each(function(i,dom){
			defValue+=$(dom).find('span').text()+","+$(dom).find('input').attr('value')+'\n'
		})
	}
	return { "name": "item", "group": "属性", "value": ""+  defValue +"","field": "text",  "editor": {"type":"textbox" ,"options": { multiline:true,height:100,onChange:function(newValue,oldValue){
		 var array=new Array()
		 array=newValue.split('\n')
		 var tag
		 var _name
		 if($(target).find('select').size()>0){
			 _name=$(target).find('select').eq(0).attr('name')
			 $(target).find('select').html('')

			 tag='select'
		 }else if ($(target).find('input[type=checkbox]').size()>0){
			 _name=$(target).find('input[type=checkbox]').eq(0).attr('name')
			 $(target).find('.checkbox-inline').remove()
			 tag='checkbox'
		 }else if ($(target).find('input[type=radio]').size()>0){
			 _name=$(target).find('input[type=radio]').eq(0).attr('name')
			 $(target).find('.radio-inline').remove()
			 tag='radio'
		 }else{
			 _name=$(target).find('[name]').eq(0).attr('name')
		 }
		 $.each(array,function(i,k){
			 var op=k.split(',')
			 if( tag=='select'){
				 if(op[1]!=undefined){
					 $(target).find('select').append('<option value="'+op[1]+'">'+op[0]+'</option>')
				 }
			 }else if (tag=='checkbox' && op[0] !='' && op[0]!=undefined ){
					  var html=' <label   class="checkbox-inline  ">  '
						  html+='  <input id="'+$(target).attr("id")+'_'+i+' " name="'+_name+'" type="checkbox" value='+op[1]+' />'
						  html+='  <span>'+op[0]+'</span>'
						  html+='</label>		'
				         $(target).append($(html))
			 }else if (tag=='radio' && op[0] !='' && op[0]!=undefined ){
				  var html=' <label   class="radio-inline  ">  '
					  html+='  <input  id="'+$(target).attr("id")+'_'+i+' " name="'+_name+'" type="radio" value='+op[1]+' />'
					  html+='  <span>'+op[0]+'</span>'
					  html+='</label>'
				 $(target).append($(html))
			 }

		 })
	}}}}
}

var v_Bootstrap_input_text_html=function(){
	var key=getIdName()
	var html='<div id="'+key+'"  class="zujian form-group ">';
	html+='<label for="'+key+'_"   > <span> text</span> </label>';
	html+='<input name type="text" class="  form-control"  id="'+key+'_" placeholder=" "/>';
	html+='</div>';
	return html
}



var v_Bootstrap_input_formdata_html=function(){
	var key=getIdName()
	var html='<div id="'+key+'"  class="zujian form-group ">';
	html+='<label for="'+key+'_"   class="col-sm-3 control-label"  ><span> text</span></label>';
	html+='<div   class="col-sm-9" >';
	html+='<input name type="text"  data-date-format="yyyy-mm-dd" class=" form_date  form-control"  id="'+key+'_" placeholder=" "/>';
	html+='<span class="add-on"><i class="icon-th"></i></span>';
	html+=' </div>';
	html+='</div>';
	return html
}
var v_Bootstrap_input_formtime_html=function(){
	var key=getIdName()
	var html='<div id="'+key+'"  class="zujian form-group ">';
	html+='<label for="'+key+'_"   class="col-sm-3 control-label"  > <span> text</span> </label>';
	html+='<div   class="col-sm-9  " >';
	html+='<input name type="text" data-date-format="hh:ii:ss" class=" form_time  form-control"  id="'+key+'_" placeholder=" "/>';
	html+='<span class="add-on"><i class="icon-th"></i></span>';
	html+=' </div>';
	html+='</div>';
	return html
}
var v_Bootstrap_input_formdatatime_html=function(){
	var key=getIdName()
	var html='<div id="'+key+'"  class="zujian form-group ">';
	html+='<label for="'+key+'_"   class="col-sm-3 control-label"  ><span> text</span></label>';
	html+='<div   class="col-sm-9" >';
	html+='<input name type="text"  data-date-format="yyyy-mm-dd hh:ii:ss" class="form_datetime  form-control"  id="'+key+'_" placeholder=" "/>';
	html+='<span class="add-on"><i class="icon-th"></i></span>';
	html+=' </div>';
	html+='</div>';
	return html
}
var v_Bootstrap_input_yearmonth_html=function(){
	var key=getIdName()
	var html='<div id="'+key+'"  class="zujian form-group ">';
	html+='<label for="'+key+'_"   class="col-sm-3 control-label"  ><span> text</span></label>';
	html+='<div   class="col-sm-9" >';
	html+='<input name type="text"  data-date-format="yyyy-mm" class="form_yearmonth  form-control"  id="'+key+'_" placeholder=" "/>';
	html+='<span class="add-on"><i class="icon-th"></i></span>';
	html+=' </div>';
	html+='</div>';
	return html
}
var v_Bootstrap_input_yearyear_html=function(){
	var key=getIdName()
	var html='<div id="'+key+'"  class="zujian form-group ">';
	html+='<label for="'+key+'_"   class="col-sm-3 control-label"  ><span> text</span></label>';
	html+='<div   class="col-sm-9" >';
	html+='<input name type="text"  data-date-format="yyyy" class="form_yearyear  form-control"  id="'+key+'_" placeholder=" "/>';
	html+='<span class="add-on"><i class="icon-th"></i></span>';
	html+=' </div>';
	html+='</div>';
	return html
}

var v_Bootstrap_input2_text_html=function(){
	var key=getIdName()
	var html='<div id="'+key+'"  class="zujian form-group">';
	html+='<label for="'+key+'_"   class="col-sm-3 control-label"  > <span> text</span> </label>';
	html+='<div   class="col-sm-9" >  ';
	html+='<input name type="text" class="  form-control"  id="'+key+'_" placeholder=" "/>';
	html+=' </div>';
	html+='</div>';
	return html
}
var v_Bootstrap_input2andbutton_text_html=function(){
	var key=getIdName()
	var html='<div id="'+key+'"  class="zujian form-group">';
	html+='<label for="'+key+'_"   class="col-sm-3 control-label"  > <span> text</span> </label>';
	html+='<div   class="col-sm-9 spanbutton" >  ';
	html+=' <div class="input-group">  ';
	html+='<input name  readonly  type="text" class="  form-control"  id="'+key+'_" placeholder=" "/>';
	html+='<span class="input-group-addon">';
	html+=' <span class="sbutton glyphicon glyphicon-plus" type="button">选择</span>';
	html+='</span>';
	html+=' </div>';
	html+=' </div>';
	html+='</div>';
	return html
}
var v_Bootstrap_input2_file_html=function(){
	var key=getIdName()
	var html='<div id="'+key+'"  class="zujian form-group">';
	html+='<label for="'+key+'_"   class="col-sm-3 control-label"  > <span> text</span> </label>';
	html+='<div   class="col-sm-9" >  ';
	html+='<input name type="file" class="  form-control"  id="'+key+'_" placeholder=" "/>';
	html+=' </div>';
	html+='</div>';
	return html
}
var v_Bootstrap_input2_imagefile_html=function(){
	var key=getIdName()


var html='<div  id="'+key+'" class="zujian form-group kv-avatar center-block aaa text-center" style="width:200px">';
html+='<input uploadtype="image" name=" " type="file"  required=""/>';
html+=' <div class="help-block">';
html+='  <small><b><label> <span> text</span> </label></b></small>';
html+='   </div>';
html+=' </div>';


	return html
}
var v_Bootstrap_input2_password_html=function(){
	var key=getIdName()
	var html='<div id="'+key+'"  class="zujian form-group">';
	html+='<label for="'+key+'_"   class="col-sm-3 control-label"  > <span> text</span> </label>';
	html+='<div   class="col-sm-9" >  ';
	html+='<input name type="password" class="  form-control"  id="'+key+'_" placeholder=" "/>';
	html+=' </div>';
	html+='</div>';
	return html
}

var v_Bootstrap_input2_radio_html=function(){
	var key=getIdName()
	var  html='<div class="zujian form-group _radio">';
	html+='<label for="'+key+'_"   class="col-sm-3 control-label"  > <span> text</span> </label>';
	html+='    <label for="'+key+'_" class="radio-inline   "  >'
	html+='     <input  id="'+key+'_" name type="radio" value="" ><span>item</span>'
	html+='    </label>'
	html+='</div>'
return html
}

var v_Bootstrap_input2_checkbox_html=function(){
	var key=getIdName()
	var  html='<div class="zujian form-group  _checkbox">';
    	html+='<label for="'+key+'_"   class="col-sm-3 control-label"  > <span> text</span> </label>';
		html+='    <label for="'+key+'_"  class="checkbox-inline   " >'
		html+='     <input id="'+key+'_"  name type="checkbox" value="" ><span>item</span>'
		html+='    </label>'
		html+='</div>'
	return html
}


var v_Bootstrap_input2_select_html=function(){
	var key=getIdName()
	var html='<div id="'+key+'"  class="zujian form-group">';
	html+='<label for="'+key+'_"   class="col-sm-3 control-label"  > <span> text</span> </label>';
	html+='<div   class="col-sm-9" >  ';
	html+='<select  name  class="  form-control"  id="'+key+'_" placeholder=" ">';
	html+='<option value="" >--请选择--</option>';
	html+='</select>';
	html+=' </div>';
	html+='</div>';
	return html
}
var v_Bootstrap_input2_textarea_html=function(){
	var key=getIdName()
	var html='<div id="'+key+'"  class="zujian form-group">';
	html+='<label for="'+key+'_"   class="col-sm-3 control-label"  > <span> text</span> </label>';
	html+='<div   class="col-sm-9" >  ';
	html+='<textarea  name  class="form-control"  id="'+key+'_" placeholder=" ">';
	html+='</textarea>';
	html+=' </div>';
	html+='</div>';
	return html
}
var v_Bootstrap_input2_eWebEditer_html=function(){
	var key=getIdName()
	var html='<div id="'+key+'"  class="zujian form-group">';
	html+='<label for="'+key+'_"   class="col-sm-3 control-label"  > <span> text</span> </label>';
	html+='<div class="col-sm-9" >  ';
	html+='<textarea  name  class="_eWebEditer  form-control"  id="'+key+'_"  style="display:none" placeholder=" ">';
	html+='</textarea>';
	html+='<IFRAME ID="'+key+'_Iframe" src="'+jspath+'/resources/ewebeditor/ewebeditor.htm?id='+key+'_&style=standard650" frameborder="0" scrolling="no" width="100%" height="100%"></IFRAME>';
	html+=' </div>';
	html+='</div>';
	return html
}
var textbuttonliandong=function(target,data){
	 var defValue_anmc=$(target).find('.input-group-addon').find('.sbutton').attr("anmc")
	 var defValue_sjdjdz=$(target).find('.input-group-addon').find('.sbutton').attr("sjdjdz")
	 data.push( { "name": "按钮名称", "group": "属性", "value": ""+  defValue_anmc +"","field": "anmc",  "editor": { "type": 'textbox',
			"options": { onChange:function(newValue,oldValue){

				$(target).find('.input-group-addon').find('.sbutton').attr("anmc",newValue)
				var anmc =$(target).find('.input-group-addon').find('.sbutton').attr("anmc")
				var sjdjdz=$(target).find('.input-group-addon').find('.sbutton').attr("sjdjdz")
				$(target).find('.input-group-addon').find('.sbutton').attr("onclick","onModelOpen(this,'"+anmc+"','"+sjdjdz+"')")
			}}}})

	 var modata=new Array()
	 var  datasourceName=$('#datasourceName').combobox('getValue')
	 $.ajax({
		    async:false,
		    data:{sjymc:datasourceName},
	        url: jspath+'/Jsqlquery/queryModelWindows',
	        success: function(result){
	        	modata = result;
		   },
	       dataType: 'JSON'
	      });
	  data.push( { "name": "模态窗口", "group": "属性", "value": ""+  defValue_sjdjdz +"","field": "sjdjdz",  "editor": { "type": 'combobox',
				"options": {
					valueField:'value',
					textField:'name',
					data:modata,
					onChange:function(newValue,oldValue){

				$(target).find('.input-group-addon').find('.sbutton').attr("sjdjdz",newValue)
				var anmc =$(target).find('.input-group-addon').find('.sbutton').attr("anmc")
				var sjdjdz=$(target).find('.input-group-addon').find('.sbutton').attr("sjdjdz")
			    $(target).find('.input-group-addon').find('.sbutton').attr("onclick","onModelOpen(this,'"+anmc+"','"+sjdjdz+"')")
			  }}}})
	 data.push( { "name": "对应设置", "group": "属性", "value": ""+  defValue_sjdjdz +"","field": "selectwin"})
	 var defValue_sfdx=$(target).find('.input-group-addon').find('.sbutton').attr("sfdx")
	 if (defValue_sfdx=='' || defValue_sfdx==undefined){
		 defValue_sfdx=false
	 }
	 data.push( { "name": "多选", "group": "属性", "value": ""+  defValue_sfdx +"","field": "sronly",  "editor": { "type": 'combobox',
		        "options": { "valueField": 'value', "textField": 'name',
			 onChange:function(newValue,oldValue){
				 $(target).find('.input-group-addon').find('.sbutton').attr("sfdx",newValue)
			 },
			 "data":[
				 {value:'false',name:'否'},
				 {value:'true',name:'是'}
				 ],
				 "required": true}}})
}
var liandong=function(target,data){
	var defValue_tablename=$(target).find('mytag').attr('tablename')
	defValue_tablename=defValue_tablename==undefined?'':defValue_tablename
	data.push( { "name": "表名", "group": "属性", "value": ""+  defValue_tablename +"","field": "tablename",  "editor": { "type": 'textbox',
		"options": { onChange:function(newValue,oldValue){
			  //newValue=newValue.replace(' ','')
			  if(newValue.replace(' ','')==''){
				  $(target).find('mytag').remove()
			  }else{
				   if ( $(target).find('mytag').size()==0){
				    var oldname
					var oldid
			    	oldid=$(target).find('select,input,textarea').eq(0).attr('id')
			    	oldname= $(target).find('[name]').eq(0).attr('name')
			    	var row= $('#sql_zxxb_list_data').treegrid('getSelected')
			    	var  $tab = $('#tt_tabs').tabs('getSelected');
	    				row=$tab.panel('options').row
			    	$(target).find('select,[type=checkbox],[type=radio]').after('<mytag id="'+oldid+'"   tablename="" name="'+oldname+'" sxdm=""   sxmc="" zxxb_id="'+row.id+'" ldmb csm="" ></mytag>')
			    	$(target).find('mytag').attr('tablename',newValue)
				   }else{
					   $(target).find('mytag').attr('tablename',newValue)
				   }
			  }
			}}}})
   var defValue_sxmc=$(target).find('mytag').attr('sxmc')
   defValue_sxmc=defValue_sxmc==undefined?'':defValue_sxmc
   data.push( { "name": "显示名称", "group": "属性", "value": ""+  defValue_sxmc +"","field": "xsmc",  "editor": { "type": 'textbox',
				"options": { onChange:function(newValue,oldValue){
					$(target).find('mytag').attr('sxmc',newValue)
				}}}})
    var defValue_sxdm=$(target).find('mytag').attr('sxdm')
    defValue_sxdm=defValue_sxdm==undefined?'':defValue_sxdm
	data.push( { "name": "显示代码", "group": "属性", "value": ""+  defValue_sxdm +"","field": "xsdm",  "editor": { "type": 'textbox',
					"options": { onChange:function(newValue,oldValue){
						$(target).find('mytag').attr('sxdm',newValue)
					}}}})

	var defValue_sxdm=$(target).find('mytag').attr('ldmb')
	 defValue_sxdm=defValue_sxdm==undefined?'':defValue_sxdm
	var _data=new Array()
	_data.push({value:'',name:'无'})
	$(target).parents('form').find('.form-group').each(function(i,dom){
		var $_doms=$(dom).find('select')
		if($_doms.size()>0){
			o=$_doms.eq(0)
			_data.push({value:o.attr('id'),name:$(dom).find('label').find('span').text()})
		}
	})
	data.push( { "name": "联动目标", "group": "属性", "value": ""+  defValue_sxdm +"","field": "ldmb",  "editor": { "type": 'combobox',
		"options": {
			valueField:'value',
			textField:'name',
			data:_data,
    		onChange:function(newValue,oldValue){
			$(target).find('mytag').attr('ldmb',newValue)
			if(newValue==''){
				$(target).find('mytag').removeAttr('ldmb')
			}
		}}}})


   var defValue_csm=$(target).find('mytag').attr('csm')
	   defValue_csm=defValue_csm==undefined?'':defValue_csm
       data.push( { "name": "参数名", "group": "属性", "value": ""+  defValue_csm +"","field": "csm",  "editor": { "type": 'textbox',
					"options": { onChange:function(newValue,oldValue){
						$(target).find('mytag').attr('csm',newValue)
					}}}})
  	var defotherparam=$(target).find('select').eq(0).attr('otherparam')
   	data.push( { "name": "其他参数", "group": "属性", "value": ""+  defotherparam +"","field": "text",  "editor": {"type":"textbox" ,"options": { multiline:true,height:100,onChange:function(newValue,oldValue){
   		$(target).find('select').attr('otherparam',newValue)
   	}}}})

}


var  selectMultiple=function(target,data){

	var  defvalue = $(target).attr('multiple')
	if (defvalue==undefined){
		defvalue='false'
	}else{
		defvalue='true'
	}

	 data.push(  { "name": "多选", "value": ""+defvalue+"", "group": "属性", "field": "MULTIPLE",
		 "editor": { "type": 'combobox',
			 "options":  { "valueField": 'value',
				 "textField": 'name',
				 onChange:function(newValue,oldValue){
					  if(newValue=='true'){
						  $(target).addClass('selectpicker')
						  $(target).attr('multiple','multiple')
						  $(target).find('select').attr('data-live-search','true')

					  }else{
						  $(target).removeClass('selectpicker')
						  $(target).removeAttr('multiple')
						    $(target).find('select').removeAttr(' data-live-search')
					  }
					// _mainObject[$(target).attr('id')]['MULTIPLE']=newValue



				 },
				 "data":[
					 {value:'true',name:'是'},
					 {value:'false',name:'否'}
					 ],
					 "required": true}
		 }
	 })
}

var  loadzjevent=function(target,data){
	var  args=new Array()

	var  $tab = $('#tt_tabs').tabs('getSelected');
	var  $_form=$tab.find('.mtarget').find('form')
	    var defValue=""
		var _data= new Array()
	   _data =[
			{"value":"click","name":"单击"},
			{"value":"change","name":"改变"}
		]
	    var _id=$(target).find('[name]').attr('id')
	    if  ($(target).find('[name]').is('[type=checkbox],[type=radio]')){
	    	_id=$(target).attr('id')
	    }
	    var $list=$tab.find('.mtarget').find('form').find('templates._tpl').find('list[value='+_id+']')
		if  (eval($list.attr('args'))){
			args=eval($list.attr('args'))
		}
	    data.push( { "name": "事件", "group": "属性", "value": ""+  $list.attr('eventtype') +"","field": "style",  "editor": { "type": 'combobox',
					"options": {
						valueField:'value',
						textField:'name',
						onChange:function(newValue,oldValue){
							if( $tab.find('.mtarget').find('form').find('templates._tpl').size()==0){
								$tab.find('.mtarget').find('form').append('<templates style="display:none" class="_tpl" >  </templates>')
							}
							var _dom=""
							_dom+="  <list value  func   args  > "
							_dom+="     <funcbody >"
							_dom+="          function(){}"
							_dom+="     </funcbody>"
							_dom+="     <conditionbody>"
							_dom+="     </conditionbody>"
							_dom+="  </list>"
							var $dom=$(_dom)
							if ($tab.find('.mtarget').find('form').find('templates').find('[value='+_id+']').size()==0){
								$dom.attr('value',_id)
								$dom.attr('eventtype',newValue)
								console.log($dom.prop('outerHTML'))
								$tab.find('.mtarget').find('templates._tpl').append($dom)
							}else{
								$tab.find('.mtarget')
								.find('form')
								.find('templates')
								.find('[value='+_id+']')
								.attr('eventtype',newValue)
								.attr('value',_id)
							}
		},data:_data

					}}})
		var funArray=new Array()
		$.each(javascriptmethods,function(k,value){
			funArray.push({value:k,name:value.comments})
		})
		data.push({ "name": "函数", "group": "属性", "value": ""+  $list.attr('func') +"","field": "style",  "editor": { "type": 'combobox',
			"options": {
				valueField:'value',
				textField:'name',
				onChange:function(newValue,oldValue){
					if( $tab.find('.mtarget').find('form').find('templates._tpl').size()==0){
						$tab.find('.mtarget').find('form').append('<templates style="display:none" class="_tpl" >  </templates>')
					}
					var _dom=""
						_dom+="  <list value  func   args  > "
						_dom+="     <funcbody >"
						_dom+="          function(){}"
						_dom+="     </funcbody>"
						_dom+="     <conditionbody>"
						_dom+="     </conditionbody>"
						_dom+="  </list>"
						var $dom=$(_dom)
						if ($tab.find('.mtarget').find('form').find('templates').find('[value='+_id+']').size()==0){
							$dom.attr('value',_id)
							$dom.attr('func',newValue)
							$tab.find('.mtarget').find('templates._tpl').append($dom)
						}else{
							$tab.find('.mtarget')
							.find('form')
							.find('templates')
							.find('[value='+_id+']')
							.attr('func',newValue)
							.attr('value',_id)
						}
				},
		data:funArray
		}}})

        data.push( { "name": "显示参数", "group": "属性", "value": ""+  args[1] +"","field": "xsmc",  "editor": { "type": 'textbox',
				"options": { onChange:function(newValue,oldValue){
					if( $tab.find('.mtarget').find('form').find('templates._tpl').size()==0){
						$tab.find('.mtarget').find('form').append('<templates style="display:none" class="_tpl" >  </templates>')
					}
					var _dom=""
						_dom+="  <list value  func   args  > "
						_dom+="     <funcbody >"
						_dom+="          function(){}"
						_dom+="     </funcbody>"
						_dom+="     <conditionbody>"
						_dom+="     </conditionbody>"
						_dom+="  </list>"
						var $dom=$(_dom)
						args[1]= newValue
						if ($tab.find('.mtarget').find('form').find('templates').find('[value='+_id+']').size()==0){
							$dom.attr('value',_id)
							$dom.attr('func',newValue)
							$tab.find('.mtarget').find('templates._tpl').append($dom)
						}else{
							$tab.find('.mtarget')
							.find('form')
							.find('templates')
							.find('[value='+_id+']')
							.attr('args',JSON.stringify(args))
							.attr('value',_id)
						}
				}}}})
				var t_dom=new Array()
				$tab.find("div.form-group").each(function(i,dom){

					t_dom.push({value:'#'+$(dom).attr('id') ,name:$(dom).find('label').find('span').text()})
				})
				console.log(args[0])
				data.push( { "name": "目标", "group": "属性", "value":args[0],"field": "xsmc",  "editor": { "type": 'tagbox',
					"options": {
					 hasDownArrow:true,
					 data:t_dom,
					 valueField:'value',
					 textField:'name',
					 onChange:function(newValue,oldValue){

						  console.log("ccc:"+newValue)
					  //   $(this).tagbox('setValues',eval('(['+newValue+'])') )
//						 $.each(newValue,function(i,d){
//							 if( i==0){
//								 args[0]+=''+d+''
//							 }else{
//								 args[0]+=','+d+''
//							 }
//						 })
						  args[0]=newValue
						 $tab.find('.mtarget')
							.find('form')
							.find('templates')
							.find('[value='+_id+']')
							.attr('args',JSON.stringify(args))
							.attr('value',_id)
							console.log(args)
					}}}})


}


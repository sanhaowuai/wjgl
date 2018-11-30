$(document).ready(function(){
  
})

var layoutload=function(target,data){
	 var defValue=$(target).attr('title')
	 data.push( { "name": "布局名称", "group": "属性", "value": ""+  defValue +"","field": "anmc",  "editor": { "type": 'textbox',
			"options": { onChange:function(newValue,oldValue){
				if($(target).find('H2').size()>0){
					$(target).find('H2').remove()
				}
				$(target).attr('title',newValue)
				alert($(target).is('[iframesrc]'))
				if($(target).is('[iframesrc]')==false){
					$(target).attr('iframesrc','""')
				}
				$(target).append('<H2>'+newValue+'</H2>')
			}}}})
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
	  var defValue_sjdjdz =$(target).attr("iframesrc")
	  data.push({ "name": "窗口","width":"80", "group": "属性", "value": ""+  defValue_sjdjdz +"","field": "sjdjdz",  "editor": { "type": 'combobox',
				"options": {
					valueField:'value',
					textField:'name',
					data:modata,
					onChange:function(newValue,oldValue){
						$(target).attr("iframesrc",newValue)
						var  $tab = $('#tt_tabs').tabs('getSelected');
						var data=new Array()
						$tab.find('[iframesrc]').each(function(i,dom){
							if($(dom).attr('iframesrc')!=newValue){
								data.push({value:$(dom).attr('iframesrc'),title:$(dom).attr('title')})
							}
						})
						
						 var filter_data=$.grep(modata,function(data,i){
				    	 
				    	   return  data.value==newValue
				    	 
	                     })
	                    
						$tab.find('.tragetgrid').datagrid('loadData',data)
						 console.log(newValue)
						
						if(filter_data.length>0){
							$(target).attr("sjqlx",filter_data[0].sjqlx)
						}
	  }}}})
}

var tagload=function(target,data){
	 var defValue=$(target).find('.media-heading').text()
	 data.push( { "name": "标题", "group": "属性", "value": ""+  defValue +"","field": "title",  "editor": { "type": 'textbox',
			"options": { onChange:function(newValue,oldValue){
			    $(target).find('.media-heading').text(newValue)
			}}}})
	 defValue =$(target).find('.media-body > p').text()
	 data.push( { "name": "内容", "group": "属性", "value": ""+  defValue +"","field": "context",  "editor": { "type": 'textbox',
				"options": {multiline:true,height:100, onChange:function(newValue,oldValue){
					$(target).find('.media-body > p').text(newValue)
				}}}})
		var _data= new Array()
	   _data =[
		    {"value":"","name":"无"},
			{"value":"alert-success","name":"成功"},
			{"value":"alert-info","name":"提示信息"},
			{"value":"alert-warning","name":"警告"},
			{"value":"alert-danger","name":"危险"}
			 
		]
				
		var classArray=$.grep(_data,function(d){
			
			return  $(target).hasClass(d.value)
		})
		if (classArray.length>0){
			defValue=classArray[0].value
		}else{
			defValue=""
		}
	    data.push( { "name": "样式", "group": "属性", "value": ""+  defValue +"","field": "style",  "editor": { "type": 'combobox',
					"options": {
						valueField:'value',
						textField:'name',
						onChange:function(newValue,oldValue){
					     $(target).removeClass("alert-success")
					     $(target).removeClass("alert-info")
					     $(target).removeClass("alert-warning")
					     $(target).removeClass("alert-danger")
						  
						 $(target).addClass(newValue)
		},
		data:_data,
		 
		 formatter: function(row){
				var s = '<div  class=\' alert  '+row.value+'\' style=\'height:40px;margin-bottom:0px\' > '+row.name+'</div>';
			     return s
		 }
	    
		}}})
    
    var iconsArray=$.grep(bootstrapiconsjson,function(d){
			
			return  $(target).find('.icons > p').hasClass(d.value)
	 })
	 
	  
 
		if (iconsArray.length>0){
			defValue=iconsArray[0].value
		}else{
			defValue=""
		}
	   
	    data.push( { "name": "图标", "group": "属性", "value": ""+defValue +"","field": "icons",  "editor": { "type": 'combobox',
			"options": { onChange:function(newValue,oldValue){
				
				$(target).find('.icons > p').removeClass(oldValue)
				$(target).find('.icons > p').addClass(newValue)
	 },
	 valueField: 'value',
	 textField: 'text',
	 data:bootstrapiconsjson,
	 formatter: function(row){
			var s = '<span style="font-size:3em" class=\'  '+row.id+'\' style=\'height:20px\' ></span><span   style=\'font-size:2em;height:30px\' >'+row.text+'</span>';
		     return s
	 }
	}}})
}
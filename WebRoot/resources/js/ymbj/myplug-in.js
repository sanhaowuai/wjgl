$.extend($.fn.datagrid.defaults.editors, {
	    	switchbutton: {
	            init: function(container, options){
	                var input = $('<input class="easyui-switchbutton"  style="height:25px;width:50px"     >').appendTo(container);
	                return input.switchbutton(options);
	            },
	            destroy: function(target){
	                $(target).remove();
	            },
	            getValue: function(target){
	                return $(target).switchbutton("options").checked?$(target).switchbutton("options").onText:$(target).switchbutton("options").offText;
	            },
	            setValue: function(target, value){
	                $(target).switchbutton('setValue',value );
	            },
	            resize: function(target, width){
	                $(target)._outerWidth(width);
	            }
	        }
	 });
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
 
	$.extend($.fn.datagrid.defaults.editors, {
    	numtonum: {
            init: function(container, options){
            	var html='<div><input class="easyui-switchbutton" checked  style="height:25px;width:50px" ><input class="minnum easyui-numberspinner" style="width:40px;"   >'
            		html+='-<input   class="maxnum easyui-numberspinner" style="width:40px;"  ></div>'
                var html = $(html).appendTo(container);
            	 
            	html.find('.minnum,.maxnum').numberspinner(options)
            	html.find('.minnum,.maxnum').numberspinner({onChange:function(a,b){
            		if($(html).find('.easyui-switchbutton').switchbutton("options").checked){
            			$(html).find('.minnum').numberspinner('getValue')+"===="+$(html).find('.maxnum').numberspinner('getValue')
            			options.onChange($(html).find('.minnum').numberspinner('getValue')+"-"+$(html).find('.maxnum').numberspinner('getValue') ,b)
            		}else{
            			options.onChange(false,b)
            		}
            		
            	}})
            	html.find('.easyui-switchbutton').switchbutton(options)
            	
                return $(html);
            },
            destroy: function(target){
                $(target).remove();
            },
            
            getValue: function(target){
            	 
            	var min,max,kg
            	$(target).find('.minnum,.maxnum,.easyui-switchbutton').each(function(i,num){
            		if($(num).hasClass('minnum'))
            		min=$(num).numberspinner('getValue')
            		if($(num).hasClass('maxnum'))
            		max=$(num).numberspinner('getValue')
            		if($(num).hasClass('easyui-switchbutton'))
            		kg=$(num).switchbutton("options").checked
            	})
            	
            	 if(kg){
            		 return min+"-"+max;
            	 }else{
            		 return "false"
            	 }
                
            },
            setValue: function(target, value){
         
            	var vals=value.split('-')
            	if(vals.length>0){
            		$(target).find('.minnum,.maxnum,.easyui-switchbutton').each(function(i,num){
            		if($(num).hasClass('minnum'))
            		min=$(num).numberspinner('setValue',vals[0])
            		if($(num).hasClass('maxnum'))
            		max=$(num).numberspinner('setValue',vals[1])
            	})
            	}
            },
            resize: function(target, width){
                $(target)._outerWidth(width);
            }
        }
 });
 
 
$.extend($.fn.propertygrid.methods, {
	     getFieldValue: function (propertygrid,param) {
	      var returnValue=''
		  $.each(propertygrid.propertygrid('getData').rows,function(i,obj){
			 if(obj.field!== undefined ){
				 if(obj.field==param){
					 returnValue = obj.value
					 return  false
				 }
				 
			 }
			  
		   })
		  
		 return  returnValue;
	  },
	   setFieldValue:function (propertygrid,param) {
			 $.each(param,function(k,v){
			     $.each(propertygrid.propertygrid('getData').rows,function(i,obj){
				 if(obj.field!== undefined ){
					 if(obj.field==k){
						 propertygrid.propertygrid('updateRow',{
								index: i,
								row: {
									value:v
								}
							});
				      }
			        }
			         })
				})
		},
	   clearValue:function (propertygrid,jq) {
			     $.each(propertygrid.propertygrid('getData').rows,function(i,obj){
						 propertygrid.propertygrid('updateRow',{
								index: i,
								row: {
									value:''
								}
							});
			         })
		}
})

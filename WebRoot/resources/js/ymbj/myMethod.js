(function($) {
 
	var methods = {
		init : function(options) {
			return this.each(function() {
				
			});
		},
		GridQueryAction : function(options) {
			var settings = $.extend({
				'method':  'post',
				'request': 'http',//loaction
				'params':{}
				}, options);
			
//			$(this).each(function() {
				var tbid= $(this).attr('id')
				if(settings.request==='ajax'){
					$.ajax({ url:path+'/'+ settings.url,
						     type: settings.method,
						     success: function(){
						    	 console.log('SUCCESS')
					         }});
				}else if (settings.request==='http'){
					window.location.href=path+'/'+ settings.url
				}
//			})
		},
		GridAddAction : function() {
		},
		GridUpdateAction : function() {
		},
		GridDeleteAction:function() {
		},
		FromSubmitAction:function(options){
			var showmsg=function(msg){//假定你的信息提示方法为showmsg， 在方法里可以接收参数msg，当然也可以接收到o及cssctl;
				alert(msg);
			}
			$(this).Validform({
				tiptype:function(msg,o,cssctl){
					//msg：提示信息;
					//o:{obj:*,type:*,curform:*}, obj指向的是当前验证的表单元素（或表单对象），type指示提示的状态，值为1、2、3、4， 1：正在检测/提交数据，2：通过验证，3：验证失败，4：提示ignore状态, curform为当前form对象;
					//cssctl:内置的提示信息样式控制函数，该函数需传入两个参数：显示提示信息的对象 和 当前提示的状态（既形参o中的type）;
					if(!o.obj.is("form")){//验证表单元素时o.obj为该表单元素，全部验证通过提交表单时o.obj为该表单对象;
						var objtip=o.obj.siblings(".Validform_checktip");
						cssctl(objtip,o.type);
						objtip.text(msg);
					}
				}
			});
			
			$(this).submit()
		},
		SelectLoadAction:function(options){
			var obj=new Object()
			var items=$(this).attr('items')+'List'
			var valuecolumn=$(this).attr('valuecolumn')
			var displaycolumn=$(this).attr('displaycolumn')
			var _this=$(this)
			// alert($(''+options.params).attr('name'))
			  
			obj[$(''+options.params).attr('name')]=$(''+options.params).val()
			 
			$.ajax({
				 url:path+'/'+ $(_this).attr('requesturl'),
			     type: 'POST',
			     data:obj,
			     success: function(result){
			    	 
			    	 $(_this).find('option:gt(0)').remove()
			    	  $.each( result[items],function(i,data){
			    		  
			    		$(_this).append('<option value="'+data[valuecolumn]+'" >'+data[displaycolumn]+'</option>')
			    	})
		         }});
		},
		LoadAjaxTable:function(options){
			var obj=new Object()
			var items=$(this).find('tr:eq(1)').attr('items')+'List'
			if($(''+options.params).size()==1){
			   
				  obj[$(''+options.params).attr('name')]=$(''+options.params).val()
			 
			  $(options._this).find('[name!=""]').each(function(i,dom){
				 
				  if(obj[$(dom).attr('name')]!='undefined'){
					obj[$(dom).attr('name')]=$(dom).text()
				  }
			  })
			}else if($(''+options.params).size()>1){
			  // obj[$(''+options.params).eq(0).attr('name')]=$(''+options.params).val()
			   $(options._this).find('[name!=""]').each(function(i,dom){
					var k=$(dom).attr('name')
					if((k!=undefined)){
						obj[$(dom).attr('name')]=$(dom).text()
					}
			  })
			}
			var _this=$(this)
		    $.ajax({
				 url:path+'/'+ $(_this).find('tr:eq(1)').attr('requesturl'),
				 type: 'POST',
			     data:obj,
			     success: function(result){
			     
			    	 $(_this).find('tr:gt(1)').remove()
			    	      $.each( result[items],function(i,data){
			    		  var $appendtr=$(_this).find('tr:eq(1)').clone()
			    		  $($appendtr).find('td').each(function(i,dom){
			    			 $(dom).find('span').text(data[$(dom).find('span').text()])
			    		  })
			    		  $appendtr.show()
			    		  $(_this).append($appendtr)
			    	  
			    	  })
		     }});
		},
		LoadAjaxDcard:function(options){
			var obj=new Object()
			var items=$(this).attr('items')+'List'
			if($(''+options.params).size()==1){
			   obj[$(''+options.params).attr('name')]=$(''+options.params).val()
			}else if($(''+options.params).size()>1){
			   obj[$(''+options.params).eq(0).attr('name')]=$(''+options.params).val()
			   $(options._this).find('[name!=""]').each(function(i,dom){
					obj[$(dom).attr('name')]=$(dom).text()
			  })
			}
			 
			var _this=$(this)
			$(_this).parent().find('DIV[dcard="true"]:gt(0)').remove()
		    $.ajax({
				 url:path+'/'+ $(_this).attr('requesturl'),
			    // type: settings.method,
			     data:obj,
			     success: function(result){
			    	      $.each( result[items],function(i,data){
			    	      var $appendCard=$(_this).clone().eq(0)
			    		  $($appendCard).find('span[value=true]').each(function(i,dom){
			    			 $(dom).text(data[$(dom).text()])
			    			//$appendCard.text(data['xmmc'])
			    		  })
			    		  $appendCard.show()
			    		  $(_this).parent().append($appendCard)
			    	  })
		     }});
		},
		FromAjaxLoadAction:function(options){
			var obj=new Object()
			var items=$(this).attr('name')+'List'
			if($(''+options.params).size()==1){
			   obj[$(''+options.params).attr('name')]=$(''+options.params).val()
			}else if($(''+options.params).size()>1){
			   obj[$(''+options.params).eq(0).attr('name')]=$(''+options.params).val()
			   $(options._this).find('[name!=""]').each(function(i,dom){
					obj[$(dom).attr('name')]=$(dom).text()
			  })
			}
			 
			var _this=$(this)
			 
		    $.ajax({
				 url:path+'/'+ $(_this).attr('load'),
			    // type: settings.method,
			     data:obj,
			     success: function(result){
			    	      $.each( result[items],function(i,data){
			    	    	   
			    	      
			    		      $(_this).find('[name!=\'\']').each(function(i,dom){
			    			  $(dom).val(data[$(dom).attr('name')])
			    			//$appendCard.text(data['xmmc'])
			    		  })
			    		  
			    	  })
		     }});
		},
		_show : function() {
			$(this).show('fast',function(){

				
			})
			
			
			
		},
		_hide : function() {
			$(this).hide()
		} ,
		_open : function(options) {
		        //$("#mask").show();
			    $(this).css({"z-index": "1003"})
			    $(this).show('fast',function(){
					var obj=new Object()
					var items=$(this).find('DIV[dcard="true"]').eq(0).attr('items')+'List'
					if($(''+options.params).size()==1){
						var k=$(''+options.params).attr('name')
						if((k!=undefined)){
						obj[k]=$(''+options.params).val()
						}
					//   obj[$(''+options.params).attr('name')]=$(''+options.params).val()
				      $(''+options.params).find('[name!=""]').each(function(i,dom){
				    		var k=$(dom).attr('name')
							if((k!=undefined)){
							obj[k]=$(dom).text()
							}
					  })
					  
					}else if($(''+options.params).size()>1){
					   obj[$(''+options.params).eq(0).attr('name')]=$(''+options.params).val()
					   
					   $(''+options.params).find('[name!=""]').each(function(i,dom){
							obj[$(dom).attr('name')]=$(dom).text()
					  })
					}
					
					 
				
					var _this=$(this)
					var _url=$(_this).find('DIV[dcard="true"]').eq(0).attr('requesturl')
				 
					$(_this).parent().find('DIV[dcard="true"]:gt(0)').remove()
				    $.ajax({
						 url:path+'/'+_url,
					    // type: settings.method,
					     data:obj,
					     success: function(result){
					    	      $.each( result[items],function(i,data){
					    	      var $appendCard=$(_this).find('DIV[dcard="true"]').clone().eq(0)
					    		  $($appendCard).find('span[value=true]').each(function(i,dom){
					    			 $(dom).text(data[$(dom).text()])
					    			//$appendCard.text(data['xmmc'])
					    		  })
					    		  $appendCard.show()
					    		  $(_this).find('DIV[dcard="true"]').parent().append($appendCard)
					    	  })
				     }});
			    	
			})
		},
		_close : function() {
			$("#mask").hide();
			$(this).hide()
		} ,
		SubmitAction:function() {
			//$(this).Validform()
			var showmsg=function(msg){//假定你的信息提示方法为showmsg， 在方法里可以接收参数msg，当然也可以接收到o及cssctl;
				alert(msg);
			}
			$(this).Validform({
				tiptype:function(msg,o,cssctl){
					//msg：提示信息;
					//o:{obj:*,type:*,curform:*}, obj指向的是当前验证的表单元素（或表单对象），type指示提示的状态，值为1、2、3、4， 1：正在检测/提交数据，2：通过验证，3：验证失败，4：提示ignore状态, curform为当前form对象;
					//cssctl:内置的提示信息样式控制函数，该函数需传入两个参数：显示提示信息的对象 和 当前提示的状态（既形参o中的type）;
					if(!o.obj.is("form")){//验证表单元素时o.obj为该表单元素，全部验证通过提交表单时o.obj为该表单对象;
						var objtip=o.obj.siblings(".Validform_checktip");
						cssctl(objtip,o.type);
						objtip.text(msg);
					}
				}
			});
		},
		
	};
	$.fn.tooltip = function(method) {
		if (methods[method]) {
			return methods[method].apply(this, Array.prototype.slice.call(
					arguments, 1));
		} else if (typeof method === 'object' || !method) {
			return methods.init.apply(this, arguments);
		} else {
			$.error('方法无效 ' + method + '  ');
		}
	};
})(jQuery);
 


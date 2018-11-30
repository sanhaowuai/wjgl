
//var _move=false;//移动标记  
//var _div
//var m_v
//var ln
//var rn    
//var w
//var zxdw=120
//var zxjl=19
//var leftbj=100 
//var items
//var title_h=40

   jQuery.fn.extend({ 
	   
	   
	   bindmousedown:function(divobj,e){
	    	   
			   if ($(divobj).hasClass("more_")||$(divobj).hasClass("delete_")||$(divobj).hasClass("close_")||$(divobj).hasClass("refresh_")){
				   return false
			   }else{
				   
				$(_this).loadbackground() 
 
			    if (ln && w && gbdx ) {
					_move = true;
				} else if (rn && w && gbdx) {
					_move = true;
				} else if (rn && gbdx) {
					_move = true;
					_x = e.pageX
					_div = $(divobj).css("z-index","999")
					_w = $(divobj).width()
				} else if (ln && gbdx) {
					_move = true;
					_x = e.pageX
					_div = $(divobj).css("z-index","999")
					_w = $(divobj).width()
				} else if (w && gbdx) {
					_move = true;
					_y = e.pageY
					_div = $(divobj).css("z-index","9999")
					_div.css("z-index","9999")
					_h = $(divobj).height()
				} else if (m_v && gbwz){
			  
			  _move=true;  
	 	      _x=e.pageX-parseInt($(divobj).css("left"));  
	 	      _y=e.pageY-parseInt($(divobj).css("top"));
	 	     $(divobj).css("position" , "absolute")
	 	     $(divobj).css("margin" , "0px")
	 	      if($(divobj).parents('.divbar').size() >0){
	 	    	  $('.divbar').hide()
	 	    	  _y= 144
	 	    	  $(divobj).css("width",($(divobj).attr('_w')*zxkd)+(($(divobj).attr('_w')-1*zxjl))+"px")
	 	    	   _x= $(divobj).css("width").replace("px","")*0.5
	 	    	  $(divobj).appendTo($(_this))
	 	    	  $(_this).xsdiv()
	 	      }
	 	     _div=$(divobj)
	 	      $(divobj).fadeTo(20, 0.8);//点击后开始拖动并透明显示  
			  }
	           return false
			  }
		  },
         getItems:function (){
         	return items; 
         },
         loadmydiv:function ( items2 ,path ){
          _x=0 
          _y=0 
          _w=0
          _h=0//鼠标离控件左上角的相对位置  
         _move=false
         dir=path
	     _move=false;//移动标记  
	     _div=null
	     m_v =false
	     ln=false
	     rn  =false  
	     w =false
	     zxdw=80
	     zxkd=38
	     zxgd=45
	     zxjl=10
	     leftbj=100
	     topbj=30
	     title_h=30
	     cols=12
	     gbdx=false
	     gbwz=false
	     maxrow=0
	     suojin=10
         _this=$(this)
         items=items2;
	     delitems=new Array()
	     $('body').css({ 
	    		"-moz-user-select" : "none",
				"-webkit-user-select" : "none",
				"-ms-user-select" : "none",
				"-khtml-user-select" : "none",
				"user-select" : "none"
	    })
	     
	    $(_this).append($('<div></div>').css("width",(zxkd*cols+zxjl*(cols-1))+"px"))
	    $(document).scroll(function(e) {
	    	//var screenHeight = $(window).height();//获取屏幕可视区域的高度。
			//var divHeight = $(".bottomDiv").height() + 1;//bottomDiv的高度再加上它一像素的边框。
			var scrollHeight = $(document).scrollTop();//获取滚动条滚动的高度。
			// if(!window.XMLHttpRequest){
				$(".divbar").css({"top": 80+"px"},'show','linear');	
			// }//判断是否为IE6，如果是，执行大括号中内容
	    })
	    $(window).resize(function(){
              $(_this).resizeload()
         });

	    $(this).on('mouseover',".move_div",function(e){
	    	$(this).css("background-color"," ")
	    })
	   
      $('#save_bj').click(function(){
    	  $(this).saveLayout($('#save_bj').attr('saveurl'))
//    	  mycomfirm2({
//    		  title : "您确定要保存当前布局么？",
//    		  Confirm:function(){$(this).saveLayout($('#save_bj').attr('saveurl'))},
//    		  Cancel:function(){myalert2({title:'操作已取消'})}
//    	  })
      })
	    
 
$(document).on('mouseup',function(e) {
$(_div).trigger('gbgnmkdx')
if (w && _move) {
	if ($(_div).attr("id") != null) { 
		$(this).gao($(_div).attr("id"),Math.ceil((_h - ((_y - e.pageY))) / (zxgd+zxjl)) < 1 ? 1: Math.ceil((_h - ((_y - e.pageY))) / (zxgd+zxjl)))
		$(this).finddiv()
		//load()
	}
}else if (rn && _move ){
	if ($(_div).attr("id") != null) {	
		var kuandu
		kuandu=Math.ceil((_w - ((_x - e.pageX))) / (zxkd+zxjl)) < 1 ? 1: Math.ceil((_w - ((_x - e.pageX))) / (zxkd+zxjl))
		var div_x
		div_x=($(_div).css('left').replace("px","")-leftbj)/ (zxkd+zxjl)
		if ((div_x+kuandu)>cols) kuandu=cols-div_x
		$(this).kuan($(_div).attr("id"),kuandu)
		//load()
		$(this).finddiv()
	}
}else if (m_v && _move ){
 	if ($(_div).attr("zt")=='new'){
  	   	 var item=Object({id:$(_div).attr('id'),
  	   		 ly:2,x: 1, y: 2, 
  	   		 width: $(_div).attr('_w'), 
  	   		 height:$(_div).attr('_h'),
  	   		 src:$(_div).attr('_src'),
  	   		 href:$(_div).attr('_href'),
  	   		 zjxxmc:$(_div).attr('_zjxxmc'),
  	   	     qxdm:$(_div).attr('_qxdm'),
  	   	     mbnr:$(_div).attr('_mbnr'),
  	   	     zjlx:$(_div).attr('_zjlx'),
  	   	     mbsjy:$(_div).attr('_mbsjy')
  	   		 })
  	     
		 items.push(item)
		 
		if ($(_div).attr('_zjlx')=='iframe'){
		 $("#"+$(_div).attr('id')).append("<div class='miframe' style='border:0px;z-index:-2;position : absolute;   width:"+205+"px ;height:"+105+"px' > <iframe src='' marginheight=0 frameborder=0 marginwidth=0 scrolling=no style='width:"+200+"px ;height:"+100+"px ;z-index:900 ;' ></iframe><div>")
		}else if($(_div).attr('_zjlx')=='mb1'){
  		var mb=$("<div class='mimb' style='overflow:hidden;z-index:-5;position : absolute;top:0px; width:"+205+"px ;height:"+105+"px' > <div>") 
		 $("#"+$(_div).attr('id')).find('.sw_title_bg').remove()
  		 $(mb).setTemplate($(_div).attr('_mbnr'))
		$("#"+$(_div).attr('id')).css({
			"background":"none",
			"box-shadow":"none", 
			"border-radius":"none", 
			"border":"none",
		})
		if($(_div).attr('_mbsjy')!='' &&$(_div).attr('_mbsjy')!=null){
			
			   var posturl
		         var dataType
		         if ("http"==$(_div).attr('_mbsjy').substring(0,4)){
		        	 
		        	 dataType='JSONP'
		        	 posturl=$(_div).attr('_mbsjy')
		         }else{
		        	 dataType ='JSON'
		        	 posturl=''+rooturl+'/'+$(_div).attr('_mbsjy')
		         }
			$.ajax({
				url:posturl,
				type:'POST',
	        	dataType: dataType,
	        	jsonp:'jsonp',
	        	success:function(data){
	        		$(mb).processTemplate(data) 
	        	},
	        	error:function(){
	        		 var mm='<div class="ibox-title">'+          
				    	'<div class="kc_bg" onclick="">'+         
				    	'<div class="big_icon1"><span class="fa fa-exclamation-circle" style="color:#dd4444" ></span></div>'  +        
				    	'<div class="kctitle" style="color:#dd4444">'+''+'组件数据错误</div>  '+     
				    	'</div>  '+    
				    	'</div>'
				    	$(mb).setTemplate(mm)
				    	$(mb).processTemplate(null)
	        	}})
				
		}else{
			
			$(mb).processTemplate()
		}
  		$(mb).setParam('path', dir )
  		$("#"+$(_div).attr('id')).html('')
  		$(mb).appendTo($("#"+$(_div).attr('id')))
       		
  		//$(mb).parent().append($('<div class="delete_ ibox-tools"><a class="close-link"><i class="fa fa-times"></i></a></div>'))
		$(mb).parents('.move_div').css("overflow","visible")
		}
         //alert(1)
		 $(_div).removeAttr('zt');
  	   	 $(_div).removeAttr('_w');
  	   	 $(_div).removeAttr('_h');
  	   	 $(_div).removeAttr('_src');
  	   	 $(_div).removeAttr('_zjxxmc');
  	   	 $(_div).removeAttr('_href');
  	   	 $(_div).removeAttr('_qxdm');
  	   	 $(_div).removeAttr('_mbnr');
  	   	 $(_div).removeAttr('_mbsjy');
  	   	 
  	   	 
		 $(_div).append($("<div class='remove_div'  style='position:absolute;z-index:200;  '>  <div class='indexicon indexicon5_3 mr5 mt5 delete_'></div> </div>")
       .css('top','0px') 
       .css('left','0px')
       .css('width',$(_div).css("width"))
       .css('height',$(_div).css("height"))
     )
  	   	 
	}
	if ($(_div).attr("id") != null) {	
		var move_x
		var move_y
		move_x=Math.ceil( ($(_div).offset().left-leftbj+zxjl)/ (zxkd+zxjl) )< 1 ? 0: Math.ceil(($(_div).offset().left-leftbj+zxjl) / (zxkd+zxjl))-1
		move_y=Math.ceil( $(_div).offset().top/ (zxgd+zxjl)) < 1 ? 0: Math.ceil($(_div).offset().top / (zxgd+zxjl))
 
    if ( move_x + Math.ceil(($(_div).width()+zxjl)/(zxkd+zxjl)) > cols  ) move_x = cols-  Math.ceil(($(_div).width()+zxjl)/(zxkd+zxjl))            
 
    $(this).yidong($(_div).attr("id"),move_x,move_y)
		//load()
		$(this).finddiv()
	}
}
	_move = false
	ln = false
	rn = false
	w = false
	m_v=false
	$('.divbar').show()
	if ($('.divbar').is(':visible'))   {
		$('.close_').show()
		$('.delete_').show()
	}
	$(_div).fadeTo(20, 1);
	$(".move_div").css("z-index","0")
	//$(".remove_div").remove()
})
	$(document).on('mousemove',".move_div",function(e) {
		    if ( !_move){
			ln = ((e.pageX || e.originalEvent.layerX || 0) - $(this).offset().left) < 10
			rn = ((e.pageX|| e.originalEvent.layerX || 0) - $(this).offset().left) > $(this).width() - 10
			w = ((e.pageY|| e.originalEvent.layery || 0) - $(this).offset().top) > $(this).height() - 15
		    if((e.pageX || e.originalEvent.layerX || 0)> $(this).offset().left &&
		          (e.pageX || e.originalEvent.layerX || 0) <  $(this).offset().left + $(this).width()-80 &&
		          (e.pageY || e.originalEvent.layerY || 0)> $(this).offset().top &&
		          (e.pageY || e.originalEvent.layerY || 0)< ($(this).offset().top +$(this).height()-10)){
		          m_v=true
		          if (gbdx) {
		          $(this).css({
						"cursor" : "move"
				  })
		          }
		    } 
		    }
			 if ( ln||rn||w ){
				//ln || 
				if (rn && gbdx ) {
					if($(this).parents('.divbar').size()>0) return
					$(this).css({
						"cursor" : "w-resize"
					})
				}
				if (w && gbdx) {
					if($(this).parents('.divbar').size()>0) return
					$(this).css({
						"cursor" : "n-resize"
					})
				}
//				if (rn && w) {
//					$(this).css({
//						"cursor" : "nw-resize"
//					})
//				}
//				if (ln && w) {
//					$(this).css({
//						"cursor" : "ne-resize"
//					})
//				}
			} else {
				$(this).css({
					"cursor" : "auto"
					})
				}
           })
		$(document).on('mousemove', function(e) {
						    if (w && _move) { 
						    	if($(this).parents('.divbar').size()>0) return
								$(_div).css({
									"height" : _h - ((_y - e.pageY)) + "px"
								});
								$(_div).find('iframe').css({
									"height" : _h - ((_y - e.pageY)) - title_h -10 + "px"
								});
								$(_div).find('.mimb').css({
									"height" : _h - ((_y - e.pageY)) - title_h  + "px"
								}); 
								$(_div).find('.remove_div').css({
									"height" : _h - ((_y - e.pageY))   + "px"
								}); 
								
							    }else if (rn && _move){
							    if($(this).parents('.divbar').size()>0) return
								$(_div).find('iframe').css({
									"width" : _w - ((_x - e.pageX))-10 + "px"
								});
								$(_div).find('.mimb').css({
									"width" : _w - ((_x - e.pageX))-10 + "px"
								});
								$(_div).find('.remove_div').css({
									"width" : _w - ((_x - e.pageX))-10 + "px"
								});
							 
								$(_div).css({
									"width" : _w - ((_x - e.pageX)) + "px"
								});
								 
								
							}else if(m_v && _move){		
						    // $(".divbar").remove()
							 $(_div).css("z-index","9999")
							 
		 	              	 var x=e.pageX-_x;//移动时根据鼠标位置计算控件左上角的绝对位置  
		 	                 var y=e.pageY-_y;  
		 	                 $(_div).css({top:y,left:x});//控件新位置  
							}
		})
		//按钮事件 关闭
		$(this).on('click','.close_,.delete_',function(e){
			 
			if($(this).parents('.divbar').size()>0) return
			 
			  if($('.butsea').is(':visible')==false && $('#editbj').is(':visible')==false) return
			 
			$(this).delete_($(this).parents('.move_div').attr('id'))
			$(this).finddiv()
			return false
		})
		//按钮事件 更多
		$(this).on('click','.more_',function(e){
			if($(this).parents('.divbar').size()>0) return
			var _thisid=$(this).parents('.move_div').attr('id')
			var s_div
			s_div = $.grep(items, function(n, i) {
				return n.id ==_thisid;
			})
			if (s_div.length > 0 && (s_div[0].href!='' && s_div[0].href!=null) ) {   
		 
				top.createTab(s_div[0].qxdm,s_div[0].zjxxmc,dir+"/"+s_div[0].href)
			}
			return false
		 })
		//按钮事件 刷新
		$(this).on('click','.refresh_',function(e){
			if($(this).parents('.divbar').size()>0) return
			var _src=$(this).parents('.move_div').find('iframe').attr('src')
			$(this).parents('.move_div').find('iframe').attr('src',_src)
			return false
		})
		 
		$(document).on('mouseout', ".move_div",function() {
									$(this).css({
										"background-color" : " "
									})
		})
        $(_this).load()  
        },
        load:function() {
        zxkd=Math.floor(($('body').css('width').replace("px","")-suojin*2-(zxjl*(cols-1)))/ cols)
        leftbj= ($('body').css('width').replace("px","")-(zxkd*cols+zxjl*(cols-1)) )/2
        $(this).css("left",leftbj+"px")
       
		$.each(items, function(i, v){
			var xx, yy, ww, hh
			xx = 0
			yy = 0
			ww = 0
			hh = 0
			if (v.x > 0) {
				xx = (v.x) * (zxkd+zxjl)
			}
			if (v.y > 0) {
				yy = (v.y) * (zxgd+zxjl)
			}
			if (v.width > 1) {
				ww = (v.width - 1) * zxjl
			}
			if (v.height > 1) {
				hh = (v.height - 1) * zxjl
			}
			if ((v.height*1+v.y*1)>maxrow){
				maxrow=v.height*1+v.y*1
			}
		  if($('#' + v.id).size()==0){
		var n_div=	$('<div></div>').css({
				"position" : "absolute", 
				"width" : (zxkd * v.width + ww) + "px",
				"height" : (zxgd * v.height + hh) + "px",
				"-moz-user-select" : "none",
				"-webkit-user-select" : "none",
				"-ms-user-select" : "none",
				"-khtml-user-select" : "none",
				"user-select" : "none",
				"display" : "hidden",
				"background":"#ffffff",
				//"box-shadow":"1px 1px 2px #777777", 
				"border-radius":"4px 4px 0 0", 
				"border":"1px solid #ccc",
				//"overflow":"auto",
		        "z-index":"10",
		        "opacity": "1",
				"top" : (yy+zxjl+topbj) + "px",
				"left" : (leftbj + xx) + "px"  
			}).attr('class', 'move_div' )
			.attr("id",v.id)
			 

		 
			if(v.zjlx=='iframe'){
			$(n_div).append("<div class='miframe' style='overflow:hidden;z-index:-2;position : absolute;top:37px; width:"+(zxkd * v.width + ww-4)+"px ;height:"+(zxgd * v.height + hh-title_h-4)+"px' >  <iframe src='"+dir+"/"+v.src+"' marginheight=0 frameborder=0 marginwidth=0 scrolling=no style='padding:-4px;width:"+(zxdw * v.width + ww-8)+"px ;height:"+(zxdw * v.height + hh-title_h-8)+"px ;z-index:900 ;' ></iframe>   <div>")
		    $(n_div).appendTo(_this);
			$(n_div).append($("<div><div>") 
					.css("z-index", "888")
					.addClass('sw_title_bg')
					.append($(' <div class="sw_title" style="height:'+title_h+'px;" >'+v.zjxxmc+'</div>'))
					.append($(' <div class="indexicon indexicon1_5 mr5 mt5"></div>').addClass('more_'))
					.append($('<div class="indexicon indexicon3_19 mr5 mt5"></div>').addClass('refresh_'))
 					)
			}else if(v.zjlx=='mb1'){
				 $(n_div).css({
				"background":"none",
				//"box-shadow":"1px 1px 2px #777777", 
				"border-radius":"none", 
				"border":"none",
				 })
				var mb=$("<div class='mimb' style='overflow:hidden;z-index:-5;position : absolute;top:0px; width:"+(zxkd * v.width + ww-4)+"px ;height:"+(zxgd * v.height + hh-4)+"px' > <div>") 
				$(mb).setTemplate(v.mbnr)
				//$(mb).append($('<div class="delete_ ibox-tools"><a class="close-link"><i class="fa fa-times"></i></a></div>'))
				if(v.mbsjy!='' && v.mbsjy!=null){
			 
		         var posturl
		         var dataType
		         if ("http"==v.mbsjy.substring(0,4)){
		        	 
		        	 dataType='JSONP'
		        	 posturl=v.mbsjy
		         }else{
		        	 dataType ='JSON'
		        	 posturl=''+rooturl+'/'+v.mbsjy
		         }
			$.ajax({
				url:posturl,
				type:'POST',
	        	dataType: dataType,
	        	jsonp:'jsonp',
	        	success:function(data){
	        		$(mb).processTemplate(data)
	        	},
			    error:function(d ){
			    	 
			    var mm='<div class="ibox-title">'+          
			    	'<div class="kc_bg" onclick="">'+         
			    	'<div class="big_icon1"><span class="fa fa-exclamation-circle" style="color:#dd4444" ></span></div>'  +        
			    	'<div class="kctitle" style="color:#dd4444">'+v.zjxxmc+'组件数据错误</div>  '+     
			    	'</div>  '+    
			    	'</div>'
			    	$(mb).setTemplate(mm)
			    	$(mb).processTemplate(null)
			    }
			    })
				}else{
					$(mb).setParam('path', dir )
					$(mb).processTemplate(null)
				}
				$(mb).setParam('path', dir )
				$(mb).appendTo(n_div)
				$(n_div).appendTo(_this);
			  }
			  }else{ 
			  // $('#' + v.id).find('mimb').append($('<div class="delete_ ibox-tools"><a class="close-link"><i class="fa fa-times"></i></a></div>'))
		       $('#' + v.id).animate({
				  "width" : (zxkd * v.width + ww) + "px",
				  "height" : (zxgd * v.height + hh) + "px",
				  "top" : (yy+zxjl+topbj) + "px",
				  "left" : (leftbj + xx) + "px"
				},500,function(){
					 $('.bjgz').remove();
				    if ($(_div).attr("id")==v.id)	
					$('#' + v.id).find('iframe').attr('src',dir+"/"+v.src)
					
					$('#' + v.id).find('.remove_div').css({
							width:$('#' + v.id).css("width") ,
							height:$('#' + v.id).css("height")
				    })
					
				})
				$('#' + v.id).find(".mimb").css({
					width:(zxkd * v.width + ww-4)+"px" ,
					height:(zxgd * v.height + hh)+"px" 
				})
				$('#' + v.id).find(".miframe").css({
					width:(zxkd * v.width + ww-4)+"px" ,
				}).find('iframe').css({
					width:(zxkd * v.width + ww-8)+"px" ,
					height:(zxgd * v.height + hh-title_h-16)+"px" 
				})
				
		
			} 
		})
	  $(_this).css('height',(maxrow*zxgd + maxrow *zxjl +20)+"px")
	},
	resizeload:function() {
        zxkd=Math.floor(($('body').css('width').replace("px","")-suojin*2-(zxjl*(cols-1)))/cols)
        leftbj= ($('body').css('width').replace("px","")-(zxkd*cols+zxjl*(cols-1)) )/2
		$.each(items, function(i, v){
			var xx, yy, ww, hh
			xx = 0
			yy = 0
			ww = 0
			hh = 0
			if (v.x > 0) {
				xx = (v.x) * (zxkd+zxjl)
			}
			if (v.y > 0) {
				yy = (v.y) * (zxgd+zxjl)
			}
			if (v.width > 1) {
				ww = (v.width - 1) * zxjl
			}
			if (v.height > 1) {
				hh = (v.height - 1) * zxjl
			}
			if ((v.height*1+v.y*1)>maxrow){
				maxrow=v.height*1+v.y*1
			}
			if($('#' + v.id).find('.delete_').size()==0){
				//if($('#editbj').is(':visible')==true)  
				//$('#' + v.id).append($('<div class="delete_ ibox-tools"><a class="close-link"><i class="fa fa-times"></i></a></div>'))
			}

			$('#' + v.id).css({
					  "width" : (zxkd * v.width + ww) + "px",
					  "height" : (zxgd * v.height + hh) + "px",
					  "top" : (yy+zxjl+topbj) + "px",
					  "left" : (leftbj + xx) + "px"
					},500,function(){
						$('#' + v.id).find('.remove_div').css({
							width:$('#' + v.id).css("width") ,
							height:$('#' + v.id).css("height")
				        })
						
					}).find(".miframe").css({
						width:(zxkd * v.width + ww-4)+"px" ,
						height:(zxgd * v.height + hh-title_h-4)+"px"
					}).find('iframe').css({
						width:(zxkd * v.width + ww-11)+"px" ,
						height:(zxgd * v.height + hh-title_h-11)+"px" 
			         })
			         $('#' + v.id).find('.mimb').css({
							width:(zxkd * v.width + ww-11)+"px" ,
							height:(zxgd * v.height + hh-11)+"px" 
				      })
				      
				
		})
	  $(_this).css('height',(maxrow*zxgd + maxrow *zxjl +20)+"px")
	},
	loadbackground:function(){
		if ($('.divbar').is(':visible'))  return false;
		var _this=$(this)
		if($('.bjgz').size()==0){
		for(var vy=0 ;vy<maxrow+1 ;vy++){
		for(var vx=0 ;vx<cols ;vx++){
			var xx, yy, ww, hh
			xx = 0
			yy = 0
			ww = 0
			hh = 0
			if (vx > 0) {
				xx = (vx) * (zxkd+zxjl)
			}
			if (vy > 0) {
				yy = (vy) * (zxgd+zxjl)
			}
				ww = zxjl
				hh = zxjl
		$('<div></div>').css({
			"position" : "absolute", 
			"width" : (zxkd  ) + "px",
			"height" : (zxgd ) + "px",
			"-moz-user-select" : "none",
			"-webkit-user-select" : "none",
			"-ms-user-select" : "none",
			"-khtml-user-select" : "none",
			"user-select" : "none",
			"display" : "hidden",
			"border":"1px dashed #aaaaaa",
	        "z-index":"0",
			"top" : (yy+zxjl+topbj) + "px",
			"left" : (leftbj + xx)  + "px"  
		}).addClass('bjgz').appendTo(_this)
		 }
	   }
	  }
	},
	finddiv:function () {
		var l = new Array()
		var lc = new Array()
		$.each(items, function(i, v) {
			for (var x = v.x; x <= v.x*1 + v.width*1 - 1; x++) {
				for (var y = v.y; y <= v.y*1 + v.height*1 - 1; y++) {
					l.push({
						id : v.id,
						_x : v.x,
						_y : v.y,
						x : x,
						y : y,
						ly : v.ly
					})
				}
			}
		})
		 
		var dyh
		dyh = '0'
		$.each(items, function(i, v) {
			if (v.y > 0) {
				var sum_push = new Array()
				for (var x = v.x; x <= v.x*1 + v.width*1 - 1; x++) {
					y = v.y - 1
					var _push
					_push = $.grep(l, function(n, i) {
						return (n.x == x && n.y == y)
					})
					$.each(_push, function(i, _v) {
						sum_push.push(0)
					})
				}
				if (sum_push.length == 0) {
					v.y = v.y - 1
					dyh = '1'
				}
			}
		})
		if (dyh == '1') {
			$(this).finddiv()
		}else{
			$(this).load()
		}
	},
	gao:function (id, gd) {
		var l = new Array()
		$.each(items, function(i, v) {
			for (var x = v.x; x <= v.x*1 + v.width*1 - 1; x++) {
				for (var y = v.y; y <= v.y*1 + v.height*1 - 1; y++) {
					l.push({id : v.id,_x : v.x,_y : v.y,x : x,y : y,ly : v.ly})
				}
			}
		})
		var s_div
		s_div = $.grep(items, function(n, i) {
			return n.id == id;
		})
		if (s_div.length > 0) {
			$.each(items, function(i, v) {
				if (v.y > s_div[0].y) {
					if ((gd - s_div[0].height) > 0) {v.y = v.y*1 + (gd *1- s_div[0].height*1)}
				}
			})
			s_div[0].height = gd
		}
	},
	
	delete_:function (id) {
		 
		if($('.butsea').is(':visible')==false  && $('#editbj').is(':visible')==false ) return false
	 
		 
		var delitem=$.grep(items, function(n, i) {
			return n.id == id;
		}) 
		items = $.grep(items, function(n, i) {
			return n.id != id;
		}) 
		 
		var changdu=$.grep(delitems, function(n, i) {
			return n.id == delitem[0].id;
		}).length
		$('#'+id).remove()
	//	if (changdu == 0 ) {
			 delitems.push(delitem[0])
			 if ($('.divbar').size()>0){
			 _left=($('.divbar').find('.move_div').size())*240
		   	 $('<div></div>').css({
				 	//"position" : "absolute", 
					"width" : 210+ "px",
					"height" : 100 + "px",
					"float":"left",
					"margin":'8px',
					"-moz-user-select" : "none",
					"-webkit-user-select" : "none",
					"-ms-user-select" : "none",
					"-khtml-user-select" : "none",
					"display" : "hidden",
					"box-shadow":"1px 1px 2px #777777", 
					"border":"1px solid #ccc", 
					"background":"#ffffff", 
					"border-radius":"4px 4px 0 0", 
					"overflow":"auto", 
					"user-select" : "none",
					"top" : 20 + "px",
					"left" :_left + "px" 
				}).attr('class', 'move_div')
				.attr('id',  delitem[0].id)
				.attr('zt', 'new')
				.attr('_w', delitem[0].width)
				.attr('_h', delitem[0].height)
				.attr('_src', delitem[0].src)
				.attr('_href', delitem[0].href)
				.attr('_zjxxmc', delitem[0].zjxxmc)
				.attr('_qxdm', delitem[0].qxdm)
				.attr('_mbsjy', delitem[0].mbsjy)
				.attr('_mbnr', delitem[0].mbnr)
				.attr('_zjlx', delitem[0].zjlx)
		   	    .click(function(e){
		   	     _div=$(this)	
				// return false
		   	     }).appendTo($('.divbar'))
		   	     if (delitem[0].zjlx='iframe'){
		   	    	 $("#"+delitem[0].id).append($("<div class='sw_title_bg' style='z-index:888' ><div class='sw_title'>"+delitem[0].zjxxmc+"</div> </div><div class='indexicon indexicon1_5 mr5 mt5 more_'></div><div class='indexicon indexicon3_19 mr5 mt5 refresh_'></div><div>")) ;
		   	     }else if(delitem[0].zjlx='mb1'){
		   	    	 $("#"+delitem[0].id).setTemplate(delitem[0].mbnr)
		   	    	 $("#"+delitem[0].id).processTemplate(null)
		   	     }
			 }

		//}
		
	},
	
	kuan:function (id, kd) {
		var l = new Array()
		$.each(items, function(i, v) {
			for (var x = v.x; x <= v.x*1 + v.width*1 - 1; x++) {
				for (var y = v.y; y <= v.y*1 + v.height*1 - 1; y++) {
					l.push({id : v.id,_x : v.x,_y : v.y,x : x,y : y,ly : v.ly})
				}
			}
		})
		var s_div
		s_div = $.grep(items, function(n, i) {
			return n.id == id;
		})
		if (s_div.length > 0) {
			s_div[0].width = kd
			var v_xx=0
			$.each(items, function(i, v) { 		 
			if (v.y*1 + v.height*1 - 1 >=s_div[0].y && v.id!=s_div[0].id) {	  
  					   if (v.y>=s_div[0].y){
  					   	if (s_div[0].height > v_xx ){
  					   	 v_xx	=   s_div[0].height
  					   	}
  					   }else{
  					   	if ( v.height>=v_xx){
  					   		v_xx	=  s_div[0].height*1 + v.height*1 
  					   	}
  					   }   
 					  }
			})
			$.each(items, function(i, v) { 		 
			if (v.y*1 + v.height*1 - 1 >=s_div[0].y*1 && v.id!=s_div[0].id) {	  
  					   	 v.y = v.y + v_xx 
 					  }
			})
			s_div[0].width = kd
		}
	},
	yidong:function (id, move_x,move_y) {
		var l = new Array()
		
		$.each(items, function(i, v) {
			for (var x = v.x; x <= v.x*1 + v.width*1 - 1; x++) {
				for (var y = v.y; y <= v.y*1 + v.height*1 - 1; y++) {
					l.push({id : v.id,_x : v.x,_y : v.y,x : x,y : y,ly : v.ly})
				}
			}
		})
		var s_div
		s_div = $.grep(items, function(n, i) {
			return n.id == id;
		})
			s_div[0].x = move_x
			s_div[0].y = move_y
		if (s_div.length > 0) {
			$.each(items, function(i, v) { 		 
				if (v.y*1 + v.height*1 - 1 >=move_y && v.id!=s_div[0].id) {	  
					   v.y =  v.y + move_y+s_div[0].height
				  }
			})
		}
	},
	createDiv:function(url){
	 var _this=$(this)
	 var tcbj
	 tcbj= ($('body').width()-800 )/2
	 $.getJSON(url+"?R"+Math.random(),function(result){
	  if($('.divbar').size()==0){
		    var divbar=$('<div class="divbar" ></div>').css({
		    	width:"740px",
		        height:"240px", 
		        position : "absolute",
		        left: tcbj+"px",
		        top:topbj+"px"
		    }).animate({
		    	  height:"360px"
		    }).appendTo(_this)
		    $('<span>×</span>').css({
		    	"position" : "absolute", 
		    	"top" : "2px", 
		    	"right" : "5px", 
		    	"line-height":"15px",
		    	"font-weight":"blod",
		     	"font-size":"20px",
		    	"width":'15px',
		    	"height":'15px',
		    	"color":'#777777',
		    	"font-size":'24px',
		    	"cursor" : "pointer"
		    	}).click(function(e){
		    		$(divbar).remove()
		    	}).appendTo(divbar)
		}
	    var _left=0
	    $.each(delitems, function(i, v) {
	    	 var _divbar = $.grep(result, function(n, i) {
	 			return n.id == v.id;
	 		 })
	 		  if(_divbar.length==0) {
	 			  
	 			 result.push(v)
	 		  }
	    });
	    $.each(result, function(i, v) {	
	     var _divbar = $.grep(items, function(n, i) {
			return n.id == v.id;
		 })
		 var barcd=$('#'+v.id).size()
		 if(_divbar.length==0 && barcd==0 ) {
		 _left=($('.divbar').find('.move_div').size())*240
	   	 $('<div></div>').css({
			 	//"position" : "absolute", 
	   		    "float":"left",
	   		    "margin":"8px", 
				"width" : 210+ "px",
				"height" : 100 + "px",
				"-moz-user-select" : "none",
				"-webkit-user-select" : "none",
				"-ms-user-select" : "none",
				"-khtml-user-select" : "none",
				"display" : "hidden",
				"overflow":"hidden", 
				"background":"#ffffff",
				"box-shadow":"1px 1px 2px #777777", 
				"border-radius":"4px 4px 0 0", 
				"border":"1px solid #ccc",
				"user-select" : "none",
				"top" : 20 + "px",
				"left" :_left + "px" 
			}).attr('class', 'move_div')
			.attr('id',  v.id)
			.attr('zt', 'new')
			.attr('_w', v.width)
			.attr('_h', v.height)
			.attr('_src', v.src)
			.attr('_href', v.href)
			.attr('_zjxxmc', v.zjxxmc)
			.attr('_qxdm', v.qxdm)
			.attr('_mbnr', v.mbnr)
			.attr('_zjlx', v.zjlx)
			.attr('_mbsjy', v.mbsjy)
	   	    .click(function(e){
	   	      
	   	     _div=$(this)	
			// return false
	   	     }).appendTo($('.divbar'))
	   	      //
	   	    if (v.zjlx=='iframe'){
	   	    	$("#"+v.id).append($("<div class='sw_title_bg' style='z-index:888' ><div class='sw_title'>"+v.zjxxmc+"</div></div><div class='indexicon indexicon1_5 mr5 mt5 more_' style='display:none'></div><div class='indexicon indexicon3_19 mr5 mt5 refresh_' style='display:none'></div></div>")) ;
	   	    }else{
	   	    	var m=$('<div style="position:relative" ><div>')
	   	    	var m2=$('<div><div>')
	   	    	var m3=$('<div style="position:absolute;width:210px;height:100px;top:0px;left:0px;z-index:100 " ><div>')
	   	    	$(m2).setTemplate(v.mbnr)
	   	    	$(m2).processTemplate(null)
	   	    	$(m2).appendTo(m)
	   	    	$(m3).appendTo(m)
	   	    	$("#"+v.id).append(m)
	   	    	//$("#"+v.id).setTemplate(v.mbnr)
	   	    	//$("#"+v.id).processTemplate(null)
	   	    } 
	   	  

		 }
		 })  
	 })
	 $('.more_,.close,.refresh_').hide()
	},
	
  xsdiv:function (){
	  $('.divbar').css('z-index',"888")
	  $('.divbar').find('.move_div').each(function(i,dows){
		  $(dows).animate({"left":i*240})
	  })  
	  
  },
  startedit:function(){
      $('.move_div').each(function(i,doms){
    	   //$(doms).append($("<div class='close_ ibox-tools'><a class='close-link'><i class='fa fa-times'></i></a></div>"))
	       $(doms).append($("<div class='remove_div'  style='position:absolute;z-index:200;  '>  <div class='indexicon indexicon5_3 mr5 mt5 delete_'></div> </div>")
	                        .css('top','0px') 
	                        .css('left','0px')
	                        .css('width',$(doms).css("width"))
	                        .css('height',$(doms).css("height"))
	                      )
	  })
	   
	 // $('#editbj').show()
	  gbdx=true
	  gbwz=true
	  $(this).on('mousedown',".move_div,.more_,.close_ ,.delete_ ,.refresh_", function(e){
		   if ($(this).hasClass("more_")||$(this).hasClass("delete_")||$(this).hasClass("close_")||$(this).hasClass("refresh_")){
			   return false
		   }else{
			$(_this).bindmousedown($(this),e)
		   }
		} ) 
		
	   
	  $('.more_').hide()
	  $('.refresh_').hide()
	  $('.close_').show()
	  $('.delete_').show()
	//  $(this).resizeload()

  },
  endedit:function(){
	 // $('#editbj').hide()
	  $(".remove_div").remove()
	  $(".delete_").remove()
	  $(this).unbind('mousedown')  
	  gbdx=false
	  gbwz=false
	  $('.more_').show()
	  $('.refresh_').show()
	//  $(this).resizeload()
  },
  saveLayout :function(url){
	  $.ajax({ 
          type:"POST", 
          url:url+"?r="+Math.random(), 
          dataType:"json",      
          contentType:"application/json",               
          data:JSON.stringify(items), 
          success:function(data){   
        	  if(data.SUCCESS){
        		  $('.drag_p').endedit()
        		 // $('#editbj').hide()
        		  $('.close_').hide()
        		  $('.delete_').hide()
        		  alert('布局已保存')
        	  }
          } 
       }); 

	}
  }) ;
 
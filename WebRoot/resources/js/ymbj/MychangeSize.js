  
          	var _resazemove8=false
   	        var _resazemove6=false
   	        var _resazemove4=false
   	        var _resazemove2=false
   	        var _resazemove9=false
   	        var  darg_div8
   	        var v_this =null
   	        var _startTDRowNum=0
   	        var _targetTag
	   	      var _startTDColNum=0
	   	      var _tdmove=false
	   	      var str,std,etr,etd
	   	      var _resaze=function(){}
	   	      var KEYLEFT=37,KEYTOP=38,KEYRIGHT=39,KEYBOTTOM=40,KEYDELETE=46
	   	      var KEYSHIFT =false ,KEYCTRL=false
            var bc=1
 	        var _startY=0
   	        var _startYY=0
   	        var _startX=0
   	        var _startXX=0
   	        var _startH=0
   	        var _startW=0
   	        var _startnextW=0
            $.fn.MychangeSize = function() {
//   	        var _startY=0
//   	        var _startYY=0
//   	        var _startX=0
//   	        var _startXX=0
//   	        var _startH=0
//   	        var _startW=0
   	         
	   	     v_this = $(this)
	   	    var _width=$(v_this).width()
	   	    var _height=$(v_this).height()
	   	    $(this).off()
	   	    $('#mtarget').find('*').removeClass('selectedZuJian')
	   	    $(this).addClass('selectedZuJian')
	   	    $('.selectedzujian,.selectedzujiandian').remove()
	   	    var darg_div=$('<div></div>')
	   	    $(darg_div).addClass("selectedzujian")
	   	    $(darg_div).css({
	   	    	"position":"absolute",
	   	    	"border":"1px dashed #000",
	   	    })
	   	    //$('#mtarget').append(darg_div)
	   	    var darg_div1=$('<div></div>')
	   	    $(darg_div1).addClass("selectedzujiandian")
	   	    $(darg_div1).css({ "cursor":"se-resize"})
	   	    var darg_tag=$('<div><span></span></div>')
	   	    $(darg_tag).addClass("selectedzujiandian darg_tag")
	   	    $(darg_tag).html('<b>'+$(v_this).prop('tagName')+'</b>')
	   	    $(darg_tag).on('click',function(){
	   	    	var $preview
	   	    
	   	    	$('#styleEdit').dialog({
	   	    		closed: false,
				    cache: false,
				    modal: true,
				    tagName:$(v_this).prop('tagName'),
				    onOpen:function(){
				    	var main_data=new Array()
//				    	if($(v_this).prop('tagName')=='DIV'){
//				    		$('#col-width').numberspinner('enable')
//				    		$('#col-left').numberspinner('enable')
//				    	}else{
//				    		$('#col-width').numberspinner('disable')
//				    		$('#col-left').numberspinner('disable')
//
//				    	}
//				    	if ($(v_this).hasClass('dataform')){
//				    		data=_bootstrapClass.form.data
//				    	}else if($(v_this).prop('tagName')=='DIV'){
//				    		data=_bootstrapClass.grid_system.data
//				    	}else if($(v_this).prop('tagName')=='TABLE'){
//				    		data=_bootstrapClass.table.data
//				    	}else if($(v_this).prop('tagName')=='INPUT'){
//				    		if($(v_this).attr('type')=='button'){
//				    			data=_bootstrapClass.button.data
//				    		}else{
//				    			data=_bootstrapClass.input.data
//				    		}
//				       }
				        $preview=$(v_this).clone()
				        $preview.css("width",null)
				        var _class=$preview.attr("class")
				    	var _classlist=new Array()
							$.ajax({
						       type: "get",
						       url: path+"/resources/js/ymbj/bootstrapClass.json",
						       cache:false,
						       async:false,
						       dataType: "json",
						       success: function(data){
						    	    main_data=[]
						    	    $('#styleselectlist').html("")
						        	 $.each(data,function(k,obj){
						        		 var combobox_='<input id="cc"  class="stylecombobox" style=" height:25px" >'
						        			 $.each(obj.data,function(k,obj){
						        				 main_data.push(obj)
						        			 })
						        		     $('#styleselectlist').append($(combobox_))
						        		     $('#styleselectlist').find('.stylecombobox').last().combobox({
						        		    	 prompt:obj.text,
						        		    	 data:obj.data,
						        		    	 width:140,
						        		    	 valueField:'id',
						        		    	 textField:'text',
						        		    	 groupField:'type',
						        		    	 onChange:function(newValue,oldValue){
						        		    		 var values=$(".editclass").tagbox('getValues')
						        		    		 values.push(newValue)
						        		    		 $(".editclass").tagbox('setValues',values)
						        		    	 }
						        		     });
						        		 
									    	$.each(_class.split(" "),function(i,bj){
									    		var _temp
									    		_temp=$.grep(obj.data,function(key,ii){
									    			return key.id==bj
									    		})
									    		if (_temp.length>0){
									    			 
									    			$('#styleselectlist').find('.stylecombobox').last().combobox('setValue',bj)
									    		}
									    	})
						        	 })
						        	 
						        	 
						        }
						});
										        
				        var combobox_='<input id="cc" name="dept" value="aa">'
				    	   	$(combobox_).combobox({
				        	    valueField:'id',
				        	    textField:'text'
				        	});

				    	$.each(_class.split(" "),function(i,obj){
				    		var _temp
				    		_temp=$.grep(main_data,function(key,ii){
				    			return key.id==obj
				    		})
				    		if (_temp.length>0){
				    			_classlist.push(obj)
				    		}
				    	})
				    	
				     
				    	$("#editTagPreview").panel({
				    		content:$preview
				    	})
				    	$(".editclass").tagbox({
				    		data: main_data,
				    		onChange:function(newValue,oldValue){
				    			 $preview.css("width",null)
								 $.each(oldValue,function(i,obj){
									 if(obj=='col-lg' || "col-lg-offset"==obj ){
										 for(var k=0 ; k<12 ; k++){
											 $preview.removeClass(obj+"-"+k)
										 }
									 }else{
										 $preview.removeClass(obj)
									 }
								 })
								 $.each(newValue,function(i,obj){
									 $preview.removeClass(obj+"-")
									 if(obj=='col-lg'){
										 $preview.addClass(obj+"-"+$('#col-width').numberspinner('getValue'))
									 }else if("col-lg-offset"==obj){
										 $preview.addClass(obj+"-"+$('#col-offset').numberspinner('getValue'))
									 }else{
										 $preview.addClass(obj)
									 }
								 })
			                },
			                value:_classlist
				    	});
		
			 			
			 		 
				    },
	   	    	buttons:[{
					text:'Save',
					handler:function(){
						$(v_this).attr("class",$preview.attr("class"))
						$(v_this).css({
							width:'',
							float:'',
						})
						 
						$('#styleEdit').dialog('close')
					}
				},{
					text:'Close',
					handler:function(){
						
					}
				}]
				});
	   	    	
	   	    })
	   	    $('#mtarget').append(darg_tag)
	         if ($(v_this).css('position')=="absolute"){
	            $('#mtarget').append(darg_div1)
   	         }
   	        
   	        $(v_this).on('keydown',function(e){
   	        	if (e.keyCode==KEYDELETE){
	   	        	delete _mainObject[$(v_this).attr('id')]
					$(v_this).find('*').each(function(i,dom){
						if($(dom).attr('id')!= undefined ){
							delete _mainObject[$(dom).attr('id')]
						}
					})
					$(v_this).remove()
					$('.selectedzujiandian').remove()
	   	        	}
   	        })
   	        
	   	    $(darg_div1).bind('mousedown' ,function(e) {
	   	            if ($(v_this).css('position')!="absolute"){
	   	            	return false
	   	            }
		   	        _resazemove2=true
		   	        _startY=e.pageY
   	   	            _startYY=	$(v_this).css('top').replace('px','')
   	   	            _startYY= $(v_this).offset().top  - $('#mtarget').offset().top+50
		   	        _startH=$(v_this).height();
		   	       	_resazemove8=true
		   	        _startX=e.pageX
		   	        _startXX=$(darg_div8).offset().left - $('#mtarget').offset().left
		   	        _startW=$(v_this).width();
		   	  })
	   	    
	   	    
	  	    var darg_div2=$('<div></div>')
	   	    $(darg_div2).addClass("selectedzujiandian")
	   	    $(darg_div2).css({
	   	    	"cursor":"s-resize",
	   	    })
		        if ($(v_this).css('position')=="absolute"){
		        	 $('#mtarget').append(darg_div2)
		   	    }
		   	    $(darg_div2).bind('mousedown' ,function(e) {
	   	            if ($(v_this).css('position')!="absolute"){
	   	            	return false
	   	            }
		   	        _resazemove2=true
		   	        _startY=e.pageY
		   	        _startYY=	$(v_this).css('top').replace('px','')
		   	        _startYY= $(v_this).offset().top  - $('#mtarget').offset().top+50
		   	        _startH=$(v_this).height();
		   	       
		   	    })
//		   	    $(document).bind('mousemove',darg_div2,function(e) {
//			        if(_resazemove2){
//			             var _length= e.pageY -_startY
//			             if (_startYY +  (_length )<0 ){
//			             	$(v_this).css("top", "0px")
//			             }else{
//			             	$(v_this).css("top", (_startYY*1 +  _length*1 ) + "px")
//			             	$(v_this).css("height",(_startH-_length) + "px")
//			             }
//			             _resaze()
//			        }
//			    })
	   	    var darg_div3=$('<div></div>')
	   	    $(darg_div3).addClass("selectedzujiandian")
	   	    $(darg_div3).css({
	   	    	"cursor":"ne-resize",
	   	    })
	   	    
	        if ($(v_this).css('position')=="absolute"){
	        	$('#mtarget').append(darg_div3)
	   	    }
		   	 $(darg_div3).bind('mousedown' ,function(e) {
	   	            if ($(v_this).css('position')!="absolute"){
	   	            	return false
	   	            }
		   	    	  	_resazemove4=true
			   	        _startX=e.pageX
			   	        _startW=$(v_this).width();
			   	        _resazemove2=true
			   	        _startY=e.pageY
		   	            _startYY=	$(v_this).css('top').replace('px','')
		   	            _startYY= $(v_this).offset().top  - $('#mtarget').offset().top+50
			   	        _startH=$(v_this).height();
			  })
	   	   var darg_div4=$('<div></div>')
	   	    $(darg_div4).addClass("selectedzujiandian")
	   	    $(darg_div4).css({
	   	    	"cursor":"w-resize",
	   	    })
	   	    $('#mtarget').append(darg_div4)
	   	       $(darg_div4).bind('mousedown' ,function(e) {
		   	        _resazemove4=true
		   	        _startX=e.pageX
		   	        _startW=$(v_this).width();
		   	        if ($(v_this).prop('tagName')=='TD'){
		   	        	var $_nexttd
		   	        	if($_nexttd = $(v_this).next('TD')){
		   	        		_startnextW	=$_nexttd.width();
		   	        	}
		   	        	
		   	        }
		   	    })
//		   	  $(document).bind('mousemove',darg_div4,function(e) {
//			        if(_resazemove4){
//			             var _length= e.pageX -_startX
//			             $(v_this).css("width",(_startW+_length) + "px")
//			             _resaze()
//			        }
//			   })
//
	   	    
	   	    
	   	    
	   	    
	   	    var darg_div5=$('<div></div>')
	   	    $(darg_div5).addClass("selectedzujiandian")
	   	    $(darg_div5).css({ "cursor":"se-resize"})
	   	    $('#mtarget').append(darg_div5)
	   	    
		   	    $(darg_div5).bind('mousedown' ,function(e) {
		   	    		_resazemove4=true
			   	        _startX=e.pageX
			   	        _startW=$(v_this).width();
			   	        _resazemove6=true
			   	        _startY=e.pageY
			   	        _startH=$(v_this).height();
			   	 })
		   	  
	   	    
	   	    var darg_div6=$('<div></div>')
	   	    $(darg_div6).addClass("selectedzujiandian")
	   	    $(darg_div6).css({"cursor":"s-resize"})
	   	    $('#mtarget').append(darg_div6)
	   	    
		   	    $(darg_div6).bind('mousedown' ,function(e) {
		   	        _resazemove6=true
		   	        _startY=e.pageY
		   	        _startH=$(v_this).height();
		   	    })
//		   	    $(document).bind('mousemove',darg_div6,function(e) {
//			        if(_resazemove6){
//			             var _length= e.pageY -_startY
//			             $(v_this).css("height",(_startH+_length) + "px")
//			             _resaze()
//			        }
//			    })

	   	    
	   	    
	   	    
	   	    var darg_div7=$('<div></div>')
	   	    $(darg_div7).addClass("selectedzujiandian")
	   	    $(darg_div7).css({
	   	    	"cursor":"ne-resize",
	   	    })
	   	    
	        if ($(v_this).css('position')=="absolute"){
	        	$('#mtarget').append(darg_div7)
	   	    }
		   	$(darg_div7).bind('mousedown' ,function(e) {
   	            if ($(v_this).css('position')!="absolute"){
   	            	return false
   	            }
					    _resazemove8=true
						_startX=e.pageX
						_startXX=$(darg_div8).offset().left - $('#mtarget').offset().left
						_startW=$(v_this).width();
						_resazemove6=true
						_startY=e.pageY
						_startH=$(v_this).height();
			})
	   	    
	   
	   	 	darg_div8=$('<div></div>')
	   	    $(darg_div8).addClass("selectedzujiandian")
	   	    $(darg_div8).css({
	   	    	 "cursor":"w-resize",
	   	    })
	   	   
	        if ($(v_this).css('position')=="absolute"){
	        	 $('#mtarget').append(darg_div8)
	   	    }
	   	    $(darg_div8).bind('mousedown' ,function(e) {
   	            if ($(v_this).css('position')!="absolute"){
   	            	return false
   	            }
		   	        _resazemove8=true
		   	        _startX=e.pageX
		   	        _startXX=$(darg_div8).offset().left - $('#mtarget').offset().left
		   	        _startW=$(v_this).width();
		   	    })
//		   	$(document).bind('mousemove',darg_div8,function(e) {
//			        if(_resazemove8){
//			             var _length= e.pageX  -_startX
//			              if (_startXX+_length<0 ){
//			              	 $(v_this).css("left", "0px")
//			              }else{
//			               $(v_this).css("width",(_startW-_length) + "px")
//			               $(v_this).css("left",(_startXX+_length) + "px")
//			              }
//			             _resaze()
//			        }
//		    })
			   
			   
			var darg_div9=$('<div></div>')
	   	    $(darg_div9).addClass("selectedzujiandian")
	   	    $(darg_div9).css({
	   	    	 "cursor":"move",
	   	    })
	   	   
	        
	        $('#mtarget').append(darg_div9)
	   	    
	   	     $(darg_div9).bind('mousedown' ,function(e) {
	   	    	    _resazemove9=true
	   	            if ($(v_this).css('position')!="absolute"){
		   	    		var tempdiv=$('<DIV id=tempdiv style="border:1px solid #ff0000;width:70px;height:20px" ><span>目标2</span><div style="width:20px;height:20px"></div></div>').css('position','absolute')
			   	        $(tempdiv).css('top',e.pageY+'px')
			   	        $(tempdiv).css('left',e.pageX+'px')
			   	        $(tempdiv).appendTo('body')
			   	        
	   	            }else{
	   	            	
		   	        _startY=e.pageY
		   	        _startYY=	$(darg_div1).offset().top - $('#mtarget').offset().top+50 //$(v_this).css('top').replace('px','')
		   	        _startH=$(v_this).height();
		   	        _startX=e.pageX
		   	        _startXX=$(darg_div1).offset().left - $('#mtarget').offset().left
		   	        _startW=$(v_this).width();
	   	            }
		   	        
		   	        
		   	    })
		   	     $(document).on('mousemove',function(e) {
		   	    	var tempdiv=$('#tempdiv')
		   	    	$(tempdiv).css('top',(e.pageY+1)+'px')
		   	        $(tempdiv).css('left',(e.pageX+1)+'px')
		   	     })
		   	    
//		   	    $(document).bind('mousemove',darg_div9,function(e) {
//			        if(_resazemove9){
//			              var _length= e.pageX  -_startX
//			              if (_startXX+_length<0 ){
//			              	 $(v_this).css("left", "0px")
//			              }else{
//			               $(v_this).css("left",(_startXX+_length) + "px")
//			              }
//			              var  _length2= e.pageY -_startY
//			              if (_startYY +  (_length2 )<0 ){
//			             	$(v_this).css("top", "0px")
//			              }else{
//			             	$(v_this).css("top", (_startYY*1+  _length2*1 ) + "px")
//
//			              }
//			             _resaze()
//			        }
//			 })
	   	    
	   	    $('.selectedzujiandian').css({
	   	    	"position":"absolute",
	   	    	"border":"1px solid #000",
	   	    	"width":"4px",
	   	    	"height":"4px",
	   	    	"background-color":"#fff"
	   	    })
	   	     
  	   	    $(darg_tag).css({
  	   	        "border":"1px solid #f00",
	   	    	"width":"50px",
	   	    	"height":"15px",
	   	    	"background-color":"#fdd",
	   	        "text-align": "center",
	   	    	"box-shadow":" 1px -1px 3px #ff0000",
	   	        "border-top-left-radius": "6px",
	   	         
	   	    })
	  // 	    $(darg_tag).addClass('form_title_div')
	  
	   	    
	   	      _resaze =function(){
	   	    	var padding_right=$(v_this).css("padding-right").replace("px","")*1.0
	   	    	var padding_left=$(v_this).css("padding-left").replace("px","")*1.0
	   	    	var padding_top=$(v_this).css("padding-top").replace("px","")*1.0
	   	    	var padding_bottom=$(v_this).css("padding-bottom").replace("px","")*1.0
	   	    	 
	   	    	$(darg_div).css({
	   	    	"width":($(v_this).width()+6)+"px",
	   	    	"height":($(v_this).height()+6)+"px",
	   	    	"top": ($(v_this).offset().top - $('#mtarget').offset().top +54 ) + "px",
	   	    	"left": ($(v_this).offset().left - $('#mtarget').offset().left-3  ) + "px"
	   	        })
	   	    	
	   	    	$(darg_div1).css({
	   	    	"top": ($(v_this).offset().top - $('#mtarget').offset().top +54-2 ) + "px",
	   	    	"left": ($(v_this).offset().left - $('#mtarget').offset().left-3 -2 ) + "px"
	   	        })
	   	    	$(darg_tag).css({
	   	        	"top": ($(v_this).offset().top - $('#mtarget').offset().top +54-2 )-11 + "px",
	   	        	"left": ($(v_this).offset().left - $('#mtarget').offset().left-3 -2 ) +5+ "px"
	   	        })

//
		   	    $(darg_div2).css({
		   	    	"top":  ($(v_this).offset().top - $('#mtarget').offset().top +54-2 ) + "px",
		   	    	"left": (($(v_this).offset().left - $('#mtarget').offset().left+($(v_this).width()/2))-1 +padding_left ) + "px"
		   	    })
		   	    
	   	        $(darg_div3).css({
	   	    	"top":  ($(v_this).offset().top  - $('#mtarget').offset().top +54-2 ) + "px",
	   	    	"left": ($(v_this).offset().left - $('#mtarget').offset().left+ $(v_this).width()+2  +padding_left +padding_right ) + "px"
	   	        })
	   	    	
	   	    	$(darg_div4).css({
	   	    	 "top":  (($(v_this).offset().top - $('#mtarget').offset().top + $(v_this).height() /2 )+54+1+padding_top ) + "px",
	   	    	 "left": ($(v_this).offset().left - $('#mtarget').offset().left+ $(v_this).width()+2 +padding_left+padding_right  ) + "px"
	   	        })
	   	    	
	   	    	 $(darg_div5).css({
	   	    	   "top": ($(v_this).offset().top - $('#mtarget').offset().top + $(v_this).height() +54+4 +padding_top + padding_bottom) + "px",
	   	    	   "left": ($(v_this).offset().left - $('#mtarget').offset().left+ $(v_this).width()+2   +padding_left+padding_right  ) + "px"
	   	         })
	   	    	
	   	    	 $(darg_div6).css({
	   	    	    "top": ($(v_this).offset().top - $('#mtarget').offset().top + $(v_this).height() +54+4 +padding_top + padding_bottom ) + "px",
	   	    	   "left": (($(v_this).offset().left - $('#mtarget').offset().left+($(v_this).width()/2))-1  +padding_left ) + "px"
	   	       	 })

	   	    	$(darg_div7).css({
	   	    	  "top":  ($(v_this).offset().top - $('#mtarget').offset().top +54 + $(v_this).height()+4 ) + "px",
	   	    	  "left": ($(v_this).offset().left - $('#mtarget').offset().left-3 -2 ) + "px"
	   	        })
	   	        $(darg_div8).css({
	   	    	  "top":  (($(v_this).offset().top - $('#mtarget').offset().top + $(v_this).height() /2 )+54+1 ) + "px",
	   	    	  "left": ($(v_this).offset().left - $('#mtarget').offset().left-3 -2 ) + "px"
	   	        })
	   	        $(darg_div9).css({
	   	    	  "top":  (($(v_this).offset().top - $('#mtarget').offset().top + $(v_this).height() /2 )+54+1 +padding_top ) + "px",
	   	    	  "left": (($(v_this).offset().left - $('#mtarget').offset().left+($(v_this).width()/2))-1 +padding_left ) + "px"
	   	        })


	   	    }
	   	    _resaze()
	   	//====================table============================================================
	   		   	    
	   	   
	   	    
       }
   
 $(document).ready(function(){
    	   $("#mtarget").on('scroll',function() {
    		   _resaze()
    	    });
		   	  $(document).bind('mousemove' ,function(e) {
			        if(_resazemove2){
			             var _length= e.pageY -_startY
			             if (_startYY +  (_length )<0 ){
			             	$(v_this).css("top", "0px")
			             }else{
			             	$(v_this).css("top", (_startYY*1 +  _length*1 ) + "px")
			             	$(v_this).css("height",(_startH-_length) + "px")
			             }
			        }
			        if(_resazemove4){
			             var _length= e.pageX -_startX
			             $(v_this).css("width",(_startW+_length) + "px")
			             if($(v_this).next().prop('tagName')=='TD'){
			            	 
			            	 $(v_this).next().css("width",(_startnextW-_length) + "px")
			             }
			        }
			        if(_resazemove6){
			             var _length= e.pageY -_startY
			             $(v_this).css("height",(_startH+_length) + "px")
			        }
			        if(_resazemove8){
			             var _length= e.pageX  -_startX
			              if (_startXX+_length<0 ){
			              	 $(v_this).css("left", "0px")
			              }else{
			               $(v_this).css("width",(_startW-_length) + "px")
			               $(v_this).css("left",(_startXX+_length) + "px")
			              }
			        }
			        if(_resazemove9){
			              var _length= e.pageX  -_startX
			              if (_startXX+_length<0 ){
			              	 $(v_this).css("left", "0px")
			              }else{
			               $(v_this).css("left",(_startXX+_length) + "px")
			              }
			              var  _length2= e.pageY -_startY
			              
			              if (_startYY +  (_length2 )<0 ){
			             	$(v_this).css("top", "0px")
			              }else{
			             	$(v_this).css("top", (_startYY*1+  _length2*1 ) + "px")
			              }
			        }
			        _resaze()
			 })
	       
	       
    	   $(document).on('mouseup', function(e) {
    		   if ($('#tempdiv').size()>0) {
    		      $('#tempdiv').remove()
//
//    		<div  id="m-insert-panle-before" >之前</div>
//		    <div  id="m-insert-panle-after" >之后</div>
//		    <div  id="m-insert-panle-inside" >内部</div>
//		    <div  id="m-insert-panle-external" >外部</div>
    		       var m_array=[
    		            {id: 'm-append-before', text: '之前', iconCls: 'icon-ok'},
    		            {id: 'm-append-after', text: '之后', iconCls: 'icon-ok'},
    		            {id: 'm-append-inside', text: '内部', iconCls: 'icon-ok'},
    		            {id: 'm-append-external', text: '外部', iconCls: 'icon-ok'},
    		       ]
    		      $('#mmTatget').menu('removeItem',$('#m-append-before'))
    		      $('#mmTatget').menu('removeItem',$('#m-append-after'))
    		      $('#mmTatget').menu('removeItem',$('#m-append-inside'))
    		      $('#mmTatget').menu('removeItem',$('#m-append-external'))
    		      if(['DIV','SPAN'].indexOf($(_targetTag).prop('tagName'))>=0){
    		    	  $('#mmTatget').menu('appendItem',m_array[0]);
    		    	  $('#mmTatget').menu('appendItem',m_array[1]);
    		    	  $('#mmTatget').menu('appendItem',m_array[2]);
    		    	  if($(v_this).prop('tagName')=='DIV'){
    		    		  $('#mmTatget').menu('appendItem',m_array[3]);
    		    	  }
    		      }else if(['TABLE','INPUT','SELECT','TEXTAREA'].indexOf($(_targetTag).prop('tagName'))>=0){
    		    	  $('#mmTatget').menu('appendItem',m_array[0]);
    		    	  $('#mmTatget').menu('appendItem',m_array[1]);
    		    	  if(['DIV','SPAN'].indexOf($(v_this).prop('tagName'))>=0){
    		    		  $('#mmTatget').menu('appendItem',m_array[3]);
    		    	  }
    		      }else if($(_targetTag).prop('tagName')=='TD'){
    		    	  $('#mmTatget').menu('appendItem',m_array[2]);
    		      }
    		      
    		      
	    		_resazemove9=false
    		   if ($(v_this).css('position')!="absolute"){
    			   $('#mmTatget').menu('show', {
      				    left: e.pageX,
   				        top: e.pageY
   				   });
    			   $('#mmTatget').menu({
    				   onClick:function(item){
    					    if ($(_targetTag).attr('id')== $(v_this).attr('id') ){
    					    	 _targetTag=null
    	    					  $('.selectedzujian,.selectedzujiandian').remove()
    	    					  $.messager.alert('提示','不同拖动到与自己相对位置')
    	    					  return false
    					    }
    					    if ($(_targetTag).parents('#'+$(v_this).attr('id')).size() >0  ){
   					    	 _targetTag=null
   	    					  $('.selectedzujian,.selectedzujiandian').remove()
   	    					  $.messager.alert('提示','外部元素不可以拖动到内部')
   	    					  return false
   					        }
    					    if(item.id=='m-append-before'){
    					    	$(v_this).appendTo('body')
    					    	$(_targetTag).before($(v_this))
    					    }else  if(item.id=='m-append-after'){
    					    	$(_targetTag).after($(v_this))
    					    }else  if(item.id=='m-append-inside'){
    					    	$(_targetTag).append($(v_this))
    					    }else  if(item.id=='m-append-external'){
    					    	$(_targetTag).before($(v_this))
    					    	$(_targetTag).appendTo($(v_this))
    					    }
    					    _targetTag=null
    					    $('.selectedzujian,.selectedzujiandian').remove()
    				   }
    			    });
    			
    		   }

    		 }
    	   })
    	   $(document).on('mouseover','.layoutTarget,.grid,td.zujian,input.zujian,select.zujian,textarea.zujian',function(e) {
    		   _targetTag=$(this)
    		    
    		   var borderDiv=$('<DIV id="borderDiv" > </DIV>')
    		   $(borderDiv).css({
    			   "z-index":"9999",
    			   "position":"absolute",
    			   "top":$(this).offset().top,
    			   "left":$(this).offset().left,
    			   "width":$(this).css('width'),
    			   "height":$(this).css('height')
    		   })
    		  
    		   $('#tempdiv').find('span').text($(this).prop('tagName'))
    		   if($('#tempdiv').size()>0){
    			   $(this).addClass('selectdzujian')
    			 //  $(borderDiv).addClass('selectdzujian').appendTo('body')
    		   }
    		   return false
    		   // $('#tempdiv').find('div').removeClass('tree-dnd-yes tree-dnd-no').addClass(true ? 'tree-dnd-yes' : 'tree-dnd-no');
    		   
    	   })
    	   $(document).on('mouseout','.layoutTarget,.grid,td.zujian,input.zujian,select.zujian,textarea.zujian',function(e) {
    		    
    		   $('#tempdiv').find('span').text('x')
    		   $(this).removeClass('selectdzujian')
    		   //$('#borderDiv').remove()
    		   // $('#tempdiv').find('div').removeClass('tree-dnd-yes tree-dnd-no').addClass(false ? 'tree-dnd-yes' : 'tree-dnd-no');
    	      return false
    	   })
	   	   $('#mtarget').on('mouseup',function(e) {
	   		       
		   	    	_resazemove2=false
		   	    	_resazemove4=false
		   	        _resazemove6=false
		   	        _resazemove8=false
		   	        _resazemove9=false
		   	         
		   	        
		   	        _tdmove=false
		   	        $('.selectedzujian').css("zIndex",-1)
		   	        $('.selectedzujiandian').css("z-index",$(v_this).css("z-index")+10)
		   	        $(v_this).attr('_width',$(v_this).css('width'))
		   	        $(v_this).attr('_height',$(v_this).css('height'))
		   	       // _mainObject[$(v_this).attr('id')].WIDTH=$(v_this).css('width')
		   	       // _mainObject[$(v_this).attr('id')].HEIGHT=$(v_this).css('height')
		   	        var temp=_mainObject[$(v_this).attr('id')]
		   	    	if (temp!==undefined ){
		   	    	temp.WIDTH=$(v_this).css('width')
		   	    	temp.HEIGHT=$(v_this).css('height')
		   	    	}
		   	    	_mainObject[$(v_this).attr('id')]=temp
						   	if ($(v_this).prop('tagName')=='TABLE'){
							  	  $(v_this).trigger('loadTableProperty')
							  }else if ($(v_this).prop('tagName')=='INPUT'){
								  $(v_this).trigger('loadInputProperty')
							  }else if ($(v_this).prop('tagName')=='TEXTAREA'){
								  $(v_this).trigger('loadTextareaProperty')
							  }else if ($(v_this).prop('tagName')=='DIV'){
								  ///$(v_this).trigger('loadLayoutTargetProperty')
							  }else if ($(v_this).prop('tagName')=='TD'||$(this).prop('tagName')=='TH'){
								  $(v_this).trigger('loadTableTdProperty')
							  }
		   	        
 				    if(str+std+etr+etd!=0 && $(v_this)[0]!=undefined){
 				    	   
						    if($(v_this)[0].tagName=='TABLE'){
						    	  $(v_this).find('tr:eq('+str+') > td:eq('+std+')').html('拖动').attr('colspan',etd-std+1).attr('rowspan',etr-str+1).removeClass('selectedTD')
						    	  $(v_this).find('.selectedTD').hide()
						    	  var c_row=$(v_this).find('tr:gt('+(str)+'):lt('+(etr-str)+'),tr:eq('+(str)+')')
						    }else if  ($(v_this)[0].tagName=='TH' ||$(v_this)[0].tagName=='TD' ||$(v_this)[0].tagName=='TR') {
						    	 $(v_this).parents('table').find('tr:eq('+str+') > td:eq('+std+')').html('拖动').attr('colspan',etd-std+1).attr('rowspan',etr-str+1).removeClass('selectedTD')
						   		 $(v_this).parents('table').find('.selectedTD').hide()
						    }
				     }
 				    
 				    
 				   $('.selectedTD').removeClass('selectedTD')
				    str=0
				    std=0
				    etr=0
				    etd=0
			   	 })
	   	   
	   	   
	   	   $('#mtarget').on('mousedown','td,th',function(e) {
	   	   	           //   v_this=$(this)
	   	   	 	        _tdmove=true
				        _startTDColNum = $(this).parent().find("td").index($(this)[0]); //列号
                        _startTDRowNum = $(this).parent().parent().find("tr").index($(this).parent()[0]); //行号
                        
		   	 })
	   	   $('#mtarget').on('mouseover','td,th', function(e) {
	   	   	 	   if(_tdmove){
				      var tdSeq = $(this).parent().find("td").index($(this)[0]); //列号
                      var trSeq = $(this).parent().parent().find("tr").index($(this).parent()[0]); //行号
                    //  tdSeq=tdSeq*($(this).attr('colspan')==undefined?1:$(this).attr('colspan'))
                    //  trSeq=trSeq*($(this).attr('rowspan')==undefined?1:$(this).attr('rowspan'))
                      $(this).parents('table').find('tr > td').css('background-color',"#FFFFFF").removeClass('selectedTD')
                      var trs
                    
                      if (_startTDRowNum <= trSeq){
                      	 str=_startTDRowNum
                      	 etr=trSeq
                      	 trs= $(this).parents('table').find('tr:gt('+(_startTDRowNum)+'):lt('+(trSeq-_startTDRowNum)+') , tr:eq('+(_startTDRowNum)+') ')
                      }else{
                      	 str=trSeq
                      	 etr=_startTDRowNum
                      	 trs= $(this).parents('table').find('tr:gt('+(trSeq)+'):lt('+(_startTDRowNum -trSeq )+') ,tr:eq('+(trSeq)+')')
                      }
                      $(trs).each(function(r,row){
                      	if (_startTDColNum <= tdSeq){
                      	std=_startTDColNum
                      	etd=tdSeq
                      	$(row).find('td:gt('+(_startTDColNum)+'):lt('+(tdSeq-_startTDColNum)+'),td:eq('+(_startTDColNum)+')').css('background-color',"#FFA8A8").addClass('selectedTD')
                      	}else{
                      	std=tdSeq
                      	etd=_startTDColNum
                      	$(row).find('td:gt('+(tdSeq)+'):lt('+(_startTDColNum-tdSeq)+'),td:eq('+(tdSeq)+')').css('background-color',"#FFA8A8").addClass('selectedTD')
                      	}
                      })
                     
                     	
	   	   	 	   }
		   	 })
	   	   
		   	 
	   	   $(document).on('keydown',function(e){
	   		   
	   	   	    if ($('.selectedZuJian').size()>0){
	   	   	    var OldTop=	$('.selectedZuJian').css("top").replace('px','')*1
	   	   	    var OldHeight=	$('.selectedZuJian').css("height").replace('px','')*1
	   	   	    var OldLEFT=	$('.selectedZuJian').css("left").replace('px','')*1
              var OldWidth=	$('.selectedZuJian').css("width").replace('px','')*1
             
              if(e.keyCode==16){
              	KEYSHIFT=true
              }
              if(e.keyCode==17){
              	KEYCTRL=true
              }
              
              if (KEYCTRL) {
              	bc=2
              	
              }else{
              	bc=1
              }
              
              if(e.keyCode==KEYLEFT && KEYSHIFT==false ){
	   	   	   	$('.selectedZuJian').css("left", (OldLEFT-bc) + "px")
	   	   	   	}else if(e.keyCode==KEYLEFT  && KEYSHIFT ){
	   	   	   	$('.selectedZuJian').css("width", (OldWidth-bc) + "px")
	   	   	   	}else if(e.keyCode==KEYTOP  && KEYSHIFT==false){
	   	   	   	$('.selectedZuJian').css("top", (OldTop-bc) + "px")
	   	   	   	}else if(e.keyCode==KEYTOP && KEYSHIFT){
	   	   	   	$('.selectedZuJian').css("height", (OldHeight-bc) + "px")
	   	   	   	}else if(e.keyCode==KEYRIGHT && KEYSHIFT==false){
	   	   	   	$('.selectedZuJian').css("left", (OldLEFT+bc) + "px")
	   	   	   	}else if(e.keyCode==KEYRIGHT && KEYSHIFT){
	   	   	   	$('.selectedZuJian').css("width", (OldWidth+bc) + "px")
	   	   	   	}else if(e.keyCode==KEYBOTTOM && KEYSHIFT==false){
	   	   	   	$('.selectedZuJian').css("top", (OldTop+bc) + "px")
	   	   	   	}else if(e.keyCode==KEYBOTTOM && KEYSHIFT){
	   	   	   	$('.selectedZuJian').css("height", (OldHeight+bc) + "px")
	   	   	   	}
	   	   	   
	   	   	   	_resaze()
	   	   	   }
	   	   })
	   	    $(document).on('keyup',function(e){
	   	    	  if(e.keyCode==16){
              	KEYSHIFT=false
              }
	   	    	  if(e.keyCode==17){
              	KEYCTRL=false
              }
	   	    })
	   })
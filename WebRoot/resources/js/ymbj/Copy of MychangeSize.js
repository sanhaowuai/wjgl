  
          	var _resazemove8=false
   	        var _resazemove6=false
   	        var _resazemove4=false
   	        var _resazemove2=false
   	        var _resazemove9=false
   	        var v_this =null
   	        var _startTDRowNum=0
	   	      var _startTDColNum=0
	   	      var _tdmove=false
	   	      var str,std,etr,etd
	   	      var _resaze
	   	      var KEYLEFT=37,KEYTOP=38,KEYRIGHT=39,KEYBOTTOM=40
	   	      var KEYSHIFT =false ,KEYCTRL=false
            var bc=1
   $.fn.MychangeSize = function() {
   	        var _startY=0
   	        var _startYY=0
   	        var _startX=0
   	        var _startXX=0
   	        var _startH=0
   	        var _startW=0
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
	   	    $('#mtarget').append(darg_div1)
	   	    
	   	    $(darg_div1).bind('mousedown' ,function(e) {
	   	    	    
		   	        _resazemove2=true
		   	        _startY=e.pageY
		   	        _startYY=$(darg_div2).offset().top - $('#mtarget').offset().top//
		   	        if($(v_this).css('position')!='absolute'){
		   	          _startYY=	$(v_this).css('margin-top').replace('px','')
		   	        }
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
	   	    $('#mtarget').append(darg_div2)
	   	    	   	    
		   	    $(darg_div2).bind('mousedown' ,function(e) {	
		   	        _resazemove2=true
		   	        _startY=e.pageY
		   	        _startYY=$(darg_div2).offset().top - $('#mtarget').offset().top//
		   	       	if($(v_this).css('position')!='absolute'){
		   	          _startYY=	$(v_this).css('margin-top').replace('px','')
		   	        }
		   	       _startH=$(v_this).height();
		   	       
		   	    })
		   	    $(document).bind('mousemove',darg_div2,function(e) {
			        if(_resazemove2){ 
			             var _length= e.pageY -_startY 
			             if (_startYY +  (_length )<0 ){
			             	$(v_this).css("margin-top", "0px")
			             }else{
			             	$(v_this).css("margin-top", (_startYY*1 +  _length*1 ) + "px")
			             	$(v_this).css("height",(_startH-_length) + "px")
			             }
			             _resaze()
			        }  
			    }) 
	   	    
	   	     
	   	    
	   	    
	   	    var darg_div3=$('<div></div>')
	   	    $(darg_div3).addClass("selectedzujiandian")
	   	    $(darg_div3).css({
	   	    	"cursor":"ne-resize", 
	   	    })
	   	    $('#mtarget').append(darg_div3)
	   	       	    
		   	 $(darg_div3).bind('mousedown' ,function(e) {
		   	    	  	_resazemove4=true
			   	        _startX=e.pageX
			   	        _startW=$(v_this).width();
			   	        _resazemove2=true
			   	        _startY=e.pageY
			   	        _startYY=$(darg_div2).offset().top - $('#mtarget').offset().top//
			   	        if($(v_this).css('position')!='absolute'){
		   	          _startYY=	$(v_this).css('margin-top').replace('px','')
		   	          }
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
		   	    })
		   	  $(document).bind('mousemove',darg_div4,function(e) {
			        if(_resazemove4){ 
			             var _length= e.pageX -_startX 
			             $(v_this).css("width",(_startW+_length) + "px")
			             _resaze()
			        }  
			   }) 
	   	    
	   	    
	   	    
	   	    
	   	    
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
		   	    $(document).bind('mousemove',darg_div6,function(e) {
			        if(_resazemove6){ 
			             var _length= e.pageY -_startY 
			             $(v_this).css("height",(_startH+_length) + "px")
			             _resaze()
			        }  
			    }) 

	   	    
	   	    
	   	    
	   	    var darg_div7=$('<div></div>')
	   	    $(darg_div7).addClass("selectedzujiandian")
	   	    $(darg_div7).css({
	   	    	"cursor":"ne-resize", 
	   	    })
	   	    $('#mtarget').append(darg_div7)
	   	    	   	    
		   	$(darg_div7).bind('mousedown' ,function(e) {
					    _resazemove8=true
						_startX=e.pageX
						_startXX=$(darg_div8).offset().left - $('#mtarget').offset().left
						_startW=$(v_this).width();
						_resazemove6=true
						_startY=e.pageY
						_startH=$(v_this).height();
			})
	   	    
	   
	   	 	var darg_div8=$('<div></div>')
	   	    $(darg_div8).addClass("selectedzujiandian")
	   	    $(darg_div8).css({
	   	    	 "cursor":"w-resize",  
	   	    })
	   	    $('#mtarget').append(darg_div8) 
	   	    $(darg_div8).bind('mousedown' ,function(e) {	
		   	        _resazemove8=true
		   	        _startX=e.pageX
		   	        _startXX=$(darg_div8).offset().left - $('#mtarget').offset().left
		   	        _startW=$(v_this).width();
		   	    })
		   	$(document).bind('mousemove',darg_div8,function(e) {
			        if(_resazemove8){ 
			             var _length= e.pageX  -_startX 
			              if (_startXX+_length<0 ){
			              	 $(v_this).css("margin-left", "0px")
			              }else{
			               $(v_this).css("width",(_startW-_length) + "px")
			               $(v_this).css("margin-left",(_startXX+_length) + "px")
			              }
			             _resaze()
			        }  
			   }) 
			   
			   
			var darg_div9=$('<div></div>')
	   	    $(darg_div9).addClass("selectedzujiandian")
	   	    $(darg_div9).css({
	   	    	 "cursor":"move",  
	   	    })
	   	    $('#mtarget').append(darg_div9)
	   	     $(darg_div9).bind('mousedown' ,function(e) {	
		   	        _resazemove9=true
		   	        _startY=e.pageY
		   	         
		   	       
		   	         _startYY=$(v_this).offset().top - $('#mtarget').offset().top//
		   	          
		   	         if($(v_this).css('position')!='absolute'){
		   	          _startYY=	$(v_this).css('margin-top').replace('px','')
		   	         }
		   	         
		   	        _startH=$(v_this).height();
		   	        
		   	        _startX=e.pageX
		   	        _startXX=$(darg_div8).offset().left - $('#mtarget').offset().left
		   	        _startW=$(v_this).width();
		   	    })
		   	    $(document).bind('mousemove',darg_div6,function(e) {
			        if(_resazemove9){ 
			              var _length= e.pageX  -_startX 
			              if (_startXX+_length<0 ){
			              	 $(v_this).css("margin-left", "0px")
			              }else{
			               
			               $(v_this).css("margin-left",(_startXX+_length) + "px")
			              }
			             
			              var  _length2= e.pageY -_startY 
			              if (_startYY +  (_length2 )<0 ){
			             	$(v_this).css("margin-top", "0px")
			              }else{
			             	$(v_this).css("margin-top", (_startYY*1+  _length2*1 ) + "px")
			             	 
			              }
			              
			              
			             _resaze()
			        }  
			 }) 
	   	    
	   	    $('.selectedzujiandian').css({
	   	    	"position":"absolute",
	   	    	"border":"1px solid #000",
	   	    	"width":"4px",
	   	    	"height":"4px",
	   	    	"background-color":"#fff"
	   	    })
	   	     
  
	   	    
	  
	   	    
	   	      _resaze =function(){
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
	   	    	
		   	    $(darg_div2).css({
		   	    	"top":  ($(v_this).offset().top - $('#mtarget').offset().top +54-2 ) + "px", 
		   	    	"left": (($(v_this).offset().left - $('#mtarget').offset().left+($(v_this).width()/2))-1) + "px"
		   	    })
		   	    
	   	        $(darg_div3).css({
	   	    	"top":  ($(v_this).offset().top  - $('#mtarget').offset().top +54-2 ) + "px", 
	   	    	"left": ($(v_this).offset().left - $('#mtarget').offset().left+ $(v_this).width()+2   ) + "px"
	   	        })
	   	    	
	   	    	$(darg_div4).css({
	   	    	 "top":  (($(v_this).offset().top - $('#mtarget').offset().top + $(v_this).height() /2 )+54+1 ) + "px", 
	   	    	 "left": ($(v_this).offset().left - $('#mtarget').offset().left+ $(v_this).width()+2   ) + "px"
	   	        })
	   	    	
	   	    	 $(darg_div5).css({
	   	    	   "top": ($(v_this).offset().top - $('#mtarget').offset().top + $(v_this).height() +54+4 ) + "px",  
	   	    	   "left": ($(v_this).offset().left - $('#mtarget').offset().left+ $(v_this).width()+2   ) + "px"
	   	         })
	   	    	
	   	    	 $(darg_div6).css({
	   	    	    "top": ($(v_this).offset().top - $('#mtarget').offset().top + $(v_this).height() +54+4 ) + "px", 
	   	    	   "left": (($(v_this).offset().left - $('#mtarget').offset().left+($(v_this).width()/2))-1) + "px"
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
	   	    	  "top":  (($(v_this).offset().top - $('#mtarget').offset().top + $(v_this).height() /2 )+54+1 ) + "px",  
	   	    	  "left": (($(v_this).offset().left - $('#mtarget').offset().left+($(v_this).width()/2))-1) + "px"
	   	        })	


	   	    }
	   	    _resaze()
	   	//====================table============================================================
	   		   	    
	   	   
	   	    
       }
   
       $(document).ready(function(){
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
								  $(v_this).trigger('loadLayoutTargetProperty')
							  }else if ($(v_this).prop('tagName')=='TD'||$(this).prop('tagName')=='TH'){  
								  $(v_this).trigger('loadTableTdProperty')
							  }
		   	        
/*				    if(str+std+etr+etd!=0 && $(v_this)[0]!=undefined){
						    if($(v_this)[0].tagName=='TABLE'){
						    	  $(v_this).find('tr:eq('+str+') > td:eq('+std+')').html('拖动').attr('colspan',etd-std+1).attr('rowspan',etr-str+1).removeClass('selectedTD')
						    	  $(v_this).find('.selectedTD').remove()
						    	  var c_row=$(v_this).find('tr:gt('+(str)+'):lt('+(etr-str)+'),tr:eq('+(str)+')')
						    }else if  ($(v_this)[0].tagName=='TH' ||$(v_this)[0].tagName=='TD' ||$(v_this)[0].tagName=='TR') {
						    	 $(v_this).parents('table').find('tr:eq('+str+') > td:eq('+std+')').html('拖动').attr('colspan',etd-std+1).attr('rowspan',etr-str+1).removeClass('selectedTD')
						   		 $(v_this).parents('table').find('.selectedTD').remove()
						    }
				     }
				    str=0
				    std=0
				    etr=0
				    etd=0*/
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
	   	   	    var OldTop=	$('.selectedZuJian').css("margin-top").replace('px','')*1
	   	   	    var OldHeight=	$('.selectedZuJian').css("height").replace('px','')*1
	   	   	    var OldLEFT=	$('.selectedZuJian').css("margin-left").replace('px','')*1
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
	   	   	   	$('.selectedZuJian').css("margin-left", (OldLEFT-bc) + "px")
	   	   	   	}else if(e.keyCode==KEYLEFT  && KEYSHIFT ){
	   	   	   	$('.selectedZuJian').css("width", (OldWidth-bc) + "px")
	   	   	   	}else if(e.keyCode==KEYTOP  && KEYSHIFT==false){
	   	   	   	$('.selectedZuJian').css("margin-top", (OldTop-bc) + "px")
	   	   	   	}else if(e.keyCode==KEYTOP && KEYSHIFT){
	   	   	   	$('.selectedZuJian').css("height", (OldHeight-bc) + "px")
	   	   	   	}else if(e.keyCode==KEYRIGHT && KEYSHIFT==false){
	   	   	   	$('.selectedZuJian').css("margin-left", (OldLEFT+bc) + "px")
	   	   	   	}else if(e.keyCode==KEYRIGHT && KEYSHIFT){
	   	   	   	$('.selectedZuJian').css("width", (OldWidth+bc) + "px")
	   	   	   	}else if(e.keyCode==KEYBOTTOM && KEYSHIFT==false){
	   	   	   	$('.selectedZuJian').css("margin-top", (OldTop+bc) + "px")	
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
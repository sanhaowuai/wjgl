 
	function resizeLayout(){// 主操作区域高度
	 
 		var wHeight =(window.innerHeight || (window.document.documentElement.clientHeight || window.document.body.clientHeight));
 		var wWidth = (window.innerWidth || (window.document.documentElement.clientWidth || window.document.body.clientWidth));
		var nHeight = $('#north').is(':visible') ? 33 : 115;
		//alert(nHeight)
		//alert(wHeight - 185+nHeight)
		//alert(wHeight - nHeight);  
	 
 		///$('#tabs_portal_0_panel').height(wHeight  + nHeight);
 		 
//		$('#tabs_portal_0_panel').height(wHeight - 180+nHeight); 
		 
		if (getCookie('kjcdbarwz')!=null && getCookie('kjcdbarwz')!=''	){
			$('#kjcdbar').attr('wz',getCookie('kjcdbarwz'))
		}else{
			$('#kjcdbar').attr('wz','bottom')
		}
		  cdbd()
		  cdbd()
		  if ($('#kjcdbar').attr('wz')=='bottom'){
			  $('#kjcdbar').css('height',126+'px') 
		  }else{
			  $('#kjcdbar').css('height',(wHeight-78)+'px')
		  }
		/*
		var wWidth = (window.innerWidth || (window.document.documentElement.clientWidth || window.document.body.clientWidth));
		var wHeight = (window.innerHeight || (window.document.documentElement.clientHeight || window.document.body.clientHeight));
		var nHeight = $('#north').is(':visible') ? $('#north').outerHeight() : 0;
		var fHeight = $('#funcbar').is(':visible') ? $('#funcbar').outerHeight() : 0;
		$('#center').height(wHeight - nHeight - fHeight - $('#south').outerHeight() - $('#taskbar').outerHeight());
		*/

	}; 
	function initHideTopbar(){//隐藏topbar事件

		$('#hide_topbar').bind('click', function(){
			
		
 			$('#north').slideToggle(300, function(){resizeLayout();});
			$(this).toggleClass('up');
 			var hidden = $(this).attr('class').indexOf('up') >= 0;
 			
			$.cookie('hideTopbar', (hidden ? '1' : null), {expires:1000, path:'/'});
      });
		//alert($.cookie('hideTopbar'))
      if($.cookie('hideTopbar') == '1')
         $('#hide_topbar').triggerHandler('click');
   };
    
	//窗口resize事件
	$(window).resize(function(){resizeLayout();});
 
	$(document).ready(function($){
 

 		//调整窗口大小
		resizeLayout();
 
		//隐藏topbar事件
		initHideTopbar(); 
		
		
//		arrow_left
//		arrow_right
//		arrow_top
//		arrow_bottom
//		
	
		
	});
	$(document).ready(function(){
  
		$('#s1,#s2,#e1,#e2').css({
			"position":"relative",
				"z-index":"9"
		})

		if ($('#kjcdbar').attr('wz')=='bottom'){
			 
			$('#e1').css('position','absolute')
			$('#e1').css('right','0px')
		}else{
			$('#e2').css('position','absolute')
			$('#e2').css('bottom','0px')
		}
		
		 var cds= $('#kjcdbar').find('.index_icon')
		    
		    $(cds).css("position","absolute")
			if ($('#kjcdbar').attr('wz')=='bottom' ){
			$(cds).each(function(i,dom){
				$(dom).css("left",((i+1)*126 - 90 )+"px")
				$(dom).css("top",0+"px")
			})
  
			}else{
				$(cds).each(function(i,dom){
					$(dom).css("top",((i+1)*126  - 90)+"px")
					$(dom).css("left",0+"px")
				})	
			}
	       $('.arrow_left').bind('click',function(){
	    	  
	    	var  dqcd =  $.grep(cds,function(dom,i){
	    		return ($(dom).css('left').replace("px","")*1+ 120)>$('#kjcdbar').width()
	    	})  
	       if ($(cds).size()>1 && $(dqcd).size()>0 ){
			   $(cds).each(function(i,dom){
				    var left=$(dom).css("left")
				    left = ((left.replace('px','')*1) - 126) + "px"
					$(dom).animate({"left":left})
				})
		   }
		  })
		  $('.arrow_right').bind('click',function(){
		   var  dqcd =  $.grep(cds,function(dom,i){
		    		return ($(dom).css('left').replace("px","")*1-35)<=0
		    	})  
		   if ($(cds).size()>1 && $(dqcd).size()>0 ){
			   $(cds).each(function(i,dom){
				    console.log($(dom).offset().left)
				    var left=$(dom).css("left")
				    left = ((left.replace('px','')*1) + 126) + "px"
				    $(dom).animate({"left":left})
				})
		   }
		})
		 $('.arrow_top').bind('click',function(){
		   var  dqcd =  $.grep(cds,function(dom,i){
		    		return  ($(dom).css('top').replace("px","")*1+120)>$('#kjcdbar').height()
		    	})  
		   if ($(cds).size()>1 && $(dqcd).size()>0 ){
			   $(cds).each(function(i,dom){
				    var top=$(dom).css("top")
				    top = ((top.replace('px','')*1) - 126) + "px"
				    $(dom).animate({"top":top})
				})
		   }
		})
		$('.arrow_top').bind('click',function(){
		   var  dqcd =  $.grep(cds,function(dom,i){
		    		return  ($(dom).css('top').replace("px","")*1-35)<=0
		    	})  
		   if ($(cds).size()>1 && $(dqcd).size()>0 ){
			   $(cds).each(function(i,dom){
				    var top=$(dom).css("top")
				    top = ((top.replace('px','')*1) + 126) + "px"
				    $(dom).animate({"top":top})
				})
		   }
		})
	})
	

	 
//var $ = function(id) {return document.getElementById(id);}; 

//底部隐藏菜单

function cdbd(){
	if ($('#kjcdbar').attr('wz')=='bottom'){
		//$('#myiframes,#center').height(wHeight - 117 + nHeight);
		$('#kjcdbar').attr('wz','right')
		$('#e1').css('position','absolute')
		$('#e1').css('right','0px')
		$('#e1').css('position','absolute')
		 
	}else{
		$('#e1').css('position','absolute')
		$('#e1').css('bottom','0px')
	//	$('#myiframes,#center').width(wWidth - left_width  );
		$('#kjcdbar').attr('wz','bottom')
		
	}
	loadkjcd()
}

function loadkjcd(){
	var cds= $('#kjcdbar').find('.index_icon')
	$('#s1').removeClass()
	$('#s2').removeClass()
	$('#e1').removeClass()
	$('#e2').removeClass()
	$('#cdbutton').removeClass('hidden_right hidden_right_l hidden_right_r hidden_bottom  hidden_bottom_b hidden_bottom_t');
	//var left_width=$('#frmTitle').is(':visible')?223:12;
	var left_width=isHidden==0?260:50;
	$('#cdbutton').unbind()
	var wHeight =(window.innerHeight || (window.document.documentElement.clientHeight || window.document.body.clientHeight));
	var wWidth = (window.innerWidth || (window.document.documentElement.clientWidth || window.document.body.clientWidth));
	//var nHeight = $('#north').is(':visible') ? 33 : 115;
	 var nHeight = 75;
		$('#e1').css('position','absolute')	 
	 
	if ($('#kjcdbar').attr('wz')=='bottom'){
		$('#e1').css('bottom','0px')
		
		Setcookie('kjcdbarwz', 'bottom')   
	    $('#kjcdbar').css('height',63+'px') 
		$('#kjcdbar').css('position','absolute')
		$('#kjcdbar').css('bottom','0px')
		$('#kjcdbar').css('top','auto')
		$('#kjcdbar').css('left','0px')
		$('#kjcdbar').css('right','auto')
		$('#qhcd').attr('class','switch_b')
		$('#qhcd').css('left','0px')
		$('#qhcd').css('bottom','0px')
		$('#qhcd').css('top','auto')
		$('#qhcd').css('right','auto')
		$(cds).each(function(i,dom){
			$(dom).css("left",((i+1)*63 - 90)+"px")
			$(dom).css("top",0+"px")
		})
		
		$('#s1').addClass('arrow_bg_bottom')
		$('#s2').addClass('arrow_pic_bottom arrow_left') 
		$('#e1').addClass('arrow_bg_bottom')
		$('#e2').addClass('arrow_pic_bottom arrow_right')
		
// 		$('#e1').css('position','absolute')
  		$('#e1').css('bottom','0px')
		$('#e2').addClass('arrow_pic_bottom arrow_right')
		left_b=0
		var kk=0	
		if ($('#kjcdbar').attr('zt')=='close'){
			kk=20 	
		}else{
			kk=63
		}
		 
		 if($('#kjcdbar').attr('zt')=='open'){       
				$('#kjcdbar').css({ 
					   "height":""+kk+"px",
					   "width":"100%"
				 }) 
				 $('#cdbutton').addClass("hidden_bottom hidden_bottom_b")  
	 		     $('#myiframes,#center').height(wHeight - 110 - 63 -5);
				 $('#myiframes,#center').width(wWidth - left_width)
	 			 }else{
	 				$('#kjcdbar').css({ 
						   "height":""+kk+"px",
						   "width":"100%"
					 })  
					 $('#kjcdbar').hide()
				     $('#cdbutton').addClass("hidden_bottom hidden_bottom_t")
				       
		 		     $('#myiframes,#center').height(wHeight - 110 -5);
					 $('#myiframes,#center').width(wWidth - left_width)
		 		     
	              }
	                    $('#cdbutton').bind('click', function(e){ 
	                		$('#kjcdbar').css('bottom','0px')
	                		$('#kjcdbar').css('top','auto')
	                		$('#kjcdbar').css('left','0px')
	                		$('#kjcdbar').css('right','auto')
	 		        	if($('#kjcdbar').attr('zt')=='open'){
	 		        		$('#myiframes,#center').height(wHeight - 110 -5);
	 		        		$('#cdbutton').removeClass('hidden_right hidden_right_l hidden_right_r    hidden_bottom_b');
	 		        		$('#cdbutton').addClass('hidden_bottom_t');
	 	 		        	$('#kjcdbar').hide();
	 	 		        	Setcookie('kjcdbarkg', 'close')
	 	 		        	$('#kjcdbar').attr('zt','close')
	 		        	}else{
	 		        		$('#myiframes,#center').height(wHeight - 110 - 63 -5);
	 	 		        	$('#kjcdbar').show();
	 	 					$('#kjcdbar').css({ 
		 						   "height":""+63+"px",
		 						   "width":"100%"
		 					    }) 
	 	 		        	$('#cdbutton').removeClass('hidden_right hidden_right_l hidden_right_r    hidden_bottom_t');
	 		        		$('#cdbutton').addClass('hidden_bottom_b');
	 	 		        	$('#kjcdbar').attr('zt','open')
	 	 		        	Setcookie('kjcdbarkg', 'open')
	 		        	}
	 		        } )
		}else{
		Setcookie('kjcdbarwz', 'right') 
		$('#e1').css('right','0px')
		$('#qhcd').attr('class','switch')
		$('#qhcd').css('left','auto')
		$('#qhcd').css('bottom','auto')
		$('#qhcd').css('top','0px')
		$('#qhcd').css('right','0px') 
			$('#kjcdbar').css('height',(wHeight-114)+'px')
			$('#kjcdbar').css('margin-top','33px')
			$('#kjcdbar').css('position','absolute')
			$('#kjcdbar').css('right','0px')
			$('#kjcdbar').css('left','auto')
			$('#kjcdbar').css('top','0px')
			$('#kjcdbar').css('bottom','auto')
			$(cds).each(function(i,dom){
				$(dom).css("top",((i+1)*63-90)+"px")
				$(dom).css("left",0+"px")
			})	
		
			$('#s1').addClass('arrow_bg_right')
			$('#s2').addClass('arrow_pic_right arrow_top')
			$('#e1').addClass('arrow_bg_right')
            $('#e1').css('position','absolute') 
            $('#e1').css('bottom','0px') 
			$('#e2').addClass('arrow_pic_right arrow_bottom')
			var kk=0	
	 		if ($('#kjcdbar').attr('zt')=='close'){
	 			kk=20 	
	 			left_b=	0
	 		}else{
	 			kk=63 
	 			left_b=63 
	 		} 
		     $('#myiframes,#center').height(wHeight - 115);
	 	 		$('#kjcdbar').css({ 
	 	 			"height":(wHeight-114)+'px',
	 			    "width":"63px",
	 			    "margin-top":"33px"
	 		        }) 
	 		 if($('#kjcdbar').attr('zt')=='open'){
	 			 $('#kjcdbar').show()
 
	 		      $('#cdbutton').removeClass()
	 		      $('#cdbutton').addClass("hidden_right hidden_right_r")
	 		      $('#myiframes,#center').width(wWidth - left_width - 66);
	 			 }else{
	 		 		    $('#kjcdbar').hide() 
		 		        $('#cdbutton').removeClass()
		 		        $('#cdbutton').addClass("hidden_right  hidden_right_l")
		 		        $('#myiframes,#center').width(wWidth - left_width);
	 			  }
	 			  $('#cdbutton').css({
	 			        	"z-index":"99999",
			 		        }).bind('click', function(e){
			 					$('#kjcdbar').css('right','0px')
			 					$('#kjcdbar').css('left','auto')
			 					$('#kjcdbar').css('top','0px')
			 					$('#kjcdbar').css('bottom','auto')
			 		        	//left_width=$('#frmTitle').is(':visible')?216:8;
			 					left_width=isHidden==0?260:50;
			 		        	if($('#kjcdbar').attr('zt')=='open'){
			 		        		
			 		        		$('#myiframes,#center').width(wWidth - left_width);
			 		        		$('#kjcdbar').hide()
			 		        		$('#cdbutton').removeClass()
		 		                    $('#cdbutton').addClass("hidden_right  hidden_right_l")
			 	 		        	left_b=0
			 	 					$('#kjcdbar').css({ 
				 						   "width":""+63+"px" 
				 					    }) 
			 	 		        	$('#kjcdbar').attr('zt','close')
			 	 		        	Setcookie('kjcdbarkg', 'close')  
			 		        	}else{
			 		        		 $('#e1').css('position','absolute') 
			 		        		$('#kjcdbar').show()
			 		        		left_b=125
			 	 					$('#kjcdbar').css({  
				 						   "width":""+63+"px",
				 						   //"height":(wHeight - 117 + nHeight)+"px"
				 					    }) 
			 		        		$('#cdbutton').removeClass()
		 		                    $('#cdbutton').addClass("hidden_right  hidden_right_r")
			 		        		$('#myiframes,#center').width(wWidth - left_width -66);
			 		        		Setcookie('kjcdbarkg', 'open')  
			 	 		        	$('#kjcdbar').attr('zt','open')
			 		        	}
			 		        	
			 	} )
		        
		}
	  Setcookie('kjcdbarkg', $('#kjcdbar').attr('zt'))  
	  $(document).triggerHandler("myEventName");
}

/*$(function(){
	$("#kjcdbar a").each(function(c){
		$(this).find("span").hide();
		$(this).mouseover(function(){
			$(this).find("div").hide();
			$(this).find("span").show();	
		}).mouseout(function(){
			$(this).find("div").show();
			$(this).find("span").hide();			
		})	
	})
})*/

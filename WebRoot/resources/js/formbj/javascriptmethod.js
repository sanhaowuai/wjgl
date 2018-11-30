var javascriptmethods = {
//    		condition:function(){},
//    		showdom:{
//                comments:'显示元素',
//                args:[
//                	{comments:'目标'}
//                ],
//    			run:function(target,value){
//    			 $(''+target).show();
//    			 $(''+target).html($(value).val());
//    		    }
//    	    },
//    	    hidedom:{
//                comments:'隐藏元素',
//                args:[
//                	{comments:'目标'}
//                ],
//    			run:function(target,value){
//    			 $(''+target).hide();
//    			 $(''+target).html($(value).val());
//    		    }
//    	    },
    	    HideOrShowDom:{
                comments:'隐藏隐藏元素',
                args:[
                	{comments:'目标'}
                ],
    			run:function(target,showvalue,isShow,value){
    			 if ($(value).prop('tagName')=='SELECT' ){
	    			 if (showvalue==$(value).val()){
	    			 $(''+target).show();
	    			 }else{
	    			 $(''+target).hide();
	    			 }
    			 }else  if($(value).prop('tagName')=='INPUT' ) {
    				 if($(value).attr('type')=='checkbox' || $(value).attr('type')=='radio' ){
    					 console.error($(value).is(':checked'))
    					 console.error($(value).val())
    					 console.error(showvalue)
    					 if ($(value).is(':checked') && showvalue==$(value).val()){
    					   $(''+target).show();
    	    			   }else{
    	    			   $(''+target).hide();
    	    			 }
    					 
    				 }
    			 }
    		    }
    	    }
//      ,   editCss:{
//                comments:'修改样式',
//                args:[
//                	{comments:'目标'}
//                ],
//    			run:function(target,isShow,css){
//    			 if (isShow){
//    			    $(''+target).css(css);
//    			 }
//    		    }
//    	    },
 }


;(function($){
         $.fn.calls=function(tpl){
        	 var $tpl=$(tpl)
        	 var _funcbody=eval('('+ $tpl.find("funcbody  > textarea").val()+')')
        	 var _fun= $tpl.attr("func")
        	 var _condition=eval('('+ $tpl.find("conditionbody >textarea").val()+')')
        	 var _args=eval('('+$tpl.attr("args")+')')||[]
        	 var $_this=$(this)
        	 return $(this).each(function(){
        		 if (_funcbody!=undefined){
        			 
        		 _funcbody.apply(this,_args);
        		 }
        		 
        		 
        		 $.each(javascriptmethods[_fun].args,function(index,arg){
        			 console.log("参数["+arg.comments+""+_args[index]+"]")
        			 console.dirxml($(""+_args[index]))
        		 })
        		 
        		 _args.push(_condition)
        		 _args.push($_this)
        		 javascriptmethods[_fun].run.apply(this,_args);
        	 })
         }
})(jQuery)
$(document).ready(function(){
    	   $('._tpl  list').each(function(i,dom){
    		   $(document).on($(dom).attr('eventtype'),'#'+$(dom).attr('value')+'[name]',function(e){
    			       
    				   $(this).calls(dom)
    			    
    	       })
    	       $(document).on($(dom).attr('eventtype'),'#'+$(dom).attr('value')+'.form-group  [name]',function(e){
    	    	   
    	    		  
    				   $(this).calls(dom)
    	    	   
    	       })
    	   })
})

 
function  getzujian( target  ,treenote ){
	   	   if ($(target)[0].tagName=='TABLE'){
	   	  	if (  $(target).children().eq(0)[0].tagName=='TBODY'){
	   	  		 target=$(target).children('TBODY');
	   	   	}
	   	  }
	   	  if ($(target).children('.grid,.zujian,.layoutTarget').size()>0){
	   	   	  $(target).children('.grid,.zujian,.layoutTarget').each(function(i,tg){
	   	   	 	    var child={id:"",text:"",children:[],iconCls:""}
	   	   	 	    child.id=$(tg).attr('id');
	   	   	 	    var attrs=""
		   	   	 	$.each($(tg).prop("attributes"),function(k,b){
		   	   	 	 	  attrs += b['nodeName']+'='+ $(tg).attr(b['nodeName']) +" "
			   	    })
	   	   	        var _tagName=$(tg).prop('tagName')
	   	   	 	    if ($(tg).attr('_name')==undefined){
	   	   	 	    	child.text=$(tg).attr('name');
	   	   	 	    }else{
	   	   	 	    	child.text=$(tg).attr('_name');
	   	   	 	    }
	   	   	 	    if ($(tg)[0].tagName.toUpperCase()=='DIV' ){
	   	   	 	    	child.iconCls='layout_div'
	   	   	 	    }else if($(tg)[0].tagName.toUpperCase()=='TEXTAREA' ){
	   	   	 	    	child.iconCls='input_textarea'
	   	   	 	    }else if($(tg)[0].tagName.toUpperCase()=='SELECT' ){
	   	   	 	    	child.iconCls='input_select'
	   	   	 	    }else if($(tg)[0].tagName.toUpperCase()=='INPUT' ){
	   	   	 	    	if ($(tg).attr('type')=='text'){
	   	   	 	    		child.iconCls='input_text'
	   	   	 	    	}else if ($(tg).attr('type')=='password'){
	   	   	 	    		child.iconCls='input_password'
	   	   	 	    	}else if ($(tg).attr('type')=='checkbox'){
	   	   	 	    		child.iconCls='input_checkbox'
	   	   	 	    	}else if ($(tg).attr('type')=='radio'){
	   	   	 	    		child.iconCls='input_radio'
	   	   	 	    	}
	   	   	 	    }else if($(tg)[0].tagName.toUpperCase()=='TABLE' ){
	   	   	 	    	child.iconCls='data_table'
	   	   	 	    }else if($(tg)[0].tagName.toUpperCase()=='TR' ){
	   	   	 	    	child.iconCls='layout_tr'
	   	   	 	    }else if($(tg)[0].tagName.toUpperCase()=='TD' ){
	   	   	 	    	child.iconCls='layout_td'
	   	   	 	    }
	   	   	 	    treenote.children.push(child);
	   	   	 	    var _html=$(tg).html();
	   	   		    getzujian( $(tg) ,child)
	   	   	 })
	   	   }
	   }
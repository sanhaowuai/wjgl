jQuery(document).ready(function(){
    jQuery('div.switch').mouseover(function(){ 
       jQuery('div.switch-bd').show();
  });
  jQuery('div.switch').mouseleave(function(){
   	  jQuery('div.switch-bd').hide();
  });

  
});
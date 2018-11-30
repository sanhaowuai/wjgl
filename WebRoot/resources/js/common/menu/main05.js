//menu
$(document).ready(function(){
  
  $('li.mainlevel').mousedown(function(){
  $(this).find('ul').slideDown();//you can give it a speed
  $(this).find('a').addClass('hover');
  });
  $('li.mainlevel').mouseleave(function(){
  $(this).find('ul').slideUp("fast");
  $(this).find('a').removeClass('hover');
  });
  
});
 
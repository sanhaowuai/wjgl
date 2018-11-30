
$(function () {
  //navlist
  $('#navList').on('click', '.nav-btn', function(event) {
    if($(this).hasClass('btn-active')){
      $('#expandZone #closeBtn').click();
      return false;
    }
    var curIndex = $(this).index()
      , mlValue = '-' + curIndex * 100 + '%';
    if( $('#expandZone').hasClass('active') ){
      $('#expandZone .download').animate({marginLeft: mlValue});
    }
    else{
      $('#expandZone .download').css({marginLeft: mlValue});
    }
    var device = $(this).data('device');
    $(this).addClass('btn-active').siblings().removeClass('btn-active');
    $(device).addClass('item-active').siblings().removeClass('item-active');
    $('#expandZone').show(1000).addClass('active');
    return false;
  });

  $('#expandZone #closeBtn').on('click', function() {
    $('#expandZone').hide(function () {
      $(this).removeClass('active');
      $('#navList .btn-active').removeClass('btn-active');
    });
    return false;
  });
  $('#expandZone #closeBtn2').on('click', function() {
	  $('#expandZone').hide(function () {
		  $(this).removeClass('active');
		  $('#navList .btn-active').removeClass('btn-active');
	  });
	  //return false;
  });
});	
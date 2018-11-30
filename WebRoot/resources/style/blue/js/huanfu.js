 
//换肤

  $(function() {
	  var curWwwPath = window.document.location.href;
	  var pathName = window.document.location.pathname;
	  var pos = curWwwPath.indexOf(pathName);
	  var localhostPaht = curWwwPath.substring(0, pos);
	  var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
	  var path = localhostPaht + projectName;
      $("#button-bg").click(function() {
          $("body").css({
              "background": "url('"+path+"/resources/style/blue/images/bg5.jpg') no-repeat",
              "background-size":"cover"
          });
      });
      $("#button-bg2").click(function() {
          $("body").css({
              "background": "url('"+path+"/resources/style/blue/images/bg2.jpg') no-repeat",
              "background-size":"cover"
          });
      });


      $("#button-bg3").click(function() {
          $("body").css({
              "background": "url('"+path+"/resources/style/blue/images/bg.jpg') no-repeat",
              "background-size":"cover"
          });


      });

      $("#button-bg5").click(function() {
          $("body").css({
              "background": "url('"+path+"/resources/style/blue/images/giftly.png')repeat",
              "background-size":"cover"
          });

      });

      $("#button-bg6").click(function() {
          $("body").css({
              "background": "#2c3e50"
          });

      });

      $("#button-bg7").click(function() {
          $("body").css({
              "background": "url('"+path+"/resources/style/blue/images/bg3.png') repeat",
              "background-size":"cover"
          });

      });
      $("#button-bg8").click(function() {
          $("body").css({
              "background": "url('"+path+"/resources/style/blue/images/bg8.jpg') no-repeat",
              "background-size":"cover"
          });
      });
      $("#button-bg9").click(function() {
          $("body").css({
              "background": "url('"+path+"/resources/style/blue/images/bg9.jpg') no-repeat",
              "background-size":"cover"
          });
      });

      $("#button-bg10").click(function() {
          $("body").css({
              "background": "url('"+path+"/resources/style/blue/images/bg10.jpg') no-repeat",
              "background-size":"cover"
          });
      });
      $("#button-bg11").click(function() {
          $("body").css({
              "background": "url('"+path+"/resources/style/blue/images/bg11.jpg') no-repeat",
              "background-size":"cover"
          });
      });
      $("#button-bg12").click(function() {
          $("body").css({
              "background": "url('"+path+"/resources/style/blue/images/bg12.jpg' )no-repeat",
              "background-size":"cover"
          });
      });

      $("#button-bg13").click(function() {
          $("body").css({
              "background": "url('"+path+"/resources/style/blue/images/bg13.jpg') no-repeat",
              "background-size":"cover"
          });

      });
      /**
       * Background Changer end
       */
  });


 
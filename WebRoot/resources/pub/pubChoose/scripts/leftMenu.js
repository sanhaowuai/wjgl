//隐藏左侧菜单
function menuhide() {
	$("#main_left_menu").css({
		"position" : "absolute",
		"z-index" : "999"
	});
	$("#main_left_menu").animate({
		left : "-175px",
	}, "slow");
	$(".main_right").css({
		"margin-left" : "50px"
	});
}
// 显示左侧菜单
function menushow() {
	$("#main_left_menu").animate({
		left : "0px",
	}, "fast");
	$(".main_right").css({
		"margin-left" : "197px",
		"position" : "static"
	});
}

// 左侧菜单
function leftMenu(id) {
	$('.ali a').each(function(){
	    if($(this).attr('id')==id){
	    	$(this).css('background-color','#2b4066');
	    }else{
	    	$(this).css('background-color','');
	    }
	  });
	var leftMenuDiv ="";
	//leftMenuDiv += "<span id=\"set_show\"><a class=\"show_icon\" href=\"#\"></a></span>";
	leftMenuDiv +="<ul>";
	if(id=='0'){
		mainUrl('/main',''); 
		leftMenuDiv += '<li class="text_1em" name="0" id="1"><a href="#"><em class="icon_pic"></em>快捷菜单</a>';
		leftMenuDiv += '<div class="third_nav" style="display: block;"><ul>';
		for(var i=0;i<userMenu.length;i++){
			leftMenuDiv+='<li style="border-top-style: none; border-bottom-style: none;">';
			leftMenuDiv+="<a href=\"javascript:mainUrl('"+ userMenu[i].MENUURL+ "','"+ userMenu[i].MENUNAME+"')\">"+ userMenu[i].MENUNAME + "</a>";
			leftMenuDiv+="</li>";
		}
		leftMenuDiv+="</ul></div></li>"; 
	}else{ 
		for (var i = 0; i < menuJson.length; i++) {
			// 判断二级菜单的父节点ID是否等于点击的一级菜单
			if (menuJson[i].PID == id) {
				leftMenuDiv += "<li class=\"text_1em\" name=\"0\" id='"+i+"'>";
				// 判断是否存在三级菜单
				if (menuJson[i].ISPARENT == 'FALSE') {
					leftMenuDiv +="<a href=\"javascript:mainUrl('"+ menuJson[i].MENUURL+ "','"+ menuJson[i].NAME+"')\"><em  class=\"icon_pic-\"></em>"+ menuJson[i].NAME + "</a>";
				} else {
					leftMenuDiv += "<a href=\"#\" ><em class=\"icon_pic-\"></em>" + menuJson[i].NAME + "</a>";
					leftMenuDiv += "<div class=\"third_nav\">";
					leftMenuDiv += "<ul>";
					for (var j = 0; j < menuJson.length; j++) {
						if (menuJson[i].ID == menuJson[j].PID) { 
							leftMenuDiv = leftMenuDiv+ "<li><a href=\"javascript:mainUrl('"+  menuJson[j].MENUURL+ "','"+ menuJson[j].NAME + "')\">"+ menuJson[j].NAME + "</a></li>";
						}
					}
					leftMenuDiv += "</ul>";
					leftMenuDiv += "</div>";
				}
				leftMenuDiv += "</li>";
			}
		} 
	}
		leftMenuDiv = leftMenuDiv + "</ul>";
		// 填充菜单信息
		$("#main_left_menu").html(leftMenuDiv); 
		// 绑定左侧菜单点击事件
		$("#main_left_menu ul").children("li").click(function() {
			$(this).nextAll().children("div").hide("fast");
			$(this).prevAll().children("div").hide("fast");
			$(this).nextAll().children("a").children("em").removeClass();
			$(this).prevAll().children("a").children("em").removeClass();
			$(this).nextAll().children("a").children("em").addClass("icon_pic-");
			$(this).prevAll().children("a").children("em").addClass("icon_pic-");
			$(this).children("div").children("ul").children("li").first().css({
				"border-top" : "none"
			});
			$(this).children("div").children("ul").children("li").last().css({
				"border-bottom" : "none"
			});
			var name = $(this).attr("name");
			if (name == 1) {
				$(this).children("a").children("em").removeClass();
				$(this).children("a").children("em").addClass("icon_pic-");
				$(this).children("div").hide("fast");
				$(this).attr("name", "1");
				$(this).nextAll().attr("name", "0");
				$(this).prevAll().attr("name", "0");
			} else {
				$(this).children("a").children("em").removeClass();
				$(this).children("a").children("em").addClass("icon_pic");
				$(this).children("div").show("fast");
				$(this).attr("name", "0");
				$(this).nextAll().attr("name", "0");
				$(this).prevAll().attr("name", "0");
			}
		});
		$('.text_1em').each(function(index){
		    if(index==0){
		    	$(this).click();
		    }
		  });
		
		// 绑定左侧菜单收缩点击事件
		$("#set_show").click(function() {
			if (isShowLeft) {
				menuhide();
				isShowLeft = false;
			} else {
				menushow();
				isShowLeft = true;
			}
		}); 
	}
 
//根据菜单连接显示个业务操作
function mainUrl(url,name)
{
	 
	 var mainUrl = hostUrl+url;
	 if(name==''){
		 $("body").layout('panel','center').panel({ title: ''});
	 }else{
		 $("body").layout('panel','center').panel({ title: titleImg+ name });
	 }
	 $.parser.parse();  
	 $("#mainIframe").attr("src",mainUrl); 
}  

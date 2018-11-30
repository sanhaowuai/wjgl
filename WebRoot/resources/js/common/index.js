var MENU_ITEM_HEIGHT = 30;
var MIN_PNAEL_HEIGHT = 8 * MENU_ITEM_HEIGHT;
var MAX_PNAEL_HEIGHT = 20 * MENU_ITEM_HEIGHT;
var SCROLL_HEIGHT = 4 * MENU_ITEM_HEIGHT;  
jQuery.noConflict();

(function($){
     
	//标签操作——增加
	$.fn.addTab = function(id, title, url, closable, selected){
		$('.over-mask-layer').hide();   //如果有门户切换、常用任务等面板打开，则隐藏之
		$('#overlay_panel').hide();

		if(!id) return;
		closable = (typeof(closable) == 'undefined') ? true : closable;
		selected = (typeof(selected) == 'undefined') ? true : selected;
		$('#tabs_container').tabs('add', {
			id: id,
			title: title,
			closable: closable,
			selected: selected,
			content: '<iframe id="tabs_' + id + '_iframe" name="tabs_' + id + '_iframe" src="' + url + '" onload="IframeLoaded(\'' + id + '\');" border="0" frameborder="0" framespacing="0" marginheight="0" marginwidth="0" allowTransparency="true" style="width:100%;height:100%;"></iframe>'
		});
	};

	//标签操作——选择
	$.fn.selectTab = function(id){
		$('#tabs_container').tabs('select', id);
	};

	//标签操作——关闭
	$.fn.closeTab = function(id){
		$('#tabs_container').tabs('close', id);
	};

	//标签操作——已选择
	$.fn.getSelected = function(){
		return $('#tabs_container').tabs('selected');
	};

	function checkActive(id){//检查按钮激活状态
		if($('#'+id+'_panel:hidden').length > 0){
			$('#'+id).removeClass('active');
		}else{
			window.setTimeout(checkActive, 300, id);
		}
	};

	function resizeLayout(){// 主操作区域高度
	
 		var wHeight =(window.innerHeight || (window.document.documentElement.clientHeight || window.document.body.clientHeight));
 		var wWidth = (window.innerWidth || (window.document.documentElement.clientWidth || window.document.body.clientWidth));
		var nHeight = $('#north').is(':visible') ? 33 : 115;
	    var fHeight = $('#funcbar').is(':visible') ? $('#funcbar').outerHeight() : 0;
 		$('#tabs_portal_0_panel').height(wHeight - 153 + nHeight);
		//一级标签宽度
		var width = wWidth -20; 
		$('#tabs_container').width(width - $('#tabs_left_scroll').outerWidth() - $('#tabs_right_scroll').outerWidth()-11);
		$('#taskbar_center').width(width);   //显示右箭头——原来为width-1导致右箭头不显示 
		$('#tabs_container').triggerHandler('_resize');
		
	};

	function initTabs(){//设置标签栏属性
	
		$('#tabs_container').tabs({
			
			tabsLeftScroll:'tabs_left_scroll',
			tabsRightScroll:'tabs_right_scroll',
			panelsContainer:'center',
			secondTabsContainer: 'funcbar_left'//二级菜单
		});
		$('#tabs_container').triggerHandler('_resize');

		//关闭所有标签后，显示门户切换
		//$('#tabs_container').bind('_close', function(){
		//	if($('a.tab', this).length <= 0 && $('#portal_panel:visible').length <= 0)
		//		$('#portal').trigger('click');
		//});
	};
 
  
	//生成二级菜单
	function getSecondMenuHTML(id){
		var html = '';
		for(var i=0; i < second_array[id].length; i++){
			var func_id = 'f' + second_array[id][i];
			var func_name = func_array[func_id][0];
			var func_code = func_array[func_id][1];
			var open_window = func_array[func_id][3] ? func_array[func_id][3] : '';
			var bExpand = func_code.substr(0,1) == "@" && third_array[func_id];
			var onclick = bExpand ? "" : "createTab('" + func_id.substr(1) + "','" + func_name.replace("'", "\'") + "','" + func_code.replace("'", "\'") + "','" + open_window + "');";

			html += '<li><a id="' + func_id + '" href="javascript:void(0);" onclick="' + onclick + '"' + (bExpand ? ' class="expand"' : '') + ' hidefocus="hidefocus"><span>' + func_name + '</span></a>';

			if(bExpand){
				html += '<ul>';
				for(var j=0; j < third_array[func_id].length; j++){
					var func_id1 = 'f' + third_array[func_id][j];
					var func_name1 = func_array[func_id1][0];
					var func_code1 = func_array[func_id1][1];
					var open_window1 = func_array[func_id1][3] ? func_array[func_id1][3] : '';
					var onclick1 = "createTab('" + func_id1.substr(1) + "','" + func_name1.replace("'", "\'") + "','" + func_code1.replace("'", "\'") + "','" + open_window1 + "');";
					html += '<li><a id="' + func_id1 + '" href="javascript:void(0);" onclick="' + onclick1 + '" hidefocus="hidefocus"><span>' + func_name1 + '</span></a></li>';
				}
				html += '</ul>';
			}
			html += '</li>';
		}

		return '<ul id="second_menu">' + html + '</ul>';
	};   

	function initStartMenu(){//初始化开始菜单

		//点击页面，隐藏各级菜单面板，并清除二级和三级菜单的active状态
		$('#overlay_startmenu').click(function(){
			if($('#start_menu_panel:visible').length){
				$('#overlay_startmenu').hide();
				$('#start_menu_panel').slideUp(300);
				$('#start_menu').removeClass('active');
			}
		});

		//鼠标点击导航图标按钮弹出菜单面板
		//$('#start_menu').bind('mouseover', function(){
		$('#start_menu').bind('click', function(){

			//设置导航图标为active状态
			$(this).addClass('active');

			//遮罩层位置和显示
			$('#overlay_startmenu').show();

			//菜单面板位置
			var top = $('#start_menu').offset().top + $('#start_menu').outerHeight() - 6;
			$('#start_menu_panel').css({top: top});
			$('#start_menu_panel').slideDown('fast');

			//取得菜单的全部长度
			var scrollHeight = $("#first_menu").attr('scrollHeight');

			//计算并设置菜单面板的高度,是否显示滚动箭头
			var height = ($('#south').offset().top - $('#start_menu').offset().top)*0.7;   //可用高度为开始菜单和状态栏高差的70%
			height = height - height % MENU_ITEM_HEIGHT;   //可用高度为 MENU_ITEM_HEIGHT 的整数倍

			//如果可用高度大于允许的最高高度，则限制
			height = height <= MAX_PNAEL_HEIGHT ? height : MAX_PNAEL_HEIGHT;
			//如果可用高度小于允许的最低高度，则限制
			height = height >= MIN_PNAEL_HEIGHT ? height : MIN_PNAEL_HEIGHT;
			//如果可用高度超过scrollHeight，则设置高度为scrollHeight
			height = height > scrollHeight ? scrollHeight : height;
			//设置固定高度
			height = 400;

			$('#first_menu').height(height);//固定设置开始菜单高度

			if($("#first_menu").height() >= scrollHeight){
				$('#first_panel > .scroll-up:first').hide();
				$('#first_panel > .scroll-down:first').hide();
			}else{
				$('#first_panel > .scroll-up:first').show();
				$('#first_panel > .scroll-down:first').show();
			}

			//计算并设置二级菜单面板的位置
			var top = $('#first_menu').offset().top - $("#start_menu_panel").offset().top;
			$('#second_panel').css('top', top - 5);
			$('#second_panel > .second-panel-menu').css('height', $('#first_menu').height());

			//第一次打开时设置二级菜单滚动事件
			if($('#second_panel > .second-panel-menu > .jscroll-c').length <= 0){
				//$('#second_panel > .second-panel-menu').jscroll();//IE下出现问题
			}
		});

		//生成一级菜单
		var html = "";
		for(var i=0; i<first_array.length; i++){
			var menu_id = first_array[i];
			if(typeof(func_array['m'+menu_id]) != "object")
				continue;

			//var image = !func_array['m'+menu_id][1] ? 'icon_default' : func_array['m'+menu_id][1];
			html += '<li><a id="m' + menu_id + '" href="javascript:void(0);" hidefocus="hidefocus"><img src="/ispace/images/default.gif" align="absMiddle" />&nbsp;&nbsp;&nbsp;' + func_array['m'+menu_id][0] + '</a></li>';
		}
		//alert(html);
		$("#first_menu").html(html);
		$("#first_menu").mousewheel(function(){
			$('#first_menu').stop().animate({'scrollTop':($('#first_menu').scrollTop() - this.D)}, 300);
		});

		//一级菜单滚动箭头事件
		initMenuScroll('first_panel');

		//一级菜单hover和click事件
		$("#first_menu > li > a").click(function(){

			//如果当前一级菜单为active，则返回
			if(this.className.indexOf('active') >= 0)
				return;

			$("#second_menu > li > a.expand").removeClass('active');   //恢复二级expand菜单为正常
			$("#first_menu > li > a.active").removeClass('active');   //恢复一级级active的菜单为正常

			//获取当前一级菜单下属二级菜单的HTML代码，并更新二级菜单面板
			$('#second_panel > .second-panel-menu').html(getSecondMenuHTML(this.id));
			$("#" + this.id).addClass('active');   //将当前一级菜单设为active

			//二级级菜单滚动事件
			$('#second_panel > .second-panel-menu').jscroll();

			//二级菜单点击展开三级菜单
			$('#second_menu > li > a.expand').click(function(){
				
				//关闭其它三级菜单
				$(this).parent().siblings().find('ul').hide();
				$(this).parent().siblings().find('a').removeClass('active');
				
				$(this).toggleClass('active');
				$(this).parent().children('ul').toggle();
				$('#second_panel > .second-panel-menu').jscroll();
			});
		});

		if(menuExpand !="" && typeof(second_array['m'+menuExpand]) == "object"){
			//展开定义的二级菜单
			$('#m'+menuExpand).addClass('active');
			$('#second_panel > .second-panel-menu').html(getSecondMenuHTML('m'+menuExpand));

			//二级菜单点击展开三级菜单
			$('#second_menu > li > a.expand').click(function(){
				$(this).toggleClass('active');
				$(this).parent().children('ul').toggle();
				$('#second_panel > .second-panel-menu').jscroll();
			});
		}else{
			//登录时把常用任务菜单项作为二级菜单的内容
			var html = "";
			for(var i=0; i<shortcutArray.length; i++){
				if(typeof(func_array['f'+shortcutArray[i]]) != "object")
					continue;
				var func_id = 'f'+shortcutArray[i];
				var func_name = func_array[func_id][0];
				var func_code = func_array[func_id][1];
				var open_window = func_array[func_id][3] ? func_array[func_id][3] : "";
				if(func_code.substr(0, 1) == "@")
					continue;
				var onclick = "createTab(" + func_id.substr(1) + ",'" + func_name.replace("'", "\'") + "','" + func_code.replace("'", "\'") + "','" + open_window + "');";
				html += '<li><a id="' + func_id + '" href="javascript:void(0);" onclick="' + onclick + '" hidefocus="hidefocus"><span>' + func_name + '</span></a></li>';
			}
			html = '<ul id="second_menu">' + html + '</ul>';
			$('#second_panel > .second-panel-menu').html(html);
		}
      
		$('#second_panel, #second_menu').bind('selectstart', function(){
			return false;
		});
	};

   //菜单滚动箭头事件,id为first_menu
   function initMenuScroll(id){
	   //菜单向上滚动箭头事件
	   $('#' + id + ' > .scroll-up:first').hover(
			   function(){
				   $(this).addClass('scroll-up-hover');
				   if(id == 'first_panel'){
					   $("#first_menu > li > a.active").removeClass('active');   //恢复一级active的菜单为正常
				   }
			   },
			   function(){
				   $(this).removeClass('scroll-up-hover');
			   }
	   );

	   //点击向上箭头
	   $('#' + id + ' > .scroll-up:first').click(
			   function(){
				   var ul = $('#' + id + ' > ul:first');
				   ul.animate({'scrollTop':(ul.scrollTop()-SCROLL_HEIGHT)}, 600);
			   }
	   );

	   //向下滚动箭头事件
	   $('#' + id + ' > .scroll-down:first').hover(
			   function(){
				   $(this).addClass('scroll-down-hover');
				   if(id == 'first_panel'){
					   $("#first_menu > li > a.active").removeClass('active');   //恢复一级级active的菜单为正常
				   }
			   },
			   function(){
				   $(this).removeClass('scroll-down-hover');
			   }
	   );

	   //点击向下箭头
	   $('#' + id + ' > .scroll-down:first').click(
			   function(){
				   var ul = $('#' + id + ' > ul:first');
				   ul.animate({'scrollTop':(ul.scrollTop()+SCROLL_HEIGHT)}, 600);
			   }
	   );
	};   

 

	function initHideTopbar(){//隐藏topbar事件
		$('#hide_topbar').bind('click', function(){
			$('#north').slideToggle(300, function(){resizeLayout();});
			$(this).toggleClass('up');

			var hidden = $(this).attr('class').indexOf('up') >= 0;
			$.cookie('hideTopbar', (hidden ? '1' : null), {expires:1000, path:'/'});
      });

      if($.cookie('hideTopbar') == '1')
         $('#hide_topbar').triggerHandler('click');
	};

	

	//窗口resize事件
	$(window).resize(function(){resizeLayout();});
	//$(window).bind('beforeunload', function(){exit();});

 
	
	$(document).ready(function($){  
		//调整窗口大小
		resizeLayout();

		//标签栏
		initTabs(); 
	 
		//隐藏topbar事件
		initHideTopbar();
 
	});
})(jQuery);

var $ = function(id) {return document.getElementById(id);};

function createTab(id, name, code, open_window){
	//alert('create:id='+id+'|name='+name+'|code='+code+'|open_window='+open_window);
	jQuery('#overlay_startmenu').triggerHandler('click');
	jQuery('#funcbar_left > div.second-tabs-container').hide();
	var url=code;

	//新窗口打开或非OA模块
	if(open_window != "1"){
		openURL(id, name, url, open_window);
		return;
	}else{
		window.open(url);
		return;
	}
}

function closeTab(id){
	id = (typeof(id) != 'string') ? jQuery().getSelected() : id;
	jQuery().closeTab(id);
}

function openURL(id, name, url, open_window){
   id = !id ? ('w' + (nextTabId++)) : id;
   if(open_window != "1")
   {
      window.setTimeout(function(){jQuery().addTab(id, name, url, true)}, 1);
   }
   else
   {
      var mytop = (screen.availHeight-500)/2-30;
      var myleft = (screen.availWidth-780)/2;
      window.open(url, id, "height=548,width=780,status=0,toolbar=no,menubar=yes,location=no,scrollbars=yes,top="+mytop+",left="+myleft+",resizable=yes");
   }
   jQuery(document).trigger('click');
}

function IframeLoaded(id){
	var iframe = window.frames['tabs_' + id + '_iframe'];
	if(iframe && $('tabs_link_' + id) && $('tabs_link_' + id).innerText == ''){
		$('tabs_link_' + id).innerText = !iframe.document.title ? "无标题" : iframe.document.title;
	}
}

 
function logout(){
	top.location.href="../login/logout.jsp";
}

function toggleList(){
	var iframe_id;
	iframe_id = jQuery("div[class='tabs-panel selected'] iframe").attr('id');

	if(jQuery("td:.Width200",window.frames[iframe_id].document).css('display')=='none'){
		jQuery("td:.Width200",window.frames[iframe_id].document).show();
	}else{
		jQuery("td:.Width200",window.frames[iframe_id].document).hide();
	}
}
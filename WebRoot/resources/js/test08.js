	var namKey=null;
	var namKeys="none";
	
	$.ajax({ 
			url:path+'/skin/querySkin', 
			type:'get', //数据发送方式 
			dataType:'json', //接受数据格式 (这里有很多,常用的有html,xml,js,json) 
			error: function(){ //失败 
				alert('Error loading document'); 
			}, 
			success: function(data){ //成功 

				var DataSaved=data;
		
				namKey="#"+DataSaved.namKey;
				namKeys="#"+DataSaved.namKeys;
					
				bgColor();
			}
		});
	function bgColor(){

		var styleCss="<style>.address{color:"+namKeys+";}.addlist_button a span{background-color:"+namKey+"!important;} .addlist_button a{background-color:"+namKey+"!important;} .btn-search{background-color:"+namKey+"!important;border-color:"+namKey+"!important;} .bot_line th{border-top-color:"+namKey+"!important;} .list-page a.cur{background-color:"+namKey+"!important;} .list-page li:hover{border-color:"+namKey+"!important;} .list-page li:hover a{background:"+namKey+"!important;} .addlist_button2 a span{background-color:"+namKey+"!important;} .addlist_button2 a:hover span{background-color:"+namKey+"!important;} .addlist_button2 a{background-color:"+namKey+"!important;} .addlist_button2 a span:hover{background-color:"+namKey+"!important;} .btn-search:hover{background-color:"+namKey+"!important;} .btn-info{background-color:"+namKey+"!important;border-color:"+namKey+"!important;} .btn-search{background-color:"+namKey+"!important;border-color:"+namKey+"!important;} .addlist_button2 a{background-color:"+namKey+"!important;} .addlist_button2 a:hover{background-color:"+namKey+"!important;} .addlist_button1 a{background-color:"+namKey+"!important;} .addlist_button1 a span{background-color:"+namKey+"!important;}</style>";

		$("head").append(styleCss);
	};
	function returnA(nka){
		
        $.ajax({
            type: "GET",
            async:false,
            url: "saveSkin",
            data: {"namKey":nka,"prom":"1"},
            dataType: "text",
        });
	};
	function returnB(nkb){
		
        $.ajax({
            type: "GET",
            async:false,
            url: "saveSkin",
            data: {"namKey":nkb,"prom":"2"},
            dataType: "text",
        });
	};

	$(function (){
		
	$(".contentCol").change(function (){
		namKey=$(this).val();
		         $.ajax({
		             type: "GET",
		             url: "saveSkin",
		             data: {"namKey":namKey,"prom":"1"},
		             dataType: "text",
		         });
		
    });
	$(".contentCrumbs").change(function (){
		namKeys=$(this).val();
		
		         $.ajax({
		             type: "GET",
		             url: "saveSkin",
		             data: {"namKey":namKeys,"prom":"2"},
		             dataType: "text",
		         });
		
    });

//	$("#taskbar #taskbar_center #tabs_container DIV A.tab").live("click",function (){
//		var idName=$(this).attr("index");
//		idName="tabs_"+idName+"_iframe"
//		if(idName!=="tabs_0123_iframe"){	
//				document.getElementById(idName).contentWindow.location.reload(true);
//		}
//		
//	});
});
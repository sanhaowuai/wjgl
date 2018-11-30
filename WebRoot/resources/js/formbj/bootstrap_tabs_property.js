$(document).ready(function(){
	
	
	var wHeight
	var wWidth
	wHeight =(window.innerHeight || (window.document.documentElement.clientHeight || window.document.body.clientHeight));
	wWidth = (window.innerWidth || (window.document.documentElement.clientWidth || window.document.body.clientWidth));
		wHeight =(window.innerHeight || (window.document.documentElement.clientHeight || window.document.body.clientHeight));
		wWidth = (window.innerWidth || (window.document.documentElement.clientWidth || window.document.body.clientWidth));
    
 		$("iframe.tab").each( function(i,dom){
 			$(dom).height(wHeight-100 - $(dom).offset().top );
 		
 		})
	 
				$(window).resize(function() {
					wHeight =(window.innerHeight || (window.document.documentElement.clientHeight || window.document.body.clientHeight));
					wWidth = (window.innerWidth || (window.document.documentElement.clientWidth || window.document.body.clientWidth));
			 		$("iframe.tab").each( function(i,dom){
			 			$(dom).height(wHeight-100 - $(dom).offset().top );
			 		})
				});

		
$(document).on('click', 'a[data-toggle="tab"]',function (e) {
  var  $tab = $('#tt_tabs').tabs('getSelected');
  var data=new Array()
  tabsload(this,data)
 
  $tab.find('.easyui-propertygrid').propertygrid('loadData',  data);
})
})

var tabsload=function(target,data){
	 var defValue=$(target).text()
	 data.push( { "name": "TAB名称", "group": "属性", "value": ""+  defValue +"","field": "anmc",  "editor": { "type": 'textbox',
			"options": { onChange:function(newValue,oldValue){
				$(target).text(newValue)
			}}}})
	  var  datasourceName=$('#datasourceName').combobox('getValue')
      $.ajax({
		    async:false,
		    data:{sjymc:datasourceName},
	        url: jspath+'/Jsqlquery/queryListWindows',
	        success: function(result){
	        	modata = result;
		   },
	       dataType: 'JSON'
	      });
	  var defValue_sjdjdz =$(target).attr("zxxb_id")
	  data.push({ "name": "窗口","width":"80", "group": "属性", "value": ""+  defValue_sjdjdz +"","field": "sjdjdz",  "editor": { "type": 'combobox',
				"options": {
					valueField:'value',
					textField:'name',
					data:modata,
					onChange:function(newValue,oldValue){
				    var  cid=$(target).attr("href")
				    $(target).attr("href",'#'+newValue)
				    $(''+cid).find('iframe').attr('src',jspath+'/Jsqlquery/htmlSelectCodeEngine/'+newValue)
				    $(target).attr('zxxb_id',newValue)
				    $(''+cid).find('iframe').attr('zxxb_id',newValue)
				    $(''+cid).attr('id',newValue)
	  }}}})
}
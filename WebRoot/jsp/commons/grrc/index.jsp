<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<link rel='stylesheet' href='<%=path%>/resources/js/fullcalendar-2.9.1/lib/cupertino/jquery-ui.min.css' />
<link href='<%=path%>/resources/js/fullcalendar-2.9.1/fullcalendar.css' rel='stylesheet' />
<link href='<%=path%>/resources/js/fullcalendar-2.9.1/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='<%=path%>/resources/js/fullcalendar-2.9.1/lib/moment.min.js'></script>
<script src='<%=path%>/resources/js/fullcalendar-2.9.1/lib/jquery.min.js'></script>
<script src='<%=path%>/resources/js/fullcalendar-2.9.1/fullcalendar.min.js'></script>
<script src='<%=path%>/resources/js/fullcalendar-2.9.1/lang-all.js'></script>
<script src='<%=path%>/resources/js/fullcalendar-2.9.1/lib/moment.min.js'></script>
<script src='<%=path%>/resources/js/fullcalendar-2.9.1/lib/jquery-ui.custom.min.js'></script>
<!-- Add fancyBox main JS and CSS files -->
<script type="text/javascript" src="<%=path%>/resources/js/fancyapps-fancyBox-18d1712/source/jquery.fancybox.js?v=2.1.5"></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/js/fancyapps-fancyBox-18d1712/source/jquery.fancybox.css?v=2.1.5" media="screen" />

<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js" ></script>
<script>
	$(document).ready(function() {
		var initialLangCode = 'zh-cn';
		
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month'
			},
			theme:true,
			defaultDate: new Date(),
			dayClick: function(date, allDay, jsEvent, view) {
				var selDate = $.fullCalendar.moment(date, 'DD.MM.YYYY').format('YYYY-MM-DD');//格式化日期 
				$.fancybox.open({
					href : '<%=path%>/grrc/addSinGrrc/${sessionScope.CURRENT_USER.yhdm}/'+selDate,
					type : 'ajax'
				});					
				/**
				eventData = {
					title: '11111',
					start: date
				};
				**/
				//$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
				
				console.log("dayClick"+date+"="+new Date()+"="+$.fullCalendar.moment(new Date(), 'DD.MM.YYYY').format('YYYY-MM-DD'));
			},		
		    eventClick: function(calEvent, jsEvent, view) {
		    	if(calEvent.url == '' || calEvent.url == null){
					$.fancybox.open({
						href : '<%=path%>/grrc/editSinGrrc/${sessionScope.CURRENT_USER.yhdm}/'+calEvent.id,
						type : 'ajax'
					});			    		
		    	}else {
		    		//alert(calEvent.url);
		    		//return ;
		    	}
		        $(this).css('border-color', 'red');
		    },			
			lang: initialLangCode,
			buttonIcons: false, // show the prev/next text
			weekNumbers: false,
			editable: false,
			eventLimit: true, // allow "more" link when too many events	
			events: {
				url: '<%=path%>/grrc/queryGrrcJson/${sessionScope.CURRENT_USER.yhdm}',
				error: function() {
					$('#script-warning').show();
				}
			},
			loading: function(bool) {
				$('#loading').toggle(bool);
			}
		});

	});
	function updShumitSinGrrc(id){
		if(confirm("您确定要修改保存么？") == true){
			$("#editForm").ajaxSubmit({
			     type: "post",
			     url: "<%=path%>/grrc/updShumitSinGrrc/${sessionScope.CURRENT_USER.yhdm}/"+id,
			     dataType: "json",
			     success: function(result){
						if(result != '0'){
							alert("操作成功");
							jQuery.fancybox.close();
							$('#calendar').fullCalendar( 'refetchEvents');
						}else {
							alert("操作失败");
						}
			           //返回提示信息      
			          // alert(result);
			     }
			 });		
		}
	}
	function delSinGrrc(id){
		if(confirm("您确定要删除日程么？") == true){
			$("#editForm").ajaxSubmit({
			     type: "post",
			     url: "<%=path%>/grrc/delSinGrrc/${sessionScope.CURRENT_USER.yhdm}/"+id,
			     dataType: "json",
			     success: function(result){
						if(result != '0'){
							alert("操作成功");
							jQuery.fancybox.close();
							$('#calendar').fullCalendar( 'refetchEvents');
						}else {
							alert("操作失败");
						}
			           //返回提示信息      
			           //alert(result);
			     }
			 });		
		}
	}
	function addShumitSinGrrc(rcsj){
		if(confirm("您确定要添加日程么？") == true){
			$("#addForm").ajaxSubmit({
			     type: "post",
			     url: "<%=path%>/grrc/addShumitSinGrrc/${sessionScope.CURRENT_USER.yhdm}/"+rcsj,
			     dataType: "json",
			     success: function(result){
						if(result != '0'){
							alert("操作成功");
							jQuery.fancybox.close();
							$('#calendar').fullCalendar( 'refetchEvents');
						}else {
							alert("操作失败");
						}
			           //返回提示信息      
			          // alert(result);
			     }
			 });		
		}
	}	
	
</script>
<style>

	body {
		margin: 0;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 10px;
	}

/* 	#top { */
/* 		background: #eee; */
/* 		border-bottom: 1px solid #ddd; */
/* 		padding: 0 10px; */
/* 		line-height: 40px; */
/* 		font-size: 12px; */
/* 	} */
	/*
	#calendar {
		max-width: 900px;
		margin: 40px auto;
		padding: 0 10px;
	
	}
	*/
	/*
 	.fc-view-container{ 
  	    height: 246.2px;  
 		height: 146.2px; 
 	    overflow-x: hidden; 
 	    overflow-y: scroll;		 
 	} 
 	*/

</style>
<head>
<meta charset="UTF-8">
<title>个人日程</title>
</head>
<body>
<div id='calendar'></div>
</body>
</html>
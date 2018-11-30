<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%>
<%@ taglib prefix="un" uri="JsqUFunction"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<c:if test="${ymcss eq '1' }">
		<jsp:include page="../../include/css-jsq-include-1.jsp"></jsp:include>
		</c:if>
		<c:if test="${ymcss eq '2'}">
		<jsp:include page="../../include/css-jsq-include-2.jsp"></jsp:include>
		</c:if>
		<c:if test="${ymcss eq '3' or empty ymcss }">
		<jsp:include page="../../include/css-jsq-include-3.jsp"></jsp:include>
		</c:if>

		<link rel="stylesheet" href="<%=path%>/resources/js/bootstrapvalidator-master/dist/css/bootstrapValidator.css"/>
		<link rel="stylesheet" href="<%=path%>/resources/js/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css"/>
		<script src="<%=path%>/resources/style/bootstrap/js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
		<script src="<%=path%>/resources/js/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
		<script src="<%=path%>/resources/js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/jquery-easyui-1.5.1/plugins/jquery.parser.js"></script>
		<script src="<%=path%>/resources/js/jquery-easyui-1.5.1/plugins/jquery.resizable.js"></script>
		<link href="<%=path%>/resources/js/ludo-jquery-treetable/css/jquery.treetable.css" rel="stylesheet" type="text/css" />
		<link href="<%=path%>/resources/js/ludo-jquery-treetable/css/jquery.treetable.theme.default.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=path%>/resources/js/ludo-jquery-treetable/jquery.treetable.js"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.cookie.js"></script>
		<!--[if lt IE 9]>
		  <script src="<%=path%>/resources/style/bootstrap/js/html5shiv.min.js"></script>
		  <script src="<%=path%>/resources/style/bootstrap/js/respond.min.js"></script>
		<![endif]-->

		<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
		<style>
		  html, body { height:100%; }
		  .Contentbox { width:100%; min-height:100%;height:auto }
		  *html .Contentbox { height:100% }
		</style>
		<!-- 加载条 -->
		<style>
		    .modal-header {
     background: #ebebeb;
     border-top-left-radius: 6px;
     border-top-right-radius: 6px;
    }
			#loading{
				background-color: #eeeeee;
				filter:alpha(opacity=50);
			    -moz-opacity:0.5;
			    -khtml-opacity: 0.5;
			    opacity: 0.5;
				height: 100%;
				width: 100%;
				position: fixed;
				z-index: 1;
				margin-top: 0px;
				top: 0px;
			}
			#loading-center{
				width: 100%;
				height: 100%;
				position: relative;
				}
			#loading-center-absolute {
				position: absolute;
				left: 50%;
				top: 50%;
				height: 50px;
				width: 150px;
				margin-top: -25px;
				margin-left: -75px;

			}
			.object{
				width: 8px;
				height: 50px;
				margin-right:5px;
				background-color: #45b29d;
				-webkit-animation: animate 1s infinite;
				animation: animate 1s infinite;
				float: left;
			}

			.object:last-child {
				margin-right: 0px;
			}

			.object:nth-child(10){
				-webkit-animation-delay: 0.9s;
			    animation-delay: 0.9s;
			}
			.object:nth-child(9){
				-webkit-animation-delay: 0.8s;
			    animation-delay: 0.8s;
			}
			.object:nth-child(8){
				-webkit-animation-delay: 0.7s;
			    animation-delay: 0.7s;
			}
			.object:nth-child(7){
				-webkit-animation-delay: 0.6s;
			    animation-delay: 0.6s;
			}
			.object:nth-child(6){
				-webkit-animation-delay: 0.5s;
			    animation-delay: 0.5s;
			}
			.object:nth-child(5){
				-webkit-animation-delay: 0.4s;
			    animation-delay: 0.4s;
			}
			.object:nth-child(4){
				-webkit-animation-delay: 0.3s;
			    animation-delay: 0.3s;
			}
			.object:nth-child(3){
				-webkit-animation-delay: 0.2s;
			    animation-delay: 0.2s;
			}
			.object:nth-child(2){
				-webkit-animation-delay: 0.1s;
			    animation-delay: 0.1s;
			}
			@-webkit-keyframes animate {
			  50% {
					-ms-transform: scaleY(0);
					-webkit-transform: scaleY(0);
					transform: scaleY(0);
				  }
			}
			@keyframes animate {
			  50% {
				-ms-transform: scaleY(0);
			   	-webkit-transform: scaleY(0);
			    transform: scaleY(0);
				}
			}
			.selecttrcolor{
			 background:#ffdddd
			}
			.dynamicbtn i{
			  font-size: 1em;
			}
		</style>
		<script>
		  var  ROOT_JSPATH='<%=path%>'
        var resizableObj={
                onStartResize:function(e){
                        $_semp.css({
                            top:'0px',
                            left:'0px',
                              height:'100%',
                              width:'100%'
                            })
                            $(e.target).append($_semp)
                      },
                      onResize:function(e){
                        $_semp.css({
                              height:'100%',
                              width:'100%'
                            })
                             var _height
                             var $_TT
                             if($(e.target).hasClass('.modal-dialog')){
                               $_TT=$(e.target)
                             }else{
                               $_TT=$(e.target).parents('.modal-dialog')
                             }
                         _height = $_TT.height()
                           $_TT.find('iframe').css({
                                height:(_height -100)+'px',
                                width:'100%'
                              })
                           $_TT.find('.modal-content').css({
                                width:'100%',
                                height:'100%'
                              })
//                              $_TT.find('.modal-body').css({
//                                     background:'ffdddd',
//                                 height:(_height -80)+'px',
//                                 width:'100%'
//                              })
                         },
                         onStopResize:function(){
                          $('.temp123456789').remove()
                         }
                    }
		var onModelExecutelocal= function(obj){
			 var result =eval('('+$('#myModalLabel').attr("_data")+')')
			 $.each(result,function(i,o){
				 var _size = $("#addOrUpdfrom").find("[name='"+o.value+"']").size();
				 if(o.value!=''){
					 if(_size==1){
						 $("#addOrUpdfrom").find('[name='+o.value+']').eq(0).val($(obj).find('[name='+o.field+']').eq(0).val());
					 }else {
						$($_target).parents('tr').find('[name='+o.value+']').each(function(i,dom){
							$(dom).val($(obj).find('[name='+o.field+']').eq(0).val());
						})
					 }
				 }
			 })
		}

		function onModelExecuteMorelocal(moreobj){

			 var result =eval('('+$('#myModalLabel').attr("_data")+')')
			 $.each(result,function(i,o){
				 var _size = $("#addOrUpdfrom").find("[name='"+o.value+"']").size();
				 if(o.value!=''){
					 if(_size==1){
						 var _value=''
						 $(moreobj).find('li').each(function(i,obj){
						 _value+=$(obj).find('[name='+o.field+']').eq(0).val()+','
						 })
						 _value=_value.substring(0,_value.length-1)
						 $("#addOrUpdfrom").find('[name='+o.value+']').eq(0).val(_value );
					 }else {
						$($_target).parents('tr').find('[name='+o.value+']').each(function(i,dom){
							 var _value=''
							  $(moreobj).find('li').each(function(i,obj){
						 _value+=$(obj).find('[name='+o.field+']').eq(0).val()+','
						 })
						 _value=_value.substring(0,_value.length-1)
							 $(dom).val(_value);
							// _value=_value+$(obj).find('[name='+o.field+']').eq(0).val()
						  //   $('#datetimeForm').bootstrapValidator('revalidateField', dom);
						})
					 }
				 }
			 })

			 //$("#addOrUpdfrom").data('bootstrapValidator').destroy();
			// $('#addOrUpdfrom').bootstrapValidator();
		}
	  var  onModelExecuteSupper=onModelExecutelocal
	  var  onModelExecuteMoreSupper=onModelExecuteMorelocal
	    var onModelExecute= function(obj){

	    	onModelExecuteSupper(obj)
	     	onModelExecuteSupper=onModelExecutelocal
	    }
	    var onModelExecuteMore= function(obj){

	    	onModelExecuteMoreSupper(obj)
	     	onModelExecuteMoreSupper=onModelExecuteMorelocal
	    }
	    var setparentwin=function(win){
	    	onModelExecuteSupper=win.onModelExecute
	    	onModelExecuteMoreSupper=win.onModelExecuteMore
	    }
	    var parentQueryLike =function(){}


        function setSize(iframe ,id ){

        	var wHeight =(window.innerHeight || (window.document.documentElement.clientHeight || window.document.body.clientHeight));
        	var wWidth = (window.innerWidth || (window.document.documentElement.clientWidth || window.document.body.clientWidth));

        	 var iframe = document.getElementById('tabid_add'+id);
        	 var _width=iframe.contentDocument.body.scrollWidth
 	    	 var  _height=iframe.contentWindow.document.documentElement.scrollHeight//iframe.contentDocument.body.scrollHeight
          	$('#tabid_add'+id).css({
          	    'max-height':(wHeight-180)+'px',
                'max-width':(wWidth-60)+'px',
                'min-width':(1100)+'px',
                'width':(_width)+'px',
                'height':(_height)+'px'
              });
      		$('#onAdd'+id).find('.modal-dialog').animate({
        	 	'width':(_width+30)+'px',
              	'height':(_height+100)+'px',
             	'max-height':(wHeight-80)+'px',
              	'max-width':(wWidth-40)+'px',
             	'min-width':(1140)+'px',
              });
        }
      function setIframeHeight(id){
    	    var wHeight =(window.innerHeight || (window.document.documentElement.clientHeight || window.document.body.clientHeight));
      	    var wWidth = (window.innerWidth || (window.document.documentElement.clientWidth || window.document.body.clientWidth));
    	    var iframe = document.getElementById(id);
            $('#'+id).on('load',function(){

    	    	var _width=iframe.contentDocument.body.scrollWidth
    	    	var  _height=iframe.contentWindow.document.documentElement.scrollHeight//iframe.contentDocument.body.scrollHeight
                $('#'+id).animate({
              	    'max-height':(wHeight-180)+'px',
                    'max-width':(wWidth-60)+'px',
                    'min-width':(1100)+'px',
                    'width':(_width)+'px',
                    'height':(_height)+'px'
                });
                $('#'+id).parents('.modal-dialog').animate({
            	 	'width':(_width+30)+'px',
                  	'height':(_height+100)+'px',
                 	'max-height':(wHeight-80)+'px',
                  	'max-width':(wWidth-30)+'px',
                 	'min-width':(1140)+'px',
               });

    	    })
            return false
      }
      var onAddshow= function(id){
    	  openLoading();

          $('#onAdd'+id).modal('show')
          $('#onAdd'+id).find('.modal-dialog').hide()
          var z_index=0
          $('.modal').each(function(i,dom){
           	 if   (z_index < $(dom).css('z-index') ){

           		 z_index =$(dom).css('z-index')
           	 }

            })
         	$('#onAdd'+id).next().css({
         		"z-index":z_index*1+1*1
         	})
         	console.log("$('#onAdd'+id).next()")
         	console.log($('#onAdd'+id).next())
         	$('#onAdd'+id).css({
         		"z-index":z_index*1+2*1
         	})
          	 var iframe = document.getElementById('tabid_add'+id);
          	    $('#onAdd'+id).on('hide.bs.modal', function () {
          		 $(this).remove()
                })
               if(iframe.attachEvent){
                   return;
               }else{
               	iframe.onload = function(){
               		  $(iframe.contentDocument).find('.bot_line tbody > tr > td').css({
               			  padding:'2px'
               		  })
                            setSize(iframe ,id )
               		     $('#onAdd'+id).on('shown.bs.modal', function (e) {
               		    	  setSize(iframe ,id )
          				 })
                             $('#onAdd'+id).find('.modal-dialog').show()
               		    $('#onAdd'+id).modal('show')

               		 closeLoading();
               	}
               };
           document.getElementById("form"+id).submit();
          	$('#onAdd'+id).find('.modal-dialog').resizable(resizableObj);
          	$('#onAdd'+id).find('.modal-dialog').draggable({handle:'.modal-header'});
           }
		    function closesLoading() {
		        $('#loading').fadeOut('normal', function () {
		            $(this).css('display','none');
		        });
		    }
		    function openLoading() {
		        $('#loading').fadeOut('normal', function () {
		            $(this).css('display','block');
		        });
		    }
		</script>

		<script type="text/javascript">
			/** 拖拽模态框*/
	        var mouseStartPoint = {"left":0,"top":  0};
	        var mouseEndPoint = {"left":0,"top":  0};
	        var mouseDragDown = false;
	        var oldP = {"left":0,"top":  0};
	        var moveTartet ,resizableTartet ;
	        function selecttr(tr,c){

	        	var id=$(tr).attr('data-tt-id')
	        	var pid=$(tr).attr('data-tt-parent-id')

	        	$('tr[data-tt-parent-id='+id+']').each(function(i,dom){
	        		if(c){
	        		$(dom).find('[name=ids]').prop("checked",true);
	        		}else{
	        		$(dom).find('[name=ids]').prop("checked",false);
	        		}

	        		selecttr($(dom),c);
	        	})


	        }
		    function closemodLoading() {
		        $('#modloading').fadeOut('normal', function () {
		            $(this).css('display','none');
		        });
		    }
		    function openmodLoading(bing) {
		    	$(bing).parents('.modal-content').find('.loading').fadeOut('normal', function () {
		            $(this).css('display','block');
		        });
		    }
	        function unselecttr(tr,c){

	        	var id=$(tr).attr('data-tt-id')
	        	var pid=$(tr).attr('data-tt-parent-id')


	        	$('table.table > tbody').find('tr[data-tt-id='+pid+']').each(function(i,dom){
	        		$(dom).find('[name=ids]').prop("checked",false);
	        		unselecttr(dom,false);
	        	})

	        }
	        $(document).ready(function(){

	         	  $('table.table > thead > tr:not(:last) ').each(function(i , trdom){
	                  if($(trdom).find('th').text().replace(/ /g,'')==''){
	                	  $(trdom).remove()
	                  }
	         	      var colspans=1
	        		  $(trdom).find('th').each(function(i , thdom){
		        		  if($(thdom).prev().text()==$(thdom).text() && ($(thdom).text().replace(' ','')!='') && ($(thdom).text()!=null) ){
		        			  colspans++
		        			  $(thdom).attr('colspan',colspans)
		        			  $(thdom).css("text-align","center")
		        			  $(thdom).prev().hide()
		        		  }else{
		        			  colspans=1
		        		  }
	        		  })
	        		  $(trdom).find('th').each(function(i , thdom){
	        		  if( ($(thdom).text().replace(/ /g,'')=='') || ($(thdom).text()==null) ){
	        			  $(thdom).attr('rowspan',2)
	        			  $(thdom).css("text-align","center")
	        			  $(thdom).attr("valign","middle")
	        			  $(thdom).css("vertical-align","middle")
	        			  $(thdom).html($(thdom).parents('tr').next().find('th').eq($(thdom).index()).html())
	        			  $(thdom).parents('tr').next().find('th').eq($(thdom).index()).hide()
	        		  }
	        		  })
	        	  })
	        	$(document).on('change','input[name="ids"] ',function(){
	        		var $tr=$(this).parents('tr')
	        		unselecttr($tr,false)
	        		selecttr($tr,$(this).is(':checked'))
	        	})
	        	if ($('.butsea').find('input:not(:hidden),textarea,select,button').size()==0){
	        		$('.butsea').hide()
	        	 }
	        	$(document).on('click','table.table > tbody > tr ',function(){
	        		$('.selecttrcolor').removeClass('selecttrcolor')
	        		$(this).find('td').addClass('selecttrcolor')
// 	        		if (window.name!=""){
// 	        	    var targets= eval('('+$(window.parent.document).find('[name='+window.name+']').eq(0).parents('[iframesrc]').attr('targets') +')' )
// 	        	    window.parent.openiframe(targets,$(this).find('[name]').clone())
// 	        		}
	        	})


	             if (window != window.parent ){
	            	 if (window.parent.closemodLoading)
	            	 window.parent.closemodLoading()
	           	    $(window.frameElement).parents('.modal-content').find('.loading').fadeOut('normal', function () {
			            $(this).css('display','none');
			        });
	             }else{

	             }


	        	var $_semp=$("<div class='temp123456789'></div>")
				 $_semp.css({
					 'position':'absolute',
					 'background':'#ffffdd',
					 'z-index':'9999999',
					 'filter':'alpha(Opacity=80)',
				     '-moz-opacity':'0.5',
				     'opacity': '0.5'
				 })

				 $('.modal-content').resizable( resizableObj );
				 $('.modal-content').draggable({handle:'.modal-header'});
	        });
			/**
			 * 下载文件
			 * @param filename  显示文件名
			 * @param inputPath 路径
			 */
			function  downfile(filename,inputPath){
			    // 创建Input
			    var filename_input = $('<input type="hidden" name="filename" />');
			    filename_input.attr('value', filename);
			    var inputPath_input = $('<input type="hidden" name="inputPath" />');
			    inputPath_input.attr('value', inputPath);
				$('#iframeForm').html('');
				$('#iframeForm').append(filename_input);
				$('#iframeForm').append(inputPath_input);
				document.getElementById("iframeForm").action = '<%=path%>/upload/downFile';
				document.getElementById("iframeForm").submit();
			}
			//模糊查询
			var closeiframeForm =function(){
			   $('#onAdd').modal('hide')
			}
			function queryLike(){
				openLoading();
				document.queryform.action="<%=path%>/Jsqlquery/htmlSelectCodeEngine/${zxxb_id}";
				document.queryform.submit();
			}
			//排序
			function queryLikeOrder(v,o){
				openLoading();
				$('#TABLE_COL_QF_ORDER_'+v).val(o);
				var formValue = new Array();
				$("#_ORDER_DIV").find('input').each(function(i,dom){
					var value = $(dom).val();
					if(value != null && value!=''){
						var tc = $(dom).attr('_name');
						formValue.push(tc+' ' + value);
					}
				})
				$('#TABLE_COL_QF_ORDER').val(formValue);
				jump('${page.pageNo}');

			}
			//批量导出
			function onBatchExpdata(){
				openLoading();
				document.queryform.action="<%=path%>/Jsqlquery/htmlSelectCodeBatchExpdataEngine?zxxb_id=${zxxb_id}";
				document.queryform.submit();
				closesLoading();
			}

			function onAdd(sjdjdz,anmc,gnid){
				$('#iframeForm').html('');
				$("#queryform").find('input').each(function(i,dom){
					var input = $('<input type="hidden" />');
					input.attr('value', $(dom).val());
					input.attr('name', $(dom).attr('name'));
					$('#iframeForm').append(input);
				})
				var sqltype_input = $('<input type="hidden" name="sqltype" />');
				sqltype_input.attr('value', 'insert');

				var gnid_input = $('<input type="hidden" name="gnid" />');
				gnid_input.attr('value', gnid);

				var tablename_input = $('<input type="hidden" name="tablename" />');
				tablename_input.attr('value', 'jsq_sql_ymgn');
				var src = "<%=path%>/"+sjdjdz;
				$('#iframeForm').append(sqltype_input);
				$('#iframeForm').append(gnid_input);
				$('#iframeForm').append(tablename_input);
				document.getElementById("iframeForm").action = src;
				var win=window
				var parentOpen=false
				while(win!=window.parent && window.parent.onAddshow && typeof(window.parent.onAddshow) == "function"){

				    if(window.parent.onAddshow==undefined){
				    	break;
				    }
					win=window.parent
					parentOpen=true
				}
				if(parentOpen==false){
					 document.getElementById("iframeForm").target="tabid_add_${zxxb_id}"; //当点击查询按钮才处理时间
	  				 document.getElementById("iframeForm").submit();
					 $('#myModalLabel').html(anmc);
					 window.parentQueryLike=queryLike
					 setIframeHeight("tabid_add_${zxxb_id}");
					 $('#onAdd').modal('show')
				}else{
					 var rid = Math.floor(Math.random()*(100)+1);
					 $('#myModalLabel').html(anmc);
					 var $modalwin= $('#onAdd').clone();
					 document.getElementById("iframeForm").target="tabid_add"+rid; //当点击查询按钮才处理时间
					 $modalwin.attr('id','onAdd'+rid)
					 $modalwin.find('iframe').attr('name',"tabid_add"+rid)
					 $modalwin.find('iframe').attr('id',"tabid_add"+rid)
					 $(win.document).find('#iframeForm').remove()
					 var $nform= $('#iframeForm').clone()
					 $nform.attr('id','form'+rid)
					 $nform.clone().appendTo($(win.document).find('body'));
					 $modalwin.appendTo($(win.document).find('body'));
					 win.parentQueryLike=queryLike
					 $nform.clone().appendTo($(win.document).find('body'));
					 window.parent.onAddshow(rid);
				}

			}
			function onUpd(obj,sjdjdz,anmc,gnid){
				$('#iframeForm').html('');
				$("#queryform").find('input').each(function(i,dom){
					var input = $('<input type="hidden" />');
					input.attr('value', $(dom).val());
					input.attr('name', $(dom).attr('name'));
					$('#iframeForm').append(input);
				})
				var sqltype_input = $('<input type="hidden" name="sqltype" />');
				sqltype_input.attr('value', 'update');
				var gnid_input = $('<input type="hidden" name="gnid" />');
				gnid_input.attr('value', gnid);

				var tablename_input = $('<input type="hidden" name="tablename" />');
				tablename_input.attr('value', 'jsq_sql_lbgn');

				$('#iframeForm').append(sqltype_input);
				$('#iframeForm').append(gnid_input);
				$('#iframeForm').append(tablename_input);
				var src = "<%=path%>/"+sjdjdz;
				$(obj).parents('tr').find('input').each(function(i,dom){
					var input = $('<input type="hidden" />');
					input.attr('value', $(dom).attr('value'));
					input.attr('name', $(dom).attr('name'));
					$('#iframeForm').append(input);
				})

				document.getElementById("iframeForm").action = src;
				var win=window
				var parentOpen=false

				while(win!=window.parent && window.parent.onAddshow && typeof(window.parent.onAddshow) == "function"){

				 if(window.parent.onAddshow==undefined){
				    	break;
				 }
					win=window.parent
					parentOpen=true
				}
				if(parentOpen==false){
					 document.getElementById("iframeForm").target="tabid_add_${zxxb_id}"; //当点击查询按钮才处理时间
	  				 document.getElementById("iframeForm").submit();
					 $('#myModalLabel').html(anmc);
					 window.parentQueryLike=queryLike
					 setIframeHeight("tabid_add_${zxxb_id}");
					 $('#onAdd').modal('show')
				}else{
					 var rid = Math.floor(Math.random()*(100)+1);
					 $('#myModalLabel').html(anmc);
					 var $modalwin= $('#onAdd').clone();
					 document.getElementById("iframeForm").target="tabid_add"+rid; //当点击查询按钮才处理时间
					 $modalwin.attr('id','onAdd'+rid)
					 $modalwin.find('iframe').attr('name',"tabid_add"+rid)
					 $modalwin.find('iframe').attr('id',"tabid_add"+rid)
					 $(win.document).find('#iframeForm').remove()
					 var $nform= $('#iframeForm').clone()
					 $nform.attr('id','form'+rid)
					 $nform.clone().appendTo($(win.document).find('body'));
					 $modalwin.appendTo($(win.document).find('body'));
					 win.parentQueryLike=queryLike
					 $nform.clone().appendTo($(win.document).find('body'));
					 window.parent.onAddshow(rid);
				}
			}
			function onDetail(obj,sjdjdz,anmc,gnid){
				var sqltype_input = $('<input type="hidden" name="sqltype" />');
				sqltype_input.attr('value', 'update');
				var gnid_input = $('<input type="hidden" name="gnid" />');
				gnid_input.attr('value', gnid);

				var tablename_input = $('<input type="hidden" name="tablename" />');
				tablename_input.attr('value', 'jsq_sql_lbgn');

				$('#iframeForm').html('');
				$('#iframeForm').append(sqltype_input);
				$('#iframeForm').append('<input type="hidden" name="sfbcan" value="0"/>');
				$('#iframeForm').append(gnid_input);
				$('#iframeForm').append(tablename_input);
				var src = "<%=path%>/"+sjdjdz;
				$(obj).parents('tr').find('input').each(function(i,dom){
					var input = $('<input type="hidden" />');
					input.attr('value', $(dom).attr('value'));
					input.attr('name', $(dom).attr('name'));
					$('#iframeForm').append(input);
				})
				var win=window
				var parentOpen=false

				while(win!=window.parent && window.parent.onAddshow && typeof(window.parent.onAddshow) == "function"){

				 if(window.parent.onAddshow==undefined){
				    	break;
				 }
					win=window.parent
					parentOpen=true
				}
				document.getElementById("iframeForm").action = src;
				if(parentOpen==false){
					 document.getElementById("iframeForm").target="tabid_add_${zxxb_id}"; //当点击查询按钮才处理时间
	  				 document.getElementById("iframeForm").submit();
					 $('#myModalLabel').html(anmc);
					 window.parentQueryLike=queryLike
					 setIframeHeight("tabid_add_${zxxb_id}");
					 $('#onAdd').modal('show')
				}else{
					 var rid = Math.floor(Math.random()*(100)+1);
					 $('#myModalLabel').html(anmc);
					 var $modalwin= $('#onAdd').clone();
					 document.getElementById("iframeForm").target="tabid_add"+rid; //当点击查询按钮才处理时间
					 $modalwin.attr('id','onAdd'+rid)
					 $modalwin.find('iframe').attr('name',"tabid_add"+rid)
					 $modalwin.find('iframe').attr('id',"tabid_add"+rid)
					 $(win.document).find('#iframeForm').remove()
					 var $nform= $('#iframeForm').clone()
					 $nform.attr('id','form'+rid)
					 $nform.clone().appendTo($(win.document).find('body'));
					 $modalwin.appendTo($(win.document).find('body'));
					 win.parentQueryLike=queryLike
					 $nform.clone().appendTo($(win.document).find('body'));
					 window.parent.onAddshow(rid);
				}

			}
			//详情并操作
			function onDetailToEx(obj,sjdjdz,anmc,gnid){
				var sqltype_input = $('<input type="hidden" name="sqltype" />');
				sqltype_input.attr('value', 'update');
				var gnid_input = $('<input type="hidden" name="gnid" />');
				gnid_input.attr('value', gnid);

				var tablename_input = $('<input type="hidden" name="tablename" />');
				tablename_input.attr('value', 'jsq_sql_lbgn');

				$('#iframeForm').html('');
				$('#iframeForm').append(sqltype_input);
				$('#iframeForm').append('<input type="hidden" name="sfbcan" value="0"/>');
				$('#iframeForm').append(gnid_input);
				$('#iframeForm').append(tablename_input);
				var src = "<%=path%>/"+sjdjdz;
				$(obj).parents('tr').find('input').each(function(i,dom){
					var input = $('<input type="hidden" />');
					input.attr('value', $(dom).attr('value'));
					input.attr('name', $(dom).attr('name'));
					$('#iframeForm').append(input);
				})
				var win=window
				var parentOpen=false

				while(win!=window.parent && window.parent.onAddshow && typeof(window.parent.onAddshow) == "function"){

				 if(window.parent.onAddshow==undefined){
				    	break;
				 }
					win=window.parent
					parentOpen=true
				}
				document.getElementById("iframeForm").action = src;
				if(parentOpen==false){
					 document.getElementById("iframeForm").target="tabid_add_${zxxb_id}"; //当点击查询按钮才处理时间
	  				 document.getElementById("iframeForm").submit();
					 $('#myModalLabel').html(anmc);
					 window.parentQueryLike=queryLike
					 setIframeHeight("tabid_add_${zxxb_id}");
					 $('#onAdd').modal('show')
				}else{
					 var rid = Math.floor(Math.random()*(100)+1);
					 $('#myModalLabel').html(anmc);
					 var $modalwin= $('#onAdd').clone();
					 document.getElementById("iframeForm").target="tabid_add"+rid; //当点击查询按钮才处理时间
					 $modalwin.attr('id','onAdd'+rid)
					 $modalwin.find('iframe').attr('name',"tabid_add"+rid)
					 $modalwin.find('iframe').attr('id',"tabid_add"+rid)
					 $(win.document).find('#iframeForm').remove()
					 var $nform= $('#iframeForm').clone()
					 $nform.attr('id','form'+rid)
					 $nform.clone().appendTo($(win.document).find('body'));
					 $modalwin.appendTo($(win.document).find('body'));
					 win.parentQueryLike=queryLike
					 $nform.clone().appendTo($(win.document).find('body'));
					 window.parent.onAddshow(rid);
				}

			}			
			  //审核
		      function onSh(obj,sjdjdz,anmc,gnid){
		          var sqltype_input = $('<input type="hidden" name="sqltype" />');
		          sqltype_input.attr('value', 'update');
		          var gnid_input = $('<input type="hidden" name="gnid" />');
		          gnid_input.attr('value', gnid);

		          var tablename_input = $('<input type="hidden" name="tablename" />');
		          tablename_input.attr('value', 'jsq_sql_lbgn');

		          $('#iframeForm').html('');
		          $('#iframeForm').append(sqltype_input);
		          $('#iframeForm').append('<input type="hidden" name="sfbcan" value="0"/>');
		          $('#iframeForm').append(gnid_input);
		          $('#iframeForm').append(tablename_input);
		          var src = "<%=path%>/"+sjdjdz;
		          $(obj).parents('tr').find('input').each(function(i,dom){
		            var input = $('<input type="hidden" />');
		            input.attr('value', $(dom).attr('value'));
		            input.attr('name', $(dom).attr('name'));
		            $('#iframeForm').append(input);
		          })
		          var win=window
		          var parentOpen=false

		          while(win!=window.parent && window.parent.onAddshow && typeof(window.parent.onAddshow) == "function"){

		           if(window.parent.onAddshow==undefined){
		                break;
		           }
		            win=window.parent
		            parentOpen=true
		          }
		          document.getElementById("iframeForm").action = src;
		          if(parentOpen==false){
		             document.getElementById("iframeForm").target="tabid_add_${zxxb_id}"; //当点击查询按钮才处理时间
		               document.getElementById("iframeForm").submit();
		             $('#myModalLabel').html(anmc);
		             window.parentQueryLike=queryLike
		             setIframeHeight("tabid_add_${zxxb_id}");
		             $('#onAdd').modal('show')
		          }else{
		             var rid = Math.floor(Math.random()*(100)+1);
		             $('#myModalLabel').html(anmc);
		             var $modalwin= $('#onAdd').clone();
		             document.getElementById("iframeForm").target="tabid_add"+rid; //当点击查询按钮才处理时间
		             $modalwin.attr('id','onAdd'+rid)
		             $modalwin.find('iframe').attr('name',"tabid_add"+rid)
		             $modalwin.find('iframe').attr('id',"tabid_add"+rid)
		             $(win.document).find('#iframeForm').remove()
		             var $nform= $('#iframeForm').clone()
		             $nform.attr('id','form'+rid)
		             $nform.clone().appendTo($(win.document).find('body'));
		             $modalwin.appendTo($(win.document).find('body'));
		             win.parentQueryLike=queryLike
		             $nform.clone().appendTo($(win.document).find('body'));
		             window.parent.onAddshow(rid);
		          }

		        }

			function onModelOpen(target ,anmc,sjdjdz){

				$_target = $(target);
				var src = "<%=path%>/Jsqlquery/htmlSelectCodeEngine/"+sjdjdz;
				$('#tabid_add').attr('src',src);
				$('#myModalLabel').html(anmc);
				$('#myModalLabel').attr("_data",$(target).attr("_data"));
				setIframeHeight("tabid_add_${zxxb_id}");

				var win=window
				var parentOpen=false
				while(win!=window.parent){
					win=window.parent
					parentOpen=true
				}

				 if(parentOpen==false){
					 $('#onAdd').modal('show')
					 }else{
					 document.getElementById("iframeForm").target="tabid_add_parent"; //当点击查询按钮才处理时间
					 var $modalwin= $('#onAdd').clone();
					 $modalwin.appendTo($(win.document).find('body'));
					 $('#iframeForm').clone().appendTo($(win.document).find('body'));
					 $modalwin.modal('show')

					 }

			}
		      function onModel(obj,sjdjdz,anmc,gnid){
		      	if($(obj).is('UL')){
		      		$(obj).find('LI').each(function(i,LIdom){

		      	        $(LIdom).each(function(i,dom){
		      	            var input = $('<input type="hidden" />');
		      	            input.attr('value', $(dom).attr('value'));
		      	            input.attr('name', $(dom).attr('name'));
		      	            $(dom).after(input);
		      	            $(dom).remove();
		      	          })
		      	            $('#iframeForm').append(LIdom);
		      		})
		           parent.onModelExecuteMore($('#iframeForm'));
		          $(window.frameElement).parents('.modal').find('.close').trigger('click')


		      	}else{
		          $('#iframeForm').html('');
		          $(obj).parents('tr').find('input').each(function(i,dom){
		            var input = $('<input type="hidden" />');
		            input.attr('value', $(dom).attr('value'));
		            input.attr('name', $(dom).attr('name'));
		            $('#iframeForm').append(input);
		          })
		          parent.onModelExecute($('#iframeForm'));
		          $(window.frameElement).parents('.modal').find('.close').trigger('click')
		      	}
		        }

			function onDel(obj,gnid){
				var randomNu = (new Date().getTime()) ^ Math.random();//解决IE缓存问题
				var sqltype_input = $('<input type="hidden" name="_sqltype" />');
				sqltype_input.attr('value', 'delete');
				var zxxb_id_input = $('<input type="hidden" name="_zxxb_id" />');
				zxxb_id_input.attr('value', '${zxxb_id}');

				var gnid_input = $('<input type="hidden" name="_gnid" />');
				gnid_input.attr('value', gnid);

				var tablename_input = $('<input type="hidden" name="_tablename" />');
				tablename_input.attr('value', 'jsq_sql_lbgn');

				$('#iframeForm').html('');
				$('#iframeForm').append(sqltype_input);
				$('#iframeForm').append(zxxb_id_input);
				$('#iframeForm').append(gnid_input);
				$('#iframeForm').append(tablename_input);

				$(obj).parents('tr').find('input').each(function(i,dom){
					var input = $('<input type="hidden" />');
					input.attr('value', $(dom).attr('value'));
					input.attr('name', $(dom).attr('name'));
					$('#iframeForm').append(input);
				});
				var url = '<%=path%>/Jsqlquery/ExecuteDynamicSQL?_'+randomNu;
				if(confirm("您确定要执行操作么吗？") == true){
	 	        	$('#loading-mess-message').html("提交中，请稍候");
	 	        	$('#myModal').modal('show');
		    		$.ajax({
			 	        traditional:true,//这使json格式的字符不会被转码
			 	        type: "POST",
			            dataType:"json",
			            data:$('#iframeForm').serialize(),// 要提交的表单
			 	     	url:url,
			 	        success : function (data) {
			 	        	//$('#loading-mess-message').html(data.message);
			 	        	alert(data.message);
			 	        	queryLike();
			 	        },
			 	        error : function (data){
			 	        	$('#loading-mess-message').html(data.responseText);
			 	        }
		 	    	});
				}
			}
			function onBatchDel(gnid){
				var tms = 0;
				var sqltype_input = $('<input type="hidden" name="_sqltype" />');
				sqltype_input.attr('value', 'delete');
				var zxxb_id_input = $('<input type="hidden" name="_zxxb_id" />');
				zxxb_id_input.attr('value', '${zxxb_id}');

				var gnid_input = $('<input type="hidden" name="_gnid" />');
				gnid_input.attr('value', gnid);

				var tablename_input = $('<input type="hidden" name="_tablename" />');
				tablename_input.attr('value', 'jsq_sql_ymgn');

				$('#iframeForm').html('');
				$('#iframeForm').append(sqltype_input);
				$('#iframeForm').append(zxxb_id_input);
				$('#iframeForm').append(gnid_input);
				$('#iframeForm').append(tablename_input);
				var randomNu = (new Date().getTime()) ^ Math.random();//解决IE缓存问题
				var url = '<%=path%>/Jsqlquery/ExecuteDynamicSQL?_'+randomNu;
				if(isCheck('ids') == false){
					alert("请选择要删除的信息");
				    return;
				}else{
			   		if(confirm('您确认要删除选中信息吗?')){
		 	        	$('#loading-mess-message').html("提交中，请稍候");
		 	        	$('#myModal').modal('show');
			   			$('input[name="ids"]:checked').each(function(){
			   				$(this).parents('tr').find('input').each(function(i,dom){
								var input = $('<input type="hidden" />');
								input.attr('value', $(dom).attr('value'));
								input.attr('name', $(dom).attr('name'));
								$('#iframeForm').append(input);
							})
							tms++;
			   			});
						var tms_input = $('<input type="hidden" name="tms" />');
						tms_input.attr('value', tms);
						$('#iframeForm').append(tms_input);
			    		$.ajax({
				 	        traditional:true,//这使json格式的字符不会被转码
				 	        type: "POST",
				            dataType:"json",
				            data:$('#iframeForm').serialize(),// 要提交的表单
				 	     	url:url,
				 	        success : function (data) {
				 	        	$('#loading-mess-message').html(data.message);
				 	        	queryLike();
				 	        },
				 	        error : function (data){
				 	        	$('#loading-mess-message').html(data.responseText);
				 	        }
			 	    	});
			       	}
			    }
			}
			function onBatchUpd(gnid){
				var tms = 0;
				var sqltype_input = $('<input type="hidden" name="_sqltype" />');
				sqltype_input.attr('value', 'update');
				var zxxb_id_input = $('<input type="hidden" name="_zxxb_id" />');
				zxxb_id_input.attr('value', '${zxxb_id}');

				var gnid_input = $('<input type="hidden" name="_gnid" />');
				gnid_input.attr('value', gnid);

				var tablename_input = $('<input type="hidden" name="_tablename" />');
				tablename_input.attr('value', 'jsq_sql_ymgn');
				var _ON_BATCH_UPD_input = $('<input type="hidden" name="_ON_BATCH_UPD" />');
				_ON_BATCH_UPD_input.attr('value', '_ON_BATCH_UPD');


				$('#iframeForm').html('');
				$('#iframeForm').append(sqltype_input);
				$('#iframeForm').append(zxxb_id_input);
				$('#iframeForm').append(gnid_input);
				$('#iframeForm').append(tablename_input);
				$('#iframeForm').append(_ON_BATCH_UPD_input);
				var randomNu = (new Date().getTime()) ^ Math.random();//解决IE缓存问题
				var url = '<%=path%>/Jsqlquery/ExecuteDynamicSQL?_'+randomNu;
				if(Validator.Validate(document.getElementById('addOrUpdfrom'),3) ){
			   		if(confirm('您确认要更新选中信息吗?')){
		 	        	$('#loading-mess-message').html("提交中，请稍候");
		 	        	$('#myModal').modal('show');
	 	        		$('#addOrUpdfrom').find("input,select,textarea").each(function(i,dom){
							var input = $('<input type="hidden" />');
							input.attr('value', $(dom).val());
							input.attr('name', $(dom).attr('name'));
							$('#iframeForm').append(input);
						})

						var tms_input = $('<input type="hidden" name="tms" />');
						tms_input.attr('value', tms);
						$('#iframeForm').append(tms_input);
			    		$.ajax({
				 	        traditional:true,//这使json格式的字符不会被转码
				 	        type: "POST",
				            dataType:"json",
				            data:$('#iframeForm').serialize(),// 要提交的表单
				 	     	url:url,
				 	        success : function (data) {
				 	        	$('#loading-mess-message').html(data.message);
				 	        	queryLike();
				 	        },
				 	        error : function (data){
				 	        	$('#loading-mess-message').html(data.responseText);
				 	        }
			 	    	});
			       	}

				}
			}

			$(document).ready(function(){
				  $('.modal').on('hidden.bs.modal', function (e) {
			    	     $(this).find('.seled').html('');
			      })

				 $("table.table").treetable({
			            expandable : true
			     });
				 var data_tt_id=$.cookie('tree_data_tt_id')

				 if(data_tt_id!='' && data_tt_id!=undefined){
				  $('table.table').treetable('expandNode',data_tt_id)
				 }
				 $.cookie('tree_data_tt_id', '');
				 if (window.name!='' && window.name!=undefined ){

				 var $itemResult=$(window.parent.document).find('.list-group-item[name='+window.name+']')
// 				 if ($itemResult.size()>0){
// 					 if($('.cls_cz').size()==0){
// 					 $('table.table > thead > tr').append('<th>操作</th>')
// 					 $('table.table > tbody > tr').append('<td></td>')
// 					 }
// 				 }

				 $(window.parent.document).find('.list-group-item[name='+window.name+']').each(function(i,dom){

						if( eval('('+$(dom).attr('usewindow')+')')==undefined ||
						    eval('('+$(dom).attr('usewindow')+')').length==0 ||
						    eval('('+$(dom).attr('usewindow')+')').indexOf('${zxxb_id}')>=0) {
							 if($('.butsea').find('input:not(:hidden),textarea,select').size()==0){
								    $('.butsea').hide()
								 }
						 var _data=eval('('+$(dom).attr("_data")+')')
						 	$('table.table > tbody > tr').each(function(i,dd){
								 if(_data.tjdm==null || _data.tjdm==''){

									 _data.tjdm="true"
								 }

								 if( eval('('+_data.tjdm+')')  ){

									 $(dd).addClass('isAddEvent')
								 }else{
									 $(dd).removeClass('isAddEvent')
								 }

							 })
						 if(_data.eventsource=='button'){
							 if ($itemResult.size()>0){
		    					 if($('.cls_cz').size()==0){
		    					 $('table.table > thead > tr').append('<th class="cls_cz">操作</th>')
		    					 $('table.table > tbody > tr').append('<td></td>')
		    					 }
		    				 }

							 var $_button=$(dom).find('.dynamicbtn').clone();

							 $_button.appendTo('table.table > tbody > tr.isAddEvent >:nth-last-child(1)')
							 .on('click',function(){
								 $('[data-toggle=tooltip]').tooltip('hide' )
								 window.parent.openiframe(window,$(this).parents('tr').find('input,select,textarea').clone(),_data )
							 })
						 }else{

							 $('table.table > tbody > tr.isAddEvent ').on('click',function(){

								 window.parent.openiframe(window,$(this).find('input,select,textarea').clone(),_data )
							 })

						 }
						}
					 })
			 }
				//$('#addOrUpdfrom').bootstrapValidator();
				$("#addOrUpdfrom").baigoCheckall();
				$('mytag').each(function(i,dom){
			    	  var label=$(dom).attr('label')
			    	  var _yz = $(dom).attr("_yz");
			    	  var otherparam = $(dom).attr("otherparam");
			    	  var $newDom=$("<div style='float:left;width:100%;'><select "+_yz+" class='form-control' tablename='"+$(dom).attr("tablename")+"' sxdm='"+$(dom).attr("sxdm")+"' sxmc='"+$(dom).attr("sxmc")+"'  csm='"+$(dom).attr("csm")+"' id='"+$(dom).attr("id")+"' name='"+$(dom).attr("_name")+"'></select></div>")
		    	      if ($(dom).attr("ldmb")!=undefined && $(dom).attr("ldmb")!=''){
			    	        $newDom.find('select').attr('ldmb',$(dom).attr("ldmb"));
			    	        $newDom.find('select').attr('otherparam',$(dom).attr("otherparam"));
			    	  }
		    	      if ($(dom).attr("item")!=undefined && $(dom).attr("item")!=''){
		    	    	    var item=$(dom).attr('item');
		    	    	  	var array=new Array()
			    		  	array=item.split(',')
							$.each(array,function(i,k){
								 var op=k.split(':')
								 var $_options=$('<option value="'+op[1]+'" '+($(dom).attr('_value')==op[1]?"selected":"")+'> '+op[0]+'</option>')
					  	         $newDom.find('select').append($_options)
							})
			    	  }else {
				    	  var param={
					  	        	tablename:$(dom).attr("tablename"),
					  	        	sxmc:$(dom).attr("sxmc"),
					  	        	sxdm:$(dom).attr("sxdm"),
					  	        	zxxb_id:$(dom).attr("zxxb_id"),
					  	        	csm:'',
						  	        csz:''
					  	  }
				    	  if($('select[ldmb='+$(dom).attr("id")+']').size()>0){
				    		  $('select[ldmb='+$(dom).attr("id")+']').each(function(i,doms){
				    			  param.csm+=$(doms).attr("csm")+","
				    			  param.csz+=$(doms).val()+","
				    			  param[$(doms).attr("csm")]=$(doms).val()
				    		    })
				    	  }
				    	  $.ajax({
					  	        dataType: "json",
					  	        type: "POST",
					  	        async: false,
					  	        data: param,
					  	        url: '<%=path%>/Jsqlquery/queryCombobox',
					  	        success : function (data) {
					  	        	$newDom.find('select').append('<option value="">--请选择--</option>');
					  	        	 $.each(data,function(i,o){
					  	              var $_options=$('<option value="'+o[$(dom).attr('sxdm')]+'" '+($(dom).attr('_value')==o[$(dom).attr('sxdm')]?"selected":"")+'> '+o[$(dom).attr('sxmc')]+'</option>')
					  	                  $newDom.find('select').append($_options)
					  	        	  })
					  	        }
					       });
			    	  }


			    	  if($(dom).attr('ldmb')!=undefined && $(dom).attr('ldmb')!=''){
			    		  $newDom.find('select[ldmb]').on('change',function( ){
			    			  var _otherparam=$(this).attr('otherparam')
			    			  var $_target=$('#'+$(dom).attr('ldmb'))
				    		  var data={
					  	        	tablename:$_target.attr("tablename"),
					  	        	sxmc:$_target.attr("sxmc"),
					  	        	sxdm:$_target.attr("sxdm"),
					  	        	zxxb_id:$(dom).attr("zxxb_id"),
					  	        	csm:$(dom).attr("csm"),
					  	        	csz: $newDom.find('select').val()
					  	      }
			    			  if(_otherparam!=undefined && _otherparam!=''){
			    			  	var params  =""

			    			  	var paramArray=_otherparam.split(',')
			    			  	$.each(paramArray,function(i,v){
			    					var obj = v.split(':')
			    				    params+=obj[0]+","
			    				    data['csz']+=","+$('#'+obj[1]).val()
			    				    data[obj[0]]=$('#'+obj[1]).val()
			    			     })
			    			     data.csm=params+$(dom).attr("csm")
			    			  }
			    			  data[$(dom).attr("csm")]=$newDom.find('select').val()
			    			  $_target.html('')
				   		      $.ajax({
						  	        dataType: "json",
						  	        type: "POST",
						  	        data:data,
						  	        url: '<%=path%>/Jsqlquery/queryCombobox',
						  	        success : function (data) {
						  	        	 $_target.append('<option value="">--请选择--</option>');
						  	        	 $.each(data,function(i,o){
						  	              var $_options=$('<option value="'+o[$_target.attr('sxdm')]+'"> '+o[$_target.attr('sxmc')]+'</option>')
						  	                  $_target.append($_options)
						  	        	  })
						  	        }
						       });
			    		  })
			    	  }

			    	  $(dom).replaceWith($newDom);
			     });
		        $('.form_datetime').datetimepicker({
		            language:'zh-CN',
		            weekStart: 1,
		            todayBtn:  1,
		    		autoclose: 1,
		    		todayHighlight: 1,
		    		startView: 2,
		    		forceParse: 0,
		            showMeridian: 1
		        });
		        $('.form_yearyear').datetimepicker({
		            format: 'yyyy',
		             weekStart: 1,
		             autoclose: true,
		             startView: 4,
		             minView: 4,
		             forceParse: false,
		             language: 'zh-CN'
		        })
		    	$('.form_date').datetimepicker({
		    		language:'zh-CN',
		            weekStart: 1,
		            todayBtn:  1,
		    		autoclose: 1,
		    		todayHighlight: 1,
		    		startView: 2,
		    		minView: 2,
		    		forceParse: 0
		        });
		    	$('.form_time').datetimepicker({
		    		language:'zh-CN',
		            weekStart: 1,
		            todayBtn:  1,
		    		autoclose: 1,
		    		todayHighlight: 1,
		    		startView: 1,
		    		minView: 0,
		    		maxView: 1,
		    		forceParse: 0
		        });
			})

			var treetable_expandNode = function (id){

				$('table.table').treetable('expandNode',id)
			}
		</script>
	</head>
<body onload="closesLoading();">
<!-- 加载条 -->
<div id="loading">
	<div id="loading-center">
		<div id="loading-center-absolute">
		<div class="object"></div>
		<div class="object"></div>
		<div class="object"></div>
		<div class="object"></div>
		<div class="object"></div>
		<div class="object"></div>
		<div class="object"></div>
		<div class="object"></div>
		<div class="object"></div>
		<div class="object"></div>
		</div>
	</div>
</div>

<form id="iframeForm" method="post"></form>
<div class="Contentbox">
 <div class="mainbg"></div>
  <div class="pd10">

   	  <c:if test="${!empty QXB.FQXMC}">
   	  <div class="question" title="帮助" onclick="javascript:cha('${QXB.QXDM}');">
   	  <span class="glyphicon glyphicon-question-sign"></span>
   	  </div>
      <div class="address">
       <ol class="breadcrumb  ">
          <li> <span class="glyphicon glyphicon-home pull-left"></span> </li>
		  <li>当前位置：</li>
		  <li><a href="#">${QXB.FQXMC}</a></li>
		  <li class="active">${QXB.QXMC}</li>
		</ol>
      </div>
      </c:if>
    <div class="clr"></div>
    <div class="butsea">
      <div class="pull-left Pct35">
            <c:forEach items="${ymgns}" var="ymgn">
            	<c:if test="${ymgn.djsj eq 'onAdd'}">
            		<button type="button" class="btn btn-info" onclick="onAdd('${ymgn.djsjdz}','${ymgn.anmc}','${ymgn.id}');">${ymgn.anmc}</button>
            	</c:if>
            	<c:if test="${ymgn.djsj eq 'onBatchDel'}">
            		<button type="button" class="btn btn-info" onclick="onBatchDel('${ymgn.id}');">${ymgn.anmc}</button>
            	</c:if>
            	<c:if test="${ymgn.djsj eq 'onBatchUpd'}">
            		<button type="button" class="btn btn-info" onclick="onBatchUpd('${ymgn.id}');">${ymgn.anmc}</button>
            	</c:if>
            	<c:if test="${ymgn.djsj eq 'onBatchExpdata'}">
            		<button type="button" class="btn btn-info" onclick="onBatchExpdata();">${ymgn.anmc}</button>
            	</c:if>
            </c:forEach>
      </div>
	 <div class="dropdown pull-right">
       <form name="queryform" method="post" id="queryform">
		<!-- 排序 -->
		<div id="_ORDER_DIV" style="display:none">
		<c:forEach items="${th}" var="t" varStatus="i">
			<c:choose>
				<c:when test="${t.html_lx eq 'hidden'}"></c:when>
				<c:otherwise>
				<c:if test="${t.sfyxpx eq '1'}">
				<c:set value="TABLE_COL_QF_ORDER_${t.bm}_${t.col}" var="_ORDER_KEY_VALUE"></c:set>
				<input type="hidden" id="TABLE_COL_QF_ORDER_${t.bm}_${t.col}" _name="${t.bm}_${t.col}" name="TABLE_COL_QF_ORDER_${t.bm}_${t.col}" value="${queryMap[_ORDER_KEY_VALUE]}" width="500px;"/>
				</c:if>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		</div>
		<input type="hidden" id="TREE_PID" name="TREE_PID" value="${tree_pid}">
		<input type="hidden" id="TABLE_COL_QF_ORDER" name="TABLE_COL_QF_ORDER" value="${queryMap['TABLE_COL_QF_ORDER']}" width="500px;"/>
		<!-- 排序 -->

	   <c:choose>
	   	<c:when
	   		test="${fn:contains(cxtjb,'input')
	   		or fn:contains(cxtjb,'select')
	   		or fn:contains(cxtjb,'gdzselect')
	   		or fn:contains(cxtjb,'date')
	   		or fn:contains(cxtjb,'datetime')
	   		or fn:contains(cxtjb,'time')}">
			   <div class="btn-group">
				  <button type="button" class="btn btn-search dropdown-toggle" data-toggle="dropdown">搜索 <span class="caret"></span></button>
				  <div class="dropdown-menu search-list pull-right" role="menu" style="width:300px;">
		          <table border="0" width="96%"  cellpadding="0" cellspacing="0"  >
		          	  <c:forEach items="${cxtjb}" var="cxtj">

		          	  	<c:if test="${cxtj.lx eq 'input'}">
		          	  		<tr  >
		          	  		<th>${cxtj.bt}：</th>
		          	  		<td><input type="text" name="${cxtj.sxdm}" id="qf_${cxtj.sxdm}" value="${queryMap[cxtj.sxdm]}"/></td>
		          	  		</tr>
		          	  	</c:if>
		          	  	<c:if test="${cxtj.lx eq 'select'}">
		          	  		<tr   >
		          	  		<th>${cxtj.bt}：</th>
		          	  		<td>
		          	  		  <c:set value="${cxtj.tablename}${cxtj.sxdm}" var="_KEY_VALUE"></c:set>
		          	  		  <mytag _yz='' otherparam="${cxtj.ldqtcs}" _name="${cxtj.tablename}${cxtj.sxdm}" _value="${empty queryMap[_KEY_VALUE] ? cxtj.mrz : queryMap[_KEY_VALUE]}" id="${cxtj.id}" csm="${cxtj.ldmc}" ldmb="${cxtj.ldmb}" label="${cxtj.bt}" tablename="${cxtj.tablename}"  sxdm="${cxtj.sxdm}"   sxmc="${cxtj.sxmc}" zxxb_id="${zxxb_id}" item=""></mytag>
		          	  		</td>
		          	  		</tr>
		          	  	</c:if>
		          	  	<c:if test="${cxtj.lx eq 'hidden'}">
		          	  		<input type="hidden" name="${cxtj.sxdm}" id="qf_${cxtj.sxdm}" value="${cxtj.mrz}"/>
		          	  	</c:if>
		          	  	<c:if test="${cxtj.lx eq 'gdzselect'}">
		          	  		<tr   >
		          	  		<th>${cxtj.bt}：</th>
		          	  		<td>
		          	  		  <mytag _yz='' otherparam="${cxtj.ldqtcs}" _name="${cxtj.sxdm}" _value="${empty queryMap[cxtj.sxdm] ? cxtj.mrz : queryMap[cxtj.sxdm]}" id="${cxtj.id}" csm="${cxtj.ldmc}" ldmb="${cxtj.ldmb}" label="${cxtj.bt}" tablename="${cxtj.tablename}"  sxdm="${cxtj.sxdm}"   sxmc="${cxtj.sxmc}" zxxb_id="${zxxb_id}" item="${cxtj.ldgdz}"></mytag>
		          	  		</td>
		          	  		</tr>
		          	  	</c:if>
		          	  	<c:if test="${cxtj.lx eq 'date'}">
		          	  		<tr   >
		          	  		<th>${cxtj.bt}：</th>
		          	  		<td>
		          	  		  <input type="text" name="${cxtj.sxdm}" id="qf_${cxtj.sxdm}" value="${queryMap[cxtj.sxdm]}" class="form-control form_date" data-date-format="yyyy-mm-dd"/>
		          	  		</td>
		          	  		</tr>
		          	  	</c:if>
		          	  	<c:if test="${cxtj.lx eq 'datetime'}">
		          	  		<tr   >
		          	  		<th>${cxtj.bt}：</th>
		          	  		<td>
		          	  		  <input type="text" name="${cxtj.sxdm}" id="qf_${cxtj.sxdm}" value="${queryMap[cxtj.sxdm]}" class="form-control form_date" data-date-format="yyyy-mm-dd hh:ii"/>
		          	  		</td>
		          	  		</tr>
		          	  	</c:if>
		          	  	<c:if test="${cxtj.lx eq 'yearyear'}">
		          	  		<tr   >
		          	  		<th>${cxtj.bt}：</th>
		          	  		<td>
		          	  		  <input type="text" name="${cxtj.sxdm}" id="qf_${cxtj.sxdm}" value="${queryMap[cxtj.sxdm]}" class="form-control form_yearyear" data-date-format="yyyy"/>
		          	  		</td>
		          	  		</tr>
		          	  	</c:if>
		          	  	<c:if test="${cxtj.lx eq 'time'}">
		          	  		<tr   >
		          	  		<th>${cxtj.bt}：</th>
		          	  		<td>
		          	  		  <input type="text" name="${cxtj.sxdm}" id="qf_${cxtj.sxdm}" value="${queryMap[cxtj.sxdm]}" class="form-control form_date" data-date-format="hh:ii"/>
		          	  		</td>
		          	  		</tr>
		          	  	</c:if>
		          	  </c:forEach>
		      	</table>
			    <div class="divider"></div>
		        <div class="clr"></div>
		        <button type="button" class="btn btn-info pull-right mr10" onclick="javascript:queryLike();">查询</button>
			   </div>
			</div>
	   	</c:when>
	   	<c:otherwise>
		          	  <c:forEach items="${cxtjb}" var="cxtj">

		          	  	<c:if test="${cxtj.lx eq 'input'}">
		          	  		<tr>
		          	  		<th>${cxtj.bt}：</th>
		          	  		<td><input type="text" name="${cxtj.sxdm}" id="qf_${cxtj.sxdm}" value="${queryMap[cxtj.sxdm]}"/></td>
		          	  		</tr>
		          	  	</c:if>
		          	  	<c:if test="${cxtj.lx eq 'select'}">
		          	  		<tr>
		          	  		<th>${cxtj.bt}：</th>
		          	  		<td>
		          	  		  <c:set value="${cxtj.tablename}${cxtj.sxdm}" var="_KEY_VALUE"></c:set>
		          	  		  <mytag _yz='' otherparam="${cxtj.ldqtcs}" _name="${cxtj.tablename}${cxtj.sxdm}" _value="${empty queryMap[_KEY_VALUE] ? cxtj.mrz : queryMap[_KEY_VALUE]}" id="${cxtj.id}" csm="${cxtj.ldmc}" ldmb="${cxtj.ldmb}" label="${cxtj.bt}" tablename="${cxtj.tablename}"  sxdm="${cxtj.sxdm}"   sxmc="${cxtj.sxmc}" zxxb_id="${zxxb_id}" item=""></mytag>
		          	  		</td>
		          	  		</tr>
		          	  	</c:if>
		          	  	<c:if test="${cxtj.lx eq 'hidden'}">
		          	  		<input type="hidden" name="${cxtj.sxdm}" id="qf_${cxtj.sxdm}" value="${cxtj.mrz}"/>
		          	  	</c:if>
		          	  	<c:if test="${cxtj.lx eq 'gdzselect'}">
		          	  		<tr>
		          	  		<th>${cxtj.bt}：</th>
		          	  		<td>
		          	  		  <mytag _yz='' otherparam="${cxtj.ldqtcs}" _name="${cxtj.sxdm}" _value="${empty queryMap[cxtj.sxdm] ? cxtj.mrz : queryMap[cxtj.sxdm]}" id="${cxtj.id}" csm="${cxtj.ldmc}" ldmb="${cxtj.ldmb}" label="${cxtj.bt}" tablename="${cxtj.tablename}"  sxdm="${cxtj.sxdm}"   sxmc="${cxtj.sxmc}" zxxb_id="${zxxb_id}" item="${cxtj.ldgdz}"></mytag>
		          	  		</td>
		          	  		</tr>
		          	  	</c:if>
		          	  	<c:if test="${cxtj.lx eq 'date'}">
		          	  		<tr>
		          	  		<th>${cxtj.bt}：</th>
		          	  		<td>
		          	  		  <input type="text" name="${cxtj.sxdm}" id="qf_${cxtj.sxdm}" value="${queryMap[cxtj.sxdm]}" class="form-control form_date" data-date-format="yyyy-mm-dd"/>
		          	  		</td>
		          	  		</tr>
		          	  	</c:if>
		          	  	<c:if test="${cxtj.lx eq 'datetime'}">
		          	  		<tr>
		          	  		<th>${cxtj.bt}：</th>
		          	  		<td>
		          	  		  <input type="text" name="${cxtj.sxdm}" id="qf_${cxtj.sxdm}" value="${queryMap[cxtj.sxdm]}" class="form-control form_date" data-date-format="yyyy-mm-dd hh:ii"/>
		          	  		</td>
		          	  		</tr>
		          	  	</c:if>
		          	  	<c:if test="${cxtj.lx eq 'yearyear'}">
		          	  		<tr>
		          	  		<th>${cxtj.bt}：</th>
		          	  		<td>
		          	  		  <input type="text" name="${cxtj.sxdm}" id="qf_${cxtj.sxdm}" value="${queryMap[cxtj.sxdm]}" class="form-control form_yearyear" data-date-format="yyyy"/>
		          	  		</td>
		          	  		</tr>
		          	  	</c:if>
		          	  	<c:if test="${cxtj.lx eq 'time'}">
		          	  		<tr>
		          	  		<th>${cxtj.bt}：</th>
		          	  		<td>
		          	  		  <input type="text" name="${cxtj.sxdm}" id="qf_${cxtj.sxdm}" value="${queryMap[cxtj.sxdm]}" class="form-control form_date" data-date-format="hh:ii"/>
		          	  		</td>
		          	  		</tr>
		          	  	</c:if>
		          	  </c:forEach>
	   	</c:otherwise>
	   </c:choose>

    </form>
   </div>

    </div>
    <div class="clr"></div>
    <div class="list">
    	<form name="addOrUpdfrom" method="post" id="addOrUpdfrom" enctype="multipart/form-data">
        <table  class="table table-bordered bot_line table-hover ">
         <thead>
           <tr >
             <c:if test="${fn:contains(ymgns,'onBatchDel')}">
              <th width="30px;"> </th>
             </c:if>
             <c:if test="${fn:contains(lbgns,'onModel')}">
              <th></th>
             </c:if>
             <c:forEach items="${th}" var="t" varStatus="i">
                <c:if test="${t.html_lx ne 'hidden'}">
                  <th>${t.thead_first} </th>
                </c:if>
             </c:forEach>
                  <c:if test="${!empty lbgns and !fn:contains(lbgns,'onModel')}"><th class="cls_cz"></th></c:if>
            </tr>
          <tr>
          <th  >
             <c:if test="${fn:contains(ymgns,'onBatchDel')}">
            	 <input type="checkbox" id="ids" title="全选/不选"  />
            </c:if>
             </th>
<%--             <c:if test="${fn:contains(ymgns,'onBatchDel')}"> --%>
<!--             	<th><input type="checkbox" id="ids" title="全选/不选"  /></th> -->
<%--             </c:if> --%>
            <c:if test="${fn:contains(lbgns,'onModel')}">
            	<th></th>
            </c:if>

            <c:forEach items="${th}" var="t" varStatus="i">
			<c:choose>
				<c:when test="${t.html_lx eq 'hidden'}"></c:when>
		        <c:otherwise>
		        	<th>
		        		${t.bt}
		        		<c:if test="${t.sfyxpx eq '1'}">
		        		<c:set value="TABLE_COL_QF_ORDER_${t.bm}_${t.col}" var="_ORDER_KEY_VALUE"></c:set>
		        		<c:choose>
		        			<c:when test="${empty queryMap[_ORDER_KEY_VALUE]}">
				        		<a href="javascript:void(0);" onclick="queryLikeOrder('${t.bm}_${t.col}','ASC')" title="升序">
				        			<span class="datagrid-sort"><span class="datagrid-sort-icon"></span></span>
				        		</a>
		        			</c:when>
		        			<c:otherwise>
		        				<c:if test="${queryMap[_ORDER_KEY_VALUE] eq 'ASC'}">
					        		<a href="javascript:void(0);" onclick="queryLikeOrder('${t.bm}_${t.col}','DESC')" title="降序">
					        			<span class="datagrid-sort-desc"><span class="datagrid-sort-icon"></span></span>
					        		</a>
		        				</c:if>
		        				<c:if test="${queryMap[_ORDER_KEY_VALUE] eq 'DESC'}">
					        		<a href="javascript:void(0);" onclick="queryLikeOrder('${t.bm}_${t.col}','ASC')" title="升序">
					        			<span class="datagrid-sort-asc"><span class="datagrid-sort-icon"></span></span>
					        		</a>
		        				</c:if>
		        			</c:otherwise>
		        		</c:choose>
		        		</c:if>
		        	</th>
		        </c:otherwise>
		    </c:choose>
            </c:forEach>
    		<c:if test="${!empty lbgns and !fn:contains(lbgns,'onModel')}"><th class="cls_cz" >操作</th></c:if>
          </tr>
         </thead>
         <tbody>
			<c:forEach items="${list}" var="map" varStatus="i">
				<tr class="datarow"  data-tt-id='${map.TREEDM}' data-tt-parent-id='${map.TREEFDM}' >
	            <td style="white-space:nowrap;">

	             <c:if test="${fn:contains(ymgns,'onBatchDel')}">
	            	<input name="ids" type="checkbox"/>
	             </c:if>
	             <span class='${map.TREEICON}'> ${map.TREETITLE} </span></td>
<%-- 	            <c:if test="${fn:contains(ymgns,'onBatchDel')}"> --%>
<!-- 	            	<td><input name="ids" type="checkbox"/></td> -->
<%-- 	            </c:if> --%>
	            <c:if test="${fn:contains(lbgns,'onModel')}">
	            	<td>
					<c:forEach items="${lbgns}" var="lbgn">
						<c:if test="${lbgn.djsj eq 'onModel'}">
							<a title="${lbgn.anmc}" href="javascript:void(0);" onclick="onModel(this,'${lbgn.djsjdz}','${lbgn.anmc}','${lbgn.id}')"><div class="cz_button cz_bg1"><span class="glyphicon glyphicon-${lbgn.anys}"></span></div></a>
						</c:if>
					</c:forEach>
	            	</td>
	            </c:if>
				<td style="display:none">
				<c:forEach var="item" items="${map}">
					<input type="text" name="${item.key}" value="${item.value}"/>
				</c:forEach>
				<c:forEach var="item" items="${map}">
					<input type="text" name="_UPD__ID_${item.key}" value="${item.value}"/>
				</c:forEach>
				</td>
				<c:forEach items="${th}" var="t" >
						<input type="hidden" name="${t.modelname}" value="${!empty map[t.ascolbm] ? map[t.ascolbm] : un:GlobalVariableReplace(t.mrz,sessionScope.CURRENT_USER)}" />
						<c:choose>
							<c:when test="${!empty t.html_lx and t.html_lx != '' and t.html_lx ne ''}">
					           <c:if test="${t.html_lx eq 'input'}">
					           	 <td>
					           	 <input ${t.html_yz} type="text"  class="form-control" name="_UPD_${t.bm}_${t.col}" value="${!empty map[t.ascolbm] ? map[t.ascolbm] : un:GlobalVariableReplace(t.mrz,sessionScope.CURRENT_USER)}"/>
					           	 </td>
					           </c:if>
					           <c:if test="${t.html_lx eq 'select'}">
					           	 <td>
					           	 <mytag otherparam="${fn:replace(t.ldqtcs,'{count}', i.count)}" _value="${!empty map[t.ascolbm] ? map[t.ascolbm] : un:GlobalVariableReplace(t.mrz,sessionScope.CURRENT_USER)}" _yz='${t.html_yz}' _name="_UPD_${t.bm}_${t.col}" id="${i.count}_${t.bm}_${t.col}" csm="${t.ldmc}" ldmb="<c:if test="${!empty t.ldmb}">${i.count}_${t.ldmb}</c:if>" tablename="${t.tablename}"  sxdm="${t.sxdm}"   sxmc="${t.sxmc}" zxxb_id="${t.zxxb_id}" item="${t.ldgdz}"></mytag>
					           	 </td>
					           </c:if>
					           <c:if test="${t.html_lx eq 'gdzselect'}">
					           	 <td>
					           	 <mytag otherparam="${fn:replace(t.ldqtcs,'{count}', i.count)}" _value="${!empty map[t.ascolbm] ? map[t.ascolbm] : un:GlobalVariableReplace(t.mrz,sessionScope.CURRENT_USER)}" _yz='${t.html_yz}' _name="_UPD_${t.bm}_${t.col}" id="${i.count}_${t.bm}_${t.col}" csm="${t.ldmc}" ldmb="<c:if test="${!empty t.ldmb}">${i.count}_${t.ldmb}</c:if>" tablename="${t.tablename}"  sxdm="${t.sxdm}"   sxmc="${t.sxmc}" zxxb_id="${t.zxxb_id}" item="${t.ldgdz}"></mytag>
					           	 </td>
					           </c:if>
					           <c:if test="${t.html_lx eq 'hidden'}">

					           	 <input type="hidden" name="_UPD_${t.bm}_${t.col}" value="${!empty map[t.ascolbm] ? map[t.ascolbm] : un:GlobalVariableReplace(t.mrz,sessionScope.CURRENT_USER)}" />

					           </c:if>
					           <c:if test="${t.html_lx eq 'datetime'}">
					           	 <td>
					           	 <input ${t.html_yz} type="text" name="_UPD_${t.bm}_${t.col}" value="${!empty map[t.ascolbm] ? map[t.ascolbm] : un:GlobalVariableReplace(t.mrz,sessionScope.CURRENT_USER)}" class="form-control form_datetime" data-date-format="yyyy-mm-dd hh:ii"/>
					           	 </td>
					           </c:if>
					           <c:if test="${t.html_lx eq 'yearyear'}">
					           	 <td>
					           	 <input ${t.html_yz} type="text" name="_UPD_${t.bm}_${t.col}" value="${!empty map[t.ascolbm] ? map[t.ascolbm] : un:GlobalVariableReplace(t.mrz,sessionScope.CURRENT_USER)}" class="form-control form_yearyear" data-date-format="yyyy"/>
					           	 </td>
					           </c:if>


					           <c:if test="${t.html_lx eq 'date'}">
					           	 <td>
					           	 <input ${t.html_yz} type="text" name="_UPD_${t.bm}_${t.col}" value="${!empty map[t.ascolbm] ? map[t.ascolbm] : un:GlobalVariableReplace(t.mrz,sessionScope.CURRENT_USER)}" class="form-control form_date" data-date-format="yyyy-mm-dd"/>
					           	 </td>
					           </c:if>
					           <c:if test="${t.html_lx eq 'time'}">
					           	 <td>
					           	 <input ${t.html_yz} type="text" name="_UPD_${t.bm}_${t.col}" value="${!empty map[t.ascolbm] ? map[t.ascolbm] : un:GlobalVariableReplace(t.mrz,sessionScope.CURRENT_USER)}" class="form-control form_time" data-date-format="hh:ii"/>
					           	 </td>
					           </c:if>
					           <c:if test="${t.html_lx eq 'textarea'}">
					           	 <td>
					           	 <textarea ${t.html_yz} class="form-control" name="_UPD_${t.bm}_${t.col}" value="${!empty map[t.ascolbm] ? map[t.ascolbm] : un:GlobalVariableReplace(t.mrz,sessionScope.CURRENT_USER)}"></textarea>
					           	 </td>
					           </c:if>
					           <c:if test="${t.html_lx eq 'model'}">
					           	 <td>
<!-- 					              <div class="input-group col-sm-12">   			                 -->
<%-- 					                <input ${t.html_yz} readonly="" type="text"  class="form-control" name="_UPD_${t.bm}_${t.col}" value="${!empty map[t.ascolbm] ? map[t.ascolbm] : un:GlobalVariableReplace(t.mrz,sessionScope.CURRENT_USER)}"/> --%>
<!-- 					                <span class="input-group-btn"> -->
<%-- 					                  <button class="btn btn-default" type="button" anmc="${t.modemc}"  --%>
<%-- 					                  onclick="onModelOpen(this,'${t.modemc}','${t.modelid}')"  --%>
<%-- 					                  sjdjdz="${t.modelid}" _data='${t.modeldata}'>${t.modemc}</button> --%>
<!-- 					                </span>  -->
<!-- 					              </div>	   -->



			        <div class="spanbutton">
		              <div class="input-group">
		                <input   ${t.html_yz} readonly="" type="text"  class="form-control" name="_UPD_${t.bm}_${t.col}" value="${!empty map[t.ascolbm] ? map[t.ascolbm] : un:GlobalVariableReplace(t.mrz,sessionScope.CURRENT_USER)}"  />
		                <span class="input-group-addon">
		                  <span class="sbutton glyphicon glyphicon-plus"   anmc="${t.modemc}"
					                  onclick="onModelOpen(this,'${t.modemc}','${t.modelid}')"
					                  sjdjdz="${t.modelid}" _data='${t.modeldata}' >选择</span>
		                </span>
		              </div>
		            </div>

					           	 </td>
					           </c:if>

                     <c:if test="${t.html_lx eq 'model_dx'}">
                        <td>
                      <div class="spanbutton">
                          <div class="input-group">
                            <input   ${t.html_yz} readonly="" type="text"  class="form-control" name="_UPD_${t.bm}_${t.col}" value="${!empty map[t.ascolbm] ? map[t.ascolbm] : un:GlobalVariableReplace(t.mrz,sessionScope.CURRENT_USER)}"  />
                            <span class="input-group-addon">
                              <span class="sbutton glyphicon glyphicon-plus"   anmc="${t.modemc}" onclick="onModelOpen(this,'${t.modemc}','${t.modelid}')" sjdjdz="${t.modelid}" _data='${t.modeldata}' sfdx="true">选择</span>
                            </span>
                          </div>
                        </div>
                        </td>
                     </c:if>
					           <c:if test="${t.html_lx eq 'readonly'}">
					           	 <td>
					                <input ${t.html_yz} readonly="" type="text"  class="form-control" name="_UPD_${t.bm}_${t.col}" value="${!empty map[t.ascolbm] ? map[t.ascolbm] : un:GlobalVariableReplace(t.mrz,sessionScope.CURRENT_USER)}"/>
					           	 </td>
					           </c:if>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${fn:contains(map[t.ascolbm],'JsqUpload/') or fn:contains(map[t.ascolbm],'JsqUpload/')}">
										<td>
										<input type="hidden" name="_UPD_${t.bm}_${t.col}" value="${map[t.ascolbm]}" />
										<a href="javascript:void(0);" onclick="downfile('${un:substr(map[t.ascolbm],un:lastIndexOf(map[t.ascolbm],'?')+1,un:getLen(map[t.ascolbm]))}','${un:substr(map[t.ascolbm],0,un:lastIndexOf(map[t.ascolbm],'?'))}');return false;" title="点击下载">${un:substr(map[t.ascolbm],un:lastIndexOf(map[t.ascolbm],'?')+1,un:getLen(map[t.ascolbm]))}</a>
										</td>
									</c:when>
									<c:otherwise>
										<td>
										<input type="hidden" name="_UPD_${t.bm}_${t.col}" value="${!empty map[t.ascolbm] ? map[t.ascolbm] : un:GlobalVariableReplace(t.mrz,sessionScope.CURRENT_USER)}" />
										${!empty map[t.ascolbm] ? map[t.ascolbm] : un:GlobalVariableReplace(t.mrz,sessionScope.CURRENT_USER)}
										</td>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
				</c:forEach>
				<c:if test="${!empty lbgns and !fn:contains(lbgns,'onModel')}">
				<td>
					<c:forEach items="${lbgns}" var="lbgn">
				      <c:if test="${ map[lbgn.xstj] eq '1' or  map[lbgn.xstj] eq null }">
						<c:if test="${lbgn.djsj eq 'onUpd'}">
							<a title="${lbgn.anmc}" href="javascript:void(0);" onclick="onUpd(this,'${lbgn.djsjdz}','${lbgn.anmc}','${lbgn.id}')"><div class="cz_button cz_bg1"><span class="glyphicon glyphicon-${lbgn.anys}"></span></div></a>
						</c:if>
						<c:if test="${lbgn.djsj eq 'onDel'}">
							<a title="${lbgn.anmc}" href="javascript:void(0);" onclick="onDel(this,'${lbgn.id}')"><div class="cz_button cz_bg1"><span class="glyphicon glyphicon-${lbgn.anys}"></span></div></a>
						</c:if>
						<c:if test="${lbgn.djsj eq 'onDetail'}">
							<a title="${lbgn.anmc}" href="javascript:void(0);" onclick="onDetail(this,'${lbgn.djsjdz}','${lbgn.anmc}','${lbgn.id}')"><div class="cz_button cz_bg1"><span class="glyphicon glyphicon-${lbgn.anys}"></span></div></a>
						</c:if>
						<c:if test="${lbgn.djsj eq 'onDetailToEx'}">
							<a title="${lbgn.anmc}" href="javascript:void(0);" onclick="onDetailToEx(this,'${lbgn.djsjdz}','${lbgn.anmc}','${lbgn.id}')"><div class="cz_button cz_bg1"><span class="glyphicon glyphicon-${lbgn.anys}"></span></div></a>
						</c:if>						
			            <c:if test="${lbgn.djsj eq 'onSh'}">
			              <a title="${lbgn.anmc}" href="javascript:void(0);" onclick="onSh(this,'${lbgn.djsjdz}','${lbgn.anmc}','${lbgn.id}')"><div class="cz_button cz_bg1"><span class="glyphicon glyphicon-${lbgn.anys}"></span></div></a>
			            </c:if> 						
					</c:if>
					</c:forEach>
				</td>
				</c:if>
				</tr>
			</c:forEach>
          </tbody>
        </table>
        <input type="hidden" id="token" name="token" value="${token}" />
      </form>
    </div>

    <div class="clr"></div>
  </div>
</div>

<!-- 弹出层 -->
<div class="modal fade" id="onAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel"></h4>
			</div>
			<div class="modal-body">
			<iframe id="tabid_add_${zxxb_id}" name="tabid_add_${zxxb_id}" scrolling="yes" src="" border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%;" frameborder="0" allowTransparency="true"></iframe>
			</div>
		</div>
	</div>
</div>
<!-- 弹出层 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">信息提示</h4>
			</div>
			<div class="modal-body" id="loading-mess-message"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>${updRowMap}</title>
		<link rel="stylesheet" href="<%=path%>/resources/js/bootstrapvalidator-master/dist/css/bootstrapValidator.css"/>
		<link rel="stylesheet" href="<%=path%>/resources/js/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css"/>
		<link href="<%=path%>/resources/js/bootstrap-fileinput-master/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css"/>
		<link href="<%=path%>/resources/js/bootstrap-fileinput-master/themes/explorer/theme.min.css" media="all" rel="stylesheet" type="text/css"/>
		<c:if test="${ymcss eq '1'}">
		<jsp:include page="../../include/css-jsq-include-1.jsp"></jsp:include>
		</c:if>
		<c:if test="${ymcss eq '2'}">
		<jsp:include page="../../include/css-jsq-include-2.jsp"></jsp:include>
		</c:if>
		<c:if test="${ymcss eq '3'  or empty ymcss }">
		<jsp:include page="../../include/css-jsq-include-3.jsp"></jsp:include>
		</c:if>
		<link href="<%=path%>/resources/style/jsq/css/bootstrap-select.min.css" media="all" rel="stylesheet" type="text/css"/>
		<script src="<%=path%>/resources/style/bootstrap/js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/formbj/bootstrap-select.min.js"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/bootstrapvalidator-master/dist/js/bootstrapValidator.js"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js" ></script>
		<script src="<%=path%>/resources/js/ bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<script src="<%=path%>/resources/js/bootstrap-fileinput-master/js/fileinput.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/bootstrap-fileinput-master/js/locales/zh.js"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/bootstrap-fileinput-master/themes/explorer/theme.min.js"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.cookie.js"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/formbj/jquery.pin.js"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/formbj/javascriptmethod.js"></script>
		<style>
	.modal-header {
     background: #ebebeb;
     border-top-left-radius: 6px;
     border-top-right-radius: 6px;
    }
			 .form-horizontal .has-feedback .spanbutton .form-control-feedback {
		    top: 0;
		    right: 50px;
            }
			.butbar	{border-bottom:1px dotted #777777}
			.ptpb{padding-top:10px ;padding-bottom:10px;}
			table{margin:10px 0 0;}
			td,th{border: 1px solid #ddd;color: #787878;}
			label{color: #787878;}
			DIV.form-group{
			    margin: 5px;
			    padding: 5px;

			}
			.kv-avatar.form-group{
              margin:2px;

             }
            .formtitlebackground{
              background:#eeeeee;
              text-align:center;
             }
            .panletable{margin:0 auto}

		</style>
		<!-- 加载条 -->
		<style>
			.loading{
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
			.loading-center{
				width: 100%;
				height: 100%;
				position: relative;
				}
			.loading-center-absolute {
				position: absolute;
				left: 50%;
				top: 50%;
				height: 50px;
				width: 150px;
				margin-top: -25px;
				margin-left: -75px;

			}
			td .radio-inline input[type="radio"] {
			  margin-left:1px;
 			}
			td .checkbox-inline input[type="checkbox"] {
			 margin-left:1px;
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
			.dynamicbtn{
			width:25px;
			height:25px;
			padding:1px;
			margin-left:5px;
			}
		   .dynamicbtn i{
			  font-size: 3em;
			}
		</style>
		<script>
            window.onload=function (ev) {
                closesLoading()
            }
			$(function () {
				$('.col-sm-9').removeClass('col-sm-9').addClass('col-xs-10')
				$('.col-sm-3').removeClass('col-sm-3').addClass('col-xs-2')
				$('.panletable').css({
					"width":'100%'
				})
                closesLoading();
            })

		    function closesLoading() {
                $('#loading').css('display','none');
		      /*  $('#loading').fadeOut('normal', function () {
		            $(this).css('display','none');
		        });*/
		    }
		    function openLoading() {
                $('#loading').css('display','none');
		        /*$('#loading').fadeOut('normal', function () {
		            $(this).css('display','block');
		        });*/
		    }
		    function closemodLoading() {

		        $('.loading').fadeOut('normal', function () {
		            $(this).css('display','none');
		        });
		    }
		    function openmodLoading(bing) {
		    	$(bing).parents('.modal-content').find('.loading').fadeOut('normal', function () {
		            $(this).css('display','block');
		        });
		    }
		  var  parentQueryLike = function(){}
		</script>
		<!-- 1对多tr模板 -->
		 <c:forEach items="${ywbList}" var="y">
				<table class="temp" style="display:none" id="tr_template_${y.bm}">
	        	<tr>
	           <c:forEach items="${y.ywbcol}" var="t">
	           <c:if test="${t.html_lx eq 'input'}">
	           	 <td>
	           	 <input ${t.html_yz} type="text"  class="form-control" name="${t.bm}_${t.col}" value="${t.mrz}"/>
	           	 </td>
	           </c:if>
	           <c:if test="${t.html_lx eq 'select'}">
	           	 <td>
	           	 <mytag2 otherparam="${t.ldqtcs}" _yz='${t.html_yz}' _name="${t.bm}_${t.col}" id="${t.bm}_${t.col}" csm="${t.ldmc}" ldmb="${t.ldmb}" tablename="${t.tablename}"  sxdm="${t.sxdm}"   sxmc="${t.sxmc}" zxxb_id="${zxxb_id}" item="${t.ldgdz}"></mytag2>
	           	 </td>
	           </c:if>
	           <c:if test="${t.html_lx eq 'multipleSelect'}">
	           	 <td>
	           	 <mytag2 _multiple="multiple" otherparam="${t.ldqtcs}" _yz='${t.html_yz}' _name="${t.bm}_${t.col}" id="${t.bm}_${t.col}" csm="${t.ldmc}" ldmb="${t.ldmb}" tablename="${t.tablename}"  sxdm="${t.sxdm}"   sxmc="${t.sxmc}" zxxb_id="${zxxb_id}" item="${t.ldgdz}"></mytag2>
	           	 </td>
	           </c:if>	           
	           <c:if test="${t.html_lx eq 'model'}">
	           	 <td>
			        <div class="spanbutton">
		              <div class="input-group">
		                <input  ${t.html_yz} type="text"  class="form-control" name="${t.bm}_${t.col}" value="${t.mrz}" readonly="" />
		                <span class="input-group-addon">
		                  <span class="sbutton glyphicon glyphicon-plus"   anmc="${t.modemc}" onclick="onModelOpen(this,'${t.modemc}','${t.modelid}')"  sjdjdz="${t.modelid}" _data='${t.modeldata}'>选择</span>
		                </span>
		              </div>
		            </div>
	           	 </td>
	           </c:if>
	           <c:if test="${t.html_lx eq 'readonly'}">
	           	 <td>
	                <input ${t.html_yz} type="text"  class="form-control" name="${t.bm}_${t.col}" value="${t.mrz}" readonly="" />
	           	 </td>
	           </c:if>

	           <c:if test="${t.html_lx eq 'gdzselect'}">
	           	 <td>
	           	 <mytag2  otherparam="${t.ldqtcs}" _yz='${t.html_yz}' _name="${t.bm}_${t.col}" id="${t.bm}_${t.col}" csm="${t.ldmc}" ldmb="${t.ldmb}" tablename="${t.tablename}"  sxdm="${t.sxdm}"   sxmc="${t.sxmc}" zxxb_id="${zxxb_id}" item="${t.ldgdz}"></mytag2>
	           	 </td>
	           </c:if>
	           <c:if test="${t.html_lx eq 'hidden'}">
	           	 <input type="hidden" name="${t.bm}_${t.col}" value="${t.mrz}" />
	           </c:if>
	           <c:if test="${t.html_lx eq 'datetime'}">
	           	 <td>
	           	 <input ${t.html_yz} type="text" name="${t.bm}_${t.col}" value="${t.mrz}" class="form-control form_datetime" data-date-format="yyyy-mm-dd hh:ii"/>
	           	 </td>
	           </c:if>
	           <c:if test="${t.html_lx eq 'yearyear'}">
	           	 <td>
	           	 <input ${t.html_yz} type="text" name="${t.bm}_${t.col}" value="${t.mrz}" class="form-control form_yearyear" data-date-format="yyyy"/>
	           	 </td>
	           </c:if>
	           <c:if test="${t.html_lx eq 'date'}">
	           	 <td>
	           	 <input ${t.html_yz} type="text" name="${t.bm}_${t.col}" value="${t.mrz}" class="form-control form_date" data-date-format="yyyy-mm-dd"/>
	           	 </td>
	           </c:if>
	           <c:if test="${t.html_lx eq 'time'}">
	           	 <td>
	           	 <input ${t.html_yz} type="text" name="${t.bm}_${t.col}" value="${t.mrz}" class="form-control form_time" data-date-format="hh:ii"/>
	           	 </td>
	           </c:if>
	           <c:if test="${t.html_lx eq 'textarea'}">
	           	 <td>
	           	 <textarea ${t.html_yz} class="form-control" name="${t.bm}_${t.col}" value="${t.mrz}"></textarea>
	           	 </td>
	           </c:if>
	           </c:forEach>
	           	  <input type="hidden" name="_${y.bm}_XZ_BSFH" value="_${y.bm}_XZ_BSFH" /><!-- 新增标识符号 -->
	           	 <c:if test="${empty sfbcan}">
	           	 <td>
	           	<button type="button" class="btn btn-primary" onclick="javascript:delTr(this);">删除</button>
	           	</td>
	           	</c:if>
	        	</tr>
	        	</table>
		 </c:forEach>

		<div id="template" style="display:none" >
    		<!-- 修改值-->
			 <c:forEach items="${updRowMap.rowData}" var="row">
			 	<input type="hidden" class="maindata" name="${row.name}" value="${row.value}" _sfxg="${row.sfxg}" />
			 </c:forEach>
			 <c:forEach items="${ywbList}" var="y">
			 <table zbm="${y.bm}" >
	 			<c:forEach items="${y.ywbcolData}" var="map">
	 				<tr>
	 					 <td>
	 					 	<c:forEach items="${y.ywbcol}" var="t">
	 					 	 	<input type="hidden" name="${t.bm}_${t.col}" value="${map[t.name]}"  />
	 					 	 </c:forEach>
	 					 </td>
	 				</tr>
	 			</c:forEach>
			 </table>
			 </c:forEach>
		</div>

	<script type="text/javascript">
    <%
    String  version = com.incon.project.jsqlquery.base.Util.GlobalVariableUtil.class.getPackage().getImplementationVersion();
    %>
    console.log('*************************************************************************************************************');
    console.log('**                                                                                                         **');
    console.log('**<%=version%>');
    console.log('**                                                                                                         **');
    console.log('*************************************************************************************************************');

	
	    var  ROOT_JSPATH=''
	       var formpage=function(){
	    	return true
	    }
		var btnCust = '' ;
		var $_target;
		function S4() {
		   return (((1+Math.random())*0x10000)|0).toString(16).substring(1);
		}
		function guid() {
		   return (S4()+S4()+"-"+S4()+"-"+S4()+"-"+S4()+"-"+S4()+S4()+S4());
		}
		var parentQueryLike=function(){}

			//模糊查询
			var closeiframeForm =function(){
			   $('#onAdd').modal('hide')
			}
			$(document).ready(function(){


				if(window.name!=''){
				 $(window.parent.document).find('.list-group-item[name='+window.name+']').each(function(i,dom){
						if( eval('('+$(dom).attr('usewindow')+')')==undefined ||
							    eval('('+$(dom).attr('usewindow')+')').length==0 ||
							    eval('('+$(dom).attr('usewindow')+')').indexOf('${zxxb_id}')>=0){

					 var _data=eval('('+$(dom).attr("_data")+')')
					 if(_data.eventsource=='button'){
						 var $_button=$(dom).find('.dynamicbtn').clone();

						     $_button.on('click',function(){
						    	 $('[data-toggle=tooltip]').tooltip('hide' )
							 window.parent.openiframe(window,$(this).parents('tr').find('input,select,textarea'),_data )
						 })
						 $('#addOrUpdfrom').before($_button)
					 }

					 }
				 })
				 }
				$('[data-toggle=tooltip]').tooltip( )
				var wHeight
				var wWidth
				wHeight =(window.innerHeight || (window.document.documentElement.clientHeight || window.document.body.clientHeight));
				wWidth = (window.innerWidth || (window.document.documentElement.clientWidth || window.document.body.clientWidth));
				$("#tabid_add").height(wHeight);
				$(window).resize(function() {
					wHeight =(window.innerHeight || (window.document.documentElement.clientHeight || window.document.body.clientHeight));
					wWidth = (window.innerWidth || (window.document.documentElement.clientWidth || window.document.body.clientWidth));
			 		$("iframe.tab").each( function(i,dom){
			 			$(dom).height(wHeight-30 - $(dom).offset().top );
			 		})
				});

		 		//alert(wHeight);

		 		$("iframe.tab").each( function(i,dom){
		 			$(dom).height(wHeight-30 - $(dom).offset().top );
		 			var zxxb_id = $(dom).attr('zxxb_id')
		 			$(dom).attr('src',"<%=path%>/Jsqlquery/htmlSelectCodeEngine/"+zxxb_id)
		 		})
			})
			function onModelExecute(obj){

				 var result =eval('('+$('#myModalLabel').attr("_data")+')')
				 $.each(result,function(i,o){
					 var _size = $("#addOrUpdfrom").find("[name='"+o.value+"']").size();

					 if(o.value!=''){
						 if(_size==1){
							 $("#addOrUpdfrom").find('[name='+o.value+']').eq(0).val($(obj).find('[name='+o.field+']').eq(0).val());
						 }else {
	 						$($_target).parents('tr').find('[name='+o.value+']').each(function(i,dom){
								$(dom).val($(obj).find('[name='+o.field+']').eq(0).val());
							     $('#datetimeForm').bootstrapValidator('revalidateField', dom);
							})
						 }
					 }
				 })
				 if($("#addOrUpdfrom").data('bootstrapValidator')){
                     $("#addOrUpdfrom").data('bootstrapValidator').destroy();
                     $('#addOrUpdfrom').bootstrapValidator();
				 }

			}
			function onModelExecuteMore(moreobj){

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
							     $('#datetimeForm').bootstrapValidator('revalidateField', dom);
							})
						 }
					 }
				 })
                 if($("#addOrUpdfrom").data('bootstrapValidator')){
                     $("#addOrUpdfrom").data('bootstrapValidator').destroy();
                     $('#addOrUpdfrom').bootstrapValidator();
				 }

			}
			function onModelOpen(target ,anmc,sjdjdz){

				openmodLoading( $('#tabid_add') )
				$('#tabid_add').parent().find('.seled').html('')
				$('#tabid_add').parent().find('.seled').hide()
				$_target = $(target);
				var src = "<%=path%>/Jsqlquery/htmlSelectCodeEngine/"+sjdjdz;
				//$('#tabid_add').attr('src',src);
				$('#myModalLabel').html(anmc);
				$('#myModalLabel').attr("_data",$(target).attr("_data"));

				var win=window
				var parentOpen=false
                while(win!=window.parent && win.parent.onAddshow && typeof(win.parent.onAddshow) == "function"){
					win=window.parent
					parentOpen=true
				}

				if ($(target).attr("sfdx")==true || $(target).attr("sfdx")=="true" ){
                var _data = eval('('+$(target).attr("_data")+')')
                var _t_value = $(target).parents('.input-group').find('input').val()

                if(_t_value!=''){

                var _t_value_array = _t_value.split(',')
                 $.each(_t_value_array,function(i,d){
	                var t_value=''
	                var $_li=$('<li style="display:none" ></li>')
                	$.each(_data,function(j,d2){
                        var _vv=$(target).parents('form').find('[name='+d2.value+']').val().split(',')[i]
                        $_li.append('<input type="hidden" name='+d2.field+' value="'+_vv+'" />')
                		t_value+=$(target).parents('form').find('[name='+d2.value+']').val().split(',')[i]
	                })
	              var $_content =$('<div  style="width:200px;height:25px;float:left;margin:2px;padding:2px 24px 2px 2px;" class="selectedtr alert alert-warning alert-dismissible" role="alert">'+
        				  '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
         				 '<div class="select_content" > '+t_value+'</div><div style="display:none" class="hidden_context"></div>'+
         				 '</div>')
         			  $_content.append( $_li )
        		     $('#tabid_add').parent().find('.seled').append($_content )
					 $('#tabid_add').parent().find('.seled').show()
                 })
                }
			   }
				$('#iframeForm').html('');
				$(target).parents('form').find('input').each(function(i,dom){
					var input = $('<input type="hidden" />');
					input.attr('value', $(dom).attr('value'));
					input.attr('name', $(dom).attr('name'));
					$('#iframeForm').append(input);
				})

				 if(parentOpen==false){
						document.getElementById("iframeForm").action = src;
					    $('#tabid_add').attr("_data",$(target).attr("_data"));
					    if($(target).attr("sfdx")!=undefined && $(target).attr("sfdx")!=''){

					        $('#tabid_add').attr("_sfdx",$(target).attr("sfdx"));
					    }else{
					    	$('#tabid_add').removeAttr("_sfdx")
					    }
						document.getElementById("iframeForm").target="tabid_add"; //当点击查询按钮才处理时间
		 				document.getElementById("iframeForm").submit();
					 	$('#onAdd').modal('show')

					 	setIframeHeight('tabid_add')
				  }else{

					 var rid = Math.floor(Math.random()*(100)+1);
					  document.getElementById("iframeForm").action = src;
					  document.getElementById("iframeForm").target="tabid_add"+rid; //当点击查询按钮才处理时间
					  var $modalwin= $('#onAdd').clone();
					  $modalwin.attr('id','onAdd'+rid)
					  $(win.document).find('#form'+rid).remove()
			       	  $(win.document).find('#onAdd'+rid).remove()
					// $('#iframeForm').clone().appendTo($(win.document).find('body').find('.stempdiv'));
				      var $nform= $('#iframeForm').clone()
				      $nform.attr('id','form'+rid)
					  $nform.clone().appendTo($(win.document).find('body'));
				      $modalwin.find('iframe').attr("_data",$(target).attr("_data"));
				      if($(target).attr("sfdx")!=undefined && $(target).attr("sfdx")!=''){
				      $modalwin.find('iframe').attr("_sfdx",$(target).attr("sfdx"));
				      }
					  $modalwin.find('iframe').attr('name',"tabid_add"+rid)
					  $modalwin.find('iframe').attr('id',"tabid_add"+rid)
					  $modalwin.appendTo($(win.document).find('body'));
					 // $modalwin.modal('show')
					  win.setparentwin(window)
					  win.onAddshow(rid);
					 }
			}
	        $(document).on('loadmytag2','mytag2.data',function(e ,v  ){

	          var dom=this;
	       	  var label=$(dom).attr('label')
	       	  var _yz = $(dom).attr("_yz");
	       	  var otherparam = $(dom).attr("otherparam");
	    	  var $newDom=$("<div style='float:left;width:100%;'><select "+_yz+" class='form-control ' tablename='"+$(dom).attr("tablename")+"' sxdm='"+$(dom).attr("sxdm")+"' sxmc='"+$(dom).attr("sxmc")+"'  csm='"+$(dom).attr("csm")+"' id='"+$(dom).attr("id")+"' name='"+$(dom).attr("_name")+"'></select></div>")

    	      if ($(dom).attr("ldmb")!=undefined && $(dom).attr("ldmb")!=''){
	    	        $newDom.find('select').attr('ldmb',$(dom).attr("ldmb"))
	    	        $newDom.find('select').attr('otherparam',$(dom).attr("otherparam").replace('{count}',v._count))
	    	        $newDom.find('select').attr('id',v._count+"_"+$(dom).attr("id"))
	    	      }
		      var selected=''
		      var param={
		        	tablename:$(dom).attr("tablename"),
		        	sxmc:$(dom).attr("sxmc"),
		        	sxdm:$(dom).attr("sxdm"),
		        	zxxb_id:$(dom).attr("zxxb_id")
		  	  }
	    	  var $_t = $(dom).parents('tr').find('[ldmb='+$(dom).attr("id")+']')
	    	  if($_t.size()>0){
	    		  var _tempid=$_t.attr('id')
	    		  var $_tar=$(dom).parents('tr').find('select[id='+_tempid+']').eq(0)
	    	      param={
	  	        	tablename:$(dom).attr("tablename"),
	  	        	sxmc:$(dom).attr("sxmc"),
	  	        	sxdm:$(dom).attr("sxdm"),
	  	        	zxxb_id:$(dom).attr("zxxb_id"),
	  	        	csm:$_tar.attr("csm"),
	  	        	csz: $_tar.val()
			  	  }
	    	  }
    	      if ($(dom).attr("item")!=undefined && $(dom).attr("item")!=''){
  	    	    var item=$(dom).attr('item');
  	    	  	var array=new Array()
	    		  	array=item.split(',')
					$.each(array,function(i,k){
						 var op=k.split(':')
						 var $_options=$('<option value="'+op[1]+'" '+(v.value==op[1]?"selected":"")+'> '+op[0]+'</option>')
			  	         $newDom.find('select').append($_options)
					})
	    	  }else {
		    	  $.ajax({
			  	        dataType: "json",
			  	        type: "POST",
			  	        data:param,
			  	        async:false,
			  	        url: '<%=path%>/Jsqlquery/queryCombobox',
			  	        success : function (data) {
			  	        //	if ($newDom.find('select').is("multiple")==false){
			  	        	$newDom.find('select').append('<option value="">--请选择--</option>');
			  	        //	}

			  	        	$.each(data,function(i,o){
			  	        		 var selected=''
			  	        		 if (o[$(dom).attr('sxdm')]==v.value){
			  	        			selected='selected'
			  	        		 }
			  	              var $_options=$('<option '+selected+' value="'+o[$(dom).attr('sxdm')]+'"> '+o[$(dom).attr('sxmc')]+'</option>')

			  	                  $_options.text(o[$(dom).attr('sxmc')])
			  	                  $newDom.find('select').append($_options)
			  	        	  })
			  	        }
			       });
	    	  }
	    	  if($(dom).attr('ldmb')!=undefined && $(dom).attr('ldmb')!=''){
	    		      $newDom.find('select[ldmb]').on('change',function( ){
	    			 var $_target=$newDom.parents('tr').find('[id='+$(dom).attr('ldmb')+']' )
	    			 var _otherparam=$(this).attr('otherparam')
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
		    					if (obj.length>1){
		    				    params+=obj[0]+","
		    				    data['csz']+=","+$('#'+obj[1]).val()
		    				    data[obj[0]]=$('#'+obj[1]).val()
		    					}
		    			     })

		    			     data.csm=params+$(dom).attr("csm")
		    		  }
		    		   data[$(dom).attr("csm")]=$newDom.find('select').val()
	    			   $_target.html('')
		   		       $.ajax({
				  	        dataType: "json",
				  	        type: "POST",
				  	        async: false,
				  	        data: data,
				  	        url: '<%=path%>/Jsqlquery/queryCombobox',
				  	        success : function (data) {
				  	        	 $_target.append('<option value="">--请选择--</option>');
				  	        	 $.each(data,function(i,o){
				  	              var $_options=$('<option value="'+o[$_target.attr('sxdm')]+'"> '+o[$_target.attr('sxmc')]+'</option>')

				  	               $_options.text(o[$(dom).attr('sxmc')])
				  	                  $_target.append($_options)
				  	        	  })
				  	        }
				       });
	    		  })
	    	  }
	    	  $(dom).replaceWith($newDom);
	    	  //处理多选框 丁起明 
	    	  var _multiple = $(dom).attr("_multiple");
	    	  if(_multiple!=undefined && _multiple!=null && _multiple!=''){
	    		$newDom.find('select').attr('multiple',_multiple);
	    		if($newDom.find('option:first').text() =='--请选择--'){
	    			$newDom.find('option:first').remove();
	    		}
	    		
	    		$newDom.find('option').each(function(i,option){
             	   if (v.value.indexOf($(option).attr('value')) >=0){
             		   $(option).attr('selected','selected')
             	   }
           		})
				$newDom.find('select').selectpicker({
					 noneSelectedText:'--请选择--',
					 tickIcon:'glyphicon-ok  '
				})           					    	  
	    	  }
			 //处理多选框 END
	        })
			function appandTr(trid,tbodyid){
	        	var _guid = guid();
				var $_tr=$("#"+trid).find("tr").clone()
				$_tr.find('mytag2').addClass('data')

				$($_tr).each(function(i,dom){
					$(dom).find('input[type=text]').each(function(i2,dom2){
						var v =$(dom2).attr('value').replace("$_GLOBAL_GUID$",guid())
						$(dom2).attr('value',v)
					});
					$(dom).find('input[type=hidden]').each(function(i2,dom2){
						var v =$(dom2).attr('value').replace("$_GLOBAL_GUID$",guid())
						$(dom2).attr('value',v)
					});
				});
				$("#"+tbodyid).append($_tr);
				//固定值
// 				$('mytag3').each(function(i,dom){
// 			    	  var item=$(dom).attr('item');
// 			    	  var $newDom=$("<div style='float:left;width:100%;'><select id='"+$(dom).attr("id")+"' name='"+$(dom).attr("_name")+"' "+$(dom).attr('_yz')+"></select></div>");
// 		    	      if ($(dom).attr("item")!=undefined && $(dom).attr("item")!=''){
// 		    	    	  	var array=new Array()
// 			    		  	array=item.split(',')
// 							$.each(array,function(i,k){
// 								 var op=k.split(':')
// 								 var $_options=$('<option value="'+op[1]+'"> '+op[0]+'</option>')
// 					  	         $newDom.find('select').append($_options)
// 							})
// 			    	  }
// 			    	  $(dom).replaceWith($newDom);
// 			     });

				$('mytag2.data').each(function(i,dom){
					  $(dom).trigger('loadmytag2',{value:'',_count:_guid})
			     });
		        $('.form_yearyear').datetimepicker({
		            format: 'yyyy',
		             weekStart: 1,
		             autoclose: true,
		             startView: 4,
		             minView: 4,
		             forceParse: false,
		             language: 'zh-CN'
		        }).on('hide',function(e) {
		        	  $("#addOrUpdfrom").data('bootstrapValidator').destroy();
		              $('#addOrUpdfrom').data('bootstrapValidator', null);
		  			var bootstrapValidator = $("#addOrUpdfrom").data('bootstrapValidator');
				     bootstrapValidator.validate();
					 if(bootstrapValidator.isValid()){
							if(Validator.Validate(document.getElementById('addOrUpdfrom'),3)){
							}}
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
		        }).on('hide',function(e) {
		        	  $("#addOrUpdfrom").data('bootstrapValidator').destroy();
		              $('#addOrUpdfrom').data('bootstrapValidator', null);
		  			var bootstrapValidator = $("#addOrUpdfrom").data('bootstrapValidator');
				     bootstrapValidator.validate();
					 if(bootstrapValidator.isValid()){
							if(Validator.Validate(document.getElementById('addOrUpdfrom'),3)){
							}}

              });
		        $('.form_yearmonth').datetimepicker({

		             weekStart: 1,
		             autoclose: true,
		             startView: 3,
		             minView: 3,
		             forceParse: false,
		             language: 'zh-CN'
		        }).on('hide',function(e) {

		        	  $("#addOrUpdfrom").data('bootstrapValidator').destroy();
		              $('#addOrUpdfrom').data('bootstrapValidator', null);
		  			var bootstrapValidator = $("#addOrUpdfrom").data('bootstrapValidator');
				     bootstrapValidator.validate();
					 if(bootstrapValidator.isValid()){
							if(Validator.Validate(document.getElementById('addOrUpdfrom'),3)){
							}}

              });

		    	$('.form_date').datetimepicker({
		    		language:'zh-CN',
		            weekStart: 1,
		            todayBtn:  1,
		    		autoclose: 1,
		    		todayHighlight: 1,
		    		startView: 2,
		    		minView: 2,
		    		forceParse: 0
		        }).on('hide',function(e) {

		        	  $("#addOrUpdfrom").data('bootstrapValidator').destroy();
		              $('#addOrUpdfrom').data('bootstrapValidator', null);
		  			var bootstrapValidator = $("#addOrUpdfrom").data('bootstrapValidator');
				     bootstrapValidator.validate();
					 if(bootstrapValidator.isValid()){
							if(Validator.Validate(document.getElementById('addOrUpdfrom'),3)){
							}}

              });;
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
		        }).on('hide',function(e){
		        	  $("#addOrUpdfrom").data('bootstrapValidator').destroy();
		              $('#addOrUpdfrom').data('bootstrapValidator', null);
		  			var bootstrapValidator = $("#addOrUpdfrom").data('bootstrapValidator');
				     bootstrapValidator.validate();
					 if(bootstrapValidator.isValid()){
							if(Validator.Validate(document.getElementById('addOrUpdfrom'),3)){
							}}
              });

		    	$($_tr).find("[name]").each(function(index,item){
		    	    //$('#addOrUpdfrom').bootstrapValidator('removeField', $(item).attr('name'));
		    	    //$(".form-control-feedback").remove();
		    		$('#addOrUpdfrom').bootstrapValidator('addField', $(item).attr('name'));
		    	})

			}
			function delTr(obj){
				$(obj).parent().parent().remove();
			}
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
			
			 //#################################################################
		    $(document).ready(function() {

		    	$('.modal').on('hidden.bs.modal', function (e) {
		    	     $(this).find('.seled').html('');
		    	     $(this).find('.seled').hide();
		    	 })
				$('[readonly]').on('click',function(event){
					event.preventDefault();
				})
		         var initialPreviewData=new Array();
		         var initialPreviewConfigData=new Array();
		         var _val
		         var img
		         $('input[value^=JsqUpload][name^=_OLD_]').each(function(i,dom){
		        	 _val=$(dom).val()
		        	 var test = /\/([^\/]*?\.[a-zA-Z]{0,4})/i;
		        	 if (_val && _val!='' && _val!='null' && _val!=null ){
						 if (test.exec(_val).length>0){
						 img = test.exec(_val)[1];
						 _val = _val.split("?")[0];
						 initialPreviewData.push( "<%=basePath%>upload/"+_val)
						 initialPreviewConfigData.push({caption: '<a onclick=downfile(\''+$(dom).val().split("?")[1]+'\',\''+_val+'\')  >'+$(dom).val().split("?")[1]+'</a>', filename: $(dom).val().split("?")[1]  })
						 }
                     }

		         })

		    	$('input[type=file][uploadtype=image]').fileinput({
		    		 overwriteInitial: true,
		    		 maxFileSize: 1500,
		    		 showClose: false,
		    		 showCaption: false,
		    		 browseLabel: '',
		    		 removeLabel: '',
		    		 browseIcon: '<i class="glyphicon glyphicon-folder-open"></i>',
		    		// removeIcon: '<i class="glyphicon glyphicon-remove"></i>',
		    		 removeTitle: 'Cancel or reset changes',
		    		 elErrorContainer: '#kv-avatar-errors-1',
		    		 msgErrorClass: 'alert alert-block alert-danger',
		    		 defaultPreviewContent: '<img src="<%=path%>/upload/'+_val+'" alt="Your Avatar" style="width:160px">',
		    		 layoutTemplates: {main2: '{preview} ' +  btnCust + '   {browse}'},
		    		 allowedFileExtensions: ["jpg", "png", "gif"]
		    		});

		         $('input[type=file][uploadtype!=image]').fileinput({
		        	    language:'zh',
		        	    theme: "explorer",
		        	    autoReplace: true,
		        	    showUpload: false,
		        	   // overwriteInitial: true,
		        	   // showUploadedThumbs: false,
		        	    maxFileCount: 1,
		        	    initialPreview:initialPreviewData,
		        	    initialCaption: img,
		        	    initialPreviewConfig:initialPreviewConfigData,
		        	    initialPreviewShowDelete: false,
		        	    showRemove: false,
		        	    showClose: false,
		        	    initialPreviewAsData: true,
		        	    preferIconicPreview: true,
		        	    previewFileIconSettings: { // configure your icon file extensions
		        	        'doc': '<i class="fa fa-file-word-o text-primary"></i>',
		        	        'docx': '<i class="fa fa-file-word-o text-primary"></i>',
		        	        'xls': '<i class="fa fa-file-excel-o text-success"></i>',
		        	        'xlsx': '<i class="fa fa-file-excel-o text-success"></i>',
		        	        'ppt': '<i class="fa fa-file-powerpoint-o text-danger"></i>',
		        	        'pdf': '<i class="fa fa-file-pdf-o text-danger"></i>',
		        	        'zip': '<i class="fa fa-file-archive-o text-muted"></i>',
		        	        'htm': '<i class="fa fa-file-code-o text-info"></i>',
		        	        'txt': '<i class="fa fa-file-text-o text-info"></i>',
		        	        'mov': '<i class="fa fa-file-movie-o text-warning"></i>',
		        	        'mp3': '<i class="fa fa-file-audio-o text-warning"></i>'//,
		        	        // note for these file types below no extension determination logic
		        	        // has been configured (the keys itself will be used as extensions)
// 		        	        'jpg': '<i class="fa fa-file-photo-o text-danger"></i>',
// 		        	        'gif': '<i class="fa fa-file-photo-o text-muted"></i>',
// 		        	        'png': '<i class="fa fa-file-photo-o text-primary"></i>'
		        	    },
		        	    otherActionButtons:'',
		                fileActionSettings: {
		                    showRemove: false,
		                    showUpload: false,
		                    showZoom: true,
		                    showDrag: false,
		                    removeIcon: '<i class="glyphicon glyphicon-trash text-danger"></i>',
		                    removeClass: 'btn btn-xs btn-default',
		                    removeTitle: 'Remove file',
		                    uploadIcon: '<i class="glyphicon glyphicon-upload text-info"></i>',
		                    uploadClass: 'btn btn-xs btn-default',
		                    uploadTitle: 'Upload file',
		                    zoomIcon: '<i class="glyphicon glyphicon-zoom-in"></i>',
		                    zoomClass: 'btn btn-xs btn-default',
		                    zoomTitle: 'View Details',
		                    indicatorNew: '<i class="glyphicon glyphicon-hand-down text-warning"></i>',
		                    indicatorSuccess: '<i class="glyphicon glyphicon-ok-sign text-success"></i>',
		                    indicatorError: '<i class="glyphicon glyphicon-exclamation-sign text-danger"></i>',
		                    indicatorLoading: '<i class="glyphicon glyphicon-hand-up text-muted"></i>',
		                    indicatorNewTitle: 'Not uploaded yet',
		                    indicatorSuccessTitle: 'Uploaded',
		                    indicatorErrorTitle: 'Upload Error',
		                    indicatorLoadingTitle: 'Uploading ...'
		                },
		                layoutTemplates: {

		                    actions: '{drag}\n' +
		                    '<div class="file-actions">\n' +
		                    '    <div class="file-footer-buttons">\n' +
		                    '        {upload} {delete} {zoom} {other}   ' +
		                    '    </div>\n' +
		                    '    <div class="clearfix"></div>\n' +
		                    '</div>'


		                },
		         })
		        $('#template').find('input.maindata').each(function(i,dom){
		  	      var _name=$(dom).attr('name')
		  	      var _value=$(dom).attr('value')

		  	      var  $_item = $('#addOrUpdfrom').find('[name='+_name+']')
		  	      if($_item.size()>0   ){
		  	    	  var _type=$_item.attr('type')


		  	    	//  if(_value!=null && _value != ''){

		  	    		if(!$_item.eq(0).is('[type=checkbox]') && !$_item.eq(0).is('[type=radio]')){

		  	    		 if(_type!='file'){
		  	    		    $_item.val(_value)
		  	    		 }
		  	    		 $_item.attr('value',_value)
		  	    		}



		  	    		 if(_type =='file'){
				        	 var _val=_value
				        	 var test = /\/([^\/]*?\.[a-zA-Z]{0,4})/i;
				        	 var filename ;
                             if (_val && _val!='' && _val!='null' && _val!=null ) {
                                 if (test.exec(_val).length > 0) {
                                     filename = test.exec(_val)[1];
                                 }

                             }
// 		  	    			 $_item.after('<a style="display:inline-block;margin-top:10px;" href="javascript:void(0);" onclick="downfile(\''+filename+'\',\''+_value+'\')");return false;" title="点击下载">'+filename+'</a>');
		  	    		 }
		  	    	 // }
		  	    	  $(dom).parents('.form-group').find('.input-group-addon').find('.sbutton').removeAttr('disabled')
		  	    	  if($(dom).attr('_sfxg')=='0'){
		  	    	    $_item.attr('readonly',true)
			  	    	  if ( $(dom).parents('.form-group').find('.input-group-addon').find('.sbutton').size()>0){
							  $(dom).parents('.form-group').find('.input-group-addon').find('.sbutton').attr('disabled','true')
						  }
		  	    	  }else{

					  }
		  	      }else{
		  	    	$('#addOrUpdfrom').append($(dom))
		  	      }
		  	    })
		  	    var _count = 0;
		        $('#template').find('table[zbm]').each(function(i,dom){
		          var zbm=$(dom).attr('zbm')
		          $(dom).find('tr').each(function(i,tr){
		        	  var $appendTr=$('table[id=tr_template_'+zbm+']').find('tr').clone()
		              $appendTr.find('mytag2').addClass('data')
		              $appendTr.appendTo($('tbody[id=tbody_template_'+zbm+']'))
		        	  var _guid = guid();

		        	  $(tr).find('input').each(function(i,inp){
		        	  var _name=$(inp).attr('name')
		        	  $appendTr.find('[name='+_name+']').val($(inp).attr('value'))
		        	  $appendTr.find('mytag2[_name='+_name+']').trigger('loadmytag2',{value:$(inp).attr('value'),tr:$appendTr,_count:_guid})
		            })
		          })


		  	    })
                $('[_hidden=true]').hide()
                $('mytag').each(function(i,dom){
                	if($(dom).prev().is('input[type=checkbox],input[type=radio]')){
                		    var _name=$(dom).attr("name")
                            var sxmc=$(dom).attr("sxmc")
                            var sxdm=$(dom).attr("sxdm")
                            var valuearray=new Array()
                            var defvalues=$('input[type=hidden][name='+_name+']').val()

                            if (defvalues!=undefined){
                            	  valuearray=$('input[type=hidden][name='+_name+']').val().split(',')
                            }

                		   	var param={
			  	        	tablename:$(dom).attr("tablename"),
			  	        	sxmc:$(dom).attr("sxmc"),
			  	        	sxdm:$(dom).attr("sxdm"),
			  	        	zxxb_id:$(dom).attr("zxxb_id"),
			  	            }
                 		    var $clonecheckbox =$(dom).parents('.checkbox-inline,.radio-inline').clone()
                	  	    $.ajax({
      			  	        dataType: "json",
      			  	        type: "POST",
      			  	        async: false,
      			  	        data:param,
      			  	        url: '<%=path%>/Jsqlquery/queryCombobox',
      			  	        success : function (data) {

      			  	          $.each(data,function(i,d){
      			  	          var $newc =$clonecheckbox.clone()
      			  	          $newc.find('span').text(d[sxmc])
      			  	          $newc.find('input[type=checkbox],input[type=radio]').val(d[sxdm])
      			  	          if(valuearray.indexOf(d[sxdm])>=0){
      			  	        	$newc.find('input[type=checkbox],input[type=radio]').prop('checked',true)
      			  	          }
      			  	          $newc.find('mytag').remove()
      			  	          $(dom).parents('.zujian.form-group').append($newc )
      			  	          })
      			  	        }
      			       });
                		    $(dom).parents('.checkbox-inline').remove();
                		    $(dom).parents('.radio-inline').remove();
                	}
                })
		  	   $('mytag').each(function(i,dom){
		  		  var selecthtml=''
		  		  var $select
		  		  var defvalue
		  		 if($(dom).prev().prop('tagName')=='SELECT'){




		  		  if($(dom).prev().attr('name')==$(dom).attr('name')){
		  			  defvalue=$(dom).prev().attr('defvalue')
		  			  selecthtml=$(dom).prev().prop('outerHTML')

		  			 $select=$(selecthtml);
		  			 $select.html('')
		  			$(dom).prev().remove()
		  		  }
		  		  if ($(dom).attr('name')==undefined || $(dom).attr('name')==''|| null==$(dom).attr('name')){
		  			 $(dom).attr('name',$(dom).attr("sxdm"))
		  		  }
		    	  var label=$(dom).attr('label')
		    	  var $newDom=$("<div style='float:left;width:100%;'> </div>")
		    	     $select.attr({
		    		  tablename:$(dom).attr("tablename"),
		    		  sxdm:$(dom).attr("sxdm"),
		    		  sxmc:$(dom).attr("sxmc"),
		    		  csm:$(dom).attr("csm") ,
		    		  id:$(dom).attr("id"),
		    		  name:$(dom).attr("name")
		    	       })
		    	      if($select.attr("readonly")!='' && $select.attr("readonly")!=undefined && $select.attr("readonly")!=null ){
		    	    	  $select.attr('disabled',"true")
		    	      }
		    	  $newDom.append( $select)
		    	      if ($(dom).attr("ldmb")!=undefined && $(dom).attr("ldmb")!=''){
		    	        $newDom.find('select').attr('ldmb',$(dom).attr("ldmb"))
		    	      }

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
		    		  var $_tar=$('#'+$('select[ldmb='+$(dom).attr("id")+']').attr('id'))
		    		  var _otherparam=$_tar.attr('otherparam')
		    	  }
		    	  $.ajax({
			  	        dataType: "json",
			  	        type: "POST",
			  	        async: false,
			  	        data:param,
			  	        url: '<%=path%>/Jsqlquery/queryCombobox',
			  	        success : function (data) {

			  	        	 $newDom.find('select').append('<option value="">--请选择--</option>');
			  	        	 $.each(data,function(i,o){
			  	        	  var selected=''
			  	        	  var _v =$('#template').find('[name='+$newDom.find("select").attr('name')+']').eq(0).attr('value')
			  	        	  if (_v!='' && undefined!= _v ){
			  	        		defvalue=''
			  	        	  }
			  	        	  if(o[$(dom).attr('sxdm')]==_v  || (o[$(dom).attr('sxdm')]==defvalue && defvalue!='') ){
			  	        		selected='selected'
			  	        	  }
			  	              var $_options=$('<option '+selected+' value="'+o[$(dom).attr('sxdm')]+'"> '+o[$(dom).attr('sxmc')]+'</option>')

			  	                  $_options.html(o[$(dom).attr('sxmc')])
			  	                  $newDom.find('select').append($_options)
			  	        	  })
			  	        }
			       });

		    	  if($(dom).attr('ldmb')!=undefined && $(dom).attr('ldmb')!=''){

		    		  $newDom.find('select[ldmb]').on('change',function(){
		    			 var _otherparam=$(this).attr('otherparam')
		    		     var $_target=$('#'+$(dom).attr('ldmb'))
		    		     var  defvalue= $_target.attr('defvalue')
	
		    			 var data={
				  	        	tablename:$_target.attr("tablename"),
				  	        	sxmc:$_target.attr("sxmc"),
				  	        	sxdm:$_target.attr("sxdm"),
				  	        	zxxb_id:$(dom).attr("zxxb_id"),
				  	        	csm:$(dom).attr("csm"),
				  	        	csz: $newDom.find('select').val()
				  	       }
		    			  if(_otherparam!=undefined){
		    			  var params  =""

		    			  var paramArray=_otherparam.split('\n')
		    			  $.each(paramArray,function(i,v){
		    				var obj = v.split(':')
		    				    if(obj.length>1){
		    				    params+=obj[0]+","
		    				    data['csz']+=","+$('#'+obj[1]).val()
		    				    data[obj[0]]=$('#'+obj[1]).val()
		    				    }
		    			     })
		    			        data.csm=params+$(dom).attr("csm")
		    			  }
		    			  data[$(dom).attr("csm")]=$newDom.find('select').val()
		    			  $_target.html('')
		    			   if(undefined!=$_target.attr("tablename") && $(dom).attr('ldmb')!='' && $(dom).attr('ldmb')!=undefined ){
			   		       $.ajax({
					  	        dataType: "json",
					  	        type: "POST",
					  	        data: data,
					  	        url: '<%=path%>/Jsqlquery/queryCombobox',
					  	        success : function (data) {
					  	        	 $_target.append('<option value="">--请选择--</option>');
					  	        	 $.each(data,function(i,o){
						  	        	  var _v =$('#template').find('[name='+$_target.attr('name')+']').eq(0).attr('value')

				  	        		       var selected=''
				  	        		    	 if (_v!='' && undefined!= _v ){
				 			  	        		defvalue=''
				 			  	        	  }
						  	        	  if(o[$_target.attr('sxdm')]==_v  || (o[$_target.attr('sxdm')]==defvalue && defvalue!='') ){
						  	        		selected='selected'
						  	        	  }
					  	              var $_options=$('<option '+selected+' value="'+o[$_target.attr('sxdm')]+'"> '+o[$_target.attr('sxmc')]+'</option>')
					  	                  $_target.append($_options)
					  	        	  })
					  	        }
					       });
		    		    }
		    		  })
		    	  }
		    	  $(dom).replaceWith($newDom);
		  	   }
		     })

		       $('.selectpicker').find('select').attr('multiple','multiple');
					 $('.selectpicker').find('select').each(function(i,dom){
						 if( $(dom).find('option:first').text()=='--请选择--'){
							 $(dom).find('option:first').remove()
	                      }
						var _name = $(dom).attr('name')
	                    var _val =  $('[name='+_name+'].maindata').val()
	                       _val=','+_val+','
	                      $('.selectpicker').find('select[name='+_name+']').find('option').each(function(i,option){
	                    	   if (_val.indexOf(  $(option).attr('value')) >0){
	                    		   $(option).attr('selected','selected')
	                    	   }
	                      })
					 })
					 $('#addOrUpdfrom').find('.checkbox-inline').find('input').each(function(i,dom){
						var _name = $(dom).attr('name')
	                    var _val =  $('[name='+_name+'].maindata').val()
	                       _val=','+_val+','
	                       $('#addOrUpdfrom').find('.checkbox-inline').find('input[name='+_name+']').each(function(i,option){
	                    	   if (_val.indexOf(  $(option).attr('value')) >0){
	                    		   $(option).attr('checked','checked')
	                    	   }
	                      })
					 })
					 $('.selectpicker').find('select').selectpicker({
						 noneSelectedText:'--请选择--',
						 tickIcon:'glyphicon-ok  '
					 })
		  	    if(!${empty sfbcan}){
		  	    	 $('.form-control').each(function(i,formcontrol){
		  	    		 var shyj = $(formcontrol).attr("id");//审核意见
		  	    		 if(shyj != '_lsshyj'){
			  	    		 var _val=$(formcontrol).val()
	                         var $newp
			  	    		 if($(formcontrol).prop('tagName')=='SELECT'){
			  	    			_val=$(formcontrol).find('option:selected').eq(0).text()
			  	    		 }
			  	    		 $newp='<p class="form-control-static">'+_val+'</p>'
			  	    		 $(formcontrol).replaceWith($newp);
		  	    		 }
		  	    	 })
		  	    }
		        $('.form_yearyear').datetimepicker({
		            format: 'yyyy',
		             weekStart: 1,
		             autoclose: true,
		             startView: 4,
		             minView: 4,
		             forceParse: false,
		             language: 'zh-CN'
		        }).on('hide',function(e) {

		        	  $("#addOrUpdfrom").data('bootstrapValidator').destroy();
		              $('#addOrUpdfrom').data('bootstrapValidator', null);
		  			var bootstrapValidator = $("#addOrUpdfrom").data('bootstrapValidator');
				     bootstrapValidator.validate();
					 if(bootstrapValidator.isValid()){
							if(Validator.Validate(document.getElementById('addOrUpdfrom'),3)){
							}}

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
		        }).on('hide',function(e) {
		        	  $("#addOrUpdfrom").data('bootstrapValidator').destroy();
		              $('#addOrUpdfrom').data('bootstrapValidator', null);
		  			var bootstrapValidator = $("#addOrUpdfrom").data('bootstrapValidator');
				     bootstrapValidator.validate();
					 if(bootstrapValidator.isValid()){
							if(Validator.Validate(document.getElementById('addOrUpdfrom'),3)){
					 }}

              });
		        $('.form_yearmonth').datetimepicker({

		             weekStart: 1,
		             autoclose: true,
		             startView: 3,
		             minView: 3,
		             forceParse: false,
		             language: 'zh-CN'
		        }).on('hide',function(e) {

		        	  $("#addOrUpdfrom").data('bootstrapValidator').destroy();
		              $('#addOrUpdfrom').data('bootstrapValidator', null);
		  			var bootstrapValidator = $("#addOrUpdfrom").data('bootstrapValidator');
				     bootstrapValidator.validate();
					 if(bootstrapValidator.isValid()){
							if(Validator.Validate(document.getElementById('addOrUpdfrom'),3)){
							}}

              });

		    	$('.form_date').datetimepicker({
		    		language:'zh-CN',
		            weekStart: 1,
		            todayBtn:  1,
		    		autoclose: 1,
		    		todayHighlight: 1,
		    		startView: 2,
		    		minView: 2,
		    		forceParse: 0
		        }).on('hide',function(e) {
                    console.log($("#addOrUpdfrom").data('bootstrapValidator'));
                    if($("#addOrUpdfrom").data('bootstrapValidator')){
                        $("#addOrUpdfrom").data('bootstrapValidator').destroy();
					}


                    Validator.Validate(document.getElementById('addOrUpdfrom'),3)
		  			var bootstrapValidator = $("#addOrUpdfrom").data('bootstrapValidator');
                    console.log(bootstrapValidator)
					if(bootstrapValidator){
                        bootstrapValidator.validate();
                        bootstrapValidator.isValid()
                        Validator.Validate(document.getElementById('addOrUpdfrom'),3)
					}



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
		        }).on('hide',function(e){
		        	  $("#addOrUpdfrom").data('bootstrapValidator').destroy();
		              $('#addOrUpdfrom').data('bootstrapValidator', null);
		  			var bootstrapValidator = $("#addOrUpdfrom").data('bootstrapValidator');
				     bootstrapValidator.validate();
					 if(bootstrapValidator.isValid()){
							if(Validator.Validate(document.getElementById('addOrUpdfrom'),3)){
							}}
              });
		     $('.form_date').on('dp.change dp.show', function (e) {
		              // Revalidate the date when user change it
		              $('#addOrUpdfrom').bootstrapValidator('revalidateField', 'datetimePicker');
		      });
		     $('#addOrUpdfrom').bootstrapValidator();
		    });
		    
		    //#################################################################
			$('#loading-mess-message').html("");
			var randomNu = (new Date().getTime()) ^ Math.random();//解决IE缓存问题
			function A0EA8A3ExecuteDynamicSQL(Slsfytj){
				$('#_slsfytj').val(Slsfytj);
				$('#addOrUpdfrom').bootstrapValidator();
				var url = '<%=path%>/Jsqlquery/ExecuteDynamicSQL?_'+randomNu;
		        $('#addOrUpdfrom').find('table tbody tr td').each(function(i,dom){
					$(dom).find(".form-control-feedback:gt(0)").remove();
		        })

// 		            $('#addOrUpdfrom').find('input[type=checkbox]:checked').each(function(i,hiddom){
// 							var _name=$(hiddom).attr('name')


// 								var _value=$('#addOrUpdfrom').find('[type=text][name='+_name+']').val()
// 								$('#addOrUpdfrom').find('[type=hidden][name='+_name+']').remove()

// 					})
// 		        	$('#addOrUpdfrom').find('input[type=checkbox]:checked').each(function(i,hiddom){
// 							var _name=$(hiddom).attr('name')

// 							if ($('#addOrUpdfrom').find('[type=hidden][name='+_name+']').size()==0){

// 								$('#addOrUpdfrom').append('<input type=hidden value='+$(hiddom).val()+' name='+_name+' >')
// 							}else{
// 								var _value=$('#addOrUpdfrom').find('[type=hidden][name='+_name+']').val()
// 								$('#addOrUpdfrom').find('[type=hidden][name='+_name+']').val(_value+","+$(hiddom).val())
// 							}
// 					})
// 					$('#addOrUpdfrom').find('input[type=checkbox]:checked').attr('disabled',true)

				var bootstrapValidator = $("#addOrUpdfrom").data('bootstrapValidator');
				      bootstrapValidator.validate();
				 if(bootstrapValidator.isValid()){
					if(Validator.Validate(document.getElementById('addOrUpdfrom'),3)){
						if(confirm("您确定要执行操作么吗？") == true){
							$('#addOrUpdfrom').find('input,select,textarea').removeAttr('disabled');
							$('._eWebEditer').each(function(i,dom){
								var  textareaid=$(dom).attr('id')
								var  iframeId=textareaid+'Iframe'
								var o_Editor = document.getElementById(iframeId).contentWindow;
								$('#'+textareaid).val(o_Editor.getText())
							})





                            var _$form = $('#addOrUpdfrom').clone(true)
                            _$form.attr("id","cloneaddOrUpdfrom")
                            console.log(_$form);
                            _$form.find('[name]').each(function (i, dom) {
								if($(dom).is('[multiple]')){
                                    var str =""
                                    str = ""+$(dom).selectpicker('val');

                                    var $hideInput = $('<input type="hidden"  name="'+$(dom).attr('name')+'" value="'+str+'" ></input>')
                                    $(dom).replaceWith($hideInput)
                                }

                            })
                            var form = new FormData(_$form[0]);

                            form.forEach(function(i,o){

                    /*        	 if(form.getAll(o).length>1 && $('#addOrUpdfrom').find('[multiple][name='+o+'],[type=checkbox][name='+o+']').size()>0){
                            		var array=form.getAll(o)
                            		var str =''
                            		    $.each(array,function(_i,_d){
                            		    	if (_i>0 ){
                            		    	str+=','+_d+''
                            		    	}else{
                            		    	str+=_d+''
                            		    	}
                            		    })
                            		    form.delete(o)
                            		    form.append(o,str)
                            	 }*/


                            })

						//	while(str=ds.next()){

						//	}
			 	        	$('#loading-mess-message').html("提交中，请稍候");
			 	        	$('#myModal').modal('show');
				    		$.ajax({
					 	        //traditional:true,//这使json格式的字符不会被转码
					 	        dataType:"json",
					 	        type: "POST",
						        data:form,
						        processData:false,
						        contentType:false,
					 	     	url:url,
					 	        success : function (data) {
					 	        	if(data.success){
						 	        	$('#loading-mess-message').html(data.message);
						 	        	$('#clickdiv').trigger('click')
						 	        	parentQueryLike()
						 	        	window.parent.parentQueryLike()
						 	        	$(window.frameElement).parents('.modal').find('.close').trigger('click')
						 	        	$('#addOrUpdfrom').find('input[type=checkbox]:checked').removeAttr('disabled')
						 	        	var tree_id=$(window.parent.document).find('#TREE_PID').val()
						 	            if(tree_id!='' && tree_id!=undefined){
						 	            	if(data.result[tree_id]!='' && data.result[tree_id]!=undefined){
						 	            		var data_tt_id=$(window.parent.document).find('tr[data-tt-id$='+data.result[tree_id]+']').eq(0).attr('data-tt-id')
						 	            		$.cookie('tree_data_tt_id', data_tt_id);
						 	            	}
						 	            }
						 	        	//document.location.reload()
					 	        	}else {
					 	        		$('#loading-mess-message').html(data.message);
					 	        	}
					 	        },
					 	        error : function (data){
					 	        	$('#loading-mess-message').html(data.responseText);
					 	        }
				 	    	});
						}
					}

				 }
			}
		      function setIframeHeight(id){
		    	    var wHeight =(window.innerHeight || (window.document.documentElement.clientHeight || window.document.body.clientHeight));
		      	    var wWidth = (window.innerWidth || (window.document.documentElement.clientWidth || window.document.body.clientWidth));
		    	    $('#'+id).on('load',function(){
		    	    	var iframe = document.getElementById(id);
		    	    	var  _height=iframe.contentDocument.body.scrollWidth//iframe.contentDocument.body.scrollHeight
		    	    	var _width=iframe.contentDocument.body.scrollWidth
                        console.log("_height");
                        console.log(_height);

                        $('#'+id).animate({
		              	    'max-height':(wHeight-180)+'px',
		                    'max-width':(wWidth-60)+'px',
		                    'min-width':(1110)+'px',
		                    'width':(_width)+'px',
		                    'height':(_height)+'px'
		                });
		                $('#'+id).parents('.modal-dialog,.modal-content').animate({
		            	 	'width':(_width+30)+'px',
		                  	'height':(_height+100)+'px',
		                 	'max-height':(wHeight-80)+'px',
		                  	'max-width':(wWidth-30)+'px',
		                 	'min-width':(1140)+'px',
		               });

		    	    })
		            return false
		      }
		</script>
	</head>
	<body   onload="closesLoading();">
	<!-- 加载条 -->
	<div id="loading" class="loading"  style="display:block;">
		<div id="loading-center" class="loading-center" >
			<div id="loading-center-absolute" class="loading-center-absolute">
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
		<!--  -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12   ptpb">
					<form class="form-horizontal" data-bv-message="This value is not valid"
			  	  	       data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
			  	  		   data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
			  	  		   data-bv-feedbackicons-validating="glyphicon glyphicon-refresh" name="addOrUpdfrom" method="post" id="addOrUpdfrom" enctype="multipart/form-data">
			  	  	<input type="hidden" id="token" name="token" value="${token}" />
					<input name="_sqltype" value="${sqltype}" type="hidden"/>
					<input name="_zxxb_id" value="${zxxb_id}" type="hidden"/>
					<input name="_gnid" value="${gnid}" type="hidden"/>
					<input name="_tablename" value="${tablename}" type="hidden"/>
					<input name="_slsfytj" type="hidden" id="_slsfytj"/>
					${html_code}
					 <!-- 原值-->
					 <c:forEach items="${updRowMap.rowData}" var="row">
					 	<input type="hidden" name="_OLD_${row.name}" value="${row.value}" />
					 </c:forEach>
					<!-- 主键 -->
					 <c:forEach items="${updRowMap.newMap}" var="zj">
					 	<input name="_ID_${zj.key}" value="${zj.value}" type="hidden"/>
					 </c:forEach>

					 <!-- 1对n表 -->
					 <c:forEach items="${ywbList}" var="y">
						<table  class="table table-bordered bot_line" id="">
					         <thead>
					          <tr>
					            <c:forEach items="${y.ywbcol}" var="t">
					            <c:if test="${t.html_lx ne 'hidden'}">
					            	 <th <c:if test="${!empty t.width}"> width="${t.width}px;"</c:if>>${t.colbm}</th>
					            </c:if>
					            </c:forEach>
					             <c:if test="${empty sfbcan}">
					            <th><button type="button" class="btn btn-primary" onclick="javascript:appandTr('tr_template_${y.bm}','tbody_template_${y.bm}');">新增</button></th>
					          	</c:if>
					          </tr>
					         </thead>
					         <tbody id="tbody_template_${y.bm}"></tbody>
						</table>
					 </c:forEach>
					</form>
				</div>
			</div>
			
			<c:choose>
				<c:when test="${empty sfbcan and empty sfbcan1}">
					<div class="row">
						<div class="col-md-12">
						   <div class="modal-footer">

						   	 <c:choose>
						   	 	<c:when test="${not empty gzlywdmxx}">
						   	 		<button type="button" class="btn btn-primary" onclick="javascript:A0EA8A3ExecuteDynamicSQL('0');">保存</button>
						   	 		<button type="button" class="btn btn-primary" onclick="javascript:A0EA8A3ExecuteDynamicSQL('1');">保存并提交</button>
						   	 	</c:when>
						   	 	<c:otherwise>
						   	 	<button type="button" class="btn btn-primary" onclick="javascript:A0EA8A3ExecuteDynamicSQL('0');">保存</button>
						   	 	</c:otherwise>
						   	 </c:choose>

						   </div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<c:if test="${gnMap.djsj eq 'onSh'}">
					<div class="row">
						<div class="col-md-12">
						   <div>
						   		<textarea class="form-control" id="_lsshyj" name="_lsshyj"></textarea>
						   	</div>
						   <div class="modal-footer">
					   	 		<button type="button" class="btn btn-primary" onclick="javascript:tongguo();">通过</button>
					   	 		<button type="button" class="btn btn-primary" onclick="javascript:butongguo();">驳回</button>
						   </div>
						</div>
					</div>
					</c:if>
					<c:if test="${gnMap.djsj eq 'onDetailToEx'}">
						<button type="button" class="btn btn-primary" onclick="javascript:A0EA8A3ExecuteDynamicSQL('0');">保存</button>
					</c:if>
				</c:otherwise>
			</c:choose>

			<c:if test="${not empty shywlcxx}">
				<table  class="table table-bordered bot_line" id="">
					<thead>
						<tr>
							<th>节点名称</th>
							<th>审核人</th>
							<th>审核时间</th>
							<th>审核状态</th>
							<th>审核意见</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${shywlcxx}" var="m">
						<tr>
							<td>${m.lsjdmc}</td>
							<td>${m.lsshrxm}</td>
							<td>${m.lsshsj}</td>
							<td>${m.lsshztxsmc}</td>
							<td>${m.lsshyj}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
		</div>
		<!-- 弹出层 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
			<div class="modal-dialog" role="document" style="width:500px">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel_2222">信息提示</h4>
					</div>
					<div class="modal-body" id="loading-mess-message"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>

	</body>
<!-- 弹出层 -->
<div class="modal fade" id="onAdd" tabindex="-1" data-backdrop="static"  data-keyboard="false" role="dialog" aria-labelledby="myModalLabel" >
	<div class="modal-dialog" role="document" style="width:100%;">
		<div class="modal-content">
			<div  class="loading"  style="display:block;opacity: 1;">
				<div id="modloading-center" class="loading-center" >
					<div id="modloading-center-absolute" class="loading-center-absolute">
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
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel"></h4>
			</div>
<!-- 			<div class="seled" style="max-height:40px; overflow-y: scroll"></div> -->
			<iframe id="tabid_add"name="tabid_add" scrolling="yes" src="" border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%;" frameborder="0" allowTransparency="true"></iframe>
		</div>
	</div>
</div>
 <div  id="clickdiv" style="display:none"></div>
 <script type="text/javascript">
	//审核通过
	function tongguo(){
		var url="<%=path%>/gzlshywlc/updShywlcShtg";
		var param={'dbjddm':'${dqlcsl.dshjddm}','ywlcdm':'${dqlcsl.ywlcdm}','ywlcslid':'${dqlcsl.ywlcslid}','lsshyj':$('#_lsshyj').val()};

		if(confirm("您确定要执行操作么吗？") == true){
	       	$('#loading-mess-message').html("提交中，请稍候");
	       	$('#myModal').modal('show');
			$.post(url,param,function(result){
				if(result.jg=='1'){
	 	        	$('#loading-mess-message').html("审核通过");
	 	        	$('#clickdiv').trigger('click')
	 	        	parentQueryLike()
	 	        	window.parent.parentQueryLike()
	 	        	$(window.frameElement).parents('.modal').find('.close').trigger('click')
	 	        	$('#addOrUpdfrom').find('input[type=checkbox]:checked').removeAttr('disabled')
	 	        	var tree_id=$(window.parent.document).find('#TREE_PID').val()
	 	            if(tree_id!='' && tree_id!=undefined){
	 	            	if(data.result[tree_id]!='' && data.result[tree_id]!=undefined){
	 	            		var data_tt_id=$(window.parent.document).find('tr[data-tt-id$='+data.result[tree_id]+']').eq(0).attr('data-tt-id')
	 	            		$.cookie('tree_data_tt_id', data_tt_id);
	 	            	}
	 	            }
				}else{
					$('#loading-mess-message').html(result.error);
				}
			});
		}
	}
	//审核不通过
	function butongguo(){
		var url="<%=path%>/gzlshywlc/updShywlcShbtg";
		var param={'dbjddm':'${dqlcsl.dshjddm}','ywlcdm':'${dqlcsl.ywlcdm}','ywlcslid':'${dqlcsl.ywlcslid}','lsshyj':$('#_lsshyj').val()};
		if(confirm("您确定要执行操作么吗？") == true){
	       	$('#loading-mess-message').html("提交中，请稍候");
	       	$('#myModal').modal('show');
			$.post(url,param,function(result){
				if(result.jg=='1'){
	 	        	$('#loading-mess-message').html("审核驳回");
	 	        	$('#clickdiv').trigger('click')
	 	        	parentQueryLike()
	 	        	window.parent.parentQueryLike()
	 	        	$(window.frameElement).parents('.modal').find('.close').trigger('click')
	 	        	$('#addOrUpdfrom').find('input[type=checkbox]:checked').removeAttr('disabled')
	 	        	var tree_id=$(window.parent.document).find('#TREE_PID').val()
	 	            if(tree_id!='' && tree_id!=undefined){
	 	            	if(data.result[tree_id]!='' && data.result[tree_id]!=undefined){
	 	            		var data_tt_id=$(window.parent.document).find('tr[data-tt-id$='+data.result[tree_id]+']').eq(0).attr('data-tt-id')
	 	            		$.cookie('tree_data_tt_id', data_tt_id);
	 	            	}
	 	            }
				}else{
					$('#loading-mess-message').html(result.error);
				}
			});
		}
	}
 </script>
</html>
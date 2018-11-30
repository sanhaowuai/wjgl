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
		<title>${updRowMap }</title>

		<link rel="stylesheet" href="<%=path%>/resources/js/bootstrapvalidator-master/dist/css/bootstrapValidator.css"/>
		<link rel="stylesheet" href="<%=path%>/resources/js/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css"/>
		<link href="<%=path%>/resources/js/bootstrap-fileinput-master/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css"/>
		<link href="<%=path%>/resources/js/bootstrap-fileinput-master/themes/explorer/theme.min.css" media="all" rel="stylesheet" type="text/css"/>

		<c:if test="${ymcss eq '1' }">
		<jsp:include page="../../include/css-jsq-include-1.jsp"></jsp:include>
		</c:if>
		<c:if test="${ymcss eq '2'}">
		<jsp:include page="../../include/css-jsq-include-2.jsp"></jsp:include>
		</c:if>
		<c:if test="${ymcss eq '3' or empty ymcss }">
		<jsp:include page="../../include/css-jsq-include-3.jsp"></jsp:include>
		</c:if>

		<script src="<%=path%>/resources/style/bootstrap/js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/bootstrapvalidator-master/dist/js/bootstrapValidator.js"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js" ></script>
		<script src="<%=path%>/resources/js/ bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<script src="<%=path%>/resources/js/bootstrap-fileinput-master/js/fileinput.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/bootstrap-fileinput-master/js/locales/zh.js"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/bootstrap-fileinput-master/themes/explorer/theme.min.js"></script>
	    <script src="<%=path%>/resources/js/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
		<script type="text/javascript" src="<%=path%>/resources/js/jquery-easyui-1.5.1/plugins/jquery.parser.js"></script>
		<script src="<%=path%>/resources/js/jquery-easyui-1.5.1/plugins/jquery.resizable.js"></script>
		<style>
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
             [class*='col-']{
             padding-right: 5px;
             padding-left: 5px;
             }
            .formtitlebackground{
              background:#eeeeee;
              text-align:center
             }
            .panletable{margin:0 auto}

		</style>
		<!-- 加载条 -->
		<style>

		   .row{
		     margin-top:10px
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
		</style>
		<script>
		</script>
	</head>
	<body style="background:#f1f1f1">

		<div class="container-fluid">
			<div class="row" style="margin-top:0px">
				<div class="col-md-12">
				   	<c:forEach items="${param }"  var="tt">
				<c:if test="${  tt.key ne 'zxxb_id' }">
		         <input class="hiddenvalue"  name="${ tt.key }" value="${ tt.value }"  type="hidden"/>
				 </c:if>
		</c:forEach>
					${html_code}
				</div>
			</div>
		</div>

	</body>
<!-- 弹出层 -->


<!-- 弹出层 -->
<div class="modal fade" id="onAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel"></h4>
			</div>
			<div class="modal-body">
			<iframe id="tabid_add_parent" name="tabid_add_parent" scrolling="yes" src="" border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%;" frameborder="0" allowTransparency="true"></iframe>
			</div>
		</div>
	</div>
</div>
 <script type="text/javascript">
	var $_semp=$("<div class='temp123456789'></div>")
	 $_semp.css({
		 'position':'absolute',
		 'background':'#ffffdd',
		 'z-index':'9999999',
		 'filter':'alpha(Opacity=80)',
	     '-moz-opacity':'0.5',
	     'opacity': '0.5'
	 })

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

 var closeiframeForm= function(){}
 var queryLike= function(){}
 var _win
 var $_modal
 var onModelExecute= function(obj){}
 var parentQueryLike =function(){}
 var setparentwin=function(win ){
	 onModelExecute=win.onModelExecute
 }
 var onAddshow= function(id){

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
     		    $('#onAdd'+id).modal('show')
     	}
     };
        document.getElementById("form"+id).submit();
	    $('#onAdd'+id).find('.modal-dialog').resizable({
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
	        $(this).find('.modal-content').css({
	        	width:$(this).css('width'),
	        	height:$(this).css('height')
	        })
	        $(this).find('iframe').css({
	        	width:($(this).width()-40)+'px',
	        	height:($(this).height()-110)+'px',
	        })
	      },
	      onStopResize:function(){
	    	 $('.temp123456789').remove()
	      }
	    })
	$('#onAdd'+id).find('.modal-dialog').draggable({handle:'.modal-header'});
 }

    $(document).ready(function(){

    	$('.list-group-item[name]').hide()
    	$('.list-group').hide()
    	$('DIV[iframesrc]').each(function(i,dom){

    		if($(dom).find('H2').size()>0){
				$(dom).find('H2').remove()
			}
    		var iframesrc=$(dom).attr('iframesrc')

    		var $iframe=$('<iframe></iframe>')
    		 $iframe.attr('name',$(dom).attr('name'))
    		 if (iframesrc!=undefined && iframesrc!=''){
	    		 if($(dom).attr('sjqlx')=='2'||$(dom).attr('sjqlx')=='7'){
	    		    $iframe.attr('src','<%=path%>/Jsqlquery/htmlSelectCodeEngine/'+iframesrc)
	    		 }else if($(dom).attr('sjqlx')=='3'||$(dom).attr('sjqlx')=='6'){
	    		    $iframe.attr('src','<%=path%>/Jsqlquery/htmlInsertCodeEngine?zxxb_id='+iframesrc+'&sqltype=insert&tablename=jsq_sql_ymgn')
	    		 }

    		 }else{
    			 $iframe.attr('src','')
    		 }
    		 $iframe.css({
    		     border:'0px',
    			 width:"100%",
    			 height:"100%",
    			 background:"#ffffff",
    			 "box-shadow":"1px 1px 2px #777777"
    		 })
    		 $(dom).append($iframe)
    		 $iframe.load(function(){
    			 var $hv=$('input.hiddenvalue').clone();
    			 var _this=this
    			 $hv.each(function(i,dom){
    				 var _name=$(dom).attr('name')
    				 var $input
    				 $input =$(_this.contentDocument).find('form[name=queryform]').find("[name="+_name+"]")
    				 if  ( $input.size()==0){

    					 $(_this.contentDocument).find('form[name=queryform]').append(dom)
    				 }else{
    					 $input.attr('value',$(dom).val())
    				 }
    				 $input =$(_this.contentDocument).find('form[name=addOrUpdfrom]').find("[name="+_name+"]")
    				 if  ( $input.size()==0){

    					 $(_this.contentDocument).find('form[name=addOrUpdfrom]').append(dom)
    				 }else{
    					 $input.attr('value',$(dom).val())
    				 }

    			 })
    		 })
    	})
    $('DIV[iframesrc]').each(function(i,dom){

    })
    })

    function setSize(iframe ,id ){
    	var wHeight =(window.innerHeight || (window.document.documentElement.clientHeight || window.document.body.clientHeight));
    	var wWidth = (window.innerWidth || (window.document.documentElement.clientWidth || window.document.body.clientWidth));
    	var _width =600
    	if  (_width < (iframe.contentDocument.body.scrollWidth+40) ) {
    		_width=(iframe.contentDocument.body.scrollWidth+40)
    	}
  		$('#onAdd'+id).find('.modal-content,.modal-dialog').css({
          	'width':(_width)+'px',
          	'height': (iframe.contentWindow.document.documentElement.scrollHeight+100)+'px',
         	'max-height':(wHeight-80)+'px',
          	'max-width':(wWidth-40)+'px',

          });
      	$('#tabid_add'+id).css({
      		'max-height':(wHeight-180)+'px',
          	'max-width':(wWidth-60)+'px',
            'width':(_width-40)+'px',
            'height':(iframe.contentDocument.body.scrollHeight)+'px'
          });

    }
//     function openiframetr(iframes,data){
//     	 var $submitform=$('<form method="post" ></form>')

//      	     //  $submitform.append(data)
//        $.each(iframes,function(i,iframename){

//                 $submitform.html('')
//                 $.each(data,function(i,doms){
//     	    	  if (iframename.duiying!=undefined){
//     	    	  $.each( iframename.duiying,function(i,d ){
//     	    		  if($(doms).attr('name')==d.value){
//     	    			  var $clones=$(doms).clone()
//     	    			  $clones.attr('name',d.field)
//     	    			  $submitform.append($clones)
//     	    		  }

//     	    	  })
//     	    	  }
//     	       })
//     	    	$submitform.append('<input type="hidden" name="zxxb_id" ></input>')
//         	    $submitform.attr('name',iframename.value)
//         	    $submitform.find('[name=zxxb_id]').val(iframename.value)
<%--         	    $submitform.attr('action','<%=path%>/Jsqlquery/htmlSelectCodeEngine'); --%>
//         	    $submitform[0].target=iframename.value; //当点击查询按钮才处理时间
//         	    $submitform[0].submit();
//          })

//     }
function setIframeHeight(id){
    var wHeight =(window.innerHeight || (window.document.documentElement.clientHeight || window.document.body.clientHeight));
	    var wWidth = (window.innerWidth || (window.document.documentElement.clientWidth || window.document.body.clientWidth));

    $('#'+id).on('load',function(){
    var iframe = document.getElementById(id);
	var  _height=iframe.contentWindow.document.documentElement.scrollHeight//iframe.contentDocument.body.scrollHeight
	var _width=iframe.contentDocument.body.scrollWidth
        $('#'+id).animate({
      	    'max-height':(wHeight-180)+'px',
            'max-width':(wWidth-120)+'px',
            'min-width':(1100)+'px',
            'width':(_width)+'px',
            'height':(_height)+'px'
        });
        $('#'+id).parents('.modal-dialog,.modal-content').animate({
    	 	'width':(_width+30)+'px',
          	'height':(_height+100)+'px',
         	'max-height':(wHeight-80)+'px',
          	'max-width':(wWidth-110)+'px',
         	'min-width':(1140)+'px',
       });

    })
    return false
}
    function openiframe(win,data ,_data ){
    var	taregtwidow=_data.target
    var	taregturl = _data.openwindow
    var	duiyinggx =_data.duiyinggx
    var	pageurl   =_data.url
    if(_data.url=='htmlSelectCodeEngine'){
    	pageurl = pageurl+'/'+_data.openwindow;
    }

   	 var $submitform=$('<form method="post" ></form>')
      	      $submitform.append(data)
              $submitform.html('')
              $.each(data,function(i,doms){
            	  if (_data.url=='htmlSelectCodeByIDEngine'){

       	    		  $submitform.append($(doms).clone())
       	    		 }
   	    	  if (duiyinggx!=undefined){
   	    	  $.each( duiyinggx,function(i,d ){
   	    		  if($(doms).attr('name')==d.value ){
   	    			  var $clones=$(doms).clone()
   	    			  $clones.attr('name',d.field)
   	    			  $submitform.append($clones)
   	    		   }
   	    	  })
   	    	  }
   	       })
  	        if (_data.windowtype=='edit'){
  	    		$submitform.append($('<input type="hidden" name="sqltype" value="update" />'))
  	    	 	$submitform.append($('<input type="hidden" name="tablename" value="jsq_sql_lbgn" />'))
    	    }else  if (_data.windowtype=='add'){
  	    		$submitform.append($('<input type="hidden" name="sqltype" value="insert" />'))
  	    	 	$submitform.append($('<input type="hidden" name="tablename" value="jsq_sql_ymgn" />'))
    	    }else if (_data.windowtype=='view'){
    	    	$submitform.append('<input type="hidden" name="sfbcan" value="0"/>');
    	        $submitform.append($('<input type="hidden" name="sqltype" value="insert" />'))
  	    	 	$submitform.append($('<input type="hidden" name="tablename" value="jsq_sql_ymgn" />'))
    	    }

	    	$submitform.append('<input type="hidden" name="zxxb_id" ></input>')
       	    $submitform.attr('name',taregtwidow)
       	    $submitform.find('[name=zxxb_id]').val(taregturl)
       	    $submitform.attr('action','<%=path%>/Jsqlquery/'+pageurl);
       	    $submitform.attr('target',taregtwidow); //当点击查询按钮才处理时间
        	$submitform.appendTo('body')
       	    $submitform[0].submit();
       	    $('iframe[name='+taregtwidow+']').load(function(){
       	    	$('#clickdiv',this.contentDocument).on('click',function(){
       	    		  window.frames[win.name].queryLike()
       	    		//  win.queryLike()
       	    	})
       	    })
       	 $submitform.remove()
   }
 </script>
</html>
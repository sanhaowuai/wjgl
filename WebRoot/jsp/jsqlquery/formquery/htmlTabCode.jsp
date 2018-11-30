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
            .formtitlebackground{
              background:#eeeeee;
              text-align:center
             }
            .panletable{margin:0 auto}

		</style>
		<!-- 加载条 -->
		<style>
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
			  font-size: 10px;
			}
		</style>
		<script>
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
		    $(document).ready(function(){
		    	$('div.tab-pane').find('iframe').each(function(i,iframes){
		    		 var $iframe=$(iframes)
		    		 var _src =  $iframe.attr('src')
		    		 var xmm=_src.split('/')[0]
		    		  if (xmm=='') {
		    			  xmm=_src.split('/')[1]
		    		  }
	    		     var wHeight =(window.innerHeight || (window.document.documentElement.clientHeight || window.document.body.clientHeight));
		    		 
	    		  	 var wWidth = (window.innerWidth || (window.document.documentElement.clientWidth || window.document.body.clientWidth));
                  
		    	      

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
		    				 $input =$(_this.contentDocument).find('form.form-horizontal[name=addOrUpdfrom]').find("[name="+_name+"]")
		    				 if  ( $input.size()==0){
		    				 
		    					 $(_this.contentDocument).find('form.form-horizontal[name=addOrUpdfrom]').append(dom)
		    				 }else{
		    					 $input.attr('value',$(dom).val())
		    				 }
		    			 })
		    		 })
		    		   $iframe.css({
		    		  		width:'100%',
		    		  		height:wHeight-100
		    		  	})
		    	 	 _src = _src.replace('/'+xmm,'<%=path%>')
		    		 $iframe.attr('src',_src)
		    	})
		    })
	    	
		</script>
		<!-- 1对多tr模板 -->
		
	<script type="text/javascript">

		</script>
	</head>
	<body onload="closesLoading();">
			   	<c:forEach items="${param }"  var="tt">
				<c:if test="${  tt.key ne 'zxxb_id' }">
		         <input class="hiddenvalue"  name="${ tt.key }" value="${ tt.value }"  type="hidden"/>
				 </c:if>
		</c:forEach>
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
		 
		<!--  -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12   ptpb">
 
					${html_code}
	 
				</div>
			</div>
	 
		</div>
		 
		 
	</body>
 
</html>
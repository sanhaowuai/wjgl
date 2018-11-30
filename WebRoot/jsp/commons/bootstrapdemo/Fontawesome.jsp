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
<title>北京赢科后台管理系统</title>
<jsp:include page="../../include/css-boostrap-include.jsp"></jsp:include>
<style type="text/css">
  html, body { height:100%; }
  .Contentbox { width:100%; min-height:100%;height:auto }
  *html .Contentbox { height:100% }
/*基本样式*/  
.docs-header{background-color: #ebebeb;padding: 20px 15px 40px;margin-top:-15px;font-size:13px;margin-top: -10px;}
.docs-container{padding:0 15px;}
.docs-title{padding:10px 0; border-bottom:1px solid #ebebeb;}
.docs-detail{ font-size:13px;margin:10px 0;line-height: 26px;}
.docs-example {
    background-color: #fff;
    border-color: #ddd;
    border-radius: 4px 4px 0 0;
    border: 1px solid #e1e1e8;
    border-bottom:0;
    padding:15px;
    margin-top:5px;
    overflow:hidden;
}
.docs-example h5{margin-top:0;}
.bs-glyphicons{overflow:hidden;}
.bs-glyphicons-list {list-style: outside none none;padding-left: 0;}
.bs-glyphicons li {background-color: #fff;border: 1px solid #f5f5f5;float: left;font-size: 13px;line-height: 1.4;padding: 10px;padding-left:15px;text-align: left;width: 25%;}
.bs-glyphicons-list li a{color:#838c98;}
.bs-glyphicons-list li:hover{ background:#63c5ea;}
.bs-glyphicons-list li:hover a,
.bs-glyphicons-list li:hover a .text-muted{color:#fff;}



/*代码格式*/
code {background-color: #fce9ef;border-radius: 4px;color: #c7254e;font-size: 90%;padding: 3px 8px;margin:0 3px;}
.docs-example + .highlight{border-radius: 0 0 4px 4px;}
.highlight {background-color: #f7f7f9;border: 1px solid #e1e1e8;border-radius: 4px;margin:0 0 15px;padding: 9px 14px;}
.highlight pre {
    background-color: transparent;
    border: 0 none;
    margin-bottom: 0;
    margin-top: 0;
    padding: 0;
    white-space: nowrap;
    word-break: normal;
}
.highlight pre code:first-child {display: inline-block;padding-right: 45px;}
.highlight pre code {color: #333;}
.nt {color: #2f6f9f;/*标签颜色*/}
.na {color: #4f9fcf;/*属性颜色*/}
.s {color: #d44950;/*类名颜色*/}
.info{color:#487E48;}
a.docs_link{ color:#4f9fcf;}
a.docs_link:hover{text-decoration: underline;}

/**/

</style>
  <script type="text/javascript">
  $(document).ready(function(){
	  $("a").click(function(){
		  var type=$(this).attr("type");
		  opener.resultIcon(type);
		 window.close();
	  });
});
  

  </script>
</head>
<body>
<div class="Contentbox">
 <div class="mainbg"></div>
  <div class="pd10">    
    <div class="docs-header">
      <h1>Font Awesome 4.4.0字体图标</h1>
      <p>字体图标的最佳集合。提供可伸缩矢量图标，可以立即进行定制大小、颜色、阴影，所有都可以用CSS样式来完成。</p>
    </div>
    <div class="docs-container">
      <h3 class="docs-title">Web应用程序图标</h3>
      <div class="bs-glyphicons">
      <ul class="bs-glyphicons-list">
        <li><a type="fa fa-adjust"><i class="fa fa-adjust"></i> adjust</a></li>
        <li><a type="fa fa-anchor"><i class="fa fa-anchor"></i> anchor</a></li>
        <li><a type="fa fa-archive"><i class="fa fa-archive"></i> archive</a></li>
        <li><a type="fa fa-area-chart"><i class="fa fa-area-chart"></i> area-chart</a></li>
        <li><a type="fa fa-arrows"><i class="fa fa-arrows"></i> arrows</a></li>
        <li><a type="fa fa-arrows-h"><i class="fa fa-arrows-h"></i> arrows-h</a></li>
        <li><a type="fa fa-arrows-v"><i class="fa fa-arrows-v"></i> arrows-v</a></li>
        <li><a type="fa fa-asterisk"><i class="fa fa-asterisk"></i> asterisk</a></li>
        <li><a type="fa fa-at"><i class="fa fa-at"></i> at</a></li>
        <li><a type="fa fa-automobile"><i class="fa fa-automobile"></i> automobile <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-balance-scale"><i class="fa fa-balance-scale"></i> balance-scale</a></li>
        <li><a type="fa fa-ban"><i class="fa fa-ban"></i> ban</a></li>
        <li><a type="fa fa-bank"><i class="fa fa-bank"></i> bank <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-bar-chart"><i class="fa fa-bar-chart"></i> bar-chart</a></li>
        <li><a type="fa fa-bar-chart-o"><i class="fa fa-bar-chart-o"></i> bar-chart-o <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-barcode"><i class="fa fa-barcode"></i> barcode</a></li>
        <li><a type="fa fa-bars"><i class="fa fa-bars"></i> bars</a></li>
        <li><a type="fa fa-battery-0"><i class="fa fa-battery-0"></i> battery-0 <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-battery-1"><i class="fa fa-battery-1"></i> battery-1 <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-battery-2"><i class="fa fa-battery-2"></i> battery-2 <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-battery-3"><i class="fa fa-battery-3"></i> battery-3 <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-battery-4"><i class="fa fa-battery-4"></i> battery-4 <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-battery-empty"><i class="fa fa-battery-empty"></i> battery-empty</a></li>
        <li><a type="fa fa-battery-full"><i class="fa fa-battery-full"></i> battery-full</a></li>
        <li><a type="fa fa-battery-half"><i class="fa fa-battery-half"></i> battery-half</a></li>
        <li><a type="fa fa-battery-quarter"><i class="fa fa-battery-quarter"></i> battery-quarter</a></li>
        <li><a type="fa fa-battery-three-quarters"><i class="fa fa-battery-three-quarters"></i> battery-three-quarters</a></li>
        <li><a type="fa fa-bed"><i class="fa fa-bed"></i> bed</a></li>
        <li><a type="fa fa-beer"><i class="fa fa-beer"></i> beer</a></li>
        <li><a type="fa fa-bell"><i class="fa fa-bell"></i> bell</a></li>
        <li><a type="fa fa-bell-o"><i class="fa fa-bell-o"></i> bell-o</a></li>
        <li><a type="fa fa-bell-slash"><i class="fa fa-bell-slash"></i> bell-slash</a></li>
        <li><a type="fa fa-bell-slash-o"><i class="fa fa-bell-slash-o"></i> bell-slash-o</a></li>
        <li><a type="fa fa-bicycle"><i class="fa fa-bicycle"></i> bicycle</a></li>
        <li><a type="fa fa-binoculars"><i class="fa fa-binoculars"></i> binoculars</a></li>
        <li><a type="fa fa-birthday-cake"><i class="fa fa-birthday-cake"></i> birthday-cake</a></li>
        <li><a type="fa fa-bolt"><i class="fa fa-bolt"></i> bolt</a></li>
        <li><a type="fa fa-bomb"><i class="fa fa-bomb"></i> bomb</a></li>
        <li><a type="fa fa-book"><i class="fa fa-book"></i> book</a></li>
        <li><a type="fa fa-bookmark"><i class="fa fa-bookmark"></i> bookmark</a></li>
        <li><a type="fa fa-bookmark-o"><i class="fa fa-bookmark-o"></i> bookmark-o</a></li>
        <li><a type="fa fa-briefcase"><i class="fa fa-briefcase"></i> briefcase</a></li>
        <li><a type="fa fa-bug"><i class="fa fa-bug"></i> bug</a></li>
        <li><a type="fa fa-building"><i class="fa fa-building"></i> building</a></li>
        <li><a type="fa fa-building-o"><i class="fa fa-building-o"></i> building-o</a></li>
        <li><a type="fa fa-bullhorn"><i class="fa fa-bullhorn"></i> bullhorn</a></li>
        <li><a type="fa fa-bullseye"><i class="fa fa-bullseye"></i> bullseye</a></li>
        <li><a type="fa fa-bus"><i class="fa fa-bus"></i> bus</a></li>
        <li><a type="fa fa-cab"><i class="fa fa-cab"></i> cab <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-calculator"><i class="fa fa-calculator"></i> calculator</a></li>
        <li><a type="fa fa-calendar"><i class="fa fa-calendar"></i> calendar</a></li>
        <li><a type="fa fa-calendar-check-o"><i class="fa fa-calendar-check-o"></i> calendar-check-o</a></li>
        <li><a type="fa fa-calendar-minus-o"><i class="fa fa-calendar-minus-o"></i> calendar-minus-o</a></li>
        <li><a type="fa fa-calendar-o"><i class="fa fa-calendar-o"></i> calendar-o</a></li>
        <li><a type="fa fa-calendar-plus-o"><i class="fa fa-calendar-plus-o"></i> calendar-plus-o</a></li>
<%--        <li><a type="fa fa-calendar-plus-o"><i class="fa c"></i> calendar-times-o</a></li>--%>
        <li><a type="fa fa-camera"><i class="fa fa-camera"></i> camera</a></li>
        <li><a type="fa fa-camera-retro"><i class="fa fa-camera-retro"></i> camera-retro</a></li>
        <li><a type="fa fa-car"><i class="fa fa-car"></i> car</a></li>
        <li><a type="fa fa-caret-square-o-down"><i class="fa fa-caret-square-o-down"></i> caret-square-o-down</a></li>
        <li><a type="fa fa-caret-square-o-left"><i class="fa fa-caret-square-o-left"></i> caret-square-o-left</a></li>
        <li><a type="fa fa-caret-square-o-right"><i class="fa fa-caret-square-o-right"></i> caret-square-o-right</a></li>
        <li><a type="fa fa-caret-square-o-up"><i class="fa fa-caret-square-o-up"></i> caret-square-o-up</a></li>
        <li><a type="fa fa-cart-arrow-down"><i class="fa fa-cart-arrow-down"></i> cart-arrow-down</a></li>
        <li><a type="fa fa-cart-plus"><i class="fa fa-cart-plus"></i> cart-plus</a></li>
        <li><a type="fa fa-cc"><i class="fa fa-cc"></i> cc</a></li>
        <li><a type="fa fa-certificate"><i class="fa fa-certificate"></i> certificate</a></li>
        <li><a type="fa fa-check"><i class="fa fa-check"></i> check</a></li>
        <li><a type="fa fa-check-circle"><i class="fa fa-check-circle"></i> check-circle</a></li>
        <li><a type="fa fa-check-circle-o"><i class="fa fa-check-circle-o"></i> check-circle-o</a></li>
        <li><a type="fa fa-check-square"><i class="fa fa-check-square"></i> check-square</a></li>
        <li><a type="fa fa-check-square-o"><i class="fa fa-check-square-o"></i> check-square-o</a></li>
        <li><a type="fa fa-child"><i class="fa fa-child"></i> child</a></li>
        <li><a type="fa fa-circle"><i class="fa fa-circle"></i> circle</a></li>
        <li><a type="fa fa-circle-o"><i class="fa fa-circle-o"></i> circle-o</a></li>
        <li><a type="fa fa-circle-o-notch"><i class="fa fa-circle-o-notch"></i> circle-o-notch</a></li>
        <li><a type="fa fa-circle-thin"><i class="fa fa-circle-thin"></i> circle-thin</a></li>
        <li><a type="fa fa-clock-o"><i class="fa fa-clock-o"></i> clock-o</a></li>    
        <li><a type="fa fa-clone"><i class="fa fa-clone"></i> clone</a></li>
        <li><a type="fa fa-close"><i class="fa fa-close"></i> close <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-cloud"><i class="fa fa-cloud"></i> cloud</a></li>
        <li><a type="fa fa-cloud-download"><i class="fa fa-cloud-download"></i> cloud-download</a></li>
        <li><a type="fa fa-cloud-upload"><i class="fa fa-cloud-upload"></i> cloud-upload</a></li>
        <li><a type="fa fa-code"><i class="fa fa-code"></i> code</a></li>
        <li><a type="fa fa-code-fork"><i class="fa fa-code-fork"></i> code-fork</a></li>
        <li><a type="fa fa-coffee"><i class="fa fa-coffee"></i> coffee</a></li>
        <li><a type="fa fa-cog"><i class="fa fa-cog"></i> cog</a></li>
        <li><a type="fa fa-cogs"><i class="fa fa-cogs"></i> cogs</a></li>
        <li><a type="fa fa-comment"><i class="fa fa-comment"></i> comment</a></li>
        <li><a type="fa fa-comment-o"><i class="fa fa-comment-o"></i> comment-o</a></li>
        <li><a type="fa fa-commenting"><i class="fa fa-commenting"></i> commenting</a></li>
        <li><a type="fa fa-commenting-o"><i class="fa fa-commenting-o"></i> commenting-o</a></li>
        <li><a type="fa fa-comments"><i class="fa fa-comments"></i> comments</a></li>
        <li><a type="fa fa-comments-o"><i class="fa fa-comments-o"></i> comments-o</a></li>
        <li><a type="fa fa-compass"><i class="fa fa-compass"></i> compass</a></li>
        <li><a type="fa fa-copyright"><i class="fa fa-copyright"></i> copyright</a></li>
        <li><a type="fa fa-creative-commons"><i class="fa fa-creative-commons"></i> creative-commons</a></li>
        <li><a type="fa fa-credit-card"><i class="fa fa-credit-card"></i> credit-card</a></li>
        <li><a type="fa fa-crop"><i class="fa fa-crop"></i> crop</a></li>
        <li><a type="fa fa-crosshairs"><i class="fa fa-crosshairs"></i> crosshairs</a></li>
        <li><a type="fa fa-cube"><i class="fa fa-cube"></i> cube</a></li>
        <li><a type="fa fa-cubes"><i class="fa fa-cubes"></i> cubes</a></li>
        <li><a type="fa fa-cutlery"><i class="fa fa-cutlery"></i> cutlery</a></li>
        <li><a type="fa fa-dashboard"><i class="fa fa-dashboard"></i> dashboard <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-database"><i class="fa fa-database"></i> database</a></li>
        <li><a type="fa fa-desktop"><i class="fa fa-desktop"></i> desktop</a></li>
        <li><a type="fa fa-diamond"><i class="fa fa-diamond"></i> diamond</a></li>
        <li><a type="fa fa-dot-circle-o"><i class="fa fa-dot-circle-o"></i> dot-circle-o</a></li>
        <li><a type="fa fa-download"><i class="fa fa-download"></i> download</a></li>
        <li><a type="fa fa-edit"><i class="fa fa-edit"></i> edit <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-ellipsis-h"><i class="fa fa-ellipsis-h"></i> ellipsis-h</a></li>
        <li><a type="fa fa-ellipsis-v"><i class="fa fa-ellipsis-v"></i> ellipsis-v</a></li>
        <li><a type="fa fa-envelope"><i class="fa fa-envelope"></i> envelope</a></li>
        <li><a type="fa fa-envelope-o"><i class="fa fa-envelope-o"></i> envelope-o</a></li>
        <li><a type="fa fa-envelope-square"><i class="fa fa-envelope-square"></i> envelope-square</a></li>
        <li><a type="fa fa-eraser"><i class="fa fa-eraser"></i> eraser</a></li>
        <li><a type="fa fa-exchange"><i class="fa fa-exchange"></i> exchange</a></li>
        <li><a type="fa fa-exclamation"><i class="fa fa-exclamation"></i> exclamation</a></li>
        <li><a type="fa fa-exclamation-circle"><i class="fa fa-exclamation-circle"></i> exclamation-circle</a></li>
        <li><a type="fa fa-exclamation-triangle"><i class="fa fa-exclamation-triangle"></i> exclamation-triangle</a></li>
        <li><a type="fa fa-external-link"><i class="fa fa-external-link"></i> external-link</a></li>
        <li><a type="fa fa-external-link-square"><i class="fa fa-external-link-square"></i> external-link-square</a></li>
        <li><a type="fa fa-eye"><i class="fa fa-eye"></i> eye</a></li>
        <li><a type="fa fa-eye-slash"><i class="fa fa-eye-slash"></i> eye-slash</a></li>
        <li><a type="fa fa-eyedropper"><i class="fa fa-eyedropper"></i> eyedropper</a></li>
        <li><a type="fa fa-fax"><i class="fa fa-fax"></i> fax</a></li>
        <li><a type="fa fa-feed"><i class="fa fa-feed"></i> feed <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-female"><i class="fa fa-female"></i> female</a></li>
        <li><a type="fa fa-fighter-jet"><i class="fa fa-fighter-jet"></i> fighter-jet</a></li>
        <li><a type="fa fa-file-archive-o"><i class="fa fa-file-archive-o"></i> file-archive-o</a></li>
        <li><a type="fa fa-file-audio-o"><i class="fa fa-file-audio-o"></i> file-audio-o</a></li>
        <li><a type="fa fa-file-code-o"><i class="fa fa-file-code-o"></i> file-code-o</a></li>
        <li><a type="fa fa-file-excel-o"><i class="fa fa-file-excel-o"></i> file-excel-o</a></li>   
        <li><a type="fa fa-file-image-o"><i class="fa fa-file-image-o"></i> file-image-o</a></li>
        <li><a type="fa fa-file-movie-o"><i class="fa fa-file-movie-o"></i> file-movie-o <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-file-pdf-o"><i class="fa fa-file-pdf-o"></i> file-pdf-o</a></li>
        <li><a type="fa fa-file-photo-o"><i class="fa fa-file-photo-o"></i> file-photo-o <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-file-picture-o"><i class="fa fa-file-picture-o"></i> file-picture-o <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-file-powerpoint-o"><i class="fa fa-file-powerpoint-o"></i> file-powerpoint-o</a></li>
        <li><a type="fa fa-file-sound-o"><i class="fa fa-file-sound-o"></i> file-sound-o <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-file-video-o"><i class="fa fa-file-video-o"></i> file-video-o</a></li>
        <li><a type="fa fa-file-word-o"><i class="fa fa-file-word-o"></i> file-word-o</a></li>
        <li><a type="fa fa-file-zip-o"><i class="fa fa-file-zip-o"></i> file-zip-o <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-film"><i class="fa fa-film"></i> film</a></li>
        <li><a type="fa fa-filter"><i class="fa fa-filter"></i> filter</a></li>
        <li><a type="fa fa-fire"><i class="fa fa-fire"></i> fire</a></li>
        <li><a type="fa fa-fire-extinguisher"><i class="fa fa-fire-extinguisher"></i> fire-extinguisher</a></li>
        <li><a type="fa fa-flag"><i class="fa fa-flag"></i> flag</a></li>
        <li><a type="fa fa-flag-checkered"><i class="fa fa-flag-checkered"></i> flag-checkered</a></li>
        <li><a type="fa fa-flag-o"><i class="fa fa-flag-o"></i> flag-o</a></li>
        <li><a type="fa fa-flash"><i class="fa fa-flash"></i> flash <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-flask"><i class="fa fa-flask"></i> flask</a></li>
        <li><a type="fa fa-folder"><i class="fa fa-folder"></i> folder</a></li>
        <li><a type="fa fa-folder-o"><i class="fa fa-folder-o"></i> folder-o</a></li>
        <li><a type="fa fa-folder-open"><i class="fa fa-folder-open"></i> folder-open</a></li>
        <li><a type="fa fa-folder-open-o"><i class="fa fa-folder-open-o"></i> folder-open-o</a></li>
        <li><a type="fa fa-frown-o"><i class="fa fa-frown-o"></i> frown-o</a></li>
        <li><a type="fa fa-futbol-o"><i class="fa fa-futbol-o"></i> futbol-o</a></li>
        <li><a type="fa fa-gamepad"><i class="fa fa-gamepad"></i> gamepad</a></li>
        <li><a type="fa fa-gavel"><i class="fa fa-gavel"></i> gavel</a></li>
        <li><a type="fa fa-gear"><i class="fa fa-gear"></i> gear <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-gears"><i class="fa fa-gears"></i> gears <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-gift"><i class="fa fa-gift"></i> gift</a></li>
        <li><a type="fa fa-glass"><i class="fa fa-glass"></i> glass</a></li>
        <li><a type="fa fa-globe"><i class="fa fa-globe"></i> globe</a></li>
        <li><a type="fa fa-graduation-cap"><i class="fa fa-graduation-cap"></i> graduation-cap</a></li>
        <li><a type="fa fa-group"><i class="fa fa-group"></i> group <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-hand-grab-o"><i class="fa fa-hand-grab-o"></i> hand-grab-o <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-hand-lizard-o"><i class="fa fa-hand-lizard-o"></i> hand-lizard-o</a></li>
        <li><a type="fa fa-hand-paper-o"><i class="fa fa-hand-paper-o"></i> hand-paper-o</a></li>
        <li><a type="fa fa-hand-peace-o"><i class="fa fa-hand-peace-o"></i> hand-peace-o</a></li>
        <li><a type="fa fa-hand-pointer-o"><i class="fa fa-hand-pointer-o"></i> hand-pointer-o</a></li>
        <li><a type="fa fa-hand-rock-o"><i class="fa fa-hand-rock-o"></i> hand-rock-o</a></li>
        <li><a type="fa fa-hand-scissors-o"><i class="fa fa-hand-scissors-o"></i> hand-scissors-o</a></li>
        <li><a type="fa fa-hand-spock-o"><i class="fa fa-hand-spock-o"></i> hand-spock-o</a></li>
        <li><a type="fa fa-hand-stop-o"><i class="fa fa-hand-stop-o"></i> hand-stop-o <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-hdd-o"><i class="fa fa-hdd-o"></i> hdd-o</a></li>
        <li><a type="fa fa-headphones"><i class="fa fa-headphones"></i> headphones</a></li>
        <li><a type="fa fa-heart"><i class="fa fa-heart"></i> heart</a></li>
        <li><a type="fa fa-heart-o"><i class="fa fa-heart-o"></i> heart-o</a></li>
        <li><a type="fa fa-heartbeat"><i class="fa fa-heartbeat"></i> heartbeat</a></li>
        <li><a type="fa fa-history"><i class="fa fa-history"></i> history</a></li>
        <li><a type="fa fa-home"><i class="fa fa-home"></i> home</a></li>
        <li><a type="fa fa-hotel"><i class="fa fa-hotel"></i> hotel <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-hourglass"><i class="fa fa-hourglass"></i> hourglass</a></li>
        <li><a type="fa fa-hourglass-1"><i class="fa fa-hourglass-1"></i> hourglass-1 <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-hourglass-2"><i class="fa fa-hourglass-2"></i> hourglass-2 <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-hourglass-3"><i class="fa fa-hourglass-3"></i> hourglass-3 <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-hourglass-end"><i class="fa fa-hourglass-end"></i> hourglass-end</a></li>
        <li><a type="fa fa-hourglass-half"><i class="fa fa-hourglass-half"></i> hourglass-half</a></li>
        <li><a type="fa fa-hourglass-o"><i class="fa fa-hourglass-o"></i> hourglass-o</a></li>
        <li><a type="fa fa-hourglass-start"><i class="fa fa-hourglass-start"></i> hourglass-start</a></li>
        <li><a type="fa fa-i-cursor"><i class="fa fa-i-cursor"></i> i-cursor</a></li>
        <li><a type="fa fa-image"><i class="fa fa-image"></i> image <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-inbox"><i class="fa fa-inbox"></i> inbox</a></li>
        <li><a type="fa fa-industry"><i class="fa fa-industry"></i> industry</a></li>
        <li><a type="fa fa-info"><i class="fa fa-info"></i> info</a></li>
        <li><a type="fa fa-info-circle"><i class="fa fa-info-circle"></i> info-circle</a></li>
        <li><a type="fa fa-institution"><i class="fa fa-institution"></i> institution <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-key"><i class="fa fa-key"></i> key</a></li>
        <li><a type="fa fa-keyboard-o"><i class="fa fa-keyboard-o"></i> keyboard-o</a></li>
        <li><a type="fa fa-language"><i class="fa fa-language"></i> language</a></li>
        <li><a type="fa fa-laptop"><i class="fa fa-laptop"></i> laptop</a></li>
        <li><a type="fa fa-leaf"><i class="fa fa-leaf"></i> leaf</a></li>
        <li><a type="fa fa-legal"><i class="fa fa-legal"></i> legal <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-lemon-o"><i class="fa fa-lemon-o"></i> lemon-o</a></li>
        <li><a type="fa fa-level-down"><i class="fa fa-level-down"></i> level-down</a></li>
        <li><a type="fa fa-level-up"><i class="fa fa-level-up"></i> level-up</a></li>
        <li><a type="fa fa-life-bouy"><i class="fa fa-life-bouy"></i> life-bouy <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-life-buoy"><i class="fa fa-life-buoy"></i> life-buoy <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-life-ring"><i class="fa fa-life-ring"></i> life-ring</a></li>
        <li><a type="fa fa-life-saver"><i class="fa fa-life-saver"></i> life-saver <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-lightbulb-o"><i class="fa fa-lightbulb-o"></i> lightbulb-o</a></li>
        <li><a type="fa fa-line-chart"><i class="fa fa-line-chart"></i> line-chart</a></li>
        <li><a type="fa fa-location-arrow"><i class="fa fa-location-arrow"></i> location-arrow</a></li>
        <li><a type="fa fa-lock"><i class="fa fa-lock"></i> lock</a></li>
        <li><a type="fa fa-magic"><i class="fa fa-magic"></i> magic</a></li>
        <li><a type="fa fa-magnet"><i class="fa fa-magnet"></i> magnet</a></li>
        <li><a type="fa fa-mail-forward"><i class="fa fa-mail-forward"></i> mail-forward <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-mail-reply"><i class="fa fa-mail-reply"></i> mail-reply <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-mail-reply-all"><i class="fa fa-mail-reply-all"></i> mail-reply-all <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-male"><i class="fa fa-male"></i> male</a></li>
        <li><a type="fa fa-map"><i class="fa fa-map"></i> map</a></li>
        <li><a type="fa fa-map-o"><i class="fa fa-map-marker"></i> map-marker</a></li>
        <li><a type="fa fa-map-o"><i class="fa fa-map-o"></i> map-o</a></li>
        <li><a type="fa fa-map-pin"><i class="fa fa-map-pin"></i> map-pin</a></li>
        <li><a type="fa fa-map-signs"><i class="fa fa-map-signs"></i> map-signs</a></li>
        <li><a type="fa fa-meh-o"><i class="fa fa-meh-o"></i> meh-o</a></li>
        <li><a type="fa fa-microphone"><i class="fa fa-microphone"></i> microphone</a></li>
        <li><a type="fa fa-microphone-slash"><i class="fa fa-microphone-slash"></i> microphone-slash</a></li>
        <li><a type="fa fa-minus"><i class="fa fa-minus"></i> minus</a></li>
        <li><a type="fa fa-minus-circle"><i class="fa fa-minus-circle"></i> minus-circle</a></li>
        <li><a type="fa fa-minus-square"><i class="fa fa-minus-square"></i> minus-square</a></li>
        <li><a type="fa fa-minus-square-o"><i class="fa fa-minus-square-o"></i> minus-square-o</a></li>
        <li><a type="fa fa-mobile"><i class="fa fa-mobile"></i> mobile</a></li>
        <li><a type="fa fa-mobile-phone"><i class="fa fa-mobile-phone"></i> mobile-phone <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-money"><i class="fa fa-money"></i> money</a></li>
        <li><a type="fa fa-moon-o"><i class="fa fa-moon-o"></i> moon-o</a></li>
        <li><a type="fa fa-mortar-board"><i class="fa fa-mortar-board"></i> mortar-board <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-motorcycle"><i class="fa fa-motorcycle"></i> motorcycle</a></li>
        <li><a type="fa fa-mouse-pointer"><i class="fa fa-mouse-pointer"></i> mouse-pointer</a></li>
        <li><a type="fa fa-music"><i class="fa fa-music"></i> music</a></li>
        <li><a type="fa fa-navicon"><i class="fa fa-navicon"></i> navicon <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-newspaper-o"><i class="fa fa-newspaper-o"></i> newspaper-o</a></li>
        <li><a type="fa fa-object-group"><i class="fa fa-object-group"></i> object-group</a></li>
        <li><a type="fa fa-object-ungroup"><i class="fa fa-object-ungroup"></i> object-ungroup</a></li>
        <li><a type="fa fa-paint-brush"><i class="fa fa-paint-brush"></i> paint-brush</a></li>
        <li><a type="fa fa-paper-plane"><i class="fa fa-paper-plane"></i> paper-plane</a></li>
        <li><a type="fa fa-paper-plane-o"><i class="fa fa-paper-plane-o"></i> paper-plane-o</a></li>
        <li><a type="fa fa-paw"><i class="fa fa-paw"></i> paw</a></li>
        <li><a type="fa fa-pencil"><i class="fa fa-pencil"></i> pencil</a></li>
        <li><a type="fa fa-pencil-square"><i class="fa fa-pencil-square"></i> pencil-square</a></li>
        <li><a type="fa fa-pencil-square-o"><i class="fa fa-pencil-square-o"></i> pencil-square-o</a></li>
        <li><a type="fa fa-phone"><i class="fa fa-phone"></i> phone</a></li>
        <li><a type="fa fa-phone-square"><i class="fa fa-phone-square"></i> phone-square</a></li>
        <li><a type="fa fa-photo"><i class="fa fa-photo"></i> photo <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-picture-o"><i class="fa fa-picture-o"></i> picture-o</a></li>
        <li><a type="fa fa-pie-chart"><i class="fa fa-pie-chart"></i> pie-chart</a></li>
        <li><a type="fa fa-plane"><i class="fa fa-plane"></i> plane</a></li>
        <li><a type="fa fa-plug"><i class="fa fa-plug"></i> plug</a></li>
        <li><a type="fa fa-plus"><i class="fa fa-plus"></i> plus</a></li>
        <li><a type="fa fa-plus-circle"><i class="fa fa-plus-circle"></i> plus-circle</a></li>
        <li><a type="fa fa-plus-square"><i class="fa fa-plus-square"></i> plus-square</a></li>
        <li><a type="fa fa-plus-square-o"><i class="fa fa-plus-square-o"></i> plus-square-o</a></li>
        <li><a type="fa fa-power-off"><i class="fa fa-power-off"></i> power-off</a></li>
        <li><a type="fa fa-print"><i class="fa fa-print"></i> print</a></li>
        <li><a type="fa fa-puzzle-piece"><i class="fa fa-puzzle-piece"></i> puzzle-piece</a></li>
        <li><a type="fa fa-qrcode"><i class="fa fa-qrcode"></i> qrcode</a></li>
        <li><a type="fa fa-question"><i class="fa fa-question"></i> question</a></li>
        <li><a type="fa fa-question-circle"><i class="fa fa-question-circle"></i> question-circle</a></li>
        <li><a type="fa fa-quote-left"><i class="fa fa-quote-left"></i> quote-left</a></li>
        <li><a type="fa fa-quote-left"><i class="fa fa-quote-right"></i> quote-right</a></li>
        <li><a type="fa fa-random"><i class="fa fa-random"></i> random</a></li>
        <li><a type="fa fa-recycle"><i class="fa fa-recycle"></i> recycle</a></li>
        <li><a type="fa fa-refresh"><i class="fa fa-refresh"></i> refresh</a></li>
        <li><a type="fa fa-registered"><i class="fa fa-registered"></i> registered</a></li>
        <li><a type="fa fa-remove"><i class="fa fa-remove"></i> remove <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-reorder"><i class="fa fa-reorder"></i> reorder <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-reply"><i class="fa fa-reply"></i> reply</a></li>
        <li><a type="fa fa-reply-all"><i class="fa fa-reply-all"></i> reply-all</a></li>
        <li><a type="fa fa-retweet"><i class="fa fa-retweet"></i> retweet</a></li>
        <li><a type="fa fa-road"><i class="fa fa-road"></i> road</a></li>
        <li><a type="fa fa-rocket"><i class="fa fa-rocket"></i> rocket</a></li>
        <li><a type="fa fa-rss"><i class="fa fa-rss"></i> rss</a></li>
        <li><a type="fa fa-rss-square"><i class="fa fa-rss-square"></i> rss-square</a></li>
        <li><a type="fa fa-search"><i class="fa fa-search"></i> search</a></li>
        <li><a type="fa fa-search-minus"><i class="fa fa-search-minus"></i> search-minus</a></li>
        <li><a type="fa fa-search-plus"><i class="fa fa-search-plus"></i> search-plus</a></li>
        <li><a type="fa fa-send"><i class="fa fa-send"></i> send <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-send-o"><i class="fa fa-send-o"></i> send-o <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-server"><i class="fa fa-server"></i> server</a></li>
        <li><a type="fa fa-share"><i class="fa fa-share"></i> share</a></li>
        <li><a type="fa fa-share-alt"><i class="fa fa-share-alt"></i> share-alt</a></li>
        <li><a type="fa fa-share-alt-square"><i class="fa fa-share-alt-square"></i> share-alt-square</a></li>
        <li><a type="fa fa-share-square"><i class="fa fa-share-square"></i> share-square</a></li>
        <li><a type="fa fa-share-square-o"><i class="fa fa-share-square-o"></i> share-square-o</a></li>
        <li><a type="fa fa-shield"><i class="fa fa-shield"></i> shield</a></li>
        <li><a type="fa fa-ship"><i class="fa fa-ship"></i> ship</a></li>
        <li><a type="fa fa-shopping-cart"><i class="fa fa-shopping-cart"></i> shopping-cart</a></li>
        <li><a type="fa fa-sign-in"><i class="fa fa-sign-in"></i> sign-in</a></li>
        <li><a type="fa fa-sign-out"><i class="fa fa-sign-out"></i> sign-out</a></li>
        <li><a type="fa fa-signal"><i class="fa fa-signal"></i> signal</a></li>
        <li><a type="fa fa-sitemap"><i class="fa fa-sitemap"></i> sitemap</a></li>
        <li><a type="fa fa-sliders"><i class="fa fa-sliders"></i> sliders</a></li>
        <li><a type="fa fa-smile-o"><i class="fa fa-smile-o"></i> smile-o</a></li>
        <li><a type="fa fa-soccer-ball-o"><i class="fa fa-soccer-ball-o"></i> soccer-ball-o <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-sort"><i class="fa fa-sort"></i> sort</a></li>
        <li><a type="fa fa-sort-alpha-asc"><i class="fa fa-sort-alpha-asc"></i> sort-alpha-asc</a></li>
        <li><a type="fa fa-sort-alpha-desc"><i class="fa fa-sort-alpha-desc"></i> sort-alpha-desc</a></li>
        <li><a type="fa fa-sort-amount-asc"><i class="fa fa-sort-amount-asc"></i> sort-amount-asc</a></li>
        <li><a type="fa fa-sort-amount-desc"><i class="fa fa-sort-amount-desc"></i> sort-amount-desc</a></li>
        <li><a type="fa fa-sort-asc"><i class="fa fa-sort-asc"></i> sort-asc</a></li>
        <li><a type="fa fa-sort-desc"><i class="fa fa-sort-desc"></i> sort-desc</a></li>
        <li><a type="fa fa-sort-down"><i class="fa fa-sort-down"></i> sort-down <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-sort-numeric-asc"><i class="fa fa-sort-numeric-asc"></i> sort-numeric-asc</a></li>
        <li><a type="fa fa-sort-numeric-desc"><i class="fa fa-sort-numeric-desc"></i> sort-numeric-desc</a></li>
        <li><a type="fa fa-sort-up"><i class="fa fa-sort-up"></i> sort-up <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-space-shuttle"><i class="fa fa-space-shuttle"></i> space-shuttle</a></li>
        <li><a type="fa fa-spinner"><i class="fa fa-spinner"></i> spinner</a></li>
        <li><a type="fa fa-spoon"><i class="fa fa-spoon"></i> spoon</a></li>
        <li><a type="fa fa-square"><i class="fa fa-square"></i> square</a></li>
        <li><a type="fa fa-square-o"><i class="fa fa-square-o"></i> square-o</a></li>
        <li><a type="fa fa-star"><i class="fa fa-star"></i> star</a></li>
        <li><a type="fa fa-star-half"><i class="fa fa-star-half"></i> star-half</a></li>
        <li><a type="fa fa-star-half-empty"><i class="fa fa-star-half-empty"></i> star-half-empty <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-star-half-full"><i class="fa fa-star-half-full"></i> star-half-full <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-star-half-o"><i class="fa fa-star-half-o"></i> star-half-o</a></li>
        <li><a type="fa fa-star-o"><i class="fa fa-star-o"></i> star-o</a></li>
        <li><a type="fa fa-sticky-note"><i class="fa fa-sticky-note"></i> sticky-note</a></li>
        <li><a type="fa fa-sticky-note-o"><i class="fa fa-sticky-note-o"></i> sticky-note-o</a></li>
        <li><a type="fa fa-street-view"><i class="fa fa-street-view"></i> street-view</a></li>
        <li><a type="fa fa-suitcase"><i class="fa fa-suitcase"></i> suitcase</a></li>
        <li><a type="fa fa-sun-o"><i class="fa fa-sun-o"></i> sun-o</a></li>
        <li><a type="fa fa-support"><i class="fa fa-support"></i> support <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-tablet"><i class="fa fa-tablet"></i> tablet</a></li>
        <li><a type="fa fa-tachometer"><i class="fa fa-tachometer"></i> tachometer</a></li>
        <li><a type="fa fa-tag"><i class="fa fa-tag"></i> tag</a></li>
        <li><a type="fa fa-tags"><i class="fa fa-tags"></i> tags</a></li>
        <li><a type="fa fa-tasks"><i class="fa fa-tasks"></i> tasks</a></li>
        <li><a type="fa fa-taxi"><i class="fa fa-taxi"></i> taxi</a></li>
        <li><a type="fa fa-television"><i class="fa fa-television"></i> television</a></li>
        <li><a type="fa fa-terminal"><i class="fa fa-terminal"></i> terminal</a></li>
        <li><a type="fa fa-thumb-tack"><i class="fa fa-thumb-tack"></i> thumb-tack</a></li>
        <li><a type="fa fa-thumbs-down"><i class="fa fa-thumbs-down"></i> thumbs-down</a></li>
        <li><a type="fa fa-thumbs-o-down"><i class="fa fa-thumbs-o-down"></i> thumbs-o-down</a></li>
        <li><a type="fa fa-thumbs-o-up"><i class="fa fa-thumbs-o-up"></i> thumbs-o-up</a></li>
        <li><a type="fa fa-thumbs-up"><i class="fa fa-thumbs-up"></i> thumbs-up</a></li>
        <li><a type="fa fa-ticket"><i class="fa fa-ticket"></i> ticket</a></li>
        <li><a type="fa fa-times"><i class="fa fa-times"></i> times</a></li>
        <li><a type="fa fa-times-circle"><i class="fa fa-times-circle"></i> times-circle</a></li>
        <li><a type="fa fa-times-circle-o"><i class="fa fa-times-circle-o"></i> times-circle-o</a></li>
        <li><a type="fa fa-tint"><i class="fa fa-tint"></i> tint</a></li>
        <li><a type="fa fa-toggle-down"><i class="fa fa-toggle-down"></i> toggle-down <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-toggle-left"><i class="fa fa-toggle-left"></i> toggle-left <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-toggle-off"><i class="fa fa-toggle-off"></i> toggle-off</a></li>
        <li><a type="fa fa-toggle-on"><i class="fa fa-toggle-on"></i> toggle-on</a></li>
        <li><a type="fa fa-toggle-right"><i class="fa fa-toggle-right"></i> toggle-right <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-toggle-up"><i class="fa fa-toggle-up"></i> toggle-up <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-trademark"><i class="fa fa-trademark"></i> trademark</a></li>
        <li><a type="fa fa-trash"><i class="fa fa-trash"></i> trash</a></li>
        <li><a type="fa fa-trash-o"><i class="fa fa-trash-o"></i> trash-o</a></li>
        <li><a type="fa fa-tree"><i class="fa fa-tree"></i> tree</a></li>
        <li><a type="fa fa-trophy"><i class="fa fa-trophy"></i> trophy</a></li>
        <li><a type="fa fa-truck"><i class="fa fa-truck"></i> truck</a></li>
        <li><a type="fa fa-tty"><i class="fa fa-tty"></i> tty</a></li>
        <li><a type="fa fa-tv"><i class="fa fa-tv"></i> tv <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-umbrella"><i class="fa fa-umbrella"></i> umbrella</a></li>
        <li><a type="fa fa-university"><i class="fa fa-university"></i> university</a></li>
        <li><a type="fa fa-unlock"><i class="fa fa-unlock"></i> unlock</a></li>
        <li><a type="fa fa-unlock-alt"><i class="fa fa-unlock-alt"></i> unlock-alt</a></li>
        <li><a type="fa fa-unsorted"><i class="fa fa-unsorted"></i> unsorted <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-upload"><i class="fa fa-upload"></i> upload</a></li>
        <li><a type="fa fa-user"><i class="fa fa-user"></i> user</a></li>
        <li><a type="fa fa-user-plus"><i class="fa fa-user-plus"></i> user-plus</a></li>
        <li><a type="fa fa-user-secret"><i class="fa fa-user-secret"></i> user-secret</a></li>
        <li><a type="fa fa-user-times"><i class="fa fa-user-times"></i> user-times</a></li>
        <li><a type="fa fa-users"><i class="fa fa-users"></i> users</a></li>
        <li><a type="fa fa-video-camera"><i class="fa fa-video-camera"></i> video-camera</a></li>
        <li><a type="fa fa-volume-down"><i class="fa fa-volume-down"></i> volume-down</a></li>
        <li><a type="fa fa-volume-off"><i class="fa fa-volume-off"></i> volume-off</a></li>
        <li><a type="fa fa-volume-up"><i class="fa fa-volume-up"></i> volume-up</a></li>
        <li><a type="fa fa-warning"><i class="fa fa-warning"></i> warning <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-wheelchair"><i class="fa fa-wheelchair"></i> wheelchair</a></li>
        <li><a type="fa fa-wifi"><i class="fa fa-wifi"></i> wifi</a></li>
        <li><a type="fa fa-wrench"><i class="fa fa-wrench"></i> wrench</a></li>

        <li><a type="fa fa-hand-grab-o"><i class="fa fa-hand-grab-o"></i> hand-grab-o <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-hand-lizard-o"><i class="fa fa-hand-lizard-o"></i> hand-lizard-o</a></li>
        <li><a type="fa fa-hand-o-down"><i class="fa fa-hand-o-down"></i> hand-o-down</a></li>
        <li><a type="fa fa-hand-o-left"><i class="fa fa-hand-o-left"></i> hand-o-left</a></li>
        <li><a type="fa fa-hand-o-right"><i class="fa fa-hand-o-right"></i> hand-o-right</a></li>
        <li><a type="fa fa-hand-o-up"><i class="fa fa-hand-o-up"></i> hand-o-up</a></li>
        <li><a type="fa fa-hand-paper-o"><i class="fa fa-hand-paper-o"></i> hand-paper-o</a></li>
        <li><a type="fa fa-hand-peace-o"><i class="fa fa-hand-peace-o"></i> hand-peace-o</a></li>
        <li><a type="fa fa-hand-pointer-o"><i class="fa fa-hand-pointer-o"></i> hand-pointer-o</a></li>
        <li><a type="fa fa-hand-rock-o"><i class="fa fa-hand-rock-o"></i> hand-rock-o</a></li>
        <li><a type="fa fa-hand-scissors-o"><i class="fa fa-hand-scissors-o"></i> hand-scissors-o</a></li>
        <li><a type="fa fa-hand-spock-o"><i class="fa fa-hand-spock-o"></i> hand-spock-o</a></li>
        <li><a type="fa fa-hand-stop-o"><i class="fa fa-hand-stop-o"></i> hand-stop-o <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-thumbs-down"><i class="fa fa-thumbs-down"></i> thumbs-down</a></li>
        <li><a type="fa fa-thumbs-o-down"><i class="fa fa-thumbs-o-down"></i> thumbs-o-down</a></li>
        <li><a type="fa fa-thumbs-o-up"><i class="fa fa-thumbs-o-up"></i> thumbs-o-up</a></li>
        <li><a type="fa fa-thumbs-up"><i class="fa fa-thumbs-up"></i> thumbs-up</a></li>

        <li><a type="fa fa-genderless"><i class="fa fa-genderless"></i> genderless</a></li>
        <li><a type="fa fa-intersex"><i class="fa fa-intersex"></i> intersex <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-mars"><i class="fa fa-mars"></i> mars</a></li>
        <li><a type="fa fa-mars-double"><i class="fa fa-mars-double"></i> mars-double</a></li>
        <li><a type="fa fa-mars-stroke"><i class="fa fa-mars-stroke"></i> mars-stroke</a></li>
        <li><a type="fa fa-mars-stroke-h"><i class="fa fa-mars-stroke-h"></i> mars-stroke-h</a></li>
        <li><a type="fa fa-mars-stroke-v"><i class="fa fa-mars-stroke-v"></i> mars-stroke-v</a></li>
        <li><a type="fa fa-mercury"><i class="fa fa-mercury"></i> mercury</a></li>
        <li><a type="fa fa-neuter"><i class="fa fa-neuter"></i> neuter</a></li>
        <li><a type="fa fa-transgender"><i class="fa fa-transgender"></i> transgender</a></li>
        <li><a type="fa fa-transgender-alt"><i class="fa fa-transgender-alt"></i> transgender-alt</a></li>
        <li><a type="fa fa-venus"><i class="fa fa-venus"></i> venus</a></li>
        <li><a type="fa fa-venus-double"><i class="fa fa-venus-double"></i> venus-double</a></li>
        <li><a type="fa fa-venus-mars"><i class="fa fa-venus-mars"></i> venus-mars</a></li>

        <li><a type="fa fa-ambulance"><i class="fa fa-ambulance"></i> ambulance</a></li>
        <li><a type="fa fa-automobile"><i class="fa fa-automobile"></i> automobile <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-bicycle"><i class="fa fa-bicycle"></i> bicycle</a></li>
        <li><a type="fa fa-bus"><i class="fa fa-bus"></i> bus</a></li>
        <li><a type="fa fa-cab"><i class="fa fa-cab"></i> cab <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-car"><i class="fa fa-car"></i> car</a></li>
        <li><a type="fa fa-fighter-jet"><i class="fa fa-fighter-jet"></i> fighter-jet</a></li>
        <li><a type="fa fa-motorcycle"><i class="fa fa-motorcycle"></i> motorcycle</a></li>
        <li><a type="fa fa-plane"><i class="fa fa-plane"></i> plane</a></li>
        <li><a type="fa fa-rocket"><i class="fa fa-rocket"></i> rocket</a></li>
        <li><a type="fa fa-ship"><i class="fa fa-ship"></i> ship</a></li>
        <li><a type="fa fa-space-shuttle"><i class="fa fa-space-shuttle"></i> space-shuttle</a></li>
        <li><a type="fa fa-subway"><i class="fa fa-subway"></i> subway</a></li>
        <li><a type="fa fa-taxi"><i class="fa fa-taxi"></i> taxi</a></li>
        <li><a type="fa fa-train"><i class="fa fa-train"></i> train</a></li>
        <li><a type="fa fa-truck"><i class="fa fa-truck"></i> truck</a></li>
        <li><a type="fa fa-wheelchair"><i class="fa fa-wheelchair"></i> wheelchair</a></li>

        <li><a type="fa fa-file"><i class="fa fa-file"></i> file</a></li>
        <li><a type="fa fa-file-archive-o"><i class="fa fa-file-archive-o"></i> file-archive-o</a></li>
        <li><a type="fa fa-file-audio-o"><i class="fa fa-file-audio-o"></i> file-audio-o</a></li>
        <li><a type="fa fa-file-code-o"><i class="fa fa-file-code-o"></i> file-code-o</a></li>
        <li><a type="fa fa-file-excel-o"><i class="fa fa-file-excel-o"></i> file-excel-o</a></li>
        <li><a type="fa fa-file-image-o"><i class="fa fa-file-image-o"></i> file-image-o</a></li>
        <li><a type="fa fa-file-movie-o"><i class="fa fa-file-movie-o"></i> file-movie-o <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-file-o"><i class="fa fa-file-o"></i> file-o</a></li>
        <li><a type="fa fa-file-pdf-o"><i class="fa fa-file-pdf-o"></i> file-pdf-o</a></li>
        <li><a type="fa fa-file-photo-o"><i class="fa fa-file-photo-o"></i> file-photo-o <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-file-picture-o"><i class="fa fa-file-picture-o"></i> file-picture-o <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-file-powerpoint-o"><i class="fa fa-file-powerpoint-o"></i> file-powerpoint-o</a></li>
        <li><a type="fa fa-file-sound-o"><i class="fa fa-file-sound-o"></i> file-sound-o <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-file-text"><i class="fa fa-file-text"></i> file-text</a></li>
        <li><a type="fa fa-file-text-o"><i class="fa fa-file-text-o"></i> file-text-o</a></li>
        <li><a type="fa fa-file-video-o"><i class="fa fa-file-video-o"></i> file-video-o</a></li>
        <li><a type="fa fa-file-word-o"><i class="fa fa-file-word-o"></i> file-word-o</a></li>
        <li><a type="fa fa-file-zip-o"><i class="fa fa-file-zip-o"></i> file-zip-o <span class="text-muted">(alias)</span></a></li>

        <li><a type="fa fa-circle-o-notch"><i class="fa fa-circle-o-notch"></i> circle-o-notch</a></li>
        <li><a type="fa fa-cog"><i class="fa fa-cog"></i> cog</a></li>
        <li><a type="fa fa-gear"><i class="fa fa-gear"></i> gear <span class="text-muted">(alias)</span></a></li>
        <li><a type="fa fa-refresh"><i class="fa fa-refresh"></i> refresh</a></li>
        <li><a type="fa fa-spinner"><i class="fa fa-spinner"></i> spinner</a></li>

        <li><a type="fa fa-check-square"><i class="fa fa-check-square"></i> check-square</a></li>
        <li><a type="fa fa-check-square-o"><i class="fa fa-check-square-o"></i> check-square-o</a></li>
        <li><a type="fa fa-circle"><i class="fa fa-circle"></i> circle</a></li>
        <li><a type="fa fa-circle-o"><i class="fa fa-circle-o"></i> circle-o</a></li>
        <li><a type="fa fa-dot-circle-o"><i class="fa fa-dot-circle-o"></i> dot-circle-o</a></li>
        <li><a type="fa fa-minus-square"><i class="fa fa-minus-square"></i> minus-square</a></li>
        <li><a type="fa fa-minus-square-o"><i class="fa fa-minus-square-o"></i> minus-square-o</a></li>
        <li><a type="fa fa-plus-square"><i class="fa fa-plus-square"></i> plus-square</a></li>
        <li><a type="fa fa-plus-square-o"><i class="fa fa-plus-square-o"></i> plus-square-o</a></li>
        <li><a type="fa fa-square"><i class="fa fa-square"></i> square</a></li>
        <li><a type="fa fa-square-o"><i class="fa fa-square-o"></i> square-o</a></li>

        <li><a type="fa fa-cc-amex"><i class="fa fa-cc-amex"></i> cc-amex</a></li>
		<li><a type="fa fa-cc-diners-club"><i class="fa fa-cc-diners-club"></i> cc-diners-club</a></li>
		<li><a type="fa fa-cc-discover"><i class="fa fa-cc-discover"></i> cc-discover</a></li>
		<li><a type="fa fa-cc-jcb"><i class="fa fa-cc-jcb"></i> cc-jcb</a></li>
		<li><a type="fa fa-cc-mastercard"><i class="fa fa-cc-mastercard"></i> cc-mastercard</a></li>
		<li><a type="fa fa-cc-paypal"><i class="fa fa-cc-paypal"></i> cc-paypal</a></li>
		<li><a type="fa fa-cc-stripe"><i class="fa fa-cc-stripe"></i> cc-stripe</a></li>
		<li><a type="fa fa-cc-visa"><i class="fa fa-cc-visa"></i> cc-visa</a></li>
		<li><a type="fa fa-credit-card"><i class="fa fa-credit-card"></i> credit-card</a></li>
		<li><a type="fa fa-google-wallet"><i class="fa fa-google-wallet"></i> google-wallet</a></li>
		<li><a type="fa fa-paypal"><i class="fa fa-paypal"></i> paypal</a></li>

		<li><a type="fa fa-area-chart"><i class="fa fa-area-chart"></i> area-chart</a></li>
		<li><a type="fa fa-bar-chart"><i class="fa fa-bar-chart"></i> bar-chart</a></li>
		<li><a type="fa fa-bar-chart-o"><i class="fa fa-bar-chart-o"></i> bar-chart-o</a></li>
		<li><a type="fa fa-line-chart"><i class="fa fa-line-chart"></i> line-chart</a></li>
		<li><a type="fa fa-pie-chart"><i class="fa fa-pie-chart"></i> pie-chart</a></li>

		<li><a type="fa fa-bitcoin"><i class="fa fa-bitcoin"></i> bitcoin</a></li>
		<li><a type="fa fa-btc"><i class="fa fa-btc"></i> btc</a></li>
		<li><a type="fa fa-cny"><i class="fa fa-cny"></i> cny</a></li>
		<li><a type="fa fa-dollar"><i class="fa fa-dollar"></i> dollar</a></li>
		<li><a type="fa fa-eur"><i class="fa fa-eur"></i> eur</a></li>
		<li><a type="fa fa-euro"><i class="fa fa-euro"></i> euro </a></li>
		<li><a type="fa fa-gbp"><i class="fa fa-gbp"></i> gbp</a></li>
		<li><a type="fa fa-gg"><i class="fa fa-gg"></i> gg</a></li>
		<li><a type="fa fa-gg-circle"><i class="fa fa-gg-circle"></i> gg-circle</a></li>
		<li><a type="fa fa-ils"><i class="fa fa-ils"></i> ils</a></li>
		<li><a type="fa fa-inr"><i class="fa fa-inr"></i> inr</a></li>
		<li><a type="fa fa-jpy"><i class="fa fa-jpy"></i> jpy</a></li>
		<li><a type="fa fa-krw"><i class="fa fa-krw"></i> krw</a></li>
		<li><a type="fa fa-money"><i class="fa fa-money"></i> money</a></li>
		<li><a type="fa fa-rmb"><i class="fa fa-rmb"></i> rmb </a></li>
		<li><a type="fa fa-rouble"><i class="fa fa-rouble"></i> rouble </a></li>
		<li><a type="fa fa-rub"><i class="fa fa-rub"></i> rub</a></li>
		<li><a type="fa fa-ruble"><i class="fa fa-ruble"></i> ruble </a></li>
		<li><a type="fa fa-rupee"><i class="fa fa-rupee"></i> rupee </a></li>
		<li><a type="fa fa-shekel"><i class="fa fa-shekel"></i> shekel </a></li>
		<li><a type="fa fa-sheqel"><i class="fa fa-sheqel"></i> sheqel </a></li>
		<li><a type="fa fa-try"><i class="fa fa-try"></i> try</a></li>
		<li><a type="fa fa-turkish-lira"><i class="fa fa-turkish-lira"></i> turkish-lira </a></li>
		<li><a type="fa fa-usd"><i class="fa fa-usd"></i> usd</a></li>
		<li><a type="fa fa-won"><i class="fa fa-won"></i> won </a></li>
		<li><a type="fa fa-yen"><i class="fa fa-yen"></i> yen </a></li>
		
		<li><a type="fa fa-align-center"><i class="fa fa-align-center"></i> align-center</a></li>
		<li><a type="fa fa-align-justify"><i class="fa fa-align-justify"></i> align-justify</a></li>
		<li><a type="fa fa-align-left"><i class="fa fa-align-left"></i> align-left</a></li>
		<li><a type="fa fa-align-right"><i class="fa fa-align-right"></i> align-right</a></li>
		<li><a type="fa fa-bold"><i class="fa fa-bold"></i> bold</a></li>
		<li><a type="fa fa-chain"><i class="fa fa-chain"></i> chain </a></li>
		<li><a type="fa fa-chain-broken"><i class="fa fa-chain-broken"></i> chain-broken</a></li>
		<li><a type="fa fa-clipboard"><i class="fa fa-clipboard"></i> clipboard</a></li>
		<li><a type="fa fa-columns"><i class="fa fa-columns"></i> columns</a></li>
		<li><a type="fa fa-copy"><i class="fa fa-copy"></i> copy </a></li>
		<li><a type="fa fa-cut"><i class="fa fa-cut"></i> cut </a></li>
		<li><a type="fa fa-dedent"><i class="fa fa-dedent"></i> dedent </a></li>
		<li><a type="fa fa-eraser"><i class="fa fa-eraser"></i> eraser</a></li>
		<li><a type="fa fa-file"><i class="fa fa-file"></i> file</a></li>
		<li><a type="fa fa-file-o"><i class="fa fa-file-o"></i> file-o</a></li>
		<li><a type="fa fa-file-text"><i class="fa fa-file-text"></i> file-text</a></li>
		<li><a type="fa fa-file-text-o"><i class="fa fa-file-text-o"></i> file-text-o</a></li>
		<li><a type="fa fa-files-o"><i class="fa fa-files-o"></i> files-o</a></li>
		<li><a type="fa fa-floppy-o"><i class="fa fa-floppy-o"></i> floppy-o</a></li>
		<li><a type="fa fa-font"><i class="fa fa-font"></i> font</a></li>
		<li><a type="fa fa-header"><i class="fa fa-header"></i> header</a></li>
		<li><a type="fa fa-indent"><i class="fa fa-indent"></i> indent</a></li>
		<li><a type="fa fa-italic"><i class="fa fa-italic"></i> italic</a></li>
		<li><a type="fa fa-link"><i class="fa fa-link"></i> link</a></li>
		<li><a type="fa fa-list"><i class="fa fa-list"></i> list</a></li>
		<li><a type="fa fa-list-alt"><i class="fa fa-list-alt"></i> list-alt</a></li>
		<li><a type="fa fa-list-ol"><i class="fa fa-list-ol"></i> list-ol</a></li>
		<li><a type="fa fa-list-ul"><i class="fa fa-list-ul"></i> list-ul</a></li>
		<li><a type="fa fa-outdent"><i class="fa fa-outdent"></i> outdent</a></li>
		<li><a type="fa fa-paperclip"><i class="fa fa-paperclip"></i> paperclip</a></li>
		<li><a type="fa fa-paragraph"><i class="fa fa-paragraph"></i> paragraph</a></li>
		<li><a type="fa fa-paste"><i class="fa fa-paste"></i> paste </a></li>
		<li><a type="fa fa-repeat"><i class="fa fa-repeat"></i> repeat</a></li>
		<li><a type="fa fa-rotate-left"><i class="fa fa-rotate-left"></i> rotate-left </a></li>
		<li><a type="fa fa-rotate-right"><i class="fa fa-rotate-right"></i> rotate-right </a></li>
		<li><a type="fa fa-save"><i class="fa fa-save"></i> save </a></li>
		<li><a type="fa fa-scissors"><i class="fa fa-scissors"></i> scissors</a></li>
		<li><a type="fa fa-strikethrough"><i class="fa fa-strikethrough"></i> strikethrough</a></li>
		<li><a type="fa fa-subscript"><i class="fa fa-subscript"></i> subscript</a></li>
		<li><a type="fa fa-superscript"><i class="fa fa-superscript"></i> superscript</a></li>
		<li><a type="fa fa-table"><i class="fa fa-table"></i> table</a></li>
		<li><a type="fa fa-text-height"><i class="fa fa-text-height"></i> text-height</a></li>
		<li><a type="fa fa-text-width"><i class="fa fa-text-width"></i> text-width</a></li>
		<li><a type="fa fa-th"><i class="fa fa-th"></i> th</a></li>
		<li><a type="fa fa-th-large"><i class="fa fa-th-large"></i> th-large</a></li>
		<li><a type="fa fa-th-list"><i class="fa fa-th-list"></i> th-list</a></li>
		<li><a type="fa fa-underline"><i class="fa fa-underline"></i> underline</a></li>
		<li><a type="fa fa-undo"><i class="fa fa-undo"></i> undo</a></li>
		<li><a type="fa fa-unlink"><i class="fa fa-unlink"></i> unlink </a></li>
		<li><a type="fa fa-angle-double-down"><i class="fa fa-angle-double-down"></i> angle-double-down</a></li>
		<li><a type="fa fa-angle-double-left"><i class="fa fa-angle-double-left"></i> angle-double-left</a></li>
		<li><a type="fa fa-angle-double-right"><i class="fa fa-angle-double-right"></i> angle-double-right</a></li>
		<li><a type="fa fa-angle-double-up"><i class="fa fa-angle-double-up"></i> angle-double-up</a></li>
		<li><a type="fa fa-angle-down"><i class="fa fa-angle-down"></i> angle-down</a></li>
		<li><a type="fa fa-angle-left"><i class="fa fa-angle-left"></i> angle-left</a></li>
		<li><a type="fa fa-angle-right"><i class="fa fa-angle-right"></i> angle-right</a></li>
		<li><a type="fa fa-angle-up"><i class="fa fa-angle-up"></i> angle-up</a></li>
		<li><a type="fa fa-arrow-circle-down"><i class="fa fa-arrow-circle-down"></i> arrow-circle-down</a></li>
		<li><a type="fa fa-arrow-circle-left"><i class="fa fa-arrow-circle-left"></i> arrow-circle-left</a></li>
		<li><a type="fa fa-arrow-circle-o-down"><i class="fa fa-arrow-circle-o-down"></i> arrow-circle-o-down</a></li>
		<li><a type="fa fa-arrow-circle-o-left"><i class="fa fa-arrow-circle-o-left"></i> arrow-circle-o-left</a></li>
		<li><a type="fa fa-arrow-circle-o-right"><i class="fa fa-arrow-circle-o-right"></i> arrow-circle-o-right</a></li>
		<li><a type="fa fa-arrow-circle-o-up"><i class="fa fa-arrow-circle-o-up"></i> arrow-circle-o-up</a></li>
		<li><a type="fa fa-arrow-circle-right"><i class="fa fa-arrow-circle-right"></i> arrow-circle-right</a></li>
		<li><a type="fa fa-arrow-circle-up"><i class="fa fa-arrow-circle-up"></i> arrow-circle-up</a></li>
		<li><a type="fa fa-arrow-down"><i class="fa fa-arrow-down"></i> arrow-down</a></li>
		<li><a type="fa fa-arrow-left"><i class="fa fa-arrow-left"></i> arrow-left</a></li>
		<li><a type="fa fa-arrow-right"><i class="fa fa-arrow-right"></i> arrow-right</a></li>
		<li><a type="fa fa-arrow-up"><i class="fa fa-arrow-up"></i> arrow-up</a></li>
		<li><a type="fa fa-arrows"><i class="fa fa-arrows"></i> arrows</a></li>
		<li><a type="fa fa-arrows-alt"><i class="fa fa-arrows-alt"></i> arrows-alt</a></li>
		<li><a type="fa fa-arrows-h"><i class="fa fa-arrows-h"></i> arrows-h</a></li>
		<li><a type="fa fa-arrows-v"><i class="fa fa-arrows-v"></i> arrows-v</a></li>
		<li><a type="fa fa-caret-down"><i class="fa fa-caret-down"></i> caret-down</a></li>
		<li><a type="fa fa-caret-left"><i class="fa fa-caret-left"></i> caret-left</a></li>
		<li><a type="fa fa-caret-right"><i class="fa fa-caret-right"></i> caret-right</a></li>
		<li><a type="fa fa-caret-square-o-down"><i class="fa fa-caret-square-o-down"></i> caret-square-o-down</a></li>
		<li><a type="fa fa-caret-square-o-left"><i class="fa fa-caret-square-o-left"></i> caret-square-o-left</a></li>
		<li><a type="fa fa-caret-square-o-right"><i class="fa fa-caret-square-o-right"></i> caret-square-o-right</a></li>
		<li><a type="fa fa-caret-square-o-up"><i class="fa fa-caret-square-o-up"></i> caret-square-o-up</a></li>
		<li><a type="fa fa-caret-up"><i class="fa fa-caret-up"></i> caret-up</a></li>
		<li><a type="fa fa-chevron-circle-down"><i class="fa fa-chevron-circle-down"></i> chevron-circle-down</a></li>
		<li><a type="fa fa-chevron-circle-left"><i class="fa fa-chevron-circle-left"></i> chevron-circle-left</a></li>
		<li><a type="fa fa-chevron-circle-right"><i class="fa fa-chevron-circle-right"></i> chevron-circle-right</a></li>
		<li><a type="fa fa-chevron-circle-up"><i class="fa fa-chevron-circle-up"></i> chevron-circle-up</a></li>
		<li><a type="fa fa-chevron-down"><i class="fa fa-chevron-down"></i> chevron-down</a></li>
		<li><a type="fa fa-chevron-left"><i class="fa fa-chevron-left"></i> chevron-left</a></li>
		<li><a type="fa fa-chevron-right"><i class="fa fa-chevron-right"></i> chevron-right</a></li>
		<li><a type="fa fa-chevron-up"><i class="fa fa-chevron-up"></i> chevron-up</a></li>
		<li><a type="fa fa-exchange"><i class="fa fa-exchange"></i> exchange</a></li>
		<li><a type="fa fa-hand-o-down"><i class="fa fa-hand-o-down"></i> hand-o-down</a></li>
		<li><a type="fa fa-hand-o-left"><i class="fa fa-hand-o-left"></i> hand-o-left</a></li>
		<li><a type="fa fa-hand-o-right"><i class="fa fa-hand-o-right"></i> hand-o-right</a></li>
		<li><a type="fa fa-hand-o-up"><i class="fa fa-hand-o-up"></i> hand-o-up</a></li>
		<li><a type="fa fa-long-arrow-down"><i class="fa fa-long-arrow-down"></i> long-arrow-down</a></li>
		<li><a type="fa fa-long-arrow-left"><i class="fa fa-long-arrow-left"></i> long-arrow-left</a></li>
		<li><a type="fa fa-long-arrow-right"><i class="fa fa-long-arrow-right"></i> long-arrow-right</a></li>
		<li><a type="fa fa-long-arrow-up"><i class="fa fa-long-arrow-up"></i> long-arrow-up</a></li>
		<li><a type="fa fa-toggle-down"><i class="fa fa-toggle-down"></i> toggle-down </a></li>
		<li><a type="fa fa-caret-square-o-left"><i class="fa fa-toggle-left"></i> toggle-left </a></li>
		<li><a type="fa fa-toggle-left"><i class="fa fa-toggle-right"></i> toggle-right </a></li>
		<li><a type="fa fa-toggle-up"><i class="fa fa-toggle-up"></i> toggle-up </a></li>
		<li><a type="fa fa-arrows-alt"><i class="fa fa-arrows-alt"></i> arrows-alt</a></li>
		<li><a type="fa fa-backward"><i class="fa fa-backward"></i> backward</a></li>
		<li><a type="fa fa-compress"><i class="fa fa-compress"></i> compress</a></li>
		<li><a type="fa fa-eject"><i class="fa fa-eject"></i> eject</a></li>
		<li><a type="fa fa-expand"><i class="fa fa-expand"></i> expand</a></li>
		<li><a type="fa fa-fast-backward"><i class="fa fa-fast-backward"></i> fast-backward</a></li>
		<li><a type="fa fa-fast-forward"><i class="fa fa-fast-forward"></i> fast-forward</a></li>
		<li><a type="fa fa-forward"><i class="fa fa-forward"></i> forward</a></li>
		<li><a type="fa fa-pause"><i class="fa fa-pause"></i> pause</a></li>
		<li><a type="fa fa-play"><i class="fa fa-play"></i> play</a></li>
		<li><a type="fa fa-play-circle"><i class="fa fa-play-circle"></i> play-circle</a></li>
		<li><a type="fa fa-play-circle-o"><i class="fa fa-play-circle-o"></i> play-circle-o</a></li>
		<li><a type="fa fa-random"><i class="fa fa-random"></i> random</a></li>
		<li><a type="fa fa-step-backward"><i class="fa fa-step-backward"></i> step-backward</a></li>
		<li><a type="fa fa-step-forward"><i class="fa fa-step-forward"></i> step-forward</a></li>
		<li><a type="fa fa-stop"><i class="fa fa-stop"></i> stop</a></li>
		<li><a type="fa fa-youtube-play"><i class="fa fa-youtube-play"></i> youtube-play</a></li>
		
		<li><a type="fa fa-500px"><i class="fa fa-500px"></i> 500px</a></li>
		<li><a type="fa fa-adn"><i class="fa fa-adn"></i> adn</a></li>
		<li><a type="fa fa-amazon"><i class="fa fa-amazon"></i> amazon</a></li>
		<li><a type="fa fa-android"><i class="fa fa-android"></i> android</a></li>
		<li><a type="fa fa-angellist"><i class="fa fa-angellist"></i> angellist</a></li>
		<li><a type="fa fa-apple"><i class="fa fa-apple"></i> apple</a></li>
		<li><a type="fa fa-behance"><i class="fa fa-behance"></i> behance</a></li>
		<li><a type="fa fa-behance-square"><i class="fa fa-behance-square"></i> behance-square</a></li>
		<li><a type="fa fa-bitbucket"><i class="fa fa-bitbucket"></i> bitbucket</a></li>
		<li><a type="fa fa-bitbucket-square"><i class="fa fa-bitbucket-square"></i> bitbucket-square</a></li>
		<li><a type="fa fa-btc"><i class="fa fa-bitcoin"></i> bitcoin</a></li>
		<li><a type="fa fa-black-tie"><i class="fa fa-black-tie"></i> black-tie</a></li>
		<li><a type="fa fa-btc"><i class="fa fa-btc"></i> btc</a></li>
		<li><a type="fa fa-buysellads"><i class="fa fa-buysellads"></i> buysellads</a></li>
		<li><a type="fa fa-cc-amex"><i class="fa fa-cc-amex"></i> cc-amex</a></li>
		<li><a type="fa fa-cc-diners-club"><i class="fa fa-cc-diners-club"></i> cc-diners-club</a></li>
		<li><a type="fa fa-cc-discover"><i class="fa fa-cc-discover"></i> cc-discover</a></li>
		<li><a type="fa fa-cc-jcb"><i class="fa fa-cc-jcb"></i> cc-jcb</a></li>
		<li><a type="fa fa-cc-mastercard"><i class="fa fa-cc-mastercard"></i> cc-mastercard</a></li>
		<li><a type="fa fa-cc-paypal"><i class="fa fa-cc-paypal"></i> cc-paypal</a></li>
		<li><a type="fa fa-cc-stripe"><i class="fa fa-cc-stripe"></i> cc-stripe</a></li>
		<li><a type="fa fa-cc-visa"><i class="fa fa-cc-visa"></i> cc-visa</a></li>
		<li><a type="fa fa-chrome"><i class="fa fa-chrome"></i> chrome</a></li>
		<li><a type="fa fa-codepen"><i class="fa fa-codepen"></i> codepen</a></li>
		<li><a type="fa fa-connectdevelop"><i class="fa fa-connectdevelop"></i> connectdevelop</a></li>
		<li><a type="fa fa-contao"><i class="fa fa-contao"></i> contao</a></li>
		<li><a type="fa fa-css3"><i class="fa fa-css3"></i> css3</a></li>
		<li><a type="fa fa-dashcube"><i class="fa fa-dashcube"></i> dashcube</a></li>
		<li><a type="fa fa-delicious"><i class="fa fa-delicious"></i> delicious</a></li>
		<li><a type="fa fa-deviantart"><i class="fa fa-deviantart"></i> deviantart</a></li>
		<li><a type="fa fa-digg"><i class="fa fa-digg"></i> digg</a></li>
		<li><a type="fa fa-dribbble"><i class="fa fa-dribbble"></i> dribbble</a></li>
		<li><a type="fa fa-dropbox"><i class="fa fa-dropbox"></i> dropbox</a></li>
		<li><a type="fa fa-drupal"><i class="fa fa-drupal"></i> drupal</a></li>
		<li><a type="fa fa-empire"><i class="fa fa-empire"></i> empire</a></li>
		<li><a type="fa fa-expeditedssl"><i class="fa fa-expeditedssl"></i> expeditedssl</a></li>
		<li><a type="fa fa-facebook"><i class="fa fa-facebook"></i> facebook</a></li>
		<li><a type="fa fa-facebook-f"><i class="fa fa-facebook-f"></i> facebook-f</a></li>
		<li><a type="fa fa-facebook-official"><i class="fa fa-facebook-official"></i> facebook-official</a></li>
		<li><a type="fa fa-facebook-square"><i class="fa fa-facebook-square"></i> facebook-square</a></li>
		<li><a type="fa fa-firefox"><i class="fa fa-firefox"></i> firefox</a></li>
		<li><a type="fa fa-flickr"><i class="fa fa-flickr"></i> flickr</a></li>
		<li><a type="fa fa-fonticons"><i class="fa fa-fonticons"></i> fonticons</a></li>
		<li><a type="fa fa-forumbee"><i class="fa fa-forumbee"></i> forumbee</a></li>
		<li><a type="fa fa-foursquare"><i class="fa fa-foursquare"></i> foursquare</a></li>
		<li><a type="fa  fa-ge"><i class="fa fa-ge"></i> ge</a></li>
		<li><a type="fa fa-get-pocket"><i class="fa fa-get-pocket"></i> get-pocket</a></li>
		<li><a type="fa fa-gg"><i class="fa fa-gg"></i> gg</a></li>
		<li><a type="fa fa-gg-circle"><i class="fa fa-gg-circle"></i> gg-circle</a></li>
		<li><a type="fa fa-git"><i class="fa fa-git"></i> git</a></li>
		<li><a type="fa fa-git-square"><i class="fa fa-git-square"></i> git-square</a></li>
		<li><a type="fa fa-github"><i class="fa fa-github"></i> github</a></li>
		<li><a type="fa fa-github-alt"><i class="fa fa-github-alt"></i> github-alt</a></li>
		<li><a type="fa fa-github-square"><i class="fa fa-github-square"></i> github-square</a></li>
		<li><a type="fa fa-gittip"><i class="fa fa-gittip"></i> gittip</a></li>
		<li><a type="fa fa-google"><i class="fa fa-google"></i> google</a></li>
		<li><a type="fa fa-google-plus"><i class="fa fa-google-plus"></i> google-plus</a></li>
		<li><a type="fa fa-google-plus-square"><i class="fa fa-google-plus-square"></i> google-plus-square</a></li>
		<li><a type="fa fa-google-wallet"><i class="fa fa-google-wallet"></i> google-wallet</a></li>
		<li><a type="fa fa-gratipay"><i class="fa fa-gratipay"></i> gratipay</a></li>
		<li><a type="fa fa-hacker-news"><i class="fa fa-hacker-news"></i> hacker-news</a></li>
		<li><a type="fa fa-houzz"><i class="fa fa-houzz"></i> houzz</a></li>
		<li><a type="fa fa-html5"><i class="fa fa-html5"></i> html5</a></li>
		<li><a type="fa fa-instagram"><i class="fa fa-instagram"></i> instagram</a></li>
		<li><a type="fa fa-internet-explorer"><i class="fa fa-internet-explorer"></i> internet-explorer</a></li>
		<li><a type="fa fa-ioxhost"><i class="fa fa-ioxhost"></i> ioxhost</a></li>
		<li><a type="fa fa-joomla"><i class="fa fa-joomla"></i> joomla</a></li>
		<li><a type="fa fa-jsfiddle"><i class="fa fa-jsfiddle"></i> jsfiddle</a></li>
		<li><a type="fa fa-lastfm"><i class="fa fa-lastfm"></i> lastfm</a></li>
		<li><a type="fa fa-lastfm-square"><i class="fa fa-lastfm-square"></i> lastfm-square</a></li>
		<li><a type="fa fa-leanpub"><i class="fa fa-leanpub"></i> leanpub</a></li>
		<li><a type="fa fa-linkedin"><i class="fa fa-linkedin"></i> linkedin</a></li>
		<li><a type="fa fa-linkedin-square"><i class="fa fa-linkedin-square"></i> linkedin-square</a></li>
		<li><a type="fa fa-linux"><i class="fa fa-linux"></i> linux</a></li>
		<li><a type="fa fa-maxcdn"><i class="fa fa-maxcdn"></i> maxcdn</a></li>
		<li><a type="fa fa-meanpath"><i class="fa fa-meanpath"></i> meanpath</a></li>
		<li><a type="fa fa-medium"><i class="fa fa-medium"></i> medium</a></li>
		<li><a type="fa fa-odnoklassniki"><i class="fa fa-odnoklassniki"></i> odnoklassniki</a></li>
		<li><a type="fa fa-odnoklassniki-square"><i class="fa fa-odnoklassniki-square"></i> odnoklassniki-square</a></li>
		<li><a type="fa fa-opencart"><i class="fa fa-opencart"></i> opencart</a></li>
		<li><a type="fa fa-openid"><i class="fa fa-openid"></i> openid</a></li>
		<li><a type="fa fa-opera"><i class="fa fa-opera"></i> opera</a></li>
		<li><a type="fa fa-optin-monster"><i class="fa fa-optin-monster"></i> optin-monster</a></li>
		<li><a type="fa fa-pagelines"><i class="fa fa-pagelines"></i> pagelines</a></li>
		<li><a type="fa fa-paypal"><i class="fa fa-paypal"></i> paypal</a></li>
		<li><a type="fa fa-pied-piper"><i class="fa fa-pied-piper"></i> pied-piper</a></li>
		<li><a type="fa fa-pied-piper-alt"><i class="fa fa-pied-piper-alt"></i> pied-piper-alt</a></li>
		<li><a type="fa fa-pinterest"><i class="fa fa-pinterest"></i> pinterest</a></li>
		<li><a type="fa fa-pinterest-p"><i class="fa fa-pinterest-p"></i> pinterest-p</a></li>
		<li><a type="fa fa-pinterest-square"><i class="fa fa-pinterest-square"></i> pinterest-square</a></li>
		<li><a type="fa fa-qq"><i class="fa fa-qq"></i> qq</a></li>
		<li><a type="fa fa-ra"><i class="fa fa-ra"></i> ra </span></a></li>
		<li><a type="fa fa-rebel"><i class="fa fa-rebel"></i> rebel</a></li>
		<li><a type="fa fa-reddit"><i class="fa fa-reddit"></i> reddit</a></li>
		<li><a type="fa fa-reddit-square"><i class="fa fa-reddit-square"></i> reddit-square</a></li>
		<li><a type="fa fa-renren"><i class="fa fa-renren"></i> renren</a></li>
		<li><a type="fa fa-safari"><i class="fa fa-safari"></i> safari</a></li>
		<li><a type="fa fa-sellsy"><i class="fa fa-sellsy"></i> sellsy</a></li>
		<li><a type="fa fa-share-alt"><i class="fa fa-share-alt"></i> share-alt</a></li>
		<li><a type="fa fa-share-alt-square"><i class="fa fa-share-alt-square"></i> share-alt-square</a></li>
		<li><a type="fa fa-shirtsinbulk"><i class="fa fa-shirtsinbulk"></i> shirtsinbulk</a></li>
		<li><a type="fa fa-simplybuilt"><i class="fa fa-simplybuilt"></i> simplybuilt</a></li>
		<li><a type="fa fa-skyatlas"><i class="fa fa-skyatlas"></i> skyatlas</a></li>
		<li><a type="fa fa-skype"><i class="fa fa-skype"></i> skype</a></li>
		<li><a type="fa fa-slack"><i class="fa fa-slack"></i> slack</a></li>
		<li><a type="fa fa-slideshare"><i class="fa fa-slideshare"></i> slideshare</a></li>
		<li><a type="fa fa-soundcloud"><i class="fa fa-soundcloud"></i> soundcloud</a></li>
		<li><a type="fa fa-spotify"><i class="fa fa-spotify"></i> spotify</a></li>
		<li><a type="fa fa-stack-exchange"><i class="fa fa-stack-exchange"></i> stack-exchange</a></li>
		<li><a type="fa fa-stack-overflow"><i class="fa fa-stack-overflow"></i> stack-overflow</a></li>
		<li><a type="fa fa-steam"><i class="fa fa-steam"></i> steam</a></li>
		<li><a type="fa fa-steam-square"><i class="fa fa-steam-square"></i> steam-square</a></li>
		<li><a type="fa fa-stumbleupon"><i class="fa fa-stumbleupon"></i> stumbleupon</a></li>
		<li><a type="fa fa-stumbleupon-circle"><i class="fa fa-stumbleupon-circle"></i> stumbleupon-circle</a></li>
		<li><a type="fa fa-tencent-weibo"><i class="fa fa-tencent-weibo"></i> tencent-weibo</a></li>
		<li><a type="fa fa-trello"><i class="fa fa-trello"></i> trello</a></li>
		<li><a type="fa fa-tripadvisor"><i class="fa fa-tripadvisor"></i> tripadvisor</a></li>
		<li><a type="fa fa-tumblr"><i class="fa fa-tumblr"></i> tumblr</a></li>
		<li><a type="fa fa-tumblr-square"><i class="fa fa-tumblr-square"></i> tumblr-square</a></li>
		<li><a type="fa fa-twitch"><i class="fa fa-twitch"></i> twitch</a></li>
		<li><a type="fa fa-twitter"><i class="fa fa-twitter"></i> twitter</a></li>
		<li><a type="fa fa-twitter-square"><i class="fa fa-twitter-square"></i> twitter-square</a></li>
		<li><a type="fa fa-viacoin"><i class="fa fa-viacoin"></i> viacoin</a></li>
		<li><a type="fa fa-vimeo"><i class="fa fa-vimeo"></i> vimeo</a></li>
		<li><a type="fa fa-vimeo-square"><i class="fa fa-vimeo-square"></i> vimeo-square</a></li>
		<li><a type="fa fa-vine"><i class="fa fa-vine"></i> vine</a></li>
		<li><a type="fa fa-vk"><i class="fa fa-vk"></i> vk</a></li>
		<li><a type="fa fa-wechat"><i class="fa fa-wechat"></i> wechat</a></li>
		<li><a type="fa fa-weibo"><i class="fa fa-weibo"></i> weibo</a></li>
		<li><a type="fa fa-weixin"><i class="fa fa-weixin"></i> weixin</a></li>
		<li><a type="fa fa-whatsapp"><i class="fa fa-whatsapp"></i> whatsapp</a></li>
		<li><a type="fa fa-wikipedia-w"><i class="fa fa-wikipedia-w"></i> wikipedia-w</a></li>
		<li><a type="fa fa-windows"><i class="fa fa-windows"></i> windows</a></li>
		<li><a type="fa fa-wordpress"><i class="fa fa-wordpress"></i> wordpress</a></li>
		<li><a type="fa fa-xing"><i class="fa fa-xing"></i> xing</a></li>
		<li><a type="fa fa-xing-square"><i class="fa fa-xing-square"></i> xing-square</a></li>
		<li><a type="fa fa-y-combinator"><i class="fa fa-y-combinator"></i> y-combinator</a></li>
		<li><a type="fa fa-y-combinator-square"><i class="fa fa-y-combinator-square"></i> y-combinator-square</a></li>
		<li><a type="fa fa-yahoo"><i class="fa fa-yahoo"></i> yahoo</a></li>
		<li><a type="fa fa-yc"><i class="fa fa-yc"></i> yc</a></li>
		<li><a type="fa fa-yc-square"><i class="fa fa-yc-square"></i> yc-square</a></li>
		<li><a type="fa fa-yelp"><i class="fa fa-yelp"></i> yelp</a></li>
		<li><a type="fa fa-youtube"><i class="fa fa-youtube"></i> youtube</a></li>
		<li><a type="fa fa-youtube-play"><i class="fa fa-youtube-play"></i> youtube-play</a></li>
		<li><a type="fa fa-youtube-square"><i class="fa fa-youtube-square"></i> youtube-square</a></li>
		<li><a type="fa fa-ambulance"><i class="fa fa-ambulance"></i> ambulance</a></li>
		<li><a type="fa fa-h-square"><i class="fa fa-h-square"></i> h-square</a></li>
		<li><a type="fa fa-heart"><i class="fa fa-heart"></i> heart</a></li>
		<li><a type="fa fa-heart-o"><i class="fa fa-heart-o"></i> heart-o</a></li>
		<li><a type="fa fa-heartbeat"><i class="fa fa-heartbeat"></i> heartbeat</a></li>
		<li><a type="fa fa-hospital-o"><i class="fa fa-hospital-o"></i> hospital-o</a></li>
		<li><a type="fa fa-medkit"><i class="fa fa-medkit"></i> medkit</a></li>
		<li><a type="fa fa-plus-square"><i class="fa fa-plus-square"></i> plus-square</a></li>
		<li><a type="fa fa-stethoscope"><i class="fa fa-stethoscope"></i> stethoscope</a></li>
		<li><a type="fa fa-user-md"><i class="fa fa-user-md"></i> user-md</a></li>
		<li><a type="fa fa-wheelchair"><i class="fa fa-wheelchair"></i> wheelchair</a></li>
      </ul>
      </div>
 

      </div>
      <h3 class="docs-title">Font Awesome 字体图标的使用</h3>
      <div class="docs-detail">Font Awesome 字体图标的使用同Glyphicons 字体图标使用方法类似。Font Awesome 字体图标的类同样需要一个基类和对应每个图标的类，例如<code>fa fa-star</code>，具体应用代码如下：</div>
      <div class="docs-example">
          <h5>实例：</h5>
	      <div class="cz_button cz_bg1"><span class="fa fa-pencil"></span></div>
	      <div class="cz_button cz_bg2"><span class="fa fa-list-ul"></span></div>
	      <div class="cz_button cz_bg3"><span class="fa fa-remove"></span></div>
	      <div class="cz_button cz_bg4"><span class="fa fa-list-alt"></span></div>
	      <div class="cz_button cz_bg5"><span class="fa fa-book"></span></div>
	      <div class="cz_button cz_bg6"><span class="fa fa-edit"></span></div>
      </div>
      <div class="highlight">
        <pre>
          <code><span class="nt">&lt;div</span><span class="na"> class=</span><span class="s">"cz_button cz_bg1"</span><span class="nt">&gt;&lt;span</span><span class="na"> class=</span><span class="s">"fa fa-pencil"</span><span class="nt">&gt;&lt;/span&gt;&lt;/div&gt;</span>
<span class="nt">&lt;div</span><span class="na"> class=</span><span class="s">"cz_button cz_bg2"</span><span class="nt">&gt;&lt;span</span><span class="na"> class=</span><span class="s">"fa fa-list-ul"</span><span class="nt">&gt;&lt;/span&gt;&lt;/div&gt;</span>
<span class="nt">&lt;div</span><span class="na"> class=</span><span class="s">"cz_button cz_bg3"</span><span class="nt">&gt;&lt;span</span><span class="na"> class=</span><span class="s">"fa fa-remove"</span><span class="nt">&gt;&lt;/span&gt;&lt;/div&gt;</span>
<span class="nt">&lt;div</span><span class="na"> class=</span><span class="s">"cz_button cz_bg4"</span><span class="nt">&gt;&lt;span</span><span class="na"> class=</span><span class="s">"fa fa-list-alt"</span><span class="nt">&gt;&lt;/span&gt;&lt;/div&gt;</span>
<span class="nt">&lt;div</span><span class="na"> class=</span><span class="s">"cz_button cz_bg5"</span><span class="nt">&gt;&lt;span</span><span class="na"> class=</span><span class="s">"fa fa-book"</span><span class="nt">&gt;&lt;/span&gt;&lt;/div&gt;</span>
<span class="nt">&lt;div</span><span class="na"> class=</span><span class="s">"cz_button cz_bg6"</span><span class="nt">&gt;&lt;span</span><span class="na"> class=</span><span class="s">"fa fa-edit"</span><span class="nt">&gt;&lt;/span&gt;&lt;/div&gt;</span></code>
        </pre>
      </div>
    <div class="clr"></div>
  </div>
</div>
 
  
</body>
</html>

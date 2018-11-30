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
.docs-header{background-color: #ebebeb;padding: 20px 15px 40px;margin-top:-15px;font-size:13px;}
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
.bs-glyphicons li { background-color: #fff;border: 1px solid #f5f5f5;float: left;font-size: 13px;line-height: 1.4;padding: 10px;padding-left:15px;text-align: left;width: 25%;}
.bs-glyphicons-list li:hover{ background:#63c5ea; color:#fff; cursor:default;}

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
</style>
  
</head>
<body>
<div class="Contentbox">
 <div class="mainbg"></div>
  <div class="pd10">    
    <div class="docs-header">
      <h1>组件</h1>
      <p>可复用的组件，包括字体图标、按钮、下拉菜单、导航、表格、弹出框等更多功能。更多详细代码见 <a class="docs_link" target="_blank" href="http://v3.bootcss.com/components/">Bootstrap中文文档</a> 。</p>
    </div>
    <div class="docs-container">
      <h3 class="docs-title">Glyphicons 字体图标</h3>
      <div class="bs-glyphicons">
        <ul class="bs-glyphicons-list">
	        <li>
	          <span class="glyphicon glyphicon-asterisk"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-asterisk</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-plus"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-plus</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-euro"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-euro</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-minus"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-minus</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-cloud"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-cloud</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-envelope"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-envelope</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-pencil"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-pencil</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-glass"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-glass</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-music"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-music</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-search"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-search</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-heart"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-heart</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-star"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-star</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-star-empty"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-star-empty</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-user"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-user</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-film"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-film</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-th-large"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-th-large</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-th"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-th</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-th-list"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-th-list</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-ok"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-ok</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-remove"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-remove</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-zoom-in"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-zoom-in</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-zoom-out"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-zoom-out</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-off"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-off</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-signal"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-signal</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-cog"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-cog</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-trash"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-trash</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-home"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-home</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-file"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-file</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-time"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-time</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-road"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-road</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-download-alt"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-download-alt</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-download"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-download</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-upload"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-upload</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-inbox"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-inbox</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-play-circle"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-play-circle</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-repeat"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-repeat</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-refresh"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-refresh</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-list-alt"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-list-alt</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-lock"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-lock</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-flag"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-flag</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-headphones"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-headphones</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-volume-off"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-volume-off</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-volume-down"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-volume-down</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-volume-up"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-volume-up</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-qrcode"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-qrcode</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-barcode"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-barcode</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-tag"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-tag</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-tags"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-tags</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-book"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-book</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-bookmark"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-bookmark</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-print"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-print</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-camera"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-camera</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-font"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-font</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-bold"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-bold</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-italic"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-italic</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-text-height"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-text-height</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-text-width"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-text-width</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-align-left"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-align-left</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-align-center"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-align-center</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-align-right"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-align-right</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-align-justify"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-align-justify</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-list"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-list</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-indent-left"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-indent-left</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-indent-right"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-indent-right</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-facetime-video"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-facetime-video</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-picture"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-picture</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-map-marker"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-map-marker</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-adjust"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-adjust</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-tint"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-tint</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-edit"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-edit</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-share"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-share</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-check"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-check</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-move"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-move</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-step-backward"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-step-backward</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-fast-backward"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-fast-backward</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-backward"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-backward</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-play"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-play</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-pause"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-pause</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-stop"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-stop</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-forward"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-forward</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-fast-forward"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-fast-forward</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-step-forward"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-step-forward</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-eject"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-eject</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-chevron-left"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-chevron-left</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-chevron-right"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-chevron-right</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-plus-sign"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-plus-sign</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-minus-sign"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-minus-sign</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-remove-sign"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-remove-sign</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-ok-sign"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-ok-sign</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-question-sign"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-question-sign</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-info-sign"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-info-sign</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-screenshot"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-screenshot</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-remove-circle"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-remove-circle</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-ok-circle"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-ok-circle</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-ban-circle"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-ban-circle</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-arrow-left"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-arrow-left</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-arrow-right"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-arrow-right</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-arrow-up"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-arrow-up</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-arrow-down"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-arrow-down</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-share-alt"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-share-alt</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-resize-full"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-resize-full</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-resize-small"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-resize-small</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-exclamation-sign"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-exclamation-sign</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-gift"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-gift</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-leaf"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-leaf</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-fire"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-fire</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-eye-open"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-eye-open</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-eye-close"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-eye-close</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-warning-sign"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-warning-sign</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-plane"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-plane</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-calendar"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-calendar</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-random"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-random</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-comment"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-comment</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-magnet"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-magnet</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-chevron-up"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-chevron-up</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-chevron-down"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-chevron-down</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-retweet"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-retweet</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-shopping-cart"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-shopping-cart</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-folder-close"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-folder-close</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-folder-open"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-folder-open</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-resize-vertical"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-resize-vertical</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-resize-horizontal"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-resize-horizontal</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-hdd"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-hdd</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-bullhorn"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-bullhorn</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-bell"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-bell</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-certificate"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-certificate</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-thumbs-up"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-thumbs-up</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-thumbs-down"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-thumbs-down</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-hand-right"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-hand-right</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-hand-left"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-hand-left</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-hand-up"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-hand-up</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-hand-down"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-hand-down</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-circle-arrow-right"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-circle-arrow-right</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-circle-arrow-left"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-circle-arrow-left</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-circle-arrow-up"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-circle-arrow-up</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-circle-arrow-down"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-circle-arrow-down</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-globe"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-globe</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-wrench"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-wrench</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-tasks"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-tasks</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-filter"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-filter</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-briefcase"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-briefcase</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-fullscreen"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-fullscreen</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-dashboard"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-dashboard</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-paperclip"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-paperclip</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-heart-empty"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-heart-empty</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-link"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-link</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-phone"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-phone</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-pushpin"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-pushpin</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-usd"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-usd</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-gbp"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-gbp</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-sort"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-sort</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-sort-by-alphabet"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-sort-by-alphabet</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-sort-by-alphabet-alt"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-sort-by-alphabet-alt</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-sort-by-order"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-sort-by-order</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-sort-by-order-alt"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-sort-by-order-alt</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-sort-by-attributes"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-sort-by-attributes</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-sort-by-attributes-alt"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-sort-by-attributes-alt</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-unchecked"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-unchecked</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-expand"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-expand</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-collapse-down"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-collapse-down</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-collapse-up"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-collapse-up</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-log-in"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-log-in</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-flash"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-flash</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-log-out"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-log-out</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-new-window"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-new-window</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-record"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-record</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-save"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-save</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-open"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-open</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-saved"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-saved</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-import"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-import</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-export"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-export</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-send"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-send</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-floppy-disk"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-floppy-disk</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-floppy-saved"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-floppy-saved</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-floppy-remove"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-floppy-remove</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-floppy-save"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-floppy-save</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-floppy-open"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-floppy-open</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-credit-card"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-credit-card</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-transfer"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-transfer</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-cutlery"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-cutlery</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-header"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-header</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-compressed"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-compressed</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-earphone"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-earphone</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-phone-alt"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-phone-alt</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-tower"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-tower</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-stats"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-stats</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-sd-video"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-sd-video</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-hd-video"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-hd-video</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-subtitles"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-subtitles</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-sound-stereo"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-sound-stereo</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-sound-dolby"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-sound-dolby</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-sound-5-1"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-sound-5-1</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-sound-6-1"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-sound-6-1</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-sound-7-1"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-sound-7-1</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-copyright-mark"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-copyright-mark</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-registration-mark"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-registration-mark</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-cloud-download"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-cloud-download</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-cloud-upload"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-cloud-upload</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-tree-conifer"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-tree-conifer</span>
	        </li>
	        <li>
	          <span class="glyphicon glyphicon-tree-deciduous"></span>
	          <span class="glyphicon-class">glyphicon glyphicon-tree-deciduous</span>
	        </li>
        </ul>
      </div>
      <h3 class="docs-title">表格中的操作图标</h3>
      <div class="docs-detail">表格中的操作图标都是由彩色背景及Glyphicons 字体图标两部分组成。Glyphicons 字体图标的类需要一个基类和对应每个图标的类，例如<code>glyphicon glyphicon-star</code>，具体应用代码如下：</div>
      <div class="docs-example">
          <h5>实例：</h5>
	      <div class="cz_button cz_bg1"><span class="glyphicon glyphicon-pencil"></span></div>
	      <div class="cz_button cz_bg2"><span class="glyphicon glyphicon-th-list"></span></div>
	      <div class="cz_button cz_bg3"><span class="glyphicon glyphicon-remove"></span></div>
	      <div class="cz_button cz_bg4"><span class="glyphicon glyphicon-list-alt"></span></div>
	      <div class="cz_button cz_bg5"><span class="glyphicon glyphicon-book"></span></div>
	      <div class="cz_button cz_bg6"><span class="glyphicon glyphicon-edit"></span></div>
      </div>
      <div class="highlight">
        <pre>
          <code><span class="nt">&lt;div</span><span class="na"> class=</span><span class="s">"cz_button cz_bg1"</span><span class="nt">&gt;&lt;span</span><span class="na"> class=</span><span class="s">"glyphicon glyphicon-pencil"</span><span class="nt">&gt;&lt;/span&gt;&lt;/div&gt;</span>
<span class="nt">&lt;div</span><span class="na"> class=</span><span class="s">"cz_button cz_bg2"</span><span class="nt">&gt;&lt;span</span><span class="na"> class=</span><span class="s">"glyphicon glyphicon-th-list"</span><span class="nt">&gt;&lt;/span&gt;&lt;/div&gt;</span>
<span class="nt">&lt;div</span><span class="na"> class=</span><span class="s">"cz_button cz_bg3"</span><span class="nt">&gt;&lt;span</span><span class="na"> class=</span><span class="s">"glyphicon glyphicon-remove"</span><span class="nt">&gt;&lt;/span&gt;&lt;/div&gt;</span>
<span class="nt">&lt;div</span><span class="na"> class=</span><span class="s">"cz_button cz_bg4"</span><span class="nt">&gt;&lt;span</span><span class="na"> class=</span><span class="s">"glyphicon glyphicon-list-alt"</span><span class="nt">&gt;&lt;/span&gt;&lt;/div&gt;</span>
<span class="nt">&lt;div</span><span class="na"> class=</span><span class="s">"cz_button cz_bg5"</span><span class="nt">&gt;&lt;span</span><span class="na"> class=</span><span class="s">"glyphicon glyphicon-book"</span><span class="nt">&gt;&lt;/span&gt;&lt;/div&gt;</span>
<span class="nt">&lt;div</span><span class="na"> class=</span><span class="s">"cz_button cz_bg6"</span><span class="nt">&gt;&lt;span</span><span class="na"> class=</span><span class="s">"glyphicon glyphicon-edit"</span><span class="nt">&gt;&lt;/span&gt;&lt;/div&gt;</span></code>
        </pre>
      </div>
      <h3 class="docs-title">操作按钮</h3>
      <div class="docs-detail">操作按钮分为两种样式：添加、删除、保存、取消共用一种样式；搜索单独用一种样式，代码如下：</div>
      <div class="docs-example">
        <h5>实例：</h5>
        <button type="button" class="btn btn-info">添加</button>
        <button type="button" class="btn btn-info">删除</button>
        <button type="button" class="btn btn-search">搜 索</button>
      </div>
      <div class="highlight">
        <pre>
          <code><span class="nt">&lt;button</span><span class="na"> type=</span><span class="s">"button"</span><span class="na"> class=</span><span class="s">"btn btn-info"</span><span class="nt">&gt;</span>添加<span class="nt">&lt;/button&gt;</span>
<span class="nt">&lt;button</span><span class="na"> type=</span><span class="s">"button"</span><span class="na"> class=</span><span class="s">"btn btn-info"</span><span class="nt">&gt;</span>删除<span class="nt">&lt;/button&gt;</span>
<span class="nt">&lt;button</span><span class="na"> type=</span><span class="s">"button"</span><span class="na"> class=</span><span class="s">"btn btn-search"</span><span class="nt">&gt;</span>搜索<span class="nt">&lt;/button&gt;</span></code>   
        </pre>
      </div>
      <h3 class="docs-title">表格</h3>
      <h4>一、列表表格（横向表头）</h4>
      <div class="docs-detail">列表表格table标签中的类为<code>&lt;table class="table table-bordered bot_line"&gt;</code>。</div>
      <div class="docs-example">
        <h5>实例：</h5>
        <table  class="table table-bordered bot_line">
         <thead>
          <tr>
            <th width="10px"><input type="checkbox" title="全选/不选" /></th> 
			<th>栏目名称</th> 
			<th>栏目名称</th>
			<th>栏目名称</th>
			<th>栏目名称</th>           
            <th>操作</th>
          </tr>
         </thead>
         <tbody>
          <tr>
            <td><input type="checkbox"/></td>
            <td>内容</td>
            <td>内容</td>
            <td>内容</td>
            <td>内容</td>
            <td>
              <div class="cz_button cz_bg1"><span class="glyphicon glyphicon-pencil"></span></div>
            </td>
          </tr>
          <tr>
            <td><input type="checkbox"/></td>
            <td>内容</td>
            <td>内容</td>
            <td>内容</td>
            <td>内容</td>
            <td>
              <div class="cz_button cz_bg1"><span class="glyphicon glyphicon-pencil"></span></div>           
            </td>
          </tr>
         </tbody>
        </table>
      </div>
      <div class="highlight">
        <pre>
          <code><span class="nt">&lt;table</span><span class="na"> class=</span><span class="s">"table table-bordered bot_line"</span><span class="nt">&gt;
 &lt;thead&gt;
  &lt;tr&gt;
    &lt;th</span><span class="na"> width=</span><span class="s">"10px"</span><span class="nt">&gt;&lt;input</span><span class="na"> type=</span><span class="s">"checkbox"</span><span class="na"> title=</span><span class="s">"全选/不选"</span><span class="nt">/&gt;&lt;/th&gt;
    &lt;th&gt;</span>栏目名称<span class="nt">&lt;/th&gt;
    &lt;th&gt;</span>栏目名称<span class="nt">&lt;/th&gt;
    &lt;th&gt;</span>栏目名称<span class="nt">&lt;/th&gt;
    &lt;th&gt;</span>栏目名称<span class="nt">&lt;/th&gt;
    &lt;th&gt;</span>操作<span class="nt">&lt;/th&gt;
  &lt;/tr&gt;
 &lt;/thead&gt;
 &lt;tbody&gt;
  &lt;tr&gt;
    &lt;td</span><span class="nt">&gt;&lt;input</span><span class="na"> type=</span><span class="s">"checkbox"</span><span class="nt">/&gt;&lt;/td&gt;
    &lt;td&gt;</span>内容<span class="nt">&lt;/td&gt;
    &lt;td&gt;</span>内容<span class="nt">&lt;/td&gt;
    &lt;td&gt;</span>内容<span class="nt">&lt;/td&gt;
    &lt;td&gt;</span>内容<span class="nt">&lt;/td&gt;
    &lt;td&gt;
      <span class="nt">&lt;div</span><span class="na"> class=</span><span class="s">"cz_button cz_bg1"</span><span class="nt">&gt;&lt;span</span><span class="na"> class=</span><span class="s">"glyphicon glyphicon-pencil"</span><span class="nt">&gt;&lt;/span&gt;&lt;/div&gt;</span>
    &lt;/td&gt;
  &lt;/tr&gt;
  &lt;tr&gt;
    &lt;td</span><span class="nt">&gt;&lt;input</span><span class="na"> type=</span><span class="s">"checkbox"</span><span class="nt">/&gt;&lt;/td&gt;
    &lt;td&gt;</span>内容<span class="nt">&lt;/td&gt;
    &lt;td&gt;</span>内容<span class="nt">&lt;/td&gt;
    &lt;td&gt;</span>内容<span class="nt">&lt;/td&gt;
    &lt;td&gt;</span>内容<span class="nt">&lt;/td&gt;
    &lt;td&gt;
      <span class="nt">&lt;div</span><span class="na"> class=</span><span class="s">"cz_button cz_bg1"</span><span class="nt">&gt;&lt;span</span><span class="na"> class=</span><span class="s">"glyphicon glyphicon-pencil"</span><span class="nt">&gt;&lt;/span&gt;&lt;/div&gt;</span>
    &lt;/td&gt;
  &lt;/tr&gt;
 &lt;/tbody&gt;
&lt;/table&gt;
</code>   
        </pre>
      </div>
      <h4>二、查看表格（横向及竖向两种表头）</h4>
      <div class="docs-detail">查看类表格分为两类：横向及竖向表头两种；其中竖向表头也分”文字内容中间对齐“及”文字内容右对齐“为两种，具体实例如下：</div>
      <div class="docs-example">
        <h5>实例 1 (横向表头)：</h5>
        <table class="addlist_center table-bordered mt10">
          <thead>
           <tr>
             <th colspan="4">详细信息</th>          
           </tr>          
          </thead>
           <tbody><tr>
             <th>角色代码</th>
             <th>角色名称</th>
             <th>主页链接地址</th>
             <th>可用否</th>            
           </tr>
           <tr>
             <td>123123</td>
             <td>系统管理员</td>
             <td>commons/main/main_01</td>  
              <td>可用</td>         
           </tr>
            <tr>
             <td>123123</td>
             <td>系统管理员</td>
             <td>commons/main/main_01</td>  
              <td>可用</td>         
           </tr>          
         </tbody>
       </table>
      </div>
      <div class="highlight">
        <pre>
          <code><span class="nt">&lt;table</span><span class="na"> class=</span><span class="s">"addlist_center table-bordered mt10"</span><span class="nt">&gt;
 &lt;thead&gt;
  &lt;tr&gt;
    &lt;th</span><span class="na"> colspan=</span><span class="s">"4"</span><span class="nt">&gt;</span>详细信息<span class="nt">&lt;/th&gt;
  &lt;/tr&gt;
 &lt;/thead&gt;
 &lt;tbody&gt;
  &lt;tr&gt;
    &lt;th&gt;</span>角色代码<span class="nt">&lt;/th&gt;
    &lt;th&gt;</span>角色名称<span class="nt">&lt;/th&gt;
    &lt;th&gt;</span>主页链接地址<span class="nt">&lt;/th&gt;
    &lt;th&gt;</span>可用否<span class="nt">&lt;/th&gt;
  &lt;/tr&gt; 
  &lt;tr&gt;
    &lt;td&gt;</span>123123<span class="nt">&lt;/td&gt;
    &lt;td&gt;</span>系统管理员<span class="nt">&lt;/td&gt;
    &lt;td&gt;</span>commons/main/main_01<span class="nt">&lt;/td&gt;
    &lt;td&gt;</span>可用<span class="nt">&lt;/td&gt;
  &lt;/tr&gt;
  &lt;tr&gt;
    &lt;td&gt;</span>123123<span class="nt">&lt;/td&gt;
    &lt;td&gt;</span>系统管理员<span class="nt">&lt;/td&gt;
    &lt;td&gt;</span>commons/main/main_01<span class="nt">&lt;/td&gt;
    &lt;td&gt;</span>可用<span class="nt">&lt;/td&gt;
  &lt;/tr&gt;
 &lt;/tbody&gt;
&lt;/table&gt;
</code>   
        </pre>
      </div>
      <div class="docs-example">
        <h5>实例 2 (竖向表头-th、td文字居中对齐)：</h5>
        <table class="addlist_center table-bordered mt10">
           <tbody>
           <tr>
             <th>角色代码：</th>
             <td>2016001</td>
             <th>角色代码：</th>
             <td>2016001</td>            
           </tr>
           <tr>
             <th>角色名称：</th>
             <td>系统管理员</td>
             <th>角色名称：</th>
             <td>系统管理员</td>            
           </tr>
           <tr>
             <th>主页链接地址：</th>
             <td>commons/main/main_01</td>
              <th>主页链接地址：</th>
             <td>commons/main/main_01</td>            
           </tr>
           <tr>
             <th>可用否：</th>
             <td>可用</td>
             <th>是否通过：</th>
             <td>通过 </td>             
           </tr>
         </tbody>
       </table>
      </div>
      <div class="highlight">
        <pre>
          <code><span class="nt">&lt;table</span><span class="na"> class=</span><span class="s">"addlist_center table-bordered mt10"</span><span class="nt">&gt;
 &lt;tbody&gt;
  &lt;tr&gt;
    &lt;th&gt;</span>角色代码：<span class="nt">&lt;/th&gt;
    &lt;td&gt;</span>2016001<span class="nt">&lt;/td&gt;
    &lt;th&gt;</span>角色代码：<span class="nt">&lt;/th&gt;
    &lt;td&gt;</span>2016001<span class="nt">&lt;/td&gt;
  &lt;/tr&gt;
  &lt;tr&gt;
    &lt;th&gt;</span>角色名称：<span class="nt">&lt;/th&gt;
    &lt;td&gt;</span>系统管理员<span class="nt">&lt;/td&gt;
    &lt;th&gt;</span>角色名称：<span class="nt">&lt;/th&gt;
    &lt;td&gt;</span>系统管理员<span class="nt">&lt;/td&gt;
  &lt;/tr&gt;
  &lt;tr&gt;
    &lt;th&gt;</span>主页链接地址：<span class="nt">&lt;/th&gt;
    &lt;td&gt;</span>commons/main/main_01<span class="nt">&lt;/td&gt;
    &lt;th&gt;</span>主页链接地址：<span class="nt">&lt;/th&gt;
    &lt;td&gt;</span>commons/main/main_01<span class="nt">&lt;/td&gt;
  &lt;/tr&gt;
  &lt;tr&gt;
    &lt;th&gt;</span>可用否：<span class="nt">&lt;/th&gt;
    &lt;td&gt;</span>可用<span class="nt">&lt;/td&gt;
    &lt;th&gt;</span>是否通过：<span class="nt">&lt;/th&gt;
    &lt;td&gt;</span>通过<span class="nt">&lt;/td&gt;
  &lt;/tr&gt;
 &lt;/tbody&gt;
&lt;/table&gt;
</code>   
        </pre>
      </div>
      <div class="docs-example">
        <h5>实例 3 (竖向表头-th文字右对齐)：</h5>
        <table class="addlist table-bordered mt10">
           <tbody>
           <tr>
             <th>角色代码：</th>
             <td>2016001</td>
             <th>角色代码：</th>
             <td>2016001</td>            
           </tr>
           <tr>
             <th>角色名称：</th>
             <td>系统管理员</td>
             <th>角色名称：</th>
             <td>系统管理员</td>            
           </tr>
           <tr>
             <th>主页链接地址：</th>
             <td>commons/main/main_01</td>
              <th>主页链接地址：</th>
             <td>commons/main/main_01</td>            
           </tr>
           <tr>
             <th>可用否：</th>
             <td>可用</td>
             <th>是否通过：</th>
             <td>通过 </td>             
           </tr>
           <tr>
             <th>角色描述：</th>
             <td colspan="3">并联合使用 Bootstrap 预置的栅格类，可以将 label 标签和控件组水平并排布局。这样做将改变 .form-group 的行为，使其表现为栅格系统中的行（row），因此就无需再额外添加</td>
           </tr>
         </tbody>
       </table>
      </div>
      <div class="highlight">
        <pre>
          <code><span class="nt">&lt;table</span><span class="na"> class=</span><span class="s">"addlist table-bordered mt10"</span><span class="nt">&gt;
 &lt;tbody&gt;
  &lt;tr&gt;
    &lt;th&gt;</span>角色代码：<span class="nt">&lt;/th&gt;
    &lt;td&gt;</span>2016001<span class="nt">&lt;/td&gt;
    &lt;th&gt;</span>角色名称：<span class="nt">&lt;/th&gt;
    &lt;td&gt;</span>系统管理员<span class="nt">&lt;/td&gt;
  &lt;/tr&gt;
  &lt;tr&gt;
    &lt;th&gt;</span>主页链接地址：<span class="nt">&lt;/th&gt;
    &lt;td&gt;</span>commons/main/main_01<span class="nt">&lt;/td&gt;
    &lt;th&gt;</span>主页链接地址：<span class="nt">&lt;/th&gt;
    &lt;td&gt;</span>commons/main/main_01<span class="nt">&lt;/td&gt;
  &lt;/tr&gt;
  &lt;tr&gt;
    &lt;th&gt;</span>可用否：<span class="nt">&lt;/th&gt;
    &lt;td&gt;</span>可用<span class="nt">&lt;/td&gt;
    &lt;th&gt;</span>是否通过：<span class="nt">&lt;/th&gt;
    &lt;td&gt;</span>通过<span class="nt">&lt;/td&gt;
  &lt;/tr&gt;
  &lt;tr&gt;
    &lt;th&gt;</span>角色描述：<span class="nt">&lt;/th&gt;
    &lt;td</span><span class="na"> colspan=</span><span class="s">"3"</span><span class="nt">&gt;</span>可以将 label 标签和控件组水平并排布局。这样做将改变 .form-group 的行为，使其表现为栅格系统中的行（row），因此就无需再额外添加<span class="nt">&lt;/td&gt;
  &lt;/tr&gt;
 &lt;/tbody&gt;
&lt;/table&gt;
</code>   
        </pre>
      </div>
      <h3 class="docs-title">路径导航</h3>
      <div class="docs-detail">在一个带有层次的导航结构中标明当前页面的位置。如：</div>
      <div class="docs-example">
        <h5>实例：</h5>
        <div class="address" style="margin:15px 0;background:#f5f5f5;">
	       <ol class="breadcrumb">
	          <li> <span class="glyphicon glyphicon-home pull-left"></span> </li>
			  <li>当前位置：</li>
			  <li><a href="#">栏目名称</a></li>
			  <li class="active">栏目名称</li>
			</ol>          
	    </div>
	  </div>
	  <div class="highlight">
	    <pre>
          <code><span class="nt">&lt;div</span><span class="na"> class=</span><span class="s">"address"</span><span class="nt">&gt;
  &lt;ol</span><span class="na"> class=</span><span class="s">"breadcrumb"</span><span class="nt">&gt;
    &lt;li&gt;&lt;span</span><span class="na"> class=</span><span class="s">"glyphicon glyphicon-home pull-left"</span><span class="nt">&gt;&lt;/span&gt;&lt;/li&gt;
    &lt;li&gt;</span>当前位置：<span class="nt">&lt;/li&gt;
    &lt;li&gt;&lt;a</span><span class="na"> href=</span><span class="s">"#"</span><span class="nt">&gt;</span>栏目名称<span class="nt">&lt;/a&gt;&lt;/li&gt;
    &lt;li</span><span class="na"> class=</span><span class="s">"active"</span><span class="nt">&gt;</span>栏目名称<span class="nt">&lt;/li&gt;
  &lt;/ol&gt;
&lt;/div&gt;</span></code>
        </pre>
	  </div>
	  <h3 class="docs-title">标签页导航（即Tab选项卡）</h3>
      <div class="docs-detail">Bootstrap 中的导航组件都依赖同一个 <code>.nav</code> 类，状态类也是共用的。注意:<code>.nav-tabs</code> 类依赖<code>.nav</code> 基类。</div>
      <div class="docs-example">
        <h5>实例：</h5>
        <ul class="nav nav-tabs tabweb mb10" role="tablist">
		  <li role="presentation" class="active"><a href="#content1" role="tab" data-toggle="tab">专业类别</a></li>
		  <li role="presentation"><a href="#content2" role="tab" data-toggle="tab">入校类型</a></li>  
		  <li role="presentation"><a href="#content3" role="tab" data-toggle="tab">地区</a></li>  
		</ul>
      </div>
      <div class="highlight">
	    <pre>
          <code><span class="nt">&lt;ul</span><span class="na"> class=</span><span class="s">"nav nav-tabs tabweb mb10"</span><span class="na"> role=</span><span class="s">"tablist"</span><span class="nt">&gt;
  &lt;li</span><span class="na"> role=</span><span class="s">"presentation"</span><span class="na"> class=</span><span class="s">"active"</span><span class="nt">&gt;&lt;a</span><span class="na"> href=</span><span class="s">"#content1"</span><span class="na"> role=</span><span class="s">"tab"</span><span class="na"> data-toggle=</span><span class="s">"tab"</span><span class="nt">&gt;</span>专业类别<span class="nt">&lt;/a&gt;&lt;/li&gt;
  &lt;li</span><span class="na"> role=</span><span class="s">"presentation"</span><span class="nt">&gt;&lt;a</span><span class="na"> href=</span><span class="s">"#content2"</span><span class="na"> role=</span><span class="s">"tab"</span><span class="na"> data-toggle=</span><span class="s">"tab"</span><span class="nt">&gt;</span>入校类型<span class="nt">&lt;/a&gt;&lt;/li&gt;
  &lt;li</span><span class="na"> role=</span><span class="s">"presentation"</span><span class="nt">&gt;&lt;a</span><span class="na"> href=</span><span class="s">"#content3"</span><span class="na"> role=</span><span class="s">"tab"</span><span class="na"> data-toggle=</span><span class="s">"tab"</span><span class="nt">&gt;</span>地区<span class="nt">&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;</span></code>
      </div>
      <h3 class="docs-title">选择面板</h3>
      <div class="docs-detail">整个面板要包含在带有<code>.panel</code>和<code>.panel-default</code>类的div标签里，而面板内容则包含在<code>.panel-body</code>类的div标签里。并且通过 <code>.panel-heading</code> 可以很简单地为面板加入一个标题容器。具体代码如下：</div>
      <div class="docs-example">
        <h5>实例：</h5>
        <div role="tabpanel" class="tab-pane" id="content4">
			<div class="panel panel-default">
			  <div class="panel-heading" style="height:42px">
			   <span class="pull-left">院系名称</span>
			   <button class="btn btn-default  btn-xs pull-right" type="button">选择  </button>
	          </div>
			  <div class="panel-body">
			     <button class="btn btn-primary btn-sm" type="button">
					  航天学院 <span class="glyphicon glyphicon-remove"></span>
				 </button>
			     <button class="btn btn-primary btn-sm" type="button">
					  管理学院 <span class="glyphicon glyphicon-remove"></span>
				 </button>			 
			  </div>
			</div>      
        </div>
      </div>
      <div class="highlight">
	    <pre>
          <code><span class="nt">&lt;div</span><span class="na"> id=</span><span class="s">"content4"</span><span class="na"> class=</span><span class="s">"tab-pane"</span><span class="na"> role=</span><span class="s">"tabpanel"</span><span class="nt">&gt;
  &lt;div</span><span class="na"> class=</span><span class="s">"panel panel-default"</span><span class="nt">&gt;
    &lt;div</span><span class="na"> class=</span><span class="s">"panel-heading"</span><span class="na"> style=</span><span class="s">"height:42px"</span><span class="nt">&gt;
      &lt;span</span><span class="na"> class=</span><span class="s">"pull-left"</span><span class="nt">&gt;</span>院系名称<span class="nt">&lt;/span&gt;
      &lt;button</span><span class="na"> class=</span><span class="s">"btn btn-default  btn-xs pull-right"</span><span class="na"> type=</span><span class="s">"button"</span><span class="nt">&gt;</span>选择<span class="nt">&lt;/button&gt;
    &lt;/div&gt;
    &lt;div<span class="na"> class=</span><span class="s">"panel-body"</span><span class="nt">&gt;
      &lt;button</span><span class="na"> class=</span><span class="s">"btn btn-primary btn-sm"</span><span class="na"> type=</span><span class="s">"button"</span><span class="nt">&gt;</span>
        航天学院<span class="nt">&lt;span</span><span class="na"> class=</span><span class="s">"glyphicon glyphicon-remove"</span><span class="nt">&gt;&lt;/span&gt;
      &lt;/button&gt;
      &lt;button</span><span class="na"> class=</span><span class="s">"btn btn-primary btn-sm"</span><span class="na"> type=</span><span class="s">"button"</span><span class="nt">&gt;</span>
        管理学院<span class="nt">&lt;span</span><span class="na"> class=</span><span class="s">"glyphicon glyphicon-remove"</span><span class="nt">&gt;&lt;/span&gt;
      &lt;/button&gt;
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/div&gt;</code>
      </pre>
    </div>
    <h3 class="docs-title">表单元素</h3>
      <div class="docs-detail">所有设置了<code>.form-control</code>类的 <code>&lt;input&gt;</code>、<code>&lt;textarea&gt;</code>和<code>&lt;select&gt;</code>元素都将被默认设置宽度属性为 <code>width: 100%;</code>。当当前表单元素为必填项时，会有<code>*</code>提示，此时表单元素则会添加类<code>.Pct92</code>和<code>.pull-left</code>。具体代码如下：</div>
      <div class="docs-example">
        <h5>实例：</h5>
        <table  class="addlist table-bordered">
           <tr>
             <th width="30%">角色代码：</th>
             <td><input type="text" class="form-control Pct92 pull-left"><span class="red ml5">*</span></td>
           </tr>
           <tr>
             <th>角色名称：</th>
             <td><input type="text" class="form-control Pct92 pull-left" ><span class="red ml5">*</span></td>
           </tr>
           <tr>
             <th>主页链接地址：</th>
             <td><input type="text" class="form-control"></td>
           </tr>
           <tr>
             <th>可用否：</th>
             <td><select class="form-control"> </select></td>
           </tr>
           <tr>
             <th>角色描述：</th>
             <td><textarea class="form-control" rows="3"></textarea></td>
           </tr>                                
         </table>
      </div>
      <div class="highlight">
	    <pre>
          <code><span class="nt">&lt;input</span><span class="na"> type=</span><span class="s">"text"</span><span class="na"> class=</span><span class="s">"form-control"</span><span class="nt">/&gt;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="info">/*表单元素占100%*/</span>
<span class="nt">&lt;input</span><span class="na"> type=</span><span class="s">"text"</span><span class="na"> class=</span><span class="s">"form-control Pct92 pull-left"</span><span class="nt">/&gt;</span>&nbsp;&nbsp;<span class="info">/*表单元素为必填项时占92%*/</span></code>
        </pre>
      </div>
      <h3 class="docs-title">分页</h3>
      <div class="docs-detail">分页所有内容包含在类为<code>.youtube</code>的<code>&lt;div&gt;</code>标签内，分页项则包含在类为<code>.pagination</code>的<code>&lt;ul&gt;</code>内，你可以给不能点击的链接添加<code>.disabled</code>类、给当前页添加<code>.active</code> 类。具体代码如下：</div>
      <div class="docs-example">
        <h5>实例：</h5>
        <div style="position:relative;width:96%; margin:10px auto;height:40px;overflow:hidden;">
	        <div class="youtube"> 
			 <nav>
			  <ul class="pagination pagination-sm">
			    <li class="disabled"><a href="#">&laquo;</a></li>
			    <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
			    <li><a href="#">2</a></li>
			    <li><a href="#">3</a></li>
			    <li><a href="#">4</a></li>
			    <li><a href="#">5</a></li>
			    <li><a href="#">&raquo;</a></li>
			  </ul>
			 </nav>
	        </div>
        </div>
       </div>
       <div class="highlight">
         <pre>
          <code><span class="nt">&lt;div</span><span class="na"> class=</span><span class="s">"youtube"</span><span class="nt">&gt;
 &lt;nav&gt;
  &lt;ul</span><span class="na"> class=</span><span class="s">"pagination pagination-sm"</span><span class="nt">&gt;
    &lt;li</span><span class="na"> class=</span><span class="s">"disabled"</span><span class="nt">&gt;&lt;a</span><span class="na"> href=</span><span class="s">"#"</span><span class="nt">&gt;</span>&laquo;<span class="nt">&lt;/a&gt;&lt;/li&gt;
    &lt;li</span><span class="na"> class=</span><span class="s">"active"</span><span class="nt">&gt;&lt;a</span><span class="na"> href=</span><span class="s">"#"</span><span class="nt">&gt;</span>1<span class="nt">&lt;span</span><span class="na"> class=</span><span class="s">"sr-only"</span><span class="nt">&gt;</span>(current)<span class="nt">&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a</span><span class="na"> href=</span><span class="s">"#"</span><span class="nt">&gt;</span>2<span class="nt">&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a</span><span class="na"> href=</span><span class="s">"#"</span><span class="nt">&gt;</span>3<span class="nt">&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a</span><span class="na"> href=</span><span class="s">"#"</span><span class="nt">&gt;</span>4<span class="nt">&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a</span><span class="na"> href=</span><span class="s">"#"</span><span class="nt">&gt;</span>5<span class="nt">&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a</span><span class="na"> href=</span><span class="s">"#"</span><span class="nt">&gt;</span>&raquo;<span class="nt">&lt;/a&gt;&lt;/li&gt;
  &lt;/ul&gt;
 &lt;/nav&gt;
&lt;/div&gt;</span></code>
         </pre>
       </div>
      
    <div class="clr"></div>
  </div>
</div>
 
  
</body>
</html>

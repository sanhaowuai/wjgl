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
<head>
<meta charset="UTF-8">
 <style> 
 body{ font-size:12px}
.popup_title{float: left;width:100%; margin-bottom:10px; border-bottom:1px dotted #cccccc; line-height:30px;height:30px; font-size:16px}
.popup_bottom{float: left;width:100%;  border-top:1px dotted #cccccc;  margin-top:10px;padding-top:5px;}

.popup{ width:100%}
.popup_left{float: left;}

.addlist{ float:left; padding:0} 
.addlist td{ border:1px solid #ddd; line-height:30px; padding:6px}
.addlist th{ background-color:#f5f5f5;border:1px solid #e3e7ee; line-height:30px; text-align:right; padding-right:10px}	

  /*button*/
.addlist_button{ line-height:16px; float:left} 
.addlist_button a{background:#5bc0de;   text-decoration:none; float:left; cursor:hand; margin:0;border-radius:3px ;color:#fff}
.addlist_button a span{background:#5bc0de; padding:7px 18px 5px 8px; margin:0 0 0 10px; float:left; border-radius:3px }
.addlist_button a:hover{background:#60B8D1;}
.addlist_button a:hover span{background:#60B8D1; color:#fff;  padding:7px 18px 5px 8px; margin:0 0 0 10px; } 
 
.addlist_button2{ line-height:16px; float:left} 
.addlist_button2 a{background:#45B6B0;color:#ffffff; text-decoration:none;  float:left; cursor:hand; margin:0; border-radius:3px }
.addlist_button2 a span{background:#45B6B0;  padding:7px 18px 5px 8px; margin:0 0 0 10px; float:left; border-radius:3px }
.addlist_button2 a:hover{background:#3DA09A;}
.addlist_button2 a:visited{color:#ffffff;}
.addlist_button2 a:hover span{background:#3DA09A; color:#ffffff;  padding:7px 18px 5px 8px; margin:0 0 0 10px; }

.ml10{margin-left:10px}
</style>
<title></title>
</head>
<body>
<div class="popup">
 <div class="popup_title">
   <div class="popup_left">${sinGrrc.rcsj}</div>
    </div>
    <div class="clr"></div>
    <table width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
     <tr>
       <td>
         <form name="addForm" id="addForm">
         <!-- 操作标识（0：个人；1：系统推送） -->
         	<input name="rcsj" type="hidden" value="${sinGrrc.rcsj}"/>
         	<textarea rows="10" cols="43" name="title"  style="resize:none"></textarea>
         </form>
       </td>
     </tr>
   </table>
   <div class="clr"></div>
   <div class="popup_bottom">
        <div class="addlist_button ml10" style="float:right"><a onclick="addShumitSinGrrc('${sinGrrc.rcsj}')" href="javascript:void(0);"><span>保存</span></a></div>
        <div class="addlist_button" style="float:right"><a href="javascript:void(0);" onclick="javascript:jQuery.fancybox.close();$('#calendar').fullCalendar( 'refetchEvents');return false;"><span>取消</span></a></div>
   </div>  
</div>
</body>
</html>
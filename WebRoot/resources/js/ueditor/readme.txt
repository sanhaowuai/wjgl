GY 20140107==================ueditor官网下载(ueditor1_3_6-utf8-jsp发布2013-12-24)版 修改======================

1、js/ueditor/jsp/fileUp.jsp
	
	修改前  <%@ page import="ueditor.Uploader" %>
	修改后  <%@ page import="framework.util.Uploader" %>
	ueditor.jar   里面的代码进行了修改
 
    up.setSavePath("../../../upload/myUeditor");
    String[] fileType = {".rar" , ".xls" ,".xlsx" , ".ppt" ,".pptx" , ".doc" , ".docx" , ".zip" , ".pdf" , ".txt" , ".swf", ".wmv", ".avi", ".rm", ".rmvb", ".mpeg", ".mpg", ".ogg", ".mov", ".wmv", ".mp4"};  //允许的文件类型
	up.setMaxSize(9000 * 1024);        //允许的文件最大尺寸，单位KB
	
2、js/ueditor/dialogs/attachment/attachment.html	
    
    file_size_limit:"9000 MB", //文件大小限制，此处仅是前端flash选择时候的限制，具体还需要和后端结合判断
 
 
3、js/ueditor/jsp/imageUp.jsp
	up.setSavePath("../../../upload/myUeditor");
     
4、js/ueditor/jsp/scrawlUp.jsp
   up.setSavePath("../../../upload/myUeditor");

5、js/ueditor/dialogs/attachment/fileTypeMaps.js
	".xlsx":"icon_xls.gif",

6、js/ueditor/ueditor.all.js
   6700行注掉         6701行注掉
   27191行注掉
   
//    7、 js/ueditor/ueditor.config.js
//	     有些官网注掉的被打开了 还有修改的地方 以现在程序内版本为准

8、js/ueditor/dialogs/image/image.html
	16行注掉
	<span tabSrc="imgManager"><var id="lang_tab_imgManager"></var></span>
	
   
   功能需求  
   加载完成后  强制将宽度变小
 $('.edui-editor-iframeholder').css('width','50%')

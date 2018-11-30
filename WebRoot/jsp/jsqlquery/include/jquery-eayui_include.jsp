<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
%>

<%
  //设置缓存为空
  response.setHeader("Pragma","No-cache");
  response.setHeader("Cache-Control","no-cache");
  response.setDateHeader("Expires",   0);
%>
<%
  if(request.getProtocol().compareTo("HTTP/1.0")==0)
        response.setHeader("Pragma","no-cache");
  else   if(request.getProtocol().compareTo("HTTP/1.1")==0)
        response.setHeader("Cache-Control","no-cache");
  response.setDateHeader("Expires",0);
%>

<link rel="stylesheet" type="text/css" href="<%=path%>/resources/js/jquery-easyui-1.5.1/themes/icon.css">
<link rel="stylesheet" href="<%=path%>/resources/style/jsq/css/bootstrap.css"  >
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/js/jquery-easyui-1.5.1/themes/metro-orange/easyui.css">
<link rel="stylesheet" href="<%=path%>/resources/js/bootstrapvalidator-master/dist/css/bootstrapValidator.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/js/jquery-easyui-1.5.1/themes/color.css">
<link rel="stylesheet" href="<%=path%>/resources/js/ymbj/codemirror-5.17.0/lib/codemirror.css">
<link rel="stylesheet" href="<%=path%>/resources/js/ymbj/codemirror-5.17.0/addon/hint/show-hint.css" />
<link href="<%=path%>/resources/js/bootstrap-fileinput-master/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="<%=path%>/resources/js/ymbj/jquery-1.11.1.min.js"></script>
<script src="<%=path%>/resources/js/ bootstrap-3.3.7-dist/js/bootstrap.min.js"  ></script>
<script type="text/javascript" src="<%=path%>/resources/js/bootstrapvalidator-master/dist/js/bootstrapValidator.js"></script>
<%-- <script type="text/javascript" src="<%=path%>/resources/js/jquery-easyui-1.5.1/jquery.min.js"></script> --%>
<script src="<%=path%>/resources/js/bootstrap-fileinput-master/js/fileinput.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery-easyui-1.5.1/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery-easyui-1.5.1/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/formbj/bootstrap_input_property.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/formbj/bootstrap_tabs_property.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/formbj/bootstrap_table_property.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/formbj/bootstrap_layout_property.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/formbj/MychangeSize.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/formbj/BValidatorData.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/ymbj/codemirror-5.17.0/lib/codemirror.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/ymbj/codemirror-5.17.0/mode/xml/xml.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/ymbj/codemirror-5.17.0/mode/css/css.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/ymbj/codemirror-5.17.0/mode/sql/sql.js"></script>
<script src="<%=path%>/resources/js/ymbj/codemirror-5.17.0/addon/hint/show-hint.js"></script>
<script src="<%=path%>/resources/js/ymbj/codemirror-5.17.0/addon/hint/sql-hint.js"></script>
<!--Java代码高亮必须引入-->
<script src="<%=path%>/resources/js/ymbj/codemirror-5.17.0/mode/clike/clike.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/ymbj/codemirror-5.17.0/mode/javascript/javascript.js"></script>
<script type="text/javascript">
//IE下jquey easyui datagrid 缓存问题
$.ajaxSetup ({
   cache: false //关闭AJAX相应的缓存
});

var path = '<%=path%>';
var randomNu = (new Date().getTime()) ^ Math.random();//解决IE缓存问题
var CodeMirrorEditor;
var CodeMirrorEditor_java_code_controller;
var CodeMirrorEditor_java_code_service;
var CodeMirrorEditor_java_code_service_impl;
var CodeMirrorEditor_java_code_sqlmap;
var CodeMirrorEditor_java_code_page;
var CodeMirrorEditor_java_code_pojo;
//表单序列化
function serializeObject(form){
    var o={};
    $.each(form.serializeArray(),function(index){
	    if(o[this['name'] ]){
	         o[this['name'] ] = o[this['name'] ] + "," + this['value'];
	    }else{
	        o[this['name'] ]=this['value'];
	    }
    })
    return o;
}

var mime = 'text/x-mariadb';
// get mime type
if (window.location.href.indexOf('mime=') > -1) {
  mime = window.location.href.substr(window.location.href.indexOf('mime=') + 5);
}
</script>
<style type="text/css">
form {
padding:0px; margin:0px;
}
.CodeMirror{
  /* Set height, width, borders, and global font properties here */
  font-family: monospace;
  height: auto;
}
</style>



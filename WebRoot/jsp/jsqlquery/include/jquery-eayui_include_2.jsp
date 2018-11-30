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
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/js/jquery-easyui-1.5.1/themes/metro-orange/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/js/jquery-easyui-1.5.1/themes/icon.css">
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery-easyui-1.5.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery-easyui-1.5.1/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery-easyui-1.5.1/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/js/jquery-easyui-1.5.1/themes/color.css">
<link rel="stylesheet" href="<%=path%>/resources/js/ymbj/codemirror-5.17.0/lib/codemirror.css">
<script type="text/javascript" src="<%=path%>/resources/js/ymbj/codemirror-5.17.0/lib/codemirror.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/ymbj/codemirror-5.17.0/mode/xml/xml.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/ymbj/codemirror-5.17.0/mode/css/css.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/ymbj/codemirror-5.17.0/mode/sql/sql.js"></script>
<link rel="stylesheet" href="<%=path%>/resources/js/ymbj/codemirror-5.17.0/addon/hint/show-hint.css" />
<script src="<%=path%>/resources/js/ymbj/codemirror-5.17.0/addon/hint/show-hint.js"></script>
<script src="<%=path%>/resources/js/ymbj/codemirror-5.17.0/addon/hint/sql-hint.js"></script>
<!--Java代码高亮必须引入-->
<script src="<%=path%>/resources/js/ymbj/codemirror-5.17.0/mode/clike/clike.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/ymbj/codemirror-5.17.0/mode/javascript/javascript.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
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

var CodeMirrorEditor_java_code_qz;
var CodeMirrorEditor_java_code_hz;

var CodeMirrorEditor_queryLogicInterfaceImpl_code ;

var CodeMirrorEditor_JavaScript_code;
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
var LogicInterfaceImpl_code = 
	"package com.incon.project.jsqlquery.logicInterface;\n" +
	"import java.*;\n" + 
	"import java.sql.*;\n" + 
	"import java.util.*;\n" + 
	"import com.incon.project.jsqlquery.base.Util.*;\n" + 
	"public class InterFaceImplDemo implements InterFace {\n" + 
	"  Boolean success  = false;\n" + 
	"  String Message = \"\";\n" + 
	"  @Override\n" + 
	"  public void execute(Map map,Connection connection) throws Exception {\n" + 
	"    System.out.println(\"打印map：\"+map);\n" + 
	"    ResultSet rs = null;\n" + 
	"    PreparedStatement pstmt = null;\n" + 
	"      CallableStatement stmt = null;\n" + 
	"        try{\n" + 
	"        this.success = true;\n" + 
	"        this.Message = \"InterFaceImplDemo   成功！！\";\n" + 
	"        }catch (Exception e){\n" + 
	"            e.printStackTrace();\n" + 
	"            throw new Exception(e);\n" + 
	"        }finally {\n" + 
	"            JdbcConnectionUtil.closeResultSet(rs);\n" + 
	"            JdbcConnectionUtil.closeStatement(pstmt);\n" + 
	"            JdbcConnectionUtil.closeCallableStatement(stmt);\n" + 
	"        }\n" + 
	"  }\n" + 
	"  @Override\n" + 
	"  public Boolean getSuccess() {\n" + 
	"    return success;\n" + 
	"  }\n" + 
	"\n" + 
	"  @Override\n" + 
	"  public String getMessage() {\n" + 
	"    return Message;\n" + 
	"  }\n" + 
	"}";
var global_row_index ; 	
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



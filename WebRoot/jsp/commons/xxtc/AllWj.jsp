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
<jsp:include page="../../include/css-main-include.jsp"></jsp:include>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jquery.ztree.core-3.1.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jquery.ztree.excheck-3.1.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<style type="text/css">
  html, body { height:100%; }
  .Contentbox { width:100%; min-height:100%;height:auto }
  *html .Contentbox { height:100% }
/*基本样式*/ 
body{ background:#f5f5f5;} 
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
	  $("li").click(function(){
		  var type=$(this).attr("type");
		  opener.resultLj(type);
		 window.close();
	  });
});
  
function wjsc()
{

		Validator.ClearForm('FormUpload');
		$("#uploadWj").val("");
		BOX_show('dr');

}
	function writeName(obj)
	{
		var wholePath=obj.value;
		var fileName=wholePath.substring(wholePath.lastIndexOf("\\")+1);
		document.getElementById("filename2").value=fileName;
	}
function baocun()
{
if(Validator.Validate(document.getElementById('FormUpload'),3)){
			 document.FormUpload.action = "<%=path%>/xxtc/saveWj";
	        $('#FormUpload').ajaxSubmit(function(r){
	    	       if(r=="1")
	            {
		            alert("上传成功!");
		           document.FormUpload.action = '<%=path%>/xxtc/queryAllWj';
		 			 document.FormUpload.submit();
	            }else{
	          	  alert("上传失败!");
	            }
	    	});
		}
}
  </script>
</head>
<body>
<div class="Contentbox">
 <div class="mainbg"></div>
  <div class="pd10">    
    <div class="docs-header">
      <h1>文件路径</h1>
    </div>
    <div class="docs-container">
      <h3 class="docs-title"><button type="button" class="btn btn-success" onclick="javascript:wjsc();" value="上传" style="padding: 4px 12px !important;">上传</button></h3>
      
      <div class="bs-glyphicons">
      <ul class="bs-glyphicons-list">
  <c:forEach items="${listFileName}" var="wj">
      <li type="/upload/scwjXxtc/${wj}"><a >${wj}</a></li>
<!--        <li type="/upload/scwjXxtc/${wj}"><a >${wj}</a></li>-->
        
    </c:forEach>
      </ul>
      </div>
      </div>
    <div class="clr"></div>
  </div>
</div>
<form name="FormUpload" id="FormUpload"  method="post" action="<%=path%>/jsp/commons/xls_up.jsp"  enctype="multipart/form-data">
  <div id="dr" style=" display:none; width: 400px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
    <div class="popup">
      <div class="Floatleft Pct100 mb10">
        <div class="popup_left">批量导入</div>
        <a href="#" class="btn_close" onclick="javascript:BOX_remove('dr');"></a> 
      </div>
      <div class="clr"></div>
      <table width="100%"  cellpadding="0" cellspacing="0"  class="addlist" style="border-collapse:collapse">
        <tr>
          <th>添加文件：</th>
          <td align="left"> 
          <input type="hidden" id="filename2" name="filename2"/>
           <input type="file" onchange="writeName(this)" class="input_file" id="uploadWj" name="uploadWj" dataType="Limit" min="1" max="200" msg="必选" />
          </td> </tr>
        <tr>
          <td colspan="2" align="center"><div class="addlist_button1" style="float:right"> <a href="#"  title="取消" onclick="javascript:BOX_remove('dr');" ><span>取消</span></a> </div>
          <div class="addlist_button1 mr15" style="float:right" > <a href="javascript:baocun();" title="保存" ><span>保存</span></a> </div></td>
        </tr>
      </table>
      <div class="clr"></div>
    </div>
  </div>
</form>
<div id="setting"></div>
</body>
</html>

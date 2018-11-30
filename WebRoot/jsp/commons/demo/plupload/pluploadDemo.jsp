<%@ page language="java" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>pluploadDemo</title>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>
<jsp:include page="plupload.include.jsp" />

<style>
    body{background:#fefcfa}
	li.plupload_droptext {
		background: transparent;
		text-align: center;
		vertical-align: middle;
		border: 0;
		line-height: 90px;
	}
	.plupload_scroll .plupload_filelist {
	    /*height: 500px;      /*37×允许上传的文件数量*/
	}
</style>

<script  type="text/javascript">
$().ready(function(){
	 //多个文件上传
	plfileupload({
        url:'<%=path%>',
        savePath:'demo',
	    max_file_length:10, //上传数量
	    max_file_size :'10mb',//上传文件大小限制
        buttonId:'save1', // 按钮
        formId:'addForm' ,//表单
	    downfiles:${empty listfjjson ? '[]' : listfjjson } // 初值
    },save);
});

//新增保存
function save(){
 	var url="<%=path%>/demo/saveFj";
 	$("#addForm").ajaxSubmit({
		url: url,
		beforeSubmit: function () { },
		type:"post",
		dataType:"json",
		success: function (data) {
 		    alert("保存成功！");
		},
		error:function(data){
			alert("添加数据失败，请重新添加！");
		}
	});
}
</script>
</head>
  
<body>
<div>
  <form name="addForm" id="addForm" method="post" enctype="multipart/form-data">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
      <tr>
        <th>附件：</th>
        <td>
		  <div id="uploader">
            <p>您的浏览器未安装 Flash, Silverlight, Gears, BrowserPlus 或者支持 HTML5 .</p>
          </div>
        </td>
      </tr>
      <tr>
        <th> </th>
        <td  align="center">
          <input name="" type="button" id="save1" value="保  存" style="margin-top:10px"  />
        </td>
      </tr>
    </table>
  </form>
</div>
</body>
</html>

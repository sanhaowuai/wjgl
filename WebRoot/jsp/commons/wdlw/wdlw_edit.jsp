<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>北京赢科后台管理系统</title>
<jsp:include page="../../include/css-main-include.jsp"></jsp:include>
<style type="text/css">
  html, body { height:100%; }
  .Contentbox { width:100%; min-height:100%;height:auto }
  *html .Contentbox { height:100% }
  .addfileI {
    cursor:hand;
    position:relative;
    left:0px;
    width:20px;
    background-color: blue;
    opacity:0;
    filter:alpha(opacity=0)
}
td .noborder{
	border:0px;
}
.leftpart1_putfile{
position:relative;
}
.leftpart1_putfile .input_file{
display:block;position:absolute;top:0;filter:alpha(opacity:0);opacity:0;z-index:1;
}
.leftpart1_putfile .showfile{
position:absolute;top:0;
}
.leftpart1_putfile .showfile .file_con{
float:left;width:140px;
}
.leftpart1_putfile .showfile .file_btn{
no-repeat;margin-left:5px;display:inline;width:70px;
}

</style>
<script src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=path%>/resources/js/umeditor/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=path%>/resources/js/umeditor/umeditor.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/js/umeditor/themes/default/css/umeditor.min.css"/>
<script type="text/javascript">

	String.prototype.trim=function(){
　　    return this.replace(/(^\s*)|(\s*$)/g, "");
　　 }
String.prototype.endWith=function(str){     
  var reg=new RegExp(str+"$");     
  return reg.test(this);        
}
	function fileClick()
	{
		document.getElementById("attach").click();
	}
	
	function writeName(obj)
	{
		var wholePath=obj.value;
		var fileName=wholePath.substring(wholePath.lastIndexOf("\\")+1);
		document.getElementById("filename2").value=fileName;
	}

	
	//增加反馈信息
	function addFk(){
		
		var keywordVal=document.getElementById("keyword").value;
		var summaryVal=document.getElementById("summary").value;
		var attachVal=document.getElementById("attach").value;
		if(null==keywordVal||keywordVal.trim()=='')
		{
			alert('关键词不能为空！');
			document.getElementById("keyword").focus();
			return false;
		}
		if(null==summaryVal||summaryVal.trim()=='')
		{
			alert('摘要不能为空！');
			document.getElementById("summary").focus()
			return false;
		}
		if(null==attachVal||attachVal.trim()=='')
		{
			alert("论文附件不能为空！");
			return false;
		}
		if(!attachVal.endWith(".pdf")&&!attachVal.endWith(".doc")&&!attachVal.endWith(".docx"))
		{
			alert("论文格式必须是pdf,doc或docx格式！");
			return false;
		}
		if (!confirm("您好，提交后将不能进行更改，确认提交吗？")) {
			return false;
		}
		
		document.form1.submit();

	}
</script>
</head>

<body onLoad='document.getElementById("keyword").focus()'>
<div class="Contentbox">
  <div class="mainbg"></div>
  <div class="pd10">
    <div class="address">当前位置：实验教学 >> 我的论文</div>
    <div class="clr"></div>
	<form name="form1" method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/wdlw/saveLuwen">
	<table>
	<tr>
	<td width="250px">&nbsp;</td>
	<td>
    <table class="addlist" width="600px" align="center" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" style="border-collapse:collapse;">
      <tr>
        <th style=" text-align:left; line-height:40px; padding-left:5px;" colspan="4">选题基本信息</th>
      </tr>
      <tr>
        <td align="center" width="120px"><strong>题目</strong></td>
        <td colspan="3">${lwxx.title}</td>
      </tr>
      <tr>
        <td align="center"><strong>指导教师</strong></td>
        <td colspan="3">${lwxx.teacherName}</td>
      </tr>
      <tr>
        <td align="center"><strong>选题时间</strong></td>
        <td colspan="3">${lwxx.selectDateString}</td>
      </tr>
      <tr>
        <th style=" text-align:left; line-height:40px; padding-left:5px;" colspan="4">论文信息

        <div class="addlist_button1 pt5 mr15" style="float:right"><a title="保存" href="#" onclick="addFk()"><span>提交</span></a></div>
        </th>
      </tr>
      <tr>
        <td align="center" width="125px"><strong>提交状态</strong></td>
        <td width="167px">未提交</td>
        <td align="center" width="125px"><strong>提交时间</strong></td>
        <td ></td>
      </tr>
      <tr>
        <td align="center"><strong>关键词</strong></td>
        <td colspan="3"><input name="keyword" id="keyword"/>&nbsp;<span class="red">*</span></td>
      </tr>
      <tr>
        <td align="center"><strong>摘要</strong></td>
        <td colspan="3" style="border:0px">
		  
		<table style="margin-left:-4px">
		<tr>
		<td class="noborder">
		<textarea id="summary" name="summary" style="width:400px; height:100px;resize: none;"></textarea>
		</td>
		<td class="noborder"><span class="red">*</span></td>
		</tr>
		</table>
		</td>
      </tr>
      <tr>
        <td align="center"><strong>附件</strong></td>
        <td colspan="3">
			<div class="leftpart1_putfile">
<input type="file" class="input_file" id="attach" name="attach" onchange="writeName(this)"/>
		 <span class="showfile"><input id="filename2" type="input" class="file_con" value="请选择附件.."  readOnly /><input id="filebtn" class="file_btn" type="button"  value="浏览"/></span>
		 <span class="red" style="margin-left:230px">*</span>
		 
		 </div>
		 
		</td>
		  
      </tr>
	  <div>
      <tr>
        <th style=" text-align:left; line-height:40px; padding-left:5px;" colspan="4">答辩信息</th>
      </tr>
      <tr>
        <td align="center"><strong>答辩时间</strong></td>
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr>
        <td align="center"><strong>答辩地点</strong></td>
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr>
        <th style=" text-align:left; line-height:40px; padding-left:5px;" colspan="4">成绩信息</th>
      </tr>
      <tr>
        <td align="center"><strong>成绩</strong></td>
        <td colspan="3">&nbsp;</td>
      </tr>
      <tr>
        <td align="center"><strong>论文成绩</strong></td>
        <td>&nbsp;</td>
        <td align="center"><strong>所占比例</strong></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td align="center"><strong>答辩成绩</strong></td>
        <td>&nbsp;</td>
        <td align="center"><strong>所占比例</strong></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td align="center"><strong>实践成绩</strong></td>
        <td>&nbsp;</td>
        <td align="center"><strong>所占比例</strong></td>
        <td>&nbsp;</td>
      </tr>
    </table>
	</td>
	<tr>
	</table>
    </form>
  </div>
</div>
</body>
</html>

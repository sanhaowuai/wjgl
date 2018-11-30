<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>  
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>    
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:宋体;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:宋体;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:微软雅黑;
	panose-1:2 11 5 3 2 2 4 2 2 4;}
@font-face
	{font-family:"\@微软雅黑";
	panose-1:2 11 5 3 2 2 4 2 2 4;}
@font-face
	{font-family:"\@宋体";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:"Calibri","sans-serif";}
.MsoChpDefault
	{font-family:"Calibri","sans-serif";}
 /* Page Definitions */
 @page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
-->
</style>
<body  style="background-color: white;">       
<h1 style="color: red;"  >Excel 导入导出Demo</h1>
  <a href="<%=request.getContextPath() %>/demo/exportExcelDemo"><button>导出</button></a><br>
    <!--     文件上传form   在表单中添加   enctype="multipart/form-data"  -->
    <form action="<%= request.getContextPath()%>/demo/importExcelDemo"  method="post" enctype="multipart/form-data" >
       <input type="file" name="excel"> <!--  name与controlle 中@RequestParam("excel") MultipartFile excel  对应    -->
       <input type="submit" value="导入">
   </form>
   <table  style="color: red;" >
      <c:forEach items="${list}" var="demo" varStatus="status">
       <tr><td>${demo.zgh }</td><td>${demo.jsxm }</td><td>${demo.xb }</td></tr>
      </c:forEach>
   </table>
   
   
   



























<h1 style="color: red;" >使用方法</h1>
<div class=WordSection1>
<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span
style='font-size:14.0pt;font-family:"微软雅黑","sans-serif";color:black'>后台部分</span></p>

<p class=MsoNormal align=left style='text-align:left;text-indent:20.0pt;
text-autospace:none'><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#646464'>@ResponseBody</span><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:black'> </span><span lang=EN-US
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>//</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>设置以文件流方式返回页面</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#646464'>@RequestMapping</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>(</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#2A00FF'>&quot;exportExcelDemo&quot;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>)</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>//</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>设置访问路径</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><b><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#7F0055'>public</span></b><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>
</span><b><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#7F0055'>void</span></b><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:black'>
exportExcelDemo(HttpServletResponse response) {</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HSSFWorkbook
workbook = </span><b><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#7F0055'>new</span></b><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:black'> HSSFWorkbook(); </span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>//</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>创建<span
lang=EN-US>Excel</span></span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HSSFSheet
sheet = workbook.createSheet(</span><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:#2A00FF'>&quot;Sheet1&quot;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>);</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>//</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>创建<span
lang=EN-US>Sheet</span></span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HSSFRow
T_row = sheet.createRow(0);</span><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:#3F7F5F'>//</span><span style='font-size:
10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>创建一行表头</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; T_row.createCell(0,
HSSFCell.</span><i><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#0000C0'>CELL_TYPE_STRING</span></i><span lang=EN-US style='font-size:
10.0pt;font-family:"微软雅黑","sans-serif";color:black'>).setCellValue(</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#2A00FF'>&quot;</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#2A00FF'>职工号<span
lang=EN-US>&quot;</span></span><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:black'>);</span><span lang=EN-US
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>//</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>设置表头列名</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; T_row.createCell(1,
HSSFCell.</span><i><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#0000C0'>CELL_TYPE_STRING</span></i><span lang=EN-US style='font-size:
10.0pt;font-family:"微软雅黑","sans-serif";color:black'>).setCellValue(</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#2A00FF'>&quot;</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#2A00FF'>姓名<span
lang=EN-US>&quot;</span></span><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:black'>);</span><span lang=EN-US
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>//</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>设置表头列名</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; T_row.createCell(2,
HSSFCell.</span><i><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#0000C0'>CELL_TYPE_STRING</span></i><span lang=EN-US style='font-size:
10.0pt;font-family:"微软雅黑","sans-serif";color:black'>).setCellValue(</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#2A00FF'>&quot;</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#2A00FF'>性别<span
lang=EN-US>&quot;</span></span><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:black'>);</span><span lang=EN-US
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>//</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>设置表头列名</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><b><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#7F0055'>for</span></b><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>
(</span><b><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#7F0055'>int</span></b><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:black'> i = 1; i &lt; 10; i++) {&nbsp; </span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>//
</span><span style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#3F7F5F'>插入数据</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; JsxxbEntity
Jsxxb = </span><b><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#7F0055'>new</span></b><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:black'> JsxxbEntity(); </span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>//new
</span><span style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#3F7F5F'>实体</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jsxxb.setZgh(</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#2A00FF'>&quot;ZGH00&quot;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>
+ i);&nbsp;&nbsp;&nbsp; </span><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:#3F7F5F'>//</span><span style='font-size:
10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>向实体中<span lang=EN-US>set</span>值</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jsxxb.setJsxm(</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#2A00FF'>&quot;</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#2A00FF'>教师<span
lang=EN-US>_&quot;</span></span><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:black'> + i); </span><span lang=EN-US
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>//</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>向实体中<span
lang=EN-US>set</span>值</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jsxxb.setXb(</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#2A00FF'>&quot;</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#2A00FF'>男<span
lang=EN-US>&quot;</span></span><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:black'>); </span><span lang=EN-US
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>//</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>向实体中<span
lang=EN-US>set</span>值</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HSSFRow
row = sheet.createRow(i);&nbsp; </span><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:#3F7F5F'>//</span><span style='font-size:
10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>创建一行<span lang=EN-US>Excel</span></span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; row.createCell(0,
HSSFCell.</span><i><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#0000C0'>CELL_TYPE_STRING</span></i><span lang=EN-US style='font-size:
10.0pt;font-family:"微软雅黑","sans-serif";color:black'>).setCellValue(
Jsxxb.getZgh()); </span><span lang=EN-US style='font-size:10.0pt;font-family:
"微软雅黑","sans-serif";color:#3F7F5F'>//</span><span style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:#3F7F5F'>向<span lang=EN-US>Excel</span>中第<span
lang=EN-US> i </span>行第<span lang=EN-US> 0 </span>列赋值</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; row.createCell(1,
HSSFCell.</span><i><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#0000C0'>CELL_TYPE_STRING</span></i><span lang=EN-US style='font-size:
10.0pt;font-family:"微软雅黑","sans-serif";color:black'>).setCellValue(
Jsxxb.getJsxm()); </span><span lang=EN-US style='font-size:10.0pt;font-family:
"微软雅黑","sans-serif";color:#3F7F5F'>//</span><span style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:#3F7F5F'>向<span lang=EN-US>Excel</span>中第<span
lang=EN-US> i </span>行第<span lang=EN-US> 1 </span>列赋值</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; row.createCell(2,
HSSFCell.</span><i><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#0000C0'>CELL_TYPE_STRING</span></i><span lang=EN-US style='font-size:
10.0pt;font-family:"微软雅黑","sans-serif";color:black'>).setCellValue(
Jsxxb.getXb()); </span><span lang=EN-US style='font-size:10.0pt;font-family:
"微软雅黑","sans-serif";color:#3F7F5F'>//</span><span style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:#3F7F5F'>向<span lang=EN-US>Excel</span>中第<span
lang=EN-US> i </span>行第<span lang=EN-US> 2 </span>列赋值</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif"'>&nbsp;</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><b><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#7F0055'>try</span></b><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>
{</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; String
filename = </span><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#2A00FF'>&quot;demo.xls&quot;</span><span lang=EN-US style='font-size:
10.0pt;font-family:"微软雅黑","sans-serif";color:black'>;&nbsp; </span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>//</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>设置文件名</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>//</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>设置文件头</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
ServletOutputStream Out = response.getOutputStream(); response.setHeader(</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#2A00FF'>&quot;Content-Disposition&quot;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>,
</span><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#2A00FF'>&quot;attachment; filename=\&quot;&quot;</span><span lang=EN-US
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'> +
filename + </span><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#2A00FF'>&quot;\&quot;&quot;</span><span lang=EN-US style='font-size:
10.0pt;font-family:"微软雅黑","sans-serif";color:black'>);</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>//</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>设置字符集</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; response.setCharacterEncoding(</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#2A00FF'>&quot;UTF-8&quot;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>);</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
</span><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#3F7F5F'>//</span><span style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#3F7F5F'>设置文件类型</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; response.setContentType(</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#2A00FF'>&quot;application/octet-stream;
charset=UTF-8&quot;</span><span lang=EN-US style='font-size:10.0pt;font-family:
"微软雅黑","sans-serif";color:black'>);</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>//</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>将文件流写入<span
lang=EN-US>response </span>流</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; workbook.write(Out);</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
</span><b><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#7F0055'>catch</span></b><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:black'> (IOException e) {</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e.printStackTrace();</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif"'>&nbsp;</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#646464'>@RequestMapping</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>(value
= </span><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#2A00FF'>&quot;/importExcelDemo&quot;</span><span lang=EN-US
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>, method =
RequestMethod.</span><i><span lang=EN-US style='font-size:10.0pt;font-family:
"微软雅黑","sans-serif";color:#0000C0'>POST</span></i><span lang=EN-US
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>)</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>//</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>设置访问路径</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><b><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#7F0055'>public</span></b><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>
String importExcelDemo(</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Model
model, </span><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#3F7F5F'>//</span><span style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#3F7F5F'>模型参数 提供返回信息等方法</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#646464'>@RequestParam</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>(</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#2A00FF'>&quot;excel&quot;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>)
MultipartFile excel </span><span lang=EN-US style='font-size:10.0pt;font-family:
"微软雅黑","sans-serif";color:#3F7F5F'>// </span><span style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:#3F7F5F'>文件流获取参数<span lang=EN-US>&nbsp;&nbsp;
@RequestParam(&quot;excel&quot;)</span>中 参数与页面<span lang=EN-US>form&nbsp; </span>文件上传标签<span
lang=EN-US>name</span>对应</span><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:black'>) {</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HSSFWorkbook
workbook = </span><b><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#7F0055'>null</span></b><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:black'>;</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; List&lt;JsxxbEntity&gt;
list=</span><b><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#7F0055'>null</span></b><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:black'>;</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><b><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#7F0055'>try</span></b><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>
{</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; workbook
= </span><b><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#7F0055'>new</span></b><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:black'>
HSSFWorkbook(excel.getInputStream());&nbsp; </span><span lang=EN-US
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>//</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>将获取的流转成<span
lang=EN-US>Excel&nbsp; </span></span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HSSFSheet
sheet = workbook.getSheet(</span><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:#2A00FF'>&quot;Sheet1&quot;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>);</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>//</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>获取<span
lang=EN-US>Sheet</span></span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list=</span><b><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#7F0055'>new</span></b><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>
ArrayList&lt;JsxxbEntity&gt;(); </span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Iterator&lt;Row&gt;
rows = sheet.rowIterator();</span><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:#3F7F5F'>//</span><span style='font-size:
10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>将<span lang=EN-US>Excel</span>行数据装入迭代器</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
</span><b><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#7F0055'>while</span></b><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:black'> (rows.hasNext())
{&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:#3F7F5F'>//</span><span style='font-size:
10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>迭代<span lang=EN-US>Excel </span>行</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
JsxxbEntity Jsxxb = </span><b><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:#7F0055'>new</span></b><span lang=EN-US
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>
JsxxbEntity();</span><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#3F7F5F'>// </span><span style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#3F7F5F'>创建实体接收数据</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Row row = (Row) rows.next();&nbsp;&nbsp;&nbsp; </span><span lang=EN-US
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>// </span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>获取一行数据</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Jsxxb.setZgh(row.getCell(0)+</span><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:#2A00FF'>&quot;&quot;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>);&nbsp;&nbsp;
</span><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#3F7F5F'>// </span><span style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#3F7F5F'>获取一列数据装入实体</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Jsxxb.setJsxm( row.getCell(1)+</span><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:#2A00FF'>&quot;&quot;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>);</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Jsxxb.setXb(row.getCell(2)+</span><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:#2A00FF'>&quot;&quot;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>);</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
list.add(Jsxxb);&nbsp;&nbsp; </span><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:#3F7F5F'>//</span><span style='font-size:
10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>将实体装入<span lang=EN-US>list</span>集合类</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
}</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
</span><b><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#7F0055'>catch</span></b><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:black'> (IOException e) {</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>//
</span><b><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#7F9FBF'>TODO</span></b><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:#3F7F5F'> Auto-generated catch block</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e.printStackTrace();</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
model.addAttribute(</span><span lang=EN-US style='font-size:10.0pt;font-family:
"微软雅黑","sans-serif";color:#2A00FF'>&quot;list&quot;</span><span lang=EN-US
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>, list);</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>//</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>将数据装入<span
lang=EN-US>Spring </span>值栈中共前台获取</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><b><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#7F0055'>return</span></b><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>
</span><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#2A00FF'>&quot;commons/demo/ExcelDemo&quot;</span><span lang=EN-US
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>; </span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>//</span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F5F'>返回地址<span
lang=EN-US>&nbsp; </span></span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</span></p>

<p class=MsoNormal style='text-indent:14.0pt'><span style='font-size:14.0pt;
font-family:"微软雅黑","sans-serif";color:black'>前台部分</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:teal'>&lt;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F7F;
background:silver'>body</span><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:teal'>&gt;</span><span lang=EN-US
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:teal'>&lt;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F7F'>h1</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif"'> <span
style='color:#7F007F'>style</span><span style='color:black'>=&quot;</span><span
style='color:#7F007F'>color</span><span style='color:black'>: </span><i><span
style='color:#2A00E1'>red</span></i><span style='color:black'>;&quot;&nbsp; </span><span
style='color:teal'>&gt;</span><span style='color:black'>Excel </span></span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>导入导出<span
lang=EN-US>Demo</span></span><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:teal'>&lt;/</span><span lang=EN-US
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F7F'>h1</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:teal'>&gt;</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;
</span><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:teal'>&lt;</span><span lang=EN-US style='font-size:10.0pt;font-family:
"微软雅黑","sans-serif";color:#3F7F7F'>a</span><span lang=EN-US style='font-size:
10.0pt;font-family:"微软雅黑","sans-serif"'> <span style='color:#7F007F'>href</span><span
style='color:black'>=</span><span style='color:#2A00FF'>&quot;</span><span
style='color:#BF5F3F'>&lt;%=</span><span style='color:black'>request.getContextPath()
</span><span style='color:#BF5F3F'>%&gt;</span><i><span style='color:#2A00FF'>/demo/exportExcelDemo</span></i><span
style='color:#2A00FF'>&quot;</span><span style='color:teal'>&gt;&lt;</span><span
style='color:#3F7F7F'>button</span><span style='color:teal'>&gt;</span></span><span
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>导出</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:teal'>&lt;/</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F7F'>button</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:teal'>&gt;&lt;/</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F7F'>a</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:teal'>&gt;&lt;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F7F'>br</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:teal'>&gt;</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;
</span><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:#3F5FBF'>&lt;!--&nbsp;&nbsp;&nbsp;&nbsp; </span><span style='font-size:
10.0pt;font-family:"微软雅黑","sans-serif";color:#3F5FBF'>文件上传<span lang=EN-US>form&nbsp;&nbsp;
</span>在表单中添加<span lang=EN-US>&nbsp;&nbsp;
enctype=&quot;multipart/form-data&quot;&nbsp; --&gt;</span></span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;
</span><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:teal'>&lt;</span><span lang=EN-US style='font-size:10.0pt;font-family:
"微软雅黑","sans-serif";color:#3F7F7F'>form</span><span lang=EN-US
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif"'> <span
style='color:#7F007F'>action</span><span style='color:black'>=</span><span
style='color:#2A00FF'>&quot;</span><span style='color:#BF5F3F'>&lt;%=</span><span
style='color:black'> request.getContextPath()</span><span style='color:#BF5F3F'>%&gt;</span><i><span
style='color:#2A00FF'>/demo/importExcelDemo</span></i><span style='color:#2A00FF'>&quot;</span>&nbsp;
<span style='color:#7F007F'>method</span><span style='color:black'>=</span><i><span
style='color:#2A00FF'>&quot;post&quot;</span></i> <span style='color:#7F007F'>enctype</span><span
style='color:black'>=</span><i><span style='color:#2A00FF'>&quot;multipart/form-data&quot;</span></i>
<span style='color:teal'>&gt;</span></span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:teal'>&lt;</span><span lang=EN-US style='font-size:10.0pt;font-family:
"微软雅黑","sans-serif";color:#3F7F7F'>input</span><span lang=EN-US
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif"'> <span
style='color:#7F007F'>type</span><span style='color:black'>=</span><i><span
style='color:#2A00FF'>&quot;file&quot;</span></i> <span style='color:#7F007F'>name</span><span
style='color:black'>=</span><i><span style='color:#2A00FF'>&quot;excel&quot;</span></i><span
style='color:teal'>&gt;</span><span style='color:black'> </span><span
style='color:#3F5FBF'>&lt;!--&nbsp; name</span></span><span style='font-size:
10.0pt;font-family:"微软雅黑","sans-serif";color:#3F5FBF'>与<span lang=EN-US>controlle
</span>中<span lang=EN-US>@RequestParam(&quot;excel&quot;) MultipartFile
excel&nbsp; </span>对应<span lang=EN-US>&nbsp;&nbsp;&nbsp; --&gt;</span></span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:teal'>&lt;</span><span lang=EN-US style='font-size:10.0pt;font-family:
"微软雅黑","sans-serif";color:#3F7F7F'>input</span><span lang=EN-US
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif"'> <span
style='color:#7F007F'>type</span><span style='color:black'>=</span><i><span
style='color:#2A00FF'>&quot;submit&quot;</span></i><span style='color:teal'>&gt;</span></span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;
</span><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:teal'>&lt;/</span><span lang=EN-US style='font-size:10.0pt;font-family:
"微软雅黑","sans-serif";color:#3F7F7F'>form</span><span lang=EN-US
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:teal'>&gt;</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;
</span><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:teal'>&lt;</span><span lang=EN-US style='font-size:10.0pt;font-family:
"微软雅黑","sans-serif";color:#3F7F7F'>table</span><span lang=EN-US
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif"'>&nbsp; <span
style='color:#7F007F'>style</span><span style='color:black'>=&quot;</span><span
style='color:#7F007F'>color</span><span style='color:black'>: </span><i><span
style='color:#2A00E1'>red</span></i><span style='color:black'>;&quot; </span><span
style='color:teal'>&gt;</span></span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;
</span><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:teal'>&lt;</span><span lang=EN-US style='font-size:10.0pt;font-family:
"微软雅黑","sans-serif";color:#3F7F7F'>c:forEach</span><span lang=EN-US
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif"'> <span
style='color:#7F007F'>items</span><span style='color:black'>=</span><span
style='color:#2A00FF'>&quot;</span><span style='color:black'>${list}</span><span
style='color:#2A00FF'>&quot;</span> <span style='color:#7F007F'>var</span><span
style='color:black'>=</span><span style='color:#2A00FF'>&quot;demo&quot;</span>
<span style='color:#7F007F'>varStatus</span><span style='color:black'>=</span><span
style='color:#2A00FF'>&quot;status&quot;</span><span style='color:teal'>&gt;</span></span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:teal'>&lt;</span><span lang=EN-US style='font-size:10.0pt;font-family:
"微软雅黑","sans-serif";color:#3F7F7F'>tr</span><span lang=EN-US style='font-size:
10.0pt;font-family:"微软雅黑","sans-serif";color:teal'>&gt;&lt;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F7F'>td</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:teal'>&gt;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>${demo.zgh
}</span><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:teal'>&lt;/</span><span lang=EN-US style='font-size:10.0pt;font-family:
"微软雅黑","sans-serif";color:#3F7F7F'>td</span><span lang=EN-US style='font-size:
10.0pt;font-family:"微软雅黑","sans-serif";color:teal'>&gt;&lt;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F7F'>td</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:teal'>&gt;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>${demo.jsxm
}</span><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:teal'>&lt;/</span><span lang=EN-US style='font-size:10.0pt;font-family:
"微软雅黑","sans-serif";color:#3F7F7F'>td</span><span lang=EN-US style='font-size:
10.0pt;font-family:"微软雅黑","sans-serif";color:teal'>&gt;&lt;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F7F'>td</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:teal'>&gt;</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>${demo.xb
}</span><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:teal'>&lt;/</span><span lang=EN-US style='font-size:10.0pt;font-family:
"微软雅黑","sans-serif";color:#3F7F7F'>td</span><span lang=EN-US style='font-size:
10.0pt;font-family:"微软雅黑","sans-serif";color:teal'>&gt;&lt;/</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F7F'>tr</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:teal'>&gt;</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;
</span><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:teal'>&lt;/</span><span lang=EN-US style='font-size:10.0pt;font-family:
"微软雅黑","sans-serif";color:#3F7F7F'>c:forEach</span><span lang=EN-US
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:teal'>&gt;</span></p>

<p class=MsoNormal align=left style='text-align:left;text-autospace:none'><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:black'>&nbsp;&nbsp;
</span><span lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";
color:teal'>&lt;/</span><span lang=EN-US style='font-size:10.0pt;font-family:
"微软雅黑","sans-serif";color:#3F7F7F'>table</span><span lang=EN-US
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:teal'>&gt;</span></p>

<p class=MsoNormal style='text-indent:10.0pt'><span lang=EN-US
style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:teal'>&lt;/</span><span
lang=EN-US style='font-size:10.0pt;font-family:"微软雅黑","sans-serif";color:#3F7F7F;
background:silver'>body</span><span lang=EN-US style='font-size:10.0pt;
font-family:"微软雅黑","sans-serif";color:teal'>&gt;</span></p>

</div>

   
</body>
</html>   
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page language="java" import="java.sql.*,java.io.*,java.lang.*,java.util.*,com.incon.pojo.common.UserEntity" %>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="java.util.Date"%>

<%
UserEntity userEntity = (UserEntity) session.getAttribute("CURRENT_USER");
String path = request.getContextPath();
String yhdm= ""; 
if(userEntity != null){yhdm= userEntity.getYhdm(); } //(String) session.getAttribute("yhdm");
String yhxm=(String) session.getAttribute("yhxm");
if(("".equals(yhdm))||(yhdm==null)){
    response.sendRedirect(path+"/jsp/commons/error.jsp?id=1");
    return;
}%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>上传图片</title>
<meta content="text/html; charset=utf-8" http-equiv=Content-Type />
<base target="_self" />

</head>
<body style="min-width: 400px; height: 160px;">

<%
Date myDate = new Date();
String curTime=myDate.getTime()+"";

String name ="";
String strExt="";
String filename="";
String strFile="";

//**************************************************//
DiskFileItemFactory fu = new DiskFileItemFactory();
ServletFileUpload upload = new ServletFileUpload(fu);

// 设置允许用户上传文件大小,单位:字节
upload.setSizeMax(2*1024*1024);
// 设置最多只允许在内存中存储的数据,单位:字节
fu.setSizeThreshold(2*1024*1024);

//开始读取上传信息
@SuppressWarnings("unchecked")
List fileItems = null;
try {
	fileItems = upload.parseRequest(request);		//分析request，并将保存结果至List里 

	// 依次处理每个上传的文件
	@SuppressWarnings("unchecked")
	Iterator iter = fileItems.iterator();
	while (iter.hasNext()) 
	{
		FileItem item = (FileItem) iter.next();

		//文件域
		if(!item.isFormField() && item.getName().length()>0)
		{
			name = item.getName();//获取上传的文件名
			long size = item.getSize();//获取上传的文件大小(字节为单位)
			if((name==null||name.equals("")) && size==0)
				continue;//跳到while检查条件
			//以下为文件名处理，将上传的文件保存在项目所在目录下。
			//获取文件名字符串的长度
			int end = name.length();
			//返回在此字符串中最右边出现的指定子字符串的索引。
			int begin = name.lastIndexOf("\\");
			name=name.substring(begin+1,end);
			end=name.length();
			begin=name.lastIndexOf(".");
			strExt=name.substring(begin+1,end);
			filename=curTime+"."+strExt;
			strFile=pageContext.getServletContext().getRealPath("/upload/ck_upload/"+yhdm);
			File mkFile = new File(strFile);
			if(!mkFile.exists()){
				mkFile.mkdir();
				System.out.println("----"+strFile);
			}
			System.out.println(strFile);
			File savedFile = new File(strFile+"/"+filename); 
			System.out.println(savedFile+"]]]]]]]]]]]");
			item.write(savedFile);
		}
	}
%>

<script type="text/javascript">

function Done(){
    var ua = navigator.userAgent.toLowerCase(); 
    if(ua.match(/chrome\/([\d.]+)/)){  
    	window.opener.filename = '<%=path%>/upload/ck_upload/<%=yhdm%>/<%=filename%>'; 
//     	alert(window.opener.filename);
//     	alert("得到父窗口中的对象:"+ this.opener.bb);
    	this.opener.dx.getDialog().setValueOf('info','txtUrl','<%=path%>/upload/ck_upload/<%=yhdm%>/<%=filename%>');
    }else{
    	window.returnValue='<%=path%>/upload/ck_upload/<%=yhdm%>/<%=filename%>';    
    }		
	
	window.close();
}
</script>

<table border="0" style="width: 360px; margin-top: 20px; font-size: 12px;" align="center" cellpadding=0 cellspacing=0>
  <tr>
    <td style="height: 60px; line-height: 60px; text-align: center;">图片上传成功！</td>
  </tr>
  <tr>
    <td style="height: 40px; line-height: 40px;"></td>
  </tr>
  <tr>
    <td style="height: 40px; line-height: 40px; text-align: center;"><input type=button value=" 确 定 " onclick="javascript:Done();" class="PopButton" /></td>
  </tr>
</table>

<%
} catch (Exception e) {
e.printStackTrace();
%>
	<script type="text/javascript">
	alert("上传的文件超过系统限制！");
	history.back();
	</script>
<%
}
%>

</body>
</html>
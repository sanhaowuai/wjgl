<%@ page contentType="text/html; charset=utf-8" %><%@ page import="java.io.*"%><%


String strPathAll = request.getParameter("strPath");//存储路径
String strPath = strPathAll.substring(0,strPathAll.lastIndexOf("/")+1);
String reaFile = strPathAll.substring(strPathAll.lastIndexOf("/")+1,strPathAll.length());
String disFile = request.getParameter("disFile");//显示名称
String strFile = pageContext.getServletContext().getRealPath(strPath)+"/"+reaFile;

File f = new File(strFile);
if(f.exists()){
	FileInputStream fis = new FileInputStream(strFile); //读入文件

	response.setContentType("application/x-msdownload");
	response.setHeader("Content-disposition","attachment;filename=\""+new String(disFile.getBytes("GBK"),"iso8859-1")+"\"");

	OutputStream sOut = response.getOutputStream();

	byte[] b = new byte[4096];

	int len = 0;
	while ((len = fis.read(b))!= -1){
		sOut.write(b, 0, len);
	}
	fis.close();
	sOut.close();
}else{
	out.print("<script language='javascript'>");
	out.print("alert('文件不存在');");
	out.print("history.back();");
	//out.print("window.location.href='"+request.getHeader("Referer")+"'");
	out.print("</script>");
}
%>
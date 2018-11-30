package com.incon.project.common.pageGenerate.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 创建初始化页面
 * @author Meng
 *
 */
public class PageCreate {

	private static String br = "\r\n";//换行符
	//获取报表初始页面
	public static String getBbPage(String searchPage,String listPage){
		StringBuffer sb = new StringBuffer();
			sb.append("<%@ page language=\"java\" import=\"java.util.*\" pageEncoding=\"utf-8\"%>"+br);
			sb.append("<%@ taglib prefix=\"c\" uri=\"http://java.sun.com/jsp/jstl/core\"%>"+br);
			sb.append("<%@ taglib prefix=\"fmt\" uri=\"http://java.sun.com/jsp/jstl/fmt\"%>"+br);
			sb.append("<%@ taglib prefix=\"fn\" uri=\"http://java.sun.com/jsp/jstl/functions\"%>"+br);
			sb.append("<%@ taglib prefix=\"ff\" uri=\"fenYeListNo\"%> "+br);
			sb.append("<%"+br);
			sb.append("		String path = request.getContextPath();"+br);
			sb.append("		String basePath = request.getScheme()+\"://\"+request.getServerName()+\":\"+request.getServerPort()+path+\"/\";"+br);
			sb.append("%>"+br);
			sb.append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">"+br);
			sb.append("<html xmlns=\"http://www.w3.org/1999/xhtml\">"+br);
			sb.append("<head>"+br);
			sb.append("		<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />"+br);
			sb.append("		<title>统计分析</title>"+br);
			sb.append("		<jsp:include page=\"../../include/css-main-include.jsp\"></jsp:include>"+br);
			sb.append("		<style type=\"text/css\">"+br);
			sb.append("html, body { height:100%; }"+br);
			sb.append(".Contentbox { width:100%; min-height:100%;height:auto }"+br);
			sb.append("*html .Contentbox { height:100% }"+br);
			sb.append("</style>"+br);
			sb.append("<script type=\"text/javascript\" src=\"<%=path%>/resources/js/jquery/jquery-1.7.2.min.js\"></script>"+br);
			sb.append("<script type=\"text/javascript\" src=\"<%=path%>/resources/js/common/modalpopup.js\"></script>"+br);
			sb.append("<script type=\"text/javascript\" src=\"<%=path%>/resources/js/common/validator.js\" ></script>"+br);
			sb.append("<script type=\"text/javascript\" src=\"<%=path%>/resources/js/common/jqcheckBox.js\"></script>"+br);
			sb.append("<script type=\"text/javascript\" src=\"<%=path%>/resources/js/jquery/jquery.form.2.36.js\"></script>"+br);
			sb.append("<script type=\"text/javascript\" src=\"<%=path%>/resources/js/common/Action.js\"></script>"+br);
			sb.append("<script type=\"text/javascript\" src=\"<%=path%>/resources/js/common/RequestParam.js\"></script>"+br);
			sb.append("<script type=\"text/javascript\">"+br);
			sb.append("$(document).ready(function(){"+br);
			sb.append("   $(\"#ff\").baigoCheckall();"+br);
			sb.append("});"+br);
			sb.append(""+br);
			sb.append("function querylike(){"+br);
			sb.append("	document.queryform.action=\"<%=path%>/pageGen/queryView\";"+br);
			sb.append("document.queryform.submit();"+br);
			sb.append("}"+br);
			sb.append("</script>"+br);
			sb.append("</head>"+br);
			sb.append("<body>"+br);
//			sb.append("<div class=\"Contentbox\">"+br);
//			sb.append(" <div class=\"mainbg\"></div>"+br);
			sb.append(" <div class=\"pd10\">"+br);
//			sb.append(" <div class=\"question\" title=\"帮助\" onclick=\"javascript:cha('${QXB.QXDM}');\"></div>    "+br);
//			sb.append(" <div class=\"address\">当前位置：${QXB.FQXMC} >> ${QXB.QXMC}</div>"+br);
//			sb.append(" <div class=\"address_main\"><div class=\"address\"><span>当前位置：${QXB.FQXMC} >> ${QXB.QXMC}</span></div></div>"+br);
//			sb.append(" <div class=\"clr\"></div>"+br);
			
			
			//搜索区域
			if(searchPage != null && !"".equals(searchPage)){
				sb.append("<div class=\"butsea\">"+br);
				sb.append(" <form id=\"queryform\" name=\"queryform\" method=\"post\">"+br);
				sb.append("<input name=\"searchId\" type=\"hidden\" value=\"${searchId}\" >"+br);
				sb.append("<input name=\"type\" type=\"hidden\" value=\"2\" >"+br);
				sb.append("  <table  border=\"0\" align=\"right\" cellpadding=\"0\" cellspacing=\"0\"  >"+br);
				sb.append("    <tr>"+br);
				sb.append(searchPage);
				sb.append("    <td ><div class=\"addlist_button2 ml10\"> <a href=\"javascript:void(0);\" onclick=\"javascript:querylike();return false;\"><span>搜&nbsp;&nbsp;索</span></a> </div></td>"+br);
				sb.append("  </tr>"+br);
				sb.append("  </table>"+br);
				sb.append("</form>"+br);
				sb.append("</div>"+br);
				sb.append(" <div class=\"clr\"></div>"+br);
			}
			sb.append("</div>"+br);
//			sb.append("</div>"+br);
			sb.append("${jsonStr}"+br);
			sb.append("<jsp:include page=\"/jsp/include/div-help-include.jsp\"></jsp:include>"+br);
			sb.append("<div id=\"setting\"> </div>"+br);
			sb.append("<script src=\"<%=path%>/resources/js/Highcharts-4.2.5/js/highcharts.src.js\"></script>"+br);
			sb.append("<script src=\"<%=path%>/resources/js/Highcharts-4.2.5/js/highcharts-more.js\"></script>"+br);
			sb.append("<script src=\"<%=path%>/resources/js/Highcharts-4.2.5/js/modules/data.src.js\"></script>"+br);
			sb.append("<script src=\"<%=path%>/resources/js/Highcharts-4.2.5/js/modules/exporting.js\"></script>"+br);
			sb.append("</body>"+br);
			sb.append("</html>"+br);
		return sb.toString();
	}
	
	//获取初始页面
	public static String getNewPage(String menuPage,String searchPage,String listPage){
		StringBuffer sb = new StringBuffer();
			sb.append("<%@ page language=\"java\" import=\"java.util.*\" pageEncoding=\"utf-8\"%>"+br);
			sb.append("<%@ taglib prefix=\"c\" uri=\"http://java.sun.com/jsp/jstl/core\"%>"+br);
			sb.append("<%@ taglib prefix=\"fmt\" uri=\"http://java.sun.com/jsp/jstl/fmt\"%>"+br);
			sb.append("<%@ taglib prefix=\"fn\" uri=\"http://java.sun.com/jsp/jstl/functions\"%>"+br);
			sb.append("<%@ taglib prefix=\"ff\" uri=\"fenYeListNo\"%> "+br);
			sb.append("<%"+br);
			sb.append("		String path = request.getContextPath();"+br);
			sb.append("		String basePath = request.getScheme()+\"://\"+request.getServerName()+\":\"+request.getServerPort()+path+\"/\";"+br);
			sb.append("%>"+br);
			sb.append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">"+br);
			sb.append("<html xmlns=\"http://www.w3.org/1999/xhtml\">"+br);
			sb.append("<head>"+br);
			sb.append("		<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />"+br);
			sb.append("		<title>统计分析</title>"+br);
			sb.append("		<jsp:include page=\"../../include/css-main-include.jsp\"></jsp:include>"+br);
			sb.append("		<style type=\"text/css\">"+br);
			sb.append("html, body { height:100%; }"+br);
			sb.append(".Contentbox { width:100%; min-height:100%;height:auto }"+br);
			sb.append("*html .Contentbox { height:100% }"+br);
			sb.append("</style>"+br);
			sb.append("<script type=\"text/javascript\" src=\"<%=path%>/resources/js/jquery/jquery-1.7.2.min.js\"></script>"+br);
			sb.append("<script type=\"text/javascript\" src=\"<%=path%>/resources/js/common/modalpopup.js\"></script>"+br);
			sb.append("<script type=\"text/javascript\" src=\"<%=path%>/resources/js/common/validator.js\" ></script>"+br);
			sb.append("<script type=\"text/javascript\" src=\"<%=path%>/resources/js/common/jqcheckBox.js\"></script>"+br);
			sb.append("<script type=\"text/javascript\" src=\"<%=path%>/resources/js/jquery/jquery.form.2.36.js\"></script>"+br);
			sb.append("<script type=\"text/javascript\" src=\"<%=path%>/resources/js/common/Action.js\"></script>"+br);
			sb.append("<script type=\"text/javascript\" src=\"<%=path%>/resources/js/common/RequestParam.js\"></script>"+br);
			sb.append("<script type=\"text/javascript\">"+br);
			sb.append("$(document).ready(function(){"+br);
			sb.append("   $(\"#ff\").baigoCheckall();"+br);
			sb.append("});"+br);
			sb.append(""+br);
			sb.append("function querylike(){"+br);
			sb.append("	document.queryform.action=\"<%=path%>/pageGen/queryView\";"+br);
			sb.append("document.queryform.submit();"+br);
			sb.append("}"+br);
			sb.append("</script>"+br);
			sb.append("</head>"+br);
			sb.append("<body>"+br);
			sb.append("<div class=\"Contentbox\">"+br);
			sb.append(" <div class=\"mainbg\"></div>"+br);
			sb.append(" <div class=\"pd10\">"+br);
			sb.append(" <div class=\"question\" title=\"帮助\" onclick=\"javascript:cha('${QXB.QXDM}');\"></div>    "+br);
			sb.append(" <div class=\"address\">当前位置：${QXB.FQXMC} >> ${QXB.QXMC}</div>"+br);
//			sb.append(" <div class=\"address_main\"><div class=\"address\"><span>当前位置：${QXB.FQXMC} >> ${QXB.QXMC}</span></div></div>"+br);
			sb.append(" <div class=\"clr\"></div>"+br);
			
			sb.append("<div class=\"butsea\">"+br);
			//功能按钮区域
			if(menuPage != null && !"".equals(menuPage)){
				sb.append("<table  border=\"0\" align=\"left\" cellpadding=\"0\" cellspacing=\"0\"  >"+br);
				sb.append("<tr>"+br);
				sb.append("<td height=\"35px\"> "+br);
				sb.append(menuPage);
				sb.append("</td> "+br);
				sb.append("</tr> "+br);
				sb.append("</table> "+br);
			}
			//搜索区域
			sb.append(" <form id=\"queryform\" name=\"queryform\" method=\"post\">"+br);
			sb.append("<input name=\"searchId\" type=\"hidden\" value=\"${searchId}\" >"+br);
			sb.append("<input name=\"type\" type=\"hidden\" value=\"1\" >"+br);
			if(searchPage != null && !"".equals(searchPage)){
				sb.append("  <table  border=\"0\" align=\"right\" cellpadding=\"0\" cellspacing=\"0\"  >"+br);
				sb.append("    <tr>"+br);
				sb.append(searchPage);
				sb.append("    <td ><div class=\"addlist_button2 ml10\"> <a href=\"javascript:void(0);\" onclick=\"javascript:querylike();return false;\"><span>搜&nbsp;&nbsp;索</span></a> </div></td>"+br);
				sb.append("  </tr>"+br);
				sb.append("  </table>"+br);
			}
			sb.append("</form>"+br);
			sb.append("</div>"+br);
			sb.append(" <div class=\"clr\"></div>"+br);
			
			//列表区域
			if(listPage != null && !"".equals(listPage)){
				sb.append(listPage);
			}
			
			sb.append("</div>"+br);
			sb.append("</div>"+br);
			sb.append("<jsp:include page=\"/jsp/include/div-help-include.jsp\"></jsp:include>"+br);
			sb.append("<div id=\"setting\"> </div>"+br);
			sb.append("</body>"+br);
			sb.append("</html>"+br);
		return sb.toString();
	}
	
	/**
	 * 获取搜索区域
	 * @param dm
	 * @param name
	 * @param list 下拉框对应列
	 * @param bt  搜索标题 如果不需要显示则此处填""
	 * @param nameParam name属性
	 * @param parameter 返回值
	 * @param type  1下拉框  2文本框
	 * @return
	 */
	public static String getSearchPage(String dm,String name,List<Map<String, String>> list,String bt,String nameParam,String type){
		StringBuffer sb = new StringBuffer();
		if(bt != null && !"".equals(bt)){
			sb.append("<td>"+br);
			sb.append(bt+"："+br);
			sb.append("</td>"+br);
		}
		if(type.equals("2")){
			sb.append("<td>"+br);
			sb.append("<select name=\""+nameParam+"\" class=\"se150\">"+br);
			sb.append("<option value=''>--请选择--</option>"+br);
			for (Map<String, String> toolMap : list) {
				sb.append("<option value='" + toolMap.get(dm.toUpperCase()) + "'"+br);
				sb.append("<c:if test=\"${"+dm+" eq '"+toolMap.get(dm.toUpperCase())+"' }\" >"+br);
				sb.append("selected=selected"+br);
				sb.append("</c:if> >"+br);
				sb.append(toolMap.get(name.toUpperCase()) + "</option>"+br);
			}
			sb.append("</select>"+br);
			sb.append("</td>"+br);
		}else{
			sb.append("<td>"+br);
			sb.append("<input name=\""+nameParam+"\" value=\"${"+nameParam+"}\" type=\"text\" >"+br);
			sb.append("</td>"+br);
		}
		return sb.toString();
	}
	
	/**
	 * 
	 * @param initMap
	 * @param list
	 * @return
	 */
	public static String getListPage(String initMap,List<Map<String,String>> list){
		StringBuffer sb = new StringBuffer();
		String[] initStr = initMap.split(",");
		sb.append("<div class=\"list\">"+br);
		sb.append("<form name=\"ff\" method=\"post\" id=\"ff\" >"+br);
		sb.append("<table width=\"100%\"  cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse\" class=\"bot_line\">"+br);
		sb.append("<tr>"+br);
		sb.append("<th><input type=\"checkbox\" title=\"全选/不选\" id=\"ids\" style=\"padding:0;margin-left:2px;*margin-left:-2px;\"></th>");
		sb.append("<th>序号</th>"+br);
		for(String str : initStr){
			String[] s = str.split(":");
			sb.append("<th>"+s[1]+"</th>"+br);
		}
		if(list != null && list.size() > 0){
			sb.append("<th>操作</th>"+br);
		}
		sb.append("</tr>"+br);
				
		sb.append("<% List<Map<String,String>> list = (List<Map<String, String>>) request.getAttribute(\"list\");"+br);
		sb.append("for(int i = 0 ;i < list.size(); i ++){"+br);
		sb.append("Map map = list.get(i); %>"+br);
		sb.append("<tr <%=(i%2 == 0?\"class='bgcol'\" : \"\")%> >"+br);
		sb.append("<td><input type=\"checkbox\" name=\"ids\" value=\"\"></td>"+br);
		sb.append("<td><%= i+1%></td>"+br);
		for(String str : initStr){
			String[] s = str.split(":");
			sb.append("<td><%=(map.get(\""+s[0].toUpperCase()+"\") == null ? \"\" : map.get(\""+s[0].toUpperCase()+"\"))%></td>"+br);
		};
		if(list != null && list.size() > 0){
			sb.append("<td>");
			for(Map<String,String> map : list){
				sb.append("<div class=\"cz_button "+map.get("INCO")+"\" title=\""+map.get("GNMC")+"\" onclick=\"window.location.href='"+map.get("HNTZLJ")+"'\"></div>");
			}
			sb.append("</td>"+br);
		}
		sb.append("</tr>"+br);
		sb.append("<% } %>"+br);
		sb.append("</table>"+br);
		sb.append("</form>"+br);
		sb.append("</div>"+br);
		sb.append("<c:if test=\"${sffy eq '1' }\">"+br);
		sb.append("<div class=\"youtube\">"+br);
		sb.append("<ff:page mhFrom=\"queryform\" showReSize=\"true\" listPageCount=\"10\" field=\"pageSearchPage\" onlyOneShow=\"true\" showListNo=\"true\" action=\"pageGen/queryView\"/>"+br);
		sb.append("</div>"+br);
		sb.append("</c:if>"+br);
		sb.append("<div class=\"clr\"></div>"+br);
		return sb.toString();
	}
	
	/**
	 * 
	 * @param initMap
	 * @param list
	 * @return
	 */
	public static String getMenuPage(String name,String tzlj){
		return "<div class=\"addlist_button  ml15\"> <a href=\""+tzlj+"\"><span>"+name+"</span></a> </div> "+br;
	}
	
}

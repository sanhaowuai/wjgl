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
</style>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/validator.js" ></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>

<script type="text/javascript" src="<%=path%>/resources/js/common/Action.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/common/RequestParam.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/bootstrap.js"></script>
<script type="text/javascript" >
	jQuery().ready(function (){ 
		<c:if test="${!empty msg}">
			alert('${msg}');
		</c:if>
		});
	
	//查询
	function queryLike(){
		document.queryform.action = "<%=path%>/kbcx/queryGrkb";
	    document.queryform.submit();
	}
	//查询周课表
	function queryZkb(){
	     document.queryform.action = "<%=path%>/kbcx/queryXszkb";
	     document.queryform.submit();
	}
</script>
</head>

<body>
<div class="Contentbox">
  <div class="mainbg"></div>
  <div class="pd10">
  	<div class="question" title="帮助" onclick="javascript:cha('${QXB.QXDM}');"></div> 
    <div class="address">当前位置：${QXB.FQXMC} >> ${QXB.QXMC}</div>
    <div class="clr"></div>
    <div class="butsea">
	 <div class="dropdown pull-right">
       <form id="queryform" name="queryform" method="post">
	   <div class="btn-group">
		  <button type="button" class="btn btn-search dropdown-toggle" data-toggle="dropdown">搜索 <span class="caret"></span></button>
		  <div class="dropdown-menu search-list pull-right" role="menu" style="width:260px;">
          <table border="0" width="96%"  cellpadding="0" cellspacing="0"  >
		      <tr>
		      	<th width="90">学年学期：</th>
	           	<td>
	           	  <select name="xnxq" id="xnxq"  class="XNXQ_CON">
               		<c:forEach items="${xnxqList}" var="obj" >
			  			<option value="${obj.XNXQ}" ${xnxq == obj.XNXQ ? 'selected' : '' }>${obj.XNXQMC}</option>
			  		</c:forEach>
                	</select>
	           	</td>
		       </tr>
		       <tr>
		        <th>周次：</th>
	           	<td>
	           	  <select name="zc" id="zc">
               		<c:forEach items="${zclist}" var="obj" >
			  			<option value="${obj.ZC}" ${zc == obj.ZC ? 'selected' : '' }>第${obj.ZC}周</option>
			  		</c:forEach>
               	</select> 
	           	</td>
		      </tr>
      	</table> 
	    <div class="divider"></div>
        <div class="clr"></div>
        <div class="addlist_button pull-right mr10"> <a href="javascript:void(0);" onclick="javascript:queryZkb();return false;"><span>确定</span></a> </div>
	   </div>
	</div>
    </form>     
   </div>      
    
    </div>
     <div class="clr"></div>  
           <div class="Menubox" >
            <ul>
              <li><a href="javascript:void(0);"  onclick="javascript:queryLike();return false;" >学生总课表</a></li>
              <li class="hover"><a href="javascript:void(0);"  onclick="javascript:queryZkb();return false;" >学生周课表</a></li>
            </ul>
          </div> 
         <div class="clr"></div>  
        
         <div class="xfyq_area mt10">
	            <div class="xfyq_top" style="text-align:center"><span class="ml10 bold">${kbxx }</span>${rqStr}</div>
	            <div class="xfyq_con"> 
            <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
                 <tr>
				    <th width="8%" colspan="2">&nbsp;</th>
				    <th width="12%" >星期一</th>
				    <th width="12%" >星期二</th>
				    <th width="12%" >星期三</th>
				    <th width="12%" >星期四</th>
				    <th width="12%" >星期五</th>
				    <th width="12%" >星期六</th>
				    <th width="12%" >星期日</th>
			  	</tr>
			  	
              <c:forEach items="${kcbList}" varStatus="stuts" var="kcb">
					<tr <c:if test="${stuts.count % 2 eq '0'}">class="bgcol"</c:if>>
						<td  width="40" id="tb__${stuts.count}">${
							kcb.SXW_CN}</td>
						<td  width="70">${kcb.BZ}</td>
						<td><div class="kbtext">${empty kcb.MON ? '&nbsp' :
							kcb.MON}</div></td>
						<td><div class="kbtext">${empty kcb.TUES ? '&nbsp' :
							kcb.TUES}</div></td>
						<td><div class="kbtext">${empty kcb.WED ? '&nbsp' :
							kcb.WED}</div></td>
						<td><div class="kbtext">${empty kcb.THUR ? '&nbsp' :
							kcb.THUR }</div></td>
						<td><div class="kbtext">${empty kcb.FRI ? '&nbsp' :
							kcb.FRI }</div></td>
						<td><div class="kbtext">${empty kcb.SAT ? '&nbsp' :
							kcb.SAT}</div></td>
						<td><div class="kbtext">${empty kcb.SUN ? '&nbsp' :
							kcb.SUN}</div></td>
					</tr>
				</c:forEach>	
		    	
		    	<c:if test="${fn:length(xssjk) ne 0}" >
				 <tr><td colspan="9">其它课程：
				 <c:forEach items="${xssjk}" varStatus="s" var="obj">
				  ${obj.SJKCZW} 
				 </c:forEach>
				 </td></tr>
		    	</c:if>
		    	
		    	 <c:if test="${fn:length(kcbList) eq 0}" >
				 <tr>
                   <td colspan="9" height="200px" valign="middle" align="center"><span class="FONT16 red bold">没有数据!</span></td>
                 </tr>
		    	</c:if>
             </table>
	            </div> 
	            <div class="clr"></div>
	        </div>     

        
        <div class="clr"></div>       
    </div>
 </div>

<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"> </div>
</body>
</html>


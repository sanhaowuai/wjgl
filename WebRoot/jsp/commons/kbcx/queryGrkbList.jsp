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
	
	//导出
	function exportExcel(){
		document.queryform.action = "<%=request.getContextPath() %>/kbcx/ExportGrKbxx";
	 	document.queryform.submit();
	}
	
	//查询周课表
	function queryZkb(){
	     document.queryform.action = "<%=path%>/kbcx/queryXszkb";
	     document.queryform.submit();
	}
	function kbqr(){
		 document.queryform.action = "<%=path%>/kbcx/kbqr";
	     $("#queryform").ajaxSubmit(function(result){
		       if(result==null || result =="" ){
		             alert("课表确认成功!");	 
		             document.queryform.action = "<%=path%>/kbcx/queryGrkb";
		             document.queryform.submit();          
		        }else{
		             alert("课表确认失败!");
		             document.queryform.action = "<%=path%>/kbcx/queryGrkb";
		             document.queryform.submit();
		            
		        }
			})
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
      <form id="queryform" name="queryform" method="post">
        <table  border="0" align="right" cellpadding="0" cellspacing="0"  >
          <tr>
            <td height="35px">学年学期：</td>
            <td>
                 <select name="xnxq" id="xnxq"  class="XNXQ_CON" onchange="javascript:queryLike();return false;">
               		<c:forEach items="${xnxqList}" var="obj" >
			  			<option value="${obj.XNXQ}" ${xnxq == obj.XNXQ ? 'selected' : '' }>${obj.XNXQMC}</option>
			  		</c:forEach>
               	</select>      
            </td> 
            <c:if test="${bs ne '-1'}">
               <td>
                   <div class="addlist_button1 ml15"><a href="javascript:void(0);" onclick="javascript:exportExcel();return false;"><span>导出课表</span></a></div> 
               </td>
            </c:if>
           
          </tr>
        </table>
      </form>
    
    </div>
    <div class="clr"></div>
    <div class="Menubox">
       <ul>
         <li class="hover"><a href="javascript:void(0);"  onclick="javascript:queryLike();return false;" >学生总课表</a></li>
         <li><a href="javascript:void(0);"  onclick="javascript:queryZkb();return false;" >学生周课表</a></li>
       </ul>
    </div> 
    <div class="clr"></div>
     <div class="xfyq_area mt10">
	            <div class="xfyq_top" style="text-align:center"><span class="ml10 bold">${kbxx }</span></div>
	            <div class="xfyq_con"> 
           <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
                 <tr>
				    <th width="40" height="30" colspan="2">&nbsp;</th>
				    <th>星期一</th>
				    <th>星期二</th>
				    <th>星期三</th>
				    <th>星期四</th>
				    <th>星期五</th>
				    <th>星期六</th>
				    <th>星期日</th>
			  	</tr>
              <c:forEach items="${kcbList}" varStatus="stuts" var="kcb">
					<tr <c:if test="${stuts.count % 2 eq '0'}">class="bgcol"</c:if>>
						<td  width="20">${kcb.SXW_CN}</td>
						<td  width="20">${kcb.BZ}</td>
						<td  width="118">${empty kcb.MON ? '&nbsp' : kcb.MON}</td>
						<td  width="118">${empty kcb.TUES ? '&nbsp' : kcb.TUES}</td>
						<td  width="118">${empty kcb.WED ? '&nbsp' : kcb.WED}</td>
						<td  width="118">${empty kcb.THUR ? '&nbsp' : kcb.THUR }</td>
						<td  width="118">${empty kcb.FRI ? '&nbsp' : kcb.FRI }</td>
						<td  width="118">${empty kcb.SAT ? '&nbsp' : kcb.SAT}</td>
						<td  width="122">${empty kcb.SUN ? '&nbsp' : kcb.SUN}</td>
					</tr>
				</c:forEach>	
			
		    	<c:if test="${fn:length(xssjk) ne 0}" >
				 <tr><td colspan="9">其它课程： <c:forEach items="${xssjk}" varStatus="s" var="obj">${obj.SJKCZW}  </c:forEach>
				 </td></tr>
		    	</c:if>
		    	
		    	 <c:if test="${fn:length(kcbList) eq 0}" >
				 <tr> <td colspan="9" height="200px" valign="middle" align="center"><span class="FONT16 red bold">没有数据!</span></td></tr>
		    	 </c:if>
		    	
             </table>
	            </div> 
	            <div class="clr"></div>
	        </div>     
     
        
        <div class="clr"></div>  
         <div style="color: red; ">
                              注意：“个人课表查询”是按照您的选课进行显示，请仔细与“班级推荐课表查询”页面进行对比，如发现个人课表中缺少本班级的推荐课程（特别是必修课），则说明您可能存在漏选情况，请认真核实，如有需要请及时进行补选。
        </div>    
    <div class="clr"></div>
  </div>
</div>

<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"> </div>
</body>
</html>


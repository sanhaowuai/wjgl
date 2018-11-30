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
<jsp:include page="../../../include/css-main-include.jsp"></jsp:include>
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
		var xnxqid = $("#xnxqid").val();
		var pjsfkf = $("#pjsfkf").val();

		if(pjsfkf == '1'){
			if(xnxqid==''){
				alert("请选择学年学期进行查询！")
			}else{
				document.queryform.action = "<%=path%>/cjcx/queryQmcj";
		        document.queryform.submit();
			}
	    }else{
	    	document.queryform.action = "<%=path%>/cjcx/queryQmcj";
	        document.queryform.submit();
		}
	}

 	//查看详细
	function queryCjView(id,rwh,jhh){
 		var src = "<%=request.getContextPath() %>/cjcx/queryCjxxView?id="+id+"&rwh="+rwh+"&jhh="+jhh;
 		jQuery("#iframename_cj").attr("src",src);
 		BOX_show('divShowBox');
	}

	//取消
	function onQx(){
	 	jQuery("#iframename_cj").attr('src','');
		BOX_remove('divShowBox');
	}
<%--	//返回--%>
<%--	function onBackObj(){--%>
<%--	 	window.location.href="<%=path%>/cjcx/queryCjpub";--%>
<%--	}--%>
	
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
     <span style="color: red; float:left">【备注】授课教师录入并提交成绩后，该门课程方在此页显示。</span>
      <form id="queryform" name="queryform" method="post">
       <input type="hidden" value="${pjsfkf}" id="pjsfkf"/>	
        <table  border="0" align="right" cellpadding="0" cellspacing="0"  >
          <tr>
            <td align="left"><span class="red bold"> ${map.BZ }</span></td>
              <c:choose>
                	<c:when test="${pjsfkf eq '1'}" >
	                	<td>学年学期：</td>
	                    <td>
							 <select name="pageXnxq" id="xnxqid" class="XNXQ_CON">
							 	<option value="">-请选择-</option>
		                		<c:forEach items="${xnxqList}" var="obj" >
						  			<option value="${obj.XNXQ}" ${cjcxPage.pageXnxq == obj.XNXQ ? 'selected' : '' }>${obj.XNXQMC}</option>
						  		</c:forEach>
		                	</select> 
	                    </td>
                	</c:when>
                	<c:otherwise>
	                	<td>学年学期：</td>
	                    <td>
							 <select name="pageXnxq" id="xnxqid" class="XNXQ_CON">
							 	<option value="">-全部-</option>
		                		<c:forEach items="${xnxqList}" var="obj" >
						  			<option value="${obj.XNXQ}" ${cjcxPage.pageXnxq == obj.XNXQ ? 'selected' : '' }>${obj.XNXQMC}</option>
						  		</c:forEach>
		                	</select> 
	                    </td>
                	</c:otherwise>
                </c:choose>
                   
                   <td>重修补考：</td>
                   <td>
					 <select name="pageBkcxbj"  class="CXBK_CON">
					 	<option value="">-全部-</option>
				  		<option value="0" ${cjcxPage.pageBkcxbj == '0' ? 'selected' : '' }>正考</option>
				  		<option value="1" ${cjcxPage.pageBkcxbj == '1' ? 'selected' : '' }>补考</option>
				  		<option value="2" ${cjcxPage.pageBkcxbj == '2' ? 'selected' : '' }>重修</option>
                	</select> 
                   </td>
                   <td>是否及格：</td>
                   <td>
					 <select name="pageSfjg"  class="SFJG_CON">
					 	<option value="">-全部-</option>
				  		<option value="0" ${cjcxPage.pageSfjg == '0' ? 'selected' : '' }>不及格</option>
				  		<option value="1" ${cjcxPage.pageSfjg == '1' ? 'selected' : '' }>及格</option>
                	</select> 
                   </td>
                   <td>课程：</td>
                   <td><input type="text" value="${cjcxPage.pageKcmc}" name="pageKcmc" style="width: 90px;"  class="KC_CON"/></td>
                   <td>
                   	<div class="addlist_button2"> 
	                   	<a href="javascript:void(0);" onclick="javascript:queryLike();return false;"><span>查&nbsp;&nbsp;询</span></a> 
	                 </div>
	             </td>
               </tr>
               <tr>
                 <c:if test="${cjszbobj.xnxq eq cjcxPage.pageXnxq and  map1.KZXX eq '1'}">
                  <td colspan="5"  align="left"><span class="red bold">成绩提交后在${cjszbobj.cjfhsqksts}天 - ${cjszbobj.cjfhsqjsts}天之内可以进行成绩复核申请。</span></td>
                 </c:if>
                </tr>
        </table>
      </form>
      
    </div>
    <div class="clr"></div>
    <div class="list"  >
		 <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
              <tr>
                 <th width="3%">序号</th>
                 <th width="6%">学年学期</th>
                 <th width="11%">开课院系</th>
                 <th width="8%">课程代码</th>
                 <th width="20%">课程名称</th>
                 <th>课程性质</th>
                 <th>课程类别</th>
                 <th>学分</th>
                 <th>是否考试课</th>
                 <th>参与学分绩</th>
                 <th>补考重修标记</th>
                 <th>总成绩</th>
                 <th>成绩备注</th>
                 <c:if test="${ map2.KZXX eq '1'}">
                 	 <th>教学班排名</th>
                 </c:if>
                 <th>成绩提交时间</th>
                 <th>操作</th>
               </tr>
               <c:forEach items="${cjlist}" var="obj" varStatus="i">  <!-- 是否及格：不及格样式为红色 -->
	        	<tr <c:if test="${i.count % 2 eq '0'}">class="bgcol"</c:if> <c:if test="${obj.sfjg == '0'}">style="color:red"</c:if> >
	        		<td>${i.count}</td>
	        		<td>${obj.xnxqmc}</td>
	        		<td>${obj.kkyxmc}</td>
		         	<td>${obj.kcdm}</td>
		         	<td>${obj.kcmc}</td>
		         	<td>${obj.kcxzmc}</td>
		         	<td>${obj.kclbmc}</td>
		         	<td>${obj.xf}</td>
 		            <td>${obj.sfksk=='1' ? '是':' '}</td>
 		            <td>${obj.sfcyxfjjs=='1' ? '是':' '}</td>
 		            <td>
		 			   <c:choose>
	 					 <c:when test="${obj.bkcxbj == '1'}"><font color="#0066ff">补考</font></c:when>
	 					 <c:when test="${obj.bkcxbj == '2'}"><font color=#339900 >重修</font></c:when>
	 					 <c:when test="${obj.bkcxbj == '3'}">毕业补考</c:when>
					   </c:choose> 		            
 		            </td>
		            <td>${obj.zpcj}</td>
		            <td>${obj.cjbzmc}</td>
		             <c:if test="${ map2.KZXX eq '1'}">
		           		 <td>${obj.pm}</td>
		            </c:if>
		            <td>${obj.cjtjsj}</td>
		            <td>
		            	<c:if test="${obj.bkcxbj == '0'}">
		            	<div class="cz_button cz2_1" title="查看"  onclick="javascript:queryCjView('${obj.id}','${obj.rwh}','${obj.jhh}');"></div>
		             	</c:if>     
		       		 </td>
	       		</tr>
	       	</c:forEach>
       </table>
    </div>
    <div class="youtube"> 
       <c:if test="${not empty cjcxPage}">
            <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="cjcxPage"  showListNo="true" action="cjcx/queryQmcj" />
       </c:if>
    </div>
    <div class="clr"></div>
  </div>
</div>


<div id="divShowBox" style="display:none; width: 700px; border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
      <div class="popup">  
	    <div class="Floatleft Pct100 mb10">
	      <div class="popup_left">详细信息</div>
	      <a href="#" class="btn_close" onclick="javascript:onQx();"></a>
	    </div>        
        <div class="clr"></div>
		<iframe id="iframename_cj" name="iframename_cj"  border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%; height: 300px;" frameborder="0" allowTransparency="true"></iframe>
        <div class="clr"></div> 
        <table   width="100%"  cellpadding="0" cellspacing="0"  class="mt10" style="border-collapse:collapse">
            <tr>
                <td align="center">
                	<div class="addlist_button1" style="float:right">
                		<a href="javascript:onQx();"><span>取消</span></a> 
                	</div>
                 </td>
            </tr>
        </table>
        <div class="clr"></div>
     </div>
 </div>
<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"> </div>
</body>
</html>


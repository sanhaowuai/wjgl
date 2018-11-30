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
		var pageZc1 = $("#pageZc1").val();
		var pageZc2 = $("#pageZc2").val();
		
        if(pageZc1 == "" || pageZc2==""){
            alert('请选择周次进行查询!'); 
            return;
        }else{
        	document.queryform.action = "<%=path%>/kjscx/queryKjs_wdl";
            document.queryform.submit();
        }
	}
	//校区联动
	function changeXq(){
		var id=$("#pageXiaoqu").val();
		var url="<%=path%>/kjscx/queryJxlListBySjid";
		$("#pageLhdm").empty();
		$("#pageCddm").empty();
		$.post(url,{"id":id},function(result){
			var option="<option value=''>-全部-</option>";
			$("#pageCddm").append(option);
			$.each(result,function(k,v){
				option+="<option value='"+v.DM+"'>"+v.MC+"</option>";
			});
			$("#pageLhdm").append(option);
		},"json");
	}
	//楼号联动
	function changeLh(){
		var id=$("#pageLhdm").val();
		var url="<%=path%>/kjscx/queryJxcdListBySjid";
		$("#pageCddm").empty();
		$.post(url,{"id":id},function(result){
			var option="<option value=''>-全部-</option>";
			$.each(result,function(k,v){
				option+="<option value='"+v.DM+"'>"+v.MC+"</option>";
			});
			$("#pageCddm").append(option);
		},"json");
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
       <table  border="0" align="left" cellpadding="0" cellspacing="0"  >
          <tr>
             <td><span class="glyphicon glyphicon-flag"></span></td><td>占用</td>
          </tr>
      </table> 
	 <div class="dropdown pull-right">
       <form id="queryform" name="queryform" method="post">
	   <div class="btn-group">
		  <button type="button" class="btn btn-search dropdown-toggle" data-toggle="dropdown">搜索 <span class="caret"></span></button>
		  <div class="dropdown-menu search-list pull-right" role="menu" style="width:260px;">
          <table border="0" width="96%"  cellpadding="0" cellspacing="0"  >
		      <tr>
		      	<th colspan="2">${xnxqmc }学期</th>
	           	<td><input type="text" name="sfbr" id="qf_fbr" value="${bmxxcxPage.sfbr}"/></td>
		       </tr>
		       <tr>
		        <th width="100">周次：</th>
	           	<td>
	           	  <input type="hidden" name="pageXnxq" id="pageXnxq" value="${xnxq }"/>
                   <select name="pageZc1" id="pageZc1" class="ZC_CON" style="width:100px !important;">
				 	    <option value="">-请选择-</option>
			  			<option value="1"  ${kjscxPage.pageZc1 == '1'? 'selected' : '' }>1周</option>
			  			<option value="2"  ${kjscxPage.pageZc1 == '2'? 'selected' : '' }>2周</option>
			  			<option value="3"  ${kjscxPage.pageZc1 == '3'? 'selected' : '' }>3周</option>
			  			<option value="4"  ${kjscxPage.pageZc1 == '4'? 'selected' : '' }>4周</option>
			  			<option value="5"  ${kjscxPage.pageZc1 == '5'? 'selected' : '' }>5周</option>
			  			<option value="6"  ${kjscxPage.pageZc1 == '6'? 'selected' : '' }>6周</option>
			  			<option value="7"  ${kjscxPage.pageZc1 == '7'? 'selected' : '' }>7周</option>
			  			<option value="8"  ${kjscxPage.pageZc1 == '8'? 'selected' : '' }>8周</option>
			  			<option value="9"  ${kjscxPage.pageZc1 == '9'? 'selected' : '' }>9周</option>
			  			<option value="10"  ${kjscxPage.pageZc1 == '10'? 'selected' : '' }>10周</option>
			  			<option value="11"  ${kjscxPage.pageZc1 == '11'? 'selected' : '' }>11周</option>
			  			<option value="12"  ${kjscxPage.pageZc1 == '12'? 'selected' : '' }>12周</option>
			  			<option value="13"  ${kjscxPage.pageZc1 == '13'? 'selected' : '' }>13周</option>
			  			<option value="14"  ${kjscxPage.pageZc1 == '14'? 'selected' : '' }>14周</option>
			  			<option value="15"  ${kjscxPage.pageZc1 == '15'? 'selected' : '' }>15周</option>
			  			<option value="16"  ${kjscxPage.pageZc1 == '16'? 'selected' : '' }>16周</option>
			  			<option value="17"  ${kjscxPage.pageZc1 == '17'? 'selected' : '' }>17周</option>
			  			<option value="18"  ${kjscxPage.pageZc1 == '18'? 'selected' : '' }>18周</option>
               	</select>－                      
				 <select name="pageZc2" id="pageZc2" class="ZC_CON" style="width:100px !important;">
				 	<option value="">-请选择-</option>
			  			<option value="1"  ${kjscxPage.pageZc1 == '1'? 'selected' : '' }>1周</option>
			  			<option value="2"  ${kjscxPage.pageZc1 == '2'? 'selected' : '' }>2周</option>
			  			<option value="3"  ${kjscxPage.pageZc1 == '3'? 'selected' : '' }>3周</option>
			  			<option value="4"  ${kjscxPage.pageZc1 == '4'? 'selected' : '' }>4周</option>
			  			<option value="5"  ${kjscxPage.pageZc1 == '5'? 'selected' : '' }>5周</option>
			  			<option value="6"  ${kjscxPage.pageZc1 == '6'? 'selected' : '' }>6周</option>
			  			<option value="7"  ${kjscxPage.pageZc1 == '7'? 'selected' : '' }>7周</option>
			  			<option value="8"  ${kjscxPage.pageZc1 == '8'? 'selected' : '' }>8周</option>
			  			<option value="9"  ${kjscxPage.pageZc1 == '9'? 'selected' : '' }>9周</option>
			  			<option value="10"  ${kjscxPage.pageZc1 == '10'? 'selected' : '' }>10周</option>
			  			<option value="11"  ${kjscxPage.pageZc1 == '11'? 'selected' : '' }>11周</option>
			  			<option value="12"  ${kjscxPage.pageZc1 == '12'? 'selected' : '' }>12周</option>
			  			<option value="13"  ${kjscxPage.pageZc1 == '13'? 'selected' : '' }>13周</option>
			  			<option value="14"  ${kjscxPage.pageZc1 == '14'? 'selected' : '' }>14周</option>
			  			<option value="15"  ${kjscxPage.pageZc1 == '15'? 'selected' : '' }>15周</option>
			  			<option value="16"  ${kjscxPage.pageZc1 == '16'? 'selected' : '' }>16周</option>
			  			<option value="17"  ${kjscxPage.pageZc1 == '17'? 'selected' : '' }>17周</option>
			  			<option value="18"  ${kjscxPage.pageZc1 == '18'? 'selected' : '' }>18周</option>
               	</select> 
	           	</td>
		      </tr>
		       <tr>
		        <th>校区：</th>
	           	<td>
	           	  <select name="pageXiaoqu" onchange="changeXq()"  id="pageXiaoqu" class="XIAOQU_CON">
				 	<option value="">-全部-</option>
               		<c:forEach items="${xiaoquList}" var="obj" >
			  			<option value="${obj.DM}" ${kjscxPage.pageXiaoqu == obj.DM ? 'selected' : '' }>${obj.MC}</option>
			  		</c:forEach>
                 </select>
	           	</td>
		      </tr>
		       <tr>
		        <th>楼号：</th>
	           	<td>
	           	  <select name="pageLhdm" onchange="changeLh()" id="pageLhdm" class="LH_CON">
				 	<option value="">-全部-</option>
               		<c:forEach items="${lhList}" var="obj" >
			  			<option value="${obj.DM}" ${kjscxPage.pageLhdm == obj.DM ? 'selected' : '' }>${obj.MC}</option>
			  		</c:forEach>
                </select>
	           	</td>
      		</tr>
      		<tr>
		        <th>场地：</th>
	           	<td>
	           	  <select name="pageCddm"  id="pageCddm" class="CD_CON">
				 	<option value="">-全部-</option>
               		<c:forEach items="${cdList}" var="obj" >
			  			<option value="${obj.DM}" ${kjscxPage.pageCddm == obj.DM ? 'selected' : '' }>${obj.MC}</option>
			  		</c:forEach>
               	  </select>
	           	</td>
      		</tr>
      	</table> 
	    <div class="divider"></div>
        <div class="clr"></div>
        <div class="addlist_button pull-right mr10"> <a href="javascript:void(0);" onclick="javascript:queryLike();return false;"><span>确定</span></a> </div>
	   </div>
	</div>
    </form>     
   </div>        
      
    </div>
    <div class="clr"></div>
    <div class="list" style="overflow:auto"> 
           <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="bot_line">
              <tr>
                 <th width="10">　</th>
                 <th colspan="${fn:length(jcList)}" style="text-align:center">星期一</th>
                 <th colspan="${fn:length(jcList)}" style="text-align:center">星期二</th>
                 <th colspan="${fn:length(jcList)}" style="text-align:center">星期三</th>
                 <th colspan="${fn:length(jcList)}" style="text-align:center">星期四</th>
                 <th colspan="${fn:length(jcList)}" style="text-align:center">星期五</th>
                 <th colspan="${fn:length(jcList)}" style="text-align:center">星期六</th>
                 <th colspan="${fn:length(jcList)}" style="text-align:center">星期日</th>
               </tr>
               
              <tr> 
                <c:if test="${fn:length(kjsList) ne '0'}">
                  <th style="white-space:nowrap; ">场地</th>
                </c:if>
                  
                <c:forEach var="s" begin="1" end="7" step="1">
                <c:forEach items="${jcList}" var="obj" >
	         <th style="white-space:nowrap; "> ${obj.JCMC} </th>
	         </c:forEach>
	         </c:forEach>
			</tr>
         
           <c:forEach items="${kjsList}" varStatus="s" var="obj">
		    <tr>
		        <td style="white-space:nowrap; ">${obj.MC} </td>
			    <c:forEach var="xingqi" begin="1" end="7" step="1">  
					<c:forEach items="${jcList}" var="jc" varStatus="ss">
				      	<td>
				      	 <c:set var="val" value="${'XQ'}${xingqi}${'_'}${ss.index+1}"></c:set>
				      	 	<span class='<c:out value="${obj[val] > \'0\' ? \'glyphicon glyphicon-flag\' : \'\' }"/>' ></span>
				      	</td>
				 	</c:forEach>
				</c:forEach>
		    </tr>
   		  </c:forEach>
       </table>
    </div>
    <div class="youtube"> 
        <c:if test="${not empty kjsList }">
            <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="kjscxPage"  showListNo="true" action="kjscx/queryKjs_wdl" />
        </c:if>
    </div>
    <div class="clr"></div>
  </div>
</div>

<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
<div id="setting"> </div>
</body>
</html>


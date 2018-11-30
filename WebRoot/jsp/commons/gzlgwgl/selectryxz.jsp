<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ff" uri="fenYeListNo"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>北京赢科后台管理系统</title>
        <jsp:include page="../../include/css-main-include.jsp"></jsp:include>
        <script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
        <script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
        <script type="text/javascript" src="<%=path%>/resources/js/common/validator.js" ></script>
        <script type="text/javascript" src="<%=path%>/resources/js/common/jquery.min.js" ></script>
        <script type="text/javascript" src="<%=path%>/resources/js/common/jqcheckBox.js"></script>
        <script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery.form.2.36.js"></script>
        <style type="text/css">
            html, body { height:100%; 
            }
            .Contentbox { width:100%; min-height:100%;height:auto }
            *html .Contentbox { height:100% }

        </style>

        <script type="text/javascript">

            //刷新
            function queryLike() {
                document.queryform.action = "<%=request.getContextPath()%>/gzlgwgl/queryRyxz";
                document.queryform.submit();
            }
            // 选择课程
            function xzkc(kcdm, kcmc) {
                var stuHtml = $('#stu_' + kcdm, window.parent.document).html();
                if (stuHtml == null || stuHtml == "") {
                    var list = $("#kcdmlist", window.parent.document).val();
                    if (list.length > 0) {
                        list = list + "," + kcdm;
                        $("#kcdmlist", window.parent.document).val(list);
                    } else {
                        $("#kcdmlist", window.parent.document).val(kcdm);
                    }
                    var xmlist = $("#stuDiv", window.parent.document).html();
                    $("#stuDiv", parent.document).
                            html(xmlist + "<div class='Floatleft mb5 mr5' id='stu_" + kcdm + "'><span  class='tag'><span>" + kcmc + "</span><a id='span_" + kcdm + "' onclick='onDelXzxs(\"" + kcdm + "\");'>X</a></span></div>");
                }
            }

            function bcs() {
          	  if (isCheck('ids') == false) {
                    alert("请选择要添加的课程");
                    return;
                }
                if (confirm("您确定要添加选中的课程吗？") == true) {
                	 var s=[];
               	   
                	  $('input[name="ids"]:checked').each(function(){
                	 s.push($(this).val());
                	 });
                	 var id="";
                	 for( var y=0;y<s.length;y++){
                	
               	 if(y==(s.length-1)){
               	 id=id+s[y];
               	 }else{
               	 id=id+s[y]+",";
               	 }
               	
               	 }
                	
                	
                	 return id;
                }
              
          }   
            
           
            function xkkcrw(kcdm) {
//             	window.parent.addXktz(kcdm);
            	window.parent.addXktz(kcdm); 
            }
            
            function resultjsgl(yhdm,xm){
            	window.parent.addYh(yhdm,xm); 
            }
            
        </script>
        <style >
            .bot_line tr{cursor: pointer;}
        </style>
    </head>
    <body>
         <form id="queryform" name="queryform" method="post">
        <table  border="0" align="right" cellpadding="0" cellspacing="0"  >
          <tr>

            <td><input type="text" class="form-control pull-left" name="xh" id="xh" value="${page.xh}"  placeholder="用户代码/用户姓名" style="width:300px !important;"/></td>
            <td>
             <button class="btn btn-search" type="button" onclick="javascript:queryLike();">搜 索</button>  
            </td>
          </tr>
        </table>  
        </form> 
        <div class="clr"></div>
        <form name="ff" method="post" id="ff" >
            <div class="list">
                <table class="bot_line" width="100%"  cellpadding="0" cellspacing="0">
                    <tr>  
                          <th>选择</th>         
                        <th>用户代码</th>
                        <th>姓名</th>     
                                        
                    </tr>
                    <c:forEach items="${list}" var="map" varStatus="i">
                        <tr <c:if test="${status.count % 2 eq '0'}">class="bgcol"</c:if>>
                            <td><a class="btns btn-info" href="javascript:void(0);" onclick='javascript:resultjsgl("${map.YHDM}","${map.XM}")';>选择</a></td>
                            <td>${map.YHDM}</td>
                            <td>${map.XM}</td>
                           
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </form>
        <c:if test="${not empty list}">
            <div  class="youtube01">
                <c:if test="${not empty page }">
                    <ff:page mhFrom="queryform" showReSize="true" listPageCount="10" field="page" onlyOneShow="false" showListNo="false" action="gzlgwgl/queryRyxz"/>
                </c:if>
            </div>
        </c:if>

        <div class="clr"></div>
    </body>
</html>
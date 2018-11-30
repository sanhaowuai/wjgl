<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String syym=(String)session.getAttribute("syym");
%>
<script type="text/javascript">
var path = '<%=path%>';
</script>
<% if(syym.equals("commons/main/main_08")){ %>
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueEight/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueEight/css/dripicon.css"> 
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueEight/css/font-awesome.min93e3.css"> 
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueEight/css/skin-select.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueEight/css/tooltipster.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueEight/css/css.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueEight/css/tooltipster.css">

<link href="<%=path%>/resources/style/blueEight/css/top.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blueEight/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blueEight/css/left.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blueEight/css/content.css" rel="stylesheet" type="text/css" />
<%--<link href="<%=path%>/resources/style/blueTwo/css/contents.css" rel="stylesheet" type="text/css" />--%>
<link href="<%=path%>/resources/style/blueEight/css/pageTag.css" rel="stylesheet" type="text/css" />
<%--<link href="<%=path%>/resources/style/skin/colorFh.css" rel="stylesheet" type="text/css" />--%>
<link href="<%=path%>/resources/style/blueEight/css/zTreeStyle.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueEight/css/jscrollpane1.css">
<%-- <link href="<%=path%>/resources/style/blue/css/styleTwo.css" rel="stylesheet" type="text/css" /> --%>

<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/test08.js"></script>
<% } %>
<%--========================================================= --%>
<% if(syym.equals("commons/main/main_01")){ %>
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueTwo/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueTwo/css/dripicon.css"> 
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueTwo/css/font-awesome.min93e3.css"> 
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueTwo/css/skin-select.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueTwo/css/tooltipster.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueTwo/css/css.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueTwo/css/tooltipster.css">

<link href="<%=path%>/resources/style/blueTwo/css/top.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blueTwo/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blueTwo/css/left.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blueTwo/css/content.css" rel="stylesheet" type="text/css" />
<%--<link href="<%=path%>/resources/style/blueTwo/css/contents.css" rel="stylesheet" type="text/css" />--%>
<link href="<%=path%>/resources/style/blueTwo/css/pageTag.css" rel="stylesheet" type="text/css" />
<%--<link href="<%=path%>/resources/style/skin/colorFh.css" rel="stylesheet" type="text/css" />--%>
<link href="<%=path%>/resources/style/blueTwo/css/zTreeStyle.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueTwo/css/jscrollpane1.css">
<%-- <link href="<%=path%>/resources/style/blue/css/styleTwo.css" rel="stylesheet" type="text/css" /> --%>

<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/test.js"></script>
<% } %>
<%--========================================================= --%>
<%--========================================================= --%>
<% if(syym.equals("commons/main/main_12")){ %>
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueTwo_12/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueTwo_12/css/dripicon.css"> 
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueTwo_12/css/font-awesome.min93e3.css"> 
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueTwo_12/css/skin-select.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueTwo_12/css/tooltipster.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueTwo_12/css/css.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueTwo_12/css/tooltipster.css">

<link href="<%=path%>/resources/style/blueTwo_12/css/top.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blueTwo_12/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blueTwo_12/css/left.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blueTwo_12/css/content.css" rel="stylesheet" type="text/css" />
<%--<link href="<%=path%>/resources/style/blueTwo_12/css/contents.css" rel="stylesheet" type="text/css" />--%>
<link href="<%=path%>/resources/style/blueTwo_12/css/pageTag.css" rel="stylesheet" type="text/css" />
<%--<link href="<%=path%>/resources/style/skin/colorFh.css" rel="stylesheet" type="text/css" />--%>
<link href="<%=path%>/resources/style/blueTwo_12/css/zTreeStyle.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueTwo_12/css/jscrollpane1.css">
<%-- <link href="<%=path%>/resources/style/blue/css/styleTwo.css" rel="stylesheet" type="text/css" /> --%>

<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/test.js"></script>
<% } %>
<%--========================================================= --%>
<%--========================================================= --%>
<% if(syym.equals("commons/main/main_11")){ %>
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueTwo11/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueTwo11/css/dripicon.css"> 
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueTwo11/css/font-awesome.min93e3.css"> 
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueTwo11/css/skin-select.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueTwo11/css/tooltipster.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueTwo11/css/css.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueTwo11/css/tooltipster.css">

<link href="<%=path%>/resources/style/blueTwo11/css/top.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blueTwo11/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blueTwo11/css/left.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blueTwo11/css/content.css" rel="stylesheet" type="text/css" />
<%--<link href="<%=path%>/resources/style/blueTwo11/css/contents.css" rel="stylesheet" type="text/css" />--%>
<link href="<%=path%>/resources/style/blueTwo11/css/pageTag.css" rel="stylesheet" type="text/css" />
<%--<link href="<%=path%>/resources/style/skin/colorFh.css" rel="stylesheet" type="text/css" />--%>
<link href="<%=path%>/resources/style/blueTwo11/css/zTreeStyle.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueTwo11/css/jscrollpane1.css">
<%-- <link href="<%=path%>/resources/style/blue/css/styleTwo.css" rel="stylesheet" type="text/css" /> --%>

<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/test.js"></script>
<% } %>
<%--========================================================= --%>
<% if(syym.equals("commons/main/main_07")){ %>
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueEight/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueEight/css/dripicon.css"> 
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueEight/css/font-awesome.min93e3.css"> 
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueEight/css/skin-select.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueEight/css/tooltipster.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueEight/css/css.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueEight/css/tooltipster.css">

<link href="<%=path%>/resources/style/blueEight/css/top.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blueEight/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blueEight/css/left.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blueEight/css/content.css" rel="stylesheet" type="text/css" />
<%--<link href="<%=path%>/resources/style/blueTwo/css/contents.css" rel="stylesheet" type="text/css" />--%>
<link href="<%=path%>/resources/style/blueEight/css/pageTag.css" rel="stylesheet" type="text/css" />
<%--<link href="<%=path%>/resources/style/skin/colorFh.css" rel="stylesheet" type="text/css" />--%>
<link href="<%=path%>/resources/style/blueEight/css/zTreeStyle.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blueEight/css/jscrollpane1.css">
<%-- <link href="<%=path%>/resources/style/blue/css/styleTwo.css" rel="stylesheet" type="text/css" /> --%>

<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/test.js"></script>
<% } %>
<% if(syym.equals("commons/main/main_09")){ %>
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/touming/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/touming/css/dripicon.css"> 
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/touming/css/font-awesome.min93e3.css"> 
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/touming/css/skin-select.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/touming/css/tooltipster.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/touming/css/css.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/touming/css/tooltipster.css">

<link href="<%=path%>/resources/style/touming/css/top.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/touming/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/touming/css/left.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/touming/css/content.css" rel="stylesheet" type="text/css" />
<%--<link href="<%=path%>/resources/style/blueTwo/css/contents.css" rel="stylesheet" type="text/css" />--%>
<link href="<%=path%>/resources/style/touming/css/pageTag.css" rel="stylesheet" type="text/css" />
<%--<link href="<%=path%>/resources/style/skin/colorFh.css" rel="stylesheet" type="text/css" />--%>
<link href="<%=path%>/resources/style/touming/css/zTreeStyle.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/touming/css/jscrollpane1.css">
<%-- <link href="<%=path%>/resources/style/blue/css/styleTwo.css" rel="stylesheet" type="text/css" /> --%>

<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/test.js"></script>
<% } %>
<% if(syym.equals("commons/main/main_00")){ %>
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blue/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blue/css/dripicon.css"> 
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blue/css/font-awesome.min93e3.css"> 
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blue/css/skin-select.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blue/css/tooltipster.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blue/css/css.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blue/css/tooltipster.css">

<link href="<%=path%>/resources/style/blue/css/top.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blue/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blue/css/left.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/style/blue/css/content.css" rel="stylesheet" type="text/css" />
<%--<link href="<%=path%>/resources/style/blueTwo/css/contents.css" rel="stylesheet" type="text/css" />--%>
<link href="<%=path%>/resources/style/blue/css/pageTag.css" rel="stylesheet" type="text/css" />
<%--<link href="<%=path%>/resources/style/skin/colorFh.css" rel="stylesheet" type="text/css" />--%>
<link href="<%=path%>/resources/style/blue/css/zTreeStyle.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="<%=path%>/resources/style/blue/css/jscrollpane1.css">
<%-- <link href="<%=path%>/resources/style/blue/css/styleTwo.css" rel="stylesheet" type="text/css" /> --%>

<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/test.js"></script>
<% } %>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:include page="../../include/css-main-include.jsp"></jsp:include>
<html>
<head>
<script>
function none()
{
alert("您还没有选题！");
window.top.location.href="<%=request.getContextPath()+"/main"%>";
}
</script>
</head>
<body onLoad="none()"> 
<div class="Contentbox">
	<div class="mainbg"></div>
	<table width="100%">
		<tr>
			<td align="center" valign="middle" style="padding-top:50px" class="welcome_bg">
				 
			</td>
        </tr>
    </table>
    <div class="clr"></div>
</div>
</body>
</html>
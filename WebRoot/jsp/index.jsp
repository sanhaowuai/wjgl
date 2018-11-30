<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.incon.framework.util.RSAUserUtil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String inconqxdm = request.getParameter("inconqxdm")==null?"":"?inconqxdm="+request.getParameter("inconqxdm");
//session 中获取rsa对象
Map<String,String> rsa = (Map)session.getAttribute(RSAUserUtil.RSA_SESSION);
if(rsa==null) {
//     //创建RSA
     RSAUserUtil.createKeyToSession(session,request,response);	
     rsa = (Map)session.getAttribute(RSAUserUtil.RSA_SESSION);
}
%>

<!-- 程序版本号变量，每次升级请修改此变量，格式为：“yyMMdd-小版本号”，例如：“170302-1”表示17年3月2日第1次修改升级 -->
<c:set value="170302-1" var="version"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9;IE=8;"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${applicationScope.XT_CSB_TITLE.CS1} - 用户登录</title>
<jsp:include page="include/css-login-include.jsp"></jsp:include>
<script src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js" type="text/javascript" ></script>
<script src="<%=path%>/resources/js/common/security.js" type="text/javascript" ></script>
<!-- RSA公钥 -->
<script type="text/javascript">
 var key=new RSAUtils.getKeyPair('<%=rsa.get(RSAUserUtil.CLIENT_RSA_EXPONENT)%>', "", '<%=rsa.get(RSAUserUtil.CLIENT_RSA_MODULUS)%>');
</script>

<script type="text/javascript">
//登录
function login(){
    if(!onChkLogin()){
        return false;
    }	
	var rsaUsercode = RSAUtils.encryptedString(key,$("#usercode").val());
	var rsaPassword = RSAUtils.encryptedString(key,$("#password").val());
	var code = $("#code").val();	
	$("#sub_usercode").val(rsaUsercode);
	$("#sub_password").val(rsaPassword);
	$("#sub_code").val(code);
	document.subForm.action = "<%=path%>/login<%=inconqxdm%>";
    document.subForm.submit();
}

//enter登录
document.onkeyup = function(event){
	e = event ? event : (window.event ? window.event : null);
	if(e.keyCode == 13){
		login();
	}
}
function onChkLogin(){
    if ($("#usercode").val() == "" ){
        alert ("请输入用户名!");
        $("#usercode").focus();
        return false;
    }
    if ($("#password").val() == "" ){
        alert ("请输入密码!");
        $("#password").focus();
        return false;
    }
    if ($("#code").val() == "" ){
        alert ("请输入验证码!");
        $("#code").focus();
        return false;
    }
    return true;
}


function changeValidateCode(obj) {
  		//每次请求需要一个不同的参数，否则可能会返回同样的验证码
	//这和浏览器的缓存机制有关系，也可以把页面设置为不缓存，这样就不用这个参数了。
	obj.src="<%=request.getContextPath() %>/captchaImage?id="+Math.round(Math.random()*10000);
}

function changeValidateCode() {
	//每次请求需要一个不同的参数，否则可能会返回同样的验证码
//这和浏览器的缓存机制有关系，也可以把页面设置为不缓存，这样就不用这个参数了。
document.getElementById("yzmmsg").src="<%=request.getContextPath() %>/captchaImage?id="+Math.round(Math.random()*10000);
}
</script>
</head>

<body>
<form name="subForm" id="subForm" method="post">
   <input name="usercode" id="sub_usercode" type="hidden"/>
   <input name="password" id="sub_password" type="hidden"/>
   <input name="code" id="sub_code" type="hidden"/>
</form>
<div id="wrap">
      <div class="row">
        <div id="content" class="col-md-12 full-page login">


          <div class="inside-block">
          	<div class="login_warp">
	            <img src="<%=path%>/resources/style/blue/images/logo1.png" class="logos" width="60">
	            <hr class="login_hr"></hr>
	            <h1>${applicationScope.XT_CSB_TITLE.CS1}</h1>
	            <h5>Login to your account</h5>
	
	            <form name="queryform" id="queryform" method="post" class="form-signin form_login">
	              <section>
	              	<c:if test="${not empty msg}">
	              	<div class="input-group">
	              		<div class="input-group-addon"><span style="color: red;">${msg}</span></div>
	              	</div>
	              	</c:if>
	                <div class="input-group">
	                  <input name="usercode" type="text" id="usercode" placeholder="用户名">
	                  <div class="input-group-addon"><i class="glyphicon glyphicon-user"></i></div>
	                </div>
	                <div class="input-group">
	                  <input name="password" type="password" id="password" maxlength="50" placeholder="密码">
	                  <div class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></div>
	                </div>
	                <div class="input-group">
	                  <input name="code" type="text" id="code" placeholder="验证码">
	                  <div class="input-group-addon"><i><img id="yzmmsg" src="<%=request.getContextPath() %>/captchaImage"  onclick="changeValidateCode();" width="70" height="24" alt="点击图片更换验证码"/></i></div>
	                </div>
	              </section>
	
	              <section class="log-in">
	                <a class="btns btn-pink" id="sub" onclick="javascript:login();">登&nbsp;&nbsp;录</a>
	              </section>
	            </form>
            </div>
            
            <div class="login_footer"> 
            	版权所有·北京赢科天地电子有限公司    京公网安备110108 007405号 
            	<br/>
            	V3.2-${version}（${applicationScope.XT_CSB_DBVERSION.CS1}）
            </div>
          </div>


        </div>
      </div>
</div>

</body>
</html>


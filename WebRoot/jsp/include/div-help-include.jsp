<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" src="<%=path%>/resources/js/common/modalpopup.js"></script>
<script type="text/javascript">
function cha(qxdm){
	$('#help_iff').attr('src','<%=path%>/helpgl/queryHelpglListXsg?qxdm='+qxdm);
	BOX_show('help_cxdiv');
}
</script>
<div id="help_cxdiv" style="display:none; width: 800px;border: 6px solid #ddd;-webkit-box-shadow: 0px 0px 5px #000;-moz-box-shadow: 0px 0px 5px #000;box-shadow: 0px 0px 5px #000;-webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;" >
  <div class="popup">
    <div class="Floatleft Pct100 mb10">
      <div class="popup_left">帮助</div>
      <a href="#" class="btn_close" onclick="javascript:BOX_remove('help_cxdiv');"></a>
    </div>
    <div class="clr"></div>
    <div class="Floatleft Pct100 ">
	  <iframe id="help_iff" name="iff" src="" border="0" framespacing="0" marginheight="0" marginwidth="0" style="width: 100%; height: 400px;" frameborder="0" allowTransparency="true"></iframe>
    </div>
    <div class="clr"></div>
  </div>
</div>
<div id="setting"> </div>

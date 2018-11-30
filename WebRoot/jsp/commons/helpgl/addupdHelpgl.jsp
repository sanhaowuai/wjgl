<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
<title>帮助</title>
<jsp:include page="../../include/css-main-include.jsp"></jsp:include>
<script type="text/javascript" src="<%=path%>/resources/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery-easyui-1.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/resources/js/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	//表单加载完成之后给文本编辑器赋值
		$('#biaodan').form({
			onLoadSuccess:function(){
			$("input[id^='jscheck']").removeAttr('checked');
				var c=$('#nr').val();
			    nrIframe.setHTML(c);
				var jsdms=$('#jsdms').val();
				var zuzu=jsdms.split(',');
				 
				if(zuzu!=null && zuzu.length>0){
				 
					for(var i=0;i<zuzu.length;i++){
					 
						$('#jscheck'+zuzu[i]).attr('checked','checked');
					}

				}
			}
		});
	})
	
		//关闭本页
		function cancel(){	  		
	  		if(confirm("您确定要关闭本页吗？")){
				window.opener = null;
				window.open('', '_self');
				window.close() 
			}
		}
		//删除一个帮助
		function delHelpgl(){
			if(confirm("是否要删除本条帮助？")){
				var a=$('#bzid').val();
				var b=$('#qxdm').val();
				if(a==''){
					alert("请选择");
				}else{
					location.href='<%=path%>/helpgl/delHelpgl?bzid='+a+'&qxdm='+b;
				}
			}
		}
		//增加或修改
		function addupd(){
			$("#nr").val(nrIframe.getHTML());
			var zhuang=$('#zhuangtai').val();
			if($('#mc').val()==''){
					alert("请填写完整");
					
			}else{
				document.biaodan.action='<%=path%>/helpgl/addupdHelpgl';
				document.biaodan.submit();
			}
		
		
		}
		//查询一个帮助
		function chaxun(id){
		    nrIframe.setHTML("");
			$('#zhuangtai').val('2');
			var url="<%=path%>/helpgl/queryHelpglOne?bzid="+id;
			$('#biaodan').form('load',url);
		}
		//点击添加按钮，清空
		function tianjia(){
			$('#zhuangtai').val('1');
			$('#bzid').val('');
			$("input[id^='jscheck']").removeAttr('checked');
			$('#mc').val('');
			$('#kyf').val('1');
			$('#xh').val('');
		    nrIframe.setHTML("");
		}
	</script>
	
  </head>
	<body>
<div class="Contentbox" style="margin-top:10px">	
    <table width="100%"  cellpadding="0" cellspacing="0">
	    <tr>
	      <td valign="top"  width="210px" >
			<div id="leftmenu" class="mt10" style="margin-top:5px">
			<div class="lefttop" style="width:200px;">${oneqx.qxmc}</div>
				<ul>
					<c:forEach items="${listbz}" var="b">
						  <li><a href="javascript:chaxun('${b.bzid }')">${b.mc }</a></li>
					</c:forEach>
				</ul>
			</div>	      
	      </td>
	      <td valign="top">
	      <form id="biaodan" name="biaodan" method="post">
	      <input type="hidden" id="jsdms" name="jsdms" />
		  <div class="pl10 pr10">
		   <div class="butsea">
            <table  border="0" align="left" cellpadding="0" cellspacing="0"  >
                <tr>
                    <td height="35px"> 
                    <div class="addlist_button"> <a href="javascript:void(0)" onclick="tianjia()"><span>添&nbsp;&nbsp;加</span></a> </div>
                        <div class="addlist_button ml15"> <a href="javascript:void(0)" onclick="addupd()"><span>保&nbsp;&nbsp;存</span></a> </div>
                        <div class="addlist_button  ml15"> <a href="javascript:void(0)" onclick="delHelpgl()"><span>删&nbsp;&nbsp;除</span></a> </div>
                        <div class="addlist_button  ml15"> <a href="javascript:void(0)" onclick="javascript:cancel();"><span>取&nbsp;&nbsp;消</span></a> </div>
                     </td>
                </tr>
            </table>
            <table  border="0" align="right" cellpadding="0" cellspacing="0"  >
                <tr>
                	<c:forEach items="${jslist}" var="j">
                		<td><input type="checkbox" id="jscheck${j.JSDM }" value="${j.JSDM }" name="jsdmss"/>${j.JSMC } </td> 
                	</c:forEach>
                    <td height="35px">名称：</td>
                    <td><input type="text" id="mc" name="mc"/> </td> 
                    <td>可用否：</td>
                    <td>           
                     <select id="kyf" name="kyf"  style="width:100px;" >
		              <option value="1">可用</option>
		              <option value="0">不可用</option>
		             </select>
                    </td>
                    <td>显示序号：</td>
                    <td><input type="text" id="xh" name="xh"/></td>                    
                </tr>
            </table>		   
		   </div>
		   <div class="clr"></div>
		   
		  <input type="hidden" id="bzid" name="bzid"/>
          <input type="hidden" id="qxdm" name="qxdm" value="${oneqx.qxdm}"/>
             <table width="100%"  cellpadding="0" cellspacing="0" style="border-collapse:collapse" class="mt10" >
              <tr>
	              <td>
	              	<textarea name="nr" id="nr" style="display:none"></textarea>
                    <iframe id="nrIframe" name="nrIframe" src="<%=path%>/resources/ewebeditor/ewebeditor.htm?id=nr&style=standard650" frameborder="0" scrolling="no" width="1000" height="450"></iframe>
                    <input id="zhuangtai" name="zt" value="${zhuangtai}" type="hidden"/>
	              </td>
              </tr>
              </table>
		  
		   <div class="clr"></div>
		  </div>
	 	 </form>
	      </td>
	    </tr>
    </table>
</div>


	


	</body>
</html>

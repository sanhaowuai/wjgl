<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 


<!--
        * 
        * 
        * @作者 
        * @创建时间 2017-03-20 09:44:04
        *
-->
<!DOCTYPE html>
<html>
<head>
<title>选择 - ${title}</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=8,9,10" />
<script type="text/javascript">
    //呈现顶端遮罩
    if (top.showMask) top.showMask();
    //<!-- 面向对象类型[1教师、2学生、3角色、4群组、5教研室、6教师院系、7学生院系、8全部院系、9学生年级、10学生专业 、11学生班级] -->
	var mxdxlxArray=[
	                 {mxdxlx:1,mxdxlxmc:'教师'}
	                 ,{mxdxlx:2,mxdxlxmc:'学生'}
	                 ,{mxdxlx:3,mxdxlxmc:'角色'}
	                 ,{mxdxlx:4,mxdxlxmc:'群组'}
	                 ,{mxdxlx:5,mxdxlxmc:'教研室'}
	                 ,{mxdxlx:6,mxdxlxmc:'教师院系'}
	                 ,{mxdxlx:7,mxdxlxmc:'学生院系'}
	                 ,{mxdxlx:8,mxdxlxmc:'全部院系'}
	                 ,{mxdxlx:9,mxdxlxmc:'学生年级'}
	                 ,{mxdxlx:10,mxdxlxmc:'学生专业'}
	                 ,{mxdxlx:11,mxdxlxmc:'学生班级'}];
</script>
</head>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/pub/pubChoose/themes/default/base.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/pub/pubChoose/plugins/jquery-easyui-1.3.1/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/pub/pubChoose/plugins/jquery-easyui-1.3.1/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/pub/pubChoose/themes/default/bootstrap.css" ></link>  
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/pub/pubChoose/themes/default/chosen.css" ></link>  
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/pub/pubChoose/themes/default/bootstrapSwitch.css" ></link>  
<body class="easyui-layout" style="visibility: hidden">
<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/pub/pubChoose/scripts/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/pub/pubChoose/plugins/jquery-easyui-1.3.1/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/pub/pubChoose/plugins/jquery-easyui-1.3.1/datagrid-detailview.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/pub/pubChoose/plugins/jquery-easyui-1.3.1/locale/easyui-lang-zh_CN.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/pub/pubChoose/scripts/jquery-domain.min.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/pub/pubChoose/scripts/chosen.jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/pub/pubChoose/scripts/bootstrap.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/pub/pubChoose/scripts/bootstrapSwitch.js"></script> 
<style>
.nav{padding:10px 10px 0px 10px; background:#f6f6f6; margin:0px}
 
</style>
<div data-options="region:'north',border:false" style="scroll: no; padding: 0px; height: 48px">
	<ul id="myTab" class="nav nav-tabs">
		<!-- 面向对象类型[1教师、2学生、3角色、4群组、5教研室、6教师院系、7学生院系、8全部院系、9学生年级、10学生专业 、11学生班级] -->
		<li class="" id="li_1"><a href="#" onclick="openTable(1);" data-toggle="tab">&nbsp;教师 </a></li>
		<li class="" id="li_2"><a href="#" onclick="openTable(2);" data-toggle="tab">&nbsp;学生</a></li>
		<li class="" id="li_3"><a href="#" onclick="openTable(3);" data-toggle="tab">&nbsp;角色 </a></li>
		<li class="" id="li_4"><a href="#" onclick="openTable(4);" data-toggle="tab">&nbsp;群组</a></li>
		<li class="" id="li_5"><a href="#" onclick="openTable(5);" data-toggle="tab">&nbsp;教研室</a></li>
		<li class="" id="li_6"><a href="#" onclick="openTable(6);" data-toggle="tab">&nbsp;教师院系</a></li>
		<li class="" id="li_7"><a href="#" onclick="openTable(7);" data-toggle="tab">&nbsp;学生院系</a></li>
		<li class="" id="li_8"><a href="#" onclick="openTable(8);" data-toggle="tab">&nbsp;全部院系</a></li>
		<li class="" id="li_9"><a href="#" onclick="openTable(9);" data-toggle="tab">&nbsp;学生年级</a></li>
		<li class="" id="li_10"><a href="#" onclick="openTable(10);" data-toggle="tab">&nbsp;学生专业</a></li>
		<li class="" id="li_11"><a href="#" onclick="openTable(11);" data-toggle="tab">&nbsp;学生班级</a></li>
	</ul>
</div>

<div data-options="region:'center',border:false" style="padding: 0px;">
<form id="FormShumit" name="FormShumit">
	<input name="glb" type="hidden" value="${glb}"/>
	<input name="glzjm" type="hidden" value="${glzjm}"/>
	<input name="glzjz" type="hidden" value="${glzjz}"/>
	<input name="mxdxlx" type="hidden" id="FormShumit_mxdxlx"/>
	<input name="mxdxz" type="hidden" id="FormShumit_mxdxz"/>	
	<input name="mxdxxsz" type="hidden" id="FormShumit_mxdxxsz"/>	
 </form>
	<table width="96%" align="center" cellspacing="0" cellpadding="0" id="tbl1">
		<tr>
			<td>
			<div class="alert alert-info" style="height: 30px; margin-bottom: 15px ; font-size:14px">
				<img src="${pageContext.request.contextPath}/resources/pub/pubChoose/themes/img/man.gif" border="0" align="absbottom">
				<strong>选择教师</strong> 你能一次选取多个教师，操作完成后单击确定完成选取！ </div>
			</td>
		</tr>
		<tr>
			<td>
			<form id="form_tbl1" name="form_tbl1">
			<input name="glb" type="hidden" value="${glb}"/>
			<input name="glzjm" type="hidden" value="${glzjm}"/>
			<input name="glzjz" type="hidden" value="${glzjz}"/>
			<input name="mxdxlx" type="hidden" value="1"/>
			
			<table>
			<tr>
			<td>院系：</td>
			<td>
			<div class="input-append" style="width: 250px"> 					
				<select id="form_tbl1_glyx" name="glyx"></select>
			</div>	
			</td>
			<td>  教师姓名：<input type="text" name="xmordm">
			<a class="btn" href="#" onclick="loadData('form_tbl1','form_tbl1_dx','${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryJsxxbList?dx=A');" style="vertical-align: top" align="center">
			<i class="icon-search"></i>查询</button>
			</td>
			</tr>
			</table>
			</form>
			</td>
		</tr>
		<tr>
			<td>
			<table width="100%">
				<tr>
					<td width="45%" bgcolor="#f6f6f6"><strong>待选教师</strong></td>
					<td width="90px"></td>
					<td width="45%" bgcolor="#f6f6f6"><strong>已选教师</strong></td>
				</tr>
				<tr>
					<td valign="top">
					<div class="controls"  style="width: 100%; height: 280px" >
						<select multiple id="form_tbl1_dx" name="form_tbl1_dx"  ondblclick="choose('add','form_tbl1')"   style="width: 100%;  height: 280px"  > 
						</select> </div>
					</td>
					<td  align="center">
					<button  class="btn btn-success" onclick="choose('add','form_tbl1')" href="#">
					添加 -&gt;</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('del','form_tbl1')" href="#">
					&lt;- 删除</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('addAll','form_tbl1')" href="#">
					添加-&gt;&gt;</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('delAll','form_tbl1')" href="#">
					&lt;&lt;-删除</button>
					</td>
					<td>
					<div class="controls"  style="width: 100%; height: 280px">
						<select multiple id="form_tbl1_yx" name="form_tbl1_yx"  ondblclick="choose('del','form_tbl1')"   style="width: 100%;height: 280px"  > 
						</select> </div>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
	
	<table width="96%" align="center" cellspacing="0" cellpadding="0" id="tbl2">
		<tr>
			<td>
			<div class="alert alert-info" style="height: 30px; margin-bottom: 15px ; font-size:14px">
				<img src="${pageContext.request.contextPath}/resources/pub/pubChoose/themes/img/man.gif" border="0" align="absbottom">
				<strong>选择学生</strong> 你能一次选取多个学生，操作完成后单击确定完成选取！ </div>
			</td>
		</tr>
		<tr>
			<td>
			<form id="form_tbl2" name="form_tbl2">
			<input name="glb" type="hidden" value="${glb}"/>
			<input name="glzjm" type="hidden" value="${glzjm}"/>
			<input name="glzjz" type="hidden" value="${glzjz}"/>
			<input name="mxdxlx" type="hidden" value="2"/>
			<table>
			<tr>
			<td>院系：</td>
			<td>				
					<select id="form_tbl2_glyx" name="glyx"></select>
			</td>
  			<td>年级：</td>
 			<td>
 				<select id="form_tbl2_nj" name="nj" style="width: 100px;"></select>
 			</td>  											 
			<td>学生姓名：</td>
			<td><input type="text" name="xmordm"></td>
			<td>
			<a class="btn" href="#" onclick="loadData('form_tbl2','form_tbl2_dx','${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryXsxxbList?dx=A');" style="vertical-align: top" align="center">
			<i class="icon-search"></i>查询</button>
			</td>
			</tr></table>
			</form>
			</td>
		</tr>
		
		<tr>
			<td>
			<table width="100%">
				<tr>
					<td width="45%" bgcolor="#f6f6f6"><strong>待选学生</strong></td>
					<td width="90px"></td>
					<td width="45%" bgcolor="#f6f6f6"><strong>已选学生</strong></td>
				</tr>
				<tr>
					<td valign="top">
					<div class="controls"  style="width: 100%; height: 280px" >
						<select multiple id="form_tbl2_dx" name="form_tbl2_dx"  ondblclick="choose('add','form_tbl2')"   style="width: 100%; height: 280px"  > 
						</select> </div>
					</td>
					<td  align="center">
					<button  class="btn btn-success" onclick="choose('add','form_tbl2')" href="#">
					添加 -&gt;</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('del','form_tbl2')" href="#">
					&lt;- 删除</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('addAll','form_tbl2')" href="#">
					添加-&gt;&gt;</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('delAll','form_tbl2')" href="#">
					&lt;&lt;-删除</button></td>
					<td>
					<div class="controls"  style="width: 100%; height: 280px">
						<select multiple id="form_tbl2_yx" name="form_tbl2_yx"  ondblclick="choose('del','form_tbl2')"   style="width: 100%; height: 280px"  > 
						</select> </div>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>

	<table width="96%" align="center" cellspacing="0" cellpadding="0" id="tbl3">
		<tr>
			<td>
			<div class="alert alert-info" style="height: 30px; margin-bottom: 15px ; font-size:14px">
				<img src="${pageContext.request.contextPath}/resources/pub/pubChoose/themes/img/man.gif" border="0" align="absbottom">
				<strong>选择角色</strong> 你能一次选取多个角色，操作完成后单击确定完成选取！ </div>
			</td>
		</tr>
		<tr>
			<td>
			<form id="form_tbl3" name="form_tbl3">
			<input name="glb" type="hidden" value="${glb}"/>
			<input name="glzjm" type="hidden" value="${glzjm}"/>
			<input name="glzjz" type="hidden" value="${glzjz}"/>
			<input name="mxdxlx" type="hidden" value="3"/>
			<table><tr>
					<td>  
				 角色代码或名称：<input type="text" name="xmordm">
			<a class="btn" href="#" onclick="loadData('form_tbl3','form_tbl3_dx','${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryJuesxxbList?dx=A');" style="vertical-align: top" align="center">
			<i class="icon-search"></i>查询</button></td></tr></table>
			</form>
			</td>
		</tr>
		<tr>
			<td>
			<table width="100%">
				<tr>
					<td  width="45%" bgcolor="#f6f6f6"><strong>待选角色</strong></td>
					<td  width="90px"></td>
					<td  width="45%" bgcolor="#f6f6f6"><strong>已选角色</strong></td>
				</tr>
				<tr>
					<td valign="top">
					<div class="controls" style="width: 100%; height: 280px" >
						<select multiple id="form_tbl3_dx" name="form_tbl3_dx"  ondblclick="choose('add','form_tbl3')" style="width: 100%; height: 280px"  > 
						</select> </div>
					</td>
					<td   align="center">
					<button  class="btn btn-success" onclick="choose('add','form_tbl3')" href="#">
					添加 -&gt;</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('del','form_tbl3')" href="#">
					&lt;- 删除</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('addAll','form_tbl3')" href="#">
					添加-&gt;&gt;</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('delAll','form_tbl3')" href="#">
					&lt;&lt;-删除</button></td>
					<td>
					<div class="controls" style="width: 100%; height: 280px" >
						<select multiple id="form_tbl3_yx" name="form_tbl3_yx"  ondblclick="choose('del','form_tbl3')" style="width: 100%; height: 280px" > 
						</select> </div>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>	
	
	<table width="96%" align="center" cellspacing="0" cellpadding="0" id="tbl4">
		<tr>
			<td>
			<div class="alert alert-info" style="height: 30px; margin-bottom: 15px ; font-size:14px">
				<img src="${pageContext.request.contextPath}/resources/pub/pubChoose/themes/img/man.gif" border="0" align="absbottom">
				<strong>选择群组</strong> 你能一次选取多个群组，操作完成后单击确定完成选取！ </div>
			</td>
		</tr>
		<tr>
			<td>
			<form id="form_tbl4" name="form_tbl4">
			<input name="glb" type="hidden" value="${glb}"/>
			<input name="glzjm" type="hidden" value="${glzjm}"/>
			<input name="glzjz" type="hidden" value="${glzjz}"/>
			<input name="mxdxlx" type="hidden" value="4"/>
			</form>
			</td>
		</tr>
		
		<tr>
			<td>
			<table width="100%">
				<tr>
					<td  width="45%" bgcolor="#f6f6f6"><strong>待选群组</strong></td>
					<td  width="90px"></td>
					<td  width="45%" bgcolor="#f6f6f6"><strong>已选群组</strong></td>
				</tr>
				<tr>
					<td valign="top">
					<div class="controls" style="width: 100%; height: 280px" >
						<select multiple id="form_tbl4_dx" name="form_tbl4_dx"  ondblclick="choose('add','form_tbl4')" style="width: 100%; height: 280px" > 
						</select> </div>
					</td>
					<td   align="center">
					<button  class="btn btn-success" onclick="choose('add','form_tbl4')" href="#">
					添加 -&gt;</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('del','form_tbl4')" href="#">
					&lt;- 删除</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('addAll','form_tbl4')" href="#">
					添加-&gt;&gt;</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('delAll','form_tbl4')" href="#">
					&lt;&lt;-删除</button></td>
					<td>
					<div class="controls" style="width: 100%; height: 280px" >
						<select multiple id="form_tbl4_yx" name="form_tbl4_yx"  ondblclick="choose('del','form_tbl4')" style="width: 100%; height: 280px" > 
						</select> </div>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>



 	<table width="96%" align="center" cellspacing="0" cellpadding="0" id="tbl5">
		<tr>
			<td>
			<div class="alert alert-info" style="height: 30px; margin-bottom: 15px ; font-size:14px">
				<img src="${pageContext.request.contextPath}/resources/pub/pubChoose/themes/img/man.gif" border="0" align="absbottom">
				<strong>选择教研室</strong> 你能一次选取多个教研室，操作完成后单击确定完成选取！ </div>
			</td>
		</tr>
		<tr>
			<td>
			<form id="form_tbl5" name="form_tbl5">
			<input name="glb" type="hidden" value="${glb}"/>
			<input name="glzjm" type="hidden" value="${glzjm}"/>
			<input name="glzjz" type="hidden" value="${glzjz}"/>
			<input name="mxdxlx" type="hidden" value="5"/>
			<table><tr>
			<td>院系：</td><td><div class="input-append" style="width: 250px"> 					
					<select id="form_tbl5_glyx" name="glyx"></select></div>	</td>
			<td>		
				&nbsp;&nbsp;&nbsp;教研室代码或名称：<input type="text" name="xmordm">
			<a class="btn" href="#" onclick="loadData('form_tbl5','form_tbl5_dx','${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryJysxxbList?dx=A');" style="vertical-align: top" align="center">
			<i class="icon-search"></i>查询</button>
			</td></tr></table>
			</form>
			</td>
		</tr>
		
		<tr>
			<td>
			<table width="100%">
				<tr>
					<td  width="45%" bgcolor="#f6f6f6"><strong>待选教研室</strong></td>
					<td  width="90px"></td>
					<td  width="45%" bgcolor="#f6f6f6"><strong>已选教研室</strong></td>
				</tr>
				<tr>
					<td valign="top">
					<div class="controls"  style="width: 100%; height: 280px" >
						<select multiple id="form_tbl5_dx" name="form_tbl5_dx"  ondblclick="choose('add','form_tbl5')"  style="width: 100%; height: 280px" > 
						</select> </div>
					</td>
					<td   align="center">
					<button  class="btn btn-success" onclick="choose('add','form_tbl5')" href="#">
					添加 -&gt;</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('del','form_tbl5')" href="#">
					&lt;- 删除</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('addAll','form_tbl5')" href="#">
					添加-&gt;&gt;</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('delAll','form_tbl5')" href="#">
					&lt;&lt;-删除</button></td>
					<td>
					<div class="controls" style="width: 100%; height: 280px" >
						<select multiple id="form_tbl5_yx" name="form_tbl5_yx"  ondblclick="choose('del','form_tbl5')" style="width: 100%; height: 280px" > 
						</select> </div>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>


	<table width="96%" align="center" cellspacing="0" cellpadding="0" id="tbl6">
		<tr>
			<td>
			<div class="alert alert-info" style="height: 30px; margin-bottom: 15px ; font-size:14px">
				<img src="${pageContext.request.contextPath}/resources/pub/pubChoose/themes/img/man.gif" border="0" align="absbottom">
				<strong>选择教师院系</strong> 你能一次选取多个教师院系，操作完成后单击确定完成选取！ </div>
			</td>
		</tr>
		<tr>
			<td>
			<form id="form_tbl6" name="form_tbl6">
			<input name="glb" type="hidden" value="${glb}"/>
			<input name="glzjm" type="hidden" value="${glzjm}"/>
			<input name="glzjz" type="hidden" value="${glzjz}"/>
			<input name="mxdxlx" type="hidden" value="6"/>
			<table><tr>
															
			<td>		
				&nbsp;&nbsp;&nbsp;教师院系代码或名称：<input type="text" name="xmordm">
			<a class="btn" href="#" onclick="loadData('form_tbl6','form_tbl6_dx','${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryYxxxbList?dx=A');" style="vertical-align: top" align="center">
			<i class="icon-search"></i>查询</button>
			</td></tr></table>
			</form>
			</td>
		</tr>
		
		<tr>
			<td>
			<table width="100%">
				<tr>
					<td  width="45%" bgcolor="#f6f6f6"><strong>待选教师院系</strong></td>
					<td  width="90px"></td>
					<td  width="45%" bgcolor="#f6f6f6"><strong>已选教师院系</strong></td>
				</tr>
				<tr>
					<td valign="top">
					<div class="controls" style="width: 100%; height: 280px" >
						<select multiple id="form_tbl6_dx" name="form_tbl6_dx"  ondblclick="choose('add','form_tbl6')" style="width: 100%; height: 280px" > 
						</select> </div>
					</td>
					<td  align="center">
					<button  class="btn btn-success" onclick="choose('add','form_tbl6')" href="#">
					添加 -&gt;</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('del','form_tbl6')" href="#">
					&lt;- 删除</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('addAll','form_tbl6')" href="#">
					添加-&gt;&gt;</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('delAll','form_tbl6')" href="#">
					&lt;&lt;-删除</button></td>
					<td>
					<div class="controls" style="width: 100%; height: 280px" >
						<select multiple id="form_tbl6_yx" name="form_tbl6_yx"  ondblclick="choose('del','form_tbl6')"  style="width: 100%; height: 280px"  > 
						</select> </div>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
	

	<table width="96%" align="center" cellspacing="0" cellpadding="0" id="tbl7">
		<tr>
			<td>
			<div class="alert alert-info" style="height: 30px; margin-bottom: 15px ; font-size:14px">
				<img src="${pageContext.request.contextPath}/resources/pub/pubChoose/themes/img/man.gif" border="0" align="absbottom">
				<strong>选择学生院系</strong> 你能一次选取多个学生院系，操作完成后单击确定完成选取！ </div>
			</td>
		</tr>
		<tr>
			<td>
			<form id="form_tbl7" name="form_tbl7">
			<input name="glb" type="hidden" value="${glb}"/>
			<input name="glzjm" type="hidden" value="${glzjm}"/>
			<input name="glzjz" type="hidden" value="${glzjz}"/>
			<input name="mxdxlx" type="hidden" value="7"/>
			<table><tr>
															
			<td>		
				&nbsp;&nbsp;&nbsp;学生院系代码或名称：<input type="text" name="xmordm">
			<a class="btn" href="#" onclick="loadData('form_tbl7','form_tbl7_dx','${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryYxxxbList?dx=A');" style="vertical-align: top" align="center">
			<i class="icon-search"></i>查询</button>
			</td></tr></table>
			</form>
			</td>
		</tr>
		
		<tr>
			<td>
			<table width="100%">
				<tr>
					<td  width="45%" bgcolor="#f6f6f6"><strong>待选学生院系</strong></td>
					<td  width="90px"></td>
					<td  width="45%" bgcolor="#f6f6f6"><strong>已选学生院系</strong></td>
				</tr>
				<tr>
					<td valign="top">
					<div class="controls" style="width: 100%; height: 280px" >
						<select multiple id="form_tbl7_dx" name="form_tbl7_dx"  ondblclick="choose('add','form_tbl7')" style="width: 100%; height: 280px" > 
						</select> </div>
					</td>
					<td  align="center">
					<button  class="btn btn-success" onclick="choose('add','form_tbl7')" href="#">
					添加 -&gt;</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('del','form_tbl7')" href="#">
					&lt;- 删除</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('addAll','form_tbl7')" href="#">
					添加-&gt;&gt;</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('delAll','form_tbl7')" href="#">
					&lt;&lt;-删除</button></td>
					<td>
					<div class="controls" style="width: 100%; height: 280px" >
						<select multiple id="form_tbl7_yx" name="form_tbl7_yx"  ondblclick="choose('del','form_tbl7')" style="width: 100%; height: 280px" > 
						</select> </div>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>	


	<table width="96%" align="center" cellspacing="0" cellpadding="0" id="tbl8">
		<tr>
			<td>
			<div class="alert alert-info" style="height: 30px; margin-bottom: 15px ; font-size:14px">
				<img src="${pageContext.request.contextPath}/resources/pub/pubChoose/themes/img/man.gif" border="0" align="absbottom">
				<strong>选择院系</strong> 你能一次选取多个院系，操作完成后单击确定完成选取！ </div>
			</td>
		</tr>
		<tr>
			<td>
			<form id="form_tbl8" name="form_tbl8">
			<input name="glb" type="hidden" value="${glb}"/>
			<input name="glzjm" type="hidden" value="${glzjm}"/>
			<input name="glzjz" type="hidden" value="${glzjz}"/>
			<input name="mxdxlx" type="hidden" value="8"/>
			<table><tr>
			<td>		
				&nbsp;&nbsp;&nbsp;院系代码或名称：<input type="text" name="xmordm">
			<a class="btn" href="#" onclick="loadData('form_tbl8','form_tbl8_dx','${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryYxxxbList?dx=A');" style="vertical-align: top" align="center">
			<i class="icon-search"></i>查询</button>
			</td></tr></table>
			</form>
			</td>
		</tr>
		
		<tr>
			<td>
			<table width="100%">
				<tr>
					<td  width="45%" bgcolor="#f6f6f6"><strong>待选院系</strong></td>
					<td  width="90px"></td>
					<td  width="45%" bgcolor="#f6f6f6"><strong>已选院系</strong></td>
				</tr>
				<tr>
					<td valign="top">
					<div class="controls" style="width: 100%; height: 280px" >
						<select multiple id="form_tbl8_dx" name="form_tbl8_dx"  ondblclick="choose('add','form_tbl8')" style="width: 100%; height: 280px" > 
						</select> </div>
					</td>
					<td  align="center">
					<button  class="btn btn-success" onclick="choose('add','form_tbl8')" href="#">
					添加 -&gt;</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('del','form_tbl8')" href="#">
					&lt;- 删除</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('addAll','form_tbl8')" href="#">
					添加-&gt;&gt;</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('delAll','form_tbl8')" href="#">
					&lt;&lt;-删除</button></td>
					<td>
					<div class="controls" style="width: 100%; height: 280px" >
						<select multiple id="form_tbl8_yx" name="form_tbl8_yx"  ondblclick="choose('del','form_tbl8')" style="width: 100%; height: 280px" > 
						</select> </div>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
	
	
	<table width="96%" align="center" cellspacing="0" cellpadding="0" id="tbl9">
		<tr>
			<td>
			<div class="alert alert-info" style="height: 30px; margin-bottom: 15px ; font-size:14px">
				<img src="${pageContext.request.contextPath}/resources/pub/pubChoose/themes/img/man.gif" border="0" align="absbottom">
				<strong>选择学生年级</strong> 你能一次选取多个学生年级，操作完成后单击确定完成选取！ </div>
			</td>
		</tr>
		<tr>
			<td>
			<form id="form_tbl9" name="form_tbl9">
			<input name="glb" type="hidden" value="${glb}"/>
			<input name="glzjm" type="hidden" value="${glzjm}"/>
			<input name="glzjz" type="hidden" value="${glzjz}"/>
			<input name="mxdxlx" type="hidden" value="9"/>
			
			</form>
			</td>
		</tr>
		
		<tr>
			<td>
			<table width="100%">
				<tr>
					<td  width="45%" bgcolor="#f6f6f6"><strong>待选学生年级</strong></td>
					<td  width="90px"></td>
					<td  width="45%" bgcolor="#f6f6f6"><strong>已选学生年级</strong></td>
				</tr>
				<tr>
					<td valign="top">
					<div class="controls"  style="width: 100%; height: 280px" >
						<select multiple id="form_tbl9_dx" name="form_tbl9_dx"  ondblclick="choose('add','form_tbl9')"   style="width: 100%; height: 280px"  > 
						</select> </div>
					</td>
					<td  align="center">
					<button  class="btn btn-success" onclick="choose('add','form_tbl9')" href="#">
					添加 -&gt;</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('del','form_tbl9')" href="#">
					&lt;- 删除</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('addAll','form_tbl9')" href="#">
					添加-&gt;&gt;</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('delAll','form_tbl9')" href="#">
					&lt;&lt;-删除</button></td>
					<td>
					<div class="controls" style="width: 100%; height: 280px" >
						<select multiple id="form_tbl9_yx" name="form_tbl9_yx"  ondblclick="choose('del','form_tbl9')"  style="width: 100%; height: 280px" > 
						</select> </div>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
	


	<table width="96%" align="center" cellspacing="0" cellpadding="0" id="tbl10">
		<tr>
			<td>
			<div class="alert alert-info" style="height: 30px; margin-bottom: 15px ; font-size:14px">
				<img src="${pageContext.request.contextPath}/resources/pub/pubChoose/themes/img/man.gif" border="0" align="absbottom">
				<strong>选择专业</strong> 你能一次选取多个专业，操作完成后单击确定完成选取！ </div>
			</td>
		</tr>
		<tr>
			<td>
			<form id="form_tbl10" name="form_tbl10">
			<input name="glb" type="hidden" value="${glb}"/>
			<input name="glzjm" type="hidden" value="${glzjm}"/>
			<input name="glzjz" type="hidden" value="${glzjz}"/>
			<input name="mxdxlx" type="hidden" value="10"/>
			<table><tr>
			<td>院系：</td><td><div class="input-append" style="width: 250px"> 					
					<select id="form_tbl10_glyx" name="glyx"></select></div>	</td>
 															
			<td>		
				&nbsp;&nbsp;&nbsp;专业代码或名称：<input type="text" name="xmordm">
			<a class="btn" href="#" onclick="loadData('form_tbl10','form_tbl10_dx','${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryZyxxbList?dx=A');" style="vertical-align: top" align="center">
			<i class="icon-search"></i>查询</button>
			</td></tr></table>
			</form>
			</td>
		</tr>
		
		<tr>
			<td>
			<table width="100%">
				<tr>
					<td  width="45%" bgcolor="#f6f6f6"><strong>待选专业</strong></td>
					<td  width="90px"></td>
					<td  width="45%" bgcolor="#f6f6f6"><strong>已选专业</strong></td>
				</tr>
				<tr>
					<td valign="top">
					<div class="controls"  style="width: 100%; height: 280px" >
						<select multiple id="form_tbl10_dx" name="form_tbl10_dx"  ondblclick="choose('add','form_tbl10')" style="width: 100%; height: 280px" > 
						</select> </div>
					</td>
					<td  align="center">
					<button  class="btn btn-success" onclick="choose('add','form_tbl10')" href="#">
					添加 -&gt;</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('del','form_tbl10')" href="#">
					&lt;- 删除</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('addAll','form_tbl10')" href="#">
					添加-&gt;&gt;</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('delAll','form_tbl10')" href="#">
					&lt;&lt;-删除</button></td>
					<td>
					<div class="controls" style="width: 100%; height: 280px" >
						<select multiple id="form_tbl10_yx" name="form_tbl10_yx"  ondblclick="choose('del','form_tbl10')" style="width: 100%; height: 280px"  > 
						</select> </div>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>


	<table width="96%" align="center" cellspacing="0" cellpadding="0" id="tbl11">
		<tr>
			<td>
			<div class="alert alert-info" style="height: 30px; margin-bottom: 15px ; font-size:14px">
				<img src="${pageContext.request.contextPath}/resources/pub/pubChoose/themes/img/man.gif" border="0" align="absbottom">
				<strong>选择学生班级</strong> 你能一次选取多个学生班级，操作完成后单击确定完成选取！ </div>
			</td>
		</tr>
		<tr>
			<td>
			<form id="form_tbl11" name="form_tbl11">
			<input name="glb" type="hidden" value="${glb}"/>
			<input name="glzjm" type="hidden" value="${glzjm}"/>
			<input name="glzjz" type="hidden" value="${glzjz}"/>
			<input name="mxdxlx" type="hidden" value="11"/>
			<table>
			<tr>
			<td>院系：</td>
			<td>
				<select id="form_tbl11_glyx" name="glyx"></select>
			 </td>
			<td>专业：</td>
			<td>
 				<select id="form_tbl11_zydm" name="zydm"></select>
 			</td>
  			<td>年级：</td>
 			<td>
 				<select id="form_tbl11_nj" name="nj"></select>
 			</td> 			
 		</tr>
		<tr>			
			<td> 学生班级：</td>
 			<td>
			<input type="text" name="xmordm">
			</td> 
 			 <td colspan="4"  style="vertical-align:top; padding-left:10px">
			<a class="btn" href="#" onclick="loadData('form_tbl11','form_tbl11_dx','${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryBjxxbList?dx=A');"  >
			<i class="icon-search"></i>查询</a>
			</td>			
		    </tr>
		    </table>
			</form>
			</td>
		</tr>
		<tr>
			<td>
			<table width="100%">
				<tr>
					<td  width="45%" bgcolor="#f6f6f6"><strong>待选学生班级</strong></td>
					<td  width="90px"></td>
					<td  width="45%" bgcolor="#f6f6f6"><strong>已选学生班级</strong></td>
				</tr>
				<tr>
					<td valign="top">
					<div class="controls" style="width: 100%; height: 280px" >
						<select multiple id="form_tbl11_dx" name="form_tbl11_dx"  ondblclick="choose('add','form_tbl11')" style="width: 100%; height: 280px" > 
						</select> </div>
					</td>
					<td  align="center">
					<button  class="btn btn-success" onclick="choose('add','form_tbl11')" href="#">
					添加 -&gt;</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('del','form_tbl11')" href="#">
					&lt;- 删除</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('addAll','form_tbl11')" href="#">
					添加-&gt;&gt;</button><br>
					<br>
					<button  class="btn btn-success" onclick="choose('delAll','form_tbl11')" href="#">
					&lt;&lt;-删除</button></td>
					<td>
					<div class="controls" style="width: 100%; height: 280px" >
						<select multiple id="form_tbl11_yx" name="form_tbl11_yx"  ondblclick="choose('del','form_tbl11')" style="width: 100%; height: 280px" > 
						</select> </div>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>


			
</div>



 <div id="menuContent" class="menuContent" style="display:none; position: absolute; background-color:#FFFFCC;  height:330px;width:280px;padding: 0px;overflow: auto;border-width: 1px;border-style: inset;">
	<ul id="ztree" class="ztree" style="margin-top:0; width:160px;"></ul>
</div>
<div data-options="region:'south',border:false" style="height: 45px; text-align: right; padding: 5px ; background-color: #efefef;">
	<button id="btnSave" class="btn btn-primary" onclick="save()" href="#" data-options="disabled:true">
	<i class="icon-ok icon-white"></i>&nbsp;确定</button>
	<button id="btnClose" class="btn btn-danger" onclick="window.close();" href="#" data-options="disabled:true">
	<i class="icon-remove icon-white"></i>&nbsp;关闭</button>
	
 </div>
	
<script type="text/javascript"> 
	var active = ""; //当前层 
	/*树相关结束*/
 	$(function(){
 		//解析页面 
         $.parser.parse();
         //显示隐藏页面
         $('body').css({ visibility: 'visible' }); 
         //移除顶端遮罩
         if (top.hideMask) top.hideMask(); 
         if('${mxdxlx}'!=null && '${mxdxlx}'!=''){
        	 openTable("${mxdxlx}"); //
        	 $("#li_${mxdxlx}").addClass("active");
         }else {
        	 $("#li_1").addClass("active");
        	 openTable("1"); //初始打开第一个标签
         }
        
         //chosenCombox('');
         document.onkeydown = function(e){
        	   if(!e){
        	    e = window.event;
        	   }
        	   if((e.keyCode || e.which) == 13){
        		  return false;
        	   }
        	  }        

     });
	//切换标签页
 	function openTable(id){
 		if (id==active) return;
		for(var i=0;i<mxdxlxArray.length;i++){
			$("#tbl"+mxdxlxArray[i].mxdxlx).css("display","none");
		}
 		$("#tbl"+id).css("display","");
 		active=id;
 		if (id=="1") //教师
 		{

 			if (document.getElementById("form_tbl"+id+"_glyx").length==0){
 				loadData("form_tbl"+id,"form_tbl"+id+"_glyx","${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryYxxxbList");
 			}
 			if (document.getElementById("form_tbl"+id+"_dx").length==0){
 				loadData("form_tbl"+id,"form_tbl"+id+"_dx","${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryJsxxbList?dx=A");
 			}
 			if (document.getElementById("form_tbl"+id+"_yx").length==0){
 				loadData("form_tbl"+id,"form_tbl"+id+"_yx","${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryJsxxbList?yx=A");
 			}
 			
 			
 			
 		}
 		if (id=="2") //学生
 		{
 			if (document.getElementById("form_tbl"+id+"_glyx").length==0){
 				loadData("form_tbl"+id,"form_tbl"+id+"_glyx","${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryYxxxbList");
 			}
 			if (document.getElementById("form_tbl"+id+"_nj").length==0){
 				loadData("form_tbl"+id,"form_tbl"+id+"_nj","${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryNjxxbList");
 			} 			
 			if (document.getElementById("form_tbl"+id+"_dx").length==0){
 				loadData("form_tbl"+id,"form_tbl"+id+"_dx","${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryXsxxbList?dx=A");
 			}
 			if (document.getElementById("form_tbl"+id+"_yx").length==0){
 				loadData("form_tbl"+id,"form_tbl"+id+"_yx","${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryXsxxbList?yx=A");
 			}						 			
 		} 	
 		
 		
 		if (id=="3") //角色
 		{
 			
 			if (document.getElementById("form_tbl"+id+"_dx").length==0){
 				loadData("form_tbl"+id,"form_tbl"+id+"_dx","${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryJuesxxbList?dx=A");
 			}
 			if (document.getElementById("form_tbl"+id+"_yx").length==0){
 				loadData("form_tbl"+id,"form_tbl"+id+"_yx","${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryJuesxxbList?yx=A");
 			}						 			
 		}
 		
 		if (id=="4") //群组
 		{
 				
 			if (document.getElementById("form_tbl"+id+"_dx").length==0){
 				loadData("form_tbl"+id,"form_tbl"+id+"_dx","${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryQzxxbList?dx=A");
 			} 
 			if (document.getElementById("form_tbl"+id+"_yx").length==0){
 				loadData("form_tbl"+id,"form_tbl"+id+"_yx","${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryQzxxbList?yx=A");
 			}			
 								 			
 		} 	
 		
 		if (id=="5") //教研室
 		{

 			if (document.getElementById("form_tbl"+id+"_glyx").length==0){
 				loadData("form_tbl"+id,"form_tbl"+id+"_glyx","${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryYxxxbList",true);
 			}
 					
 			if (document.getElementById("form_tbl"+id+"_dx").length==0){
 				loadData("form_tbl"+id,"form_tbl"+id+"_dx","${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryJysxxbList?dx=A");
 			}
 			if (document.getElementById("form_tbl"+id+"_yx").length==0){
 				loadData("form_tbl"+id,"form_tbl"+id+"_yx","${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryJysxxbList?yx=A");
 			}		
 		}
 		
 		if (id=="6") //教师院系
 		{
 				
 			if (document.getElementById("form_tbl"+id+"_dx").length==0){
 				loadData("form_tbl"+id,"form_tbl"+id+"_dx","${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryYxxxbList?dx=A");
 			}
 			if (document.getElementById("form_tbl"+id+"_yx").length==0){
 				loadData("form_tbl"+id,"form_tbl"+id+"_yx","${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryYxxxbList?yx=A");
 			}						 			
 		} 	
 		
 		if (id=="7") //学生院系
 		{
 				
 			if (document.getElementById("form_tbl"+id+"_dx").length==0){
 				loadData("form_tbl"+id,"form_tbl"+id+"_dx","${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryYxxxbList?dx=A");
 			}
 			if (document.getElementById("form_tbl"+id+"_yx").length==0){
 				loadData("form_tbl"+id,"form_tbl"+id+"_yx","${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryYxxxbList?yx=A");
 			}						 			
 		} 	
 		
 		if (id=="8") //全部院系
 		{
 				
 			if (document.getElementById("form_tbl"+id+"_dx").length==0){
 				loadData("form_tbl"+id,"form_tbl"+id+"_dx","${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryYxxxbList?dx=A");
 			}
 			if (document.getElementById("form_tbl"+id+"_yx").length==0){
 				loadData("form_tbl"+id,"form_tbl"+id+"_yx","${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryYxxxbList?yx=A");
 			}						 			
 		} 
 		
 		if (id=="9") //学生年级
 		{
 				
 			if (document.getElementById("form_tbl"+id+"_dx").length==0){
 				loadData("form_tbl"+id,"form_tbl"+id+"_dx","${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryNjxxbList?dx=A");
 			}
 			if (document.getElementById("form_tbl"+id+"_yx").length==0){
 				loadData("form_tbl"+id,"form_tbl"+id+"_yx","${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryNjxxbList?yx=A");
 			} 			
 								 			
 		} 
 		
 		if (id=="10") //学生专业
 		{
 			if (document.getElementById("form_tbl"+id+"_glyx").length==0){
 				loadData("form_tbl"+id,"form_tbl"+id+"_glyx","${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryYxxxbList",true);
 			}
 					
 			if (document.getElementById("form_tbl"+id+"_dx").length==0){
 				loadData("form_tbl"+id,"form_tbl"+id+"_dx","${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryZyxxbList?dx=A");
 			}
 			if (document.getElementById("form_tbl"+id+"_yx").length==0){
 				loadData("form_tbl"+id,"form_tbl"+id+"_yx","${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryZyxxbList?yx=A");
 			}						 			
 		} 	
 		
 		if (id=="11") //学生班级
 		{
 			if (document.getElementById("form_tbl"+id+"_glyx").length==0){
 				loadData("form_tbl"+id,"form_tbl"+id+"_glyx","${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryYxxxbList",true);	
 			}
 			if (document.getElementById("form_tbl"+id+"_zydm").length==0){
 				loadData("form_tbl"+id,"form_tbl"+id+"_zydm","${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryZyxxbList",true);
 			}
 			if (document.getElementById("form_tbl"+id+"_nj").length==0){
 				loadData("form_tbl"+id,"form_tbl"+id+"_nj","${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryNjxxbList",true);
 			} 			
 			if (document.getElementById("form_tbl"+id+"_dx").length==0){
 				loadData("form_tbl"+id,"form_tbl"+id+"_dx","${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryBjxxbList?dx=A");
 			}
 			if (document.getElementById("form_tbl"+id+"_yx").length==0){
 				loadData("form_tbl"+id,"form_tbl"+id+"_yx","${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/queryBjxxbList?yx=A");
 			}						 			
 		} 	
 		
 		
 	
	}	
	 
	
	//
 	function loadData(fromid,htmlval,url,bs){		
		
	   	var options = {
	         url: url,
	         type: 'post',
	         dataType: 'json',
	         data: $("#"+fromid).serialize(),
	         success: function (data) {
             	if(data.length > 0){
					////
            		var src="";
             		if(bs==true){
             			src = src+"<option value=''>"+"全部"+"</option>" ;
             		}
                	for(var i=0;i<data.length;i++){
                		src = src+"<option value='"+data[i].value+"'>"+data[i].text+"</option>" ;
                	}
                	$('#'+htmlval).html(src);
            	}else {
            		var src="";
            		$('#'+htmlval).html(src);
            	}
             	
	         }
	         ,error:function(){ 
 	         }
	     };
	  	$.ajax(options);
	  	return false; 		
 	}
	
	//从左边加到右边
 	function choose(flag,objs){  
		if (flag=="add"||flag=="addAll"){
      		var destList = document.getElementById(objs+"_yx") ; 
      		var srcList = document.getElementById(objs+"_dx"); 
		}
		else{
			var srcList = document.getElementById(objs+"_yx") ; 
	      	var destList = document.getElementById(objs+"_dx"); 
		}
        var len = destList.length;   
      	for(var i = 0;   i < srcList.length; i++){ 
    	  	if(((srcList.options[i] != null)&&(srcList.options[i].selected))||(flag=="addAll"||flag=="delAll")){
    	  		destList.options[len] = new Option(srcList.options[i].text,srcList.options[i].value);   
		  		len++; 
    	    }   
       	}   
      	for (var i=srcList.length-1;i>=0;i--){
      		if(((srcList.options[i] != null)&&(srcList.options[i].selected))||(flag=="addAll"||flag=="delAll"	)){ 
      			srcList.options.remove(i); 	
      		}
      	}
      }
	//保存数据
	function save(){
		var list,str = [],str2=[],mxdxlxmc;
		for(var i=0;i<mxdxlxArray.length;i++){
			if(active==mxdxlxArray[i].mxdxlx){
				list=document.getElementById("form_tbl"+mxdxlxArray[i].mxdxlx+"_yx");
				mxdxlxmc = mxdxlxArray[i].mxdxlxmc;
			}
		}
		
		for(var i = 0;   i < list.length; i++){  
			str[i] = list[i].value;
			str2[i] = list[i].text
		}
		if(str==null || str==""){
			if(confirm("您没有选择【面向对象】，确定要修改保存么")){
				$("#FormShumit_mxdxlx").val(active);
				$("#FormShumit_mxdxz").val('');
				$("#FormShumit_mxdxxsz").val("【类型：全部人员】");
				
			   	var options = {
				         url: '${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/saveToMxdxxxb',
				         type: 'post',
				         data: $("#FormShumit").serialize(),
				         success: function (data) {
			             	if(data=='ok'){
								alert("操作成功");
								window.opener.callAppendMxdxxszFun("【类型：全部人员】");
								self.close();
			            	}
				         }
				         ,error:function(){ 
				        	 alert("操作失败");
			 	         }
				     };
				  	$.ajax(options);
				  	return false; 				
			}
		}else {
			if(confirm("您选择了【"+mxdxlxmc+"】类型做为面向对象，确定要修改保存么？")){
				$("#FormShumit_mxdxlx").val(active);
				$("#FormShumit_mxdxz").val(str);
				$("#FormShumit_mxdxxsz").val("【类型："+mxdxlxmc+"】"+str2);
				
			   	var options = {
				         url: '${pageContext.request.contextPath}/pubChoose/pubChooseMxdx/saveToMxdxxxb',
				         type: 'post',
				         data: $("#FormShumit").serialize(),
				         success: function (data) {
			             	if(data=='ok'){
								alert("操作成功");
								window.opener.callAppendMxdxxszFun("【类型："+mxdxlxmc+"】"+str2);
								self.close();
			            	}
				         }
				         ,error:function(){ 
				        	 alert("操作失败");
			 	         }
				     };
				  	$.ajax(options);
				  	return false; 			
			}			
		}

		
	}	
 </script> 
</body>

</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ff" uri="fenYeListNo"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>北京赢科后台管理系统</title>
<jsp:include page="../../include/css-boostrap-include.jsp"></jsp:include>
<style type="text/css">
  html, body { height:100%; }
  .Contentbox { width:100%; min-height:100%;height:auto }
  *html .Contentbox { height:100% }
</style>
  
</head>
<body>
<div class="Contentbox">
 <div class="mainbg"></div>
  <div class="pd10">    
   	  <div class="question" title="帮助" onclick="javascript:cha('${QXB.QXDM}');">
   	  <span class="glyphicon glyphicon-question-sign"></span>
   	  </div>    
      <div class="address">
       <ol class="breadcrumb  ">
          <li> <span class="glyphicon glyphicon-home pull-left"></span> </li>
		  <li>当前位置：</li>
		  <li><a href="#">栏目名称</a></li>
		  <li class="active">列表页demo</li>
		</ol>          
      </div>
    <div class="clr"></div>
    <div class="butsea">
      <div class="pull-left Pct35">
            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">添加</button>
            <button type="button" class="btn btn-info">删除</button>      
      </div>
	 <div class="dropdown pull-right">
       <form name="queryform" method="post" id="queryform" >
	   <div class="btn-group">
		  <button type="button" class="btn btn-search dropdown-toggle" data-toggle="dropdown">搜索 <span class="caret"></span></button>
		  <div class="dropdown-menu search-list pull-right" role="menu" style="width:300px;">
          <table border="0" width="96%"  cellpadding="0" cellspacing="0"  >
		      <tr>
		      	<th width="120">院系代码/名称：</th>
	           	<td> <input type="text" name="yxmcordm" id="qf_yxmcordm" value="${entity.yxmcordm}"  /></td>
		       </tr>
		       <tr>
		        <th>教研室代码/名称：</th>
	           	<td><input type="text" name="jysmcordm" id="qf_jysmcordm" value="${entity.jysmcordm}"  /></td>
		      </tr>
      	</table> 
	    <div class="divider"></div>
        <div class="clr"></div>
        <button type="button" class="btn btn-info pull-right mr10" onclick="javascript:queryLike();">确定</button>
	   </div>
	</div>
    </form>     
   </div>     

    </div>
    <div class="clr"></div>
    <div class="list"> 
        <table  class="table table-bordered bot_line">
         <thead>
          <tr>
            <th width="10px"><input type="checkbox" title="全选/不选" /></th> 
			<th>栏目名称</th> 
			<th>栏目名称</th>
			<th>栏目名称</th>
			<th>栏目名称</th>           
            <th>操作</th>
          </tr>
         </thead>
         <tbody>
          <tr>
            <td><input type="checkbox"/></td>
            <td>内容</td>
            <td>内容</td>
            <td>内容</td>
            <td>内容</td>
            <td>
            <div class="cz_button cz_bg1"><span class="glyphicon glyphicon-pencil"></span></div>
            <div class="cz_button cz_bg2"><span class="glyphicon glyphicon-th-list"></span></div>
            <div class="cz_button cz_bg3"><span class="glyphicon glyphicon-remove"></span></div>
            <div class="cz_button cz_bg4"><span class="glyphicon glyphicon-list-alt"></span></div>
            <div class="cz_button cz_bg5"><span class="glyphicon glyphicon-book"></span></div>
            <div class="cz_button cz_bg6"><span class="glyphicon glyphicon-edit"></span></div>
            </td>
          </tr>
          <tr>
            <td><input type="checkbox"/></td>
            <td>内容</td>
            <td>内容</td>
            <td>内容</td>
            <td>内容</td>
            <td>
            <div class="cz_button cz_bg1"><span class="glyphicon glyphicon-search"></span></div>
            <div class="cz_button cz_bg2"><span class="glyphicon glyphicon-ok-circle"></span></div>
            <div class="cz_button cz_bg3"><span class="glyphicon glyphicon glyphicon-new-window"></span></div>
            <div class="cz_button cz_bg4"><span class="glyphicon glyphicon glyphicon-save"></span></div>
            <div class="cz_button cz_bg5"><span class="glyphicon glyphicon-floppy-disk"></span></div>
            <div class="cz_button cz_bg6"><span class="glyphicon glyphicon-stats"></span></div>            
            </td>
          </tr>
          <tr>
            <td><input type="checkbox"/></td>
            <td>内容</td>
            <td>内容</td>
            <td>内容</td>
            <td>内容</td>
            <td>
            <div class="cz_button cz_bg1"><span class="glyphicon glyphicon-pencil"></span></div>
            <div class="cz_button cz_bg2"><span class="glyphicon glyphicon-th-list"></span></div>
            <div class="cz_button cz_bg3"><span class="glyphicon glyphicon-remove"></span></div>
            <div class="cz_button cz_bg4"><span class="glyphicon glyphicon-list-alt"></span></div>
            <div class="cz_button cz_bg5"><span class="glyphicon glyphicon-book"></span></div>
            <div class="cz_button cz_bg6"><span class="glyphicon glyphicon-edit"></span></div>
            </td>
          </tr>
          <tr>
            <td><input type="checkbox"/></td>
            <td>内容</td>
            <td>内容</td>
            <td>内容</td>
            <td>内容</td>
            <td>
            <div class="cz_button cz_bg1"><span class="glyphicon glyphicon-search"></span></div>
            <div class="cz_button cz_bg2"><span class="glyphicon glyphicon-ok-circle"></span></div>
            <div class="cz_button cz_bg3"><span class="glyphicon glyphicon glyphicon-new-window"></span></div>
            <div class="cz_button cz_bg4"><span class="glyphicon glyphicon glyphicon-save"></span></div>
            <div class="cz_button cz_bg5"><span class="glyphicon glyphicon-floppy-disk"></span></div>
            <div class="cz_button cz_bg6"><span class="glyphicon glyphicon-stats"></span></div>            
            </td>
          </tr>
          <tr>
            <td><input type="checkbox"/></td>
            <td>内容</td>
            <td>内容</td>
            <td>内容</td>
            <td>内容</td>
            <td>
            <div class="cz_button cz_bg1"><span class="glyphicon glyphicon-pencil"></span></div>
            <div class="cz_button cz_bg2"><span class="glyphicon glyphicon-th-list"></span></div>
            <div class="cz_button cz_bg3"><span class="glyphicon glyphicon-remove"></span></div>
            <div class="cz_button cz_bg4"><span class="glyphicon glyphicon-list-alt"></span></div>
            <div class="cz_button cz_bg5"><span class="glyphicon glyphicon-book"></span></div>
            <div class="cz_button cz_bg6"><span class="glyphicon glyphicon-edit"></span></div>
            </td>
          </tr>
          <tr>
            <td><input type="checkbox"/></td>
            <td>内容</td>
            <td>内容</td>
            <td>内容</td>
            <td>内容</td>
            <td>
            <div class="cz_button cz_bg1"><span class="glyphicon glyphicon-search"></span></div>
            <div class="cz_button cz_bg2"><span class="glyphicon glyphicon-ok-circle"></span></div>
            <div class="cz_button cz_bg3"><span class="glyphicon glyphicon glyphicon-new-window"></span></div>
            <div class="cz_button cz_bg4"><span class="glyphicon glyphicon glyphicon-save"></span></div>
            <div class="cz_button cz_bg5"><span class="glyphicon glyphicon-floppy-disk"></span></div>
            <div class="cz_button cz_bg6"><span class="glyphicon glyphicon-stats"></span></div>            
            </td>
          </tr>                    
          </tbody>           
        </table>
      </form>
    </div>
    <div class="youtube"> 
		 <nav>
		  <ul class="pagination pagination-sm">
		    <li class="disabled"><a href="#">&laquo;</a></li>
		    <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
		    <li><a href="#">2</a></li>
		    <li><a href="#">3</a></li>
		    <li><a href="#">4</a></li>
		    <li><a href="#">5</a></li>
		    <li><a href="#">&raquo;</a></li>
		  </ul>
		</nav>
    </div>
    <div class="clr"></div>
  </div>
</div>
 
 
<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>

<!-- 添加弹出框 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document"  >
    <div class="modal-content popborder">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"  >&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">添加</h4>
      </div>
      <div class="modal-body">
         <table  class="addlist table-bordered"  >
           <tr>
             <th>角色代码：</th>
             <td><input type="text" class="form-control Pct92 pull-left"><span class="red ml5">*</span></td>
           </tr>
           <tr>
             <th>角色名称：</th>
             <td><input type="text" class="form-control Pct92 pull-left" ><span class="red ml5">*</span></td>
           </tr>
           <tr>
             <th>主页链接地址：</th>
             <td><input type="text" class="form-control"></td>
           </tr>
           <tr>
             <th>可用否：</th>
             <td><select class="form-control"> </select></td>
           </tr>
           <tr>
             <th>角色描述：</th>
             <td><textarea class="form-control" rows="3"></textarea></td>
           </tr>                                
         </table>
      </div>
      <div class="modal-footer mt1">
        <button type="button" class="btn btn-info">保存</button>
        <button type="button" class="btn btn-info" data-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>

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
		  <li class="active">Tab页demo</li>
		</ol>          
      </div>      
    <div class="clr"></div>
    <ul class="nav nav-tabs tabweb mb10" role="tablist">
	  <li role="presentation" class="active"><a href="#content1" role="tab" data-toggle="tab">列表</a></li>
	  <li role="presentation"><a href="#content2" role="tab" data-toggle="tab">添加表格</a></li>  
	  <li role="presentation"><a href="#content3" role="tab" data-toggle="tab">查看表格</a></li>  
	  <li role="presentation"><a href="#content4" role="tab" data-toggle="tab">面板</a></li>  
	</ul>
 
	<div class="tab-content">
	  <div role="tabpanel" class="tab-pane active" id="content1">
		    <div class="butsea">
		      <div class="pull-left Pct35">
		            <button type="button" class="btn btn-info" >添加</button>
		            <button type="button" class="btn btn-info">删除</button>      
		      </div>
			 <div class="dropdown pull-right">
		       <form name="queryform" method="post" id="queryform" >
			   <div class="btn-group">
				  <button type="button" class="btn btn-search dropdown-toggle" data-toggle="dropdown">搜索 <span class="caret"></span></button>
				  <div class="dropdown-menu search-list pull-right" role="menu" style="width:260px;">
		          <table border="0" width="96%"  cellpadding="0" cellspacing="0"  >
				      <tr>
				      	<th width="90">名称：</th>
			           	<td>
			           	  <select>
						   <option>1</option>
						   <option>2</option>
						   <option>3</option>
						   <option>4</option>
						   <option>5</option>
						</select> 
                        </td>
				       </tr>
				       <tr>
				        <th>栏目名称：</th>
			           	<td><input type="text" name="jysmcordm" /></td>
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
      </div>
	  <div role="tabpanel" class="tab-pane" id="content2">
		    <div class="butsea">
		      <div class="pull-left Pct35">
		            <button type="button" class="btn btn-info">保存</button>
		            <button type="button" class="btn btn-info">取消</button>      
		      </div>
		       <div class="pull-right Pct65">
		       <form class="form-horizontal" role="form">
		        <table  border="0" align="right" cellpadding="0" cellspacing="0"  >
		          <tr>
		            <td><label for="inputEmail3" class="control-label">名称：</label></td>
		            <td>
				      <select class="form-control">
						  <option>1</option>
						  <option>2</option>
						  <option>3</option>
						  <option>4</option>
						  <option>5</option>
						</select>            
		            </td>
		            <td><button type="button" class="btn btn-search">搜 索</button>  </td>
		          </tr>
		        </table>  
		        </form>     
		       </div> 
		    </div>
		    <div class="clr"></div>	 	  
         <table  class="addlist table-bordered mt10"  >
           <tr>
             <th>角色代码：</th>
             <td><input type="text" class="form-control"></td>
              <th>角色代码：</th>
             <td><input type="text" class="form-control"></td>            
           </tr>
           <tr>
             <th>角色名称：</th>
             <td><input type="text" class="form-control"></td>
             <th>角色名称：</th>
             <td><input type="text" class="form-control"></td>            
           </tr>
           <tr>
             <th>主页链接地址：</th>
             <td><input type="text" class="form-control"></td>
              <th>主页链接地址：</th>
             <td><input type="text" class="form-control"></td>            
           </tr>
           <tr>
             <th>可用否：</th>
             <td><select class="form-control"> </select></td>
             <th>是否通过：</th>
             <td> 
	             <input type="checkbox">
	                                    通过 
	             <input type="checkbox">
	                                   不通过
             </td>             
           </tr>
           <tr>
             <th>角色描述：</th>
             <td colspan="3"><textarea class="form-control" rows="3"></textarea></td>
           </tr>                                
         </table>
      </div> 
      <div role="tabpanel" class="tab-pane" id="content3">
         <table  class="addlist table-bordered mt10"  >
           <tr>
             <th>角色代码：</th>
             <td>2016001</td>
             <th>角色代码：</th>
             <td>2016001</td>            
           </tr>
           <tr>
             <th>角色名称：</th>
             <td>系统管理员></td>
             <th>角色名称：</th>
             <td>系统管理员</td>            
           </tr>
           <tr>
             <th>主页链接地址：</th>
             <td>commons/main/main_01</td>
              <th>主页链接地址：</th>
             <td>commons/main/main_01</td>            
           </tr>
           <tr>
             <th>可用否：</th>
             <td>可用</td>
             <th>是否通过：</th>
             <td>通过 </td>             
           </tr>
           <tr>
             <th>角色描述：</th>
             <td colspan="3">并联合使用 Bootstrap 预置的栅格类，可以将 label 标签和控件组水平并排布局。这样做将改变 .form-group 的行为，使其表现为栅格系统中的行（row），因此就无需再额外添加</td>
           </tr>                                
         </table>
         
         <table  class="addlist_center table-bordered mt10"  >
           <tr>
             <th>角色代码：</th>
             <td>2016001</td>
             <th>角色代码：</th>
             <td>2016001</td>            
           </tr>
           <tr>
             <th>角色名称：</th>
             <td>系统管理员></td>
             <th>角色名称：</th>
             <td>系统管理员</td>            
           </tr>
           <tr>
             <th>主页链接地址：</th>
             <td>commons/main/main_01</td>
              <th>主页链接地址：</th>
             <td>commons/main/main_01</td>            
           </tr>
           <tr>
             <th>可用否：</th>
             <td>可用</td>
             <th>是否通过：</th>
             <td>通过 </td>             
           </tr>
         </table> 
         
         <table  class="addlist_center table-bordered mt10"  >
          <thead>
           <tr>
             <th colspan="4">详细信息</th>          
           </tr>          
          </thead>
           <tr>
             <th>角色代码</th>
             <th>角色名称</th>
             <th>主页链接地址</th>
             <th>可用否</th>            
           </tr>
           <tr>
             <td>123123></td>
             <td>系统管理员</td>
             <td>commons/main/main_01</td>  
              <td>可用</td>         
           </tr>
            <tr>
             <td>123123></td>
             <td>系统管理员</td>
             <td>commons/main/main_01</td>  
              <td>可用</td>         
           </tr>          
         </table>          
                 
      </div>      
      <div role="tabpanel" class="tab-pane" id="content4">
		<div class="panel panel-default">
		  <div class="panel-heading" style="height:42px">
		   <span class="pull-left">院系名称</span>
		   <button class="btn btn-default  btn-xs pull-right" type="button">选择  </button>
          </div>
		  <div class="panel-body">
		     <button class="btn btn-primary btn-sm" type="button">
				  航天学院 <span class="glyphicon glyphicon-remove"></span>
			 </button>
		     <button class="btn btn-primary btn-sm" type="button">
				  管理学院 <span class="glyphicon glyphicon-remove"></span>
			 </button>			 
		  </div>
		</div>      
      
      </div>
	</div>
    <div class="clr"></div>
  </div>
</div>
 
 
<jsp:include page="/jsp/include/div-help-include.jsp"></jsp:include>
 
</body>
</html>

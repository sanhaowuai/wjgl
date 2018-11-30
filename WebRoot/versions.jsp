<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/6/19
  Time: 18:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <%
  String  version_codedesign ="";
          try{
              version_codedesign = com.incon.project.jsqlquery.base.Util.GlobalVariableUtil.class.getPackage().getImplementationVersion();
          }catch (Exception e){
              version_codedesign ="未安装";
          }
  String  version_gzl ="";
          try{
              version_gzl =  com.incon.pojo.common.gzlgwgl.GzlgwglEntity.class.getPackage().getImplementationVersion();
          }catch (Exception e){
              version_gzl ="未安装";
          }
      com.incon.framework.util.propertiesLoader  loader = new com.incon.framework.util.propertiesLoader();
      String frameworkversion = loader.getPropertyKey("/config/others/config.properties","system.frameworkversion");
      String projectversion = loader.getPropertyKey("/config/others/config.properties","system.projectversion");
  %>
  <table>
      <tr>
          <td  width="200">智能填报版本号:</td>
          <td><%=version_codedesign%></td>
      </tr>
      <tr>
          <td>工作流版本号:</td>
          <td><%=version_gzl%> </td>
      </tr>
      <tr>
          <td>数据库版本号:</td>
          <td>${applicationScope.XT_CSB_DBVERSION.CS1}</td>
      </tr>
      <tr>
          <td>框架数据库版本号:</td>
          <td>  ${applicationScope.XT_CSB_FRAMEWORKDB_VERSION.CS1}</td>
      </tr>
      <tr>
          <td>系统版本号:</td>
          <td><%=projectversion%></td>
      </tr>
      <tr>
          <td>框架版本号:</td>
          <td><%=frameworkversion%></td>
      </tr>
  </table>

</body>
</html>

prompt Importing table dm_qxb...
set feedback off
set define off
insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0401', '1 我的发起', '1310', '04', '#', 'incon', '0', null, '1', null, null, null, '2', 'glyphicon glyphicon-asterisk');

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0403', '1.2 审批结束', '1312', '04', '/workflow/procinst/procinstContent.jsp?queryValue=15,0,48', 'incon', '0', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0407', '2.2 待阅任务', '1316', '04', '/workflow/workitem/workitem.jsp?queryValue=6,0,6And14,0,0&category=bizworkitem', 'incon', '0', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0409', '2.4 已办任务合并', '1318', '04', '/workflow/workitem/workitemMerge.jsp?queryValue=6,0,48And14,0,1&category=bizworkitem', 'incon', '0', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('05', '工作流业务建模', '12', '-1', '#', 'incon', '0', null, '0', null, null, null, '2', 'fa fa-database');

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0502', '表单模板', '1211', '05', '/form_templet.do?method=formManager', 'incon', '0', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0503', '业务实体', '1212', '05', '/entity_templet.do?method=entityManager', 'incon', '0', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0504', '节点模板', '1213', '05', '/workflow/resource/resources/actTmp.jsp', 'incon', '0', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0507', 'web服务管理', '1216', '05', '/workflow/resource/resources/webServiceManager.jsp', 'incon', '0', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('06', '统计分析', '14', '-1', '#', 'incon', '0', null, '0', null, null, null, '2', 'fa fa-pie-chart');

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0603', '系统运行负载', '1412', '06', '/workflow/dashboard/workspace/systemWorkSpace.jsp', 'incon', '0', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0604', '统计指标管理', '1413', '06', '/workflow/dashboard/workspace/viewAllWorkSpace.jsp', 'incon', '0', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0701', '流程综合查询', '1510', '07', '/workflow/procinst/procinstContent-all.jsp?queryValue=15,0,63', 'incon', '0', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('04', '工作流业务中心', '13', '-1', '#', 'incon', '0', null, '0', null, null, null, '2', 'fa fa-newspaper-o');

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0801', '科研管理录入', '1610', '08', '/formParser?formid=b60ad63a-01fc-472b-b4ec-5336e8a9&status=select', 'incon', '0', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0116', '[超]异常任务', '1025', '01', '/exceptionTaskController/index/1', 'incon', '1', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0117', '[个]异常任务', '1026', '01', '/exceptionTaskController/index/2', 'incon', '1', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0118', '[超]垃圾数据清理', '1027', '01', '/dirtyDataTaskController/index/1', 'incon', '1', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0119', '[个] 垃圾数据清理', '1028', '01', '/dirtyDataTaskController/index/2', 'incon', '1', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('10', 'bootstrapdemo', '18', '-1', '#', 'incon', '1', null, '0', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0209', '班级管理', '1118', '02', '/bjgl/queryBjgl', 'incon', '1', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0301', '反馈处理', '1910', '03', '/xtfk/queryXtfk/1', 'incon', '1', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0302', '添加反馈', '1911', '03', '/xtfk/queryXtfk/2', 'incon', '1', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0201', ' 院系管理', '1110', '02', '/yxgl/queryYxgl', 'incon', '1', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0202', ' 专业管理', '1111', '02', '/zygl/queryZygl', 'incon', '1', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0203', ' 基础相关信息维护', '1112', '02', '/jcxgxxwh/main', 'incon', '1', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('01', '系统管理 ', '10', '-1', '#', 'incon', '1', null, '0', null, null, null, '2', 'glyphicon glyphicon-th-large');

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0101', ' 菜单管理 ', '1012', '01', '/qxcdgl/queryAllQxcdgl', 'incon', '1', null, '1', null, null, null, '2', 'glyphicon glyphicon-th-large');

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0102', ' 页面按钮管理', '1013', '01', '/ymqxgl/queryAnb', 'incon', '1', null, '1', null, null, null, '2', 'glyphicon glyphicon-send');

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0103', ' 角色管理', '1010', '01', '/juesgl/queryJs', 'incon', '1', null, '1', null, null, null, '2', 'glyphicon glyphicon-wrench');

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0104', ' 人员角色管理 ', '1011', '01', '/ryjs/ryjsQuery', 'incon', '1', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('02', ' 基础信息', '11', '-1', '#', 'incon', '1', null, '0', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0206', '院系专业关系', '1115', '02', '/yxzygl/queryYxZygl', 'incon', '1', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0207', '教师管理', '1116', '02', '/jsgl/queryJsgl', 'incon', '1', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0208', '学生管理', '1117', '02', '/xsgl/queryXsgl', 'incon', '1', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('03', ' 系统反馈', '19', '-1', '#', 'incon', '1', null, '0', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0107', '平台教师管理', '1016', '01', '/ptjsgl/queryJsgl', 'incon', '1', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0108', '平台学生管理', '1017', '01', '/ptxsgl/queryXsgl', 'incon', '1', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0109', '学校信息发布管理', '1018', '01', '/xxfbxx/queryXxfbgl', 'incon', '1', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0110', '学校信息发布查询全部', '1019', '01', '/xxfbxx/queryXXfbck', 'incon', '1', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0111', '学院信息发布管理', '1020', '01', '/bmxxgl/queryAllBmxx', 'incon', '1', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0112', '学院信息发布查询全部', '1021', '01', '/bmxxgl/queryBmxxcx', 'incon', '1', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0115', '人员磁盘空间例外表', '1024', '01', '/rycpckjlwb/queryRycpckjlwb', 'incon', '1', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0105', '日志管理', '1014', '01', '/rz/queryRz', 'incon', '1', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0106', '组件维护', '1015', '01', '/zjwh/queryZjwh', 'incon', '1', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0113', '子系统维护', '1022', '01', '/zxtwh/queryZxtwh', 'incon', '1', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0114', 'App菜单', '1023', '01', '/shoujcd/queryQxb', 'incon', '1', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0121', '[超]执行SQL任务', '1030', '01', '/executeSQLTaskController/index/1', 'incon', '1', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0402', '1.1  正在运行', '1311', '04', '/workflow/procinst/procinstContent.jsp?queryValue=15,0,15', 'incon', '0', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0406', '2.1 挂起任务', '1315', '04', '/workflow/workitem/workitem.jsp?queryValue=6,0,8And14,0,1&category=bizworkitem', 'incon', '0', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0408', '2.3 已阅任务', '1317', '04', '/workflow/workitem/workitem.jsp?queryValue=6,0,48And14,0,0&category=bizworkitem', 'incon', '0', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0410', '2.5 我委托的任务', '1319', '04', '/workflow/setting/agentmange/myAgent.jsp', 'incon', '0', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0411', '2.6 待办任务', '1320', '04', '/workflow/workitem/workitem.jsp?queryValue=6,0,6And14,0,1&category=bizworkitem', 'incon', '0', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0501', '流程模板', '1210', '05', '/workflow/resource/resources/procTmp.jsp', 'incon', '0', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0602', '团队工作效率', '1411', '06', '/workflow/dashboard/workspace/orgWorkSpace.jsp', 'incon', '0', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0704', '已经办理', '1513', '07', '/workflow/procinst/procinstContent.jsp?queryValue=15,0,48', 'incon', '0', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0404', '1.3 我参与的流程', '1313', '04', '/workflow/procinst/involvedProcinstContent.jsp?queryValue=15,0,63', 'incon', '0', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0405', '2 任务办理', '1314', '04', '#', 'incon', '0', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0412', '2.7 已办任务', '1321', '04', '/workflow/workitem/workitem.jsp?queryValue=6,0,48And14,0,1&category=bizworkitem', 'incon', '0', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0505', '应用程序', '1214', '05', '/workflow/resource/resources/application.jsp', 'incon', '0', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0506', '预置资产', '1215', '05', '/preset_templet.do?method=presetManager', 'incon', '0', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0508', '业务报表', '1217', '05', '/workflow/datalist/datalistmanagerNew.jsp', 'incon', '0', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0601', '个人工作效率', '1410', '06', '/workflow/dashboard/workspace/personWorkSpace.jsp', 'incon', '0', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('07', '工作流流程监控', '15', '-1', '#', 'incon', '0', null, '0', null, null, null, '2', 'glyphicon glyphicon-globe');

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0702', '任务综合查询', '1511', '07', '/workflow/workitem/workitemall.jsp?queryValue=6,0,62', 'incon', '0', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0703', '正在办理', '1512', '07', '/workflow/procinst/procinstContent.jsp?queryValue=15,0,15', 'incon', '0', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('08', '科研管理', '16', '-1', '#', 'incon', '0', null, '0', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0120', '消息管理', '1029', '01', '/xxtc/queryXxtc', 'incon', '1', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0122', '[个]执行SQL任务', '1031', '01', '/executeSQLTaskController/index/2', 'incon', '1', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('1001', '字体图标', '1810', '10', '//jsp/commons/bootstrapdemo/Fontawesome.jsp', 'incon', '1', null, '1', null, null, null, '2', null);

insert into dm_qxb (QXDM, QXMC, XSSX, FQXDM, FWLJ, XTDM, KYF, BZ, SFZXJ, TCFS, SFNWW, FWXTDM, YHLX, ICON)
values ('0123', '代码维护', '1032', '01', '/dmwh/queryDmwh', 'incon', '1', null, '1', null, null, null, '2', null);

prompt Done.

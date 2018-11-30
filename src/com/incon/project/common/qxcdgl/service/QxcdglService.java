package com.incon.project.common.qxcdgl.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.HelpbEntity;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.JsqxbEntity;
import com.incon.pojo.common.QxEntity;
import com.incon.pojo.common.RyjsqxbEntity;

/**
 * 
 * @类名：  com.incon.project.common.qxcdgl.service.QxcdglService
 * @创建人：樊旭
 * @日期： 2013-3-11
 * @修改人：
 * @日期：
 * @描述：  
 * @版本号：
 */
@SuppressWarnings("all")
public interface QxcdglService extends CommService {
	//查询所有菜单
	public List<QxEntity> queryAll(String cxjsdm);
	//查询菜单名称
	public List<QxEntity> queryQxcdgl();
	//添加权限菜单
	public QxEntity addQxcd(QxEntity qxcdglEntity);
	//查询所有角色
	public List<JsbEntity> queryJs(String qxdm);
	//为角色添加权限前，判断此角色中是否存在此权限的父类权限，如果没有，那么添加父类权限
	public void queryFcd(JsqxbEntity jsqxbEntity);
	//添加角色权限表
	public JsqxbEntity addJsqx(List<JsqxbEntity> list);
	//为人员角色添加权限前，判断此人员是否存在此权限的父类权限，如果没有，那么添加父类权限
	public void queryFryjs(RyjsqxbEntity ryjsqxbEntity);
	//添加人员角色权限表
	public RyjsqxbEntity addRyjsqxb(List<RyjsqxbEntity> list);
	//根据权限代码查询权限
	public QxEntity queryByQxdm(String zhi);
	//根据权限代码修改权限
	public void updQxcd(QxEntity qxEntity);
	//删除权限菜单
	public void delQx(String qxdm);
	//改变显示顺序
	public void updXssx(QxEntity qxEntity);
	//修改菜单时，判断访问路径是否存在
	public Integer pdUpdFwlj(Map map);
	// 添加菜单时，判断访问路径是否存在
	public Integer pdAddFwlj(Map map);
	public ArrayList<HelpbEntity> excelDcsj();
	public void delHelp();
	public void addHelp(HelpbEntity t);
	// 根据qxdm删除角色权限
	public void delJsqxByQxdm(Map<String, String> czmap);
	//查询功能列表
	public List queryGnList();
	public List queryHngnList();
}

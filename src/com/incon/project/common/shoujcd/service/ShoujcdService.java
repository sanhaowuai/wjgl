package com.incon.project.common.shoujcd.service;

import java.util.List;
import java.util.Map;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.RzEntity;
import com.incon.pojo.common.ZxtbEntity;
import com.incon.pojo.common.shoujcd.PtappqxbEntity;

/**
 * 
 * @类名：  com.incon.project.common.shoujcd.service
 * @创建人：赵玥
 * @日期： 2016-09-01
 * @修改人：
 * @日期：
 * @描述：  手机菜单授权
 * @版本号：
 */
@SuppressWarnings("all")
public interface ShoujcdService extends CommService {
	
	//添加
	public void addQxb(PtappqxbEntity entity);
	
	//修改
	public void updQxb(PtappqxbEntity entity);
	
	//删除
	public void delQxb(String [] ids);
	
	//查询一个
	public PtappqxbEntity queryByIdQxb(String qxdm);
	
	//查询是否重复
	public Integer queryByIdQxbCount(String qxdm);
	//查询子系统代码
	public List<Map<String, String>>  queryByZxt();
	
	// 查询手机子系统
	public List<ZxtbEntity> querySjZxtList();
	
	// 查询手机菜单
	public List<PtappqxbEntity> querySjcdList(PtappqxbEntity param);
	
	// 添加app授权
	public void addAppsq(String[] qxdm, PtappqxbEntity entity);
}

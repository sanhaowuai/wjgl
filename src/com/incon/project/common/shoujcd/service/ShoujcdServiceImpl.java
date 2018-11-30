package com.incon.project.common.shoujcd.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.JsqxbEntity;
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
@Service(value= "shoujcdService")
public class ShoujcdServiceImpl extends CommServiceImpl implements ShoujcdService {

	@Override
	@MethodLog(description="增加权限菜单")
	@Transactional
	public void addQxb(PtappqxbEntity entity) {
		// TODO Auto-generated method stub
		dbDao.insert("shoujcd.addQxb", entity);
	}
	@Transactional
	@MethodLog(description="删除菜单权限")
	@Override
	public void delQxb(String[] ids) {
		// TODO Auto-generated method stub
		dbDao.executeBatchOperation("shoujcd.delQxb", Arrays.asList(ids), "delete");
	}

	@Override
	public PtappqxbEntity queryByIdQxb(String qxdm) {
		// TODO Auto-generated method stub
		return (PtappqxbEntity) dbDao.queryForObject("shoujcd.queryByIdQxb", qxdm);
	}

	@Override
	public Integer queryByIdQxbCount(String qxdm) {
		// TODO Auto-generated method stub
		return (Integer) dbDao.queryForObject("shoujcd.queryByIdQxbCount", qxdm);
	}

	@Override
	public List<Map<String, String>> queryByZxt() {
		// TODO Auto-generated method stub
		return dbDao.query("shoujcd.queryByZxt");
	}

	@Override
	@MethodLog(description="修改权限菜单")
	@Transactional
	public void updQxb(PtappqxbEntity entity) {
		// TODO Auto-generated method stub
		dbDao.update("shoujcd.updQxb", entity);
	}
	@Override
	public List<ZxtbEntity> querySjZxtList() {
		return dbDao.query("shoujcd.querySjZxtList");
	}
	@Override
	public List<PtappqxbEntity> querySjcdList(PtappqxbEntity param) {
		return  dbDao.query("shoujcd.querySjcdList", param);
	}
	@MethodLog(description = "添加app角色授权")
	@Transactional
	@Override
	public void addAppsq(String[] qxdm, PtappqxbEntity ptappqxbEntity) {
		List<JsqxbEntity> list = new ArrayList<JsqxbEntity>();
		for (int i = 0; i < qxdm.length; i++) {
			JsqxbEntity entity = new JsqxbEntity();
			entity.setJsdm(ptappqxbEntity.getJsdm());
			entity.setQxdm(qxdm[i]);
			list.add(entity);
		}
		dbDao.delete("shoujcd.delAppjssqByJsdm", ptappqxbEntity);
		dbDao.executeBatchOperation("shoujcd.addAppjssq", list, "insert");
	}
	
	

}

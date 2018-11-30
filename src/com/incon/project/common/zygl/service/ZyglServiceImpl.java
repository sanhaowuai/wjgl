package com.incon.project.common.zygl.service;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.YxdmbEntity;
import com.incon.pojo.common.ZybEntity;

/**
 * 
 * @类名：  com.incon.project.common.zygl.service.ZyglServiceImpl
 * @修改人：
 * @日期：
 * @描述：  
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value= "zyglService")
public class ZyglServiceImpl extends CommServiceImpl implements ZyglService{

	//新增专业
	@Override
	@MethodLog(description="增加专业")
	@Transactional
	public void addZy(ZybEntity zybEntity) {
		dbDao.insert("zygl.addZy", zybEntity);
	}

	//查询一个专业
	@Override
	public Map queryOneZy(String zydm) {
		return (Map)dbDao.queryForObject("zygl.queryOneZy", zydm);
	}

	//修改院系
	@Override
	@MethodLog(description="修改专业")
	@Transactional
	public void updZy(ZybEntity zybEntity) {
		dbDao.update("zygl.updZy", zybEntity);
		
	}

	//删除专业
	@Override
	@Transactional
	@MethodLog(description="删除专业")
	public void delZy(String[] ids){
		dbDao.executeBatchOperation("zygl.delZy", Arrays.asList(ids), "delete");
	}
	
	//查询zydm是否重复
	@Override
	public Integer queryByZydmCount(String zydm){
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("zygl.queryByZydmCount", zydm)));
	}
	//查询院
	@Override
	public List<Map> querySsyxList() {
		return dbDao.query("zygl.querySsyx");
	}

	//专业
	
	@Override
	public List<Map> querySszyList(String ssy) {
		return dbDao.query("zygl.querySszy",ssy);
	}
	
	//系
	@Override
	public List<Map> querySsxList(String ssy) {
		return dbDao.query("zygl.querySsx",ssy);
	}
}

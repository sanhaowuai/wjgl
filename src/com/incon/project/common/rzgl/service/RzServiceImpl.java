package com.incon.project.common.rzgl.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.RzEntity;
/**
 * 
 * @类名：  com.incon.project.common.rzgl.service.RzServiceImpl
 * @创建人： 樊旭	
 * @日期： 2013-03-11
 * @修改人：
 * @日期：
 * @描述：  记录日志
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value= "rzService")
public class RzServiceImpl extends CommServiceImpl implements RzService {
	
	//保存日志
	@Override
	public void save(RzEntity rzEntity) {
		dbDao.insert("rz.save",rzEntity);
	}
	
	//查询操作人角色
	@Override
	public String queryJsmc(Integer jsdm){
		return (String) dbDao.queryForObject("rz.query",jsdm);
	}

	@Override
	public List<JsbEntity> queryJsmc() {
		// TODO Auto-generated method stub
		return dbDao.query("rz.queryJsmc");
	}

}

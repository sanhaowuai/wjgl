package com.incon.project.common.rycpckjlwb.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.rycpckjlwb.RycpckjlwbEntity;

@Service(value="rycpckjlwbService")
@SuppressWarnings("all")
public class RycpckjlwbServiceImpl extends CommServiceImpl implements
		RycpckjlwbService {

	@MethodLog(description="添加人员磁盘空间例外表")
	@Transactional
	@Override
	public void addRycpckjlwb(RycpckjlwbEntity entity) {
		// TODO Auto-generated method stub
		dbDao.insert("rycpckjlwb.addRycpckjlwb", entity);
	}
	@MethodLog(description="删除人员磁盘空间例外表")
	@Transactional
	@Override
	public void delRycpckjlwb(String yhdm,String yylx) {
		// TODO Auto-generated method stub
		Map map=new HashMap();
		map.put("yhdm", yhdm);
		map.put("yylx", yylx);
		dbDao.delete("rycpckjlwb.delRycpckjlwb", map);
	}

	@Override
	public RycpckjlwbEntity queryRycpckjlwbOne(String yhdm,String yylx) {
		// TODO Auto-generated method stub
		Map map=new HashMap();
		map.put("yhdm", yhdm);
		map.put("yylx", yylx);
		return (RycpckjlwbEntity)dbDao.queryForObject("rycpckjlwb.queryRycpckjlwbOne", map);
	}

	@MethodLog(description="修改人员磁盘空间例外表")
	@Transactional
	@Override
	public void updRycpckjlwb(RycpckjlwbEntity entity) {
		// TODO Auto-generated method stub
		dbDao.update("rycpckjlwb.updRycpckjlwb", entity);
	}
	@Override
	public int isExFAdd(RycpckjlwbEntity entity) {
		// TODO Auto-generated method stub
		return (Integer) dbDao.queryForObject("rycpckjlwb.isExFAdd", entity);
	}

}

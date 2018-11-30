package com.incon.project.common.xxtc.service;

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
import com.incon.pojo.common.xxtc.XxtcbEntity;

/**
 * 
 * 赵玥
 * 2016-11-10
 * 消息弹出表
 */
@SuppressWarnings("all")
@Service(value= "xxtcService")
public class XxtcServiceImpl extends CommServiceImpl implements XxtcService{

	@Override
	public void addXxtc(XxtcbEntity entity) {
		// TODO Auto-generated method stub
		dbDao.insert("xxtc.addXxtc", entity);
	}

	@Override
	public void delXxtc(String []ids) {
		// TODO Auto-generated method stub
		dbDao.executeBatchOperation("xxtc.delXxtc", Arrays.asList(ids), "delete");
	}

	@Override
	public String queryOnePt(String dldm) {
		// TODO Auto-generated method stub
		return (String) dbDao.queryForObject("xxtc.queryOnePt", dldm);
	}

	@Override
	public XxtcbEntity queryOneXxtc(String id) {
		// TODO Auto-generated method stub
		return (XxtcbEntity) dbDao.queryForObject("xxtc.queryOneXxtc", id);
	}

	@Override
	public void updPtid(Map<String, String> map) {
		// TODO Auto-generated method stub
		dbDao.update("xxtc.updPtid", map);
	}

	@Override
	public void updXxtc(XxtcbEntity entity) {
		// TODO Auto-generated method stub
		dbDao.update("xxtc.updXxtc", entity);
	}

	@Override
	public String querySfyd() {
		// TODO Auto-generated method stub
		return (String) dbDao.queryForObject("xxtc.querySfyd", null);
	}

	@Override
	public void updNotInId(String id) {
		// TODO Auto-generated method stub
		dbDao.update("xxtc.updNotInId", id);
	}

	@Override
	public List<XxtcbEntity> queryXxtcMain01() {
		// TODO Auto-generated method stub
		return dbDao.query("xxtc.queryXxtcMain01");
	}

	@Override
	public XxtcbEntity queryByIdNr(String id) {
		// TODO Auto-generated method stub
		return (XxtcbEntity) dbDao.queryForObject("xxtc.queryByIdNr", id);
	}

	 
}

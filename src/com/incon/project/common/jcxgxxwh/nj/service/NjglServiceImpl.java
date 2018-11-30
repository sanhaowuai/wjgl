package com.incon.project.common.jcxgxxwh.nj.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.jcxgxxwh.NjbEntity;


/**
 * 
 * @类名：  com.incon.project.common.jcxxwh.nj.service.NjglServiceImpl
 * @创建人： 杨文龙
 * @日期： 2014-4-1
 * @修改人：
 * @日期：
 * @描述：年级管理接口的实现类  
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value="njglService")
public class NjglServiceImpl extends CommServiceImpl implements NjglService{

	//增加年级
	@Override
	@MethodLog(description="增加年级")
	public void addNj(NjbEntity njbEntity) {
		dbDao.insert("njgl.addNj", njbEntity);

	}
	
	//判断年级是否被使用
	@Override
	public String queryExit(String ids){
		Integer j = 0;
		String mc = "";
		String[] id = ids.split(",");
		for (int i = 0; i < id.length; i++) {
			j = j + (Integer) dbDao.queryForObject("njgl.queryExit",id[i]);
			if(j>0){
				String nj = id[i];
				NjbEntity njbEntity =(NjbEntity) dbDao.queryForObject("njgl.queryNjByDm", nj);
				mc += njbEntity.getNjmc() + " ";
				j=0;
			}
		}
		return mc;
	}
	
	//删除年级
	@Transactional
	@Override
	@MethodLog(description="删除年级")
	public void delNj(String[] ids) {
		dbDao.executeBatchOperation("njgl.delNj", Arrays.asList(ids), "delete");

	}
	//查询代码是否重复
	@Override
	public Integer queryByDmCount(String nj) {
		
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("njgl.queryByDmCount", nj)));
	}
	//查询年级列表
	@Override
	public List<NjbEntity> queryNjList() {
		
		return dbDao.query("njgl.queryNjList");
	}
	//修改年级
	@Override
	@MethodLog(description="根据代码修改年级")
	public void updNj(NjbEntity njbEntity) {
		dbDao.update("njgl.updNj", njbEntity);

	}
	//根据代码查询年级
	@Override
	public NjbEntity queryNjByDm(String nj) {
		
		return (NjbEntity) dbDao.queryForObject("njgl.queryNjByDm", nj);
	}

}

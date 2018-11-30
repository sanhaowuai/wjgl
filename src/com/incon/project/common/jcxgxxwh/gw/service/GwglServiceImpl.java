package com.incon.project.common.jcxgxxwh.gw.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.jcxgxxwh.GwbEntity;
import com.incon.pojo.common.jcxgxxwh.GwlxbEntity;



/**
 * 
 * @类名：  com.incon.project.common.jcxxwh.gw.service.GwglServiceImpl
 * @创建人： 杨文龙
 * @日期： 2014-4-1
 * @修改人：
 * @日期：
 * @描述：岗位接口的实现类  
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value="gwglService")
public class GwglServiceImpl extends CommServiceImpl implements GwglService{
	
	//查询所有岗位类型
	public List<GwlxbEntity> queryGwlx(){
		return dbDao.query("gwgl.queryGwlx");
	}
	
	//增加岗位
	@Override
	@MethodLog(description="增加专业类别")
	public void addGw(GwbEntity gwbEntity) {
		dbDao.insert("gwgl.addGw", gwbEntity);

	}
	//删除岗位
	@Transactional
	@Override
	@MethodLog(description="删除专业类别")
	public void delGw(String[] ids) {
		dbDao.executeBatchOperation("gwgl.delGw", Arrays.asList(ids), "delete");

	}
	//查询代码是否重复
	@Override
	public Integer queryByDmCount(String dm) {
		
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("gwgl.queryByDmCount", dm)));
	}
	//查询岗位列表
	@Override
	public List<GwbEntity> queryGwList() {
		
		return dbDao.query("gwgl.queryGwList");
	}
	//修改岗位
	@Override
	@MethodLog(description="根据代码修改岗位")
	public void updGw(GwbEntity gwbEntity) {
		dbDao.update("gwgl.updGw", gwbEntity);

	}
	//根据代码查询岗位
	@Override
	public GwbEntity queryGwByDm(String dm) {
		
		return (GwbEntity) dbDao.queryForObject("gwgl.queryGwByDm", dm);
	}

}

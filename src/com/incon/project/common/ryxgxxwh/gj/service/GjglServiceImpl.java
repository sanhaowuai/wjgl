package com.incon.project.common.ryxgxxwh.gj.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.ryxgxxwh.GjbEntity;



/**
 * 
 * @类名：  com.incon.project.common.ryxgxxwh..gj.service.GjglServiceImpl
 * @创建人： 杨文龙
 * @日期： 2014-4-1
 * @修改人：
 * @日期：
 * @描述：国籍管理实现类  
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value="gjglService")
public class GjglServiceImpl extends CommServiceImpl implements GjglService{

	//增加国籍
	@Override
	@MethodLog(description="增加国籍")
	public void addGj(GjbEntity gjbEntity) {
		dbDao.insert("gjgl.addGj", gjbEntity);

	}
	//删除国籍
	@Transactional
	@Override
	@MethodLog(description="删除国籍")
	public void delGj(String[] ids) {
		dbDao.executeBatchOperation("gjgl.delGj", Arrays.asList(ids), "delete");

	}
	//查询代码是否重复
	@Override
	public Integer queryByDmCount(String dm) {
		
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("gjgl.queryByDmCount", dm)));
	}
	//查询国籍列表
	@Override
	public List<GjbEntity> queryGjglList() {
		
		return dbDao.query("gjgl.queryGjglList");
	}
	//修改国籍
	@Override
	@MethodLog(description="根据代码修改国籍")
	public void updGj(GjbEntity gjbEntity) {
		dbDao.update("gjgl.updGj", gjbEntity);

	}
	//根据代码查询国籍
	@Override
	public GjbEntity queryGjByDm(String dm) {
		
		return (GjbEntity) dbDao.queryForObject("gjgl.queryGjByDm", dm);
	}
}

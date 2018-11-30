package com.incon.project.common.jcxgxxwh.dq.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.jcxgxxwh.DqbEntity;


/**
 * 
 * @类名：  com.incon.project.common.jcxxwh.dq.service.DqglServiceImpl
 * @创建人： 杨文龙
 * @日期： 2014-4-2
 * @修改人：
 * @日期：
 * @描述：地区接口的实现类  
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value="dqglService")
public class DqglServiceImpl extends CommServiceImpl implements DqglService{

	//增加地区
	@Override
	@MethodLog(description="增加地区")
	public void addDq(DqbEntity dqbEntity) {
		dbDao.insert("dqgl.addDq", dqbEntity);

	}
	//删除地区
	@Transactional
	@Override
	@MethodLog(description="删除地区")
	public void delDq(String[] ids) {
		dbDao.executeBatchOperation("dqgl.delDq", Arrays.asList(ids), "delete");

	}
	//查询代码是否重复
	@Override
	public Integer queryByDmCount(String dm) {
		
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("dqgl.queryByDmCount", dm)));
	}
	//查询地区列表
	@Override
	public List<DqbEntity> queryDqList() {
		
		return dbDao.query("dqgl.queryDqList");
	}
	//修改地区
	@Override
	@MethodLog(description="根据代码修改地区")
	public void updDq(DqbEntity dqbEntity) {
		dbDao.update("dqgl.updDq", dqbEntity);

	}
	//根据代码查询地区
	@Override
	public DqbEntity queryDqByDm(String dm) {
		
		return (DqbEntity) dbDao.queryForObject("dqgl.queryDqByDm", dm);
	}
}

package com.incon.project.common.jcxgxxwh.rxlx.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.jcxgxxwh.RxlxbEntity;

/**
 * 
 * @类名：  com.incon.project.common.jcxgxxwh.rxlx.service.RxlxglServiceImpl
 * @创建人： 杨文龙
 * @日期： 2014-4-1
 * @修改人：
 * @日期：
 * @描述：  
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value="rxlxglService")
public class RxlxglServiceImpl extends CommServiceImpl implements RxlxglService{

	//增加入校类型
	@Override
	@MethodLog(description="增加入校类型")
	public void addRxlx(RxlxbEntity rxlxbEntity) {
		dbDao.insert("rxlxgl.addRxlx", rxlxbEntity);

	}
	//删除专业类别
	@Transactional
	@Override
	@MethodLog(description="删除专业类别")
	public void delRxlx(String[] ids) {
		dbDao.executeBatchOperation("rxlxgl.delRxlx", Arrays.asList(ids), "delete");

	}
	//查询代码是否重复
	@Override
	public Integer queryByDmCount(String dm) {
		
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("rxlxgl.queryByDmCount", dm)));
	}
	//查询专业类别列表
	@Override
	public List<RxlxbEntity> queryRxlxList() {
		
		return dbDao.query("rxlxgl.queryRxlxList");
	}
	//修改专业类别
	@Override
	@MethodLog(description="根据代码修改入校类型")
	public void updRxlx(RxlxbEntity rxlxbEntity) {
		dbDao.update("rxlxgl.updRxlx", rxlxbEntity);

	}
	//根据代码查询专业类别
	@Override
	public RxlxbEntity queryRxlxByDm(String dm) {
		
		return (RxlxbEntity) dbDao.queryForObject("rxlxgl.queryRxlxByDm", dm);
	}
}

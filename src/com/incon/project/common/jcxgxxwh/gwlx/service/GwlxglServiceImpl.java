package com.incon.project.common.jcxgxxwh.gwlx.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.jcxgxxwh.GwlxbEntity;



/**
 * 
 * @类名：  com.incon.project.common.jcxgxxwh.gwlx.service.GwlxglServiceImpl
 * @创建人： 杨文龙
 * @日期： 2014-4-1
 * @修改人：
 * @日期：
 * @描述：岗位类型接口的实现类  
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value="gwlxglService")
public class GwlxglServiceImpl extends CommServiceImpl implements GwlxglService{

	//增加岗位类型
	@Override
	@MethodLog(description="增加岗位类型")
	public void addGwlx(GwlxbEntity gwlxbEntity) {
		dbDao.insert("gwlxgl.addGwlx", gwlxbEntity);

	}
	
	//判断岗位类型是否被使用
	@Override
	public String queryExit(String ids){
		Integer j = 0;
		String mc = "";
		String[] id = ids.split(",");
		for (int i = 0; i < id.length; i++) {
			j = j + (Integer) dbDao.queryForObject("gwlxgl.queryExit",id[i]);
			if(j>0){
				String dm = id[i];
				GwlxbEntity gwlxbEntity =(GwlxbEntity)dbDao.queryForObject("gwlxgl.queryGwlxByDm",dm);
				mc += gwlxbEntity.getMc() + " ";
				j=0;
			}
		}
		return mc;
	}
	
	//删除岗位类型
	@Transactional
	@Override
	@MethodLog(description="删除岗位类型")
	public void delGwlx(String[] ids) {
		dbDao.executeBatchOperation("gwlxgl.delGwlx", Arrays.asList(ids), "delete");

	}
	//查询代码是否重复
	@Override
	public Integer queryByDmCount(String dm) {
		
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("gwlxgl.queryByDmCount", dm)));
	}
	//查询岗位类型列表
	@Override
	public List<GwlxbEntity> queryGwlxList() {
		
		return dbDao.query("gwlxgl.queryGwlxList");
	}
	//修改岗位类型
	@Override
	@MethodLog(description="根据代码修改岗位类型")
	public void updGwlx(GwlxbEntity gwlxbEntity) {
		dbDao.update("gwlxgl.updGwlx", gwlxbEntity);

	}
	//根据代码查询岗位类型
	@Override
	public GwlxbEntity queryGwlxByDm(String dm) {
		
		return (GwlxbEntity) dbDao.queryForObject("gwlxgl.queryGwlxByDm", dm);
	}
}

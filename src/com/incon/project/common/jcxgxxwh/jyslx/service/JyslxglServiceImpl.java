package com.incon.project.common.jcxgxxwh.jyslx.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.jcxgxxwh.JyslxbEntity;



/**
 * 
 * @类名：  com.incon.project.common.jcxxwh.zylb.service.ZylbglServiceImpl
 * @创建人： 杨文龙
 * @日期： 2014-4-1
 * @修改人：
 * @日期：
 * @描述：教研室类型接口的实现类  
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value="jyslxglService")
public class JyslxglServiceImpl extends CommServiceImpl implements JyslxglService{

	//增加教研室类型
	@Override
	@MethodLog(description="增加教研室类型")
	public void addJyslx(JyslxbEntity jyslxbEntity) {
		dbDao.insert("jyslxgl.addJyslx", jyslxbEntity);

	}
	
	//判断教研室类型是否被使用
	@Override
	public String queryExit(String ids){
		Integer j = 0;
		String mc = "";
		String[] id = ids.split(",");
		for (int i = 0; i < id.length; i++) {
			j = j + (Integer) dbDao.queryForObject("jyslxgl.queryExit",id[i]);
			if(j>0){
				String dm = id[i];
				JyslxbEntity jyslxbEntity =(JyslxbEntity) dbDao.queryForObject("jyslxgl.queryJyslxByDm", dm);
				mc += jyslxbEntity.getMc() + " ";
				j=0;
			}
		}
		return mc;
	}
	
	//删除教研室类型
	@Transactional
	@Override
	@MethodLog(description="删除教研室类型")
	public void delJyslx(String[] ids) {
		dbDao.executeBatchOperation("jyslxgl.delJyslx", Arrays.asList(ids), "delete");

	}
	//查询代码是否重复
	@Override
	public Integer queryByDmCount(String dm) {
		
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("jyslxgl.queryByDmCount", dm)));
	}
	//查询教研室类型列表
	@Override
	public List<JyslxbEntity> queryJyslxList() {
		
		return dbDao.query("jyslxgl.queryJyslxList");
	}
	//修改教研室类型
	@Override
	@MethodLog(description="根据代码修改教研室类型")
	public void updJyslx(JyslxbEntity jyslxbEntity) {
		dbDao.update("jyslxgl.updJyslx", jyslxbEntity);

	}
	//根据代码查询教研室类型
	@Override
	public JyslxbEntity queryJyslxByDm(String dm) {
		
		return (JyslxbEntity) dbDao.queryForObject("jyslxgl.queryJyslxByDm", dm);
	}
}

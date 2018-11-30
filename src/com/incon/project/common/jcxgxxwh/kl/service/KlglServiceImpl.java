package com.incon.project.common.jcxgxxwh.kl.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.jcxgxxwh.KlbEntity;


/**
 * 
 * @类名：  com.incon.project.common.jcxxwh.zylb.service.ZylbglServiceImpl
 * @创建人： 杨文龙
 * @日期： 2014-4-1
 * @修改人：
 * @日期：
 * @描述：科类的实现类  
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value="klglService")
public class KlglServiceImpl extends CommServiceImpl implements KlglService{

	//增加科类
	@Override
	@MethodLog(description="增加科类")
	public void addKl(KlbEntity klbEntity) {
		dbDao.insert("klgl.addKl", klbEntity);

	}
	//删除科类
	@Transactional
	@Override
	@MethodLog(description="删除科类")
	public void delKl(String[] ids) {
		dbDao.executeBatchOperation("klgl.delKl", Arrays.asList(ids), "delete");

	}
	//查询代码是否重复
	@Override
	public Integer queryByDmCount(String dm) {
		
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("klgl.queryByDmCount", dm)));
	}
	//查询科类列表
	@Override
	public List<KlbEntity> queryKlList() {
		
		return dbDao.query("klgl.queryKlList");
	}
	//修改科类
	@Override
	@MethodLog(description="根据代码修改科类")
	public void updKl(KlbEntity klbEntity) {
		dbDao.update("klgl.updKl", klbEntity);

	}
	//根据代码查询科类
	@Override
	public KlbEntity queryKlByDm(String dm) {
		
		return (KlbEntity) dbDao.queryForObject("klgl.queryKlByDm", dm);
	}
}

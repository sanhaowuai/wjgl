package com.incon.project.common.ryxgxxwh.ryflb.service;

import java.util.Arrays;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.ryxgxxwh.RyflbEntity;

/**
 * @类名：com.incon.project.common.ryxgxxwh.ryflb.service.RyflbServiceImpl
 * @作者：马爽
 * @时间：2014-4-1
 * @版本：
 * @描述：人员分类表管理接口实现类
 * @修改人员：
 * @修改时间：2014-4-1
 * @修改说明：
 */
@SuppressWarnings("all")
@Service(value= "ryflbService")
public class RyflbServiceImpl extends CommServiceImpl implements RyflbService {

	//增加人员分类
	@Override
	@MethodLog(description="增加人员分类")
	public void addRyfl(RyflbEntity ryflbEntity) {
		dbDao.insert("ryflbgl.addRyfl", ryflbEntity);
	}

	//删除人员分类
	@Transactional
	@Override
	@MethodLog(description="删除人员分类")
	public void delRyfl(String[] ids) {
		dbDao.executeBatchOperation("ryflbgl.delRyfl", Arrays.asList(ids), "delete");	
	}
	//查询代码是否重复
	@Override
	public Integer queryByDmCount(String dm) {
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("ryflbgl.queryByDmCount", dm)));
	}

	//查询一条籍贯
	@Override
	public RyflbEntity queryRyflByDm(String dm) {
		return (RyflbEntity)dbDao.queryForObject("ryflbgl.queryRyflByDm", dm);
	}

	//修改人员分类
	@Override
	@MethodLog(description="修改人员分类")
	public void updRyflByDm(RyflbEntity ryflbEntity) {
		dbDao.update("ryflbgl.updRyflByDm",ryflbEntity);
	}

}

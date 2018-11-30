package com.incon.project.common.ryxgxxwh.zcb.service;

import java.util.Arrays;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.ryxgxxwh.ZcbEntity;

/**
 * @类名：com.incon.project.common.ryxgxxwh.zcb.service.ZcbServiceImpl
 * @作者：马爽
 * @时间：2014-4-1
 * @版本：
 * @描述：职称表管理接口实现类
 * @修改人员：
 * @修改时间：2014-4-1
 * @修改说明：
 */
@SuppressWarnings("all")
@Service(value= "zcbService")
public class ZcbServiceImpl extends CommServiceImpl implements ZcbService {

	//增加职称
	@Override
	@MethodLog(description="增加职称")
	public void addZc(ZcbEntity zcbEntity) {
		dbDao.insert("zcbgl.addZc", zcbEntity);	
	}

	//删除职称
	@Override
	@Transactional
	@MethodLog(description="删除职称")
	public void delZc(String[] ids) {
		dbDao.executeBatchOperation("zcbgl.delZc", Arrays.asList(ids), "delete");	
	}
	//查询代码是否重复
	@Override
	public Integer queryByDmCount(String dm) {
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("zcbgl.queryByDmCount", dm)));
	}
	//查询一条职称
	@Override
	public ZcbEntity queryZcByDm(String dm) {
		return (ZcbEntity)dbDao.queryForObject("zcbgl.queryZcByDm", dm);
	}
	//修改职称
	@Override
	@MethodLog(description="修改职称")
	public void updZcByDm(ZcbEntity zcbEntity) {
		dbDao.update("zcbgl.updZcByDm",zcbEntity);
	}

	
}

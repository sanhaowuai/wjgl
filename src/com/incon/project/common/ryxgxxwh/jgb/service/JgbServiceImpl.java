package com.incon.project.common.ryxgxxwh.jgb.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.page.Page;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.ryxgxxwh.JgbEntity;

/**
 * @类名：com.incon.project.common.ryxgxxwh.jgb.service.JgbServiceImpl
 * @作者：马爽
 * @时间：2014-4-1
 * @版本：
 * @描述：籍贯表管理接口实现类
 * @修改人员：
 * @修改时间：2014-4-1
 * @修改说明：
 */
@SuppressWarnings("all")
@Service(value= "jgbService")
public class JgbServiceImpl extends CommServiceImpl implements JgbService {

	//增加籍贯
	@Override
	@MethodLog(description="增加籍贯")
	public void addJg(JgbEntity jgbEntity) {
		dbDao.insert("jgbgl.addJg", jgbEntity);	
	}

	//删除籍贯
	@Override
	@Transactional
	@MethodLog(description="删除籍贯")
	public void delJg(String[] ids) {
		dbDao.executeBatchOperation("jgbgl.delJg", Arrays.asList(ids), "delete");	
	}
	//查询代码是否重复
	@Override
	public Integer queryByDmCount(String dm) {
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("jgbgl.queryByDmCount", dm)));
	}
	//查询一条籍贯
	@Override
	public JgbEntity queryJgByDm(String dm) {
		return (JgbEntity)dbDao.queryForObject("jgbgl.queryJgByDm", dm);
	}
	//修改籍贯
	@Override
	@MethodLog(description="修改籍贯")
	public void updJgByDm(JgbEntity jgbEntity) {
		dbDao.update("jgbgl.updJgByDm",jgbEntity);
	}

	
}

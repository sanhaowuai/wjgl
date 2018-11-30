package com.incon.project.common.ryxgxxwh.xlb.service;

import java.util.Arrays;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.ryxgxxwh.XlbEntity;

/**
 * @类名：com.incon.project.common.ryxgxxwh.xlb.service.XlbServiceImpl
 * @作者：马爽
 * @时间：2014-4-1
 * @版本：
 * @描述：学历表管理接口实现类
 * @修改人员：
 * @修改时间：2014-4-1
 * @修改说明：
 */
@SuppressWarnings("all")
@Service(value= "xlbService")
public class XlbServiceImpl extends CommServiceImpl implements XlbService {

	//增加学历
	@Override
	@MethodLog(description="增加学历")
	public void addXl(XlbEntity xlbEntity) {
		dbDao.insert("xlbgl.addXl", xlbEntity);	
	}

	//删除学历
	@Transactional
	@Override
	@MethodLog(description="删除学历")
	public void delXl(String[] ids) {
		dbDao.executeBatchOperation("xlbgl.delXl", Arrays.asList(ids), "delete");	
	}
	//查询代码是否重复
	@Override
	public Integer queryByDmCount(String dm) {
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("xlbgl.queryByDmCount", dm)));
	}
	//查询一条学历
	@Override
	public XlbEntity queryXlByDm(String dm) {
		return (XlbEntity)dbDao.queryForObject("xlbgl.queryXlByDm", dm);
	}
	//修改籍贯
	@Override
	@MethodLog(description="修改学历")
	public void updXlByDm(XlbEntity xlbEntity) {
		dbDao.update("xlbgl.updXlByDm",xlbEntity);
	}

	
}

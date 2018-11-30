package com.incon.project.common.ryxgxxwh.xzjbb.service;

import java.util.Arrays;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.ryxgxxwh.XzjbbEntity;

/**
 * @类名：com.incon.project.common.ryxgxxwh.xzjbb.service.XzjbbServiceImpl
 * @作者：马爽
 * @时间：2014-4-1
 * @版本：
 * @描述：行政级别表管理接口实现类
 * @修改人员：
 * @修改时间：2014-4-1
 * @修改说明：
 */
@SuppressWarnings("all")
@Service(value= "xzjbbService")
public class XzjbbServiceImpl extends CommServiceImpl implements XzjbbService {

	//增加行政级别
	@Override
	@MethodLog(description="增加行政级别")
	public void addXzjb(XzjbbEntity xzjbbEntity) {
		dbDao.insert("xzjbbgl.addXzjb", xzjbbEntity);
		
	}

	//删除行政级别
	@Transactional
	@Override
	@MethodLog(description="删除行政级别")
	public void delXzjb(String[] ids) {
		dbDao.executeBatchOperation("xzjbbgl.delXzjb", Arrays.asList(ids), "delete");
		
	}
	//查询代码是否重复
	@Override
	public Integer queryByDmCount(String dm) {
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("xzjbbgl.queryByDmCount", dm)));
	}

	//查询一条行政级别
	@Override
	public XzjbbEntity queryXzjbByDm(String dm) {
		return (XzjbbEntity)dbDao.queryForObject("xzjbbgl.queryXzjbByDm", dm);
	}
	//修改行政级别
	@Override
	@MethodLog(description="修改行政级别")
	public void updXzjbByDm(XzjbbEntity xzjbbEntity) {
		dbDao.update("xzjbbgl.updXzjbByDm",xzjbbEntity);
	}
}

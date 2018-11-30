package com.incon.project.common.ryxgxxwh.xbb.service;

import java.util.Arrays;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.ryxgxxwh.XbbEntity;

/**
 * @类名：com.incon.project.common.ryxgxxwh.xbb.service.XbbServiceImpl
 * @作者：马爽
 * @时间：2014-4-1
 * @版本：
 * @描述：性别表管理接口实现类
 * @修改人员：
 * @修改时间：2014-4-1
 * @修改说明：
 */
@SuppressWarnings("all")
@Service(value= "xbbService")
public class XbbServiceImpl extends CommServiceImpl implements XbbService {

	//增加籍贯
	@Override
	@MethodLog(description="增加性别")
	public void addXb(XbbEntity xbbEntity) {
		dbDao.insert("xbbgl.addXb", xbbEntity);	
	}

	//删除籍贯
	@Transactional
	@Override
	@MethodLog(description="删除性别")
	public void delXb(String[] ids) {
		dbDao.executeBatchOperation("xbbgl.delXb", Arrays.asList(ids), "delete");	
	}
	//查询代码是否重复
	@Override
	public Integer queryByDmCount(String dm) {
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("xbbgl.queryByDmCount", dm)));
	}
	//查询一条籍贯
	@Override
	public XbbEntity queryXbByDm(String dm) {
		return (XbbEntity)dbDao.queryForObject("xbbgl.queryXbByDm", dm);
	}
	//修改籍贯
	@Override
	@MethodLog(description="修改性别")
	public void updXbByDm(XbbEntity xbbEntity) {
		dbDao.update("xbbgl.updXbByDm",xbbEntity);
	}

	
}

package com.incon.project.common.ryxgxxwh.xwb.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.ryxgxxwh.XwbEntity;
import com.incon.pojo.common.ryxgxxwh.XwlbbEntity;

/**
 * @类名：com.incon.project.common.ryxgxxwh.xwb.service.XwbServiceImpl
 * @作者：马爽
 * @时间：2014-4-1
 * @版本：
 * @描述：学位表管理接口实现类
 * @修改人员：
 * @修改时间：2014-4-1
 * @修改说明：
 */
@SuppressWarnings("all")
@Service(value= "xwbService")
public class XwbServiceImpl extends CommServiceImpl implements XwbService {

	//增加学位
	@Override
	@MethodLog(description="增加学位")
	public void addXw(XwbEntity xwbEntity) {
		dbDao.insert("xwbgl.addXw", xwbEntity);	
	}

	//删除学位
	@Transactional
	@Override
	@MethodLog(description="删除学位")
	public void delXw(String[] ids) {
		dbDao.executeBatchOperation("xwbgl.delXw", Arrays.asList(ids), "delete");	
	}
	//查询代码是否重复
	@Override
	public Integer queryByDmCount(String dm) {
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("xwbgl.queryByDmCount", dm)));
	}
	//查询一条学位
	@Override
	public XwbEntity queryXwByDm(String dm) {
		return (XwbEntity)dbDao.queryForObject("xwbgl.queryXwByDm", dm);
	}
	//修改学位
	@Override
	@MethodLog(description="修改学位")
	public void updXwByDm(XwbEntity xwbEntity) {
		dbDao.update("xwbgl.updXwByDm",xwbEntity);
	}

	//查询学位类别表
	@Override
	public List<XwlbbEntity> queryWblbb(){
		return (List<XwlbbEntity>)dbDao.query("xwbgl.queryWblbb");
	}
}

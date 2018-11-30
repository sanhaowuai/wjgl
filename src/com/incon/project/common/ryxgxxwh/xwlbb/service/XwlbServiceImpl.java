package com.incon.project.common.ryxgxxwh.xwlbb.service;

import java.util.Arrays;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.ryxgxxwh.XwlbbEntity;

/**
 * @类名：com.incon.project.common.ryxgxxwh.xwlbb.service.XwlbServiceImpl
 * @作者：马爽
 * @时间：2014-4-1
 * @版本：
 * @描述：学位类别表管理接口实现类
 * @修改人员：
 * @修改时间：2014-4-1
 * @修改说明：
 */
@SuppressWarnings("all")
@Service(value= "xwlbbService")
public class XwlbServiceImpl extends CommServiceImpl implements XwlbbService {

	//增加籍贯
	@Override
	@MethodLog(description="增加学位类别")
	public void addXwlb(XwlbbEntity xwlbbEntity) {
		dbDao.insert("xwlbbgl.addXwlb", xwlbbEntity);	
	}

	//删除籍贯
	@Override
	@Transactional
	@MethodLog(description="删除学位类别")
	public void delXwlb(String[] ids) {
		dbDao.executeBatchOperation("xwlbbgl.delXwlb", Arrays.asList(ids), "delete");	
	}
	//查询代码是否重复
	@Override
	public Integer queryByDmCount(String dm) {
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("xwlbbgl.queryByDmCount", dm)));
	}
	//查询一条籍贯
	@Override
	public XwlbbEntity queryXwlbByDm(String dm) {
		return (XwlbbEntity)dbDao.queryForObject("xwlbbgl.queryXwlbByDm", dm);
	}
	//修改籍贯
	@Override
	@MethodLog(description="修改学位类别")
	public void updXwlbByDm(XwlbbEntity xwlbbEntity) {
		dbDao.update("xwlbbgl.updXwlbByDm",xwlbbEntity);
	}

	
}

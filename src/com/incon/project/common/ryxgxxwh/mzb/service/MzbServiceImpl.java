package com.incon.project.common.ryxgxxwh.mzb.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.page.Page;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.ryxgxxwh.MzbEntity;

/**
 * @类名：com.incon.project.common.ryxgxxwh.mzb.service.MzbServiceImpl
 * @作者：马爽
 * @时间：2014-4-1
 * @版本：
 * @描述：民族表管理接口实现类
 * @修改人员：
 * @修改时间：2014-4-1
 * @修改说明：
 */
@SuppressWarnings("all")
@Service(value= "mzbService")
public class MzbServiceImpl extends CommServiceImpl implements MzbService {

	//增加民族
	@Override
	@MethodLog(description="增加民族")
	public void addMz(MzbEntity mzbEntity) {
		dbDao.insert("mzbgl.addMz", mzbEntity);
	}

	//删除民族
	@Transactional
	@Override
	@MethodLog(description="删除民族")
	public void delMz(String[] ids) {
		dbDao.executeBatchOperation("mzbgl.delMz",  Arrays.asList(ids), "delete");	
	}
	//查询代码是否重复
	@Override
	public Integer queryByDmCount(String dm) {
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("mzbgl.queryByDmCount", dm)));
	}
	//查询一条籍贯
	@Override
	public MzbEntity queryMzByDm(String dm) {
		return (MzbEntity)dbDao.queryForObject("mzbgl.queryMzByDm", dm);
	}
	//修改籍贯
	@Override
	@MethodLog(description="修改籍贯")
	public void updMzByDm(MzbEntity mzbEntity) {
		dbDao.update("mzbgl.updMzByDm",mzbEntity);
	}
	
}

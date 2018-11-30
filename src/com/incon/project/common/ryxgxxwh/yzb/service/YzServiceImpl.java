package com.incon.project.common.ryxgxxwh.yzb.service;

import java.util.Arrays;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.ryxgxxwh.YzbEntity;

/**
 * @类名：com.incon.project.common.ryxgxxwh.yzb.service.YzServiceImpl
 * @作者：马爽
 * @时间：2014-4-1
 * @版本：
 * @描述：语种表管理接口实现类
 * @修改人员：
 * @修改时间：2014-4-1
 * @修改说明：
 */
@SuppressWarnings("all")
@Service(value= "yzbService")
public class YzServiceImpl extends CommServiceImpl implements YzbService {
	//增加语种
	@Override
	@MethodLog(description="增加语种")
	public void addYz(YzbEntity yzbEntity) {
		dbDao.insert("yzbgl.addYz", yzbEntity);	
	}

	//删除语种
	@Override
	@Transactional
	@MethodLog(description="删除语种")
	public void delYz(String[] ids) {
		dbDao.executeBatchOperation("yzbgl.delYz", Arrays.asList(ids), "delete");	
	}
	//查询代码是否重复
	@Override
	public Integer queryByDmCount(String dm) {
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("yzbgl.queryByDmCount", dm)));
	}
	//查询一条语种
	@Override
	public YzbEntity queryYzByDm(String dm) {
		return (YzbEntity)dbDao.queryForObject("yzbgl.queryYzByDm", dm);
	}
	//修改语种
	@Override
	@MethodLog(description="修改语种")
	public void updYzByDm(YzbEntity yzbEntity) {
		dbDao.update("yzbgl.updYzByDm",yzbEntity);
	}

	
}

package com.incon.project.common.wdlw.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.LwcjEntity;
import com.incon.pojo.common.LwdbTimeAddrEntity;
import com.incon.pojo.common.LwxxEntity;
import com.incon.pojo.common.XtxxEntity;

/**
 * 
 * @类名： com.incon.project.common.xsgl.service.XsglServiceImpl
 * @创建人： 杨文龙
 * @日期： 2013-3-11
 * @修改人：
 * @日期：
 * @描述：
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value = "wdlwService")
public class WdlwServiceImpl extends CommServiceImpl implements WdlwService {
	// 添加学生
	@Override
	public XtxxEntity queryXtInfo(String userCode) {
		// TODO Auto-generated method stub
		return (XtxxEntity) dbDao.queryForObject("wdlw.queryxtinfo", userCode);
	}

	@Override
	public LwxxEntity queryLwInfo(String userCode) {
		// TODO Auto-generated method stub
		return (LwxxEntity) dbDao.queryForObject("wdlw.querylwinfo", userCode);
	}

	@Transactional
	@MethodLog(description = "保存论文信息")
	@Override
	public void updateLunwenStatus(LwxxEntity lwxxEntity) {
		// TODO Auto-generated method stub
		dbDao.update("wdlw.updXTInfo", lwxxEntity);
	}

	@Override
	public LwdbTimeAddrEntity queryDabianTimeAddr(LwxxEntity lwxxEntity) {
		// TODO Auto-generated method stub
		return (LwdbTimeAddrEntity) dbDao.queryForObject("wdlw.querydbinfo",
				lwxxEntity);
	}

	@Override
	public LwcjEntity queryDabianChengji(LwxxEntity lwxxEntity) {
		// TODO Auto-generated method stub
		return (LwcjEntity) dbDao
				.queryForObject("wdlw.querycjinfo", lwxxEntity);

	}

}

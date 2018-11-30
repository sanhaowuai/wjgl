package com.incon.project.common.zxtrywh.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.XsxxbEntity;
import com.incon.pojo.common.zxtrywhEntity;
import com.incon.pojo.common.dbsx.DbsxEntity;
import com.incon.pojo.common.lwgl.KxkzybEntity;
import com.incon.pojo.common.lwgl.LwsbbEntity;
import com.incon.pojo.common.lwgl.XsxtbEntity;
import com.incon.pojo.common.lwgl.XtczbEntity;
import com.incon.project.dbsx.page.DbsxPage;

/**
 * 
 * @类名： com.incon.project.dbsx.service.DbsxServiceImpl
 * @创建人： 赵玥(zhaoyue)
  * @日期： 2016-10-22
 * @版本号：
 * @说明：子系统人员维护
 */
@SuppressWarnings("all")
@Service(value = "zxtrywhService")
public class ZxtrywhServiceImpl extends CommServiceImpl implements ZxtrywhService
{

	@Override
	public void addzxt(zxtrywhEntity entity) {
		// TODO Auto-generated method stub
		dbDao.insert("zxtrywh.addzxt", entity);
	}

	@Override
	public void delzxt(String[] ids) {
		// TODO Auto-generated method stub
		dbDao.executeBatchOperation("zxtrywh.delzxt", Arrays.asList(ids), "delete");
	}

	@Override
	public zxtrywhEntity queryByidzxt(String ids) {
		// TODO Auto-generated method stub
		return (zxtrywhEntity) dbDao.queryForObject("zxtrywh.queryByidzxt", ids);
	}

	@Override
	public Integer querybyoneCount(String ids) {
		// TODO Auto-generated method stub
		return (Integer) dbDao.queryForObject("zxtrywh.querybyoneCount", ids);
	}

	@Override
	public void updzxt(zxtrywhEntity entity) {
		// TODO Auto-generated method stub
		dbDao.update("zxtrywh.updzxt", entity);
	}

	@Override
	public List<Map<String, String>> queryAllxy() {
		// TODO Auto-generated method stub
		return dbDao.query("zxtrywh.queryAllxy");
	}

	@Override
	public List<Map<String, String>> queryAllzxt() {
		// TODO Auto-generated method stub
		return dbDao.query("zxtrywh.queryAllzxt");
	}

	 

}

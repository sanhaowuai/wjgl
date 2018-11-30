package com.incon.project.dbsx.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.XsxxbEntity;
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
 * @日期： 2016-08-09
 * @版本号：
 * @说明：代办事项(更多)
 */
@SuppressWarnings("all")
@Service(value = "dbsxService")
public class DbsxServiceImpl extends CommServiceImpl implements DbsxService
{

	@Override
	public DbsxEntity queryByidDbsx(String id) {
		// 根据id查询具体数据
		return (DbsxEntity) dbDao.queryForObject("dbsx.queryByidDbsx", id);
	}

	@Override
	public void updByidDbsx(String id,String yhdm) {
		// T修改 是否已读  状态
		Map< String, String> map=new HashMap<String, String>();
		map.put("id",id);
		map.put("yhdm",yhdm);
		dbDao.update("dbsx.updByidDbsx", map);
	}


	@Override
	public List<DbsxEntity> queryDbsxTop5(DbsxPage dbsxPage) {
		// 查询    未读  前5条数据
		return dbDao.query("dbsx.queryDbsxTop5",dbsxPage);
	}

	@Override
	public void addDbsx(DbsxEntity dbsxEntity) {
		// TODO Auto-generated method stub
		dbDao.insert("dbsx.addDbsx", dbsxEntity);
	}

	@Override
	public void delDbsx(DbsxEntity dbsxEntity) {
		// TODO Auto-generated method stub
		dbDao.delete("dbsx.delDbsx", dbsxEntity);
	}

	@Override
	public void updDbsx(DbsxEntity dbsxEntity) {
		// TODO Auto-generated method stub
		dbDao.update("dbsx.updDbsx", dbsxEntity);
	}

	@Override
	public Integer querySfkck(String id) {
		// TODO Auto-generated method stub
		return (Integer) dbDao.queryForObject("dbsx.querySfkck", id);
	}

}

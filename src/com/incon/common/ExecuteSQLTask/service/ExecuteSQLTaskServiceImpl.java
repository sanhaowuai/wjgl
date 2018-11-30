package com.incon.common.ExecuteSQLTask.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.common.ExceptionTask.page.RwrzbEntity;
import com.incon.common.ExceptionTask.page.RwrzbJsonPage;
import com.incon.common.ExecuteSQLTask.page.ExecuteSQLTaskEntity;
import com.incon.common.ExecuteSQLTask.quartz.ExecuteSQLQuartzManager;
import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
/**
 * 
 * @类名：com.incon.common.ExecuteSQLTask.service.ExecuteSQLTaskServiceImpl
 * @创建人：安智博
 * @日期：2017-3-31
 * @描述：执行SQL任务
 */
@Service(value= "executeSQLTaskService")

public class ExecuteSQLTaskServiceImpl extends CommServiceImpl implements ExecuteSQLTaskService{

	/**
	 * 查询执行SQL任务列表 
	 */
	@Override
	public List<ExecuteSQLTaskEntity> queryExecuteSQLTaskToList(ExecuteSQLTaskEntity e) {
		// TODO Auto-generated method stub
		return dbDao.query("ExecuteSQLTask.queryExecuteSQLTaskToList", e);
	}

	/**
	 * 查询任务日志
	 * @param rwlx
	 * @param rwid
	 */
	@Override
	public List<RwrzbEntity> queryRwrzb(RwrzbJsonPage e){
		return dbDao.query("ExecuteSQLTask.queryRwrzb", e);
	}
	
	@Override
	public Integer queryRwrzbCount(RwrzbJsonPage e){
		return (Integer)dbDao.queryForObject("ExecuteSQLTask.queryRwrzbCount", e);
	}
	/**
	 * 查询执行SQL任务
	 */
	@Override
	public ExecuteSQLTaskEntity queryExecuteSQLTaskToSin(ExecuteSQLTaskEntity e) {
		// TODO Auto-generated method stub
		return (ExecuteSQLTaskEntity) dbDao.queryForObject("ExecuteSQLTask.queryExecuteSQLTaskToSin", e);
	}

	/**
	 * 删除执行SQL任务 
	 */
	@Transactional
	@MethodLog(description=" 删除执行SQL任务  ")	
	@Override
	public Integer delExecuteSQLTaskToSin(ExecuteSQLTaskEntity e) {
		// TODO Auto-generated method stub
		ExecuteSQLQuartzManager.removeJob(e.getId());
		return (Integer) dbDao.delete("ExecuteSQLTask.delExecuteSQLTaskToSin", e);
	}

	/**
	 * 新增执行SQL任务 
	 */
	@Transactional
	@MethodLog(description="新增执行SQL任务 ")
	@Override
	public Integer addExecuteSQLTaskToSin(ExecuteSQLTaskEntity e) {
		// TODO Auto-generated method stub
		return (Integer) dbDao.update("ExecuteSQLTask.addExecuteSQLTaskToSin", e);
	}

	/**
	 * 修改执行SQL任务
	 */
	@Transactional
	@MethodLog(description="修改执行SQL任务")
	@Override
	public Integer updExecuteSQLTaskToSin(ExecuteSQLTaskEntity e) {
		// TODO Auto-generated method stub
		return (Integer) dbDao.update("ExecuteSQLTask.updExecuteSQLTaskToSin", e);
	}

}

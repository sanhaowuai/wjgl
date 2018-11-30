package com.incon.common.ExceptionTask.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.common.ExceptionTask.page.ExceptionTaskEntity;
import com.incon.common.ExceptionTask.page.RwrzbEntity;
import com.incon.common.ExceptionTask.page.RwrzbJsonPage;
import com.incon.common.ExceptionTask.quartz.QuartzManager;
import com.incon.common.grrc.page.GrrcEntity;
import com.incon.common.grrc.service.GrrcService;
import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
@Service(value= "exceptionTaskService")

/**
 * @类名：com.incon.common.ExceptionTask.service.ExceptionTaskServiceImpl
 * @作者：dqm
 * @时间：2016-12-09
 * @版本：
 * @描述：例外（异常）任务 实现类
 * @修改人员：
 * @修改时间：
 * @修改说明：
 */
public class ExceptionTaskServiceImpl extends CommServiceImpl implements ExceptionTaskService{

	/**
	 * 查询异常（例外）任务列表 
	 */
	@Override
	public List<ExceptionTaskEntity> queryExceptionTaskToList(ExceptionTaskEntity e) {
		// TODO Auto-generated method stub
		return dbDao.query("exceptionTask.queryExceptionTaskToList", e);
	}

	/**
	 * 查询任务日志
	 * @param rwlx
	 * @param rwid
	 */
	@Override
	public List<RwrzbEntity> queryRwrzb(RwrzbJsonPage e){
		return dbDao.query("exceptionTask.queryRwrzb", e);
	}
	
	@Override
	public Integer queryRwrzbCount(RwrzbJsonPage e){
		return (Integer)dbDao.queryForObject("exceptionTask.queryRwrzbCount", e);
	}
	/**
	 * 查询单个异常（例外）任务
	 */
	@Override
	public ExceptionTaskEntity queryExceptionTaskToSin(ExceptionTaskEntity e) {
		// TODO Auto-generated method stub
		return (ExceptionTaskEntity) dbDao.queryForObject("exceptionTask.queryExceptionTaskToSin", e);
	}

	/**
	 * 删除单个异常（例外）任务 
	 */
	@Transactional
	@MethodLog(description=" 删除单个异常（例外）任务  ")	
	@Override
	public Integer delExceptionTaskToSin(ExceptionTaskEntity e) {
		// TODO Auto-generated method stub
		QuartzManager.removeJob(e.getId());
		return (Integer) dbDao.delete("exceptionTask.delExceptionTaskToSin", e);
	}

	/**
	 * 新增单个异常（例外）任务 
	 */
	@Transactional
	@MethodLog(description="新增单个异常（例外）任务 ")
	@Override
	public Integer addExceptionTaskToSin(ExceptionTaskEntity e) {
		// TODO Auto-generated method stub
		return (Integer) dbDao.update("exceptionTask.addExceptionTaskToSin", e);
	}

	/**
	 * 修改单个异常（例外）任务
	 */
	@Transactional
	@MethodLog(description="修改单个异常（例外）任务")
	@Override
	public Integer updExceptionTaskToSin(ExceptionTaskEntity e) {
		// TODO Auto-generated method stub
		return (Integer) dbDao.update("exceptionTask.updExceptionTaskToSin", e);
	}

}

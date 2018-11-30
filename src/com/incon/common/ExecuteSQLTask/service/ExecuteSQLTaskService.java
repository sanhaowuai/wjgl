package com.incon.common.ExecuteSQLTask.service;

import java.util.List;

import com.incon.common.ExceptionTask.page.RwrzbEntity;
import com.incon.common.ExceptionTask.page.RwrzbJsonPage;
import com.incon.common.ExecuteSQLTask.page.ExecuteSQLTaskEntity;
import com.incon.framework.service.CommService;

/**
 * 
 * @类名：com.incon.common.ExecuteSQLTask.service.ExecuteSQLTaskService
 * @创建人：安智博
 * @日期：2017-3-31
 * @描述：执行SQL任务
 */
public interface ExecuteSQLTaskService extends CommService{
	/**
	 * 查询执行SQL任务列表 
	 */
	public List<ExecuteSQLTaskEntity> queryExecuteSQLTaskToList(ExecuteSQLTaskEntity e);
	/**
	 * 查询执行SQL任务
	 */
	public ExecuteSQLTaskEntity queryExecuteSQLTaskToSin(ExecuteSQLTaskEntity e);
	/**
	 * 删除执行SQL任务 
	 */
	public Integer delExecuteSQLTaskToSin(ExecuteSQLTaskEntity e);
	/**
	 * 新增执行SQL任务 
	 */
	public Integer addExecuteSQLTaskToSin(ExecuteSQLTaskEntity e);
	/**
	 * 修改执行SQL任务
	 */
	public Integer updExecuteSQLTaskToSin(ExecuteSQLTaskEntity e);
	public Integer queryRwrzbCount(RwrzbJsonPage e);
	public List<RwrzbEntity> queryRwrzb(RwrzbJsonPage e);
}

package com.incon.common.ExceptionTask.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.incon.common.ExceptionTask.page.ExceptionTaskEntity;
import com.incon.common.ExceptionTask.page.RwrzbEntity;
import com.incon.common.ExceptionTask.page.RwrzbJsonPage;
import com.incon.framework.service.CommService;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.XtfkbEntity;

/**
 * @类名：com.incon.common.ExceptionTask.service.ExceptionTaskService
 * @作者：dqm
 * @时间：2016-12-09
 * @版本：
 * @描述：例外（异常）任务 接口
 * @修改人员：
 * @修改时间：
 * @修改说明：
 */
public interface ExceptionTaskService extends CommService{
	/**
	 * 查询异常（例外）任务列表 
	 */
	public List<ExceptionTaskEntity> queryExceptionTaskToList(ExceptionTaskEntity e);
	/**
	 * 查询单个异常（例外）任务
	 */
	public ExceptionTaskEntity queryExceptionTaskToSin(ExceptionTaskEntity e);
	/**
	 * 删除单个异常（例外）任务 
	 */
	public Integer delExceptionTaskToSin(ExceptionTaskEntity e);
	/**
	 * 新增单个异常（例外）任务 
	 */
	public Integer addExceptionTaskToSin(ExceptionTaskEntity e);
	/**
	 * 修改单个异常（例外）任务
	 */
	public Integer updExceptionTaskToSin(ExceptionTaskEntity e);
	public Integer queryRwrzbCount(RwrzbJsonPage e);
	public List<RwrzbEntity> queryRwrzb(RwrzbJsonPage e);
}

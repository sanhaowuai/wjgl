package com.incon.common.DirtyDataTask.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.incon.common.DirtyDataTask.page.DirtyDataTaskEntity;
import com.incon.common.ExceptionTask.page.RwrzbEntity;
import com.incon.framework.service.CommService;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.XtfkbEntity;

/**
 * @类名：com.incon.common.DirtyDataTask.service.DirtyDataTaskService
 * @作者：dqm
 * @时间：2016-12-21
 * @版本：
 * @描述：垃圾数据
 * @修改人员：
 * @修改时间：
 * @修改说明：
 */
public interface DirtyDataTaskService extends CommService{
	/**
	 * 查询垃圾数据列表 
	 */
	public List<DirtyDataTaskEntity> queryDirtyDataTaskToList(DirtyDataTaskEntity e);
	/**
	 * 查询垃圾数据
	 */
	public DirtyDataTaskEntity queryDirtyDataTaskToSin(DirtyDataTaskEntity e);
	/**
	 * 删除垃圾数据
	 */
	public Integer delDirtyDataTaskToSin(DirtyDataTaskEntity e);
	/**
	 * 新增垃圾数据
	 */
	public Integer addDirtyDataTaskToSin(DirtyDataTaskEntity e);
	/**
	 * 修改垃圾数据
	 */
	public Integer updDirtyDataTaskToSin(DirtyDataTaskEntity e);
	public List<RwrzbEntity> queryRwrzb(String rwlx, String rwid);
	void executeDirtyDataTaskToBatch(String[] ids, String zhxgrdm)
			throws Exception;
}

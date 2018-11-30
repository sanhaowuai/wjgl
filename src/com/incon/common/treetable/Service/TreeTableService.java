package com.incon.common.treetable.Service;

import java.util.List;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.QxEntity;

@SuppressWarnings("all")
public interface TreeTableService extends CommService {
	
	/**
	 * 查询treeTable数据
	 * @return
	 */
	public List<QxEntity> queryAll();
}

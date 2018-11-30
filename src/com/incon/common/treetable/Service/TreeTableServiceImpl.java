package com.incon.common.treetable.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.QxEntity;

@SuppressWarnings("all")
@Service(value="treeTableService")
public class TreeTableServiceImpl extends CommServiceImpl implements TreeTableService {

	/**
	 * 查询treeTable数据
	 * @return
	 */
	@Override
	public List<QxEntity> queryAll(){
		return dbDao.query("treeTable.queryQx");
	}
}

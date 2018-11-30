package com.incon.project.common.yxzygl.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.YxdmbEntity;
import com.incon.pojo.common.ZybEntity;

/**
 * 
 * @类名：  com.incon.project.common.zygl.service.ZyglServiceImpl
 * @修改人：
 * @日期：
 * @描述：  
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value= "yxzyglService")
public class YxZyglServiceImpl extends CommServiceImpl implements YxZyglService{

	@Override
	@Transactional
	@MethodLog(description="删除专业")
	public void delZy(String[] ids){
		dbDao.executeBatchOperation("yxzygl.delZy", Arrays.asList(ids), "delete");
	}
	
	@Override
	public List<Map> queryPubYxList(Map yxMap) {
		
		return dbDao.query("yxzygl.queryYx",yxMap);
	}

	@Override
	public void addYxZy(ZybEntity zybEntity) {
		
		dbDao.insert("yxzygl.addYxZy", zybEntity);
	}

	@Override
	public List<ZybEntity> queryZy() {
		
		return dbDao.query("yxzygl.queryZy");
	}
	@Override
	public Integer updYxzyKyf(ZybEntity zybEntity){
		return dbDao.update("yxzygl.updYxzyKyf", zybEntity);
	}

	
}

package com.incon.project.common.rzgl.service;

import java.util.List;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.RzEntity;

/**
 * 
 * @类名：  com.incon.project.common.rzgl.service.RzService
 * @创建人：樊旭
 * @日期： 2013-3-11
 * @修改人：
 * @日期：
 * @描述：  记录日志
 * @版本号：
 */
@SuppressWarnings("all")
public interface RzService extends CommService {
	
	//保存日志
	public void save(RzEntity rzEntity);
	
	//查询操作人角色
	public String queryJsmc(Integer jsdm);
	//查询角色下拉框
	public List<JsbEntity> queryJsmc();
}

package com.incon.project.common.ryxgxxwh.xwlbb.service;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.ryxgxxwh.XwlbbEntity;

/**
 * @类名：com.incon.project.common.ryxgxxwh.xwlbb.service.XwlbService
 * @作者：马爽
 * @时间：2014-4-1
 * @版本：
 * @描述：学位类别表管理接口
 * @修改人员：
 * @修改时间：2014-4-1
 * @修改说明：
 */
@SuppressWarnings("all")
public interface XwlbbService extends CommService {
	//增加学位类别
	public void addXwlb(XwlbbEntity xwlbbEntity);
	
	//查询一条学位类别
	public XwlbbEntity queryXwlbByDm(String dm);
	
	//修改学位类别
	public void updXwlbByDm(XwlbbEntity xwlbbEntity);
	
	//删除学位类别
	public void delXwlb(String[] ids);
	
	//查询dm是否重复
	public Integer queryByDmCount(String dm);
}


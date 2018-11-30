package com.incon.project.common.ryxgxxwh.xbb.service;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.ryxgxxwh.XbbEntity;

/**
 * @类名：com.incon.project.common.ryxgxxwh.xbb.service.XbbService
 * @作者：马爽
 * @时间：2014-4-1
 * @版本：
 * @描述：性别表管理接口
 * @修改人员：
 * @修改时间：2014-4-1
 * @修改说明：
 */
@SuppressWarnings("all")
public interface XbbService extends CommService {
	//增加性别
	public void addXb(XbbEntity xbbEntity);
	
	//查询一条性别
	public XbbEntity queryXbByDm(String dm);
	
	//修改性别
	public void updXbByDm(XbbEntity xbbEntity);
	
	//删除性别
	public void delXb(String[] ids);
	
	//查询dm是否重复
	public Integer queryByDmCount(String dm);
}

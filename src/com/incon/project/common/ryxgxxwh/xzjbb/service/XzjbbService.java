package com.incon.project.common.ryxgxxwh.xzjbb.service;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.ryxgxxwh.XzjbbEntity;

/**
 * @类名：com.incon.project.common.ryxgxxwh.xzjbb.service.XzjbbService
 * @作者：马爽
 * @时间：2014-4-1
 * @版本：
 * @描述：行政级别表管理接口
 * @修改人员：
 * @修改时间：2014-4-1
 * @修改说明：
 */
@SuppressWarnings("all")
public interface XzjbbService extends CommService {
	
	//增加行政级别
	public void addXzjb(XzjbbEntity xzjbbEntity);
	
	//查询一条行政级别
	public XzjbbEntity queryXzjbByDm(String dm);
	
	//修改行政级别
	public void updXzjbByDm(XzjbbEntity xzjbbEntity);
	
	//删除行政级别
	public void delXzjb(String[] ids);
	
	//查询dm是否重复
	public Integer queryByDmCount(String dm);
}


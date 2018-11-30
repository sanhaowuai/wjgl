package com.incon.project.common.ryxgxxwh.xwb.service;

import java.util.List;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.ryxgxxwh.XwbEntity;
import com.incon.pojo.common.ryxgxxwh.XwlbbEntity;

/**
 * @类名：com.incon.project.common.ryxgxxwh.xwb.service.XwbService
 * @作者：马爽
 * @时间：2014-4-1
 * @版本：
 * @描述：学位表管理接口
 * @修改人员：
 * @修改时间：2014-4-1
 * @修改说明：
 */
@SuppressWarnings("all")
public interface XwbService extends CommService {
	//增加学位
	public void addXw(XwbEntity xwbEntity);
	
	//查询一条学位
	public XwbEntity queryXwByDm(String dm);
	
	//修改学位
	public void updXwByDm(XwbEntity xwbEntity);
	
	//删除学位
	public void delXw(String[] ids);
	
	//查询dm是否重复
	public Integer queryByDmCount(String dm);
	
	//查询学位类别表
	public List<XwlbbEntity> queryWblbb();
}


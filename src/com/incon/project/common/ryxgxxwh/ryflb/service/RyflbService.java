package com.incon.project.common.ryxgxxwh.ryflb.service;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.ryxgxxwh.RyflbEntity;

/**
 * @类名：com.incon.project.common.ryxgxxwh.ryflb.service.RyflbService
 * @作者：马爽
 * @时间：2014-4-1
 * @版本：
 * @描述：人员分类表管理接口
 * @修改人员：
 * @修改时间：2014-4-1
 * @修改说明：
 */
@SuppressWarnings("all")
public interface RyflbService extends CommService {
	//增加人员分类
	public void addRyfl(RyflbEntity ryflbEntity);
	//查询一条人员分类
	public RyflbEntity queryRyflByDm(String dm);
	//修改人员分类
	public void updRyflByDm(RyflbEntity ryflbEntity);
	//删除人员分类
	public void delRyfl(String ids[]);
	//查询dm是否重复
	public Integer queryByDmCount(String dm);
}

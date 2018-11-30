package com.incon.project.common.ryxgxxwh.zcb.service;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.ryxgxxwh.ZcbEntity;

/**
 * @类名：com.incon.project.common.ryxgxxwh.zcb.service.ZybService
 * @作者：马爽
 * @时间：2014-4-1
 * @版本：
 * @描述：职称表管理接口
 * @修改人员：
 * @修改时间：2014-4-1
 * @修改说明：
 */
@SuppressWarnings("all")
public interface ZcbService extends CommService {
	//增加职称
	public void addZc(ZcbEntity zcbEntity);
	
	//查询一条职称
	public ZcbEntity queryZcByDm(String dm);
	
	//修改职称
	public void updZcByDm(ZcbEntity zcbEntity);
	
	//删除职称
	public void delZc(String[] ids);
	
	//查询dm是否重复
	public Integer queryByDmCount(String dm);
}


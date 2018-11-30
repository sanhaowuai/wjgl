package com.incon.project.common.ryxgxxwh.yzb.service;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.ryxgxxwh.YzbEntity;

/**
 * @类名：com.incon.project.common.ryxgxxwh.yzb.service.YzbService
 * @作者：马爽
 * @时间：2014-4-1
 * @版本：
 * @描述：语种表管理接口
 * @修改人员：
 * @修改时间：2014-4-1
 * @修改说明：
 */
@SuppressWarnings("all")
public interface YzbService extends CommService {
	
	//增加语种
	public void addYz(YzbEntity yzbEntity);
	
	//查询一条语种
	public YzbEntity queryYzByDm(String dm);
	
	//修改语种
	public void updYzByDm(YzbEntity yzbEntity);
	
	//删除语种
	public void delYz(String[] ids);
	
	//查询dm是否重复
	public Integer queryByDmCount(String dm);
}


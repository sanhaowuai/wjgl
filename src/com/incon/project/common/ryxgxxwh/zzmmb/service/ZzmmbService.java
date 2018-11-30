package com.incon.project.common.ryxgxxwh.zzmmb.service;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.ryxgxxwh.ZzmmbEntity;

/**
 * @类名：com.incon.project.common.ryxgxxwh.zzmmb.service.ZzmmbService
 * @作者：马爽
 * @时间：2014-4-1
 * @版本：
 * @描述：政治面貌表管理接口
 * @修改人员：
 * @修改时间：2014-4-1
 * @修改说明：
 */
@SuppressWarnings("all")
public interface ZzmmbService extends CommService {
	
	//增加政治面貌
	public void addZzmm(ZzmmbEntity zzmmbEntity);
	
	//查询一条政治面貌
	public ZzmmbEntity queryZzmmByDm(String dm);
	
	//修改政治面貌
	public void updZzmmByDm(ZzmmbEntity zzmmbEntity);
	
	//删除政治面貌
	public void delZzmm(String[] ids);
	
	//查询dm是否重复
	public Integer queryByDmCount(String dm);
}


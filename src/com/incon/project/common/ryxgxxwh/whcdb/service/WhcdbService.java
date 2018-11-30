package com.incon.project.common.ryxgxxwh.whcdb.service;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.ryxgxxwh.WhcdbEntity;

/**
 * @类名：com.incon.project.common.ryxgxxwh.whcdb.service.WhcdService
 * @作者：马爽
 * @时间：2014-4-1
 * @版本：
 * @描述：文化程度表管理接口
 * @修改人员：
 * @修改时间：2014-4-1
 * @修改说明：
 */
@SuppressWarnings("all")
public interface WhcdbService extends CommService {
	//增加文化程度
	public void addWhcd(WhcdbEntity whcdbEntity);
	
	//查询一条文化程度
	public WhcdbEntity queryWhcdByDm(String dm);
	
	//修改文化程度
	public void updWhcdByDm(WhcdbEntity whcdbEntity);
	
	//删除文化程度
	public void delWhcd(String[] ids);
	
	//查询dm是否重复
	public Integer queryByDmCount(String dm);
}

package com.incon.project.common.ryxgxxwh.xlb.service;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.ryxgxxwh.XlbEntity;

/**
 * @类名：com.incon.project.common.ryxgxxwh.xlb.service.XlbService
 * @作者：马爽
 * @时间：2014-4-1
 * @版本：
 * @描述：学历表管理接口
 * @修改人员：
 * @修改时间：2014-4-1
 * @修改说明：
 */
@SuppressWarnings("all")
public interface XlbService extends CommService {
	//增加学历
	public void addXl(XlbEntity xlbEntity);
	
	//查询一条学历
	public XlbEntity queryXlByDm(String dm);
	
	//修改学历
	public void updXlByDm(XlbEntity xlbEntity);
	
	//删除学历
	public void delXl(String[] ids);
	
	//查询dm是否重复
	public Integer queryByDmCount(String dm);
}

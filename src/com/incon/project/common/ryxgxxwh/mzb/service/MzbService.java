package com.incon.project.common.ryxgxxwh.mzb.service;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.ryxgxxwh.MzbEntity;

/**
 * @类名：com.incon.project.common.ryxgxxwh.mzb.service.MzbService
 * @作者：马爽
 * @时间：2014-4-1
 * @版本：
 * @描述：民族表管理接口
 * @修改人员：
 * @修改时间：2014-4-1
 * @修改说明：
 */
@SuppressWarnings("all")
public interface MzbService extends CommService {
	//增加民族
	public void addMz(MzbEntity mzbEntity);
	
	//查询一条籍贯
	public MzbEntity queryMzByDm(String dm);
	
	//修改籍贯
	public void updMzByDm(MzbEntity mzbEntity);
	
	//删除籍贯
	public void delMz(String ids[]);
	
	//查询dm是否重复
	public Integer queryByDmCount(String dm);
}

package com.incon.project.common.ryxgxxwh.jgb.service;

import java.util.List;
import java.util.Map;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.ryxgxxwh.JgbEntity;

/**
 * @类名：com.incon.project.common.ryxgxxwh.jgb.service.JgbService
 * @作者：马爽
 * @时间：2014-3-31
 * @版本：
 * @描述：籍贯表管理接口
 * @修改人员：
 * @修改时间：2014-3-31
 * @修改说明：
 */
@SuppressWarnings("all")
public interface JgbService extends CommService {
	//增加籍贯
	public void addJg(JgbEntity jgbEntity);
	
	//查询一条籍贯
	public JgbEntity queryJgByDm(String dm);
	
	//修改籍贯
	public void updJgByDm(JgbEntity jgbEntity);
	
	//删除籍贯
	public void delJg(String[] ids);
	
	//查询dm是否重复
	public Integer queryByDmCount(String dm);
}

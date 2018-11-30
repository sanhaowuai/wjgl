package com.incon.project.common.ryxgxxwh.gj.service;

import java.util.List;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.ryxgxxwh.GjbEntity;


/**
 * 
 * @类名： com.incon.project.common.ryxgxxwh.gj.service.GjglService
 * @创建人： 杨文龙
 * @日期： 2014-4-1
 * @修改人：
 * @日期：
 * @描述：国籍管理接口  
 * @版本号：
 */
@SuppressWarnings("all")
public interface GjglService extends CommService{

	//查询国籍列表
	public List<GjbEntity> queryGjglList();
	//添加国籍
	public void addGj(GjbEntity gjbEntity);
	//修改国籍信息
	public void updGj(GjbEntity gjbEntity);
	//删除国籍信息
	public void delGj(String[] ids);
	//判断代码是否重复
	public Integer queryByDmCount(String dm);
	//根据代码查询国籍
	public GjbEntity queryGjByDm(String dm);
}

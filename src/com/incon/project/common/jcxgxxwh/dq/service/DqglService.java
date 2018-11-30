package com.incon.project.common.jcxgxxwh.dq.service;

import java.util.List;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.jcxgxxwh.DqbEntity;


/**
 * 
 * @类名： com.incon.project.common.jcxgxxwh.dq.service.DqglService
 * @创建人： 杨文龙
 * @日期： 2014-4-2
 * @修改人：
 * @日期：
 * @描述：  地区管理接口
 * @版本号：
 */
@SuppressWarnings("all")
public interface DqglService extends CommService{

	//查询地区列表
	public List<DqbEntity> queryDqList();
	//添加地区
	public void addDq(DqbEntity DqbEntity);
	//修改地区信息
	public void updDq(DqbEntity DqbEntity);
	//删除地区信息
	public void delDq(String[] ids);
	//判断代码是否重复
	public Integer queryByDmCount(String dm);
	//根据代码查询地区
	public DqbEntity queryDqByDm(String dm);
}

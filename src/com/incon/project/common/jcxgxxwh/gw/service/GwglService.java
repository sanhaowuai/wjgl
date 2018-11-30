package com.incon.project.common.jcxgxxwh.gw.service;

import java.util.List;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.jcxgxxwh.GwbEntity;
import com.incon.pojo.common.jcxgxxwh.GwlxbEntity;

/**
 * 
 * @类名： com.incon.project.common.jcxxwh.gw.service.GwglService
 * @创建人： 杨文龙
 * @日期： 2014-4-1
 * @修改人：
 * @日期：
 * @描述：  岗位接口
 * @版本号：
 */
@SuppressWarnings("all")
public interface GwglService extends CommService{
	
	//查询所有岗位类型
	public List<GwlxbEntity> queryGwlx();
	//查询岗位列表
	public List<GwbEntity> queryGwList();
	//添加岗位
	public void addGw(GwbEntity gwbEntity);
	//修改岗位信息
	public void updGw(GwbEntity gwbEntity);
	//删除岗位信息
	public void delGw(String[] ids);
	//判断代码是否重复
	public Integer queryByDmCount(String dm);
	//根据代码查询岗位
	public GwbEntity queryGwByDm(String dm);
}

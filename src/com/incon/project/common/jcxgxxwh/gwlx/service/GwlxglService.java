package com.incon.project.common.jcxgxxwh.gwlx.service;

import java.util.List;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.jcxgxxwh.GwlxbEntity;


/**
 * 
 * @类名： com.incon.project.common.jcxgxxwh.gwlx.service.GwlxglService
 * @创建人： 杨文龙
 * @日期： 2014-4-1
 * @修改人：
 * @日期：
 * @描述：  岗位类型接口
 * @版本号：
 */
@SuppressWarnings("all")
public interface GwlxglService extends CommService{

	//查询岗位类型列表
	public List<GwlxbEntity> queryGwlxList();
	//添加岗位类型
	public void addGwlx(GwlxbEntity gwlxbEntity);
	//修改岗位类型信息
	public void updGwlx(GwlxbEntity gwlxbEntity);
	//判断岗位类型是否被使用
	public String queryExit(String ids);
	//删除岗位类型信息
	public void delGwlx(String[] ids);
	//判断代码是否重复
	public Integer queryByDmCount(String dm);
	//根据代码查询岗位类型
	public GwlxbEntity queryGwlxByDm(String dm);
}

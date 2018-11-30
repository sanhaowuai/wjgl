package com.incon.project.common.jcxgxxwh.nj.service;

import java.util.List;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.jcxgxxwh.NjbEntity;


/**
 * 
 * @类名： com.incon.project.common.jcxxwh.nj.service.NjglService
 * @创建人： 杨文龙
 * @日期： 2014-4-1
 * @修改人：
 * @日期：
 * @描述：  年级管理接口
 * @版本号：
 */
@SuppressWarnings("all")
public interface NjglService extends CommService{

	//查询年级列表
	public List<NjbEntity> queryNjList();
	//添加年级
	public void addNj(NjbEntity njbEntity);
	//修改年级信息
	public void updNj(NjbEntity njbEntity);
	//判断年级是否被使用
	public String queryExit(String ids);
	//删除年级信息
	public void delNj(String[] ids);
	//判断代码是否重复
	public Integer queryByDmCount(String nj);
	//根据代码查询年级
	public NjbEntity queryNjByDm(String nj);
}

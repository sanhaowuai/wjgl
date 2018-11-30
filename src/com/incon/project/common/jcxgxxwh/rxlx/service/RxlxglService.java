package com.incon.project.common.jcxgxxwh.rxlx.service;

import java.util.List;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.jcxgxxwh.RxlxbEntity;

/**
 * 
 * @类名： com.incon.project.common.jcxgxxwh.rxlx.service.RxlxglService
 * @创建人： 杨文龙
 * @日期： 2014-4-1
 * @修改人：
 * @日期：
 * @描述：  
 * @版本号：
 */
@SuppressWarnings("all")
public interface RxlxglService extends CommService{

	//查询入校类型列表
	public List<RxlxbEntity> queryRxlxList();
	//添加入校类型
	public void addRxlx(RxlxbEntity rxlxbEntity);
	//修改入校类型信息
	public void updRxlx(RxlxbEntity rxlxbEntity);
	//删除入校类型信息
	public void delRxlx(String[] ids);
	//判断代码是否重复
	public Integer queryByDmCount(String dm);
	//根据代码查询专业类别
	public RxlxbEntity queryRxlxByDm(String dm);
}

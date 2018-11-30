package com.incon.project.common.jcxgxxwh.xnxq.service;

import java.util.List;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.jcxgxxwh.XnxqbEntity;


/**
 * 
 * @类名： com.incon.project.common.jcxgxxwh.xnxq.service.XnxqglService
 * @创建人： 杨文龙
 * @日期： 2014-4-2
 * @修改人：
 * @日期：
 * @描述：  学年学期接口
 * @版本号：
 */
@SuppressWarnings("all")
public interface XnxqglService extends CommService{

	//查询学年学期列表
	public List<XnxqbEntity> queryXnxqList();
	//添加学年学期
	public void addXnxq(XnxqbEntity xnxqbEntity);
	//修改学年学期信息
	public void updXnxq(XnxqbEntity xnxqbEntity);
	//删除学年学期信息
	public void delXnxq(String[] ids,String xqs);
	//判断代码是否重复
	public Integer queryByDmCount(XnxqbEntity xnxqbEntity);
	//根据代码查询学年学期
	public XnxqbEntity queryXnxqByDm(XnxqbEntity xnxqbEntity);
}

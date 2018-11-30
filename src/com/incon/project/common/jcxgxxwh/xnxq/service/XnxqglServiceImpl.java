package com.incon.project.common.jcxgxxwh.xnxq.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.jcxgxxwh.XnxqbEntity;



/**
 * 
 * @类名： com.incon.project.common.jcxgxxwh.xnxq.service.XnxqglServiceImpl
 * @创建人： 杨文龙
 * @日期： 2014-4-2
 * @修改人：
 * @日期：
 * @描述：专业类别接口的实现类  
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value="xnxqglService")
public class XnxqglServiceImpl extends CommServiceImpl implements XnxqglService{

	//增加学年学期
	@Override
	@MethodLog(description="增加学年学期")
	public void addXnxq(XnxqbEntity xnxqbEntity) {
		dbDao.insert("xnxqgl.addXnxq", xnxqbEntity);

	}
	//删除专业类别
	@Override
	@MethodLog(description="删除学年学期")
	public void delXnxq(String[] ids,String xqs) {
		String[] xq = xqs.split(",");
		List<XnxqbEntity> list = new ArrayList<XnxqbEntity>();
		for (int i = 0; i < xq.length; i++) {
			XnxqbEntity xnxqbEntity = new XnxqbEntity();
			xnxqbEntity.setXn(ids[i]);
			xnxqbEntity.setXq(xq[i]);
			list.add(xnxqbEntity);
		}
		dbDao.delete("xnxqgl.delXnxq", list);

	}
	//查询代码是否重复
	@Override
	public Integer queryByDmCount(XnxqbEntity xnxqbEntity) {
		
		return (Integer) dbDao.queryForObject("xnxqgl.queryByDmCount", xnxqbEntity);
	}
	//查询学年学期列表
	@Override
	public List<XnxqbEntity> queryXnxqList() {
		
		return dbDao.query("xnxqgl.queryXnxqList");
	}
	//修改学年学期
	@Override
	@MethodLog(description="根据代码修改学年学期")
	public void updXnxq(XnxqbEntity xnxqbEntity) {
		dbDao.update("xnxqgl.updXnxq", xnxqbEntity);

	}
	//根据代码查询学年学期
	@Override
	public XnxqbEntity queryXnxqByDm(XnxqbEntity xnxqbEntity) {
		
		return (XnxqbEntity) dbDao.queryForObject("xnxqgl.queryXnxqByDm", xnxqbEntity);
	}
}

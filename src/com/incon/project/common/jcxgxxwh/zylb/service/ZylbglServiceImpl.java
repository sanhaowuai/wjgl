package com.incon.project.common.jcxgxxwh.zylb.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.jcxgxxwh.ZylbbEntity;
/**
 * 
 * @类名：  com.incon.project.common.jcxxwh.zylb.service.ZylbglServiceImpl
 * @创建人： 杨文龙
 * @日期： 2014-4-1
 * @修改人：
 * @日期：
 * @描述：专业类别接口的实现类  
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value="zylbglService")
public class ZylbglServiceImpl extends CommServiceImpl implements ZylbglService {
	//增加专业类别
	@Override
	@MethodLog(description="增加专业类别")
	public void addZylb(ZylbbEntity zylbbEntity) {
		dbDao.insert("zylbgl.addZylb", zylbbEntity);

	}
	//删除专业类别
	@Transactional
	@Override
	@MethodLog(description="删除专业类别")
	public void delZylb(String[] ids) {
		dbDao.executeBatchOperation("zylbgl.delZylb", Arrays.asList(ids), "delete");

	}
	//查询代码是否重复
	@Override
	public Integer queryByDmCount(String dm) {
		
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("zylbgl.queryByDmCount", dm)));
	}
	//查询专业类别列表
	@Override
	public List<ZylbbEntity> queryZylbList() {
		
		return dbDao.query("zyblgl.queryZylbList");
	}
	//修改专业类别
	@Override
	@MethodLog(description="根据代码修改专业类别")
	public void updZylb(ZylbbEntity zylbbEntity) {
		dbDao.update("zylbgl.updZylb", zylbbEntity);

	}
	//根据代码查询专业类别
	@Override
	public ZylbbEntity queryZylbByDm(String dm) {
		
		return (ZylbbEntity) dbDao.queryForObject("zylbgl.queryZylbByDm", dm);
	}

}

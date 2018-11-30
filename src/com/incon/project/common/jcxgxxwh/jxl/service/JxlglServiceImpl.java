package com.incon.project.common.jcxgxxwh.jxl.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.jcxgxxwh.JxlbEntity;
import com.incon.pojo.common.jcxgxxwh.XiaoqubEntity;


/**
 * 
 * @类名：  com.incon.project.common.jcxxwh.zylb.service.ZylbglServiceImpl
 * @创建人： 杨文龙
 * @日期： 2014-4-1
 * @修改人：
 * @日期：
 * @描述：教学楼管理接口的实现类  
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value="jxlglService")
public class JxlglServiceImpl extends CommServiceImpl implements JxlglService{

	//增加教学楼
	@Override
	@MethodLog(description="增加教学楼")
	public void addJxl(JxlbEntity jxlbEntity) {
		dbDao.insert("jxlgl.addJxl", jxlbEntity);

	}
	
	//判断教学楼是否被使用
	@Override
	public String queryExit(String ids){
		Integer j = 0;
		String mc = "";
		String[] id = ids.split(",");
		for (int i = 0; i < id.length; i++) {
			j = j + (Integer) dbDao.queryForObject("jxlgl.queryExit",id[i]);
			if(j>0){
				String dm = id[i];
				JxlbEntity jxlbEntity =(JxlbEntity) dbDao.queryForObject("jxlgl.queryJxlByDm", dm);
				mc += jxlbEntity.getMc() + " ";
				j=0;
			}
		}
		return mc;
	}
	
	//删除教学楼
	@Transactional
	@Override
	@MethodLog(description="删除教学楼")
	public void delJxl(String[] ids) {
		dbDao.executeBatchOperation("jxlgl.delJxl", Arrays.asList(ids), "delete");

	}
	//查询代码是否重复
	@Override
	public Integer queryByDmCount(String dm) {
		
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("jxlgl.queryByDmCount", dm)));
	}
	//查询教学楼列表
	@Override
	public List<JxlbEntity> queryJxlList() {
		
		return dbDao.query("jxlgl.queryJxlList");
	}
	//修改教学楼
	@Override
	@MethodLog(description="根据代码修改教学楼")
	public void updJxl(JxlbEntity jxlbEntity) {
		dbDao.update("jxlgl.updJxl", jxlbEntity);

	}
	//根据代码查询教学楼
	@Override
	public JxlbEntity queryJxlByDm(String dm) {
		
		return (JxlbEntity) dbDao.queryForObject("jxlgl.queryJxlByDm", dm);
	}
	@Override
	public List<XiaoqubEntity> queryXiaoquList() {
		
		return dbDao.query("bjgl.queryXiaoquList");
	}
}


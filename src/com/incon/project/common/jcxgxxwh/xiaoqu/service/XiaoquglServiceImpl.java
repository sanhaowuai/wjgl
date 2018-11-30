package com.incon.project.common.jcxgxxwh.xiaoqu.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.jcxgxxwh.XiaoqubEntity;



/**
 * 
 * @类名：  com.incon.project.common.jcxxwh.zylb.service.ZylbglServiceImpl
 * @创建人： 杨文龙
 * @日期： 2014-4-1
 * @修改人：
 * @日期：
 * @描述：校区接口的实现类  
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value="xiaoquglService")
public class XiaoquglServiceImpl extends CommServiceImpl implements XiaoquglService{

	//增加校区
	@Override
	@MethodLog(description="增加校区")
	public void addXiaoqu(XiaoqubEntity xiaoqubEntity) {
		dbDao.insert("xiaoqugl.addXiaoqu", xiaoqubEntity);

	}
	
	//判断校区是否被使用
	@Override
	public String queryExit(String ids){
		Integer j = 0;
		String mc = "";
		String[] id = ids.split(",");
		for (int i = 0; i < id.length; i++) {
			//判断是否被班级使用
			j = j + (Integer) dbDao.queryForObject("xiaoqugl.queryExitBj",id[i]);
			//判断是否被教学楼使用
			j = j + (Integer) dbDao.queryForObject("xiaoqugl.queryExitJxl",id[i]);
			//判断是否被教学场地使用
			j = j + (Integer) dbDao.queryForObject("xiaoqugl.queryExitJxcd",id[i]);
			if(j>0){
				String dm = id[i];
				XiaoqubEntity xiaoqubEntity =(XiaoqubEntity) dbDao.queryForObject("xiaoqugl.queryXiaoquByDm", dm);
				mc += xiaoqubEntity.getMc() + " ";
				j=0;
			}
		}
		return mc;
	}
	
	//删除校区
	@Transactional
	@Override
	@MethodLog(description="删除校区")
	public void delXiaoqu(String[] ids) {
		dbDao.executeBatchOperation("xiaoqugl.delXiaoqu", Arrays.asList(ids), "delete");

	}
	//查询代码是否重复
	@Override
	public Integer queryByDmCount(String dm) {
		
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("xiaoqugl.queryByDmCount", dm)));
	}
	//查询校区列表
	@Override
	public List<XiaoqubEntity> queryXiaoquList() {
		
		return dbDao.query("xiaoqugl.queryXiaoquList");
	}
	//修改校区
	@Override
	@MethodLog(description="根据代码修改校区")
	public void updXiaoqu(XiaoqubEntity xiaoqubEntity) {
		dbDao.update("xiaoqugl.updXiaoqu", xiaoqubEntity);

	}
	//根据代码查询校区
	@Override
	public XiaoqubEntity queryXiaoquByDm(String dm) {
		
		return (XiaoqubEntity) dbDao.queryForObject("xiaoqugl.queryXiaoquByDm", dm);
	}
}

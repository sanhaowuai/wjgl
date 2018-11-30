package com.incon.project.common.jcxgxxwh.cdlb.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.jcxgxxwh.CdlbbEntity;



/**
 * 
 * @类名： com.incon.project.common.jcxgxxwh.cdlb.service.CdlbglServiceImpl
 * @创建人： 杨文龙
 * @日期： 2014-4-2
 * @修改人：
 * @日期：
 * @描述：场地类别接口的实现类  
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value="cdlbglService")
public class CdlbglServiceImpl extends CommServiceImpl implements CdlbglService{

	//增加场地类别
	@Override
	@MethodLog(description="增加场地类别")
	public void addCdlb(CdlbbEntity cdlbbEntity) {
		dbDao.insert("cdlbgl.addCdlb", cdlbbEntity);

	}
	
	//判断岗位类型是否被使用
	@Override
	public String queryExit(String ids){
		Integer j = 0;
		String mc = "";
		String[] id = ids.split(",");
		for (int i = 0; i < id.length; i++) {
			j = j + (Integer) dbDao.queryForObject("cdlbgl.queryExit",id[i]);
			if(j>0){
				String dm = id[i];
				CdlbbEntity cdlbbEntity =(CdlbbEntity) dbDao.queryForObject("cdlbgl.queryCdlbByDm", dm);
				mc += cdlbbEntity.getMc() + " ";
				j=0;
			}
		}
		return mc;
	}
	
	//删除场地类别
	@Transactional
	@Override
	@MethodLog(description="删除场地类别")
	public void delCdlb(String[] ids) {
		dbDao.executeBatchOperation("cdlbgl.delCdlb", Arrays.asList(ids), "delete");

	}
	//查询代码是否重复
	@Override
	public Integer queryByDmCount(String dm) {
		
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("cdlbgl.queryByDmCount", dm)));
	}
	//查询场地类别列表
	@Override
	public List<CdlbbEntity> queryCdlbList() {
		
		return dbDao.query("cdlbgl.queryCdlbList");
	}
	//修改场地类别
	@Override
	@MethodLog(description="根据代码修改场地类别")
	public void updCdlb(CdlbbEntity cdlbbEntity) {
		dbDao.update("cdlbgl.updCdlb", cdlbbEntity);

	}
	//根据代码查询场地类别
	@Override
	public CdlbbEntity queryCdlbByDm(String dm) {
		
		return (CdlbbEntity) dbDao.queryForObject("cdlbgl.queryCdlbByDm", dm);
	}
}

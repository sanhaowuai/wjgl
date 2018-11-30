package com.incon.project.common.jcxgxxwh.jys.service;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.YxdmbEntity;
import com.incon.pojo.common.jcxgxxwh.JysbEntity;
import com.incon.pojo.common.jcxgxxwh.JyslxbEntity;



/**
 * 
 * @类名：  com.incon.project.common.jcxgxxwh.jys.service.JysglServiceImpl
 * @创建人： 杨文龙
 * @日期： 2014-4-1
 * @修改人：
 * @日期：
 * @描述：教研室接口的实现类  
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value="jysglService")
public class JysglServiceImpl extends CommServiceImpl implements JysglService{
	
	//查询教研室类型
	@Override
	public List<JyslxbEntity> queryJyslx(){
		return dbDao.query("jysgl.queryJyslx");
	}
	
	//查询学院
	@Override
	public List<YxdmbEntity> queryXy(){
		return dbDao.query("jysgl.queryXy");
	}
	
	//查询系列表
	@Override
	public List<YxdmbEntity> queryXList(String yxdm){
		return dbDao.query("jysgl.queryXList",yxdm);
	}
	
	//查询院是否为管理院系
	@Override
	public YxdmbEntity querySfglbm(YxdmbEntity yxdmbEntity){
		return (YxdmbEntity) dbDao.queryForObject("jysgl.querySfglbm",yxdmbEntity);
	}
	
	//增加教研室
	@Override
	@MethodLog(description="增加教研室")
	public void addJys(JysbEntity jysbEntity) {
		dbDao.insert("jysgl.addJys", jysbEntity);

	}
	//删除教研室
	@Transactional
	@Override
	@MethodLog(description="删除教研室")
	public void delJys(String[] ids) {
		dbDao.executeBatchOperation("jysgl.delJys", Arrays.asList(ids), "delete");

	}
	//查询代码是否重复
	@Override
	public Integer queryByDmCount(String jysdm) {
		
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("jysgl.queryByDmCount", jysdm)));
	}
	//查询教研室列表
	@Override
	public List<JysbEntity> queryJysList() {
		
		return dbDao.query("jysgl.queryJysList");
	}
	//修改专业类别
	@Override
	@MethodLog(description="根据代码修改教研室")
	public void updJys(JysbEntity jysbEntity) {
		dbDao.update("jysgl.updJys", jysbEntity);

	}
	//根据代码查询教研室
	@Override
	public JysbEntity queryJysByDm(String jysdm) {
		
		return (JysbEntity) dbDao.queryForObject("jysgl.queryJysByDm", jysdm);
	}

	@Override
	public int queryJyssjqxCount(Map map) {
		
		return (Integer)dbDao.queryForObject("jysgl.queryJyssjqxCount",map);
	}

	@Override
	public UserEntity queryUser(UserEntity userEntity) {
		
		return (UserEntity) dbDao.queryForObject("jysgl.queryUser", userEntity);
	}

	
}

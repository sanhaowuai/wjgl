package com.incon.project.common.jcxgxxwh.bj.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.XyzybEntity;
import com.incon.pojo.common.YxdmbEntity;
import com.incon.pojo.common.ZybEntity;
import com.incon.pojo.common.jcxgxxwh.BjbEntity;
import com.incon.pojo.common.jcxgxxwh.NjbEntity;
import com.incon.pojo.common.jcxgxxwh.XiaoqubEntity;



/**
 * 
 * @类名：  com.incon.project.common.jcxxwh.zylb.service.ZylbglServiceImpl
 * @创建人： 杨文龙
 * @日期： 2014-4-1
 * @修改人：
 * @日期：
 * @描述：班级接口的实现类  
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value="bjglService")
public class BjglServiceImpl extends CommServiceImpl implements BjglService{
	
	//查询所有院系
	@Override
	public List<YxdmbEntity> queryYxLists(){
		return dbDao.query("bjgl.queryYx");
	}
	
	//增加班级
	@Override
	@MethodLog(description="增加班级")
	public void addBj(BjbEntity bjbEntity) {
		dbDao.insert("bjgl.addBj", bjbEntity);

	}
	//删除班级
	@Transactional
	@Override
	@MethodLog(description="删除班级")
	public void delBj(String[] ids) {
		dbDao.executeBatchOperation("bjgl.delBj", Arrays.asList(ids), "delete");

	}
	//查询代码是否重复
	@Override
	public Integer queryByDmCount(String bjdm) {
		
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("bjgl.queryByDmCount", bjdm)));
	}
	//查询班级列表
	@Override
	public List<BjbEntity> queryBjList() {
		return dbDao.query("bjgl.queryBjList");
	}
	//修改班级
	@Override
	@MethodLog(description="根据代码修改班级")
	public void updBj(BjbEntity bjbEntity) {
		dbDao.update("bjgl.updBj", bjbEntity);

	}
	//根据代码查询班级
	@Override
	public BjbEntity queryBjByDm(String bjdm) {
		
		return (BjbEntity) dbDao.queryForObject("bjgl.queryBjByDm", bjdm);
	}
	@Override
	public List<YxdmbEntity> queryYxList() {
		
		return dbDao.query("bjgl.queryYxList");
	}
	
	//查询系列表
	public List<YxdmbEntity> queryXList(String yxdm){
		return dbDao.query("bjgl.queryXList",yxdm);
	}
	
	//查询专业列表

	public List<ZybEntity> queryZyList(String xydm) {
		return dbDao.query("bjgl.queryZyList",xydm);
	}
	
	
	@Override
	public List<NjbEntity> queryNjList() {
	
		return dbDao.query("bjgl.queryNjList");
	}
	@Override
	public List<XiaoqubEntity> queryXiaoquList() {
	
		return dbDao.query("bjgl.queryXiaoquList");
	}
	
	//查询院是否为管理院系
	@Override
	public YxdmbEntity querySfglbm(YxdmbEntity yxdmbEntity){
		return (YxdmbEntity) dbDao.queryForObject("bjgl.querySfglbm",yxdmbEntity);
	}
	
	//根据系查询专业
	@Override
	public List<ZybEntity> queryZyListByX(String xydm){
		return dbDao.query("bjgl.queryZyListByX",xydm);
	}

	@Override
	public UserEntity queryUser(UserEntity userEntity) {
		
		return (UserEntity) dbDao.queryForObject("bjgl.queryUser", userEntity);
	}
}

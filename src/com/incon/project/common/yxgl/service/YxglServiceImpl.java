package com.incon.project.common.yxgl.service;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.XyzybEntity;
import com.incon.pojo.common.YxdmbEntity;
import com.incon.pojo.common.ZybEntity;

/**
 * 
 * @类名：  com.incon.project.common.yxgl.service.YxglServiceImpl
 * @创建人： 马爽
 * @日期： 2014-3-24
 * @修改人：
 * @日期：
 * @描述：  
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value="yxglService")
public class YxglServiceImpl extends CommServiceImpl implements YxglService{
	//新增院系
	@Override
	@MethodLog(description="增加院系")
	@Transactional
	public void addYx(YxdmbEntity yxdmbEntity) {
		dbDao.insert("yxgl.addYx", yxdmbEntity);	
	}
	//新增数据查询
	@Override
	@MethodLog(description="新增数据查询权限")
	@Transactional
	public void addSjqx(YxdmbEntity yxdmbEntity) {
		dbDao.insert("yxgl.addSjqx", yxdmbEntity);
		
	}
	//修改院系
	@Override
	@MethodLog(description="修改院系")
	@Transactional
	public void updYx(YxdmbEntity yxdmbEntity) {
		dbDao.update("yxgl.updYx", yxdmbEntity);
		
	}
	//删除院系
	@Override
	@MethodLog(description="删除院系")
	@Transactional
	public void delYx(String[] ids) {
	
		dbDao.executeBatchOperation("yxgl.delYx", Arrays.asList(ids), "delete");
	}
	//查询一个院系
	@Override
	public YxdmbEntity queryOneYx(String yxdm) {	
		 return (YxdmbEntity)dbDao.queryForObject("yxgl.queryOneYx", yxdm);
		
	}

	//查询yxdm是否重复
	@Override
	public Integer queryByYxdmCount(String yxdm){
		return (Integer)dbDao.queryForObject("yxgl.queryByYxdmCount", yxdm);
	}
	//
	@Override
	public List<Map> querySjyxList() {
		return dbDao.query("yxgl.querySjyx");
	}
	@Override
	public List<Map> queryXjslList() {
		
		return dbDao.query("yxgl.queryXjsl");
	}
	@Override
	public List<ZybEntity> queryZy(Map<String,String> map) {
		return dbDao.query("yxgl.queryZy", map);
	}
	
	//添加学院专业表
	@Transactional
	@Override
	public void addXyzyb(String xydm,List<XyzybEntity> list){
		dbDao.delete("yxgl.delXyzyb", xydm);
		dbDao.executeBatchOperation("yxgl.addXyzyb",list, "insert");
	}
	
	//查询院是否为管理院系
	@Override
	public YxdmbEntity querySfglbm(YxdmbEntity yxdmbEntity){
		return (YxdmbEntity) dbDao.queryForObject("bjgl.querySfglbm",yxdmbEntity);
	}
	
	@Override
	public UserEntity queryUser(UserEntity userEntity) {
		
		return (UserEntity) dbDao.queryForObject("jysgl.queryUser", userEntity);
	}
}

package com.incon.project.common.yxgl.service;

import java.util.List;
import java.util.Map;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.XyzybEntity;
import com.incon.pojo.common.YxdmbEntity;
import com.incon.pojo.common.ZybEntity;


/**
 * 
 * @类名：  com.incon.project.teacher.jspk.service.JspkService
 * @修改人：
 * @日期：
 * @描述：  
 * @版本号：
 */
@SuppressWarnings("all")
public interface YxglService extends CommService{
	
	//新增院系
	public void addYx(YxdmbEntity yxdmbEntity);
	
	//修改院系
	public void updYx(YxdmbEntity yxdmbEntity);
	
	//查询一个院系
	public YxdmbEntity queryOneYx(String yxdm);
	
	//查询yxdm是否重复
	public Integer queryByYxdmCount(String yxdm);
	
	//删除院系
	public void delYx(String[] ids);
	
	//查询上级院系
	public List<Map> querySjyxList();
	
	//查询上级院系
	public List<Map> queryXjslList();
	
	//根据院系代码查询专业
	public List<ZybEntity> queryZy(Map<String,String> map);

	//添加学院专业表
	public void addXyzyb(String xydm,List<XyzybEntity> list);
	
	//查询院是否为管理院系
	public YxdmbEntity querySfglbm(YxdmbEntity yxdmbEntity);
	
	public UserEntity queryUser(UserEntity userEntity);

	public void addSjqx(YxdmbEntity yxdmbEntity);
}

package com.incon.project.common.juesgl.service;

import java.util.List;
import java.util.Map;

import com.incon.framework.service.CommService;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.JsqxbEntity;
import com.incon.pojo.common.UserEntity;

/**
 * 
 * @类名：  com.incon.project.common.juesgl.service.JuesglService
 * @创建人：于洋
 * @日期： 2013-3-14
 * @修改人：
 * @日期：
 * @描述：  角色管理接口
 * @版本号：
 */
@SuppressWarnings("all")
public interface JuesglService extends CommService{
	//增加角色
	public void addJs(JsbEntity jsbEntity);
	
	//根据角色代码查询角色
	public JsbEntity queryJsByJsdm(String jsdm);
	
	//根据角色代码修改角色
	public void updJsByJsdm(JsbEntity jsbEntity);
	
	//获取权限树形菜单
	public List<Map<String,String>> queryQx(Map<String, String> map);
	
	//获取要修改权限的角色的当前权限（比对去掉的以及新加的）
	public void addQx(String jsdm,String obj,String objqxfdm,String objqxzt,UserEntity user);
	
	//删除角色
	public void delJs(String[] ids);
	
	//查询jsdm是否重复
	public Integer queryByJsdmCount(String jsdm);

	public Integer queryReCount(JsqxbEntity jsqxbEntity);

	void addRyjsbByJsdm(String yhdm, String jsdm);
}

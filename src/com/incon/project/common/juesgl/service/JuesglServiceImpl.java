package com.incon.project.common.juesgl.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.JsanbEntity;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.JsqxbEntity;
import com.incon.pojo.common.UserEntity;

/**
 * 
 * @类名：  com.incon.project.common.juesgl.service.JuesglServiceImpl
 * @创建人： 于洋	
 * @日期： 2013-03-14
 * @修改人：
 * @日期：
 * @描述：  角色管理接口的实现类
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value= "juesglService")
public class JuesglServiceImpl extends CommServiceImpl implements JuesglService{
	//增加角色
	@Override
	@MethodLog(description="增加角色")
	public void addJs(JsbEntity jsbEntity){
		dbDao.insert("juesgl.addJs", jsbEntity);
	}
	
	//根据角色代码查询角色
	@Override
	public JsbEntity queryJsByJsdm(String jsdm){
		return (JsbEntity) dbDao.queryForObject("juesgl.queryJsByJsdm", jsdm);
	}
	
	//根据角色代码修改角色
	@Override
	@MethodLog(description="根据角色代码修改角色")
	public void updJsByJsdm(JsbEntity jsbEntity){
		dbDao.update("juesgl.updJsByJsdm", jsbEntity);
	}
	
	//获取权限树形菜单
	@Override
	public List<Map<String,String>> queryQx(Map<String, String> map){
		Integer count=(Integer) dbDao.queryForObject("juesgl.queryQxZt", map);
		if(count!=0){
			map.put("zt", "1");
		}else {
			map.put("zt", "0");
		}
		return dbDao.query("juesgl.queryQx",map);
	}
	
	//获取要修改权限的角色的当前权限（比对去掉的以及新加的）
	@Override
	@Transactional
	@MethodLog(description="获取要修改权限的角色的当前权限（比对去掉的以及新加的）")
	public void addQx(String jsdm,String obj,String objqxfdm,String objqxzt,UserEntity user){
		//List<String> list1 = new ArrayList<String>();		//该角色已有权限
		//List<String> list2 = new ArrayList<String>();		//前台传过来要改动的权限
		//List<String> list3 = new ArrayList<String>();		//要删除的权限
		//List<String> list4 = new ArrayList<String>();		//要新增的权限
		JsqxbEntity jsqxbEntity = new JsqxbEntity();
		jsqxbEntity.setJsdm(jsdm);
		JsanbEntity jsanbEntity = new JsanbEntity();
		jsanbEntity.setJsdm(jsdm);
		
		jsqxbEntity.setSfcjgly(user.getSfcjgly());
		jsqxbEntity.setDqJsdm(user.getJsdm());
		jsqxbEntity.setDqYhdm(user.getYhdm());
		jsqxbEntity.setReCount(queryReCount(jsqxbEntity));
		
		
		jsanbEntity.setSfcjgly(user.getSfcjgly());
		jsanbEntity.setDqJsdm(user.getJsdm());
		jsanbEntity.setDqYhdm(user.getYhdm());
		jsanbEntity.setReCount(queryReCount(jsqxbEntity));
		
		List<Map<String,String>> list1 = dbDao.query("juesgl.queryJsqxByJsdm",jsdm);
		///////////////删除用begin///////////////
		List<String> list7 = new ArrayList<String>();	//菜单级别	1：菜单  2：按钮
		List<String> list8 = new ArrayList<String>();	//菜单父代码
		for(int i = 0;i < list1.size();i++){
			list7.add(null == list1.get(i).get("QXDM") ? "" : list1.get(i).get("QXDM"));
			list8.add(null == list1.get(i).get("FDM") ? "" : list1.get(i).get("FDM"));
		}
		///////////////删除用end///////////////
		String[] ret = obj.split(",");
		List<String> list2 = null;
		if(obj==null || obj.trim().equals("")){
			list2 = new ArrayList<String>();
		}else {
			list2 = Arrays.asList(ret);		//菜单
		}
		///////////////增加用begin///////////////
		String[] retqxfdm = objqxfdm.split(",");
		String[] retqxzt = objqxzt.split(",");
		List<String> list5 = Arrays.asList(retqxfdm);	//菜单父代码
		List<String> list6 = Arrays.asList(retqxzt);	//菜单状态  1：菜单   2：按钮
		///////////////增加用end///////////////
		for (int i = 0; i < list7.size(); i++) {		//角色已有权限and前台传过来要改动的权限比对    要删除的权限
			if (!list2.contains(list7.get(i))) {
				//list3.add(list1.get(i));
				if(list1.get(i).get("JB").equals("1")){
					jsqxbEntity.setQxdm(list7.get(i));
					dbDao.delete("juesgl.delQx", jsqxbEntity);
				}else{
					jsanbEntity.setAndm(list7.get(i));
					jsanbEntity.setSscddm(list8.get(i));
					dbDao.delete("juesgl.delJsan", jsanbEntity);
				}
			}
		}
		for (int i = 0; i < list2.size(); i++) {		//角色已有权限and前台传过来要改动的权限比对    要新增的权限
			if (!list7.contains(list2.get(i))) {
				//list4.add(list2.get(i));
				if(list6.get(i).equals("1")){			//增加角色权限（菜单）
					jsqxbEntity.setQxdm(list2.get(i));
					dbDao.insert("juesgl.addQx", jsqxbEntity);
				}else{									//增加角色按钮
					jsanbEntity.setAndm(list2.get(i));
					jsanbEntity.setSscddm(list5.get(i));
					dbDao.insert("juesgl.addJsan", jsanbEntity);
				}
			}
		}
	}
	
	//删除角色
	@Override
	@Transactional
	@MethodLog(description="删除角色")
	public void delJs(String[] ids){
		dbDao.executeBatchOperation("juesgl.delJs", Arrays.asList(ids), "delete");
	}
	
	//查询jsdm是否重复
	@Override
	public Integer queryByJsdmCount(String jsdm){
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("juesgl.queryByJsdmCount", jsdm)));
	}
	//查询人员角色权限表中是否有记录
	@Override
	public Integer queryReCount(JsqxbEntity jsqxbEntity){
		return (Integer)dbDao.queryForObject("juesgl.queryReCount", jsqxbEntity);
	}
	//根据角色代码批量插入用户角色比表
	@Override
	public void addRyjsbByJsdm(String yhdm,String jsdm){
		HashMap map = new HashMap();
		map.put("yhdm",yhdm);
		map.put("jsdm",jsdm);
		dbDao.insert("juesgl.addRyjsbByJsdm", map);
	}

}

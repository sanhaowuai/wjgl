package com.incon.project.common.qxcdgl.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.HelpbEntity;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.JsqxbEntity;
import com.incon.pojo.common.QxEntity;
import com.incon.pojo.common.RyjsqxbEntity;

/**
 * 
 * @类名：  com.incon.project.common.qxcdgl.service.QxcdglServiceImpl
 * @创建人： 樊旭	
 * @日期： 2013-03-11
 * @修改人：
 * @日期：
 * @描述：  
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value= "qxcdglService")
public class QxcdglServiceImpl extends CommServiceImpl implements QxcdglService {
	//查询所有菜单
	@Override
	public List<QxEntity> queryAll(String cxjsdm){
		return dbDao.query("qxcdgl.queryQx",cxjsdm);
	}
	
	//查询菜单名称
	@Override
	public List<QxEntity> queryQxcdgl(){
		return dbDao.query("qxcdgl.queryCdmc");
	}
	
	//添加权限菜单
	@Override
	@Transactional
	@MethodLog(description="添加权限菜单")
	public QxEntity addQxcd(QxEntity qxcdglEntity){
		QxEntity qxEntity = new QxEntity();
		String qxdm = "";
		dbDao.insert("qxcdgl.addQxcd", qxcdglEntity);
		qxEntity.setFqxdm(qxcdglEntity.getFqxdm());
		if(qxcdglEntity.getFqxdm().equals("-1")){
			qxdm = (String) dbDao.queryForObject("qxcdgl.queryQxdm",qxcdglEntity);
			if(Integer.parseInt(qxdm) >= 10){
				qxEntity.setQxdm(qxdm.substring(1));
			}else{
				qxEntity.setQxdm(qxdm);
			}
		}else{
			qxdm = (String) dbDao.queryForObject("qxcdgl.queryQxdm",qxcdglEntity);
			if(Integer.parseInt(qxcdglEntity.getFqxdm()) >= 10 && qxcdglEntity.getFqxdm().length() == 2){
				qxEntity.setQxdm(qxdm.substring(1));
			}else if(Integer.parseInt(qxcdglEntity.getFqxdm().substring(0,2)) >= 10 && qxcdglEntity.getFqxdm().length() == 4 ){
				qxEntity.setQxdm(qxdm.substring(1));
			}
			else{
				qxEntity.setQxdm(qxdm);
			}
		}
		return qxEntity;
	}
	
	//查询所有角色
	@Override
	public List<JsbEntity> queryJs(String qxdm){
		return dbDao.query("qxcdgl.queryJs", qxdm);
	}
	
	//为角色添加权限前，判断此角色中是否存在此权限的父类权限，如果没有，那么添加父类权限
	@Override
	@Transactional
	public void queryFcd(JsqxbEntity jsqxbEntity){
		JsqxbEntity jsEntity = new JsqxbEntity();
		jsEntity.setSfmrkf(jsqxbEntity.getSfmrkf());
		String[] jsdm = jsqxbEntity.getJsdm().split(",");
		List<String> js = new ArrayList<String>();
		List<String> list2 = Arrays.asList(jsdm);
		String fdm = (String) dbDao.queryForObject("qxcdgl.queryFcd", jsqxbEntity.getFqxdm());
		if(fdm.equals("-1")){
			fdm = jsqxbEntity.getFqxdm();
			jsEntity.setQxdm(jsqxbEntity.getFqxdm());
			js = dbDao.query("qxcdgl.JsqxCount",fdm);
			for (int i = 0; i < list2.size(); i++) {
				if(!js.contains(list2.get(i))){
					jsEntity.setJsdm(list2.get(i));
					dbDao.insert("qxcdgl.insertForFdm", jsEntity);
				}
			}
		}else{
			js = dbDao.query("qxcdgl.JsqxCount",fdm);
			jsEntity.setQxdm(fdm);
			for (int i = 0; i < list2.size(); i++) {  
				if(!js.contains(list2.get(i))){
					jsEntity.setJsdm(list2.get(i));
					dbDao.insert("qxcdgl.insertForFdm", jsEntity);
				}
			}
			
			jsEntity.setQxdm(jsqxbEntity.getFqxdm());
			for (int i = 0; i < list2.size(); i++) {
				if(!js.contains(list2.get(i))){
					jsEntity.setJsdm(list2.get(i));
					dbDao.insert("qxcdgl.insertForFdm", jsEntity);
				}
			}
		}
	}
	
	//添加角色权限表
	@Override
	@Transactional
	@MethodLog(description="添加角色权限表")
	public JsqxbEntity addJsqx(List<JsqxbEntity> list){
		return (JsqxbEntity) dbDao.insert("qxcdgl.addJsqx",list);
	}
	
	//为人员角色添加权限前，判断此人员是否存在此权限的父类权限，如果没有，那么添加父类权限
	@Override
	@Transactional
	public void queryFryjs(RyjsqxbEntity ryjsqxbEntity){
		RyjsqxbEntity ryEntity = new RyjsqxbEntity();
		String[] yhdm = ryjsqxbEntity.getYhdm().split(",");
		String[] jsdm = ryjsqxbEntity.getJsdm().split(",");
		List<RyjsqxbEntity> list1 = new ArrayList<RyjsqxbEntity>();
		List<String> list2 = Arrays.asList(yhdm);
		List<String> list3 = Arrays.asList(jsdm);
		List<String> list4 = new ArrayList<String>();
		List<String> list5 = new ArrayList<String>();
		String fdm = (String) dbDao.queryForObject("qxcdgl.queryFcd", ryjsqxbEntity.getFqxdm());
		if(fdm.equals("-1")){         //如果为-1，是二级菜单
			fdm = ryjsqxbEntity.getFqxdm();
			ryEntity.setQxdm(fdm);
			list1 = dbDao.query("qxcdgl.RyjsqxCount",fdm);
			for (int i = 0; i < list1.size(); i++) {
				list4.add(list1.get(i).getYhdm());      //我已有的用户代码
				list5.add(list1.get(i).getJsdm());		//我已有的角色代码
			}
			for (int i = 0; i < list2.size(); i++) {
				if(!list4.contains(list2.get(i)) && !list5.contains(list3.get(i))){
					ryEntity.setYhdm(list2.get(i));
					ryEntity.setJsdm(list3.get(i));
					dbDao.insert("qxcdgl.insertForRyjs", ryEntity);
				}
			}
		}else{           //不为-1，是三级菜单
			ryEntity.setQxdm(fdm);
			list1 = dbDao.query("qxcdgl.RyjsqxCount",fdm);
			for (int i = 0; i < list1.size(); i++) {
				list4.add(list1.get(i).getYhdm());      //我已有的用户代码
				list5.add(list1.get(i).getJsdm());		//我已有的角色代码
			}
			for (int i = 0; i < list2.size(); i++) {
				if(!list4.contains(list2.get(i)) && !list5.contains(list3.get(i))){
					ryEntity.setYhdm(list2.get(i));
					ryEntity.setJsdm(list3.get(i));
					dbDao.insert("qxcdgl.insertForRyjs", ryEntity);
				}
			}
			
			ryEntity.setQxdm(ryjsqxbEntity.getFqxdm());
			for (int i = 0; i < list2.size(); i++) {
				if(!list4.contains(list2.get(i)) && !list5.contains(list3.get(i))){
					ryEntity.setYhdm(list2.get(i));
					ryEntity.setJsdm(list3.get(i));
					dbDao.insert("qxcdgl.insertForRyjs", ryEntity);
				}
			}
		}
	}
	
	//添加人员角色权限表
	@Override
	@MethodLog(description="添加人员角色权限表")
	public RyjsqxbEntity addRyjsqxb(List<RyjsqxbEntity> list){
		return (RyjsqxbEntity) dbDao.insert("qxcdgl.addRyjsqxb",list);
	}
	
	//根据权限代码查询权限
	@Override
	public QxEntity queryByQxdm(String zhi){
		return (QxEntity) dbDao.queryForObject("qxcdgl.queryByQxdm",zhi);
	}
	
	//根据权限代码修改权限
	@Override
	@MethodLog(description="修改权限菜单")
	public void updQxcd(QxEntity qxEntity){
		dbDao.update("qxcdgl.updQxcd",qxEntity);
	}
	
	//删除权限菜单
	@Override
	@MethodLog(description="删除权限菜单")
	public void delQx(String qxdm){
		dbDao.delete("qxcdgl.delQx",qxdm);
	}
	
	//改变显示顺序
	@Override
	@MethodLog(description="改变菜单显示顺序")
	public void updXssx(QxEntity qxEntity){
		dbDao.update("qxcdgl.changeXssx",qxEntity);
	}
	
	// 添加菜单时，判断访问路径是否存在
	@Override
	public Integer pdAddFwlj(Map map){
		return (Integer)this.dbDao.queryForObject("qxcdgl.pdAddFwlj", map);
	}
	//修改菜单时，判断访问路径是否存在
	@Override
	public Integer pdUpdFwlj(Map map){
		return (Integer)this.dbDao.queryForObject("qxcdgl.pdUpdFwlj", map);
	}

	@Override
	public ArrayList<HelpbEntity> excelDcsj() {
		// TODO Auto-generated method stub
		return (ArrayList<HelpbEntity>)dbDao.query("qxcdgl.excelDcsj");
	}

	@Override
	public void delHelp() {
		// TODO Auto-generated method stub
		dbDao.delete("qxcdgl.delHelp",null);
	}

	@Override
	public void addHelp(HelpbEntity t) {
		// TODO Auto-generated method stub
		dbDao.insert("qxcdgl.addHelp", t);
	}
	
	@Override
	public void delJsqxByQxdm(Map<String, String> czmap) {
		// TODO Auto-generated method stub
		dbDao.delete("qxcdgl.delJsqxByQxdm", czmap);
	}

	@Override
	public List queryGnList() {
		return dbDao.query("qxcdgl.queryGnList");
	}
	@Override
	public List queryHngnList(){
		return dbDao.query("qxcdgl.queryHngnList");
	}
}

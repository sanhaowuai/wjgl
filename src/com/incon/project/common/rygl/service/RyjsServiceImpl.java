package com.incon.project.common.rygl.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.tools.ant.taskdefs.Length;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.JyssjqxbEntity;
import com.incon.pojo.common.RyjsbEntity;
import com.incon.pojo.common.RyjsqxbEntity;
import com.incon.pojo.common.SjqxbEntity;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.jcxgxxwh.JysbEntity;
import com.incon.project.common.rygl.page.JysQxPage;

/**
 * 
 * @类名：  com.incon.project.common.rygl.service.RyjsServiceImpl
 * @创建人： 樊旭	
 * @日期： 2013-03-17
 * @修改人：
 * @日期：
 * @描述：  
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value= "ryjsService")
public class RyjsServiceImpl extends CommServiceImpl implements RyjsService {

	//查询登录用户的管理院系
	@Override
	public String queryGlyx(String yhdm){
		String yhlx = (String) dbDao.queryForObject("ryjs.queryYhlx",yhdm);
		if(yhlx.equals("1")){
			return (String) dbDao.queryForObject("ryjs.queryGlyx1",yhdm);
		}else if(yhlx.equals("2")){
			return (String) dbDao.queryForObject("ryjs.queryGlyx2",yhdm);
		}else{
			return "";
		}
	}

	//查询所有角色
	@Override
	public List<JsbEntity> queryJsb(){
		return dbDao.query("ryjs.queryJsb");
	}

	//角色权限
	@Override
	public List<Map<String, String>> queryQx(Map map) {
		// TODO Auto-generated method stub
		//查询选择的人员在人员权限表是否有记录
		Integer rycount=(Integer) dbDao.queryForObject("ryjs.queryQxZtByJsdm", map);
		if(rycount!=0){
			map.put("ryzt", "1");
		}else {
			map.put("ryzt", "0");
		}
		//查询当前登陆用户在人员权限表里是否有记录
		Integer count=(Integer) dbDao.queryForObject("ryjs.queryQxZt", map);
		if(count!=0){
			map.put("zt", "1");
		}else {
			map.put("zt", "0");
		}
		return dbDao.query("ryjs.queryQx",map);
	}
	//更改管理级别
	@Override
	@MethodLog(description="更改管理级别")
	public int updGljb(RyjsbEntity ryjsbEntity){
		return dbDao.update("ryjs.updGljb", ryjsbEntity);
	}

	//更改默认角色
	@Override
	@MethodLog(description="更改默认角色")
	public void changeMrjs(UserEntity userEntity){
		dbDao.update("ryjs.updMrjs",userEntity);
	}

	//添加权限
	@Override
	@Transactional
	@MethodLog(description="为角色添加权限")
	public void addQx(String jsdm,String yhdm,String id,String idd,String fid,String cjr,String sfcjgly,UserEntity user){
		RyjsqxbEntity ryjsqxbEntity = new RyjsqxbEntity();
		ryjsqxbEntity.setCjr(cjr);
		ryjsqxbEntity.setJsdm(jsdm);
		ryjsqxbEntity.setYhdm(yhdm);
		ryjsqxbEntity.setSfcjgly(sfcjgly);
		ryjsqxbEntity.setDqYhdm(user.getYhdm());
		ryjsqxbEntity.setDqJsdm(user.getJsdm());
		
		
		
//		List<RyjsqxbEntity> list1 = dbDao.query("ryjs.queryExitsQx",ryjsqxbEntity);
//		List<String> list5 = new ArrayList<String>();
//		List<String> list6 = new ArrayList<String>();
//		for(int i = 0; i < list1.size(); i++){
//			list5.add(list1.get(i).getQxdm());
//			list6.add(list1.get(i).getSscddm());
//		}
		String[] qxdm = id.split(",");//页面选中的值
		String[] fqxdm = fid.split(",");//按钮的所属菜单
		String[] sfzxj = idd.split(",");//1是权限2是按钮
		
		dbDao.delete("ryjs.delQx", ryjsqxbEntity);//删除当前选中人员角色的权限（根据当前登录人员的人员角色权限范围）
		dbDao.delete("ryjs.delAn", ryjsqxbEntity);//删除当前选中人员角色的按钮权限（根据当前登录人员的人员角色按钮范围）
		
		if((qxdm != null && qxdm.length>0 && qxdm.length==sfzxj.length && qxdm.length == fqxdm.length)){
			for(int i=0;i<qxdm.length;i++){
				if((sfzxj[i] != null && !sfzxj[i].trim().equals("")) && (qxdm[i] != null && !qxdm[i].trim().equals(""))){
					ryjsqxbEntity.setQxdm(qxdm[i]);
					ryjsqxbEntity.setSfzxj(fqxdm[i]);
					if(sfzxj[i].equals("2")){
						dbDao.insert("ryjs.addAn", ryjsqxbEntity);
					}else {
						dbDao.insert("ryjs.addQx", ryjsqxbEntity);
					}
				}
			}
		}
//		List<String> list2 = Arrays.asList(qxdm);
//		List<String> list3 = Arrays.asList(fqxdm);
//		List<String> list4 = Arrays.asList(sfzxj);
//		
//		
//		
//		
//		for (int i = 0; i < list5.size(); i++) {
//			if (!list2.contains(list5.get(i))) {
//				ryjsqxbEntity.setQxdm(list5.get(i));
//				ryjsqxbEntity.setSscddm(list6.get(i));
//				if(list1.get(i).getSfzxj().equals("1")){
//					dbDao.delete("ryjs.delQx", ryjsqxbEntity);
//				}else{
//					dbDao.delete("ryjs.delAn", ryjsqxbEntity);
//				}
//			}
//		}


//		for (int i = 0; i < list2.size(); i++) {
//			if (!list5.contains(list2.get(i))) {
//				ryjsqxbEntity.setQxdm(list2.get(i));
//				if (!"".equals(ryjsqxbEntity.getQxdm())) {
//					if (list4.get(i).equals("2")) {
//						ryjsqxbEntity.setSfzxj(list3.get(i));
//						dbDao.insert("ryjs.addAn", ryjsqxbEntity);
//					} else {
//						dbDao.insert("ryjs.addQx", ryjsqxbEntity);
//					}
//				}
//			}
//		}
	}

	//查询数据权限表
	@Override
	public List<SjqxbEntity> querySjqx(SjqxbEntity sjqxbEntity){
		String glyx = queryGlyx(sjqxbEntity.getDlr());
		sjqxbEntity.setGlyx(glyx);
		return dbDao.query("ryjs.querySjqx",sjqxbEntity);
	}

	//添加数据权限
	@Transactional
	@Override
	@MethodLog(description="添加数据权限")
	public void addSjqx(SjqxbEntity sjqxbEntity){
		SjqxbEntity sjqxbEntitys = new SjqxbEntity();
		sjqxbEntitys.setYhdm(sjqxbEntity.getYhdm());
		sjqxbEntitys.setJsdm(sjqxbEntity.getJsdm());
		sjqxbEntitys.setDlr(sjqxbEntity.getDlr());
		sjqxbEntitys.setDlrjsdm(sjqxbEntity.getDlrjsdm());
		sjqxbEntitys.setSfcjgly(sjqxbEntity.getSfcjgly());
		sjqxbEntitys.setGljb(sjqxbEntity.getGljb());
		List<String> list1 = dbDao.query("ryjs.queryMySjqx", sjqxbEntitys);
		
		
		String[] yxdm = sjqxbEntity.getYxdm().split(",");
		
		List<String> list2 = Arrays.asList(yxdm);
//		for (int i = 0; i < list1.size(); i++) {
//			if (!list2.contains(list1.get(i))) {
//				sjqxbEntitys.setYxdm(list1.get(i));
//				dbDao.delete("ryjs.delSjqx", sjqxbEntitys);      //删除属于自己的数据权限
//			}
//		}
		dbDao.delete("ryjs.delSjqx", sjqxbEntitys); 
		
		//dbDao.executeBatchOperation("ryjs.addSjqx", Arrays.asList(yxdm), "insert");
		
			
			for(int i=0;i<yxdm.length;i++){
				if(yxdm[i] != null && !yxdm[i].trim().isEmpty()){
					sjqxbEntitys.setYxdm(yxdm[i]);
					dbDao.insert("ryjs.addSjqx", sjqxbEntitys); // 添加所有选择的数据权限
				}
			}			
//		for (int i = 0; i < list2.size(); i++) {
//			if (!"".equals(list2.get(i))) {
//				if (!list1.contains(list2.get(i))) {
//					sjqxbEntitys.setYxdm(list2.get(i));
//					dbDao.insert("ryjs.addSjqx", sjqxbEntitys); // 添加所有选择的数据权限
//				}
//			}
//		}
	}

	//查询角色
	@Override
	public List<RyjsbEntity> queryJs(RyjsbEntity ryjsbEntity){
		return dbDao.query("ryjs.queryJs", ryjsbEntity);
	}

	//添加人员角色
	@Override
	@Transactional
	@MethodLog(description="添加角色")
	public void addJs(RyjsbEntity ryjsbEntity){
		RyjsbEntity ryjsbEntitys = new RyjsbEntity();
		if(ryjsbEntity.getYhdm() == null){
			ryjsbEntitys.setYhdm(null);
		}else{
			ryjsbEntitys.setYhdm(ryjsbEntity.getYhdm());
		}
		if(ryjsbEntity.getCjr() == null){
			ryjsbEntitys.setCjr(null);
		}else{
			ryjsbEntitys.setCjr(ryjsbEntity.getCjr());
		}
		List<String> list1 = dbDao.query("ryjs.queryMyJs",ryjsbEntitys);
		String[] jsdm = ryjsbEntity.getJsdm().split(",");
		List<String> list2 = Arrays.asList(jsdm);
		List<RyjsbEntity> list3 = new ArrayList<RyjsbEntity>();
		for (int i = 0; i < list1.size(); i++) {		
			if (!list2.contains(list1.get(i))) {
				ryjsbEntitys.setJsdm(list1.get(i));
				dbDao.delete("ryjs.delJs", ryjsbEntitys);
			}
		}


		for (int i = 0; i < list2.size(); i++) {	
			if(!"".equals(list2.get(i))){
				if (!list1.contains(list2.get(i))) {
					ryjsbEntitys.setJsdm(list2.get(i));
					dbDao.insert("ryjs.addJs", ryjsbEntitys);
				}
			}
		}

		//如果不是超级管理员，那么将登录人的人员角色权限赋给选中人
		if(!ryjsbEntity.getSfcjgly().equals("1")){
			/////////////////////查询登录人自己的所赋给选中人的角色下的所有权限    开始
			Map map = new HashMap();
			Integer i = 0;
			for (i = 0; i < list2.size(); i++) {
				RyjsqxbEntity ryjsqxbEntity = new RyjsqxbEntity();
				ryjsqxbEntity.setJsdm(list2.get(i));
				ryjsqxbEntity.setYhdm(ryjsbEntity.getDlr());
				List<RyjsqxbEntity> list_qxdms = dbDao.query("ryjs.queryQxdm",ryjsqxbEntity);
				map.put(i.toString() , list_qxdms);
			}
			List<RyjsqxbEntity> wantAdd = iterMap(map);    //想要添加的权限集合
			/////////////////////查询登录人自己的所赋给选中人的角色下的所有权限    开始
			//qxdm为要赋的权限
			/////////////////////查询选中人已有的权限 开始
			for (i = 0; i < list2.size(); i++) {
				RyjsqxbEntity ryjsqxbEntity = new RyjsqxbEntity();
				ryjsqxbEntity.setJsdm(list2.get(i));
				ryjsqxbEntity.setYhdm(ryjsbEntity.getYhdm());
				List<RyjsqxbEntity> list_qxdms = dbDao.query("ryjs.queryQxdm",ryjsqxbEntity);
				map.put(i.toString() , list_qxdms);
			}
			List<RyjsqxbEntity> exitList = iterMap(map);    //已经存在的权限集合
			List<String> list_js = new ArrayList<String>();
			List<String> list_qx = new ArrayList<String>();
			for (int j = 0; j < exitList.size(); j++) {
				list_js.add(exitList.get(j).getJsdm());
				list_qx.add(exitList.get(j).getQxdm());
			}
			//比较集合，删除掉两集合都包含的
			for (int j = 0; j < wantAdd.size();j++) {
				if (list_js.contains(wantAdd.get(j).getJsdm()) && list_qx.contains(wantAdd.get(j).getQxdm())) {
					wantAdd.remove(j);
					--j;
				}else{
					wantAdd.get(j).setYhdm(ryjsbEntity.getYhdm());
					wantAdd.get(j).setCjr(ryjsbEntity.getCjr());
					if(wantAdd.get(j).getSfzxj().equals("1")){
						dbDao.insert("ryjs.addQx",wantAdd.get(j));
					}else{
						wantAdd.get(j).setSfzxj(wantAdd.get(j).getSscddm());
						dbDao.insert("ryjs.addAn",wantAdd.get(j));
					}
				}
			}
			//添加集合wantAdd

		}
	}

	//遍历Map
	public List<RyjsqxbEntity> iterMap(Map map){
		List<RyjsqxbEntity> qxdm = new ArrayList<RyjsqxbEntity>();
		Iterator<Entry<String, List<RyjsqxbEntity>>> ite = map.entrySet().iterator();
		while (ite.hasNext()) {
			Entry<String,List<RyjsqxbEntity>> res= ite.next();
			List<RyjsqxbEntity> val=res.getValue();
			if(null!=val){
				for (RyjsqxbEntity v : val) {
					qxdm.add(v);
				}
			}
		}
		return qxdm;
	}

	@Override
	public List<JysbEntity> queryJyxYx(JysQxPage jysQxPage) {

		return dbDao.query("ryjs.queryJysYx",jysQxPage);
	}

	@Transactional
	@Override
	public void addJysSjqx(JyssjqxbEntity jyssjqxbEntity) {
		dbDao.delete("ryjs.delJysSjqx",jyssjqxbEntity); 
		if(!",".equals(jyssjqxbEntity.getJysdm())){
			String ids = jyssjqxbEntity.getJysdm().substring(1,jyssjqxbEntity.getJysdm().length()-1);
			String[] jysdm = ids.split(",");
			for(int i=0;i<jysdm.length;i++){
				jyssjqxbEntity.setJysdm(jysdm[i]);
				dbDao.insert("ryjs.addJysSjqx", jyssjqxbEntity);
			}
		}
	}

	@Override
	public List<HashMap<String, String>> queryJysAll(Map map) {

		return  dbDao.query("ryjs.queryJysRyJs",map);
	}

	@Override
	public UserEntity queryUser(UserEntity userEntity) {
		
		return (UserEntity) dbDao.queryForObject("jysgl.queryUser", userEntity);
	}

}

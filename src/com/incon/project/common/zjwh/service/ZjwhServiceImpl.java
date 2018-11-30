package com.incon.project.common.zjwh.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.zjwh.JszjbEntity;
import com.incon.pojo.common.zjwh.ZjwhEntity;
import com.incon.project.common.zjwh.page.ZjwhJsqxPage;
import com.incon.project.common.zjwh.page.ZjwhRyjsqxPage;

/**
 * 
 * @类名： com.incon.project.common.zjwh.service.ZjwhServiceImpl
 * @修改人：
 * @日期：
 * @描述：  组件维护
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value="zjwhService")
public class ZjwhServiceImpl extends CommServiceImpl implements ZjwhService {

	@MethodLog(description="修改组件")
	@Transactional
	@Override
	public void UpdZjwh(ZjwhEntity entity) {
		// TODO Auto-generated method stub
		dbDao.update("zjwh.UpdZjwh", entity);
	}

	@MethodLog(description="增加组件")
	@Transactional
	@Override
	public void addZjwh(ZjwhEntity entity) {
		// TODO Auto-generated method stub
		dbDao.insert("zjwh.addZjwh", entity);
	}

	@Override
	public ZjwhEntity queryZjwhOne(String zjdm) {
		// TODO Auto-generated method stub
		return (ZjwhEntity)dbDao.queryForObject("zjwh.queryZjwhOne", zjdm);
	}
	@MethodLog(description="删除组件")
	@Transactional
	@Override
	public void delZjwh(String[] ids) {
		// TODO Auto-generated method stub
		dbDao.executeBatchOperation("zjwh.delZjwh", Arrays.asList(ids), "delete");
	}

	@Override
	public List<ZjwhEntity> queryZjqx() {
		// TODO Auto-generated method stub
		return dbDao.query("zjwh.queryZjqx");
	}
	@MethodLog(description="添加组件角色权限")
	@Transactional
	@Override
	public void addJsZjsq(String jsdm,String ids[],String qxlb,String pzjmc) {
		Map<String,String> map1 = new HashMap<String, String>();
		map1.put("jsdm", jsdm);
		map1.put("qxlb", qxlb);
		map1.put("pzjmc", pzjmc);
		dbDao.delete("zjwh.delJsZjsq", map1);
		
		// TODO Auto-generated method stub
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		if(ids!=null){		
			for (int i = 0; i < ids.length; i++) {
				Map map=new HashMap();
				map.put("jsdm", jsdm);
				map.put("qxdm", ids[i]);
				map.put("qxlb", qxlb);
				list.add(map);
			}
		}	
		dbDao.executeBatchOperation("zjwh.addJsZjsq", list, "insert");
	}
	@MethodLog(description="删除组件角色权限")
	@Transactional
	@Override
	public void delJsZjsq(String jsdm,String qxlb) {
		// TODO Auto-generated method stub
		Map<String,String> map1 = new HashMap<String, String>();
		map1.put("jsdm", jsdm);
		map1.put("qxlb", qxlb);
		dbDao.delete("zjwh.delJsZjsq", map1);
	}
	@MethodLog(description="增加组件人员角色权限")
	@Transactional
	@Override
	public void addRyjsZjsq(String[] ids,String jsdm,String yhdm,String qxlb) {
		// TODO Auto-generated method stub
		Map map1=new HashMap();
		map1.put("jsdm", jsdm);
		map1.put("yhdm", yhdm);
		map1.put("qxlb", qxlb);
		dbDao.delete("zjwh.delRyjsZjsq", map1);		
		
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		if(ids!=null){			
			for (int i = 0; i < ids.length; i++) {
				Map map=new HashMap();
				map.put("jsdm", jsdm);
				map.put("yhdm", yhdm);
				map.put("qxdm", ids[i]);
				map.put("qxlb", qxlb);
				list.add(map);
			}
		}		
		dbDao.executeBatchOperation("zjwh.addRyjsZjsq", list, "insert");
	}
	@MethodLog(description="删除组件人员角色权限")
	@Transactional
	@Override
	public void delRyjsZjsq(String jsdm, String yhdm,String qxlb) {
		// TODO Auto-generated method stub
		Map map1=new HashMap();
		map1.put("jsdm", jsdm);
		map1.put("yhdm", yhdm);
		map1.put("qxlb", qxlb);
		dbDao.delete("zjwh.delRyjsZjsq", map1);		
	}

	@Override
	public List<ZjwhEntity> queryZjwhJsqx(ZjwhJsqxPage page) {
		// TODO Auto-generated method stub
		return dbDao.query("zjwh.queryZjwhJsqx", page);
	}

	@Override
	public List<ZjwhEntity> queryRyjsZjqx(ZjwhRyjsqxPage page) {
		// TODO Auto-generated method stub
		return dbDao.query("zjwh.queryZjwhRyjsqx", page);
	}

	
	
	

}

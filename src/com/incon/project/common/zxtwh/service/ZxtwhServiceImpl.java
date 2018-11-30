package com.incon.project.common.zxtwh.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.zxtwh.ZxtwhEntity;
import com.incon.project.common.zxtwh.page.ZxtwhJsqxPage;
import com.incon.project.common.zxtwh.page.ZxtwhRyjsqxPage;


@SuppressWarnings("all")
@Service(value="zxtwhService")
public class ZxtwhServiceImpl extends CommServiceImpl implements ZxtwhService{

	@Override
	public void UpdZxtwh(ZxtwhEntity entity) {
		dbDao.update("zxtwh.UpdZxtwh", entity);
	}

	@Override
	public void addZxtwh(ZxtwhEntity entity) {
		dbDao.insert("zxtwh.addZxtwh", entity);
	}

	@Override
	public ZxtwhEntity queryZxtwhOne(String dm) {
		return (ZxtwhEntity)dbDao.queryForObject("zxtwh.queryZxtwhOne", dm);
	}

	@Override
	public void delZxtwh(String[] ids) {
		dbDao.executeBatchOperation("zxtwh.delZxtwh", Arrays.asList(ids), "delete");
	}

	@Override
	public List<ZxtwhEntity> queryZxtqx(ZxtwhJsqxPage page) {
		return dbDao.query("zxtwh.queryZxtqx",page);
	}

	@Override
	@Transactional
	public void addJsZxtsq(String jsdm, String[] ids,String pxtmc) {
		Map<String, String> map1 = new HashMap<String, String>();
		map1.put("jsdm", jsdm);
		map1.put("pxtmc", pxtmc);
		dbDao.delete("zxtwh.delZxtwhJssq",map1);
		if(ids!=null&&ids.length>0){
			for(int i=0;i<ids.length;i++){
				Map map = new HashMap();
				map.put("zxtdm", ids[i]);
				map.put("jsdm", jsdm);
				dbDao.insert("zxtwh.addJsZxtsq", map);
			}			
		}

	}

	@Override
	public List<ZxtwhEntity> queryRyjsZxtqx(ZxtwhRyjsqxPage page) {
		return dbDao.query("zxtwh.queryRyjsZxtqx",page);
	}

	@Override
	@Transactional
	public void addRyjsZxtsq(String[] ids, String jsdm, String yhdm) {
		Map map1 = new HashMap();
		map1.put("jsdm", jsdm);
		map1.put("yhdm", yhdm);
		dbDao.delete("zxtwh.delRyjsZxtsq", map1);		
		
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		if(ids!=null){			
			for (int i = 0; i < ids.length; i++) {
				Map map=new HashMap();
				map.put("jsdm", jsdm);
				map.put("yhdm", yhdm);
				map.put("zxtdm", ids[i]);
				list.add(map);
			}
		}		
		dbDao.executeBatchOperation("zxtwh.addRyjsZxtsq", list, "insert");
	}

	@Override
	public String checkXtdm(String xtdm) {
		return (String)dbDao.queryForObject("zxtwh.checkXtdm",xtdm);
	}

}

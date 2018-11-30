package com.incon.project.qkfkxt.qkfkycl.service;


import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.JsxxbEntity;
import com.incon.pojo.common.qkfkxt.FkclEntity;
import com.incon.pojo.common.qkfkxt.QkfkxtFksqbEntity;
import com.incon.pojo.common.xxfbxx.XxfbEntity;
import com.incon.project.qkfkxt.fkcl.page.FkclPage;
@SuppressWarnings("all")
@Service(value= "qkfkyclService")
public class QkfkyclServiceImpl extends CommServiceImpl implements QkfkyclService {

	@Override
	public List<Map<String, String>> queryxmmc() {
		// TODO Auto-generated method stub
		return dbDao.query("qkfkycl.queryxmmc");
	}

	@Override
	public List<Map<String, String>> queryjjcd() {
		// TODO Auto-generated method stub
		return dbDao.query("qkfkycl.queryjjcd");
	}

	@Override
	public List<Map<String, String>> queryqkfklx() {
		// TODO Auto-generated method stub
		return dbDao.query("qkfkycl.queryqkfklx");
	}
	@Transactional
	@Override
	public void delqkfk(String[] ids) {
		// TODO Auto-generated method stub
	dbDao.executeBatchOperation("qkfkycl.delqkfk", Arrays.asList(ids), "delete");		
	}
	@Transactional
	@Override
	public boolean tjqkfk(String[] sqdh) {
		boolean flag=false;
		try {
			dbDao.executeBatchOperation("qkfkycl.df", Arrays.asList(sqdh), "update");
            flag = true;
		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public List<Map<String, String>> queryjs() {
		// TODO Auto-generated method stub
		return dbDao.query("qkfkycl.queryjs");
	}
	//@MethodLog(description = "添加或修改学校发布信息")
			@Transactional
			@Override
			public void addOrUpdXxfbxx(String CCLJ, String GLB, String GLZJ,
					String YHM, String GLZJZ, String[] qfjs, String[] hfjs,
					String[] del_fjs, QkfkxtFksqbEntity entity,String xz,HashMap mapz) {
		// TODO Auto-generated method stub
		GLZJZ=entity.getSqdh();
		entity.setSqzt(xz);
		if(GLZJZ == null || "".equals(GLZJZ)){//新增
			GLZJZ = (String) dbDao.insert("qkfkycl.addqkfk", entity);
			System.out.println(GLZJZ+"++++++++++++++");
			System.out.println(xz+"}}}}}}}}}}}}}}}}}}}}}}");
			if("1".equals(xz)){
				System.out.println("(((((((((((((((((((");
				mapz.put("P_SQDH",GLZJZ );
				dbDao.update("qkfkycl.df", mapz);}
		}else{//修改
			System.out.println(entity.getXtdm()+"--------------------------");
			dbDao.update("qkfkycl.updqkfk", entity);
			if("1".equals(xz)){
			dbDao.update("qkfkycl.df", mapz);}
		}
		if (del_fjs != null && del_fjs.length != 0) {
			dbDao.executeBatchOperation("upload.deleteFj", Arrays.asList(del_fjs), "delete");
		}
		if (qfjs != null && qfjs.length != 0) {
			for (int i = 0; i < qfjs.length; i++) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("CCLJ", CCLJ); 		//附件链接
				map.put("GLB", GLB); 		//表名
				map.put("GLZJ", GLZJ); 		//关联主键
				map.put("GLZJZ", GLZJZ); 	//关联主键值
				map.put("SCR", YHM ); 		//上传人
				map.put("XSMC", qfjs[i]); 	//文件名
				map.put("CCM", hfjs[i]); 	//文件存储名
				dbDao.insert("upload.addFj", map);
			}
	 	}
	}

	@Override
	public QkfkxtFksqbEntity queryqkfkByone(String sqdh) {
		// TODO Auto-generated method stub
		return (QkfkxtFksqbEntity) dbDao.queryForObject("qkfkycl.queryqkfkByone", sqdh);
	}

	@Override
	public String addqkfk(QkfkxtFksqbEntity qkfkxtFksqbEntity) {
		// TODO Auto-generated method stub
		return (String) dbDao.insert("qkfkycl.addqkfk", qkfkxtFksqbEntity);
	}
	
	@Override
	public void addOrUpdqkfk(String YHM, QkfkxtFksqbEntity entity) {
		// TODO Auto-generated method stub
		if(entity.getSqdh() == null || "".equals(entity.getSqdh())){//新增
			 dbDao.insert("qkfkycl.addqkfk", entity);
		}else{//修改
			dbDao.update("qkfkycl.updqkfk", entity);
		}
	}

	@Override
	public void updqkfk(QkfkxtFksqbEntity qkfkxtFksqbEntity) {
		dbDao.update("qkfkycl.updqkfk", qkfkxtFksqbEntity);
		
	}
//	@Transactional
//	@Override
//	public boolean tjfk(String[] sqdh) {
//		System.out.println(sqdh[0]);
//		boolean flag=false;
//		Map<String,String> map = new HashMap<String,String>(); 
//	for(int i=0;i<sqdh.length;i++){
//		System.out.println(sqdh[i]+"11111111111111");
//		map.put("P_ZT", "1");
//		map.put("P_SQDH", "201706290001");
//		dbDao.update("qkfkycl.df",map);
//		 flag = true;
//	}return flag;
//		}
	@Transactional
	@Override
	public boolean tjfk(Map<String, String> map) {
		boolean flag=false;
		try {
			dbDao.update("qkfkycl.df", map);
		    flag = true;
		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
		}
		return flag;
	}
	@Transactional
	@Override
	public boolean qurwc(Map<String, String> map) {
		boolean flag=false;
		try {
			dbDao.update("qkfkycl.df", map);
		    flag = true;
		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public FkclEntity fkcx(FkclPage fkclPage) {
		// TODO Auto-generated method stub
		return (FkclEntity) dbDao.queryForObject("qkfkycl.queryFkclts",fkclPage);
	}
	}




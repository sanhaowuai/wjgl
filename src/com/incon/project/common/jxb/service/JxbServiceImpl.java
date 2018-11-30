package com.incon.project.common.jxb.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.JxbEntity;

@Service(value="jxbService")
public class JxbServiceImpl extends CommServiceImpl implements JxbService{

	/**
	 * 添加教学班
	 */
	@Override
	@MethodLog(description="添加教学班")
	@Transactional
	public void addJxb(JxbEntity jxbEntity) {
		dbDao.insert("jxb.addJxb", jxbEntity);
	}

	/**
	 * 修改教学班
	 */
	@Override
	@MethodLog(description="修改教学班")
	@Transactional
	public void updJxb(JxbEntity jxbEntity) {
		dbDao.update("jxb.updJxb", jxbEntity);
	}

	/**
	 * 根据CMCODE查询教学班
	 */
	@Override
	@MethodLog(description="根据CMCODE查询教学班")
	@Transactional
	public JxbEntity queryJxbByCMCODE(String CMCODE) {
		return (JxbEntity) dbDao.queryForObject("jxb.queryJxbByCMCODE", CMCODE);
	}

	
	
	/**
	 * 批量添加学生
	 */
	@Override
	public void addJxbs(List<Map<String, String>> listObj) {
		for(int i=0;i<listObj.size();i++){
			Map<String, String> temp =new HashMap<String, String>();
			temp = listObj.get(i);
			
			JxbEntity jxbEntity = new JxbEntity();
			jxbEntity.setCMCLASSNAME(temp.get("CMCLASSNAME"));
			jxbEntity.setCMCLASSPEOPLENUM(temp.get("CMCLASSPEOPLENUM"));
			jxbEntity.setCMWHETHERAVAILABLE(temp.get("CMWHETHERAVAILABLE"));
			dbDao.insert("jxb.addJxb", jxbEntity);
		}
	}
	
	
}

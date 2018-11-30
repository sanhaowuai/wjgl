package com.incon.project.common.helpgl.service;

import java.util.HashMap;
import java.util.List;


import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.incon.framework.service.impl.CommServiceImpl;

import com.incon.pojo.common.HelpbEntity;
import com.incon.pojo.common.QxbEntity;

@Service(value="helpglService")
public class HelpglServiceImpl extends CommServiceImpl implements HelpglService{

	@Override
	public List<HelpbEntity> queryHelpglList(String qxdm) {
		// TODO Auto-generated method stub
		return dbDao.query("helpgl.queryHelpglList",qxdm);
	}
	@Override
	public List<HelpbEntity> LookHelpglList(String qxdm,String jsdm) {
		// TODO Auto-generated method stub
		HashMap<String,String> m=new HashMap<String,String>();
		m.put("qxdm", qxdm);
		m.put("jsdm", jsdm);
		return dbDao.query("helpgl.LookHelpglList",m);
	}
	
	
	@Override
	public void addHelpgl(HelpbEntity helpbEntity) {
		// TODO Auto-generated method stub
		dbDao.insert("helpgl.addHelpgl", helpbEntity);
	}

	@Override
	public void delHelpgl(String bzid) {
		// TODO Auto-generated method stub
		dbDao.delete("helpgl.delHelpgl", bzid);
	}

	@Override
	public HelpbEntity queryHelpglOne(String bzid) {
		// TODO Auto-generated method stub
		return (HelpbEntity)dbDao.queryForObject("helpgl.queryHelpglOne", bzid);
	}

	@Override
	public QxbEntity queryQxglOne(String qxdm) {
		// TODO Auto-generated method stub
		return (QxbEntity)dbDao.queryForObject("helpgl.queryQxglOne", qxdm);
	}

	@Override
	public void updHelpgl(HelpbEntity helpbEntity) {
		// TODO Auto-generated method stub
		dbDao.update("helpgl.updHelpgl",helpbEntity);
	}
	
	public static void main(String[]a){
		String[] locationPath={"config/spring/spring-common.xml"
				,"config/spring/spring-pool.xml"
				,"config/spring/spring-securitycode.xml"};
		ApplicationContext context =new ClassPathXmlApplicationContext(locationPath);
		HelpglService h = (HelpglService)context.getBean("helpglService");
		
	}
	@Override
	public List<HashMap<String, String>> queryJsList() {
		// TODO Auto-generated method stub
		return dbDao.query("helpgl.queryJsList");
	}

}

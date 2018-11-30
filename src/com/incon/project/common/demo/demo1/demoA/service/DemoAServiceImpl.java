package com.incon.project.common.demo.demo1.demoA.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;


import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;

import com.incon.pojo.common.HelpbEntity;
import com.incon.pojo.common.QxbEntity;

@Service(value="demoAService")
public class DemoAServiceImpl extends CommServiceImpl implements DemoAService{
	@Transactional
	@MethodLog(description="AAAA添加Test_dmwh_1")
	@Override
	public Integer addTest_dmwh_1(HashMap mappar) {
		return (Integer) dbDao.insert("demo.addTest_dmwh_1", mappar);
	}

	@Transactional
	@Override
	@MethodLog(description="AAAA添加Test_dmwh_2")
	public Integer addTest_dmwh_2(HashMap mappar) {
		dbDao.insert("demo.addTest_dmwh_1", mappar);
		return (Integer) dbDao.insert("demo.addTest_dmwh_2", mappar);
	}
	
	@Transactional
	@MethodLog(description="AAAA删除Test_dmwh_1")
	@Override
	public Integer delTest_dmwh_1(HashMap mappar) {
		return (Integer) dbDao.insert("demo.addTest_dmwh_1", mappar);
	}

	@Transactional
	@Override
	@MethodLog(description="AAAA删除Test_dmwh_2")
	public Integer delTest_dmwh_2(HashMap mappar) {
		dbDao.insert("demo.addTest_dmwh_1", mappar);
		return (Integer) dbDao.insert("demo.addTest_dmwh_2", mappar);
	}
	
	
	@Transactional
	@MethodLog(description="AAAA修改Test_dmwh_1")
	@Override
	public Integer updTest_dmwh_1(HashMap mappar) {
		return (Integer) dbDao.insert("demo.addTest_dmwh_1", mappar);
	}

	@Transactional
	@Override
	@MethodLog(description="AAAA修改Test_dmwh_2")
	public Integer updTest_dmwh_2(HashMap mappar) {
		dbDao.insert("demo.addTest_dmwh_1", mappar);
		return (Integer) dbDao.insert("demo.addTest_dmwh_2", mappar);
	}
}

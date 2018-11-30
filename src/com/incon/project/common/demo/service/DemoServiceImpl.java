package com.incon.project.common.demo.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;

import com.incon.pojo.common.HelpbEntity;
import com.incon.pojo.common.QxbEntity;
import com.incon.project.common.demo.page.DemoJsonPage;

@Service(value="demoService")
public class DemoServiceImpl extends CommServiceImpl implements DemoService{
	@Transactional
	@MethodLog(description="添加Test_dmwh_1")
	@Override
	public Integer addTest_dmwh_1(HashMap mappar) {
		return (Integer) dbDao.insert("demo.addTest_dmwh_1", mappar);
	}

	@Transactional
	@Override
	@MethodLog(description="添加Test_dmwh_2")
	public Integer addTest_dmwh_2(HashMap mappar) {
		dbDao.insert("demo.addTest_dmwh_1", mappar);
		return (Integer) dbDao.insert("demo.addTest_dmwh_2", mappar);
	}
	@Override
	public List<Map> queryNjList(DemoJsonPage demoJsonPage){
		return dbDao.query("demo.queryNjList", demoJsonPage);
	}
	@Override
	public Integer queryNjListCount(DemoJsonPage demoJsonPage){
		return (Integer)dbDao.queryForObject("demo.queryNjListCount", demoJsonPage);
	}
}

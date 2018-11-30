package com.incon.common.pub.pubXs.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.incon.framework.service.impl.CommServiceImpl;

@Service(value="pubXsService")
public class PubXsServiceImpl extends CommServiceImpl implements PubXsService{
	
	//查询学生
	@Override
	public List<Map> queryPubXs(HashMap map) {
		return dbDao.query("pubXs.queryPubXs", map);
	}

	//测试方法
	public static void main(String[] str){
		String[] locationPath ={"config/spring/spring-common.xml",
				         "config/spring/spring-pool.xml",
				         "config/spring/spring-securitycode.xml"};
		ApplicationContext context = new ClassPathXmlApplicationContext(locationPath);
		PubXsService h = (PubXsService) context.getBean("pubXsService");
		HashMap map = new HashMap();
		map.put("sfcjgly", "0");
		map.put("gljb", "0");
		map.put("yhdm", "dqm");
		map.put("jsdm", "2");
		List<Map> xsList = h.queryPubXs(map);
		System.out.println(xsList.size());
		
	}
	
	
}

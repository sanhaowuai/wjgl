package com.incon.common.pub.pubBjByZy.service;

import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.incon.common.pub.pubXByYx.service.PubXByYxService;
import com.incon.framework.service.impl.CommServiceImpl;
@Service(value="pubBjByZyService")
public class PubBjByZyServiceImpl extends CommServiceImpl implements PubBjByZyService{

	//根据专业查询班级
	@Override
	public List<Map> queryBjByZy(String zydm) {
		return dbDao.query("pubBjByZy.queryBjByZy", zydm);
	}

	//测试方法
	public static void main(String[] str){
		
		String[] locationPath ={"config/spring/spring-common.xml",
				         "config/spring/spring-pool.xml",
				         "config/spring/spring-securitycode.xml"};
		ApplicationContext context = new ClassPathXmlApplicationContext(locationPath);
		
		PubBjByZyService h = (PubBjByZyService) context.getBean("pubBjByZyService");
		
		List<Map> xList = h.queryBjByZy("114");
		System.out.println(xList);
	}
}

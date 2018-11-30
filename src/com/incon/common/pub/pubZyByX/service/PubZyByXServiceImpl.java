package com.incon.common.pub.pubZyByX.service;

import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;


import com.incon.common.pub.pubZyByX.service.PubZyByXService;
import com.incon.framework.service.impl.CommServiceImpl;

@Service(value="pubZyByXService")
public class PubZyByXServiceImpl extends CommServiceImpl implements PubZyByXService{

	//根据系查询专业
	@Override
	public List<Map> queryZyByX(String yxdm) {
		return dbDao.query("pubZyByX.queryZyByX", yxdm);
	}

	//测试方法
	public static void main(String[] str){
		
		String[] locationPath ={"config/spring/spring-common.xml",
				         "config/spring/spring-pool.xml",
				         "config/spring/spring-securitycode.xml"};
		ApplicationContext context = new ClassPathXmlApplicationContext(locationPath);
		
		PubZyByXService h = (PubZyByXService) context.getBean("pubZyByXService");
		
		List<Map> zyList = h.queryZyByX("4401");
		System.out.println(zyList);
	}
}

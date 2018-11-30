package com.incon.common.pub.pubZyByYx.service;

import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.incon.common.pub.pubZyByYx.service.PubZyByYxService;
import com.incon.framework.service.impl.CommServiceImpl;

@Service(value="pubZyByYxService")
public class PubZyByYxServiceImpl extends CommServiceImpl implements PubZyByYxService{

	//根据系查询专业
	@Override
	public List<Map> queryZyByYx(String yxdm) {
		System.out.println(yxdm);
		return dbDao.query("pubZyByYx.queryZyByYx", yxdm);
	}
	
	//测试方法
	public static void main(String[] str){
		
		String[] locationPath ={"config/spring/spring-common.xml",
				         "config/spring/spring-pool.xml",
				         "config/spring/spring-securitycode.xml"};
		ApplicationContext context = new ClassPathXmlApplicationContext(locationPath);
		
		PubZyByYxService h = (PubZyByYxService) context.getBean("pubZyByYxService");
		System.out.println("123");
		
		List<Map> zyList = h.queryZyByYx("02");
		System.out.println(zyList);
	}
}

package com.incon.common.pub.pubZy.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.incon.common.pub.pubZy.service.PubZyService;
import com.incon.framework.service.impl.CommServiceImpl;

@Service(value="pubZyService")
public class PubZyServiceImpl extends CommServiceImpl implements PubZyService{

	//查询专业
	@Override
	public List<Map> queryPubZy(HashMap map) {
		System.out.println("123");
		return dbDao.query("pubZy.queryPubZy",map);
	}

	//测试方法
	public static void main(String[] str){
		
		String[] locationPath ={"config/spring/spring-common.xml",
				         "config/spring/spring-pool.xml",
				         "config/spring/spring-securitycode.xml"};
		ApplicationContext context = new ClassPathXmlApplicationContext(locationPath);
		
		PubZyService h = (PubZyService) context.getBean("pubZyService");
		HashMap map = new HashMap();
		map.put("zydm", "999");
		List<Map> zyList = h.queryPubZy(map);
		System.out.println(zyList);
	}
	
}

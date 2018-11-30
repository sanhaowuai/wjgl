package com.incon.common.pub.pubNj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.incon.framework.service.impl.CommServiceImpl;
@SuppressWarnings("all")
@Service(value="pubNjService")
public class PubNjServiceImpl extends CommServiceImpl implements PubNjService{

	//查询年级
	@Override
	public List<Map> queryPubNj() {
		return dbDao.query("pubNj.queryPubNj");
	}
	//测试方法
	public static void main(String[] str){
		String[] locationPath ={"config/spring/spring-common.xml",
				         "config/spring/spring-pool.xml",
				         "config/spring/spring-securitycode.xml"};
		ApplicationContext context = new ClassPathXmlApplicationContext(locationPath);
		PubNjService h = (PubNjService) context.getBean("pubNjService");
		HashMap map = new HashMap();
		map.put("nj", "2013");
		List<Map> njList = h.queryPubNj();
		System.out.println(njList);
}
	
}

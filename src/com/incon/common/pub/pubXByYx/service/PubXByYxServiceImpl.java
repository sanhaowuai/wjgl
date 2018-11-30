package com.incon.common.pub.pubXByYx.service;

import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.incon.common.pub.pubZyByYx.service.PubZyByYxService;
import com.incon.framework.service.impl.CommServiceImpl;

@Service(value="pubXByYxService")
public class PubXByYxServiceImpl extends CommServiceImpl implements PubXByYxService{

	//根据院查询系
	@Override
	public List<Map> queryXByYx(String yxdm) {
		return dbDao.query("pubXByYx.queryXByYx",yxdm);
	}

	//测试方法
	public static void main(String[] str){
		
		String[] locationPath ={"config/spring/spring-common.xml",
				         "config/spring/spring-pool.xml",
				         "config/spring/spring-securitycode.xml"};
		ApplicationContext context = new ClassPathXmlApplicationContext(locationPath);
		
		PubXByYxService h = (PubXByYxService) context.getBean("pubXByYxService");
		
		List<Map> xList = h.queryXByYx("02");
		System.out.println(xList);
	}
}

package com.incon.common.pub.pubYx.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;


import com.incon.common.pub.pubYx.page.PubYxPage;
import com.incon.framework.service.impl.CommServiceImpl;

@Service(value="pubYxService")
public class PubYxServiceImpl extends CommServiceImpl implements PubYxService{

	//查询院系
	@Override
	public List<Map> queryPubYx(PubYxPage pubYxPage) {
		return dbDao.query("pubYx.queryPubYx",pubYxPage);
	}

	@Override
	public List<Map> queryPubYxList(PubYxPage pubYxPage) {
		return dbDao.query("pubYx.queryPubYxList",pubYxPage);
	}
	
	//查询系
	@Override
	public List<Map> queryPubX(String yxdm) {
		return dbDao.query("pubYx.queryPubX", yxdm);
	}


	//测试方法
	public static void main(String[] str){
		
		String[] locationPath ={"config/spring/spring-common.xml",
				         "config/spring/spring-pool.xml",
				         "config/spring/spring-securitycode.xml"};
		ApplicationContext context = new ClassPathXmlApplicationContext(locationPath);
		PubYxService h = (PubYxService) context.getBean("pubYxService");
//		HashMap map = new HashMap();
//		map.put("sfcjgly", "0");
//		map.put("gljb", "0");
//		map.put("yhdm", "dqm");
//		map.put("jsdm", "2");
//		List<Map> yxList = h.queryPubYx(map);
//		System.out.println(yxList.size());
		List<Map> xList = h.queryPubX("02");
		System.out.println(xList);
	}

	@Override
	public List<Map<String,String>> queryPubYxAll(String bj,String yxmc) {
		// TODO Auto-generated method stub
		HashMap<String,String> m=new HashMap<String,String>();
		m.put("bj", bj);
		m.put("yxmc", yxmc);
		return dbDao.query("pubYx.queryPubYxAll",m);
	}
	
	 


	


	
}

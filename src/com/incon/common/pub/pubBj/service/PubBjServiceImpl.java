package com.incon.common.pub.pubBj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.incon.framework.service.impl.CommServiceImpl;
@SuppressWarnings("all")
@Service(value="pubBjService")
public class PubBjServiceImpl extends CommServiceImpl implements PubBjService{

	//查询班级
	@Override
	public List<Map> queryPubBj(HashMap map) {
		return dbDao.query("pubBj.queryPubBj", map);
	}
	
  //service测试方法
	public static void main(String[] str){
		String[] locationPath ={"config/spring/spring-common.xml",
				         "config/spring/spring-pool.xml",
				         "config/spring/spring-securitycode.xml"};
		ApplicationContext context = new ClassPathXmlApplicationContext(locationPath);
		PubBjService h = (PubBjService) context.getBean("pubBjService");
		HashMap map = new HashMap();
		map.put("sfcjgly", "0");
		map.put("gljb", "0");
		map.put("yhdm", "dqm");
		map.put("jsdm", "2");
		List<Map> bjList = h.queryPubBj(map);
		System.out.println(bjList.size());

}
}

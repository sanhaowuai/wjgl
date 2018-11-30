package com.incon.common.pub.pubJs.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.incon.framework.service.impl.CommServiceImpl;
@SuppressWarnings("all")
@Service(value="pubJsService")
public class PubJsServiceImpl extends CommServiceImpl implements PubJsService{

	//查询教师
	@Override
	public List<Map> queryPubJs(HashMap map) {
		return dbDao.query("pubJs.queryPubJs",map);
	}
	//查询教研室是否有数据
	@Override
	public int queryJyssjqxCount(Map map) {
		return (Integer)dbDao.queryForObject("pubJs.queryJyssjqxCount",map);
	}

    //测试方法
	public static void main(String[] str){
		String[] locationPath ={"config/spring/spring-common.xml",
				         "config/spring/spring-pool.xml",
				         "config/spring/spring-securitycode.xml"};
		ApplicationContext context = new ClassPathXmlApplicationContext(locationPath);
		PubJsService h = (PubJsService) context.getBean("pubJsService");
		HashMap map = new HashMap();
		map.put("sfcjgly", "0");
		map.put("gljb", "0");
		map.put("yhdm", "dqm");
		map.put("resultCount", "1");
		map.put("jsdm", "2");
		List<Map> jsList = h.queryPubJs(map);
		System.out.println(jsList.size());
	}
}

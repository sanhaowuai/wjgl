package com.incon.common.pub.pubXnxq.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.incon.framework.service.impl.CommServiceImpl;
@SuppressWarnings("all")
@Service(value="pubXnxqService")
public class PubXnxqServiceImpl extends CommServiceImpl implements PubXnxqService{

	// 查询学生入学以来再多两学期的学年学期
	public List<Map<String, String>> queryXsXnxqDxq(String xh){
		return dbDao.query("pubXnxq.queryXsXnxqDxq",xh);
	}
	//查询学年学期
	@Override
	public List<Map> queryPubXnxq(HashMap map) {
		return dbDao.query("pubXnxq.queryPubXnxq",map);
	}
	
	//查询系统参数表
	public Map<String, String>  queryXtcsb(String cs)  {
		return (Map) dbDao.queryForObject("pubXnxq.queryXtcsb",cs);
	}
	
	//查询指定学年学期 
	public Map<String, String> queryXnxqByOne(String xnxq){
		return (Map<String, String>)dbDao.queryForObject("pubXnxq.queryXnxqByOne",xnxq);
	}
	
	// 查询当前学年学期及以后的学年学期
	public List<Map<String, String>> queryAfterDqXnxq(String xh){
		return dbDao.query("pubXnxq.queryAfterDqXnxq",xh);
	}
	//查询当前学年学期
	public Map<String, String> queryDqXnxq(){
		return (Map<String, String>)dbDao.queryForObject("pubXnxq.queryDqXnxq", null);
	}
	
	//查询校区
	public List<Map<String, String>> queryXiaoquList(){
		return dbDao.query("pubXnxq.queryPubXiaoqu","");
	}
	
	//查询全部正常学年
	public List<Map<String, String>> queryXnxqList(){
		return dbDao.query("pubXnxq.queryXqxqList");
	}
public static void main(String[] str){
		String[] locationPath ={"config/spring/spring-common.xml",
				         "config/spring/spring-pool.xml",
				         "config/spring/spring-securitycode.xml"};
		ApplicationContext context = new ClassPathXmlApplicationContext(locationPath);
		System.out.println("456");
		PubXnxqService h = (PubXnxqService) context.getBean("pubXnxqService");
		HashMap map = new HashMap();
		map.put("xq", "1");
		List<Map> xnxqList = h.queryPubXnxq(map);
		System.out.println(xnxqList);
}

}

package com.incon.common.pub.pubJys.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.incon.common.pub.pubJys.page.PubJysPage;
import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.pojo.common.YxdmbEntity;
@SuppressWarnings("all")
@Service(value="pubJysService")
public class PubJysServiceImpl extends CommServiceImpl implements PubJysService{

    //查询教研室
	@Override
	public List<Map> queryPubJys(PubJysPage pubJysPage) {
		return dbDao.query("pubJys.queryPubJys", pubJysPage);
	}
	//查询教研室数据权限表中是否有数据
	@Override
	public int queryJyssjqxCount(Map map) {
		
		return (Integer)dbDao.queryForObject("jysgl.queryJyssjqxCount",map);
	}
	//测试方法
//	public static void main(String[] str){
//		String[] locationPath ={"config/spring/spring-common.xml",
//				         "config/spring/spring-pool.xml",
//				         "config/spring/spring-securitycode.xml"};
//		ApplicationContext context = new ClassPathXmlApplicationContext(locationPath);
//		PubJysService h = (PubJysService) context.getBean("pubJysService");
//		HashMap map = new HashMap();
//		
//		map.put("sfcjgly", "0");
//		map.put("gljb", "0");
//		map.put("yhdm", "dqm");
//		map.put("resultCount", "1");
//		map.put("jsdm", "2");
//		List<Map> jysList = h.queryPubJys(map);
//		System.out.println(jysList.size());
//
//	}
}

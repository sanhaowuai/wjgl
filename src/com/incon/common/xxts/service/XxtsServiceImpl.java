package com.incon.common.xxts.service;

import java.io.File;
import java.io.FileReader;
import java.util.HashMap;

import javax.script.Invocable;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.service.impl.CommServiceImpl;
import com.incon.framework.util.propertiesLoader;

/**
 * 消息推送
 * @author 丁起明
 *
 */
@Service(value= "xxtsService")
public class XxtsServiceImpl extends CommServiceImpl implements XxtsService {
	private static final Logger logger = Logger.getLogger(XxtsServiceImpl.class);
	private propertiesLoader loader = new propertiesLoader();//加载配置文件
	/**
	 * POST发送消息
	 * @param xxbt 消息标题
	 * @param url 消息访问路径
	 * @param xxjsrdm 消息接收人代码
	 * @param zxtdm 子系统代码
	 * @throws Exception 
	 */
	@Transactional
	@Override
	public Integer postMessage(String xxbt,String url,String xxjsrdm,String zxtdm) throws Exception{
		Integer result = 0;
		HashMap map = new HashMap();
		map.put("xxbt", xxbt);	
		map.put("url", url);	
		map.put("xxjsrdm", xxjsrdm);	
		map.put("zxtdm", zxtdm);	
        String inconmh_xxjs_url = loader.getPropertyKey("/config/others/config.properties","inconmh.xxjs.url");
        if(inconmh_xxjs_url == null || inconmh_xxjs_url.trim().equals("")){
        	inconmh_xxjs_url = "";
        }		        
        result = (Integer) dbDao.insert("xxts.addxx", map);
        logger.info(HttpPostRequest.doPost(inconmh_xxjs_url, "senduser="+xxjsrdm+"&message="+xxbt));
		return result;
	}
	/**
	 * GET发送消息
	 * @param xxbt 消息标题
	 * @param url 消息访问路径
	 * @param xxjsrdm 消息接收人代码
	 * @param zxtdm 子系统代码
	 */
	@Transactional	
	@Override
	public Integer getMessage(String xxbt,String url,String xxjsrdm,String zxtdm) throws Exception{
		Integer result = 0;
		HashMap map = new HashMap();
		map.put("xxbt", xxbt);	
		map.put("url", url);	
		map.put("xxjsrdm", xxjsrdm);	
		map.put("zxtdm", zxtdm);	
        String inconmh_xxjs_url = loader.getPropertyKey("/config/others/config.properties","inconmh.xxjs.url");
        if(inconmh_xxjs_url == null || inconmh_xxjs_url.trim().equals("")){
        	inconmh_xxjs_url = "";
        }		
        result = (Integer) dbDao.insert("xxts.addxx", map);
        logger.info(HttpGetRequest.doGet(inconmh_xxjs_url+"?senduser="+xxjsrdm+"&message="+xxbt));
		return result;
	}
	
	public static void main(String[]a) throws Exception{
		String[] locationPath={"config/spring/spring-common.xml"
				,"config/spring/spring-pool.xml"
				,"config/spring/spring-securitycode.xml"};
		ApplicationContext context =new ClassPathXmlApplicationContext(locationPath);
		XxtsService xxtsService = (XxtsService)context.getBean("xxtsService");
		xxtsService.postMessage("您有消息了11", "www.baidu.com", "abc", "incon");

	}	
	
}

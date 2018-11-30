package com.incon.framework.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;


public class propertiesLoader {
	
	private InputStream inStream;

	private Properties pro;
	
	public String getValue(String path,String key){
		Properties p =null;
	    try{
	  	p = new Properties();
	  	String projectPath = this.getClass().getClassLoader().getResource("/").getPath();//得到d:/tomcat/webapps/工程名WEB-INF/classes/路径
	  	System.out.println(projectPath+path);
	  	projectPath=projectPath.substring(1, projectPath.indexOf("classes"));//从路径字符串中取出工程路径
	    System.out.println(projectPath+path);
	    p.load(new FileInputStream(projectPath+path));

	  }catch(Exception e){
		  System.out.println("读取Properties文件出错");
	      e.printStackTrace();
	  }
	  return p.getProperty(key);
	}

		
	public String getPropertyKey(String path,String key){
		inStream = this.getClass().getResourceAsStream(path);
		pro = new Properties();
		try {
			pro.load(inStream);
		}catch (IOException e) {
			throw new RuntimeException("加载配置文件出错！");
		}		
		return pro.getProperty(key);
	}
}

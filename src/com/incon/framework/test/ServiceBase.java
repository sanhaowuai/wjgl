package com.incon.framework.test;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.util.Assert;

import com.incon.common.login.service.LoginService;
import com.incon.pojo.common.UserEntity;

/**
 *  用法
 * 	@Test
    public void test1() {  
    	LoginService loginService = (LoginService) context.getBean("loginService"); 
    }
 * @author Administrator
 *
 */
public abstract class ServiceBase extends Assert
{
	private static	String[] locations={"config/spring/spring-common.xml"
		,"config/spring/spring-pool.xml"
		,"config/spring/spring-securitycode.xml"};
	
	protected static ApplicationContext context = new ClassPathXmlApplicationContext(locations);
}

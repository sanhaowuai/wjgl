package com.incon.framework.listener;

import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.incon.common.login.service.LoginService;
import com.incon.framework.service.InitService;
import com.incon.framework.util.SpringContextHolder;


/**
 * @类名：com.incon.framework.listener.SystemInitListener
 * @作者：Linls
 * @时间：2012-12-24
 * @版本：
 * @描述：系统初始化
 * @修改人员：
 * @修改时间：2012-12-24
 * @修改说明：
 */
public class SystemInitListener implements ServletContextListener {

	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext servletContext = sce.getServletContext();
		InitService initService = SpringContextHolder.getBean("initService");
		servletContext.setAttribute("fields", initService.selectAllFields());
		
		LoginService loginService = SpringContextHolder.getBean("loginService");
		servletContext.setAttribute("XT_CSB_TITLE",loginService.queryCsb("SYS_TITLE"));
		servletContext.setAttribute("XT_CSB_DBVERSION",loginService.queryCsb("DB_VERSION"));
		servletContext.setAttribute("XT_CSB_FRAMEWORKDB_VERSION",loginService.queryCsb("FRAMEWORKDB_VERSION"));
		System.out.println("--------------------------FRAMEWORKDB_VERSION----------------------------------");
		System.out.println(loginService.queryCsb("FRAMEWORKDB_VERSION"));
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}
}

package com.incon.framework.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthenticator extends Authenticator {
 
	
	// * @author Michael.wu
	// * 密码和用户的验证
	public MyAuthenticator() {
		super();
	}

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		propertiesLoader loader = new propertiesLoader();//加载配置文件
		String userName = loader.getPropertyKey("/config/others/config.properties","email.account");
		String passWord = loader.getPropertyKey("/config/others/config.properties","email.password");
		return new PasswordAuthentication(userName, passWord);
	}

}
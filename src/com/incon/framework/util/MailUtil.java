package com.incon.framework.util;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

 
public class MailUtil {

    public static boolean sendEmail(String email, String subject, String body) throws UnsupportedEncodingException {
    	boolean result = true;
        try {
        	propertiesLoader loader = new propertiesLoader();//加载配置文件
        	String host = loader.getPropertyKey("/config/others/config.properties","email.host");
        	String port = loader.getPropertyKey("/config/others/config.properties","email.port");
            String from = loader.getPropertyKey("/config/others/config.properties","email.from");//发送者,显示的发件人名字
            String user = loader.getPropertyKey("/config/others/config.properties","email.user");//发送者邮箱地址 
            Properties props = new Properties();
            
            props.put("mail.smtp.host", host);//邮件服务器smtp.126.com
            props.put("mail.smtp.port", port);//邮件服务器端口
            props.put("mail.smtp.auth", "true");//需要验证
            props.setProperty("mail.transport.protocol", "smtp");//发送邮件协议
            
            //props.setProperty("mail.debug", "true");//设置debug模式 后台输出邮件发送的过程
            Session session = Session.getInstance(props,new MyAuthenticator());//进行身份验证
            //session.setDebug(true);//debug模式
            MimeMessage msg = new MimeMessage(session);//创建消息对象
            msg.setSentDate(new Date());
            msg.setFrom(new InternetAddress(user,from,"UTF-8"));//设置发送人
            msg.setRecipients(RecipientType.TO,InternetAddress.parse(email));//接收人
            //msg.setRecipients(RecipientType.CC,InternetAddress.parse(email));//抄送人
            //msg.setRecipients(RecipientType.BCC,InternetAddress.parse(email));//密送人
            msg.setSubject(subject, "UTF-8");  //设置邮件主题
            //msg.setText(body, "UTF-8"); //设置邮件内容(文本)
            msg.setContent(body, "text/html;charset=gbk"); //设置邮件内容(文本)
            msg.saveChanges();
            Transport.send(msg);//发送消息
        } catch (NoSuchProviderException e) {
            e.printStackTrace();
            result = false;
        } catch (MessagingException e) {
        	result = false;
            e.printStackTrace();
        }
        return result;
    }
    
    public static void main(String args[]) throws UnsupportedEncodingException
    {
//    	for(int i=0;i<10;i++){
    		 System.out.println(sendEmail("dingqiming@incons.com.cn","邮件测试","<p>测试数据</p>"+new Date()));
//    	}
//    	propertiesLoader loader = new propertiesLoader();
//    	System.out.println(loader.getPropertyKey("/config/others/config.properties","email.from"));

    	
    }
}
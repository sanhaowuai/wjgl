package com.incon.framework.util;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.*;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

public class DBCPOOL {
	
	public java.sql.Connection RetConn;
	public String ErrMessage;
	public String strDataSource;

	public DBCPOOL() {
		RetConn = null;
		ErrMessage = "OK";
	}

	public Connection getConnection(String DbUser) throws UnsupportedEncodingException {

		//用jdbc连接数据库
		//String addr = "jdbc:oracle:thin:@192.168.0.197:1521:ORCL";
		//String user = "CG" + DbUser;
		//String pass = "sa";

		//取得jdbc.properties路径及相应值--开始
		String url = this.getClass().getClassLoader().getResource("/").toString();
		url=url.substring(5,url.length()-8)+"jdbc.properties";

		//调用URLDecoder的decode方法进行解码，以便得到原始的中文及空格路径 
		url = URLDecoder.decode(url,"utf-8");
 		Properties props = new Properties();
		InputStream in = null;
		try {
			in = new BufferedInputStream(new FileInputStream(url));
			props.load(in);
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		String addr = props.getProperty("jdbc.url");
		String user = props.getProperty("jdbc.username");
		String pass = props.getProperty("jdbc.password");
		//取得jdbc.properties路径及相应值--结束
		
		try {
			DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
			RetConn = DriverManager.getConnection(
 					addr, user, pass);
		} catch (Exception e) {
			ErrMessage = " Err:" + e.getMessage();
			System.out.println(ErrMessage);
			RetConn = null;
		}

		return RetConn;
	}

	//字符串替换
	public String restr(String s) {
		try {
			if (s != null) {
				s = s.trim();
				s = s.replaceAll("\'", "’");
				s = s.replaceAll("\"", "”");
			}
		} catch (Exception exception) {
			ErrMessage = " Err:" + exception.getMessage();
			System.out.println(ErrMessage);
		}
		return s;
	}

	public String change_num(double d) {
		String s6 = "0";
		try {
			long l = (long) (d * 100D);
			if (l == 0L) {
				s6 = "0";
			} else {
				String s1 = String.valueOf(l);
				String s3 = s1.substring(0, s1.length() - 2);
				String s5 = s1.substring(s1.length() - 2);
				int i = Integer.parseInt(s5);
				if (i == 0) {
					s6 = s3;
				} else {
					s3 = s3.concat(".");
					s6 = s3.concat(s5);
				}
			}
		} catch (Exception exception) {
			ErrMessage = " Err:" + exception.getMessage();
			System.out.println(ErrMessage);
		}
		return s6;
	}

	public String splitAndFilterString(String input, int length) {
		// 去掉所有html元素,
		String str="";
		try {
			if (input == null || input.trim().equals("")) {
				return "";
			}
			str = input.replaceAll("\\&[a-zA-Z]{1,10};", "").replaceAll("<[^>]*>", "");
			str = str.replaceAll("[(/>)<]", "");
			int len = str.length();
			if (len <= length) {
				return str;
			} else {
				str = str.substring(0, length);
				str += "......";
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error:splitAndFilterString "+e);
		}
		return str;
	}

	//判断字符串是否为正整数
	public boolean isPositiveInteger(String value) {
		try {
			if(Integer.parseInt(value)>0){
				return true;
			}else{
				return false;
			}
		} catch (NumberFormatException e) {
			return false;
		}
	}

	//判断字符串是否为数字
	public boolean isDouble(String value) {
		try {
			Double.parseDouble(value);
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
	}

	//字符串转ASCII
	public String strToAscii(String value) {
		StringBuffer sbu = new StringBuffer();
		char[] chars = value.toCharArray();
		for (int i = 0; i < chars.length; i++) {
			if (i != chars.length - 1) {
				sbu.append((int) chars[i]).append(",");
			} else {
				sbu.append((int) chars[i]);
			}
		}
		return sbu.toString().replaceAll(",", "");
	}

	//取得client ip
	public String getIpAddr(HttpServletRequest request) {      
		String ip = request.getHeader("clientip");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("x-forwarded-for");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
	}

}
package com.incon.framework.util;

import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.UserEntity;
/**
 * RSA用户工具
 * 用来存取RSA用
 * @author dqm
 *
 */
public class RSAUserUtil {
	
	//密码输入错误次数记录
	public static final String CHECK_MMSRCWCSJL = "CHECK_MMSRCWCSJL";
	//密码输入错误次数最多几次
	public static final Integer CHECK_MMSRCWCSS = 2;
	
	public static final String SERVICE_RSA_PUBLIC_MODULUS = "SERVICE_RSA_PUBLIC_MODULUS";
	public static final String SERVICE_RSA_PRIVATE_EXPONENT = "SERVICE_RSA_PRIVATE_EXPONENT";
	
	public static final String CLIENT_RSA_MODULUS = "CLIENT_RSA_MODULUS";
	public static final String CLIENT_RSA_EXPONENT = "CLIENT_RSA_EXPONENT";
	
	public static final String RSA_SESSION = "RSA_SESSION";
	
	
	private static final Logger LOG = Logger.getLogger(RSAUserUtil.class);
	
	/**
	 * 检查密码错误次数，是否锁定用户
	 * @param session
	 * @param request
	 * @param response
	 * @return
	 */
	public static Map checkMmsrcw(HttpSession session,HttpServletRequest request,HttpServletResponse response,UserEntity userEntity) {
		Map m = new HashMap();
		Boolean b = true;
		Integer LoginTimes=0;
		Integer o=(Integer)session.getAttribute(RSAUserUtil.CHECK_MMSRCWCSJL);//密码或用户输入错误
        if(o!=null){
            LoginTimes=o;
        }
        if(userEntity == null) {
        	LoginTimes++;
        	session.setAttribute(RSAUserUtil.CHECK_MMSRCWCSJL,LoginTimes);
        }
        if(LoginTimes >= RSAUserUtil.CHECK_MMSRCWCSS) {
        	//是否锁定用户登陆
        	b = false;
        }else {
        	b = true;
        }
    	//是否锁定用户登陆
    	m.put("CHECK_MMSRCWCSJL", b);
        //密码输入错误次数
        m.put("LOGIN_TIMES", LoginTimes);
        //密码输入错误次数最多几次
        m.put("CHECK_MMSRCWCSS", RSAUserUtil.CHECK_MMSRCWCSS);
		return m;
	}
	public static void removeMmsrcw(HttpSession session,HttpServletRequest request,HttpServletResponse response,UserEntity userEntity) {
		Integer o=(Integer)session.getAttribute(RSAUserUtil.CHECK_MMSRCWCSJL);//密码或用户输入错误
        if(o!=null && userEntity!=null){
        	session.removeAttribute(RSAUserUtil.CHECK_MMSRCWCSJL);
        }
	}	
	
	/**
	 * 从session中将共有私有对移除
	 * @param session
	 * @param request
	 * @param response
	 */
	public static void removeKeyForSession(HttpSession session,HttpServletRequest request,HttpServletResponse response){
		removeKeyForSession(session,request);
	}
	
	/**
	 * 从session中将共有私有对移除
	 * @param session
	 * @param request
	 * @param response
	 */
	public static void removeKeyForSession(HttpSession session,HttpServletRequest request){
		removeKeyForSession(session);
	}
	
	/**
	 * 从session中将共有私有对移除
	 * @param session
	 * @param request
	 * @param response
	 */
	public static void removeKeyForSession(HttpSession session){
		session.removeAttribute(RSAUserUtil.RSA_SESSION);
	}
	
	/**
	 * 将共有私有对存储到session中
	 * @param session
	 * @param request
	 * @param response
	 * @return Map<String,String>={RSAUserUtil.CLIENT_RSA_MODULUS,"字符串",(RSAUserUtil.CLIENT_RSA_EXPONENT,"字符串"}
	 */
	public static void createKeyToSession(HttpSession session,HttpServletRequest request,HttpServletResponse response){
		createKeyToSession(session,request);
	}
	
	/**
	 * 将共有私有对存储到session中
	 * @param session
	 * @param request
	 * @return Map<String,String>={RSAUserUtil.CLIENT_RSA_MODULUS,"字符串",(RSAUserUtil.CLIENT_RSA_EXPONENT,"字符串"}
	 */
	public static void createKeyToSession(HttpSession session,HttpServletRequest request){
		createKeyToSession(session);
	}
	
	/**
	 * 将共有私有对存储到session中
	 * @param session
	 * @return Map<String,String>={RSAUserUtil.CLIENT_RSA_MODULUS,"字符串",(RSAUserUtil.CLIENT_RSA_EXPONENT,"字符串"}
	 */
	public static void createKeyToSession(HttpSession session){
		Map<String,String> result = new HashMap();;
		
		try{
			LOG.debug("- ------- 启动 ------ -");
			RSAUtils rsa = new RSAUtils();
			LOG.debug("- ------- 创建 RSAUtils对象 成功 ------ -");
			//生成公钥和密钥
			Map<String,Object> keyMap = rsa.createKey();
			LOG.debug("- ------ 生成公钥和密钥 成功 ------ -");
			RSAPublicKey publicKey = (RSAPublicKey) keyMap.get("publicKey");
			LOG.debug("- ------ 获取公钥 成功------ -");
			RSAPrivateKey privateKey = (RSAPrivateKey) keyMap.get("privateKey");
			LOG.debug("- ------ 获取私钥 成功------ -");
			//js通过模和公钥指数获取公钥对字符串进行加密，注意必须转为16进制
			//模
			String Modulus = publicKey.getModulus().toString(16);
			LOG.debug("- ------ 获取公钥模块 成功------ -");
			//公钥指数
			String Exponent = publicKey.getPublicExponent().toString(16);
			LOG.debug("- ------ 公钥指数 成功------ -");
			
			//共有模块存储到session中
			result.put(RSAUserUtil.SERVICE_RSA_PUBLIC_MODULUS, publicKey.getModulus().toString());
			//session.setAttribute(RSAUserUtil.SERVICE_RSA_PUBLIC_MODULUS, publicKey.getModulus().toString());
			LOG.debug("- ------ 共有模块存储到Map中 成功------ -");
			//私钥指数存储到session中 
			result.put(RSAUserUtil.SERVICE_RSA_PRIVATE_EXPONENT, privateKey.getPrivateExponent().toString());
			//session.setAttribute(RSAUserUtil.SERVICE_RSA_PRIVATE_EXPONENT, privateKey.getPrivateExponent().toString());
			LOG.debug("- ------ 私钥指数存储到Map中 成功------ -");
			result.put(RSAUserUtil.CLIENT_RSA_MODULUS, Modulus);
			LOG.debug("- ------ 公钥模块存储到Map中 成功------ -");
			result.put(RSAUserUtil.CLIENT_RSA_EXPONENT, Exponent);	
			LOG.debug("- ------ 私钥指数存储到Map中 成功------ -");
			session.setAttribute(RSAUserUtil.RSA_SESSION, result);
			LOG.debug("- ------ 创建钥匙成功------ -");			
		}catch(Exception e){
			LOG.error("Err :", e);
		}
	}	
	
	
	
	/**
	 * 新解码 丁起明
	 * @param rsa
	 * @param encryptStr
	 * @return
	 * @throws Exception
	 */
	public static String decryptToString(Map<String,String> rsa,String encryptStr) throws Exception {
		//共有模块
		String SERVICE_RSA_PUBLIC_MODULUS = rsa.get(RSAUserUtil.SERVICE_RSA_PUBLIC_MODULUS);
		//私钥指数
		String SERVICE_RSA_PRIVATE_EXPONENT = rsa.get(RSAUserUtil.SERVICE_RSA_PRIVATE_EXPONENT);
		if(SERVICE_RSA_PUBLIC_MODULUS==null||SERVICE_RSA_PUBLIC_MODULUS.trim().equals("") || SERVICE_RSA_PRIVATE_EXPONENT==null||SERVICE_RSA_PRIVATE_EXPONENT.trim().equals("")) {
			return "";
		}
		RSAUtils rsautil = new RSAUtils();
		//根据模和私钥指数获取私钥
		RSAPrivateKey prkey = RSAUtils.getPrivateKey(SERVICE_RSA_PUBLIC_MODULUS,SERVICE_RSA_PRIVATE_EXPONENT);
		return rsautil.decrypttoStr(prkey,encryptStr);
	}
	/**
	 * 解码
	 * @param session
	 * @param request
	 * @param response
	 * @param encryptStr 加密后字符串
	 * @return
	 * @throws Exception
	 */
	public static String decryptToString(HttpSession session,HttpServletRequest request,HttpServletResponse response,String encryptStr) {
		return decryptToString(session,request,encryptStr);
	}
	
	/**
	 * 解码
	 * @param session
	 * @param request
	 * @param encryptStr 加密后字符串
	 * @return
	 * @throws Exception
	 */
	public static String decryptToString(HttpSession session,HttpServletRequest request,String encryptStr){

		return decryptToString(session,encryptStr);
	}
	
	/**
	 * 解码
	 * @param session
	 * @param encryptStr 加密后字符串
	 * @return
	 * @throws Exception
	 */
	public static String decryptToString(HttpSession session,String encryptStr){
		String result = "";
		try{
			LOG.debug("- ------- 启动 ------ -");
			RSAUtils rsa = new RSAUtils();
			//共有模块
			String SERVICE_RSA_PUBLIC_MODULUS = (String) session.getAttribute(RSAUserUtil.SERVICE_RSA_PUBLIC_MODULUS);
			//私钥指数
			String SERVICE_RSA_PRIVATE_EXPONENT = (String)session.getAttribute(RSAUserUtil.SERVICE_RSA_PRIVATE_EXPONENT);
			if(SERVICE_RSA_PUBLIC_MODULUS==null||SERVICE_RSA_PUBLIC_MODULUS.trim().equals("") || SERVICE_RSA_PRIVATE_EXPONENT==null||SERVICE_RSA_PRIVATE_EXPONENT.trim().equals("")) {
				return "";
			}
			//根据模和私钥指数获取私钥
			RSAPrivateKey prkey = RSAUtils.getPrivateKey(SERVICE_RSA_PUBLIC_MODULUS,SERVICE_RSA_PRIVATE_EXPONENT);
			result = rsa.decrypttoStr(prkey,encryptStr);
		}catch(Exception e){
			LOG.error("Err :", e);
		}
		return result;
	}
	
	public static void main(String []aa) {
		  int a = 1;
		  System.out.println(++a); //输出2
		  int s = 1;
		  System.out.println(s++); //输出1
		  System.out.println(s);  //上次执行的后++，这次才输出2
	}

	
}

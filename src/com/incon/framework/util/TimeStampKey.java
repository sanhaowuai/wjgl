package com.incon.framework.util;

import java.util.UUID;

/**
 * 根据时间戳加密和解密
 * @author Meng
 *
 */
public class TimeStampKey {

	/**
	 * 加密
	 * @param key  要加密的key
	 * @param timeStamp  允许解密的时长  单位:秒
	 * @return
	 */
	public static String encrypt(String key,int timeStamp){
		long time = System.currentTimeMillis();
		key = timeStamp + "@" + time + key;
		try {
			DESPlus_New des = new DESPlus_New();
			key = des.encrypt(key);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return key;
	}
	

	/**
	 * 解密
	 * @param key
	 * @return
	 * @throws Exception 如果抛异常 说明加密key有问题
	 */
	public static String decrypt(String key) throws Exception{
		DESPlus_New des = new DESPlus_New();
		key = des.decrypt(key);//解密后字符串
		int timeStamp = Integer.valueOf(key.substring(0,key.indexOf("@")));//解密时长
		Long newTime = System.currentTimeMillis();
		Long oldTime = Long.valueOf(key.substring(key.indexOf("@")+1,key.indexOf("@")+1+newTime.toString().length()));
		if(newTime - oldTime > timeStamp * 1000){
			throw new Exception("请求超时");
		}
		return key.substring(key.indexOf("@")+1+newTime.toString().length());
	}
	
	//测试方法
	public static void main(String[] args) {
		String url = "http://localhost:8080/tmis/mbscyl/analysis?";
		String kcdm = "";
	    kcdm = "08T1231470";
		String lmid = "010101";
//		kcdm = "08T1231470";
//		String lmid = "010101";
		
		System.out.println(url + "kcdm=" + TimeStampKey.encrypt(kcdm, 3600) + "&lmid=" + TimeStampKey.encrypt(lmid, 3600));
	}
}

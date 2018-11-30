package com.incon.framework.util;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @类名：com.incon.common.util.DateUtil
 * @作者：Linls
 * @时间：2012-10-11
 * @版本：
 * @描述：日期工具类
 * @修改人员：
 * @修改时间：2012-10-11
 * @修改说明：
 */
 @SuppressWarnings("serial")
public final class DateUtil implements Serializable {
	
	/**
	 * 获得当前时间
	 * @param formate 指定日期格式 "yyyy-MM-dd" "yyyy年MM月dd日" "yyyy-MM-dd HH:mm:ss"
	 * @return
	 */
	public static final String CurrentTime(String formate){
		String curTime="";
		//格式化时间开始
		SimpleDateFormat formatter;
		java.util.Date currentDate=new java.util.Date();
		formatter=new SimpleDateFormat(formate);
		currentDate=Calendar.getInstance().getTime();
		//格式化时间结束
		curTime= formatter.format(currentDate);
		return curTime;
	}
	
	/**
	 * 获取当前年
	 * @return
	 */
	public static final String getYear(){
		String curTime="";
		//格式化时间开始
		SimpleDateFormat formatter;
		java.util.Date currentDate=new java.util.Date();
		formatter=new SimpleDateFormat("yyyy");
		currentDate=Calendar.getInstance().getTime();
		//格式化时间结束
		curTime= formatter.format(currentDate);
		return curTime;
	}
		 
	/**
	 * 日期比较
	 * @param DATE1 日期1
	 * @param DATE2 日期2
	 * @return int 0 日期相等 1 DATE1在DATE2前 -1 DATE1在DATE2后
	 */
	public static int compare_date(String DATE1, String DATE2) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date dt1 = df.parse(DATE1);
			Date dt2 = df.parse(DATE2);
			if (dt1.getTime() > dt2.getTime()) {
				return 1;
			} else if (dt1.getTime() < dt2.getTime()) {
				return -1;
			} else {
				return 0;
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return 0;
	}
	
	 /**
	  * 字符串转换成日期
	 * @param str 日期字符串
	 * @param formate 指定日期格式 "yyyy-MM-dd" "yyyy年MM月dd日" "yyyy-MM-dd HH:mm:ss"
	 * @return
	 */
	public static Date StrToDate(String str, String formate) {
		SimpleDateFormat formatter=new SimpleDateFormat(formate);
		Date date;
		try {
			date = formatter.parse(str);
			return date;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**     
	 * 正则表达式验证日期格式     
	 * @param strdate "yyyy-MM-dd";
	 */     
	public static boolean DateCheck  (String strdate) {
		String eL= "^((\\d{2}(([02468][048])|([13579][26]))[\\-\\/\\s]?((((0?[13578])|(1[02]))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])))))|(\\d{2}(([02468][1235679])|([13579][01345789]))[\\-\\/\\s]?((((0?[13578])|(1[02]))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\-\\/\\s]?((0?[1-9])|(1[0-9])|(2[0-8]))))))";        
		Pattern p = Pattern.compile(eL);         
		Matcher m = p.matcher(strdate);         
		boolean b = m.matches();        
		if(b){    
		     return true;           
		}        
		else {      		
		     return false;           
		}     
	}
		    
	/**
	 * 获得指定日期的  days  天
	 * @param specifiedDay 指定日期
	 * @param specifiedFormate 制定日期格式
	 * @param days 调整天数 +1 向后一天 -1 向前一天
	 * @return
	 */
	public static String getSpecifiedMBefore(String specifiedDay, String specifiedFormate, Integer days){ 
		Calendar c = Calendar.getInstance(); 
		Date date=null; 
		try { 
			date = new SimpleDateFormat(specifiedFormate).parse(specifiedDay); 
		} catch (ParseException e) { 
			e.printStackTrace(); 
		} 
		c.setTime(date); 
		int day=c.get(Calendar.DATE); 
		c.set(Calendar.DATE, day+days); 
		String dayBefore=new SimpleDateFormat(specifiedFormate).format(c.getTime()); 
		return dayBefore; 
	} 
}

package com.incon.framework.util;

/**
* 定义EL自定义函数
*   字条串"${str}"的长度是${myTag:getLen(str)}<br/>     
    字条串"${str}"截取前5个字符：${myTag:substr(str,0,5)}<br/>     
    5除以3取整数是:${myTag:chufa(5,3) } 
*/  
public class UFunction {   
  
    /**
      * 获取一个字符串的长度
      *
      * @param str
      * @return int
      */  
    public static int getLen(String str) {   
        return str.length();   
     }   
  
    /**
      * 截取字符串
      *
      * @param str
      * @param start
      * @param end
      * @return String
      */  
    public static String substr(String str, int start, int end) { 
    	if(str==null || str.trim().equals("") || str.length()<=0 || str.length() < end){
    		return str;
    	}else {
    		  return str.substring(start, end)+(str.length()==end?"":"..");   
    	}
     }   
      
    /**
      * 两数相除获取整数结果
      *  
      * @param first
      * @param second
      * @return int
      */  
    public static int chufa(int first, int second) {   
        return first / second;   
     }   
    public static String splitAndFilterString(String input, int length) {
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
				str += "..";
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error:splitAndFilterString "+e);
		}
		return str;
	}
    
	
	public static void main(String args[]){
		System.out.println(UFunction.splitAndFilterString("<p>我嗯来了类了2222-1-12<br></p>",10));
		System.out.println("假设某计算机的字长为8位,()则十进制数(-75)10的补码表示()".replaceAll("\\(\\)", "___"));
	}
}

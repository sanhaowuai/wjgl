package com.incon.framework.util;

 
public class IeasTool {
	private static String KeyStr="inconjwv30";
	public static String jiami(String PlainStr) {

		String str3 = "";
		int num3 = PlainStr.length(); // PlainStr长度
		int start = 1;
		int i = 1;
		do {
			String str6 = PlainStr.substring(i - 1, i);
			String str2 = KeyStr.substring(start - 1, start);
			if ((((((int) str6.charAt(0) ^ (int) str2.charAt(0)) < 32) || (((int) str6.charAt(0) ^ (int) str2.charAt(0)) > 126)) || ((int) str6.charAt(0) < 0))|| ((int) str6.charAt(0) > 255)) {
				str3 = str3 + str6;
			} else {
				str3 = str3 + (char) ((int) (((int) str6.charAt(0) ^ (int) str2.charAt(0))));
			}
			if (start == KeyStr.length()) {
				start = 0;
			}
			start += 1;
			i += 1;
		} while (i <= num3);
		if ((num3 % 2) == 0) {
			String str4 = strReverse(str3.substring(0, num3 / 2));
			String str5 = strReverse(str3.substring(num3 / 2));
			str3 = str4 + str5;
		}
		return str3;

	}

	public static String jiemi(String PlainStr) {
		String str3 = "";
		int start = 1;
		if ((PlainStr.length() % 2) == 0) {
			String str4 = strReverse(PlainStr.substring(0,PlainStr.length() / 2));
			String str5 = strReverse(PlainStr.substring(PlainStr.length() / 2));
			PlainStr = str4 + str5;
		}
		int num3 = PlainStr.length();
		int i = 1;
		do {
			String str6 = PlainStr.substring(i - 1, i);
			String str2 = KeyStr.substring(start - 1, start);
			System.out.println("123=================="+str6);
			System.out.println("456=================="+str2);
			if ((((((int) str6.charAt(0) ^ (int) str2.charAt(0)) < 32) || (((int) str6.charAt(0) ^ (int) str2.charAt(0)) > 126)) || ((int) str6.charAt(0) < 0))|| ((int) str6.charAt(0) > 255)) {
				str3 = str3 + str6;
			} else {
				str3 = str3 + (char) ((int) (((int) str6.charAt(0) ^ (int) str2.charAt(0))));
			}
			if (start == KeyStr.length()) {
				start = 0;
			}
			start += 1;
			i += 1;
		} while (i <= num3);
		return str3;
	}
	
	public static String jiami(String PlainStr,String key) {

		String str3 = "";
		int num3 = PlainStr.length(); // PlainStr长度
		int start = 1;
		int i = 1;
		do {
			String str6 = PlainStr.substring(i - 1, i);
			String str2 = key.substring(start - 1, start);
			if ((((((int) str6.charAt(0) ^ (int) str2.charAt(0)) < 32) || (((int) str6.charAt(0) ^ (int) str2.charAt(0)) > 126)) || ((int) str6.charAt(0) < 0))|| ((int) str6.charAt(0) > 255)) {
				str3 = str3 + str6;
			} else {
				str3 = str3 + (char) ((int) (((int) str6.charAt(0) ^ (int) str2.charAt(0))));
			}
			if (start == key.length()) {
				start = 0;
			}
			start += 1;
			i += 1;
		} while (i <= num3);
		if ((num3 % 2) == 0) {
			String str4 = strReverse(str3.substring(0, num3 / 2));
			String str5 = strReverse(str3.substring(num3 / 2));
			str3 = str4 + str5;
		}
		return str3;

	}

	public static String jiemi(String PlainStr,String key) {
		String str3 = "";
		int start = 1;
		if ((PlainStr.length() % 2) == 0) {
			String str4 = strReverse(PlainStr.substring(0,PlainStr.length() / 2));
			String str5 = strReverse(PlainStr.substring(PlainStr.length() / 2));
			PlainStr = str4 + str5;
		}
		int num3 = PlainStr.length();
		int i = 1;
		do {
			String str6 = PlainStr.substring(i - 1, i);
			String str2 = key.substring(start - 1, start);
			System.out.println("123=================="+str6);
			System.out.println("456=================="+str2);
			if ((((((int) str6.charAt(0) ^ (int) str2.charAt(0)) < 32) || (((int) str6.charAt(0) ^ (int) str2.charAt(0)) > 126)) || ((int) str6.charAt(0) < 0))|| ((int) str6.charAt(0) > 255)) {
				str3 = str3 + str6;
			} else {
				str3 = str3 + (char) ((int) (((int) str6.charAt(0) ^ (int) str2.charAt(0))));
			}
			if (start == key.length()) {
				start = 0;
			}
			start += 1;
			i += 1;
		} while (i <= num3);
		return str3;
	}

	// 字符反向
	public static String strReverse(String str) {
		String s = new String();
		for (int i = str.length() - 1; i >= 0; i--) {
			s += str.charAt(i);
		}
		return s;
	}
}

package com.incon.framework.filter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import org.springframework.web.util.HtmlUtils;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import org.springframework.web.util.HtmlUtils;

/**
 * 
 * XSS 拦截
 * 
 * @author 丁起明 
 * @version 20180509
 * 
 * 
 */

public class XssHttpServletRequestWrapper extends HttpServletRequestWrapper {

	public XssHttpServletRequestWrapper(HttpServletRequest servletRequest) {

		super(servletRequest);

	}

	public String[] getParameterValues(String parameter) {

		String[] values = super.getParameterValues(parameter);

		if (values == null)
			return null;

		int count = values.length;

		String[] encodedValues = new String[count];

		for (int i = 0; i < count; i++) {

			encodedValues[i] = cleanXSS(values[i]);

		}

		return encodedValues;

	}

	public String getParameter(String parameter) {

		String value = super.getParameter(parameter);

		if (value == null)
			return null;

		return cleanXSS(value);

	}

	public String getHeader(String name) {

		String value = super.getHeader(name);

		if (value == null)
			return null;

		return cleanXSS(value);

	}

	// 这里可以自己实现转义，也可以直接用工具类进行转义，比如说org.apache.common.lang.StringEscapeUtils和org.springframework.web.util.HtmlUtils

	private String cleanXSS(String value) {

		/*
		 * StringBuilder buffer = new StringBuilder(value.length() + 16);
		 * 
		 * for (int i = 0; i < value.length(); i++) {
		 * 
		 * char c = value.charAt(i);
		 * 
		 * switch (c) {
		 * 
		 * case '>':
		 * 
		 * buffer.append(">");// 转义大于号
		 * 
		 * break;
		 * 
		 * case '<':
		 * 
		 * buffer.append("<");// 转义小于号
		 * 
		 * break;
		 * 
		 * case '\'':
		 * 
		 * buffer.append("'");// 转义单引号
		 * 
		 * break;
		 * 
		 * case '\"':
		 * 
		 * buffer.append("\""); // 转义双引号
		 * 
		 * break;
		 * 
		 * case '&':
		 * 
		 * buffer.append("&");// 转义&
		 * 
		 * break;
		 * 
		 * default:
		 * 
		 * buffer.append(c);
		 * 
		 * break;
		 * 
		 * }
		 * 
		 * }
		 * 
		 * return buffer.toString();
		 */

		// 直接用spring的HtmlUtils 进行html转义

		if (value != null) {

			value = HtmlUtils.htmlEscape(value);

		}

		return value;

	}

}

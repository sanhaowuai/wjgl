package com.incon.framework.filter;

import java.io.IOException;

import javax.servlet.Filter;

import javax.servlet.FilterChain;

import javax.servlet.FilterConfig;

import javax.servlet.ServletException;

import javax.servlet.ServletRequest;

import javax.servlet.ServletResponse;

import javax.servlet.http.HttpServletRequest;
/**

 * XSS 过滤器

 * @author 丁起明 
 * @version 20180509
 */
/**
 * 包装原生servlet对象，处理xss问题
 * 
 */
public class XssHttpServletFilter implements Filter {

	FilterConfig filterConfig = null;

	public void init(FilterConfig filterConfig) throws ServletException {

		this.filterConfig = filterConfig;

	}

	public void destroy() {

		this.filterConfig = null;

	}
	// 对request进行包装

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		chain.doFilter(new XssHttpServletRequestWrapper((HttpServletRequest) request), response);

	}

}
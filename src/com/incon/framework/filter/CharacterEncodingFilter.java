package com.incon.framework.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

import com.incon.framework.util.propertiesLoader;
/**
 * 脚本过滤器
 * @author dqm
 *
 */
public class CharacterEncodingFilter extends OncePerRequestFilter {

	private propertiesLoader loader = new propertiesLoader();// 加载配置文件

	@Override
	protected void doFilterInternal(HttpServletRequest request,
			HttpServletResponse response, FilterChain chain)
			throws ServletException, IOException {
		HttpServletRequest requesta = new Request((HttpServletRequest) request);
		response.setHeader("Set-Cookie", "name=value; HttpOnly");
		String referer = request.getHeader("Referer"); // REFRESH
		if ((referer != null && referer.indexOf(request.getContextPath()) < 0)) {
			System.out.println("-------------");
			String system_wz = loader.getPropertyKey("/config/others/config.properties", "system.wz");//允许哪些网站可以外链接，多个网站已“，”号隔开
			HttpServletResponse servletResponse = (HttpServletResponse) response;
			HttpServletRequest servletRequest = (HttpServletRequest) request;
			String path = servletRequest.getServletPath();
			boolean b = false;
			String wz[] = system_wz.split(",");
			for (int i = 0; i < wz.length; i++) {
				if (referer.indexOf(wz[i]) > -1) {
					b = true;
					break;
				} else {
					b = false;
				}
			}
			if (b) {
				chain.doFilter(servletRequest, servletResponse);
			} else {
				servletResponse.sendRedirect(servletRequest.getContextPath()+ "/error.jsp");
			}

		}else {
			chain.doFilter(requesta, response);
		}
	}

	/**
	 * 脚本过滤器
	 * @param value
	 * @return
	 */
	public String filterDangerString(String value) {
		if (value == null) {
			return null;
		}
		value = value.replaceAll("\\|", "");
		value = value.replaceAll("&", "");
		value = value.replaceAll("\r", "");
		value = value.replaceAll("\n", "");
		value = value.replaceAll("script", "");
		value = value.replaceAll("<", "&lt");
		value = value.replaceAll(">", "&gt");
		String temp = value.toLowerCase();
		while (temp.indexOf("script") >= 0) {
			value = value.substring(0, temp.indexOf("script"))+value.substring(temp.indexOf("script") + 6);
			temp = value.toLowerCase();
		}
		value = value.replaceAll("\"", "");
		return value;
	}

	class Request extends HttpServletRequestWrapper {
		public Request(HttpServletRequest request) {
			super(request);
		}

		@Override
		public String[] getParameterValues(String name) {
			return super.getParameterValues(name);
		}
	}

}
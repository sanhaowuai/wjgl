package filter;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.Filter;  
import javax.servlet.FilterChain;  
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;  
import javax.servlet.ServletRequest;  
import javax.servlet.ServletResponse;  
import javax.servlet.http.HttpServletRequest;

public class SafeFilter implements Filter {
	
	FilterConfig filterConfig = null;

    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
    }

    public void destroy() {
        this.filterConfig = null;
    }

    public void doFilter(ServletRequest request, ServletResponse response,FilterChain chain) throws IOException, ServletException {
    	
    	HttpServletRequest req=(HttpServletRequest)request;
    	StringBuffer URL = (req).getRequestURL();
    	response.setContentType("text/html; charset=GBK");
    	
    	//禁止访问 “/ckfinder/ckfinder.html”
    	if (URL.indexOf("/ckfinder/ckfinder.html")>=0){
    		PrintWriter out = response.getWriter();
    		out.print("<script type=\"text/javascript\">alert(\"由于安全问题，禁止访问！\");window.close();</script>");
			out.close();
			return;
        }
    	
    	//如果访问upload或uploadFiles文件夹，不允许访问asp,aspx,jsp,php,ashx,js,html,htm等文件
    	if ((URL.indexOf("/upload/")>=0 || URL.indexOf("/uploadFiles/")>=0) && (URL.indexOf(".asp")>=0 || URL.indexOf(".aspx")>=0 || URL.indexOf(".jsp")>=0 || URL.indexOf(".php")>=0 || URL.indexOf(".ashx")>=0 || URL.indexOf(".js")>=0 || URL.indexOf(".html")>=0 || URL.indexOf(".htm")>=0)){
    		PrintWriter out = response.getWriter();
    		out.print("<script type=\"text/javascript\">alert(\"由于安全问题，禁止访问！\");window.close();</script>");
			out.close();
			return;
        }
    	
    	//CSRF、XSS和SQL注入攻击过滤 
        chain.doFilter(new XssHttpServletRequestWrapper(req), response);
    }
    
    
}
package filter;

import java.util.HashMap;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

public class XssHttpServletRequestWrapper extends HttpServletRequestWrapper {  
    //获取白名单
	WebApplicationContext webApplicationContext = ContextLoader.getCurrentWebApplicationContext();    
    ServletContext servletContext = webApplicationContext.getServletContext();  
	private HashMap<String, String> filterpath = (HashMap<String, String>) servletContext.getAttribute("filterpath");
	
	public XssHttpServletRequestWrapper(HttpServletRequest servletRequest) {
        super(servletRequest);
    }
    public String[] getParameterValues(String parameter) {
      String[] values = super.getParameterValues(parameter);
      if (values==null)  {
            return null;
      }else{
    	  	int count = values.length;
    	  	String[] encodedValues = new String[count];
    	  	String pathAction = super.getServletPath();
	  		for (int i = 0; i < count; i++) {
	  			if ((filterpath != null) && (filterpath.get(pathAction+","+parameter) == null)){
	  				//返回处理特殊字符后的参数
	  				//System.out.println(pathAction+","+parameter);
	  				encodedValues[i] = cleanXSS(values[i]);
	  			}else{
	  				encodedValues[i] = values[i];
	  			}
    	  	} 
    	  	return encodedValues;
       }
    }
    public String getParameter(String parameter) {
          String value = super.getParameter(parameter);
          if (value == null) {
              return null;
          }else{
        	 String pathAction = super.getServletPath();
        	 if ((filterpath != null) && (filterpath.get(pathAction+","+parameter) == null)){
        		  return cleanXSS(value); //返回处理特殊字符后的参数
         	 }else{
         		  return value;	//返回未处理的参数
         	 }
          }
    }
    public String getHeader(String name) {
        String value = super.getHeader(name);
        if (value == null)
            return null;
        return cleanXSS(value);
    }
    private String cleanXSS(String value) {
        //You'll need to remove the spaces from the html entities below
        value = value.replaceAll("<", "& lt;").replaceAll(">", "& gt;");
        value = value.replaceAll("\\(", "& #40;").replaceAll("\\)", "& #41;");
        value = value.replaceAll("'", "& #39;");
        value = value.replaceAll("eval\\((.*)\\)", "");
        value = value.replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']", "\"\"");
        value = value.replaceAll("script", "");
        return value;
    }

} 
package filter;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;



public class FileInterceptor extends HandlerInterceptorAdapter{  
    
	WebApplicationContext webApplicationContext = ContextLoader.getCurrentWebApplicationContext();    
    ServletContext servletContext = webApplicationContext.getServletContext();  
	private String safeFileHzm = (String) servletContext.getAttribute("safeFileHzm");
	
    @Override  
    public boolean preHandle(HttpServletRequest request,HttpServletResponse response,
    		Object handler) throws Exception {  
        HttpServletRequest req=(HttpServletRequest)request;  
        MultipartResolver res=new org.springframework.web.multipart.commons.CommonsMultipartResolver();  
        if(res.isMultipart(req)){  
            MultipartHttpServletRequest  multipartRequest=(MultipartHttpServletRequest) req;  
            Map<String, MultipartFile> files= multipartRequest.getFileMap();  
            Iterator<String> iterator = files.keySet().iterator();  
            while (iterator.hasNext()) {  
                String formKey = (String) iterator.next();  
                MultipartFile multipartFile = multipartRequest.getFile(formKey); 
                if(multipartFile!=null){
                	if (multipartFile.getOriginalFilename()!=null) {  
                		String filename = multipartFile.getOriginalFilename();  
                		if(checkFile(filename)){  
                			return true;  
                		}else{  
                			DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                			String time=format.format(new Date());
                			System.out.println("**收到非法文件**：上传时间-"+time+";上传文件名为："+filename);
                			PrintWriter out = response.getWriter();
                			StringBuilder builder = new StringBuilder();
                			if (req.getHeader("x-requested-with") != null && req.getHeader("x-requested-with").equals("XMLHttpRequest")) { // ajax请求
                				builder.append("-1");
        					} else {
                    			builder.append("<script type=\"text/javascript\" charset=\"UTF-8\">alert(\"文件类型非法！\");</script>");
        					}
                			out.print(builder.toString());
                			out.close();
                			return false;
                		}  
                	}  
                }
            }  
            return true;  
        }else{  
            return true;  
        }  
    }  
    
	 /*
     * 文件类型判断
     */
    private  boolean checkFile(String fileName){
        boolean flag=false;
        String suffix = fileName.substring(fileName.lastIndexOf(".")+1, fileName.length());  //获取文件后缀  
        if(safeFileHzm.contains(suffix.trim().toLowerCase())){  
            flag=true;  
        }  
        return flag;  
    } 
    

}

package filter;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * @描述：系统初始化时加载白名单路径
 */
public class PathInitListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		//获取过滤漏洞白名单
		ServletContext servletContext = sce.getServletContext();
		String webfilepath = sce.getServletContext().getRealPath("/");
		String filePath = webfilepath + "/WEB-INF/classes/config/filter/filterpath.txt";
		servletContext.setAttribute("filterpath",readTxtFile(filePath));
		//获取上传文件后缀名白名单
    	servletContext.setAttribute("safeFileHzm",readSafeFile());
	}
	
	/*
	 * 读取过滤漏洞文件
	 */
	@SuppressWarnings("unused")
	private HashMap<String, String> readTxtFile(String filePath){
		HashMap<String, String> filterpath = new HashMap<String, String>();
		try {
			  String encoding = "GBK";
		      File file = new File(filePath);
		      if ((file.isFile()) && (file.exists())){
		        InputStreamReader read = new InputStreamReader(new FileInputStream(file), encoding);
		        BufferedReader bufferedReader = new BufferedReader(read);
		        String lineTxt = null;
		        while ((lineTxt = bufferedReader.readLine()) != null) {
		          filterpath.put(lineTxt, lineTxt);
		        }
		        read.close();
		      }else{
		        System.out.println("找不到指定的过滤漏洞文件！");
		      }
		} catch (Exception e) {
			System.out.println("读取过滤漏洞文件内容出错！");
		    e.printStackTrace();
		}
		return filterpath;
	}
	
	/*
	 * 获取上传文件后缀名白名单
	 */
	@SuppressWarnings("unused")
	private String readSafeFile(){
		InputStream inStream = this.getClass().getResourceAsStream("/config/filter/safeFile.properties");
    	Properties pro = new Properties();
    	try {
			pro.load(inStream);
		}catch (IOException e) {
			throw new RuntimeException("加载配置文件出错！");
		}
    	String suffixList = pro.getProperty("fileType");
    	return suffixList;
	}

}

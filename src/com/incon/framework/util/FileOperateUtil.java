package com.incon.framework.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipOutputStream;
import java.text.SimpleDateFormat;  
import java.util.ArrayList;  
import java.util.Date;  
import java.util.HashMap;  
import java.util.Iterator;  
import java.util.List;  
import java.util.Map;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;   
import org.springframework.util.FileCopyUtils;  
import org.springframework.web.multipart.MultipartFile;  
import org.springframework.web.multipart.MultipartHttpServletRequest;  




/** 
 * 
 * @author 车成涛
 * @date 2013-10-22
 */  
public class FileOperateUtil {  
	// 上传文件的真实名称
	private static final String REALNAME = "realName"; 
	// 上传文件的存储名称
	private static final String STORENAME = "storeName"; 
	// 上传文件的文件大小
	private static final String SIZE = "size"; 
	// 上传文件的文件后缀
	private static final String SUFFIX = "suffix"; 
	// 文件的mimeType
	private static final String CONTENTTYPE = "contentType"; 
	// 创建时间
	private static final String CREATETIME = "createTime"; 
	// 上传后放在哪个位置（教材封面文件夹下）
	private static final String UPLOADDIR = "upload/courseCover/";
  
    /** 
     * 将上传的文件进行重命名 
     *  
     * @author geloin 
     * @date 2012-3-29 下午3:39:53 
     * @param name 
     * @return 
     */  
    private static String rename(String name) {  
  
        Long now = Long.parseLong(new SimpleDateFormat("yyyyMMddHHmmss")  
                .format(new Date()));  
        Long random = (long) (Math.random() * now);  
        String fileName = now + "" + random;  
  
        if (name.indexOf(".") != -1) {  
            fileName += name.substring(name.lastIndexOf("."));  
        }  
  
        return fileName;  
    }  
  
    /** 
     * 压缩后的文件名 
     *  
     * @author geloin 
     * @date 2012-3-29 下午6:21:32 
     * @param name 
     * @return 
     */  
    private static String zipName(String name) {  
        String prefix = "";  
        if (name.indexOf(".") != -1) {  
            prefix = name.substring(0, name.lastIndexOf("."));  
        } else {  
            prefix = name;  
        }  
        return prefix + ".zip";  
    }  
  
    /** 
     * 上传文件 
     *  
     * @author geloin 
     * @date 2012-5-5 下午12:25:47 
     * @param request 
     * @param params 
     * @param values 
     * @return 
     * @throws Exception 
     */  
    public static List<Map<String, Object>> upload(HttpServletRequest request,  
            String[] params, Map<String, Object[]> values) throws Exception {  
  
        List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();  
        MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request;  
        Map<String, MultipartFile> fileMap = mRequest.getFileMap();  
        String uploadDir = request.getSession().getServletContext().getRealPath("/")+ FileOperateUtil.UPLOADDIR;  
        File file = new File(uploadDir);  
        if (!file.exists()) {  
            file.mkdir();  
        }  
  
        String fileName = null;  
        int i = 0;  

        for (Iterator<Map.Entry<String, MultipartFile>> it = fileMap.entrySet()  
                .iterator(); it.hasNext(); i++) {  
            Map.Entry<String, MultipartFile> entry = it.next();  
            MultipartFile mFile = entry.getValue();  
            fileName = mFile.getOriginalFilename();  
            if(fileName != null && !"".equals(fileName)){
            	String storeName = rename(fileName);  
            	String noZipName = uploadDir + storeName;  
            	// 上传成为压缩文件  后面的 noZipName替换为zipName
            	//String zipName = zipName(noZipName);  
            	// ZipOutputStream outputStream = new ZipOutputStream(  
            	//new BufferedOutputStream(new FileOutputStream(zipName)));  
            	//outputStream.putNextEntry(new ZipEntry(fileName));  
            	//outputStream.setEncoding("GBK");  
            	
            	FileOutputStream out = new FileOutputStream(noZipName);
            	FileCopyUtils.copy(mFile.getInputStream(), out);  
            	Map<String, Object> map = new HashMap<String, Object>();  
            	// 固定参数值对   
            	map.put(FileOperateUtil.REALNAME, fileName);  
            	map.put(FileOperateUtil.STORENAME, storeName);  
            	map.put(FileOperateUtil.SIZE, new File(noZipName).length());  
            	map.put(FileOperateUtil.SUFFIX, "jpg");  
            	map.put(FileOperateUtil.CONTENTTYPE, "application/octet-stream");  
            	map.put(FileOperateUtil.CREATETIME, new Date());  
            	map.put("URL",uploadDir);  
            	
            	// 自定义参数值对   
            	for (String param : params) {  
            		map.put(param, values.get(param)[i]);  
            	}  
            	result.add(map);  
            }
        }
        return result;  
    }  
  
    /** 
     * 下载 
     *  
     * @author geloin 
     * @date 2012-5-5 下午12:25:39 
     * @param request 
     * @param response 
     * @param storeName 
     * @param contentType 
     * @param realName 
     * @throws Exception 
     */  
    public static void download(HttpServletRequest request,  
            HttpServletResponse response, String storeName, String contentType,  
            String realName) throws Exception {  
        response.setContentType("text/html;charset=UTF-8");  
        request.setCharacterEncoding("UTF-8");  
        BufferedInputStream bis = null;  
        BufferedOutputStream bos = null;  
  
        String ctxPath = request.getSession().getServletContext()  
                .getRealPath("/")  
                + FileOperateUtil.UPLOADDIR;  
        String downLoadPath = ctxPath + storeName;  
  
        long fileLength = new File(downLoadPath).length();  
  
        response.setContentType(contentType);  
        response.setHeader("Content-disposition", "attachment; filename="  
                + new String(realName.getBytes("utf-8"), "ISO8859-1"));  
        response.setHeader("Content-Length", String.valueOf(fileLength));  
  
        bis = new BufferedInputStream(new FileInputStream(downLoadPath));  
        bos = new BufferedOutputStream(response.getOutputStream());  
        byte[] buff = new byte[2048];  
        int bytesRead;  
        while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {  
            bos.write(buff, 0, bytesRead);  
        }  
        bis.close();  
        bos.close();  
    }  
}  

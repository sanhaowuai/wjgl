package com.incon.common.upload.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.incon.common.upload.service.UploadService;
import com.incon.framework.interseptor.WebConstants;
import com.incon.framework.util.FileUtil;
import com.incon.pojo.common.UserEntity;

@Controller
@RequestMapping("/upload")
public class UploadController {
	@Resource(name = "uploadService")
	private UploadService uploadService;
	@Autowired
	ServletContext context;
	private static final int BUFFER_SIZE = 2 * 1024;
	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping("/fileUpload/{savePath}")
	public Object fileUpload(Model model , HttpSession session ,@RequestBody  MultipartFile upload, HttpServletRequest request,
			@RequestParam(required=false ,defaultValue="0") Integer chunk,
			@RequestParam(required=false,defaultValue="1" ) Integer chunks ,@RequestParam  String name,@PathVariable String savePath) {
 
		UserEntity userEntity=(UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		
		savePath = "upload/"+savePath+"/"+userEntity.getYhdm();
		String realPath = context.getRealPath("/"+ savePath);// 实际路径
		 
		File saveFiledir = new File(realPath); // 在该实际路径下实例化一个文件
		if (!saveFiledir.exists()) {
			saveFiledir.mkdirs();
		} 
		 // 文件已存在（上传了同名的文件）
		 File saveFile = new File(realPath+"/"+name);
		 if (chunk == 0 && saveFile.exists()) {
		 saveFile.delete();
		 saveFile = new File(realPath+"/"+name);
		 }
		try{
		 this.copy(upload.getInputStream(), saveFile);
		}catch (IOException e) {
				e.printStackTrace();
		}
	 ;
 
		 Map map=new HashMap();
		 map.put("chunk", chunk);
		 map.put("chunks", chunks);
		 return  map;
	}
	
	
	private void copy(InputStream in, File dst) {
		OutputStream out = null;
		try {
			if (dst.exists()) {
				out = new BufferedOutputStream(new FileOutputStream(dst, true), BUFFER_SIZE);
			} else {
				out = new BufferedOutputStream(new FileOutputStream(dst), BUFFER_SIZE);
			}
			//in = new BufferedInputStream(new FileInputStream(src), BUFFER_SIZE);

			byte[] buffer = new byte[BUFFER_SIZE];
			int len = 0;
			while ((len = in.read(buffer)) > 0) {
				out.write(buffer, 0, len);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != in) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (null != out) {
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	
/*
	//plupload.js中查询附件中用到的queryFj方法
	@RequestMapping("/queryFj")
	public String queryFj(Model model){
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("yhm", "11");
//		map.put("yhmm", "22");
//		loginService.queryForObject("login.userLogin", map);
		
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("GLB", "RZ_ZPBGB"); 		//表名
//		map.put("GLZJ", "ID"); 		//关联主键
//		map.put("GLZJZ", "88888888"); 	//关联主键值
		
//		uploadService.query("upload.queryFj", map);
		uploadService.queryFj("RZ_ZPBGB", "ID", "88888888");
		
//		String listfjjson = JSON.toJSONString(uploadService.queryFj("RZ_ZPBGB", "ID", "88888888")).replaceAll("\"", "'");
//		model.addAttribute("listfjjson", listfjjson);
		return "upload/upload";
	}
	
	//plupload.js中添加附件中用到的addFile方法
	@RequestMapping("addFile")
	public String addFile(Model model,HttpSession session,String[] qfjs ,String[] hfjs,String[] del_fjs ){
		User user=(User)session.getAttribute(WebConstants.CURRENT_USER);
		uploadService.addFj("aabbccdd","RZ_ZPBGB","ID",user.getYhm(),"88888888", qfjs, hfjs,del_fjs);
		return "redirect:/upload/queryFj.do";
	}
*/		
		
	//plupload.js中下载文件中用到的downFile方法
	@RequestMapping(value = "downFile")
	public String download(String filename,String inputPath,final HttpServletRequest request, final HttpServletResponse response){
		
		java.io.BufferedInputStream bis = null;
		java.io.BufferedOutputStream bos = null;
		
		try { 
			

			String realPath = context.getRealPath(java.io.File.separator+"upload"+java.io.File.separator+inputPath);// 实际路径
			

			
			response.setContentType("text/html;charset=utf-8"); 
			request.setCharacterEncoding("UTF-8");
			String downLoadPath = realPath;//request.getSession().getServletContext().getRealPath(java.io.File.separator+"upload"+java.io.File.separator+inputPath+java.io.File.separator); 

			long fileLength = new File(downLoadPath).length(); 
			response.setContentType("application/x-msdownload;"); 
			response.setHeader("Content-disposition", "attachment; filename="+ new String(FileUtil.replace(filename).getBytes("GBK"), "ISO8859-1")); 
			response.setHeader("Content-Length", String.valueOf(fileLength)); 
	
			bis = new BufferedInputStream(new FileInputStream(downLoadPath));
			bos = new BufferedOutputStream(response.getOutputStream());
			byte[] buff = new byte[2048]; 
			int bytesRead; 
			while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) { 
				bos.write(buff, 0, bytesRead); 
			} 

		} catch (Exception e) { 
			System.out.println("Err :"+e);
		} finally { 
			try {
				if (bis != null)	bis.close();
				if (bos != null)  	bos.close(); 
			} catch (IOException e) {
				System.out.println("Err :"+e);
			} 
		} 
		return null; 
	}
}

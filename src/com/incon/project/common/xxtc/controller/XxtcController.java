package com.incon.project.common.xxtc.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.LwxxEntity;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.YxdmbEntity;
import com.incon.pojo.common.ZybEntity;
import com.incon.pojo.common.xxtc.XxtcbEntity;
import com.incon.project.common.xxtc.page.XxtcPage;
import com.incon.project.common.xxtc.service.XxtcService;
import com.incon.project.common.yxgl.page.YxglPage;
import com.incon.project.common.yxgl.service.YxglService;
import com.incon.project.common.zygl.page.ZyglPage;
import com.incon.project.common.zygl.service.ZyglService;
/**
 * 
 * 赵玥
 * 2016-11-10
 * 消息弹出表
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/xxtc")
public class XxtcController {
	private static final int BUFFER_SIZE = 2 * 1024;
	@Resource(name="xxtcService")
	private XxtcService xxtcService;
	/**
	 * 查询 
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("queryXxtc")
	public String queryXxtc(Model model,XxtcPage xxtcPage,HttpSession session){
		try {
			 List<XxtcbEntity> list=xxtcService.query(xxtcPage);
			 model.addAttribute("list", list);
			 model.addAttribute("page", xxtcPage);
		} catch (Exception e) {
			System.err.println("queryXxtc操作失败!!");
			e.printStackTrace();
		}
		return "commons/xxtc/xxtc";
	}
	 
	/**
	 * 查询  跳转页面
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("queryByIdNr")
	public String queryByIdNr(Model model,String id){
		try {
			XxtcbEntity nr=xxtcService.queryByIdNr(id);
			model.addAttribute("nr", nr);
		} catch (Exception e) {
			System.err.println("queryByIdNr操作失败!!");
			e.printStackTrace();
		}
		return "commons/xxtc/seeNr";
	}
	/**
	 * 增加或修改  
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addOrUpdXxtc")
	public String addOrUpdXxtc(XxtcbEntity entity,String zt){
		String falg="";
		try {
			if(zt.equals("1")){		//增加
				xxtcService.addXxtc(entity);
			}else{					//修改
				xxtcService.updXxtc(entity);
			}
			if(entity.getSfyd().equals("1"))
			{
				xxtcService.updNotInId(entity.getId());		
			}
			falg="1";
		} catch (Exception e) {
			falg="0";
			System.err.println("addOrUpdXxtc操作失败!!");
			e.printStackTrace();
		}
		return falg;
	}
	/**
	 * 查询一个 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryOneXxtc")
	public XxtcbEntity queryOneXxtc(String Xxtcdm){
		XxtcbEntity entity=new XxtcbEntity();
		try{
			entity=xxtcService.queryOneXxtc(Xxtcdm);
		}catch(Exception e){
			System.err.println("queryOneXxtc操作失败!!");
			e.printStackTrace();
		}
		return entity;
	}
	
	/**
 	 * 删除
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delXxtc")
    public String delXxtc(String []ids){
		String falg="";
		try {
			xxtcService.delXxtc(ids);
			falg="1";
		} catch (Exception e) {
			falg="0";
			System.err.println("delXxtc操作失败!!");
			e.printStackTrace();
		}
    	return falg;
    }
	/**
	 * 增加或修改  
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("updPtid")
	public String updPtid(String id,HttpSession session){
		UserEntity userEntity = (UserEntity) session
        .getAttribute(WebConstants.CURRENT_USER);
		String falg="";
		Map<String, String> map=new HashMap<String, String>();
		try {
			System.out.println(userEntity.getDldm()+"-------------");
				map.put("dldm", userEntity.getDldm().toString());
				map.put("id", id);
				xxtcService.updPtid(map);
			falg="1";
		} catch (Exception e) {
			falg="0";
			System.err.println("updPtid操作失败!!");
			e.printStackTrace();
		}
		return falg;
	}
	
	
	/**
	 * 查询字段是否是同一个
	 * 
	 */
	@ResponseBody
	@RequestMapping("querySfxt")
	public String querySfxt(String dldm,String id,HttpSession session){
		  UserEntity userEntity = (UserEntity) session
          .getAttribute(WebConstants.CURRENT_USER);
		String falg="";
		String ptid="";
		String xxbid="";
		try {
			ptid=xxtcService.queryOnePt(userEntity.getDldm().toString());
			xxbid=xxtcService.querySfyd();
			if(xxbid==null)
			{
			}else{
				if(!xxbid.equals(ptid))
				{
					falg=xxbid;
				}
			}
		} catch (Exception e) {
			System.err.println("querySfxt操作失败!!");
			e.printStackTrace();
		}
		return falg;
	}
	
	 @RequestMapping("/See")
     public String See(String href, HttpSession session){
//		   return "redirect:"+href;
		return "redirect:"+href;
    }
	 
	 public static String [] getFileName(String path)//当前文件名
	    {
	        File file = new File(path);
	        String [] fileName = file.list();
	        return fileName;
	    }
	 
	
	 public static void getAllFileName(String path,ArrayList<String> fileName)//当前文件以及子文件的文件名
	    {
	        File file = new File(path);
	        File [] files = file.listFiles();
	        String [] names = file.list();
	        if(names != null)
	        fileName.addAll(Arrays.asList(names));
	        for(File a:files)
	        {
	            if(a.isDirectory())
	            {
	                getAllFileName(a.getAbsolutePath(),fileName);
	            }
	        }
	    }
	 
		/**
		 * 查询  固定路径下的所有文件名字
		 * @param model
		 * @param session
		 * @return
		 */
		@RequestMapping("queryAllWj")
		public String queryAllWj(Model model,final HttpServletRequest request){
			try {
				String lj="scwjXxtc";
				String downLoadPath = request.getSession().getServletContext().getRealPath("/upload/"+lj+"/"); 
				System.out.println(downLoadPath+"---------------");
				ArrayList<String> listFileName = new ArrayList<String>(); 
		        getAllFileName(downLoadPath,listFileName);
		        model.addAttribute("listFileName", listFileName);
			} catch (Exception e) {
				System.err.println("queryByIdNr操作失败!!");
				e.printStackTrace();
			}
			return "commons/xxtc/AllWj";
		}
	 
		@ResponseBody
		@RequestMapping("saveWj")
		public String saveWj(@RequestParam("uploadWj") MultipartFile file,final HttpServletRequest request,String filename2) {
			String falg="";
			try {
				String lj="scwjXxtc";
				String realPath = request.getSession().getServletContext().getRealPath("/upload/"+lj+"/"); 
				File saveFiledir = new File(realPath); // 在该实际路径下实例化一个文件
				if (!saveFiledir.exists()) {
					saveFiledir.mkdirs();
				}
				// 文件已存在（上传了同名的文件）
				System.out.println(filename2);
				File saveFile = new File(realPath + "/" + filename2);
				if (saveFile.exists()) {
					saveFile.delete();
					saveFile = new File(realPath + "/" +  filename2);
				}
				try {
					this.copy(file.getInputStream(), saveFile);
					//设置不能运行 防止出现病毒
					saveFile.setExecutable(false);
				} catch (IOException e) {
					e.printStackTrace();
				}
				falg="1";
			} catch (Exception e) {
				falg="0";
				e.printStackTrace();
			}

			return falg;
		}
	 
		
		private void copy(InputStream in, File dst) {
			OutputStream out = null;
			try {
				if (dst.exists()) {
					out = new BufferedOutputStream(new FileOutputStream(dst, true),
							BUFFER_SIZE);
				} else {
					out = new BufferedOutputStream(new FileOutputStream(dst),
							BUFFER_SIZE);
				}
				// in = new BufferedInputStream(new FileInputStream(src),
				// BUFFER_SIZE);

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
	 
}

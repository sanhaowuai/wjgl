package com.incon.project.common.qxcdgl.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.DataFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.incon.framework.interseptor.WebConstants;
import com.incon.framework.util.FileUtil;
import com.incon.pojo.common.HelpbEntity;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.JsqxbEntity;
import com.incon.pojo.common.QxEntity;
import com.incon.pojo.common.RyjsqxbEntity;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.XxfbbEntity;
import com.incon.project.common.bmxxgl.page.BmxxPage;
import com.incon.project.common.qxcdgl.page.RyjsqxPage;
import com.incon.project.common.qxcdgl.service.QxcdglService;
import com.incon.project.common.ymqxgl.service.YmqxglService;

/**
 * 
 * @类名：  com.incon.project.common.qxcdgl.controller.QxcdglController
 * @创建人： 樊旭
 * @日期： 2014-3-11
 * @修改人：
 * @日期：
 * @描述： 权限菜单管理
 * @版本号：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/qxcdgl")
public class QxcdglController {
	@Resource(name="qxcdglService")
	private QxcdglService qxcdglService;
	
	@Resource(name="ymqxglService")
	private YmqxglService ymqxglService;
	
	@Autowired
	ServletContext context;
	
	private static final Logger logger = Logger.getLogger(QxcdglController.class);
	
	/**
	 * 分页查询所有菜单权限
	 * @param model
	 * @return
	 */
	@RequestMapping("queryAllQxcdgl")
	public String queryAllQxcdgl(Model model,String cxjsdm){
		System.out.println("hello");
		try {
			List<QxEntity> qxcd_list = qxcdglService.queryAll(cxjsdm);
			
			List<JsbEntity> jslist = qxcdglService.queryJs("");
			
			model.addAttribute("cxjsdm", cxjsdm);
			model.addAttribute("jslist",jslist);
			model.addAttribute("qxcd_list",qxcd_list);
			model.addAttribute("anglb_list",ymqxglService.queryAngnbListOnQy());
			
			model.addAttribute("gnList",qxcdglService.queryGnList());
			model.addAttribute("hngnList",qxcdglService.queryHngnList());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryAllQxcdgl操作失败!!");
		}
		System.out.println("========================bye");
		return "commons/qxgl/qxgl";
	}
	
	/**
	 * 查询所有菜单名称
	 * @return
	 */
	@RequestMapping("queryCdmc")
	@ResponseBody
	public List<QxEntity> queryCdmc(){
		List<QxEntity> list = new ArrayList<QxEntity>();
		try {
			list = qxcdglService.queryQxcdgl();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryCdmc操作失败!!");
		}
		return list;
	}
	
	/**
	 * 添加权限菜单管理
	 * @param qxcdglEntity
	 * @return
	 */
	@RequestMapping("addQxcd")
	@ResponseBody
	public QxEntity addQxcd(QxEntity qxcdglEntity){
		qxcdglEntity.setSfzxj("1");
		QxEntity qxEntity = new QxEntity();
		try {
			HashMap map = new HashMap();
			map.put("fwlj", qxcdglEntity.getFwlj());
//			boolean pd = qxcdglService.pdAddFwlj(map)==0?true:false;
//			if(pd){
//				qxEntity = qxcdglService.addQxcd(qxcdglEntity);
//			}else {
//				return null;
//			}
			qxEntity = qxcdglService.addQxcd(qxcdglEntity);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("addQxcd操作失败!!");
		}
		return qxEntity;
	}
	
	/**
	 * 查询所有角色
	 * @return
	 */
	@RequestMapping("queryJs")
	@ResponseBody
	public List<JsbEntity> queryJs(String qxdm){
		List<JsbEntity> list = new ArrayList<JsbEntity>();
		try {
			list = qxcdglService.queryJs(qxdm);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryJs操作失败!!");
		}
		return list;
	}
	
	/**
	 * 为角色分配权限菜单
	 * @param jsqxbEntity
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addJsqx")
	public boolean addJsqx(JsqxbEntity jsqxbEntity){
		boolean reg;
		String[] jsdm = jsqxbEntity.getJsdm().split(",");
		List<JsqxbEntity> list = new ArrayList<JsqxbEntity>();
		for (int i = 0; i < jsdm.length; i++) {
			JsqxbEntity jsqxbEntitys = new JsqxbEntity();
			jsqxbEntitys.setSfmrkf(jsqxbEntity.getSfmrkf());
			jsqxbEntitys.setQxdm(jsqxbEntity.getQxdm());
			jsqxbEntitys.setJsdm(jsdm[i]);
			list.add(jsqxbEntitys);
		}
		try {
			//根据qxdm删除角色权限
			Map<String, String> czmap = new HashMap<String, String>(); 
			czmap.put("qxdm", jsqxbEntity.getQxdm());
			czmap.put("jsdm", jsqxbEntity.getJsdm());
			qxcdglService.delJsqxByQxdm(czmap);
			if(!jsqxbEntity.getFqxdm().equals("-1")){
				qxcdglService.queryFcd(jsqxbEntity);
			}
			if(list!=null && list.size()>0){
				qxcdglService.addJsqx(list);
			}
			reg = true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("addJsqx操作失败!!");
			reg = false;
		}
		return reg;
	}
	
	/**
	 * 根据角色查询人员角色权限表
	 * @param jsdm
	 * @param model
	 * @return
	 */
	@RequestMapping("queryRyfp")
	public String queryRyfp(String jsdmss,String qxdm,String fqxdm,Model model,RyjsqxPage ryjsqxPage){
		try {
			model.addAttribute("jsdmss",jsdmss);
			model.addAttribute("qxdm",qxdm);
			model.addAttribute("fqxdm", fqxdm);
			jsdmss = jsdmss.substring(0,jsdmss.length()-1);
			ryjsqxPage.setJsdms(jsdmss);
			if(ryjsqxPage.getJsdm() == null || ryjsqxPage.getJsdm().equals("-1")){
				ryjsqxPage.setJsdm(null);
			}
			List<RyjsqxbEntity> list_ryjsqx = qxcdglService.query(ryjsqxPage);
			List list_js = qxcdglService.queryJs(qxdm);
			model.addAttribute("list_ryjsqx",list_ryjsqx);
			model.addAttribute("list_js",list_js);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryRyfp操作失败!!");
		}
		return "commons/qxgl/ryfpqx";
	}
	
	/**
	 * 为人员角色权限表添加数据
	 * @param ryjsqxbEntity
	 * @return
	 */
	@RequestMapping("addRyjsqxb")
	@ResponseBody
	public boolean addRyjsqxb(RyjsqxbEntity ryjsqxbEntity,HttpSession session){
		boolean reg;
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		try {
			String[] jsdm = ryjsqxbEntity.getJsdm().split(",");
			String[] yhdm = ryjsqxbEntity.getYhdm().split(",");
			List<RyjsqxbEntity> list = new ArrayList<RyjsqxbEntity>();
			for (int i = 0; i < jsdm.length; i++) {
				RyjsqxbEntity ryjsqxbEntitys = new RyjsqxbEntity();
				ryjsqxbEntitys.setQxdm(ryjsqxbEntity.getQxdm());
				ryjsqxbEntitys.setYhdm(yhdm[i]);
				ryjsqxbEntitys.setJsdm(jsdm[i]);
				ryjsqxbEntitys.setCjr(userEntity.getYhdm());
				list.add(ryjsqxbEntitys);
			}
			if(!ryjsqxbEntity.getFqxdm().equals("-1")){
				qxcdglService.queryFryjs(ryjsqxbEntity);
			}
			qxcdglService.addRyjsqxb(list);
			reg = true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("addRyjsqxb操作失败!!");
			reg = false;
		}
		return reg;
	}
	
	/**
	 * 根据权限代码查询权限
	 * @param zhi
	 * @return
	 */
	@RequestMapping("queryByQxdm")
	@ResponseBody
	public QxEntity queryByQxdm(String zhi){
		QxEntity qxEntity = new QxEntity();
		try {
			qxEntity = qxcdglService.queryByQxdm(zhi);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryByQxdm操作失败!!");
		}
		return qxEntity;
	}
	
	/**
	 * 根据权限代码修改权限
	 * @param qxEntity
	 * @return
	 */
	@ResponseBody
	@RequestMapping("updQxcd")
	public String updQxcd(QxEntity qxEntity){
		try {
			HashMap map = new HashMap();
			map.put("fwlj", qxEntity.getFwlj());
			map.put("qxdm", qxEntity.getQxdm());
//			boolean pd = qxcdglService.pdUpdFwlj(map)==0?true:false;
//			if(pd){
//				qxcdglService.updQxcd(qxEntity);
//			}else {
//				return "访问路径已存在";
//			}
			qxcdglService.updQxcd(qxEntity);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updQxcd操作失败!!");
		}
		return null;
	}
	
	/**
	 * 删除权限菜单
	 * @return
	 */
	@ResponseBody
	@RequestMapping("delQx")
	public String delQx(String qxdm){
		try {
			qxcdglService.delQx(qxdm);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("delQx操作失败!!");
		}
		return null;
	}
	
	/**
	 * 改变现实顺序
	 * @param qxEntity
	 * @return
	 */
	@RequestMapping("changeXssx")
	public String changeXssx(QxEntity qxEntity){
		try {
			qxcdglService.updXssx(qxEntity);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("changeXssx操作失败!!");
		}
		return "redirect:/qxcdgl/queryAllQxcdgl";
	}
	
	
	/**
	 * 导入Help数据 
	 * @param helpDataFile
	 * @param request
	 * @param response
	 * @param jdm
	 */
	
	@RequestMapping("impHelpData")
	public void impHelpData(@RequestParam("helpDataFile")MultipartFile helpDataFile,HttpServletRequest request,HttpServletResponse response,String jdm){
    	PrintWriter out = null;
    	String resultStr = "success";
        try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			out = response.getWriter();			
            ObjectInputStream ois = new ObjectInputStream(helpDataFile.getInputStream());
            List test1 = (List)ois.readObject();
            //清空表数据
            qxcdglService.delHelp();
            for(Object obj : test1){
           	 HelpbEntity t = (HelpbEntity)obj;
           	 //添加表数据
           	 	qxcdglService.addHelp(t);                
            }
        }catch (Exception ex) {
        	resultStr = "error";
            ex.printStackTrace();
        }finally{
			 out.print(resultStr);
		}
	}

	/**
	 * 导出数据
	 * @throws Exception 
	 */
	@RequestMapping("expHelpData")
	public void excelDcsj(HttpServletResponse response,HttpServletRequest request) throws Exception{

		java.io.ObjectOutputStream bos = null;
		try {
			
			//从数据库中查询数据
			ArrayList<HelpbEntity> test = qxcdglService.excelDcsj();	
			String filename = "XT_HELP.help";  //设置文件名
			//输出文件  
            response.reset();  
            response.setHeader("Content-Disposition","attachment;filename=" +  new String(filename.getBytes(),"iso-8859-1"));  
            response.setContentType("application/octet-stream");  
			bos = new ObjectOutputStream(response.getOutputStream());
			bos.writeObject(test);	
		} catch (IOException e) {
			logger.error("执行：excelDcsj() 错误", e);
			throw new Exception("执行：excelDcsj() 错误",e);
		}finally{
			if(bos != null){
				bos.flush();
				bos.close();
			}
		}
	}
	
	
	//-----------------------------下载压缩文件夹begin-----------------
	@RequestMapping(value = "/dowloadFile",method = RequestMethod.POST)//设置访问路径
	public void dowloadFile(HttpServletRequest request, HttpServletResponse response,HttpSession session) {
		Random random=new Random();//随机数
		random.nextInt(100);//随机数   100以内
		String dowloadFilePath="";
		FileInputStream fis = null;
		OutputStream sOut = null;
		int bytesum = 0;
		int byteread = 0; 
		int ids=random.nextInt(100);
		//拷贝文件     begin
		String realPath="";
		//生成的随机文件夹
		String newPath=request.getSession().getServletContext().getRealPath(File.separator+"upload"+File.separator+"yswj"+ids);
		 (new File(newPath)).mkdirs();       //如果文件夹不存在 则建立新文件夹 
		  File temp=null;		  
		//查询路径  begin
		try {			
			//源图片路径地址
			String ytplj=request.getSession().getServletContext().getRealPath(File.separator+"resources"+File.separator+"ewebeditor"+File.separator+"uploadfile");
			//生成help文件
			ArrayList<HelpbEntity> test = qxcdglService.excelDcsj();	
			//加进文件夹，help文件
			ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(newPath+"/XT_HELP.help"));
		    oos.writeObject(test);
		    oos.flush();
		    oos.close();
		    //关闭oos流
		    //复制文件夹下的图片		    							   
		    FileUtil.copyFileWithDirector(ytplj,newPath);
			//拷贝文件     end
			//导出 压缩包    			 begin
			File file = new File(newPath);
			//查看文件夹是否存在↓
		  if(file.exists()){
			  //判断文件是否正常↓
		    	if(file.isFile()){
			    	fis = new FileInputStream(file); //读入文件
			    	response.setContentType("application/x-msdownload");
			    	response.setHeader("Content-disposition","attachment;filename=\""+new String(file.getName().getBytes("GBK"),"iso8859-1")+"\"");
			    	sOut = response.getOutputStream();
			    	byte[] b = new byte[4096];
			    	int len = 0;
			    	while ((len = fis.read(b))!= -1){
			    		sOut.write(b, 0, len);
			    	}
			    	fis.close();
			    	sOut.close();	
			    	//判断文件是否空目录	    		
		    	}else if(file.isDirectory()){
		    		//临时压缩路径
		    		String savePath = "upload"+File.separator+"yswj"+File.separator+UUID.randomUUID()+File.separator;
					//创建压缩路径
					 realPath = context.getRealPath(File.separator + savePath);// 临时压缩文件路径
					if(!new File(realPath).exists()){
						new File(realPath).mkdirs();
					}
					//在临时压缩里 生成压缩包
		    		FileUtil.zip(newPath,realPath+File.separator+""+"帮助数据.zip");
		    		//获取到压缩包的路径
		    		File zipFile = new File(realPath+File.separator+"帮助数据"+".zip");
		    		//读入文件
			    	fis = new FileInputStream(zipFile); 
			    	response.setContentType("application/x-msdownload");
			    	response.setHeader("Content-disposition","attachment;filename=\""+new String(zipFile.getName().getBytes("GBK"),"iso8859-1")+"\"");
			    	sOut = response.getOutputStream();
			    	byte[] b = new byte[4096];
			    	int len = 0;
			    	while ((len = fis.read(b))!= -1){
			    		sOut.write(b, 0, len);
			    	}	  
			    	fis.close();
			    	sOut.close();
			    	//删除临时文件夹
			    	FileUtil.delFolder(newPath);
			    	FileUtil.delFolder(realPath);
		    	}
		    }
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("dowloadFile 拷贝报错了！", e);			
		}
	}
	//-----------------------------下载压缩文件夹end-----------------
	//-----------------------------导入压缩文件夹begin-----------------
	/**
	 * 导入压缩文件夹
	 * @param helpDataFile
	 * @param request
	 * @param response
	 * @param jdm
	 * @throws Exception 
	 */	
	@RequestMapping("Dryswjj")
	public String Dryswjj(HttpSession session,Model model, HttpServletRequest request, String[] qfjs, String[] hfjs, String[] del_fjs) throws Exception{
    	PrintWriter out = null;
    	UserEntity userEntity=(UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
    	String resultStr = "success";
    	ObjectInputStream ois =null;
        try {        	
        	String ylj="upload"+File.separator+"helpupload"+File.separator+userEntity.getYhdm();
    		String realPath = context.getRealPath(File.separator)+ylj+File.separator;// 实际路径
    		realPath+=hfjs[0];
    		System.out.println(realPath);
    		String xin = context.getRealPath(File.separator)+"resources"+File.separator+"ewebeditor"+File.separator+"uploadfile";    		
    		FileUtil.delFolder(xin);
    		FileUtil.unZip(realPath,xin);   
    		String helplj=xin+File.separator+"XT_HELP.help";    		
    		ois = new ObjectInputStream(new FileInputStream(helplj));
             List test1 = (List)ois.readObject();
             //清空表数据
             qxcdglService.delHelp();
             for(Object obj : test1){
            	 HelpbEntity t = (HelpbEntity)obj;
            	 //添加表数据
            	 qxcdglService.addHelp(t); 
             } 	
             ois.close();
        }catch (Exception ex) {
        	resultStr = "error";
            ex.printStackTrace();
            throw new Exception("导入失败！"+ex);
        }
        return "forward:/qxcdgl/queryAllQxcdgl";
	}
	//-----------------------------导入压缩文件夹end-----------------
}

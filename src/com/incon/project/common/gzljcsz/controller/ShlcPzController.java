package com.incon.project.common.gzljcsz.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.xhtmlrenderer.simple.extend.URLUTF8Encoder;

import com.incon.common.treetable.Service.TreeTableService;
import com.incon.common.upload.service.UploadService;
import com.incon.common.xxts.service.HttpGetRequest;
import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.gzljcsz.YwDmEntity;
import com.incon.pojo.common.gzljcsz.YwDmxlhEntity;
import com.incon.pojo.common.gzljcsz.YwlcBlEnntity;
import com.incon.pojo.common.gzljcsz.YwlcBlxlhEnntity;
import com.incon.pojo.common.gzljcsz.YwlcYmEntity;
import com.incon.pojo.common.gzljcsz.YwlcYmxlhEntity;
import com.incon.project.common.gzljcsz.page.FuzhiPage;
import com.incon.project.common.gzljcsz.page.FuzhilcPage;
import com.incon.project.common.gzljcsz.page.GwPage;
import com.incon.project.common.gzljcsz.page.JueSePage;
import com.incon.project.common.gzljcsz.page.YhPage;
import com.incon.project.common.gzljcsz.page.YwlcBlPage;
import com.incon.project.common.gzljcsz.page.YwlcYmPage;
import com.incon.project.common.gzljcsz.page.YwlcdmbPage;
import com.incon.project.common.gzljcsz.page.YxPage;
import com.incon.project.common.gzljcsz.service.GzljcszService;
import com.incon.project.common.gzljcsz.service.GzljcszServiceImpl;




@SuppressWarnings("all")
@Controller
@RequestMapping("/ywlcsz")
public class ShlcPzController {
	private static final Logger logger = Logger.getLogger(ShlcPzController.class);
	@Resource(name = "uploadService")
	private UploadService uploadService;
	
	@Resource(name = "treeTableService")
	private TreeTableService treeTableService;
	
	
	@Resource(name="gzljcszService")
	private GzljcszService gzljcszService;
	/**
	 * 查询业务分页
	 * @param model
	 * @param shywPage
	 * @return
	 */
	@RequestMapping("queryYwList")
	 public String queryYwList(Model model,YwlcdmbPage ywlcdmbPage,String error,String fhdm){
		if(fhdm!=null){
			ywlcdmbPage.setDmmc(fhdm);
			
		}
		List<Map> ywlcmcList=gzljcszService.query("gzljcsz.queryywlc");
		model.addAttribute("ywlcmcList", ywlcmcList);
		List<Map> lbList=gzljcszService.query("gzljcsz.querylb");
		model.addAttribute("lbList", lbList);
		List<Map> YwList= gzljcszService.query(ywlcdmbPage);
		model.addAttribute("YwList", YwList);
		
		model.addAttribute("ywlcdmbPage", ywlcdmbPage);
		
		model.addAttribute("error", error);
		return "commons/gzljcsz/Shlcpz";
		
}
	@ResponseBody
	@RequestMapping("queryOneYw")
	public YwDmEntity queryOneYw(YwlcdmbPage ywlcdmbPage,String ywlcbbh,String ywlcdm,String xtdm){
		
		ywlcdmbPage.setYwlcdm(ywlcdm);
		ywlcdmbPage.setYwlcbbh(ywlcbbh);
		ywlcdmbPage.setXtdm(xtdm);
		YwDmEntity ywDmEntityONE = (YwDmEntity) gzljcszService.queryForObject("gzljcsz.queryOneYw",ywlcdmbPage);
		

		return ywDmEntityONE;
	}
	
	@ResponseBody
	@RequestMapping("addorupdate")
	public String addorupdate(YwlcdmbPage ywlcdmbPage){
	
		
		if(ywlcdmbPage.getZt().equals("1")){
			
			try {
				gzljcszService.insert("gzljcsz.addywlc", ywlcdmbPage);
			return "1";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "2";
			}
			
		}else{
			
			try {
				gzljcszService.update("gzljcsz.updateywlc", ywlcdmbPage);
				return "3";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "4";
			}			
		}
	}
	
	@RequestMapping("addYwlc")
	public String addYwlc(HttpServletRequest request,YwlcYmPage ywlcYmPage,Model model,String bzmc,String fqxmc,String qxmc,String ywlcdm,String ywlcmc,String ywlcbbh,String ywlcdmadd){
	
		try{
			 Map<String,String> a = new HashMap<String,String>();
			 a.put("FQXMC", fqxmc);
			 a.put("QXMC", qxmc);
			 model.addAttribute("fhdm",ywlcYmPage.getFhdm());
			 ywlcYmPage.setYwlcdm(ywlcdm);
			 ywlcYmPage.setYwlcbbh(ywlcbbh);
			 model.addAttribute("qxb", a);	
			 List<Map> list = gzljcszService.query(ywlcYmPage);
//			 查看当前流程节点
			 if(ywlcdmadd == null || ywlcdmadd.trim().length() == 0){
			 List<Map> jdlist=gzljcszService.query("gzljcsz.queryjdlist",ywlcYmPage);
			 model.addAttribute("jdlist", jdlist);
			 }else{
				 ywlcYmPage.setYwlcdm(ywlcdmadd);
			 List<Map> jdlist=gzljcszService.query("gzljcsz.queryjdlist",ywlcYmPage); 
			 model.addAttribute("jdlist", jdlist);
			 }
			 
			 
			 
		
//			 System.out.println("zheshishenm1"+ywlcYmPage.getYwlcdm());
//			System.out.println("zheshishenm1"+ywlcdm);
			 model.addAttribute("list", list);
		
			 model.addAttribute("ywlcmc", ywlcYmPage.getYwlcmc());
	       	 model.addAttribute("ywlcdm", ywlcYmPage.getYwlcdm());		
		     model.addAttribute("xtdm", ywlcYmPage.getXtdm());
		     model.addAttribute("ywlcbbh", ywlcYmPage.getYwlcbbh());
			 model.addAttribute("ywlcYmPage", ywlcYmPage);
//			 model.addAttribute("ywdm", ywdm);
//			 model.addAttribute("bzmc", bzmc);
		 }catch(Exception e){
			 e.printStackTrace();
		 }
		
		return "commons/gzljcsz/ShlcYm";
		
	}
	
	@RequestMapping("queryAllJs")
	public String queryAllJs(Model model,JueSePage jueSePage){
		try {
			List<Map<String,String>> list=gzljcszService.query(jueSePage);//分页查询角色
			model.addAttribute("list", list);
			model.addAttribute("jueSePage", jueSePage);
		} catch (Exception e) {
			System.out.println("sql  cuo!~");
			e.printStackTrace();
		}
	
		return "commons/gzljcsz/jslist";
	}
	

	@RequestMapping("queryAllyx")
	public String queryAllBm(Model model,YxPage yxPage,String yxmc){
		
		try {
//			System.out.println(yxPage.getYxmc()+"wocaole1");
//			System.out.println(yxmc);
			List<Map<String,String>> list=gzljcszService.query(yxPage);
			model.addAttribute("list", list);
			model.addAttribute("yxPage", yxPage);
		} catch (Exception e) {
			System.out.println("sql  cuo!~");
			e.printStackTrace();
		}
		return "commons/gzljcsz/yxlist";
	}
	
	@RequestMapping("queryAllyh")
	public String queryAllyh(Model model,YhPage yhPage){
	
			List<Map> list=gzljcszService.query(yhPage);//分页查询角色
			model.addAttribute("list", list);
		
			model.addAttribute("yhPage", yhPage);
	
		return "commons/gzljcsz/yhlist";
	}
	@RequestMapping("queryAllgw")
	public String queryAllyh(Model model,GwPage gwPage){
	
			List<Map> list=gzljcszService.query(gwPage);//分页查询角色
			model.addAttribute("list", list);

			model.addAttribute("gwPage", gwPage);
	
		return "commons/gzljcsz/gwlist";
	}
	
	
	
	@ResponseBody
	@RequestMapping("queryOneYwlcjd")
	public YwlcYmEntity queryOneYwlcjd(YwlcYmPage ywlcymPage,String ywlcdm,String xtdm,String ywlcbbh,String jddm){
		ywlcymPage.setJddm(jddm);
		ywlcymPage.setYwlcdm(ywlcdm);
		ywlcymPage.setYwlcbbh(ywlcbbh);
		ywlcymPage.setXtdm(xtdm);
		YwlcYmEntity ywlcYmEntity=(YwlcYmEntity) gzljcszService.queryForObject("gzljcsz.queryOneYwlcjd", ywlcymPage);
	 
		return ywlcYmEntity;
	}
	
	@ResponseBody
	@RequestMapping("addorupdateYwlc")
	public String addorupdateYwlc(YwlcYmPage ywlcYmPage){
		
		if(ywlcYmPage.getZt().equals("1")){
			
			try {
				gzljcszService.insert("gzljcsz.addywlcjd", ywlcYmPage);
			return "0";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "1";
			}
			
		}else{
			
			try {
			
				gzljcszService.update("gzljcsz.updateywlcjd", ywlcYmPage);
				return "2";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "3";
			}			
		}
	}
	@ResponseBody
	@RequestMapping("delYwlc")
	public String delYwlc(YwlcYmPage ywlcYmPage,String ywlcdm,String xtdm,String ywlcbbh,String jddm){
		
		try {
			gzljcszService.delete("gzljcsz.delYwlc", ywlcYmPage);
			return "1";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return  "2";
		}
		
		
	}
	
	@ResponseBody
	@RequestMapping("delYw")
	public String delYw(YwlcdmbPage ywlcdmbPage,String[] ids){
		
		for(int i=0;i<ids.length;i++){
			String ids1[]=ids[i].split("@");
		
			ywlcdmbPage.setYwlcdm(ids1[0]);
			ywlcdmbPage.setXtdm(ids1[1]);
			ywlcdmbPage.setYwlcbbh(ids1[2]);
		
//			判断该业务是否已经存在
		int k=0;	
		k=gzljcszService.querypdslcz(ywlcdmbPage);
		if(k>0){
			return "0";
		}
			
		gzljcszService.delete("gzljcsz.deleteYw", ywlcdmbPage);
		gzljcszService.delete("gzljcsz.deleteYwlcjd", ywlcdmbPage);
		gzljcszService.delete("gzljcsz.deleteYwlcbl", ywlcdmbPage);
		}
		return "1";
	}
	
	
	
	@RequestMapping("addYwlcbl")
	public String addYwlcbl(YwlcBlPage ywlcBlPage,Model model,String fqxmc,String qxmc,String ywlcdm,String ywlcbbh,String fhdm){
		

		try{
			 Map<String,String> a = new HashMap<String,String>();
			 a.put("FQXMC", fqxmc);
			 a.put("QXMC", qxmc);
			
			 model.addAttribute("qxb", a);	
			 ywlcBlPage.setYwlcbbh(ywlcbbh);
			 List<Map> list = gzljcszService.query(ywlcBlPage);
			 model.addAttribute("fhdm",ywlcBlPage.getFhdm());
			 model.addAttribute("ywlcdmadd", ywlcdm);
		     model.addAttribute("xtdm", ywlcBlPage.getXtdm());
		     model.addAttribute("ywlcbbh", ywlcBlPage.getYwlcbbh());	
//		     System.out.println("hello"+ ywlcBlPage.getYwlcbbh());
			 model.addAttribute("ywlcdm", ywlcBlPage.getYwlcdm());
			 model.addAttribute("ywlcmc", ywlcBlPage.getYwlcmc());
//			 System.out.println("为啥没有"+ywlcBlPage.getYwlcmc());
//			  System.out.println("hello"+ ywlcBlPage.getYwlcdm());
			 model.addAttribute("list", list);
	
			 model.addAttribute("ywlcBlPage", ywlcBlPage);
		 }catch(Exception e){
			 e.printStackTrace();
		 }
		
		return "commons/gzljcsz/ShlcBl";
		
	}
	
	
	@ResponseBody
	@RequestMapping("queryOneYwlcbl")
	public YwlcBlEnntity queryOneYwlcbl(YwlcBlPage ywlcBlPage,String ywlcdm,String xtdm,String ywlcbbh,String bldm){
		ywlcBlPage.setBldm(bldm);
		ywlcBlPage.setYwlcdm(ywlcdm);
		ywlcBlPage.setYwlcbbh(ywlcbbh);
		ywlcBlPage.setXtdm(xtdm);
		YwlcBlEnntity ywlcBlEntity=(YwlcBlEnntity) gzljcszService.queryForObject("gzljcsz.queryOneYwlcBl", ywlcBlPage);
		return ywlcBlEntity;
	}
	
	
	@ResponseBody
	@RequestMapping("addorupdateYwBl")
	public String addorupdateYwBl(YwlcBlPage ywlcBlPage){
	
		if(ywlcBlPage.getZt().equals("1")){
			
			try {
			
				gzljcszService.insert("gzljcsz.addywlcbl", ywlcBlPage);
			return "0";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "1";
			}
			
		}else{
			
			try {
				gzljcszService.update("gzljcsz.updateywlcbl", ywlcBlPage);
				return "2";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "3";
			}			
		}
	}
	
	@ResponseBody
	@RequestMapping("delYwlcbl")
	public String delYwbl(YwlcBlPage ywlcBlPage,String bldm,String ywlcbbh,String xtdm,String ywlcdm){
		
		ywlcBlPage.setBldm(bldm);
		ywlcBlPage.setXtdm(xtdm);
		ywlcBlPage.setYwlcbbh(ywlcbbh);
		ywlcBlPage.setYwlcdm(ywlcdm);
		
			
		gzljcszService.delete("gzljcsz.deleteYwbl", ywlcBlPage);
		
		return "1";
	}
	
	
	
	@ResponseBody
	@RequestMapping("pdsffg")
	public Integer pdsffg(FuzhiPage FuzhiPage){
		
		int  k=gzljcszService.querysffgbbh(FuzhiPage);
//		System.out.println("这是几位数"+k);
		if(k>0){
			
			return 3;
			
		}
		
		return 1;
		
	}
	
	
	
	
	@ResponseBody
	@RequestMapping("fuzhi")
	public Integer fuzhi(FuzhiPage FuzhiPage){
		 try {
			 
			gzljcszService.copyYwlcbbh(FuzhiPage);
			return 1;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 2;
		}
		
		
	}
	
	

	@ResponseBody
	@RequestMapping("fuzhiYwlc")
	public Integer fuzhiYwlc(FuzhilcPage fuzhilcPage){
//		System.out.println("wocaoniodaye"+fuzhilcPage.getNewr_ywlcbbh());
	
		 try {
//			 gzljcszService.delete("gzljcsz.deleteoldywlc", fuzhilcPage);
			gzljcszService.copyYwlc(fuzhilcPage);
			return 1;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 2;
		}
		
		
	}
	
	
	
	@ResponseBody
	@RequestMapping("querypzsfcz")
	public Integer querypzsfcz(String xtdm,String ywlcdm,String ywlcbbh,YwlcBlPage  ywlcbl){
		
		int i=0;
		ywlcbl.setXtdm(xtdm);
		ywlcbl.setYwlcdm(ywlcdm);
		ywlcbl.setYwlcbbh(ywlcbbh);		
		i=gzljcszService.querypzsfcz(ywlcbl);		
		return  i;
	}
	
	
	@ResponseBody
	@RequestMapping("changeywlcdm")
	public List<Map> changeywlcdm(String ywlcdm,String oldywlcbbh,YwlcdmbPage ywlcdmbPage,String dmxt){
//	System.out.println("gansha1a1a1a1a"+oldywlcbbh);
	ywlcdmbPage.setYwlcdm(ywlcdm);
	ywlcdmbPage.setYwlcbbh(oldywlcbbh);
	ywlcdmbPage.setDmxt(dmxt);
	System.out.println("dmxt"+dmxt);
		List<Map> ywlcmclist=  gzljcszService.query("gzljcsz.changeywlcdm", ywlcdmbPage);
//		System.out.println(ywlcmclist);
		return ywlcmclist;
	}
	
	@ResponseBody
	@RequestMapping("queryjdbh")
	public List<Map> changeywlcBBH(String ywlcdm){
	
		List<Map> jdmclist=  gzljcszService.query("gzljcsz.queryjdbh", ywlcdm);
		return jdmclist;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//导出二进制工作流
	@RequestMapping("expGzldc")
	 public void expGzldc(Model model,String [] ids,HttpServletResponse response){
		try{
			List<YwDmxlhEntity> list=new ArrayList<YwDmxlhEntity>();
			if(ids!=null && ids.length>0){
				for(String id:ids){
					YwDmxlhEntity ywDmxlhEntity=gzljcszService.queryDmxlh(id.split("@")[0]+"_"+id.split("@")[2]);
					List<YwlcYmxlhEntity> listlc=gzljcszService.queryLcxlh(ywDmxlhEntity);
					List<YwlcBlxlhEnntity> listbl=gzljcszService.queryBlxlh(ywDmxlhEntity);
					ywDmxlhEntity.setListlc(listlc);
					ywDmxlhEntity.setListbl(listbl);
					list.add(ywDmxlhEntity);
				}
			}
			
			String filename = "gzlsz.inco";
			ServletOutputStream Out = response.getOutputStream();
			 response.setCharacterEncoding("utf-8");
	            response.setContentType("multipart/form-data");
	            response.setHeader("Content-Disposition", "attachment;fileName="+filename);

		  
			
		        ObjectOutputStream oos = new ObjectOutputStream(Out);
		        oos.writeObject(list);
		        oos.close();
		        Out.close();
			
			/*File File = new File("D:\\ut");
	        OutputStream os = new FileOutputStream(File);
	        ObjectOutputStream oos = new ObjectOutputStream(os);
	        oos.writeObject(list);
	        oos.close();
	        os.close();*/
			
		}catch(Exception e){
			e.printStackTrace();
		}
		 
		
}
	
	//导入二进制工作流
	
	@RequestMapping(value = "/impGzldr", method = RequestMethod.POST)//设置访问路径
	 public String impGzldr(Model model,String [] ids,HttpServletResponse response,@RequestParam("file") MultipartFile file){
		try{
			 
	        InputStream is = file.getInputStream();
	        ObjectInputStream ois = new ObjectInputStream(is);
	        List<YwDmxlhEntity> list = (List<YwDmxlhEntity>) ois.readObject();
	        List<YwDmxlhEntity> listnew =new ArrayList<YwDmxlhEntity>();
	        ois.close();
	        is.close();
	        for (YwDmxlhEntity s : list) {
	        	/*if(!gzljcszService.queryDmxlhSfcz(s).equals("0")){
	        		return "forward:/ywlcsz/queryYwList?error=业务流程已存在，无法导入！";
	        		
	        	}*/
	        	if(gzljcszService.queryDmxlhSfcz(s).equals("0")){
	        		listnew.add(s);
	        		
	        	}
	        	
	        }
	        gzljcszService.addDmxlh(listnew);
	        
	        
	        return "redirect:/ywlcsz/queryYwList";
			
		}catch(Exception e){
			e.printStackTrace();
			return "forward:/ywlcsz/queryYwList?error=系统错误！";
		}
		 
		
}
	
	
	
	
	
	
	
	
}

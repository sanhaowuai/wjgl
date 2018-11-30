package com.incon.project.qkfkxt.qkfkycl.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.incon.common.upload.service.UploadService;
import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.qkfkxt.FkclEntity;
import com.incon.pojo.common.qkfkxt.QkfkxtFksqbEntity;
import com.incon.pojo.common.xxfbxx.XxfbEntity;
import com.incon.project.common.xxfbxx.page.XxfbxxglPage;

import com.incon.project.qkfkxt.fkcl.page.FkclPage;
import com.incon.project.qkfkxt.fkcl.service.FkclService;
import com.incon.project.qkfkxt.qkfkxtcx.service.QkfkxtcxService;

import com.incon.project.qkfkxt.fkcl.page.FkclPage;
import com.incon.project.qkfkxt.fkcl.service.FkclService;

import com.incon.project.qkfkxt.qkfkycl.page.QkfkyclPage;
import com.incon.project.qkfkxt.qkfkycl.service.QkfkyclService;

@SuppressWarnings("all")
@Controller
@RequestMapping("/qkfkycl")
public class QkfkyclController {
	@Resource(name="qkfkyclService")
	private QkfkyclService qkfkyclService;
	@Resource(name="uploadService")
	private UploadService uploadService;
	 @Resource(name = "fkclService")
	    private FkclService fkclService;
		
		@Resource(name="qkfkxtcxService")
		private QkfkxtcxService qkfkxtcxService;
	
	
	@RequestMapping("/queryqkfkByone")
	public String queryqkfkByone( String sqdh,Model model,String xz,HttpSession session,QkfkyclPage qkfkyclPage){
		QkfkxtFksqbEntity  qkfkxtFksqbEntity = qkfkyclService.queryqkfkByone(sqdh);
		UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
		model.addAttribute("dlr",  userEntity.getXm());
		model.addAttribute("yhdm", userEntity.getYhdm());
		model.addAttribute("qkfkxtFksqbEntity", qkfkxtFksqbEntity);
	    model.addAttribute("xz", xz);
		//查询项目列表
		List<Map<String, String>> xmList = new ArrayList <Map<String, String>>();
		xmList=qkfkyclService.queryxmmc();
		//查询紧急程度
		List<Map<String, String>> jjcdList = new ArrayList <Map<String, String>>();
		jjcdList=qkfkyclService.queryjjcd();
		//查询变更类型
		List<Map<String, String>> bglxList = new ArrayList <Map<String, String>>();
		bglxList=qkfkyclService.queryqkfklx();
		//查询教师列表
		List<Map<String, String>> jsList = new ArrayList <Map<String, String>>();
		jsList=qkfkyclService.queryjs();
		String listfjjson = JSON.toJSONString(uploadService.queryFj("QKFKXT_FKSQB", "SQDH", sqdh)).replaceAll("\"", "'");
		model.addAttribute("listfjjson", listfjjson);
		System.out.println(listfjjson);
		model.addAttribute("bglxList", bglxList);
		model.addAttribute("jsList", jsList);
		model.addAttribute("jjcdList", jjcdList);
		model.addAttribute("xmList", xmList);
		return "commons/qkfkxt/qkfktj";
	}
	@RequestMapping("/qkfk")
	public String qkfk(Model model,QkfkyclPage qkfkyclPage,HttpSession session,String flag){
		UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
		qkfkyclPage.setSqrdm(userEntity.getYhdm());
		//查询情况反馈列表
		List<QkfkxtFksqbEntity> qkfklist = qkfkyclService.query(qkfkyclPage);
		//查询项目列表
		List<Map<String, String>> xmList = new ArrayList <Map<String, String>>();
		xmList=qkfkyclService.queryxmmc();
		//查询紧急程度
		List<Map<String, String>> jjcdList = new ArrayList <Map<String, String>>();
		jjcdList=qkfkyclService.queryjjcd();
		//查询变更类型
		List<Map<String, String>> bglxList = new ArrayList <Map<String, String>>();
		bglxList=qkfkyclService.queryqkfklx();
		//查询教师列表
		List<Map<String, String>> jsList = new ArrayList <Map<String, String>>();
		jsList=qkfkyclService.queryjs();
		model.addAttribute("qkfkyclPage", qkfkyclPage);
		model.addAttribute("qkfklist", qkfklist);
		model.addAttribute("bglxList", bglxList);
		model.addAttribute("jjcdList", jjcdList);
		model.addAttribute("flag", flag);
		model.addAttribute("jsList", jsList);
		model.addAttribute("xmList", xmList);
		return  "commons/qkfkxt/qkfkiframe";
	}
	
	@RequestMapping("/fkcl")
	public String fkcl(Model model,QkfkyclPage qkfkyclPage,FkclPage fkclPage,HttpSession session,String flag){
		UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
    	String yhdm=userEntity.getYhdm();
    	fkclPage.setYhdm(userEntity.getYhdm());
		List<FkclEntity> listfkcl=fkclService.query(fkclPage);
		model.addAttribute("listfkcl", listfkcl);
		//查询项目列表
		List<Map<String, String>> xmList = new ArrayList <Map<String, String>>();
		xmList=qkfkyclService.queryxmmc();
		//查询紧急程度
		List<Map<String, String>> jjcdList = new ArrayList <Map<String, String>>();
		jjcdList=qkfkyclService.queryjjcd();
		//查询变更类型
		List<Map<String, String>> bglxList = new ArrayList <Map<String, String>>();
		bglxList=qkfkyclService.queryqkfklx();
		model.addAttribute("bglxList", bglxList);
		model.addAttribute("qkfkyclPage", qkfkyclPage);
		model.addAttribute("fkclPage", fkclPage);
		model.addAttribute("jjcdList", jjcdList);
		model.addAttribute("qkfkyclPage", qkfkyclPage);
		model.addAttribute("xmList", xmList);
		model.addAttribute("yhdm", yhdm);
		model.addAttribute("flag", flag);
		//选择流转人
		List<Map<String, String>> lzrlist=qkfkyclService.queryjs();
		model.addAttribute("lzrlist", lzrlist);
		return  "commons/qkfkxt/fkcliframe";
	}
	
	@ResponseBody
	@RequestMapping("delqkfk")
    public String delXxtc(String []ids){
		String falg="";
		try {
			qkfkyclService.delqkfk(ids);
			falg="1";
		} catch (Exception e) {
			falg="0";
			System.err.println("delXxtc操作失败!!");
			e.printStackTrace();
		}
    	return falg;
    }
	
	//批量确认完成
	@RequestMapping("qurwc")
	@ResponseBody
	public boolean qurwc(String[] sqdh,HttpSession session,QkfkyclPage qkfkyclPage){
		boolean flag=false;
		UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
		for(int i=0;i<sqdh.length;i++){
		Map<String,String> map= new HashMap<String,String>();
		QkfkxtFksqbEntity qkfkxtFksqbEntity=qkfkyclService.queryqkfkByone(sqdh[i]);
			map.put("P_ZT", qkfkyclPage.getZt());
			map.put("P_SQDH", sqdh[i]);
			map.put("P_YHDM",userEntity.getYhdm());
			map.put("P_LZJSRDM","");
			map.put("P_YJ", qkfkyclPage.getYj());
			map.put("P_WCYJSJ", "");
		flag= qkfkyclService.tjfk(map);
		}
		return flag;
	}
	//批量发布考试试卷
		@RequestMapping("tjfk")
		@ResponseBody
		public boolean tjfk(String[] sqdh,HttpSession session){
			boolean flag=false;
			UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
			for(int i=0;i<sqdh.length;i++){
				System.out.println(sqdh[i]+"++++++++++++++++");
			Map<String,String> map= new HashMap<String,String>();
			QkfkxtFksqbEntity qkfkxtFksqbEntity=qkfkyclService.queryqkfkByone(sqdh[i]);
			    map.put("P_ZT", "1");
				map.put("P_SQDH", sqdh[i]);
				map.put("P_YHDM",userEntity.getYhdm());
				map.put("P_LZJSRDM", qkfkxtFksqbEntity.getLzjsrdm());
				map.put("P_YJ", "");
				map.put("P_WCYJSJ", "");
			flag= qkfkyclService.tjfk(map);
			}
			return flag;
		}
	
	
	@RequestMapping("/qkfktjxg")
	public String qkfktjxg(String xz,HttpSession session,Model model,QkfkyclPage qkfkyclPage,String flag){
		UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
		model.addAttribute("dlr",  userEntity.getXm());
		model.addAttribute("yhdm", userEntity.getYhdm());
		//查询项目列表
		List<Map<String, String>> xmList = new ArrayList <Map<String, String>>();
		xmList=qkfkyclService.queryxmmc();
		//查询紧急程度
		List<Map<String, String>> jjcdList = new ArrayList <Map<String, String>>();
		jjcdList=qkfkyclService.queryjjcd();
		//查询变更类型
		List<Map<String, String>> bglxList = new ArrayList <Map<String, String>>();
		bglxList=qkfkyclService.queryqkfklx();
		//查询教师列表
		List<Map<String, String>> jsList = new ArrayList <Map<String, String>>();
		jsList=qkfkyclService.queryjs();
		model.addAttribute("bglxList", bglxList);
		model.addAttribute("jsList", jsList);
		model.addAttribute("qkfkyclPage", qkfkyclPage);
		model.addAttribute("jjcdList", jjcdList);
		model.addAttribute("flag", flag);
		model.addAttribute("xmList", xmList);
	    return  "commons/qkfkxt/qkfktj";
	}
	@RequestMapping("addOrUpdqkfk")
	public String addOrUpdqkfk(Model model, HttpServletRequest request, HttpSession session, String[] qfjs, String[] hfjs, String[] del_fjs, 
			QkfkxtFksqbEntity entity,String xz,HashMap mapz,QkfkyclPage qkfkyclPage){
		String flag = "";
		try{  
			UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
			mapz.put("P_ZT", "1");
			mapz.put("P_SQDH", entity.getSqdh());
			mapz.put("P_YHDM",userEntity.getYhdm());
			mapz.put("P_LZJSRDM", entity.getLzjsrdm());
			mapz.put("P_YJ", "");
			mapz.put("P_WCYJSJ", "");
			qkfkyclService.addOrUpdXxfbxx("fkcl", "QKFKXT_FKSQB", "SQDH", userEntity.getYhdm(), "", qfjs, hfjs, del_fjs, entity,xz,mapz);
			System.out.println(del_fjs+"---------------------------------");
			flag = "success";
		}catch(Exception e){
			System.err.println("addOrUpdqkfk操作失败！");
			e.printStackTrace();
			flag = "error";
		}
		return "forward:/qkfkycl/qkfktjxg?flag="+flag+"&qkfkyclPage"+qkfkyclPage;
		
	
	}
	  @ResponseBody
	    @RequestMapping("/sc")
	    public Integer querypdy(String[] ids,FkclPage fkclPage, HttpSession session){
	    	UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
	    	Integer falg=0;
	    	String yhdm=userEntity.getYhdm();
	   	try {
	   		List<FkclEntity> fkcllist= new ArrayList<FkclEntity>();
			for(String sqdh:ids){
				fkclPage.setYhdm(yhdm);
				fkclPage.setSqdh(sqdh);
				FkclEntity fkcl=qkfkyclService.fkcx(fkclPage);
				String sqzt=fkcl.getSqzt();
				if("0".equals(sqzt)||"4".equals(sqzt)){
					fkcl.setPdplcl("");
				}else{
					fkcl.setPdplcl("只能操作保存或退回的数据！");
				}
				fkcllist.add(fkcl);
			}
			String i="";
			
			for(FkclEntity a : fkcllist){
				i=i+a.getPdplcl();
			}
			if("".equals(i)){
				falg=1;
			}
	   	} catch (Exception e) {
				e.printStackTrace();
				System.out.println("querypdy 错误!"+e);
			}
//			   return "redirect:"+href;
			return falg;
	   }
	  
	  @ResponseBody
	    @RequestMapping("/depd")
	    public Integer querydepd(String[] ids,FkclPage fkclPage, HttpSession session){
	    	UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
	    	Integer falg=0;
	    	String yhdm=userEntity.getYhdm();
	   	try {
	   		List<FkclEntity> fkcllist= new ArrayList<FkclEntity>();
			for(String sqdh:ids){
				fkclPage.setYhdm(yhdm);
				fkclPage.setSqdh(sqdh);
				FkclEntity fkcl=qkfkyclService.fkcx(fkclPage);
				String sqzt=fkcl.getSqzt();
				if("0".equals(sqzt)||"4".equals(sqzt)||"1".equals(sqzt)){
					fkcl.setPdplcl("");
				}else{
					fkcl.setPdplcl("只能操作保存或退回或提交的数据！");
				}
				fkcllist.add(fkcl);
			}
			String i="";
			
			for(FkclEntity a : fkcllist){
				i=i+a.getPdplcl();
			}
			if("".equals(i)){
				falg=1;
			}
	   	} catch (Exception e) {
				e.printStackTrace();
				System.out.println("querypdy 错误!"+e);
			}
//			   return "redirect:"+href;
			return falg;
	   }	  
	  @RequestMapping("/queryFkclpdwc")
	    public String queryFkclpdwc(Model model ,FkclPage fkclPage, HttpSession session,String[] ids){
	    	UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
	    	String yhdm=userEntity.getYhdm();
	    	try {
	    		List<FkclEntity> fkcllist= new ArrayList<FkclEntity>();
	    		for(String sqdh:ids){
	    			fkclPage.setYhdm(yhdm);
	    			fkclPage.setSqdh(sqdh);
	    			FkclEntity fkcl=qkfkyclService.fkcx(fkclPage);
	    			String sqzt=fkcl.getSqzt();
	    			if("0".equals(sqzt)||"4".equals(sqzt)||"1".equals(sqzt)){
	    				fkcl.setPdplcl("");
	    			}else{
	    				fkcl.setPdplcl("只能操作保存或退回或提交的数据！");
	    			}
	    			fkcllist.add(fkcl);
	    		}
	    	
				model.addAttribute("qkfklist", fkcllist);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("queryFkcl 错误!"+e);
			}

	        return "commons/qkfkxt/scqrpd";
	    }
	  
	  
	  @RequestMapping("/queryFkclpd")
	    public String queryFkclpd(Model model ,FkclPage fkclPage, HttpSession session,String[] ids){
	    	UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
	    	String yhdm=userEntity.getYhdm();
	    	try {
	    		List<FkclEntity> fkcllist= new ArrayList<FkclEntity>();
	    		for(String sqdh:ids){
	    			fkclPage.setYhdm(yhdm);
	    			fkclPage.setSqdh(sqdh);
	    			FkclEntity fkcl=qkfkyclService.fkcx(fkclPage);
	    			String sqzt=fkcl.getSqzt();
	    			if("0".equals(sqzt)||"4".equals(sqzt)){
	    				fkcl.setPdplcl("");
	    			}else{
	    				fkcl.setPdplcl("只能操作保存或退回的数据！");
	    			}
	    			fkcllist.add(fkcl);
	    		}
	    	
				model.addAttribute("qkfklist", fkcllist);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("queryFkcl 错误!"+e);
			}

	        return "commons/qkfkxt/scqrpd";
	    }
	  
	  @ResponseBody
	    @RequestMapping("/qr")
	    public Integer qr(String[] ids,FkclPage fkclPage, HttpSession session){
	    	UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
	    	Integer falg=0;
	    	String yhdm=userEntity.getYhdm();
	   	try {
	   		List<FkclEntity> fkcllist= new ArrayList<FkclEntity>();
			for(String sqdh:ids){
				fkclPage.setYhdm(yhdm);
				fkclPage.setSqdh(sqdh);
				FkclEntity fkcl=qkfkyclService.fkcx(fkclPage);
				String sqzt=fkcl.getSqzt();
				if("1".equals(sqzt)||"2".equals(sqzt)||"3".equals(sqzt)||"5".equals(sqzt)||"6".equals(sqzt)||"99".equals(sqzt)||"-99".equals(sqzt)||"A".equals(sqzt)){
					fkcl.setPdplcl("");
				}else{
					fkcl.setPdplcl("只能操作除保存或退回的数据！");
				}
				fkcllist.add(fkcl);
			}
			String i="";
			
			for(FkclEntity a : fkcllist){
				i=i+a.getPdplcl();
			}
			if("".equals(i)){
				falg=1;
			}
	   	} catch (Exception e) {
				e.printStackTrace();
				System.out.println("querypdy 错误!"+e);
			}
			return falg;
	   }
	  
	  @RequestMapping("/queryFkclqr")
	    public String queryFkclqr(Model model ,FkclPage fkclPage, HttpSession session,String[] ids){
	    	UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
	    	String yhdm=userEntity.getYhdm();
	    	try {
	    		List<FkclEntity> fkcllist= new ArrayList<FkclEntity>();
	    		for(String sqdh:ids){
	    			fkclPage.setYhdm(yhdm);
	    			fkclPage.setSqdh(sqdh);
	    			FkclEntity fkcl=qkfkyclService.fkcx(fkclPage);
	    			String sqzt=fkcl.getSqzt();
	    			if("1".equals(sqzt)||"2".equals(sqzt)||"3".equals(sqzt)||"5".equals(sqzt)||"6".equals(sqzt)||"99".equals(sqzt)||"-99".equals(sqzt)||"A".equals(sqzt)){
	    				fkcl.setPdplcl("");
	    			}else{
	    				fkcl.setPdplcl("只能操作除保存或退回的数据！");
	    			}
	    			fkcllist.add(fkcl);
	    		}
	    	
				model.addAttribute("qkfklist", fkcllist);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("queryFkcl 错误!"+e);
			}

	        return "commons/qkfkxt/scqrpd";
	    }
	  
	
	
	@RequestMapping("addFkcx")
	public String addFkcx(Model model, HttpServletRequest request, HttpSession session,String[] ids,String zt,String lzjsrdm,String yj){
		String flag = "";
		try{  
			UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
			String yhdm=userEntity.getYhdm();
//			List<Map<String,String>> list=new ArrayList<Map<String,String>>();
			for(String sqdh:ids){
//				FkclPage fkclPage=new FkclPage();
//    			fkclPage.setYhdm(yhdm);
//    			fkclPage.setSqdh(sqdh);
//    			FkclEntity fkcl=fkclService.fkcx(fkclPage);
//    			String sqrdm=fkcl.getSqrdm();
    			Map<String,String> map=new HashMap<String,String>();
    			map.put("P_ZT", zt);
    			map.put("P_SQDH", sqdh);
//    			map.put("P_SQRDM", sqrdm);
//    			map.put("P_LZRDM", "");
    			map.put("P_YHDM", yhdm);
    			map.put("P_LZJSRDM", lzjsrdm);
    			map.put("P_YJ", yj);
    			map.put("P_WCYJSJ", "");
//    			list.add(map);
    			fkclService.addFkcx((HashMap<String, String>) map);
			}
			flag = "success";
		}catch(Exception e){
			System.err.println("addOrUpdfkcl操作失败！");
			e.printStackTrace();
			flag = "error";
		}
		return "forward:/qkfkycl/fkcl?flag="+flag;
	}
	

	  @RequestMapping("/queryFkclxg")
	    public String queryFkclxg(Model model,FkclPage fkclPage, HttpSession session,String dh,String zt,QkfkyclPage qkfkyclPage){
	    	UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
	    	String yhdm=userEntity.getYhdm();
	    	try {
	    		FkclPage page=new FkclPage();
	    		page.setYhdm(yhdm);
	    		page.setSqdh(dh);
				FkclEntity fkcl=fkclService.fkcx(page);
				Map<String,String> map =new HashMap<String,String>();
				map.put("sqdh", dh);
				map.put("yhdm", yhdm);
				List<Map<String,String>> fbjhlist=fkclService.queryBySqdhAll(map);
//				String listfjjson = JSON.toJSONString(uploadService.queryFj("QKFKXT_FKSQB", "SQDH", sqdh)).replaceAll("\"", "'");
				model.addAttribute("fkcl", fkcl);
				model.addAttribute("fbjhlist", fbjhlist);
				model.addAttribute("sqzt", zt);
				model.addAttribute("sqdh", dh);
				String yhxm=fkclService.yhxm(yhdm);
				model.addAttribute("qkfkyclPage", qkfkyclPage);
				model.addAttribute("fkclPage", fkclPage);
				model.addAttribute("yhxm", yhxm);
//				model.addAttribute("listfjjson", listfjjson);
				//选择流转人
				List<Map<String, String>> lzrlist=qkfkyclService.queryjs();
				model.addAttribute("lzrlist", lzrlist);
				//附件
				List<Map<String,String>> fjlist = qkfkxtcxService.querFjlist(dh);
				model.addAttribute("fjlist", fjlist);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("queryFkclxg 错误!"+e);
			}

	        return "commons/qkfkxt/qkfkclxg";
	    }
	  
		@RequestMapping("addOrUpdfkcl")
		public String addOrUpdfkcl(Model model, HttpServletRequest request, HttpSession session,FkclPage fkclPage,String sqdh,String zt,String yj){
			String flag = "";
			try{ 
				String lzjsrxm=fkclPage.getLzjsrxmm();
				UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);			
				String yhdm=userEntity.getYhdm();			
				Map<String,String> map=new HashMap<String,String>();
				map.put("P_ZT", zt);
				map.put("P_SQDH", sqdh);
				map.put("P_YHDM", yhdm);
				map.put("P_LZJSRDM", lzjsrxm);
				map.put("P_YJ", yj);
				map.put("P_WCYJSJ", "");
				fkclService.addFkcx((HashMap<String, String>) map);
				flag = "success";
			}catch(Exception e){
				System.err.println("addOrUpdfkcl操作失败！");
				e.printStackTrace();
				flag = "error";
			}
			return "forward:/qkfkycl/fkcl?fkclPage="+fkclPage+"&flag="+flag;
		}
	  
	
}

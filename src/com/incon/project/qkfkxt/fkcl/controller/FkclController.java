package com.incon.project.qkfkxt.fkcl.controller;
import java.util.ArrayList;
import java.util.Date;
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
import com.incon.common.pub.pubYx.service.PubYxService;
import com.incon.common.upload.service.UploadService;
import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.JsxxbEntity;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.XsxxbEntity;
import com.incon.pojo.common.dbsx.DbsxEntity;
import com.incon.pojo.common.lwgl.KxkzybEntity;
import com.incon.pojo.common.lwgl.LwsbbEntity;
import com.incon.pojo.common.lwgl.XsxtbEntity;
import com.incon.pojo.common.lwgl.XtczbEntity;
import com.incon.pojo.common.qkfkxt.FkclEntity;
import com.incon.pojo.common.xxfbxx.XxfbEntity;
import com.incon.project.common.xtgl.page.XtglPage;
import com.incon.project.common.xtgl.service.XtglService;
import com.incon.project.common.xxfbxx.page.XxfbxxglPage;
import com.incon.project.dbsx.page.DbsxPage;
import com.incon.project.dbsx.service.DbsxService;
import com.incon.project.qkfkxt.fkcl.page.FkclPage;
import com.incon.project.qkfkxt.fkcl.service.FkclService;
import com.incon.project.qkfkxt.qkfkxtcx.service.QkfkxtcxService;
import com.incon.project.qkfkxt.qkfkycl.service.QkfkyclService;


@SuppressWarnings("all")
@Controller
@RequestMapping("/fkcl")
public class FkclController
{

    @Resource(name = "fkclService")
    private FkclService fkclService;
	@Resource(name="uploadService")
	private UploadService uploadService;
	@Resource(name="qkfkyclService")
	private QkfkyclService qkfkyclService;
	@Resource(name="qkfkxtcxService")
	private QkfkxtcxService qkfkxtcxService;
	

    @RequestMapping("/queryFkcl")
    public String queryFkcl(Model model,FkclPage fkclPage, HttpSession session,String flag){
    	UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
    	String yhdm=userEntity.getYhdm();
    	try {
    		
    		fkclPage.setYhdm(userEntity.getYhdm());
			List<FkclEntity> listfkcl=fkclService.query(fkclPage);
			//项目名称
			List<Map<String, String>> xtList =qkfkyclService.queryxmmc();

			//变更类型
			List<Map<String, String>> bglxList = qkfkyclService.queryqkfklx();
			
			

			//紧急程度
			List<Map<String, String>>   jjcdList  = qkfkyclService.queryjjcd();
			
			model.addAttribute("xtList", xtList);
		    model.addAttribute("bglxList", bglxList);
		    model.addAttribute("jjcdList", jjcdList);
			model.addAttribute("listfkcl", listfkcl);
			model.addAttribute("fkclPage", fkclPage);
			model.addAttribute("yhdm", yhdm);
			model.addAttribute("flag", flag);
			//流转接收人
			List<Map<String, String>> lzrlist=qkfkyclService.queryjs();
			model.addAttribute("lzrlist", lzrlist);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryFkcl 错误!"+e);
		}

        return "commons/qkfkxt/fkcl";
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
    			FkclEntity fkcl=fkclService.fkcx(fkclPage);
    			if(yhdm.equals(fkcl.getLzjsrdm())){
    			if("1".equals(fkcl.getSqzt())){
    				fkcl.setPdplcl("");
    			}else if("2".equals(fkcl.getSqzt())){
    				fkcl.setPdplcl("");
    			}else{
    				fkcl.setPdplcl("只能操作提交或已流转的数据！");
    			}		
    			}else{
    				fkcl.setPdplcl("只能操作流转接收人为本人的数据！");
    			}
    			fkcllist.add(fkcl);
    		}
    	
			model.addAttribute("fkcllist", fkcllist);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryFkcl 错误!"+e);
		}

        return "commons/qkfkxt/iframe_fkcl";
    }
    
    @ResponseBody
    @RequestMapping("/querypdy")
    public Integer querypdy(String[] ids,FkclPage fkclPage, HttpSession session){
    	UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
    	Integer falg=0;
    	String yhdm=userEntity.getYhdm();
   	try {
   		List<FkclEntity> fkcllist= new ArrayList<FkclEntity>();
		for(String sqdh:ids){
			fkclPage.setYhdm(yhdm);
			fkclPage.setSqdh(sqdh);
			FkclEntity fkcl=fkclService.fkcx(fkclPage);
			
			if("1".equals(fkcl.getSqzt())&&yhdm.equals(fkcl.getLzjsrdm())){
				fkcl.setPdplcl("");
			}else if("2".equals(fkcl.getSqzt())&&yhdm.equals(fkcl.getLzjsrdm())){
				fkcl.setPdplcl("");
			}else{
				fkcl.setPdplcl("状态不正确或流转接收人不是本人");
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
//		   return "redirect:"+href;
		return falg;
   }
    
    
    
    @ResponseBody
    @RequestMapping("/querypdyqd")
    public Integer querypdyqd(String[] ids,FkclPage fkclPage, HttpSession session){
    	UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
    	Integer falg=0;
    	String yhdm=userEntity.getYhdm();
   	try {
   		List<FkclEntity> fkcllist= new ArrayList<FkclEntity>();
		for(String sqdh:ids){
			fkclPage.setYhdm(yhdm);
			fkclPage.setSqdh(sqdh);
			FkclEntity fkcl=fkclService.fkcx(fkclPage);
			if("3".equals(fkcl.getSqzt())&&yhdm.equals(fkcl.getLzjsrdm())){
				fkcl.setPdplcl("");
				System.out.println(fkcl.getSqzt());
			}else{
				fkcl.setPdplcl("状态不正确或流转接收人不是本人");
				System.out.println(fkcl.getSqzt());
			}
			fkcllist.add(fkcl);
		}
		String c="";		
		for(FkclEntity a : fkcllist){
			System.out.println(a.getPdplcl());
			c=c+a.getPdplcl();
		}
		System.out.println(c+"===888===");
		if("".equals(c)){
			falg=1;
		}
		System.out.println(c+"===============");
   	} catch (Exception e) {
			e.printStackTrace();
			System.out.println("querypdyqd 错误!"+e);
		}
//		   return "redirect:"+href;
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
    			FkclEntity fkcl=fkclService.fkcx(fkclPage);
    			if(yhdm.equals(fkcl.getLzjsrdm())){
    				
    			if("3".equals(fkcl.getSqzt())){
    				fkcl.setPdplcl("");
    			}else{
    				fkcl.setPdplcl("只能操作已接收的数据！");
    			}
    			}else{
    				fkcl.setPdplcl("只能操作流转接收人为本人的数据！");
    			}
    			fkcllist.add(fkcl);
    		
    		}
			model.addAttribute("fkcllist", fkcllist);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryFkcl 错误!"+e);
		}

        return "commons/qkfkxt/iframe_fkcl";
    }
    
    
    

    @RequestMapping("/queryFkclxg")
    public String queryFkclxg(Model model,FkclPage fkclPage, HttpSession session,String dh,String zt){
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
			String listfjjson = JSON.toJSONString(uploadService.queryFj("QKFKXT_FKSQB_CYB", "ID", "")).replaceAll("\"", "'");
			model.addAttribute("fkcl", fkcl);
			model.addAttribute("fbjhlist", fbjhlist);
			model.addAttribute("sqzt", zt);
			model.addAttribute("fkclPage", fkclPage);
			model.addAttribute("sqdh", dh);
			String yhxm=fkclService.yhxm(yhdm);
			model.addAttribute("yhxm", yhxm);
			model.addAttribute("listfjjson", listfjjson);
			//附件
			List<Map<String,String>> fjlist = qkfkxtcxService.querFjlist(dh);
			model.addAttribute("fjlist", fjlist);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryFkclxg 错误!"+e);
		}

        return "commons/qkfkxt/fkclxg";
    }


	/**
	 * 反馈处理单个处理
	 * @param model
	 * @param request
	 * @param session
	 * @param qfjs
	 * @param hfjs
	 * @param del_fjs
	 * @param entity
	 * @param fkclPage
	 * @return
	 */
	@RequestMapping("addOrUpdfkcl")
	public String addOrUpdfkcl(Model model, HttpServletRequest request, HttpSession session, String[] qfjs, String[] hfjs, String[] del_fjs, 
			FkclEntity entity,FkclPage fkclPage,String sqdh,String zt,String wcyjsj,String yj){
		String flag = "";
		try{  
			UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
			fkclService.addOrUpdXxfbxx("fkcl", "QKFKXT_FKSQB_CYB", "ID", userEntity.getYhdm(), "", qfjs, hfjs, del_fjs, entity);
			String yhdm=userEntity.getYhdm();			
//			fkclPage.setYhdm(yhdm);
//			fkclPage.setSqdh(sqdh);
//			FkclEntity fkcl=fkclService.fkcx(fkclPage);
//			String sqrdm=fkcl.getSqrdm();
			Map<String,String> map=new HashMap<String,String>();
			map.put("P_ZT", zt);
			map.put("P_SQDH", sqdh);
//			map.put("P_SQRDM", sqrdm);
//			map.put("P_LZRDM", "");
			map.put("P_YHDM", yhdm);
			map.put("P_LZJSRDM", "");
			map.put("P_YJ", yj);
			map.put("P_WCYJSJ", wcyjsj);
			fkclService.addFkcx((HashMap<String, String>) map);
			
			flag = "success";
		}catch(Exception e){
			System.err.println("addOrUpdfkcl操作失败！");
			e.printStackTrace();
			flag = "error";
		}
		return "forward:/fkcl/queryFkcl?fkclPage="+fkclPage+"&flag="+flag;
	}
    
	@RequestMapping("addFkcx")
	public String addFkcx(Model model, HttpServletRequest request, HttpSession session,String[] ids,String zt,String wcyjsj,String yj){
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
    			System.out.println(zt);
    			map.put("P_ZT", zt);
    			map.put("P_SQDH", sqdh);
//    			map.put("P_SQRDM", sqrdm);
//    			map.put("P_LZRDM", "");
    			map.put("P_YHDM", yhdm);
    			map.put("P_LZJSRDM", "");
    			map.put("P_YJ", yj);
    			map.put("P_WCYJSJ", wcyjsj);
//    			list.add(map);
    			fkclService.addFkcx((HashMap<String, String>) map);
    			
    			
			}
			
			flag = "success";
		}catch(Exception e){
			System.err.println("addOrUpdfkcl操作失败！");
			e.printStackTrace();
			flag = "error";
		}
		return "forward:/fkcl/queryFkcl?flag="+flag;
	}
}

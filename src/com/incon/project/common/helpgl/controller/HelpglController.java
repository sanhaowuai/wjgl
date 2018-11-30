package com.incon.project.common.helpgl.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.HelpbEntity;
import com.incon.pojo.common.QxbEntity;
import com.incon.pojo.common.UserEntity;
import com.incon.project.common.helpgl.service.HelpglService;

@Controller
@RequestMapping("helpgl")
public class HelpglController {
	@Resource(name="helpglService")
	private HelpglService helpglService;
	
	
	//查询所有帮助,显示用
	@RequestMapping("queryHelpglListXs")
	public String queryHelpglListXs(HttpSession session,Model model,String qxdm){
		try{
			UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
			List<HelpbEntity> zu=helpglService.LookHelpglList(qxdm,userEntity.getJsdm()+"");
			QxbEntity qx=helpglService.queryQxglOne(qxdm);
			if(zu!=null && zu.size()>0){
				String bzid=zu.get(0).getBzid();
				HelpbEntity h=helpglService.queryHelpglOne(bzid);
				model.addAttribute("yige", h);
			}
			else{
				model.addAttribute("yige", new HelpbEntity());
				
			}
			model.addAttribute("listbz", zu);
			model.addAttribute("oneqx", qx);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "commons/helpgl/queryHelpgl";
		
	}
	//查询所有帮助,显示用
	@RequestMapping("queryHelpglListXsg")
	public String queryHelpglListXsg(HttpSession session, Model model,String qxdm){
		try{
			UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
			List<HelpbEntity> zu=helpglService.LookHelpglList(qxdm,userEntity.getJsdm()+"");
			QxbEntity qx=helpglService.queryQxglOne(qxdm);
			 
			model.addAttribute("listbz", zu);
			model.addAttribute("oneqx", qx);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "commons/helpgl/queryHelpglg";
		
	}

	//查询所有帮助,编辑用
	@RequestMapping("queryHelpglListBj")
	public String queryHelpglListBj(Model model,String qxdm){
		try{
			List<HelpbEntity> zu=helpglService.queryHelpglList(qxdm);
			QxbEntity qx=helpglService.queryQxglOne(qxdm);
			model.addAttribute("listbz", zu);
			model.addAttribute("oneqx", qx);
			model.addAttribute("zhuangtai", "1");
			model.addAttribute("jslist", helpglService.queryJsList());
		}catch(Exception e){
			e.printStackTrace();
		}
		return "commons/helpgl/addupdHelpgl";
		
	}
	//查询一个帮助
	@ResponseBody
	@RequestMapping("queryHelpglOne")
	public Object queryHelpglOne(String bzid){
		HelpbEntity h=null;
		try{
			h=helpglService.queryHelpglOne(bzid);
		}catch(Exception e){
			e.printStackTrace();
			return null;
			
		}
		return h;
		
	}
	//增加修改帮助
	@RequestMapping("addupdHelpgl")
	public String addupdHelpgl(HttpServletResponse res,HelpbEntity helpbEntity,String zt,String jsdmss,String  xh){
		try{
			helpbEntity.setJsdms(jsdmss);
			helpbEntity.setXh(xh);
			if(zt.equals("1")){
				helpglService.addHelpgl(helpbEntity);
				
			}
			else{
				helpglService.updHelpgl(helpbEntity);
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/helpgl/queryHelpglListBj?qxdm="+helpbEntity.getQxdm();
	}
	//删除帮助
	@RequestMapping("delHelpgl")
	public String delHelpgl(HttpServletResponse res,String bzid,String qxdm){
		try{
			helpglService.delHelpgl(bzid);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/helpgl/queryHelpglListBj?qxdm="+qxdm;
		
	}
	
	

}

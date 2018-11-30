package com.incon.project.common.zjwh.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.framework.Tag.PageTag;
import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.zjwh.JszjbEntity;
import com.incon.pojo.common.zjwh.ZjwhEntity;
import com.incon.project.common.zjwh.page.ZjwhJsqxPage;
import com.incon.project.common.zjwh.page.ZjwhPage;
import com.incon.project.common.zjwh.page.ZjwhRyjsqxPage;
import com.incon.project.common.zjwh.service.ZjwhService;
import com.sun.net.httpserver.HttpServer;


/**
 * 
 * @类名： com.incon.project.common.zjwh.controller.ZjwhController
 * @修改人：
 * @日期：
 * @描述：  组件维护
 * @版本号：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/zjwh")
public class ZjwhController {
	
	
	@Resource(name="zjwhService")
	private ZjwhService zjwhService;
	
	@RequestMapping("/queryZjwh")
	public String queryZjwh(Model model,ZjwhPage page){		
		try {
			List<ZjwhEntity> list=zjwhService.query(page);			
			model.addAttribute("list", list);
			model.addAttribute("page", page);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}		
		return "commons/zjwh/zjwh";
	}
	
	@ResponseBody
	@RequestMapping("queryZjwhOne")
	public ZjwhEntity queryZjwhOne(String zjdm){
		ZjwhEntity zjwhEntity=new ZjwhEntity();
		try {
			zjwhEntity=zjwhService.queryZjwhOne(zjdm);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return zjwhEntity;		
	}
	
	@ResponseBody
	@RequestMapping("/addOrUpdZjwh")
	public String addOrUpdZjwh(ZjwhEntity entity,String zt){
		
		try {
			if(zt.equals("1")){
				zjwhService.addZjwh(entity);
			}else if(zt.equals("2")){
				zjwhService.UpdZjwh(entity);
			}				
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "0";
		}		
		return "1";
	}
	
	@ResponseBody
	@RequestMapping("/delZjwh")
	public String delZjwh(String[] ids){		
		try {
			zjwhService.delZjwh(ids);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "1";
	}
	
	@RequestMapping("/queryZjqx")
	public String queryZjqx(Model model,HttpSession session,ZjwhJsqxPage page){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		try {
		 
			List<ZjwhEntity> list=zjwhService.queryZjwhJsqx(page);
			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("jsdm", page.getJsdm());
			model.addAttribute("qxlb", page.getQxlb());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "commons/juesgl/zjsq";
	}
	
	
	@ResponseBody
	@RequestMapping("/addJsZjsq")
	public String addJsZjsq(String[] ids,String jsdm,String qxlb,String pzjmc){
		try {
			//zjwhService.delJsZjsq(jsdm,qxlb);				
			zjwhService.addJsZjsq(jsdm,ids,qxlb,pzjmc);						
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "0";
		}
		return "1";
	}
	
	@RequestMapping("/queryRyjsZjqx")
	public String queryRyjsZjqx(Model model,ZjwhRyjsqxPage page){
		try {
			List<ZjwhEntity> list=zjwhService.queryRyjsZjqx(page);
			model.addAttribute("list", list);
			model.addAttribute("page", page);			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}		
		return "commons/rygl/ryjszjsq";
	}
	
	@ResponseBody
	@RequestMapping("addRyjsZjsq")
	public String addRyjsZjsq(String[] ids,String jsdm,String yhdm,String qxlb){
		String flg = "1";
		try {
			//zjwhService.delRyjsZjsq(jsdm,yhdm,qxlb);
			zjwhService.addRyjsZjsq(ids,jsdm,yhdm,qxlb);			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			flg =  "0";
		}
		return flg;
	}	
	
}

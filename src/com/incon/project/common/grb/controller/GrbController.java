package com.incon.project.common.grb.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.QxbEntity;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.grb.GrbEntity;
import com.incon.project.common.grb.page.Grbpage;
import com.incon.project.common.grb.service.GrbService;

@SuppressWarnings("all")
@Controller
@RequestMapping("/grb")
public class GrbController {
	
	@Resource(name="grbService")
	private GrbService grbService;
	
	@RequestMapping("/queryGrbcd")
	public String queryGrbcd(Model model,HttpSession session){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		try {			
			List<GrbEntity> list=grbService.queryGrbcd(userEntity.getYhdm());			

			model.addAttribute("list", list);			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}		
		return "commons/grb/grb";
	}
	
	@ResponseBody
	@RequestMapping("/queryQx")
	public List<Map<String,String>> queryQx(Model model,HttpSession session){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		Map xxMap = new HashMap();
		try {
			xxMap.put("yhdm", userEntity.getYhdm());
			xxMap.put("jsdm", userEntity.getJsdm());
		//	list = ryjsService.queryQx(ryjsbEntity);
			list = grbService.queryQx(xxMap);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryQx操作失败!!");
		}
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/addGrbCd")
	public boolean addGrb(String id,String idd,String fid,HttpSession session){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		try {
			grbService.addGrbCd(id,idd,fid,userEntity.getYhdm(),userEntity.getJsdm());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	@ResponseBody
	@RequestMapping("delGrb")
	public boolean delGrb(String[] ids){
		try {
			grbService.delGrb(ids);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	@ResponseBody
	@RequestMapping("addBcsx")
	public boolean addBcsx(String[] xssx,String[] id,HttpSession session){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		try {
			List<GrbEntity> list=new ArrayList<GrbEntity>();
			for (int i = 0; i < id.length; i++) {
				GrbEntity entity=new GrbEntity();
				entity.setXssx(xssx[i]);
				entity.setId(id[i]);
				entity.setYhdm(userEntity.getYhdm());
				entity.setJsdm(userEntity.getJsdm().toString());
				list.add(entity);
			}			
			grbService.adBcsx(list);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
		return true;
	}
}

package com.incon.common.pub.pubXs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.common.pub.pubXs.page.PubXsPage;
import com.incon.common.pub.pubXs.service.PubXsService;
import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.UserEntity;

@SuppressWarnings("all")
@Controller
@RequestMapping("/pubXs")
public class PubXsController {
	
	@Resource(name="pubXsService")
	private PubXsService pubXsService;
	
	/**
	 * 查询学生
	 * @param model
	 * @param pubXsPage
	 * @param session
	 * @param map
	 * @param yxdm
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/queryPubXs")
	public Object queryPubXs(Model model,PubXsPage pubXsPage,HttpSession session,HashMap map,String yxdm){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);

		List<Map> xsList = null;
		try{
			pubXsPage.setGljb(userEntity.getGljb());//管理级别
			pubXsPage.setYhdm(userEntity.getYhdm());//登录用户名
			if(userEntity.getSfcjgly() == null || userEntity.getSfcjgly().trim().equals("")){//是否超级管理员
				pubXsPage.setSfcjgly("0");			
			}else{
				pubXsPage.setSfcjgly(userEntity.getSfcjgly());
			}
			pubXsPage.setJsdm(userEntity.getJsdm());//角色代码
			
			xsList = pubXsService.queryPubXs(map);
			model.addAttribute("xsList", xsList);
		
		}catch(Exception e){
			System.err.println("queryPubXs操作失败!!");
			e.printStackTrace();
		}
		return xsList;
	}
	
}

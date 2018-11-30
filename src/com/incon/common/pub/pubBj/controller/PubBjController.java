package com.incon.common.pub.pubBj.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.common.pub.pubBj.page.PubBjPage;
import com.incon.common.pub.pubBj.service.PubBjService;
import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.UserEntity;
@SuppressWarnings("all")
@Controller
@RequestMapping("/pubBj")
public class PubBjController {
	@Resource(name="pubBjService")
	private PubBjService pubBjService;
	/**
	 * 查询班级
	 * @param model
	 * @param pubBjPage
	 * @param session
	 * @param map
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/queryPubBj")
	public Object queryPubBj(Model model,PubBjPage pubBjPage,HttpSession session,HashMap map){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		List<Map> bjList = null;
		try{
			pubBjPage.setGljb(userEntity.getGljb());//管理级别
			pubBjPage.setYhdm(userEntity.getYhdm());//登录用户名
			if(userEntity.getSfcjgly() == null || userEntity.getSfcjgly().trim().equals("")){//是否超级管理员
				pubBjPage.setSfcjgly("0");			
			}else{
				pubBjPage.setSfcjgly(userEntity.getSfcjgly());
			}
			pubBjPage.setJsdm(userEntity.getJsdm());//角色代码
			 bjList = pubBjService.queryPubBj(map);
			model.addAttribute("bjList",bjList);
			
		}catch(Exception e){
			System.err.println("queryBjgl操作失败!!");
			e.printStackTrace();
		}
		return bjList;
	}
	
	
}

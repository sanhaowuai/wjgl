package com.incon.common.pub.pubJs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.common.pub.pubJs.page.PubJsPage;
import com.incon.common.pub.pubJs.service.PubJsService;
import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.UserEntity;;
@SuppressWarnings("all")
@Controller
@RequestMapping("/pubJs")
public class PubJsController {

	@Resource(name="pubJsService")
	private PubJsService pubJsService;
	
	/**
	 * 查询教师
	 * @param model
	 * @param pubJsPage
	 * @param session
	 * @param map
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/queryPubJs")
	public Object queryPubJs(Model model,PubJsPage pubJsPage,HttpSession session,HashMap map){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		List<Map> jsList= null;
		try{
			pubJsPage.setGljb(userEntity.getGljb());//管理级别
			pubJsPage.setYhdm(userEntity.getYhdm());//登录用户名
			if(userEntity.getSfcjgly() == null || userEntity.getSfcjgly().trim().equals("")){//是否超级管理员
				pubJsPage.setSfcjgly("0");			
			}else{
				pubJsPage.setSfcjgly(userEntity.getSfcjgly());
			}
			pubJsPage.setJsdm(userEntity.getJsdm());//角色代码
			Map map1 = new HashMap();
			map1.put("jsdm", userEntity.getJsdm());
			map1.put("yhdm", userEntity.getYhdm());
			int jysCount = pubJsService.queryJyssjqxCount(map);
			if(jysCount>0){
				pubJsPage.setResultCount("1");
			}else{
				pubJsPage.setResultCount("0");
			}
			//教师列表
			jsList = pubJsService.queryPubJs(map);
			model.addAttribute("jsList", jsList);
		
		}catch(Exception e){
			System.err.println("queryPubJs操作失败!!");
			e.printStackTrace();
		}
		return jsList;
	}
	
}

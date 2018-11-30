package com.incon.common.pub.pubJys.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.common.pub.pubJys.page.PubJysPage;
import com.incon.common.pub.pubJys.service.PubJysService;
import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.UserEntity;
@SuppressWarnings("all")
@Controller
@RequestMapping("/pubJys")
public class PubJysController {
	
	@Resource(name="pubJysService")
	private PubJysService pubJysService;
	
	/**
	 * 查询教研室
	 * @param model
	 * @param pubJysPage
	 * @param session
	 * @param map
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/queryPubJys")
	public Object queryPubJys(Model model,PubJysPage pubJysPage,HttpSession session,HashMap map){
		//教研室列表
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		List<Map> jysList = null;
		try{
			pubJysPage.setGljb(userEntity.getGljb());//管理级别
			pubJysPage.setYhdm(userEntity.getYhdm());//登录用户名
			if(userEntity.getSfcjgly() == null || userEntity.getSfcjgly().trim().equals("")){//是否超级管理员
				pubJysPage.setSfcjgly("0");			
			}else{
				pubJysPage.setSfcjgly(userEntity.getSfcjgly());
			}
			pubJysPage.setJsdm(userEntity.getJsdm());//角色代码
			Map map1 = new HashMap();
			map1.put("jsdm", userEntity.getJsdm());
			map1.put("yhdm", userEntity.getYhdm());
			int jysCount = pubJysService.queryJyssjqxCount(map);
			if(jysCount>0){
				pubJysPage.setResultCount("1");
			}else{
				pubJysPage.setResultCount("0");
			}
			jysList = pubJysService.queryPubJys(pubJysPage);
			model.addAttribute("jysList",jysList);
		}catch(Exception e){
			System.err.println("queryPubJys操作失败!!");
			e.printStackTrace();
		}
		return jysList;
	}
	
	
}

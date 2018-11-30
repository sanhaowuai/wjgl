package com.incon.common.pub.pubYx.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.common.pub.pubYx.page.PubYxPage;
import com.incon.common.pub.pubYx.service.PubYxService;
import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.UserEntity;
@SuppressWarnings("all")
@Controller
@RequestMapping("/pubYx")
public class PubYxController {
	
	@Resource(name="pubYxService")
	private PubYxService pubYxService;
	
	/**
	 * 查询院系
	 * @param model
	 * @param pubYxPage
	 * @param session
	 * @param map
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/queryPubYx")
	public Object queryPubYx(Model model,PubYxPage pubYxPage,HttpSession session,HashMap map){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		List<Map> yxList = null;
		List<Map> xList = null;
		try{
			pubYxPage.setGljb(userEntity.getGljb());//管理级别
			pubYxPage.setYhdm(userEntity.getYhdm());//登录用户名
			if(userEntity.getSfcjgly() == null || userEntity.getSfcjgly().trim().equals("")){//是否超级管理员
				pubYxPage.setSfcjgly("0");			
			}else{
				pubYxPage.setSfcjgly(userEntity.getSfcjgly());
			}
			pubYxPage.setJsdm(userEntity.getJsdm());//角色代码
			yxList = pubYxService.queryPubYx(pubYxPage);//院的集合
			model.addAttribute("yxList", yxList);
		
		} catch (Exception e){
			System.err.println("queryPubYx操作失败!!");
			e.printStackTrace();
		}
		return yxList;
	}
	/**
	 * 查询系
	 * @param model
	 * @param pubYxPage
	 * @param session
	 * @param yxdm
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/queryPubX")
	public Object queryPubX(Model model,PubYxPage pubYxPage,HttpSession session,String yxdm){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		List<Map> xList = null;
		try{
			pubYxPage.setGljb(userEntity.getGljb());//管理级别
			pubYxPage.setYhdm(userEntity.getYhdm());//登录用户名
			if(userEntity.getSfcjgly() == null || userEntity.getSfcjgly().trim().equals("")){//是否超级管理员
				pubYxPage.setSfcjgly("0");			
			}else{
				pubYxPage.setSfcjgly(userEntity.getSfcjgly());
			}
			pubYxPage.setJsdm(userEntity.getJsdm());//角色代码
			pubYxPage.setGljb(userEntity.getGljb());//管理级别
			
			xList = pubYxService.queryPubX(yxdm);//系的集合
			model.addAttribute("xList", xList);
		} catch (Exception e){
			System.err.println("queryPubYx操作失败!!");
			e.printStackTrace();
		}
		return xList;
	}
	
}

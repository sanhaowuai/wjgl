package com.incon.project.common.yxgl.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.junit.runners.Parameterized.Parameter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.XyzybEntity;
import com.incon.pojo.common.YxdmbEntity;
import com.incon.pojo.common.ZybEntity;
import com.incon.project.common.yxgl.page.YxglPage;
import com.incon.project.common.yxgl.service.YxglService;

/**
 * 
 * @类名：  com.incon.project.common.yxgl.controller.YxglController
 * @日期： 
 * @修改人：
 * @日期：
 * @描述：  院系管理
 * @版本号：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/yxgl")
public class YxglController {

	@Resource(name="yxglService")
	private YxglService yxglService;
	
	/**
	 * 查询院系管理
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("queryYxgl")
	public String queryYxgl(Model model,YxglPage yxglPage,HttpSession session){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		//班级列表
		try{
			yxglPage.setYhdm(userEntity.getYhdm());//登录用户名
			UserEntity user = yxglService.queryUser(userEntity);
			if(user.getSfcjgly() == null || user.getSfcjgly().isEmpty()){//是否超级管理员
				yxglPage.setSfcjgly("0");			
			}else{
				yxglPage.setSfcjgly(user.getSfcjgly());
			}
			yxglPage.setGljb(user.getGljb());//管理级别
			yxglPage.setJsdm(user.getJsdm());//角色代码
			
			List<YxdmbEntity> yxlist = yxglService.query(yxglPage);
			List<Map> sjyxlist = yxglService.querySjyxList();
			List<Map> xjsllist = yxglService.queryXjslList();
			
			model.addAttribute("yxlist", yxlist);
			model.addAttribute("sjyxlist", sjyxlist);
			model.addAttribute("xjsllist", xjsllist);
		} catch (Exception e) {
			System.err.println("queryYxgl操作失败!!");
			e.printStackTrace();
		}
		return "commons/xygl/xygl";
	}
	
	/**
	 * 查询是否管理部门
	 * @param xydm
	 * @return
	 */
	@RequestMapping("querySfglbm")
	@ResponseBody
	public String querySfglbm(YxdmbEntity yxdmbEntity){
		String sfglbm = "";
		try {
			YxdmbEntity yxdmb = yxglService.querySfglbm(yxdmbEntity);
			if(yxdmb == null){
				sfglbm = "";
			}else{
				sfglbm = yxdmb.getSfglbm();
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("querySfglbm操作失败!!");
		}
		
		return sfglbm;
	}
		
	/**
	 * 增加或修改
	 * @param
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addOrUpdYx")
	public String addOrUpdYx(YxdmbEntity yxdmbEntity,String zt,HttpSession session){
		try {
			UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
			
			
			if(zt.equals("1")){		//增加
				yxglService.addYx(yxdmbEntity);
				if(yxdmbEntity.getSjyxdm().equals("0")){//是上级部门的话，必须保证是管理部门
					yxdmbEntity.setSfglbm("1");
				}
				if(yxdmbEntity.getSfglbm().equals("1")){
					yxdmbEntity.setJsdm(userEntity.getJsdm());
					yxdmbEntity.setYhdm(userEntity.getYhdm());
					yxglService.addSjqx(yxdmbEntity);
				}
			}else{					//修改
				yxglService.updYx(yxdmbEntity);
			}
		} catch (Exception e) {
			System.err.println("addOrUpdYx操作失败!!");
			e.printStackTrace();
		}
		 return null;
	}
	/**
	 * 查询一个院系信息
	 * @param yxdm
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryOneYx")
	public YxdmbEntity queryOneYx(String yxdm){
		YxdmbEntity yxdmbEntity=null;
		try{
			yxdmbEntity=yxglService.queryOneYx(yxdm);
		}catch(Exception e){
			System.err.println("queryOneYx操作失败!!");
			e.printStackTrace();
		}
		return yxdmbEntity;
	}
	/**
	 * 查询yxdm是否重复
	 * @param yxdm
	 * @param 1:增加		2:修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryByYxdmCount")
	public Boolean queryByYxdmCount(String yxdm,String zt){
		Boolean bo = false;
		try {
			if(zt.equals("1")){
				bo =yxglService.queryByYxdmCount(yxdm) == 0 ? true : false;
			}else{
				bo = yxglService.queryByYxdmCount(yxdm) == 1 ? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByYxdmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
	
	/**
	 * 删除院系
	 * @param session
	 * @param ret
	 * @return
	 */
	@ResponseBody
	@RequestMapping("delYx")
	public String delYx(String[] ids){
		try {
			yxglService.delYx(ids);
		} catch (Exception e) {
			System.err.println("delYx操作失败!!");
			e.printStackTrace();
		}
    	return null;
	}
		
	
	/****************************************************************************************************
	 * 查询专业管理
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("queryZy")
	public String queryZy(Model model,String  yxdm,String dmmc){//**************************************************
		try {
			Map<String ,String> map = new HashMap<String,String>();
			map.put("YXDM", yxdm);
			map.put("DMMC",dmmc);
			
			List<ZybEntity> zylist = yxglService.queryZy(map);//***************************************************			
			model.addAttribute("zylist", zylist);
			model.addAttribute("YXDM", yxdm);
			model.addAttribute("DMMC", dmmc);
		} catch (Exception e) {
			System.err.println("queryZy操作失败!!");
			e.printStackTrace();
		}
		return "commons/xygl/query_zy";
	}

	/**
	 * 添加院系
	 */
	@ResponseBody
	@RequestMapping("addXyzyb")
	public String addXyzyb(@RequestParam(value="xydm" ,required=false ) String xydm,
			@RequestParam(value="ids" ,required=false ) String[] ids){
		List<XyzybEntity> list = new ArrayList<XyzybEntity>();
		XyzybEntity xyzybEntity = null;
		try {
				if(ids!=null){
				for(int i = 0;i < ids.length;i++){
					xyzybEntity = new XyzybEntity();
					xyzybEntity.setXydm(xydm);
					xyzybEntity.setZydm(ids[i]);
					list.add(xyzybEntity);
					
				}}
				yxglService.addXyzyb(xydm, list);
		} catch (Exception e) {
			System.err.println("addXyzyb操作失败!!");
			e.printStackTrace();
		}
		return "success";
	}
}


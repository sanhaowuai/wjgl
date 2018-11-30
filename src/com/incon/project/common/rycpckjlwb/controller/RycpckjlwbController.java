package com.incon.project.common.rycpckjlwb.controller;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.pojo.common.rycpckjlwb.RycpckjlwbEntity;
import com.incon.project.common.rycpckjlwb.page.RycpckjlwbPage;
import com.incon.project.common.rycpckjlwb.page.XtryxzPage;
import com.incon.project.common.rycpckjlwb.service.RycpckjlwbService;

/**
 * 
 * @文件名称: RycpckjlwbController.java
 * @类功能说明：   人员磁盘空间例外表_功能
 * @类路径: com.incon.project.common.rycpckjlwb.controller  
 * @描述: TODO
 * @作者: 高阳
 * @时间：2016-9-2 上午10:12:36 
 * @类修改者：  
 * @修改日期：  
 * @修改说明： 
 * @版本：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/rycpckjlwb")
public class RycpckjlwbController {
	
	@Resource(name="rycpckjlwbService")
	private RycpckjlwbService rycpckjlwbService;
	
	
	/**
	 * 查询 人员磁盘空间例外表（列表页） 
	 * @param model
	 * @param page
	 * @return
	 */
	@RequestMapping("/queryRycpckjlwb")
	public String queryRycpckjlwb(Model model,RycpckjlwbPage page){
		try {
			List<RycpckjlwbEntity> list=rycpckjlwbService.query(page);
			model.addAttribute("list", list);
			model.addAttribute("page", page);
		} catch (Exception e) {
			// TODO: handle exception
			
		}
		return "commons/rycpckjlwb/rycpckjlwb";
	}
	
	/**
	 * 修改是查询出一个（ 人员磁盘空间例外表）
	 * @param yhdm 用户代码
	 * @param yylx 应用类型
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/queryRycpckjlwbOne")
	public RycpckjlwbEntity queryRycpckjlwbOne(String yhdm,String yylx){
		RycpckjlwbEntity entity=new RycpckjlwbEntity();
		try {
			entity=rycpckjlwbService.queryRycpckjlwbOne(yhdm,yylx);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return entity;
	}
	
	/**
	 * 添加或修改
	 * @param zt 状态1添加， 2修改；
	 * @param entity 人员磁盘空间例外表实体
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/addorupdRycpckjlwb")
	public String addorupdRycpckjlwb(String zt,RycpckjlwbEntity entity ){		
		try {
			int sf=rycpckjlwbService.isExFAdd(entity);
			if(zt.equals("1")){
				if(sf > 0){
					return "3";
				}
				rycpckjlwbService.addRycpckjlwb(entity);
			}else if(zt.equals("2")){
				rycpckjlwbService.updRycpckjlwb(entity);
			}			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "2";
		}		
		return "1";
	}
	
	/**
	 * 删除 人员磁盘空间例外表
	 * @param yhdm 用户代码
	 * @param yylx 应用类型
	 * @return
	 */	
	@ResponseBody
	@RequestMapping("/delRycpckjlwb")
	public String delRycpckjlwb(String yhdm,String yylx){
		try {
			rycpckjlwbService.delRycpckjlwb(yhdm,yylx);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "2";
		}
		return "1";
	}
	
	/**********************    查询xt_dlb  开始     ***********************/	
	@RequestMapping("queryXtryxz")
	public String queryXtryxz(Model model,XtryxzPage page){		
		try {
			List<Map<String,String>> list = rycpckjlwbService.query(page);			
			model.addAttribute("list", list);
			model.addAttribute("xtryxzPage", page);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return "commons/rycpckjlwb/yhxz";
	}
	
	/**********************    查询xt_dlb  结束     ***********************/
}

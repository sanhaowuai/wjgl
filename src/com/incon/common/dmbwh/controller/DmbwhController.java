package com.incon.common.dmbwh.controller;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.common.dmbwh.page.DmbwhPage;
import com.incon.common.dmbwh.service.DmbwhService;
import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.UserEntity;

@Controller
@RequestMapping("/dmbwh")
@SuppressWarnings("all")
/**
 * 代码表维护
 * 赵恒
 * 2016年12月2日
 */
public class DmbwhController {
 
	@Resource(name="dmbwhService")
	private DmbwhService dmbwhService;  
	/**
	 * 代码表维护列表
	 * @param session
	 * @param model
	 * @param zjbgwhPage
	 * @return
	 */
	@RequestMapping("/dmbwhList")
	public String queryJsxxgl(HttpSession session,Model model,DmbwhPage dmbwhPage){
		List<Map<String,String>> mapList=dmbwhService.query(dmbwhPage);
		model.addAttribute("mapList", mapList);
		model.addAttribute("dmbwhPage", dmbwhPage);
		return "commons/dmbwh/dmbwhList";
	}
	
	/**
	 * 代码表维护添加跳转
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/dmbwhAdd")
	public String dmbwhAdd(HttpSession session,Model model){	
		return "commons/dmbwh/dmbwhAdd";
	}
	/**
	 * 添加保存
	 * @param session
	 * @param model
	 * @param tablename
	 * @param dm
	 * @param mc
	 * @return
	 */
	@RequestMapping("/saveAddDmbwh")
	@ResponseBody
	public String saveAddDmbwh(HttpSession session,Model model,String tablename,String dm,String mc){	
		String res = "0";
		Map map = new HashMap();
		String tablenameU = tablename.toUpperCase();
		String dmU = dm.toUpperCase();
		String mcU = mc.toUpperCase();
		//查询tablename时否存在
		int temp = dmbwhService.queryByTableName(tablenameU);
		//是否存在于系统表中
		int tabExist = dmbwhService.queryTabExist(tablenameU);
		//此表是否存在字段及字段名
		map.put("tablename", tablenameU);
		map.put("dm", dmU);
		map.put("mc", mcU);
		int colExist = dmbwhService.queryColExist(map);
		//存在
		if(temp>0){
			res = "2";
		}else if(tabExist<1){
			//此表不存在于系统表
			res = "3";
		}else if(colExist!=2){
			//字段或字段名错误，不存在于系统表中
			res = "4";
		}else{
			try{
				//添加
				dmbwhService.insert("dmbwh.saveAddDmbwh", map);
				res = "1";
			}catch(Exception e){
				res = "0";
				e.printStackTrace();
			}
		}
		return res;
	}
	/**
	 * 代码表维护添加跳转
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/dmbwhEdit")
	public String dmbwhEdit(HttpSession session,Model model,String tablename){	
		//根据tablename获取数据
		List<Map<String,String>> mapList = dmbwhService.query("dmbwh.queryEntity", tablename); 
		Map map = new HashMap();
		if(mapList.size()>0){
			map = mapList.get(0);
		}
		model.addAttribute("map", map);
		return "commons/dmbwh/dmbwhEdit";
	}
	/**
	 * 修改保存
	 * @param session
	 * @param model
	 * @param tablename
	 * @param dm
	 * @param mc
	 * @return
	 */
	@RequestMapping("/saveEditDmbwh")
	@ResponseBody
	public String saveEditDmbwh(HttpSession session,Model model,String tablename,String dm,String mc){	
		String res = "0";
		Map map = new HashMap();
		String dmU = dm.toUpperCase();
		String mcU = mc.toUpperCase();
		map.put("tablename", tablename);
		map.put("dm", dmU);
		map.put("mc", mcU);
		int colExist = dmbwhService.queryColExist(map);
		try{
			if(colExist!=2){
				res = "2";
			}else{
				//修改
				dmbwhService.update("dmbwh.updateAddDmbwh", map);
				res = "1";
			}
		}catch(Exception e){
			res = "0";
			e.printStackTrace();
		}
		return res;
	}
	/**
	 * 删除列表信息
	 * @param ids
	 * @return
	 */
	@RequestMapping("/delDmbwh")
	@ResponseBody
	public String delDmbwh(String[] ids){
		return dmbwhService.delDmbwh(ids);
	}
}

package com.incon.project.common.shoujcd.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.RzEntity;
import com.incon.pojo.common.ZxtbEntity;
import com.incon.pojo.common.ZybEntity;
import com.incon.pojo.common.shoujcd.PtappqxbEntity;
import com.incon.project.common.rzgl.page.RzPage;
import com.incon.project.common.rzgl.service.RzService;
import com.incon.project.common.shoujcd.page.ShoujcdPage;
import com.incon.project.common.shoujcd.service.ShoujcdService;


@SuppressWarnings("all")
@Controller
@RequestMapping("/shoujcd")
public class ShoujcdController {
	
	@Resource(name="shoujcdService")
	public ShoujcdService shoujcdService;
	
	@RequestMapping("/queryQxb")
	public String queryQxb(Model model,ShoujcdPage page){
		try {
			
			List<PtappqxbEntity> cdList=shoujcdService.query(page);			
			List<Map<String, String>> zxtList=shoujcdService.queryByZxt();
			model.addAttribute("cdList", cdList);
			model.addAttribute("zxtList", zxtList);
			model.addAttribute("page", page);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "commons/shoujcd/shoujcd";
	}
	/**
	 * 增加或修改专业
	 * @param zybEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addOrUpdQx")
	public String addOrUpdQx(PtappqxbEntity entity,String zt){
		try {
			if(zt.equals("1")){		//增加
				shoujcdService.addQxb(entity);
			}else{					//修改
				shoujcdService.updQxb(entity);
			}
		} catch (Exception e) {
			System.err.println("addOrUpdQx操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 查询一个信息
	 * @param zydm
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryOneQx")
	
	public PtappqxbEntity queryOneQx(String qxdm){
		PtappqxbEntity entity=new PtappqxbEntity();
		try{
			entity=shoujcdService.queryByIdQxb(qxdm);
		}catch(Exception e){
			System.err.println("queryOneQx操作失败!!");
			e.printStackTrace();
		}
		return entity;
	}
	

	/**
 	 * 删除
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delQx")
    public String delQx(String[] ids){
		String falg="";
		try {
			shoujcdService.delQxb(ids);
			falg="1";
		} catch (Exception e) {
			falg="0";
			System.err.println("delQx操作失败!!");
			e.printStackTrace();
		}
    	return falg;
    }
	
	/************************************************ 2016.9.1 安智博创建 begin ************************************************/
	/**
	 * 查询app菜单
	 */
	@RequestMapping("queryAppCdsq")
	public String queryAppCdsq(Model model, String jsdm, PtappqxbEntity param) {
		try {
			List<ZxtbEntity> zxtList = shoujcdService.querySjZxtList();
			if (param.getWz() == null) {
				param.setWz("L");
			}
			List<PtappqxbEntity> list = shoujcdService.querySjcdList(param);
			model.addAttribute("zxtList", zxtList);
			model.addAttribute("list", list);
			model.addAttribute("jsdm", jsdm);
			model.addAttribute("param", param);
		} catch (Exception e) {
			System.err.println("执行：queryAppCdsq() 失败");
			e.printStackTrace();
		}
		return "commons/juesgl/appcdsq";
	}
	/**
	 * 查询是否重复
	 * @param zydm
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryByQxdmCount")
	public Boolean queryByQxdmCount(String qxdm,String zt){
		Boolean bo = false;
		try {
			if(zt.equals("1")){
				bo = shoujcdService.queryByIdQxbCount(qxdm) == 0? true:false;
			}else {
				bo = shoujcdService.queryByIdQxbCount(qxdm) == 1? true:false;
			}
		} catch (Exception e) {
			System.err.println("queryByQxdmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
	
	/**
	 * 添加app授权
	 * @param jsdm
	 * @param qxdm
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addAppsq")
	public int addAppsq(String[] qxdm, PtappqxbEntity entity) {
		try {
			shoujcdService.addAppsq(qxdm, entity);
		} catch (Exception e) {
			System.err.println("执行：addAppsq() 失败");
			e.printStackTrace();
			return -1;
		}
		return 1;
	}
	/************************************************* 2016.9.1 安智博创建 end *************************************************/
}

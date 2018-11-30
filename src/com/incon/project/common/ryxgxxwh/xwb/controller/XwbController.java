package com.incon.project.common.ryxgxxwh.xwb.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.pojo.common.ryxgxxwh.XwbEntity;
import com.incon.pojo.common.ryxgxxwh.XwlbbEntity;
import com.incon.project.common.ryxgxxwh.xwb.page.XwbPage;
import com.incon.project.common.ryxgxxwh.xwb.service.XwbService;

/**
 * @类名：com.incon.project.common.ryxgxxwh.xwb.controller.XwbController
 * @作者：马爽
 * @时间：2014-4-1
 * @版本：
 * @描述：
 * @修改人员：
 * @修改时间：2014-4-1
 * @修改说明：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/xwbgl")
public class XwbController {
	@Resource(name="xwbService")
	private XwbService xwbService;
	/**
	 * 查询学位
	 * @param model
	 * @param xwbPage
	 * @return
	 */
	@RequestMapping("queryXw")
	public String queryXw(Model model,XwbPage xwbPage){
		try {
			List<XwbEntity> xwList =xwbService.query(xwbPage);
			model.addAttribute("xwList",xwList);
			List<XwlbbEntity> xwlbList = xwbService.queryWblbb();
			model.addAttribute("xwlbList",xwlbList);
		} catch (Exception e) {
			System.err.println("queryXw操作失败!!");
			e.printStackTrace();
		}
		return "commons/ryxgxxwh/xwbgl";	
	}
	/**
	 * 增加或修改学位
	 * @param xwbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addOrUpdXw")
	public String addOrUpdXw(XwbEntity xwbEntity,String zt){
		try {
			if(zt.equals("1")){//增加
				xwbService.addXw(xwbEntity);
			}else{
				xwbService.updXwByDm(xwbEntity);
			}
		} catch (Exception e) {
			System.err.println("addOrUpdXw操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	/**
 	 * 查询一条学位
 	 * @param dm
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("queryXwByDm")
	public XwbEntity queryXwByDm(String dm){
		XwbEntity xwbEntity = null;
		try {
			xwbEntity=xwbService.queryXwByDm(dm);
		} catch (Exception e) {
			System.err.println("queryJgByDm操作失败!!");
			e.printStackTrace();
		}
		return xwbEntity;
	}
	/**
 	 * 删除学位
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delXw")
	public String delXw(String ids[]){
		try {
			xwbService.delXw(ids);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 查询dm是否重复
	 * @param dm
	 * @param 1:增加		2:修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryByDmCount")
	public Boolean queryByDmCount(String dm,String zt){
		Boolean bo = false;
		try {
			if(zt.equals("1")){
				bo = xwbService.queryByDmCount(dm) == 0? true : false;
			}else{
				bo = xwbService.queryByDmCount(dm) == 1? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByDmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
}


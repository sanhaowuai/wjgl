package com.incon.project.common.ryxgxxwh.xwlbb.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.pojo.common.ryxgxxwh.XwlbbEntity;
import com.incon.project.common.ryxgxxwh.xwlbb.page.XwlbbPage;
import com.incon.project.common.ryxgxxwh.xwlbb.service.XwlbbService;


/**
 * @类名：com.incon.project.common.ryxgxxwh.xwlbb.controller.XwlbController
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
@RequestMapping("/xwlbbgl")
public class XwlbController {
	@Resource(name="xwlbbService")
	private XwlbbService xwlbbService;
	/**
	 * 查询学位类别
	 * @param model
	 * @param xwlbbPage
	 * @return
	 */
	@RequestMapping("queryXwlb")
	public String queryXwlb(Model model,XwlbbPage xwlbbPage){
		try {
			List<XwlbbEntity> xwlbList = xwlbbService.query(xwlbbPage);
			model.addAttribute("xwlbList",xwlbList);
		} catch (Exception e) {
			System.err.println("queryXwlb操作失败!!");
			e.printStackTrace();
		}
		return "commons/ryxgxxwh/xwlbbgl";		
	}
	/**
	 * 增加或修改学位类别
	 * @param xwlbbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addOrUpdXwlb")
	public String addOrUpdXwlb(XwlbbEntity xwlbbEntity,String zt){
		try {
			if(zt.equals("1")){//增加
				xwlbbService.addXwlb(xwlbbEntity);
			}else{
				xwlbbService.updXwlbByDm(xwlbbEntity);
			}
		} catch (Exception e) {
			System.err.println("addOrUpdXwlb操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	/**
 	 * 查询一条学位类别
 	 * @param dm
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("queryXwlbByDm")
	public XwlbbEntity queryXwlbByDm(String dm){
		XwlbbEntity xwlbbEntity = null;
		try {
			xwlbbEntity=xwlbbService.queryXwlbByDm(dm);
		} catch (Exception e) {
			System.err.println("queryXwlbByDm操作失败!!");
			e.printStackTrace();
		}
		return xwlbbEntity;
	}
	/**
 	 * 删除学位类别
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delXwlb")
	public String delXwlb(String ids[]){
		try {
			xwlbbService.delXwlb(ids);
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
				bo = xwlbbService.queryByDmCount(dm) == 0? true : false;
			}else{
				bo = xwlbbService.queryByDmCount(dm) == 1? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByDmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
}


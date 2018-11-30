package com.incon.project.common.ryxgxxwh.xbb.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.pojo.common.ryxgxxwh.XbbEntity;
import com.incon.project.common.ryxgxxwh.xbb.page.XbbPage;
import com.incon.project.common.ryxgxxwh.xbb.service.XbbService;

/**
 * @类名：com.incon.project.common.ryxgxxwh.xbb.controller.XbbController
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
@RequestMapping("/xbbgl")
public class XbbController {
	@Resource(name="xbbService")
	private XbbService xbbService;
	/**
	 * 查询性别
	 * @param model
	 * @param xbbPage
	 * @return
	 */
	@RequestMapping("queryXb")
	public String queryXb(Model model,XbbPage xbbPage){
		try {
			List<XbbEntity> xbList = xbbService.query(xbbPage);
			model.addAttribute("xbList",xbList);
		} catch (Exception e) {
			System.err.println("queryXb操作失败!!");
			e.printStackTrace();
		}
		return "commons/ryxgxxwh/xbbgl";	
	}
	/**
	 * 增加或修改性别
	 * @param xbbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addOrUpdXb")
	public String addOrUpdXb(XbbEntity xbbEntity,String zt){
		try {
			if(zt.equals("1")){//增加
				xbbService.addXb(xbbEntity);
			}else{
				xbbService.updXbByDm(xbbEntity);
			}
		} catch (Exception e) {
			System.err.println("addOrUpdXb操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	/**
 	 * 查询一条性别
 	 * @param dm
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("queryXbByDm")
	public XbbEntity queryXbByDm(String dm){
		XbbEntity xbbEntity = null;
		try {
			xbbEntity=xbbService.queryXbByDm(dm);
		} catch (Exception e) {
			System.err.println("queryXbByDm操作失败!!");
			e.printStackTrace();
		}
		return xbbEntity;
	}
	/**
 	 * 删除籍贯
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delXb")
	public String delXb(String ids[]){
		try {
			xbbService.delXb(ids);
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
				bo = xbbService.queryByDmCount(dm) == 0? true : false;
			}else{
				bo = xbbService.queryByDmCount(dm) == 1? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByDmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
}

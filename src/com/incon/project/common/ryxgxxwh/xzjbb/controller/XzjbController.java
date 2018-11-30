package com.incon.project.common.ryxgxxwh.xzjbb.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.pojo.common.ryxgxxwh.XzjbbEntity;
import com.incon.project.common.ryxgxxwh.xzjbb.page.XzjbbPage;
import com.incon.project.common.ryxgxxwh.xzjbb.service.XzjbbService;

/**
 * @类名：com.incon.project.common.ryxgxxwh.xzjbb.controller.XzjbController
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
@RequestMapping("/xzjbbgl")
public class XzjbController {
	@Resource(name="xzjbbService")
	private XzjbbService xzjbbService;
	/**
	 * 查询行政级别
	 * @param model
	 * @param xzjbbPage
	 * @return
	 */
	@RequestMapping("queryXzjb")
	public String queryXzjb(Model model,XzjbbPage xzjbbPage){
		try {
			List<XzjbbEntity> xzjbList = xzjbbService.query(xzjbbPage);
			model.addAttribute("xzjbList",xzjbList);
		} catch (Exception e) {
			System.err.println("queryXzjb操作失败!!");
			e.printStackTrace();
		}
		return "commons/ryxgxxwh/xzjbbgl";	
	}
	/**
	 * 增加或修改行政级别
	 * @param xzjbbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addOrUpdXzjb")
	public String addOrUpdJg(XzjbbEntity xzjbbEntity,String zt){
		try {
			if(zt.equals("1")){//增加
				xzjbbService.addXzjb(xzjbbEntity);
			}else{
				xzjbbService.updXzjbByDm(xzjbbEntity);
			}
		} catch (Exception e) {
			System.err.println("addOrUpdXzjb操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	/**
 	 * 查询一条行政级别
 	 * @param dm
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("queryXzjbByDm")
	public XzjbbEntity queryXzjbByDm(String dm){
		XzjbbEntity xzjbbEntity = null;
		try {
			xzjbbEntity=xzjbbService.queryXzjbByDm(dm);
		} catch (Exception e) {
			System.err.println("queryXzjbByDm操作失败!!");
			e.printStackTrace();
		}
		return xzjbbEntity;
	}
	/**
 	 * 删除行政级别
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delXzjb")
	public String delXzjb(String ids[]){
		try {
			xzjbbService.delXzjb(ids);
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
				bo = xzjbbService.queryByDmCount(dm) == 0? true : false;
			}else{
				bo = xzjbbService.queryByDmCount(dm) == 1? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByDmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
}


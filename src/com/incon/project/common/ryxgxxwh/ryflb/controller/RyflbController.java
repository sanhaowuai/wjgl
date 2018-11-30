package com.incon.project.common.ryxgxxwh.ryflb.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.pojo.common.ryxgxxwh.RyflbEntity;
import com.incon.project.common.ryxgxxwh.ryflb.page.RyflbPage;
import com.incon.project.common.ryxgxxwh.ryflb.service.RyflbService;

/**
 * @类名：com.incon.project.common.ryxgxxwh.ryflb.controller.RyflbController
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
@RequestMapping("/ryflbgl")
public class RyflbController {
	@Resource(name="ryflbService")
	private RyflbService ryflbService;
	/**
	 * 查询籍贯
	 * @param model
	 * @param ryflbPage
	 * @return
	 */
	@RequestMapping("queryRyfl")
	public String queryJg(Model model,RyflbPage ryflbPage){
		try {
			List<RyflbEntity> ryflList =ryflbService.query(ryflbPage);
			model.addAttribute("ryflList",ryflList);
		} catch (Exception e) {
			System.err.println("queryRyfl操作失败!!");
			e.printStackTrace();
		}
		return "commons/ryxgxxwh/ryflbgl";	
	}
	/**
	 * 增加或修改籍贯
	 * @param jgbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addOrUpdRyfl")
	public String addOrUpdRyfl(RyflbEntity ryflbEntity,String zt){
		try {
			if(zt.equals("1")){//增加
				ryflbService.addRyfl(ryflbEntity);
			}else{
				ryflbService.updRyflByDm(ryflbEntity);
			}
		} catch (Exception e) {
			System.err.println("addOrUpdRyfl操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	/**
 	 * 查询一条籍贯
 	 * @param dm
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("queryRyflByDm")
	public RyflbEntity queryRyflByDm(String dm){
		RyflbEntity ryflbEntity = null;
		try {
			ryflbEntity=ryflbService.queryRyflByDm(dm);
		} catch (Exception e) {
			System.err.println("queryRyflByDm操作失败!!");
			e.printStackTrace();
		}
		return ryflbEntity;
	}
	/**
 	 * 删除籍贯
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delRyfl")
	public String delJg(String ids[]){
		try {
			ryflbService.delRyfl(ids);
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
				bo = ryflbService.queryByDmCount(dm) == 0? true : false;
			}else{
				bo = ryflbService.queryByDmCount(dm) == 1? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByDmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
}

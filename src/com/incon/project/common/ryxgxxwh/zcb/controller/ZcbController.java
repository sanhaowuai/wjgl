package com.incon.project.common.ryxgxxwh.zcb.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.pojo.common.ryxgxxwh.ZcbEntity;
import com.incon.project.common.ryxgxxwh.zcb.page.ZcbPage;
import com.incon.project.common.ryxgxxwh.zcb.service.ZcbService;


/**
 * @类名：com.incon.project.common.ryxgxxwh.zcb.controller.ZcbController
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
@RequestMapping("/zcbgl")
public class ZcbController {
	@Resource(name="zcbService")
	private ZcbService zcbService;
	/**
	 * 查询职称
	 * @param model
	 * @param zcbPage
	 * @return
	 */
	@RequestMapping("queryZc")
	public String queryZc(Model model,ZcbPage zcbPage){
		try {
			List<ZcbEntity> zcList = zcbService.query(zcbPage);
			model.addAttribute("zcList",zcList);
		} catch (Exception e) {
			System.err.println("queryZc操作失败!!");
			e.printStackTrace();
		}
		return "commons/ryxgxxwh/zcbgl";		
	}
	/**
	 * 增加或修改职称
	 * @param zcbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addOrUpdZc")
	public String addOrUpdZc(ZcbEntity zcbEntity,String zt){
		try {
			if(zt.equals("1")){//增加
				zcbService.addZc(zcbEntity);
			}else{
				zcbService.updZcByDm(zcbEntity);
			}
		} catch (Exception e) {
			System.err.println("addOrUpdZc操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	/**
 	 * 查询一条职称
 	 * @param dm
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("queryZcByDm")
	public ZcbEntity queryZcByDm(String dm){
		ZcbEntity zcbEntity = null;
		try {
			zcbEntity=zcbService.queryZcByDm(dm);
		} catch (Exception e) {
			System.err.println("queryZcByDm操作失败!!");
			e.printStackTrace();
		}
		return zcbEntity;
	}
	/**
 	 * 删除职称
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delZc")
	public String delZc(String ids[]){
		try {
			zcbService.delZc(ids);
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
				bo = zcbService.queryByDmCount(dm) == 0? true : false;
			}else{
				bo = zcbService.queryByDmCount(dm) == 1? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByDmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
}


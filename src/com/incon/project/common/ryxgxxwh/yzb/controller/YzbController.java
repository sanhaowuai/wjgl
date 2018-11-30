package com.incon.project.common.ryxgxxwh.yzb.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.pojo.common.ryxgxxwh.YzbEntity;
import com.incon.project.common.ryxgxxwh.yzb.page.YzbPage;
import com.incon.project.common.ryxgxxwh.yzb.service.YzbService;

/**
 * @类名：com.incon.project.common.ryxgxxwh.yzb.controller.YzController
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
@RequestMapping("/yzbgl")
public class YzbController {
	@Resource(name="yzbService")
	private YzbService yzbService;
	/**
	 * 查询语种
	 * @param model
	 * @param jgbPage
	 * @return
	 */
	@RequestMapping("queryYz")
	public String queryYz(Model model,YzbPage yzbPage){
		try {
			List<YzbEntity> yzList = yzbService.query(yzbPage);
			model.addAttribute("yzList",yzList);
		} catch (Exception e) {
			System.err.println("queryYz操作失败!!");
			e.printStackTrace();
		}
		return "commons/ryxgxxwh/yzbgl";	
	}
	/**
	 * 增加或修改语种
	 * @param yzbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addOrUpdYz")
	public String addOrUpdYz(YzbEntity yzbEntity,String zt){
		try {
			if(zt.equals("1")){//增加
				yzbService.addYz(yzbEntity);
			}else{
				yzbService.updYzByDm(yzbEntity);
			}
		} catch (Exception e) {
			System.err.println("addOrUpdYz操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	/**
 	 * 查询一条语种
 	 * @param dm
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("queryYzByDm")
	public YzbEntity queryYzByDm(String dm){
		YzbEntity yzbEntity = null;
		try {
			yzbEntity=yzbService.queryYzByDm(dm);
		} catch (Exception e) {
			System.err.println("queryYzByDm操作失败!!");
			e.printStackTrace();
		}
		return yzbEntity;
	}
	/**
 	 * 删除语种
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delYz")
	public String delYz(String ids[]){
		try {
			yzbService.delYz(ids);
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
				bo = yzbService.queryByDmCount(dm) == 0? true : false;
			}else{
				bo = yzbService.queryByDmCount(dm) == 1? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByDmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
}


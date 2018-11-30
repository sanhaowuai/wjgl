package com.incon.project.common.ryxgxxwh.jgb.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.pojo.common.ryxgxxwh.JgbEntity;
import com.incon.project.common.ryxgxxwh.jgb.page.JgbPage;
import com.incon.project.common.ryxgxxwh.jgb.service.JgbService;

/**
 * @类名：com.incon.project.common.ryxgxxwh.jgb.controller.JgbController
 * @作者：马爽
 * @时间：2014-3-31
 * @版本：
 * @描述：
 * @修改人员：
 * @修改时间：2014-3-31
 * @修改说明：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/jgbgl")
public class JgbController {
	@Resource(name="jgbService")
	private JgbService jgbService;
	/**
	 * 查询籍贯
	 * @param model
	 * @param jgbPage
	 * @return
	 */
	@RequestMapping("queryJg")
	public String queryJg(Model model,JgbPage jgbPage){
		try {
			List<JgbEntity> jgList = jgbService.query(jgbPage);
			model.addAttribute("jgList",jgList);
		} catch (Exception e) {
			System.err.println("queryJg操作失败!!");
			e.printStackTrace();
		}
		return "commons/ryxgxxwh/jgbgl";	
	}
	/**
	 * 增加或修改籍贯
	 * @param jgbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addOrUpdJg")
	public String addOrUpdJg(JgbEntity jgbEntity,String zt){
		try {
			if(zt.equals("1")){//增加
				jgbService.addJg(jgbEntity);
			}else{
				jgbService.updJgByDm(jgbEntity);
			}
		} catch (Exception e) {
			System.err.println("addOrUpdJg操作失败!!");
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
	@RequestMapping("queryJgByDm")
	public JgbEntity queryJgByDm(String dm){
		JgbEntity jgbEntity = null;
		try {
			jgbEntity=jgbService.queryJgByDm(dm);
		} catch (Exception e) {
			System.err.println("queryJgByDm操作失败!!");
			e.printStackTrace();
		}
		return jgbEntity;
	}
	/**
 	 * 删除籍贯
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delJg")
	public String delJg(String ids[]){
		try {
			jgbService.delJg(ids);
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
				bo = jgbService.queryByDmCount(dm) == 0? true : false;
			}else{
				bo = jgbService.queryByDmCount(dm) == 1? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByDmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
}

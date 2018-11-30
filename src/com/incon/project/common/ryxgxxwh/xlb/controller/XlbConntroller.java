package com.incon.project.common.ryxgxxwh.xlb.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.pojo.common.ryxgxxwh.XlbEntity;
import com.incon.project.common.ryxgxxwh.xlb.page.XlbPage;
import com.incon.project.common.ryxgxxwh.xlb.service.XlbService;


/**
 * @类名：com.incon.project.common.ryxgxxwh.xlb.controller.XlbConntroller
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
@RequestMapping("/xlbgl")
public class XlbConntroller {
	@Resource(name="xlbService")
	private XlbService xlbService;
	/**
	 * 查询学历
	 * @param model
	 * @param jgbPage
	 * @return
	 */
	@RequestMapping("queryXl")
	public String queryXl(Model model,XlbPage xlbPage){
		try {
			List<XlbEntity> xlList = xlbService.query(xlbPage);
			model.addAttribute("xlList",xlList);
		} catch (Exception e) {
			System.err.println("queryXl操作失败!!");
			e.printStackTrace();
		}
		return "commons/ryxgxxwh/xlbgl";		
	}
	/**
	 * 增加或修改学历
	 * @param xlbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addOrUpdXl")
	public String addOrUpdXl(XlbEntity xlbEntity,String zt){
		try {
			if(zt.equals("1")){//增加
				xlbService.addXl(xlbEntity);
			}else{
				xlbService.updXlByDm(xlbEntity);
			}
		} catch (Exception e) {
			System.err.println("addOrUpdXl操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	/**
 	 * 查询一条学历
 	 * @param dm
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("queryXlByDm")
	public XlbEntity queryXlByDm(String dm){
		XlbEntity xlbEntity = null;
		try {
			xlbEntity=xlbService.queryXlByDm(dm);
		} catch (Exception e) {
			System.err.println("queryXlByDm操作失败!!");
			e.printStackTrace();
		}
		return xlbEntity;
	}
	/**
 	 * 删除学历
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delXl")
	public String delXl(String ids[]){
		try {
			xlbService.delXl(ids);
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
				bo = xlbService.queryByDmCount(dm) == 0? true : false;
			}else{
				bo = xlbService.queryByDmCount(dm) == 1? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByDmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
}

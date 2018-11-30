package com.incon.project.common.ryxgxxwh.whcdb.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.pojo.common.ryxgxxwh.WhcdbEntity;
import com.incon.project.common.ryxgxxwh.whcdb.page.WhcdbPage;
import com.incon.project.common.ryxgxxwh.whcdb.service.WhcdbService;



/**
 * @类名：com.incon.project.common.ryxgxxwh.whcdb.controller.WhcdController
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
@RequestMapping("/whcdbgl")
public class WhcdController {
	@Resource(name="whcdbService")
	private WhcdbService whcdbService;
	/**
	 * 查询籍贯
	 * @param model
	 * @param jgbPage
	 * @return
	 */
	@RequestMapping("queryWhcd")
	public String queryJg(Model model,WhcdbPage whcdbPage){
		try {
			List<WhcdbEntity> whcdList =whcdbService.query(whcdbPage);
			model.addAttribute("whcdList",whcdList);
		} catch (Exception e) {
			System.err.println("queryWhcd操作失败!!");
			e.printStackTrace();
		}
		return "commons/ryxgxxwh/whcdbgl";	
	}
	/**
	 * 增加或修改文化程度
	 * @param jgbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addOrUpdWhcd")
	public String addOrUpdWhcd(WhcdbEntity whcdbEntity,String zt){
		try {
			if(zt.equals("1")){//增加
				whcdbService.addWhcd(whcdbEntity);
			}else{
				whcdbService.updWhcdByDm(whcdbEntity);
			}
		} catch (Exception e) {
			System.err.println("addOrUpdWhcd操作失败!!");
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
	@RequestMapping("queryWhcdByDm")
	public WhcdbEntity queryWhcdByDm(String dm){
		WhcdbEntity whcdbEntity = null;
		try {
			whcdbEntity=whcdbService.queryWhcdByDm(dm);
		} catch (Exception e) {
			System.err.println("queryWhcdByDm操作失败!!");
			e.printStackTrace();
		}
		return whcdbEntity;
	}
	/**
 	 * 删除文化程度
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delWhcd")
	public String delWhcd(String ids[]){
		try {
			whcdbService.delWhcd(ids);
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
				bo = whcdbService.queryByDmCount(dm) == 0? true : false;
			}else{
				bo = whcdbService.queryByDmCount(dm) == 1? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByDmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
}


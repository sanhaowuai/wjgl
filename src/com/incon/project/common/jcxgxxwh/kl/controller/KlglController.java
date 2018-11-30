package com.incon.project.common.jcxgxxwh.kl.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.pojo.common.jcxgxxwh.KlbEntity;
import com.incon.project.common.jcxgxxwh.kl.page.KlglPage;
import com.incon.project.common.jcxgxxwh.kl.service.KlglService;



/**
 * 
 * @类名：  com.incon.project.common.jcxxwh.zylb.controller.ZylbglController
 * @创建人： 杨文龙
 * @日期： 2014-3-11
 * @修改人：
 * @日期：
 * @描述： 科类管理
 * @版本号：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/klgl")
public class KlglController {

	@Resource(name="klglService")
	private KlglService klglService;
	
	@RequestMapping("/queryKlgl")
	public String queryKlgl(Model model,KlbEntity klbEntity,KlglPage klglPage){
		//科类列表
		try{
			List<KlbEntity> klList = klglService.query(klglPage);
			model.addAttribute("klList",klList);
		}catch(Exception e){
			System.err.println("queryKlgl操作失败!!");
			e.printStackTrace();
		}
		return "commons/jcxgxxwh/klgl";
	}
	/**
	 * 增加或修改科类
	 * @param KlbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addKlglSz")
	public String addOrUpdKlgl(KlbEntity klbEntity,String zt){
		try{
			if(zt.equals("1")){
				klglService.addKl(klbEntity);
			}else{
				klglService.updKl(klbEntity);
			}
		}catch(Exception e){
			System.err.println("addOrUpdKlgl操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	/**
 	 * 根据代码查询科类
 	 * @param dm
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("queryKlByDm")
	public KlbEntity queryKlByDm(String dm){
		KlbEntity klbEntity = null;
		try{
			klbEntity = klglService.queryKlByDm(dm);
		}catch(Exception e){
			System.err.println("queryKlByDm操作失败!!");
			e.printStackTrace();
		}
		return klbEntity;
	}
	/**
 	 * 删除科类
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delKl")
	public String delKl(String[] ids){
		try{
			klglService.delKl(ids);
		}catch(Exception e){
			System.err.println("delKl操作失败!!");
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
				bo = klglService.queryByDmCount(dm) == 0 ? true : false;
			}else{
				bo = klglService.queryByDmCount(dm) == 1 ? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByDmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
}

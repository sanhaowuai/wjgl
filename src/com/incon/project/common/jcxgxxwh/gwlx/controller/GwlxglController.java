package com.incon.project.common.jcxgxxwh.gwlx.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.pojo.common.jcxgxxwh.GwlxbEntity;
import com.incon.project.common.jcxgxxwh.gwlx.page.GwlxglPage;
import com.incon.project.common.jcxgxxwh.gwlx.service.GwlxglService;



/**
 * 
 * @类名： com.incon.project.common.jcxgxxwh.gwlx.controller.GwlxglController
 * @创建人： 杨文龙
 * @日期： 2014-3-11
 * @修改人：
 * @日期：
 * @描述：  专业类别管理
 * @版本号：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/gwlxgl")
public class GwlxglController {

	@Resource(name="gwlxglService")
	private GwlxglService gwlxglService;
	
	@RequestMapping("/queryGwlxgl")
	public String queryGwlxgl(Model model,GwlxbEntity gwlxbEntity,GwlxglPage gwlxglPage){
		//专业类别列表
		try{
			List<GwlxbEntity> gwlxList = gwlxglService.query(gwlxglPage);
			model.addAttribute("gwlxList",gwlxList);
		}catch(Exception e){
			System.err.println("queryGwlxgl操作失败!!");
			e.printStackTrace();
		}
		return "commons/jcxgxxwh/gwlxgl";
	}
	/**
	 * 增加或修改岗位类型
	 * @param gwlxbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addGwlxglSz")
	public String addOrUpdGwlxgl(GwlxbEntity gwlxbEntity,String zt){
		try{
			if(zt.equals("1")){
				gwlxglService.addGwlx(gwlxbEntity);
			}else{
				gwlxglService.updGwlx(gwlxbEntity);
			}
		}catch(Exception e){
			System.err.println("addOrUpdGwlxgl操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	/**
 	 * 根据代码查询岗位类型
 	 * @param dm
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("queryGwlxByDm")
	public GwlxbEntity queryGwlxByDm(String dm){
		GwlxbEntity gwlxbEntity = null;
		try{
			gwlxbEntity = gwlxglService.queryGwlxByDm(dm);
		}catch(Exception e){
			System.err.println("queryGwlxByDm操作失败!!");
			e.printStackTrace();
		}
		return gwlxbEntity;
	}
	
	/**
	 * 删除前判断id是否被使用
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping("delBefore")
	public Map delBefore(String ids){
		String mc = "";
		try {
			mc = gwlxglService.queryExit(ids);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("delBefore操作失败!!");
		}
		Map map = new HashMap();
		map.put("mc",mc);
		return map;
	}
	
	/**
 	 * 删除岗位类型
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delGwlx")
	public String delGwlx(String[] ids){
		try{
			gwlxglService.delGwlx(ids);
		}catch(Exception e){
			System.err.println("delGwlx操作失败!!");
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
				bo = gwlxglService.queryByDmCount(dm) == 0 ? true : false;
			}else{
				bo = gwlxglService.queryByDmCount(dm) == 1 ? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByDmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
}

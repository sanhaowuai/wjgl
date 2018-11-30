package com.incon.project.common.ryxgxxwh.gj.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.pojo.common.ryxgxxwh.GjbEntity;
import com.incon.project.common.ryxgxxwh.gj.page.GjglPage;
import com.incon.project.common.ryxgxxwh.gj.service.GjglService;






/**
 * 
 * @类名：  com.incon.project.common.jcxgxxwh.gj.controller.GjglController
 * @创建人： 杨文龙
 * @日期： 2014-4-2
 * @修改人：
 * @日期：
 * @描述：  国籍管理
 * @版本号：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/gjgl")
public class GjglController {

	@Resource(name="gjglService")
	private GjglService gjglService;
	
	@RequestMapping("/queryGjgl")
	public String queryGjgl(Model model,GjbEntity gjbEntity,GjglPage gjglglPage){
		//专业类别列表
		try{
			List<GjbEntity> gjList = gjglService.query(gjglglPage);
			model.addAttribute("gjList",gjList);
		}catch(Exception e){
			System.err.println("queryGjgl操作失败!!");
			e.printStackTrace();
		}
		return "commons/ryxgxxwh/gjgl";
	}
	/**
	 * 增加或修改专业类别
	 * @param zylbbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addGjglSz")
	public String addOrUpdGjgl(GjbEntity gjbEntity,String zt){
		try{
			if(zt.equals("1")){
				gjglService.addGj(gjbEntity);
			}else{
				gjglService.updGj(gjbEntity);
			}
		}catch(Exception e){
			System.err.println("addOrUpdGjgl操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	/**
 	 * 根据代码查询国籍
 	 * @param dm
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("queryGjByDm")
	public GjbEntity queryGjByDm(String dm){
		GjbEntity gjbEntity = null;
		try{
			gjbEntity = gjglService.queryGjByDm(dm);
		}catch(Exception e){
			System.err.println("queryGjByDm操作失败!!");
			e.printStackTrace();
		}
		return gjbEntity;
	}
	/**
 	 * 删除国籍
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delGj")
	public String delGj(String[] ids){
		try{
			gjglService.delGj(ids);
		}catch(Exception e){
			System.err.println("delGj操作失败!!");
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
				bo = gjglService.queryByDmCount(dm) == 0 ? true : false;
			}else{
				bo = gjglService.queryByDmCount(dm) == 1 ? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByDmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
}

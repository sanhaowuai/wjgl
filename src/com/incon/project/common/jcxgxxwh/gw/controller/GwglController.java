package com.incon.project.common.jcxgxxwh.gw.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.pojo.common.jcxgxxwh.GwbEntity;
import com.incon.pojo.common.jcxgxxwh.GwlxbEntity;
import com.incon.project.common.jcxgxxwh.gw.page.GwglPage;
import com.incon.project.common.jcxgxxwh.gw.service.GwglService;



/**
 * 
 * @类名：  com.incon.project.common.jcxxwh.gw.controller.GwglController
 * @创建人： 杨文龙
 * @日期： 2014-3-11
 * @修改人：
 * @日期：
 * @描述：  岗位管理
 * @版本号：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/gwgl")
public class GwglController {

	@Resource(name="gwglService")
	private GwglService gwglService;
	
	@RequestMapping("/queryGwgl")
	public String queryZylbgl(Model model,GwbEntity gwbEntity,GwglPage gwglPage){
		//岗位列表
		try{
			List<GwbEntity> gwList = gwglService.query(gwglPage);
			List<GwlxbEntity> gwglList=gwglService.queryGwlx();
			model.addAttribute("gwList",gwList);
			model.addAttribute("gwglList",gwglList);
		}catch(Exception e){
			System.err.println("queryGwgl操作失败!!");
			e.printStackTrace();
		}
		return "commons/jcxgxxwh/gwgl";
	}
	/**
	 * 增加或修改岗位
	 * @param GwbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addGwglSz")
	public String addOrUpdGwgl(GwbEntity gwbEntity,String zt){
		try{
			if(zt.equals("1")){
				gwglService.addGw(gwbEntity);
			}else{
				gwglService.updGw(gwbEntity);
			}
		}catch(Exception e){
			System.err.println("addOrUpdGwgl操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	/**
 	 * 根据代码查询岗位
 	 * @param dm
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("queryGwByDm")
	public GwbEntity queryGwByDm(String dm){
		GwbEntity gwbEntity = null;
		try{
			gwbEntity = gwglService.queryGwByDm(dm);
		}catch(Exception e){
			System.err.println("queryGwByDm操作失败!!");
			e.printStackTrace();
		}
		return gwbEntity;
	}
	/**
 	 * 删除岗位
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delGw")
	public String delGw(String[] ids){
		try{
			gwglService.delGw(ids);
		}catch(Exception e){
			System.err.println("delGw操作失败!!");
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
				bo = gwglService.queryByDmCount(dm) == 0 ? true : false;
			}else{
				bo = gwglService.queryByDmCount(dm) == 1 ? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByDmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
}

package com.incon.project.common.jcxgxxwh.jxl.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.pojo.common.jcxgxxwh.JxlbEntity;
import com.incon.pojo.common.jcxgxxwh.XiaoqubEntity;
import com.incon.project.common.jcxgxxwh.jxl.page.JxlglPage;
import com.incon.project.common.jcxgxxwh.jxl.service.JxlglService;



/**
 * 
 * @类名：  com.incon.project.common.jcxgxxwh.jxl.controller.JxlglController
 * @创建人： 杨文龙
 * @日期： 2014-3-11
 * @修改人：
 * @日期：
 * @描述：  教学楼管理
 * @版本号：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/jxlgl")
public class JxlglController {

	@Resource(name="jxlglService")
	private JxlglService jxlglService;
	
	@RequestMapping("/queryJxlgl")
	public String queryJxlgl(Model model,JxlbEntity jxlbEntity,JxlglPage jxlglPage){
		//教学楼列表
		try{
			List<JxlbEntity> jxlList = jxlglService.query(jxlglPage);
			model.addAttribute("jxlList",jxlList);
			List<XiaoqubEntity> xiaoqulist = jxlglService.queryXiaoquList();
			model.addAttribute("xiaoqulist",xiaoqulist);
		}catch(Exception e){
			System.err.println("queryJxlgl操作失败!!");
			e.printStackTrace();
		}
		return "commons/jcxgxxwh/jxlgl";
	}
	/**
	 * 增加或修改教学楼
	 * @param JxlbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addJxlglSz")
	public String addOrUpdJxlgl(JxlbEntity jxlbEntity,String zt){
		try{
			if(zt.equals("1")){
				jxlglService.addJxl(jxlbEntity);
			}else{
				jxlglService.updJxl(jxlbEntity);
			}
		}catch(Exception e){
			System.err.println("addOrUpdJxlgl操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	/**
 	 * 根据代码查询教学楼
 	 * @param dm
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("queryJxlByDm")
	public JxlbEntity queryJxlByDm(String dm){
		JxlbEntity jxlbEntity = null;
		try{
			jxlbEntity = jxlglService.queryJxlByDm(dm);
		}catch(Exception e){
			System.err.println("queryJxlByDm操作失败!!");
			e.printStackTrace();
		}
		return jxlbEntity;
	}
	
	/**
	 * 判断教学楼是否被使用
	 * @param ids
	 * @return
	 */
	@RequestMapping("queryExit")
	@ResponseBody
	public Map queryExit(String ids){
		Map map = new HashMap();
		String mc = "";
		try {
			mc = jxlglService.queryExit(ids);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryExit操作失败!!");
		}
		map.put("mc", mc);
		return map;
	}
	
	/**
 	 * 删除教学楼
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delJxl")
	public String delJxl(String[] ids){
		try{
			jxlglService.delJxl(ids);
		}catch(Exception e){
			System.err.println("delJxl操作失败!!");
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
				bo = jxlglService.queryByDmCount(dm) == 0 ? true : false;
			}else{
				bo = jxlglService.queryByDmCount(dm) == 1 ? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByDmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
}

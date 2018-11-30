package com.incon.project.common.jcxgxxwh.jyslx.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.pojo.common.jcxgxxwh.JyslxbEntity;
import com.incon.project.common.jcxgxxwh.jyslx.page.JyslxglPage;
import com.incon.project.common.jcxgxxwh.jyslx.service.JyslxglService;



/**
 * 
 * @类名：  com.incon.project.common.jcxgxxwh.jyslx.controller.JyslxglController
 * @创建人： 杨文龙
 * @日期： 2014-3-11
 * @修改人：
 * @日期：
 * @描述：  教研室类型管理
 * @版本号：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/jyslxgl")
public class JyslxglController {

	@Resource(name="jyslxglService")
	private JyslxglService jyslxglService;
	
	@RequestMapping("/queryJyslxgl")
	public String queryJyslxgl(Model model,JyslxbEntity jyslxbEntity,JyslxglPage jyslxglPage){
		//教研室类型列表
		try{
			List<JyslxbEntity> jyslxList = jyslxglService.query(jyslxglPage);
			model.addAttribute("jyslxList",jyslxList);
		}catch(Exception e){
			System.err.println("queryJyslxgl操作失败!!");
			e.printStackTrace();
		}
		return "commons/jcxgxxwh/jyslxgl";
	}
	/**
	 * 增加或修改教研室类型
	 * @param JyslxbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addJyslxglSz")
	public String addOrUpdJyslxgl(JyslxbEntity jyslxbEntity,String zt){
		try{
			if(zt.equals("1")){
				jyslxglService.addJyslx(jyslxbEntity);
			}else{
				jyslxglService.updJyslx(jyslxbEntity);
			}
		}catch(Exception e){
			System.err.println("addOrUpdJyslxgl操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	/**
 	 * 根据代码查询教研室类型
 	 * @param dm
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("queryJyslxByDm")
	public JyslxbEntity queryJyslxByDm(String dm){
		JyslxbEntity jyslxbEntity = null;
		try{
			jyslxbEntity = jyslxglService.queryJyslxByDm(dm);
		}catch(Exception e){
			System.err.println("queryJyslxByDm操作失败!!");
			e.printStackTrace();
		}
		return jyslxbEntity;
	}
	
	/**
	 * 判断教研室类型是否被使用
	 * @param ids
	 * @return
	 */
	@RequestMapping("queryExit")
	@ResponseBody
	public Map queryExit(String ids){
		Map map = new HashMap();
		String mc = "";
		try {
			mc = jyslxglService.queryExit(ids);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryExit操作失败!!");
		}
		map.put("mc", mc);
		return map;
	}
	
	/**
 	 * 删除教研室类型
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delJyslx")
	public String delJyslx(String[] ids){
		try{
			jyslxglService.delJyslx(ids);
		}catch(Exception e){
			System.err.println("delJyslx操作失败!!");
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
				bo = jyslxglService.queryByDmCount(dm) == 0 ? true : false;
			}else{
				bo = jyslxglService.queryByDmCount(dm) == 1 ? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByDmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
}

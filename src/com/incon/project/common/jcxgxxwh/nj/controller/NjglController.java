package com.incon.project.common.jcxgxxwh.nj.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.pojo.common.jcxgxxwh.NjbEntity;
import com.incon.project.common.jcxgxxwh.nj.page.NjglPage;
import com.incon.project.common.jcxgxxwh.nj.service.NjglService;



/**
 * 
 * @类名：  com.incon.project.common.jcxxwh.nj.controller.NjglController
 * @创建人： 杨文龙
 * @日期： 2014-3-11
 * @修改人：
 * @日期：
 * @描述：  年级管理
 * @版本号：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/njgl")
public class NjglController {

	@Resource(name="njglService")
	private NjglService njglService;
	
	@RequestMapping("/queryNjgl")
	public String queryNjgl(Model model,NjbEntity njbEntity,NjglPage njglPage){
		//年级列表
		try{
			List<NjbEntity> njList = njglService.query(njglPage);
			model.addAttribute("njList",njList);
		}catch(Exception e){
			System.err.println("queryNjgl操作失败!!");
			e.printStackTrace();
		}
		return "commons/jcxgxxwh/njgl";
	}
	/**
	 * 增加或修改年级
	 * @param NjbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addNjglSz")
	public String addOrUpdNjgl(NjbEntity njbEntity,String zt){
		try{
			if(zt.equals("1")){
				njglService.addNj(njbEntity);
			}else{
				njglService.updNj(njbEntity);
			}
		}catch(Exception e){
			System.err.println("addOrUpdNjgl操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	/**
 	 * 根据代码查询年级
 	 * @param dm
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("queryNjByDm")
	public NjbEntity queryNjByDm(String nj){
		NjbEntity njbEntity = null;
		try{
			njbEntity = njglService.queryNjByDm(nj);
		}catch(Exception e){
			System.err.println("queryNjByDm操作失败!!");
			e.printStackTrace();
		}
		return njbEntity;
	}
	
	/**
	 * 删除前判断id是否被使用
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryExit")
	public Map queryExit(String ids){
		String mc = "";
		try {
			mc = njglService.queryExit(ids);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryExit操作失败!!");
		}
		Map map = new HashMap();
		map.put("mc",mc);
		return map;
	}
	
	/**
 	 * 删除年级
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delNj")
	public String delNj(String[] ids){
		try{
			njglService.delNj(ids);
		}catch(Exception e){
			System.err.println("delNj操作失败!!");
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
	public Boolean queryByDmCount(String nj,String zt){
		Boolean bo = false;
		try {
			if(zt.equals("1")){
				bo = njglService.queryByDmCount(nj) == 0 ? true : false;
			}else{
				bo = njglService.queryByDmCount(nj) == 1 ? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByDmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
}

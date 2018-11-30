package com.incon.project.common.jcxgxxwh.xiaoqu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.pojo.common.jcxgxxwh.XiaoqubEntity;
import com.incon.project.common.jcxgxxwh.xiaoqu.page.XiaoquglPage;
import com.incon.project.common.jcxgxxwh.xiaoqu.service.XiaoquglService;



/**
 * 
 * @类名：  com.incon.project.common.jcxxwh.zylb.controller.ZylbglController
 * @创建人： 杨文龙
 * @日期： 2014-3-11
 * @修改人：
 * @日期：
 * @描述：  校区管理
 * @版本号：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/xiaoqugl")
public class XiaoquglController {

	@Resource(name="xiaoquglService")
	private XiaoquglService xiaoquglService;
	
	@RequestMapping("/queryXiaoqugl")
	public String querXiaoqugl(Model model,XiaoqubEntity xiaoqubEntity,XiaoquglPage xiaoquglPage){
		//校区列表
		try{
			List<XiaoqubEntity> xiaoquList = xiaoquglService.query(xiaoquglPage);
			model.addAttribute("xiaoquList",xiaoquList);
		}catch(Exception e){
			System.err.println("queryXiaoqugl操作失败!!");
			e.printStackTrace();
		}
		return "commons/jcxgxxwh/xiaoqugl";
	}
	/**
	 * 增加或修改校区
	 * @param XiaoqubEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addXiaoquglSz")
	public String addOrUpdXiaoqugl(XiaoqubEntity xiaoqubEntity,String zt){
		try{
			if(zt.equals("1")){
				xiaoquglService.addXiaoqu(xiaoqubEntity);
			}else{
				xiaoquglService.updXiaoqu(xiaoqubEntity);
			}
		}catch(Exception e){
			System.err.println("addOrUpdXiaoqugl操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	/**
 	 * 根据代码查询校区
 	 * @param dm
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("queryXiaoquByDm")
	public XiaoqubEntity queryXiaoquByDm(String dm){
		XiaoqubEntity xiaoqubEntity = null;
		try{
			xiaoqubEntity = xiaoquglService.queryXiaoquByDm(dm);
		}catch(Exception e){
			System.err.println("queryXiaoquByDm操作失败!!");
			e.printStackTrace();
		}
		return xiaoqubEntity;
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
			mc = xiaoquglService.queryExit(ids);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("delBefore操作失败!!");
		}
		Map map = new HashMap();
		map.put("mc",mc);
		return map;
	}
	
	/**
 	 * 删除校区
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delXiaoqu")
	public String delZylb(String[] ids){
		try{
			xiaoquglService.delXiaoqu(ids);
		}catch(Exception e){
			System.err.println("delXiaoqu操作失败!!");
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
				bo = xiaoquglService.queryByDmCount(dm) == 0 ? true : false;
			}else{
				bo = xiaoquglService.queryByDmCount(dm) == 1 ? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByDmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
}

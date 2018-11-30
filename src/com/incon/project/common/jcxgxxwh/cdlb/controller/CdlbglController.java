package com.incon.project.common.jcxgxxwh.cdlb.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.pojo.common.jcxgxxwh.CdlbbEntity;
import com.incon.project.common.jcxgxxwh.cdlb.page.CdlbglPage;
import com.incon.project.common.jcxgxxwh.cdlb.service.CdlbglService;



/**
 * 
 * @类名：  com.incon.project.common.jcxgxxwh.cdlb.controller.CdlbglController
 * @创建人： 杨文龙
 * @日期： 2014-4-2
 * @修改人：
 * @日期：
 * @描述： 场地类别管理
 * @版本号：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/cdlbgl")
public class CdlbglController {

	@Resource(name="cdlbglService")
	private CdlbglService cdlbglService;
	
	@RequestMapping("/queryCdlbgl")
	public String queryCdlbgl(Model model,CdlbbEntity cdlbbEntity,CdlbglPage cdlbglPage){
		//场地类别列表
		try{
			List<CdlbbEntity> cdlbList = cdlbglService.query(cdlbglPage);
			model.addAttribute("cdlbList",cdlbList);
		}catch(Exception e){
			System.err.println("queryCdlbgl操作失败!!");
			e.printStackTrace();
		}
		return "commons/jcxgxxwh/cdlbgl";
	}
	/**
	 * 增加或修改场地类别
	 * @param cdlbbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addCdlbglSz")
	public String addOrUpdCdlbgl(CdlbbEntity cdlbbEntity,String zt){
		try{
			if(zt.equals("1")){
				cdlbglService.addCdlb(cdlbbEntity);
			}else{
				cdlbglService.updCdlb(cdlbbEntity);
			}
		}catch(Exception e){
			System.err.println("addOrUpdCdlbgl操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	/**
 	 * 根据代码查询场地类别
 	 * @param dm
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("queryCdlbByDm")
	public CdlbbEntity queryCdlbByDm(String dm){
		CdlbbEntity cdlbbEntity = null;
		try{
			cdlbbEntity = cdlbglService.queryCdlbByDm(dm);
		}catch(Exception e){
			System.err.println("queryCdlbByDm操作失败!!");
			e.printStackTrace();
		}
		return cdlbbEntity;
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
			mc = cdlbglService.queryExit(ids);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("delBefore操作失败!!");
		}
		Map map = new HashMap();
		map.put("mc",mc);
		return map;
	}
	
	/**
 	 * 删除场地类别
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delCdlb")
	public String delCdlb(String[] ids){
		try{
			cdlbglService.delCdlb(ids);
		}catch(Exception e){
			System.err.println("delCdlb操作失败!!");
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
				bo = cdlbglService.queryByDmCount(dm) == 0 ? true : false;
			}else{
				bo = cdlbglService.queryByDmCount(dm) == 1 ? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByDmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
}

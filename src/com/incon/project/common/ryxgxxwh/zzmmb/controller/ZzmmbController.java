package com.incon.project.common.ryxgxxwh.zzmmb.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.pojo.common.ryxgxxwh.ZzmmbEntity;
import com.incon.project.common.ryxgxxwh.zzmmb.page.ZzmmbPage;
import com.incon.project.common.ryxgxxwh.zzmmb.service.ZzmmbService;


/**
 * @类名：com.incon.project.common.ryxgxxwh.zzmmb.controller.ZzmmbController
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
@RequestMapping("/zzmmbgl")
public class ZzmmbController {
	@Resource(name="zzmmbService")
	private ZzmmbService zzmmbService;
	/**
	 * 查询政治面貌
	 * @param model
	 * @param zzmmbPage
	 * @return
	 */
	@RequestMapping("queryZzmm")
	public String queryZzmm(Model model,ZzmmbPage zzmmbPage){
		try {
			List<ZzmmbEntity> zzmmList = zzmmbService.query(zzmmbPage);
			model.addAttribute("zzmmList",zzmmList);
		} catch (Exception e) {
			System.err.println("queryZzmm操作失败!!");
			e.printStackTrace();
		}
		return "commons/ryxgxxwh/zzmmbgl";	
	}
	/**
	 * 增加或修改政治面貌
	 * @param zzmmbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addOrUpdZzmm")
	public String addOrUpdZzmm(ZzmmbEntity zzmmbEntity,String zt){
		try {
			if(zt.equals("1")){//增加
				zzmmbService.addZzmm(zzmmbEntity);
			}else{
				zzmmbService.updZzmmByDm(zzmmbEntity);
			}
		} catch (Exception e) {
			System.err.println("addOrUpdZzmm操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	/**
 	 * 查询一条政治面貌
 	 * @param dm
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("queryZzmmByDm")
	public ZzmmbEntity queryZzmmByDm(String dm){
		ZzmmbEntity zzmmbEntity = null;
		try {
			zzmmbEntity=zzmmbService.queryZzmmByDm(dm);
		} catch (Exception e) {
			System.err.println("queryZzmmByDm操作失败!!");
			e.printStackTrace();
		}
		return zzmmbEntity;
	}
	/**
 	 * 删除政治面貌
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delZzmm")
	public String delZzmm(String ids[]){
		try {
			zzmmbService.delZzmm(ids);
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
				bo = zzmmbService.queryByDmCount(dm) == 0? true : false;
			}else{
				bo = zzmmbService.queryByDmCount(dm) == 1? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByDmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
}


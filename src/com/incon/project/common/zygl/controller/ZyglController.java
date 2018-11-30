package com.incon.project.common.zygl.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.YxdmbEntity;
import com.incon.pojo.common.ZybEntity;
import com.incon.project.common.yxgl.page.YxglPage;
import com.incon.project.common.yxgl.service.YxglService;
import com.incon.project.common.zygl.page.ZyglPage;
import com.incon.project.common.zygl.service.ZyglService;

/**
 * 
 * @类名： com.incon.project.common.zygl.controller.ZyglController
 * @修改人：
 * @日期：
 * @描述：  专业管理
 * @版本号：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/zygl")
public class ZyglController {

	@Resource(name="zyglService")
	private ZyglService zyglService;
	
	/**
	 * 查询专业管理
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("queryZygl")
	public String queryZygl(Model model,ZyglPage zyglPage){
		try {
			List<ZybEntity> zylist = zyglService.query(zyglPage);
			
			model.addAttribute("zylist", zylist);

			model.addAttribute("zyglPage",zyglPage);
		} catch (Exception e) {
			System.err.println("queryZygl操作失败!!");
			e.printStackTrace();
		}
		return "commons/zygl/zygl";
	}
	/**
	 * 系
	 * */
	@ResponseBody
	@RequestMapping("ssx")
	public Object ssx(String ssy){
		List list = null;
		try {
			list = zyglService.querySsxList(ssy);
		} catch (Exception e) {
			System.err.println("ssx操作失败!!");
			e.printStackTrace();
		}
	    return list;
	}
	/**
	 * 专业
	 * */
	@ResponseBody
	@RequestMapping("sszy")
	public Object sszy(String ssy){
		List list = null;
		try {
			list = zyglService.querySszyList(ssy);
		} catch (Exception e) {
			System.err.println("sszy操作失败!!");
			e.printStackTrace();
		}
	    return list;
	}


	/**
	 * 增加或修改专业
	 * @param zybEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addOrUpdZy")
	public String addOrUpdZy(ZybEntity zybEntity,String zt){
		try {
			if(zt.equals("1")){		//增加
				zyglService.addZy(zybEntity);
			}else{					//修改
				zyglService.updZy(zybEntity);
			}
		} catch (Exception e) {
			System.err.println("addOrUpdZy操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 查询一个专业系信息
	 * @param zydm
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryOneZy")
	public Map queryOneZy(String zydm){
		Map map = new HashMap<String, String>();
		try{
			 map=zyglService.queryOneZy(zydm);
		}catch(Exception e){
			System.err.println("queryOneZy操作失败!!");
			e.printStackTrace();
		}
		return map;
	}
	

	/**
 	 * 删除专业
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delZy")
    public String delZy(String[] ids){
		try {
			zyglService.delZy(ids);
		} catch (Exception e) {
			System.err.println("delZy操作失败!!");
			e.printStackTrace();
		}
    	return null;
    }
	
	/**
	 * 查询zydm是否重复
	 * @param zydm
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryByZydmCount")
	public Boolean queryByZydmCount(String zydm,String zt){
		Boolean bo = false;
		try {
			if(zt.equals("1")){
				bo = zyglService.queryByZydmCount(zydm) == 0? true:false;
			}else {
				bo = zyglService.queryByZydmCount(zydm) == 1? true:false;
			}
		} catch (Exception e) {
			System.err.println("queryByZydmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
}

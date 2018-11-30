package com.incon.project.common.jcxgxxwh.zylb.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.pojo.common.jcxgxxwh.ZylbbEntity;
import com.incon.project.common.jcxgxxwh.zylb.page.ZylbglPage;
import com.incon.project.common.jcxgxxwh.zylb.service.ZylbglService;

/**
 * 
 * @类名：  com.incon.project.common.jcxxwh.zylb.controller.ZylbglController
 * @创建人： 杨文龙
 * @日期： 2014-3-11
 * @修改人：
 * @日期：
 * @描述：  专业类别管理
 * @版本号：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/zylbgl")
public class ZylbglController {
	@Resource(name="zylbglService")
	private ZylbglService zylbglService;
	
	@RequestMapping("/queryZylbgl")
	public String queryZylbgl(Model model,ZylbbEntity zylbbEntity,ZylbglPage zylbglPage){
		//专业类别列表
		try{
			List<ZylbbEntity> zylbList = zylbglService.query(zylbglPage);
			model.addAttribute("zylbList",zylbList);
		}catch(Exception e){
			System.err.println("queryZylbgl操作失败!!");
			e.printStackTrace();
		}
		return "commons/jcxgxxwh/zylbgl";
	}
	/**
	 * 增加或修改专业类别
	 * @param zylbbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addZylbglSz")
	public String addOrUpdZylbgl(ZylbbEntity zylbbEntity,String zt){
		try{
			if(zt.equals("1")){
				zylbglService.addZylb(zylbbEntity);
			}else{
				zylbglService.updZylb(zylbbEntity);
			}
		}catch(Exception e){
			System.err.println("addOrUpdZylbgl操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	/**
 	 * 根据代码查询专业类别
 	 * @param dm
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("queryZylbByDm")
	public ZylbbEntity queryZylbByDm(String dm){
		ZylbbEntity zylbbEntity = null;
		try{
			zylbbEntity = zylbglService.queryZylbByDm(dm);
		}catch(Exception e){
			System.err.println("queryXsByXh操作失败!!");
			e.printStackTrace();
		}
		return zylbbEntity;
	}
	/**
 	 * 删除专业类别
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delZylb")
	public String delZylb(String[] ids){
		try{
			zylbglService.delZylb(ids);
		}catch(Exception e){
			System.err.println("delZylb操作失败!!");
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
				bo = zylbglService.queryByDmCount(dm) == 0 ? true : false;
			}else{
				bo = zylbglService.queryByDmCount(dm) == 1 ? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByDmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
}

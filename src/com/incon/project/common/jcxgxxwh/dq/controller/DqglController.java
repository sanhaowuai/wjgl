package com.incon.project.common.jcxgxxwh.dq.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.pojo.common.jcxgxxwh.DqbEntity;
import com.incon.project.common.jcxgxxwh.dq.page.DqglPage;
import com.incon.project.common.jcxgxxwh.dq.service.DqglService;




/**
 * 
 * @类名：  com.incon.project.common.jcxxwh.zylb.controller.ZylbglController
 * @创建人： 杨文龙
 * @日期： 2014-3-11
 * @修改人：
 * @日期：
 * @描述：  地区管理
 * @版本号：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/dqgl")
public class DqglController {

	@Resource(name="dqglService")
	private DqglService dqglService;
	
	@RequestMapping("/queryDqgl")
	public String queryDqgl(Model model,DqbEntity dqbEntity,DqglPage dqglPage){
		//地区列表
		try{
			List<DqbEntity> dqList = dqglService.query(dqglPage);
			model.addAttribute("dqList",dqList);
		}catch(Exception e){
			System.err.println("queryDqgl操作失败!!");
			e.printStackTrace();
		}
		return "commons/jcxgxxwh/dqgl";
	}
	/**
	 * 增加或修改地区
	 * @param DqbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addDqglSz")
	public String addOrUpdDqgl(DqbEntity dqbEntity,String zt){
		try{
			if(zt.equals("1")){
				dqglService.addDq(dqbEntity);
			}else{
				dqglService.updDq(dqbEntity);
			}
		}catch(Exception e){
			System.err.println("addOrUpdDqgl操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	/**
 	 * 根据代码查询地区
 	 * @param dm
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("queryDqByDm")
	public DqbEntity queryDqByDm(String dm){
		DqbEntity dqbEntity = null;
		try{
			dqbEntity = dqglService.queryDqByDm(dm);
		}catch(Exception e){
			System.err.println("queryDqByDm操作失败!!");
			e.printStackTrace();
		}
		return dqbEntity;
	}
	/**
 	 * 删除地区
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delDq")
	public String delDq(String[] ids){
		try{
			dqglService.delDq(ids);
		}catch(Exception e){
			System.err.println("delDq操作失败!!");
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
				bo = dqglService.queryByDmCount(dm) == 0 ? true : false;
			}else{
				bo = dqglService.queryByDmCount(dm) == 1 ? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByDmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
}

package com.incon.project.common.jcxgxxwh.rxlx.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.pojo.common.jcxgxxwh.RxlxbEntity;
import com.incon.project.common.jcxgxxwh.rxlx.page.RxlxglPage;
import com.incon.project.common.jcxgxxwh.rxlx.service.RxlxglService;



/**
 * 
 * @类名：  com.incon.project.common.jcxgxxwh.rxlx.controller.RxlxglController
 * @创建人： 杨文龙
 * @日期： 2014-3-11
 * @修改人：
 * @日期：
 * @描述： 入校类型管理
 * @版本号：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/rxlxgl")
public class RxlxglController {

	@Resource(name="rxlxglService")
	private RxlxglService rxlxglService;
	@RequestMapping("/queryRxlxgl")
	public String queryRxlxgl(Model model,RxlxbEntity rxlxbEntity,RxlxglPage rxlxglPage){
		//专业类别列表
		try{
			List<RxlxbEntity> rxlxList = rxlxglService.query(rxlxglPage);
			model.addAttribute("rxlxList",rxlxList);
		}catch(Exception e){
			System.err.println("queryRxlxgl操作失败!!");
			e.printStackTrace();
		}
		return "commons/jcxgxxwh/rxlxgl";
	}
	/**
	 * 增加或修改入校类型
	 * @param rxlxbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addRxlxglSz")
	public String addOrUpdRxlxgl(RxlxbEntity rxlxbEntity,String zt){
		try{
			if(zt.equals("1")){
				rxlxglService.addRxlx(rxlxbEntity);
			}else{
				rxlxglService.updRxlx(rxlxbEntity);
			}
		}catch(Exception e){
			System.err.println("addOrUpdRxlxgl操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	/**
 	 * 根据代码查询入校类型
 	 * @param dm
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("queryRxlxByDm")
	public RxlxbEntity queryRxlxByDm(String dm){
		RxlxbEntity rxlxbEntity = null;
		try{
			rxlxbEntity = rxlxglService.queryRxlxByDm(dm);
		}catch(Exception e){
			System.err.println("queryRxlxByDm操作失败!!");
			e.printStackTrace();
		}
		return rxlxbEntity;
	}
	/**
 	 * 删除入校类型
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delRxlx")
	public String delRxlx(String[] ids){
		try{
			rxlxglService.delRxlx(ids);
		}catch(Exception e){
			System.err.println("delRxlx操作失败!!");
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
				bo = rxlxglService.queryByDmCount(dm) == 0 ? true : false;
			}else{
				bo = rxlxglService.queryByDmCount(dm) == 1 ? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByDmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
}

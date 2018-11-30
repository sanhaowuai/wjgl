package com.incon.project.common.ryxgxxwh.mzb.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.pojo.common.ryxgxxwh.MzbEntity;
import com.incon.project.common.ryxgxxwh.mzb.page.MzbPage;
import com.incon.project.common.ryxgxxwh.mzb.service.MzbService;

/**
 * @类名：com.incon.project.common.ryxgxxwh.mzb.controller.MzbController
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
@RequestMapping("/mzbgl")
public class MzbController {
	@Resource(name="mzbService")
	private MzbService mzbService;
	/**
	 * 查询民族
	 * @param model
	 * @param mzbPage
	 * @return
	 */
	@RequestMapping("queryMz")
	public String queryMz(Model model,MzbPage mzbPage){
		try {
			List<MzbEntity> mzList = mzbService.query(mzbPage);
			model.addAttribute("mzList",mzList);
		} catch (Exception e) {
			System.err.println("queryMz操作失败!!");
			e.printStackTrace();
		}
		return "commons/ryxgxxwh/mzbgl";	
	}
	/**
	 * 增加或修改民族
	 * @param mzbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addOrUpdMz")
	public String addOrUpdMz(MzbEntity mzbEntity,String zt){
		try {
			if(zt.equals("1")){//增加
				mzbService.addMz(mzbEntity);
			}else{
				mzbService.updMzByDm(mzbEntity);
			}
		} catch (Exception e) {
			System.err.println("addOrUpdMz操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	/**
 	 * 查询一条民族
 	 * @param dm
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("queryMzByDm")
	public MzbEntity queryMzByDm(String dm){
		MzbEntity mzbEntity = null;
		try {
			mzbEntity=mzbService.queryMzByDm(dm);
		} catch (Exception e) {
			System.err.println("queryMzByDm操作失败!!");
			e.printStackTrace();
		}
		return mzbEntity;
	}
	/**
 	 * 删除民族
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delMz")
	public String delMz(String ids[]){
		try {
			mzbService.delMz(ids);
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
				bo = mzbService.queryByDmCount(dm) == 0? true : false;
			}else{
				bo = mzbService.queryByDmCount(dm) == 1? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByDmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
}

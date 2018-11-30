package com.incon.project.common.jcxgxxwh.jxcd.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.tools.ant.types.CommandlineJava.SysProperties;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.pojo.common.YxdmbEntity;
import com.incon.pojo.common.ZybEntity;
import com.incon.pojo.common.jcxgxxwh.CdlbbEntity;
import com.incon.pojo.common.jcxgxxwh.JxcdbEntity;
import com.incon.pojo.common.jcxgxxwh.JxlbEntity;
import com.incon.pojo.common.jcxgxxwh.XiaoqubEntity;
import com.incon.project.common.jcxgxxwh.jxcd.page.JxcdglPage;
import com.incon.project.common.jcxgxxwh.jxcd.service.JxcdglService;



/**
 * 
 * @类名：  com.incon.project.common.jcxxwh.zylb.controller.ZylbglController
 * @创建人： 杨文龙
 * @日期： 2014-3-11
 * @修改人：
 * @日期：
 * @描述：  教学场地管理
 * @版本号：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/jxcdgl")
public class JxcdglController {

	@Resource(name="jxcdglService")
	private JxcdglService jxcdglService;
	
	@RequestMapping("/queryJxcdgl")
	public String queryJxcdgl(Model model,JxcdbEntity jxcdbEntity,JxcdglPage jxcdglPage){
		//教学场地列表
		try{
			List<JxcdbEntity> jxcdList = jxcdglService.query(jxcdglPage);
			model.addAttribute("jxcdList",jxcdList);
			//校区列表
			List<XiaoqubEntity> xiaoqulist = jxcdglService.queryXiaoquList();
			model.addAttribute("xiaoqulist",xiaoqulist);
			//场地类别列表
			List<CdlbbEntity> cdList = jxcdglService.queryCdlb();
			model.addAttribute("cdList",cdList);
		}catch(Exception e){
			System.err.println("queryJxcdgl操作失败!!");
			e.printStackTrace();
		}
		return "commons/jcxgxxwh/jxcdgl";
	}
	/**
	 * 根据校区查询教学楼
	 * @param yxdm  
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryJxlByXiaoqu")
	public Object queryJxlByXiaoqu(String yxdm){
		List<JxlbEntity> jxllist = null;
		try{
			//教学楼列表
			jxllist = jxcdglService.queryJxlList(yxdm);
		}catch(Exception e){
			System.err.println("queryJxlByXiaoqu操作失败!!");
			e.printStackTrace();
		}
		return jxllist;
	}
	/**
	 * 增加或修改教学场地
	 * @param JxcdbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addJxcdglSz")
	public String addOrUpdJxcdgl(JxcdbEntity jxcdbEntity,String zt){
		System.out.println(jxcdbEntity.getLhdm() + " =====     "+  jxcdbEntity.getXiaoqu());
		try{
			if(zt.equals("1")){
				jxcdglService.addJxcd(jxcdbEntity);
			}else{
				jxcdglService.updJxcd(jxcdbEntity);
			}
		}catch(Exception e){
			System.err.println("addOrUpdJxcdgl操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	/**
 	 * 根据代码查询教学场地
 	 * @param dm
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("queryJxcdByDm")
	public JxcdbEntity queryJxcdByDm(String dm){
		JxcdbEntity jxcdbEntity = null;
		try{
			jxcdbEntity = jxcdglService.queryJxcdByDm(dm);
		}catch(Exception e){
			System.err.println("queryJxcdByDm操作失败!!");
			e.printStackTrace();
		}
		return jxcdbEntity;
	}
	/**
 	 * 删除教学场地
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delJxcd")
	public String delJxcd(String[] ids){
		try{
			jxcdglService.delJxcd(ids);
		}catch(Exception e){
			System.err.println("delJxcd操作失败!!");
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
				bo = jxcdglService.queryByDmCount(dm) == 0 ? true : false;
			}else{
				bo = jxcdglService.queryByDmCount(dm) == 1 ? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByDmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
	
	/**
	 * 查询所有院系
	 * @param sybm
	 * @return
	 */
	@RequestMapping("queryYx")
	public String queryYx(JxcdbEntity jxcdbEntity,Model model){
		try {
			if(jxcdbEntity.getSybm() != null){
				model.addAttribute("sybm", jxcdbEntity.getSybm());
			}
			List<YxdmbEntity> yx_list = jxcdglService.queryYx(jxcdbEntity);
			if(jxcdbEntity.getYxdm() != null){
				model.addAttribute("yxdm",jxcdbEntity.getYxdm());
			}
			if(jxcdbEntity.getYxmc() != null){
				model.addAttribute("yxmc",jxcdbEntity.getYxmc());
			}
			model.addAttribute("yx_list",yx_list);
			model.addAttribute("dm",jxcdbEntity.getDm());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryYx操作失败!!");
		}
		return "commons/jcxgxxwh/jxcdgl_iframe";
	}
	
	
	/**
	 * 修改教学场地的使用部门
	 * @param dm
	 * @param obj
	 * @return
	 */
	@ResponseBody
	@RequestMapping("updSybm")
	public boolean updSybm(String dm,String obj){
		boolean reg;
		try {
			jxcdglService.updSybm(dm,obj);
			reg = true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updSybm操作失败!!");
			reg = false;
		}
		return reg;
	}
}

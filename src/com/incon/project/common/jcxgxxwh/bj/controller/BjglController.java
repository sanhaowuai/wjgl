package com.incon.project.common.jcxgxxwh.bj.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.common.pub.pubNj.service.PubNjService;
import com.incon.common.pub.pubYx.page.PubYxPage;
import com.incon.common.pub.pubYx.service.PubYxService;
import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.XyzybEntity;
import com.incon.pojo.common.YxdmbEntity;
import com.incon.pojo.common.ZybEntity;
import com.incon.pojo.common.jcxgxxwh.BjbEntity;
import com.incon.pojo.common.jcxgxxwh.NjbEntity;
import com.incon.pojo.common.jcxgxxwh.XiaoqubEntity;
import com.incon.project.common.jcxgxxwh.bj.page.BjglPage;
import com.incon.project.common.jcxgxxwh.bj.service.BjglService;



/**
 * 
 * @类名：  com.incon.project.common.jcxxwh.zylb.controller.ZylbglController
 * @创建人： 杨文龙
 * @日期： 2014-3-11
 * @修改人：
 * @日期：
 * @描述：  班级管理
 * @版本号：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/bjgl")
public class BjglController {

	@Resource(name="bjglService")
	private BjglService bjglService;
	
	@Resource(name="pubYxService")
	private PubYxService pubYxService;
	@Resource(name="pubNjService")
	private PubNjService pubNjService;
	
	@RequestMapping("/queryBjgl")
	public String queryBjgl(Model model,BjbEntity bjbEntity,BjglPage bjglPage,HttpSession session){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		//班级列表
		try{
			
			bjglPage.setYhdm(userEntity.getYhdm());//登录用户名
			UserEntity user = bjglService.queryUser(userEntity);
			if(user.getSfcjgly() == null || user.getSfcjgly().isEmpty()){//是否超级管理员
				bjglPage.setSfcjgly("0");			
			}else{
				bjglPage.setSfcjgly(user.getSfcjgly());
			}
			bjglPage.setGljb(user.getGljb());//管理级别
			bjglPage.setJsdm(user.getJsdm());//角色代码
			List<BjbEntity> bjList = bjglService.query(bjglPage);
			model.addAttribute("bjList",bjList);
			//院系列表(添加)
			PubYxPage pubYxPage= new PubYxPage();
			pubYxPage.setGljb(userEntity.getGljb());//管理级别
			pubYxPage.setYhdm(userEntity.getYhdm());//登录用户名
			if(userEntity.getSfcjgly() == null || userEntity.getSfcjgly().trim().equals("")){//是否超级管理员
				pubYxPage.setSfcjgly("0");			
			}else{
				pubYxPage.setSfcjgly(userEntity.getSfcjgly());
			}
			pubYxPage.setJsdm(userEntity.getJsdm());//角色代码
			List<Map> yxlist = pubYxService.queryPubYxList(pubYxPage);
			model.addAttribute("yxlist", yxlist);
			//年级列表
			List<Map> njlist = pubNjService.queryPubNj();
			model.addAttribute("njlist", njlist);
			//查询所有院系
			List<YxdmbEntity> yxLists = bjglService.queryYxLists();
			model.addAttribute("yxLists", yxLists);
			//校区列表
			List<XiaoqubEntity> xiaoqulist = bjglService.queryXiaoquList();
			model.addAttribute("xiaoqulist", xiaoqulist);
		}catch(Exception e){
			System.err.println("queryBjgl操作失败!!");
			e.printStackTrace();
		}
		return "commons/jcxgxxwh/bjgl";
	}
	
	
	/**
	 * 根据院系查询专业
	 * @param yxdm  
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryZyByYx")
	public Object queryZyByYx(String xydm){
		List<ZybEntity> zylist = null;
		try{
			//专业列表(院)
			zylist = bjglService.queryZyList(xydm);
		}catch(Exception e){
			System.err.println("queryZyByYx操作失败!!");
			e.printStackTrace();
		}
		return zylist;
	}
	
	/**
	 * 查询是否管理部门
	 * @param xydm
	 * @return
	 */
	@RequestMapping("querySfglbm")
	@ResponseBody
	public String querySfglbm(YxdmbEntity yxdmbEntity){
		String sfglbm = "";
		try {
			YxdmbEntity yxdmb = bjglService.querySfglbm(yxdmbEntity);
			if(yxdmb == null){
				sfglbm = "";
			}else{
				sfglbm = yxdmb.getSfglbm();
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("querySfglbm操作失败!!");
		}
		
		return sfglbm;
	}
	
	/**
	 * 通过系代码查询专业
	 * @param xydm
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryZyByX")
	public Object queryZyByX(String xydm){
		List<ZybEntity> zylist = null;
		try{
			//专业列表(系)
			zylist = bjglService.queryZyListByX(xydm);
		}catch(Exception e){
			System.err.println("queryZyByYx操作失败!!");
			e.printStackTrace();
		}
		return zylist;
	}
	
	/**
	 * 根据院系查询系
	 * @param yxdm  
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryXByY")
	public List<YxdmbEntity> queryXByY(String yxdm){
		List<YxdmbEntity> xlist = null;
		try{
			//专业列表(院系)
			xlist = bjglService.queryXList(yxdm);
		}catch(Exception e){
			System.err.println("queryXByY操作失败!!");
			e.printStackTrace();
		}
		return xlist;
	}
	
	/**
	 * 增加或修改班级
	 * @param BjbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/addBjglSz")
	public String addOrUpdBjgl(BjbEntity bjbEntity,String zt){
		try{
			if(zt.equals("1")){
				bjglService.addBj(bjbEntity);
			}else{
				bjglService.updBj(bjbEntity);
			}
		}catch(Exception e){
			System.err.println("addOrUpdBjgl操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	/**
 	 * 根据代码查询班级
 	 * @param dm
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("queryBjByDm")
	public BjbEntity queryBjByDm(String bjdm){
		BjbEntity bjbEntity = null;
		try{
			bjbEntity = bjglService.queryBjByDm(bjdm);
		}catch(Exception e){
			System.err.println("queryBjByDm操作失败!!");
			e.printStackTrace();
		}
		return bjbEntity;
	}
	/**
 	 * 删除班级
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delBj")
	public String delBj(String[] ids){
		try{
			bjglService.delBj(ids);
		}catch(Exception e){
			System.err.println("delBj操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 查询bjdm是否重复
	 * @param dm
	 * @param 1:增加		2:修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryByDmCount")
	public Boolean queryByDmCount(String bjdm,String zt){
		Boolean bo = false;
		try {
			if(zt.equals("1")){
				bo = bjglService.queryByDmCount(bjdm) == 0 ? true : false;
			}else{
				bo = bjglService.queryByDmCount(bjdm) == 1 ? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByDmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
}

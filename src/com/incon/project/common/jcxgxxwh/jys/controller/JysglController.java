package com.incon.project.common.jcxgxxwh.jys.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.common.pub.pubYx.page.PubYxPage;
import com.incon.common.pub.pubYx.service.PubYxService;
import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.YxdmbEntity;
import com.incon.pojo.common.jcxgxxwh.JysbEntity;
import com.incon.pojo.common.jcxgxxwh.JyslxbEntity;
import com.incon.project.common.jcxgxxwh.jys.page.JysglPage;
import com.incon.project.common.jcxgxxwh.jys.service.JysglService;



/**
 * 
 * @类名：  com.incon.project.common.jcxgxxwh.jys.controller.JysglController
 * @创建人： 杨文龙
 * @日期： 2014-3-11
 * @修改人：
 * @日期：
 * @描述：  教研室管理
 * @版本号：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/jysgl")
public class JysglController {

	@Resource(name="jysglService")
	private JysglService jysglService;
	
	@Resource(name="pubYxService")
	private PubYxService pubYxService;
	
	@RequestMapping("/queryJysgl")
	public String queryJysgl(Model model,JysbEntity jysbEntity,JysglPage jysglPage,HttpSession session){
		//教研室列表
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		try{
			
			jysglPage.setYhdm(userEntity.getYhdm());//登录用户名
			UserEntity user = jysglService.queryUser(userEntity);
			jysglPage.setGljb(user.getGljb());//管理级别
			if(user.getSfcjgly() == null || user.getSfcjgly().isEmpty()){//是否超级管理员
				jysglPage.setSfcjgly("0");			
			}else{
				jysglPage.setSfcjgly(user.getSfcjgly());
			}
			jysglPage.setJsdm(user.getJsdm());//角色代码
			Map map = new HashMap();
			map.put("jsdm", userEntity.getJsdm());
			map.put("yhdm", userEntity.getYhdm());
			int jysCount = jysglService.queryJyssjqxCount(map);
			if(jysCount>0){
				jysglPage.setResultCount("1");
			}else{
				jysglPage.setResultCount("0");
			}
			List<JysbEntity> jysList = jysglService.query(jysglPage);
			List<JyslxbEntity> jyslx_list = jysglService.queryJyslx();
			
			
			//院系查询
			PubYxPage pubYxPage= new PubYxPage();
			pubYxPage.setGljb(userEntity.getGljb());//管理级别
			pubYxPage.setYhdm(userEntity.getYhdm());//登录用户名
			if(userEntity.getSfcjgly() == null || userEntity.getSfcjgly().trim().equals("")){//是否超级管理员
				pubYxPage.setSfcjgly("0");			
			}else{
				pubYxPage.setSfcjgly(userEntity.getSfcjgly());
			}
			pubYxPage.setJsdm(userEntity.getJsdm());//角色代码
		    
		    
			List<Map> xyList = pubYxService.queryPubYxList(pubYxPage);//查询院系列表(添加)
			model.addAttribute("jysList",jysList);
			model.addAttribute("jyslx_list",jyslx_list);
			model.addAttribute("xyList",xyList);
		}catch(Exception e){
			System.err.println("queryJysgl操作失败!!");
			e.printStackTrace();
		}
		return "commons/jcxgxxwh/jysgl";
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
			xlist = jysglService.queryXList(yxdm);
		}catch(Exception e){
			System.err.println("queryXByY操作失败!!");
			e.printStackTrace();
		}
		return xlist;
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
			YxdmbEntity yxdmb = jysglService.querySfglbm(yxdmbEntity);
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
	 * 增加或修改教研室
	 * @param zylbbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addJysglSz")
	public String addOrUpdJysgl(JysbEntity jysbEntity,String zt,HttpSession session){
		try{
			UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
			if(zt.equals("1")){
				jysbEntity.setYhdm(userEntity.getYhdm());
				jysbEntity.setJsdm(userEntity.getJsdm().toString());
				jysbEntity.setCjr(userEntity.getYhdm());
				jysbEntity.setCjsj(new Date());
				jysglService.addJys(jysbEntity);
			}else{
				jysglService.updJys(jysbEntity);
			}
		}catch(Exception e){
			System.err.println("addOrUpdJysgl操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	/**
 	 * 根据代码查询教研室
 	 * @param dm
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("queryJysByDm")
	public JysbEntity queryJysByDm(String jysdm){
		JysbEntity jysbEntity= null;
		try{
			jysbEntity= jysglService.queryJysByDm(jysdm);
		}catch(Exception e){
			System.err.println("queryJysByDm操作失败!!");
			e.printStackTrace();
		}
		return jysbEntity;
	}
	/**
 	 * 删除教研室
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delJys")
	public String delJys(String[] ids){
		try{
			jysglService.delJys(ids);
		}catch(Exception e){
			System.err.println("delJys操作失败!!");
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
	public Boolean queryByDmCount(String jysdm,String zt){
		Boolean bo = false;
		try {
			if(zt.equals("1")){
				bo = jysglService.queryByDmCount(jysdm) == 0 ? true : false;
			}else{
				bo = jysglService.queryByDmCount(jysdm) == 1 ? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByDmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
}

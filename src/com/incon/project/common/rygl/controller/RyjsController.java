package com.incon.project.common.rygl.controller;

import java.util.ArrayList;
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
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.JyssjqxbEntity;
import com.incon.pojo.common.RyjsbEntity;
import com.incon.pojo.common.SjqxbEntity;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.YxdmbEntity;
import com.incon.pojo.common.jcxgxxwh.JysbEntity;
import com.incon.pojo.common.jcxgxxwh.JyslxbEntity;
import com.incon.project.common.jcxgxxwh.jys.page.JysglPage;
import com.incon.project.common.jcxgxxwh.jys.service.JysglService;
import com.incon.project.common.rygl.page.JysQxPage;
import com.incon.project.common.rygl.page.RyjsPage;
import com.incon.project.common.rygl.service.RyjsService;

/**
 * 
 * @类名：  com.incon.project.common.rygl.controller.RyjsController
 * @创建人： 樊旭
 * @日期： 2014-3-17
 * @修改人：
 * @日期：
 * @描述： 人员角色管理
 * @版本号：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/ryjs")
public class RyjsController {
	@Resource(name="ryjsService")
	private RyjsService ryjsService;
	
	@Resource(name="jysglService")
	private JysglService jysglService;
	
	@Resource(name="pubYxService")
	private PubYxService pubYxService;
	/**
	 * 查询所有人员角色
	 * @param model
	 * @param ryjsPage
	 * @return
	 */
	@RequestMapping("ryjsQuery")
	public String ryjsQuery(Model model,RyjsPage ryjsPage,HttpSession session){
		try {
			UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
			JsbEntity jsbEntity = new JsbEntity();
			String glyx = ryjsService.queryGlyx(userEntity.getYhdm());
			if(userEntity.getSfcjgly() == null){
				jsbEntity.setSfcjgly("0");
			}else{
				jsbEntity.setSfcjgly(userEntity.getSfcjgly());
			}
			ryjsPage.setYhdm(userEntity.getYhdm());
			ryjsPage.setYhjsdm(userEntity.getJsdm().toString());
			ryjsPage.setSfcjgly(jsbEntity.getSfcjgly());
			ryjsPage.setGlyx(glyx);
			ryjsPage.setGljb(userEntity.getGljb());
			
			List<RyjsbEntity> list = ryjsService.query(ryjsPage);
			List<JsbEntity> list_js =ryjsService.queryJsb();
			model.addAttribute("list",list);
			model.addAttribute("list_js",list_js);
			
			PubYxPage pubYxPage= new PubYxPage();
			pubYxPage.setGljb(userEntity.getGljb());//管理级别
			pubYxPage.setYhdm(userEntity.getYhdm());//登录用户名
			if(userEntity.getSfcjgly() == null || userEntity.getSfcjgly().trim().equals("")){//是否超级管理员
				pubYxPage.setSfcjgly("0");			
			}else{
				pubYxPage.setSfcjgly(userEntity.getSfcjgly());
			}
			pubYxPage.setJsdm(userEntity.getJsdm());//角色代码
			List<Map> yxlist = pubYxService.queryPubYx(pubYxPage);//院系列表(搜索)
			model.addAttribute("yxlist", yxlist);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ryjsQuery操作失败!!");
		}
		return "commons/rygl/rygl";
	}
	
	/**
	 * 查询该角色所有的权限菜单和按钮
	 * @param ryjsbEntity
	 * @return
	 */
	@RequestMapping("queryQx")
	@ResponseBody
	public List<Map<String,String>> queryQx(RyjsbEntity ryjsbEntity,HttpSession session){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		ryjsbEntity.setDlr(userEntity.getYhdm());
		if(userEntity.getSfcjgly() == null){
			ryjsbEntity.setSfcjgly("0");
		}else{
			ryjsbEntity.setSfcjgly(userEntity.getSfcjgly());
		}
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		Map xxMap = new HashMap();
		try {
			xxMap.put("xzyhdm", ryjsbEntity.getYhdm());
			xxMap.put("xzyhjsdm", ryjsbEntity.getJsdm());
			xxMap.put("sfcjgly", userEntity.getSfcjgly()==null?"0":userEntity.getSfcjgly());
			xxMap.put("dqyhdm", userEntity.getYhdm());
			xxMap.put("dqyhjsdm", userEntity.getJsdm());
		//	list = ryjsService.queryQx(ryjsbEntity);
			list = ryjsService.queryQx(xxMap);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryQx操作失败!!");
		}
		return list;
	}
	
	/**
	 * 改变管理级别
	 * @param ryjsbEntity
	 * @return
	 */
	@RequestMapping("changeGljb")
	@ResponseBody
	public boolean changeGljb(RyjsbEntity ryjsbEntity){
		boolean reg;
		try {
			ryjsService.updGljb(ryjsbEntity);
			reg = true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("changeGljb操作失败!!");
			reg = false;
		}
		return reg;
	}
	
	/**
	 * 添加权限
	 * @param jsdm
	 * @param obj
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addQx")
	public boolean addQx(String jsdm,String yhdm,String id,String idd,String fid,HttpSession session){
		boolean reg;
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		if(userEntity.getSfcjgly() == null){
			userEntity.setSfcjgly("0");
		}
		try {
			ryjsService.addQx(jsdm,yhdm,id,idd,fid,userEntity.getYhdm(),userEntity.getSfcjgly(),userEntity);
			reg = true;
		} catch (Exception e) {
			System.err.println("addQx操作失败!!");
			e.printStackTrace();
			reg = false;
		}
		return reg;
	}
	
	/**
	 * 查询数据权限表
	 * @param sjqxbEntity
	 * @param model
	 * @return
	 */
	@RequestMapping("querySjqx")
	public String querySjqx(SjqxbEntity sjqxbEntity,Model model,HttpSession session){
		String yhdm = "";
		String jsdm = "";
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		if(userEntity.getSfcjgly() == null){
			userEntity.setSfcjgly("0");
		}
		sjqxbEntity.setDlr(userEntity.getYhdm());
		sjqxbEntity.setDlrjsdm(userEntity.getJsdm().toString());
		sjqxbEntity.setSfcjgly(userEntity.getSfcjgly());
		sjqxbEntity.setGljb(userEntity.getGljb());
		
		try {
			List<SjqxbEntity> list = ryjsService.querySjqx(sjqxbEntity);
			if(sjqxbEntity.getYhdm() == null){
				sjqxbEntity.setYhdm(null);
			}else{
				yhdm = sjqxbEntity.getYhdm();
			}
			if(sjqxbEntity.getJsdm() == null){
				sjqxbEntity.setJsdm(null);
			}else{
				jsdm = sjqxbEntity.getJsdm();
			}
			model.addAttribute("list",list);
			model.addAttribute("yhdm",yhdm);
			model.addAttribute("jsdm",jsdm);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("querySjqx操作失败!!");
		}
		return "commons/rygl/sjqx";
	}
	
	/**
	 * 添加数据权限
	 * @param sjqxbEntity
	 * @return
	 */
	@RequestMapping("addSjqx")
	@ResponseBody
	public boolean addSjqx(SjqxbEntity sjqxbEntity,HttpSession session){
		boolean reg;
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		sjqxbEntity.setDlr(userEntity.getYhdm());
		sjqxbEntity.setDlrjsdm(userEntity.getJsdm().toString());
		if(userEntity.getSfcjgly() == null || userEntity.getSfcjgly().isEmpty()){
			sjqxbEntity.setSfcjgly("0");
		}else{
			sjqxbEntity.setSfcjgly(userEntity.getSfcjgly());
		}
		sjqxbEntity.setGljb(userEntity.getGljb());
		try {
			ryjsService.addSjqx(sjqxbEntity);
			reg = true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("addSjqx操作失败!!");
			reg = false;
		}
		return reg;
	}
	
	/**
	 * 添加教研室数据权限
	 * @param sjqxbEntity
	 * @return
	 */
	@RequestMapping("addJysSjqx")
	@ResponseBody
	public boolean addJysSjqx(JyssjqxbEntity jyssjqxbEntity,HttpSession session){
		boolean reg;
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		jyssjqxbEntity.setCjr(userEntity.getYhdm());
		jyssjqxbEntity.setCjsj(new Date());
		jyssjqxbEntity.setDqjsdm(userEntity.getJsdm().toString());
		jyssjqxbEntity.setDqyhdm(userEntity.getYhdm());
		if(userEntity.getSfcjgly() == null || userEntity.getSfcjgly().isEmpty()){
			jyssjqxbEntity.setSfcjgly("0");
		}else{
			jyssjqxbEntity.setSfcjgly(userEntity.getSfcjgly());
		}
		jyssjqxbEntity.setGljb(userEntity.getGljb());
		try {
			ryjsService.addJysSjqx(jyssjqxbEntity);
			reg = true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("addJysSjqx操作失败!!");
			reg = false;
		}
		return reg;
	}
	
	/**
	 * 查询所有角色，判断自己是否属于该角色
	 * @param ryjsbEntity
	 * @return
	 */
	@RequestMapping("queryJs")
	@ResponseBody
	public List<RyjsbEntity> queryJs(RyjsbEntity ryjsbEntity,HttpSession session){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		List<RyjsbEntity> list = new ArrayList<RyjsbEntity>();
		if(userEntity.getSfcjgly() == null){
			ryjsbEntity.setSfcjgly("0");
		}else{
			ryjsbEntity.setSfcjgly(userEntity.getSfcjgly());
		}
		ryjsbEntity.setDlr(userEntity.getYhdm());
		try {
			list = ryjsService.queryJs(ryjsbEntity);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryJs操作失败!!");
		}
		return list;
	}
	
	/**
	 * 添加人员角色
	 * @param ryjsbEntity
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addJs")
	public String addJs(RyjsbEntity ryjsbEntity,String jsdms,HttpSession session){
		try {
			UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
			if(userEntity.getSfcjgly() == null){
				userEntity.setSfcjgly("0");
			}
			ryjsbEntity.setSfcjgly(userEntity.getSfcjgly());
			ryjsbEntity.setDlr(userEntity.getYhdm());
			ryjsbEntity.setCjr(userEntity.getYhdm());
			ryjsbEntity.setJsdm(jsdms);
			ryjsService.addJs(ryjsbEntity);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("addJs操作失败!!");
		}
		return null;
	}
	
	/**
	 * 改变登录表默认角色
	 * @param ryjsbEntity
	 * @return
	 */
	@ResponseBody
	@RequestMapping("ryjsChangeMrjs")
	public String ryjsChangeMrjs(UserEntity userEntity){
		try {
			ryjsService.changeMrjs(userEntity);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ryjsChangeMrjs操作失败!!");
		}
		return null;
	}
	
	@RequestMapping("/queryJysSjqx")
	public String queryJysgl(Model model,JysbEntity jysbEntity,JysQxPage jysQxPage,HttpSession session,String yhdm,String jsdm){
		//教研室列表
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		try{
			Map map = new HashMap();
			map.put("jsdm", jsdm);
			map.put("yhdm", yhdm);
			map.put("dqjsdm", userEntity.getJsdm());
			map.put("dqyhdm", userEntity.getYhdm());
			map.put("gljb", userEntity.getGljb());
			if(userEntity.getSfcjgly() == null || userEntity.getSfcjgly().isEmpty()){
				map.put("sfcjgly","0");			
			}else{
				map.put("sfcjgly",userEntity.getSfcjgly());
			}
			
			List<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>();
			list = ryjsService.queryJysAll(map);
			String jysdms = "";
			for(int i=0;i<list.size();i++){
				
				jysdms =  jysdms + list.get(i).get("JYSDM") + ",";
			}
			String ids = jysQxPage.getIds();
			
			if(ids == null || "".equals(ids)){
				ids = ","+jysdms;
			} 
			if(ids.equals(",")){
				ids = null;
			}else{
				ids=ids.substring(1, ids.length() - 1);
			}
			if(ids != null){
				String[] temp = ids.split(",");
				String idss = "";
				if(temp!=null && temp.length>0){
					for(int i=0;i<temp.length;i++){
						if(i<temp.length -1 ){
							idss = idss + "'"+ temp[i] +"',";
						}else{
							idss = idss + "'"+ temp[i] +"'";
						}
					}
				}
				jysQxPage.setIdss(idss);
			}
			jysQxPage.setIds(ids);
			jysQxPage.setGljb(userEntity.getGljb());//管理级别
			jysQxPage.setYhdm(userEntity.getYhdm());//登录用户名
			if(userEntity.getSfcjgly() == null || userEntity.getSfcjgly().isEmpty()){//是否超级管理员
				jysQxPage.setSfcjgly("0");			
			}else{
				jysQxPage.setSfcjgly(userEntity.getSfcjgly());
			}
			
			jysQxPage.setJsdm(userEntity.getJsdm().toString());//角色代码
			Map mapcount = new HashMap();
			mapcount.put("jsdm", userEntity.getJsdm());
			mapcount.put("yhdm", userEntity.getYhdm());
			int jysCount = jysglService.queryJyssjqxCount(mapcount);
			if(jysCount>0){
				jysQxPage.setResultCount("1");
			}else{
				jysQxPage.setResultCount("0");
			}
			List<JysbEntity> jysList = ryjsService.query(jysQxPage);
			
			if(ids!=null){
				List<JysbEntity> yxjysList = ryjsService.queryJyxYx(jysQxPage);
				model.addAttribute("yxjysList",yxjysList);
			}
			if(ids==null){
				ids=",";
			}else{
				ids = "," + ids + ",";
			}
			jysQxPage.setIds(ids);
			
			model.addAttribute("jysQxPage",jysQxPage);
			List<JyslxbEntity> jyslx_list = jysglService.queryJyslx();

			UserEntity user = ryjsService.queryUser(userEntity);
			PubYxPage pubYxPage= new PubYxPage();
			pubYxPage.setGljb(userEntity.getGljb());//管理级别
			pubYxPage.setYhdm(userEntity.getYhdm());//登录用户名
			if(userEntity.getSfcjgly() == null || userEntity.getSfcjgly().trim().equals("")){//是否超级管理员
				pubYxPage.setSfcjgly("0");			
			}else{
				pubYxPage.setSfcjgly(userEntity.getSfcjgly());
			}
			pubYxPage.setJsdm(userEntity.getJsdm());//角色代码
			List<Map> xyList = pubYxService.queryPubYxList(pubYxPage);
			model.addAttribute("jysList",jysList);
			model.addAttribute("jyslx_list",jyslx_list);
			model.addAttribute("xyList",xyList);
			
			model.addAttribute("yhdm",yhdm);
			model.addAttribute("jsdm",jsdm);
			
		}catch(Exception e){
			System.err.println("queryJysgl操作失败!!");
			e.printStackTrace();
		}
		return "commons/rygl/jyssjqx";
	}
	
	
}

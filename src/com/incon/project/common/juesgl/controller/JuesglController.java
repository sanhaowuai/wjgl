package com.incon.project.common.juesgl.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.UserEntity;
import com.incon.project.common.juesgl.page.JuesglPage;
import com.incon.project.common.juesgl.service.JuesglService;

/**
 * 
 * @类名：  com.incon.project.common.juesgl.controller.JuesglController
 * @创建人： 于洋
 * @日期： 2014-3-14
 * @修改人：
 * @日期：
 * @描述： 角色管理
 * @版本号：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/juesgl")
public class JuesglController {
	@Resource(name="juesglService")
	private JuesglService juesglService;
	
	/**
	 * 查询角色
	 * @param model
	 * @param juesglPage
	 * @return
	 */
	@RequestMapping("queryJs")
	public String queryJs(Model model,JuesglPage juesglPage,HttpSession session){
		try {
			UserEntity userEntity=(UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
			juesglPage.setSfcjgly(userEntity.getSfcjgly());
			juesglPage.setYhdm(userEntity.getYhdm());
			List<JsbEntity> jsList = juesglService.query("juesgl.queryJs",juesglPage);
			List<Map<String,String>> zyljdzList = juesglService.query("juesgl.queryZyljdzList");
			model.addAttribute("jsList",jsList);
			model.addAttribute("zyljdzList",zyljdzList);
		} catch (Exception e) {
			System.err.println("queryJs操作失败!!");
			e.printStackTrace();
		}
		return "commons/juesgl/juesgl";
	}

	/**
	 * 异步查询出所有角色
	 */
	@ResponseBody
	@RequestMapping("/queryFjJs")
	public List<JsbEntity> queryFjJs(JuesglPage juesglPage, HttpSession session){
		try {
			UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
			juesglPage.setSfcjgly(userEntity.getSfcjgly());
			juesglPage.setYhdm(userEntity.getYhdm());
			List<JsbEntity> jsList = juesglService.query("juesgl.queryJs", juesglPage);
			return jsList;
		} catch (Exception e) {
			System.err.println("queryFjJs操作失败!!");
			e.printStackTrace();
		}

		return null;
	}
	
	/**
	 * 增加或修改角色
	 * @param jsbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addOrUpdJs")
	public String addOrUpdJs(JsbEntity jsbEntity,String zt){
		try {
			if(zt.equals("1")){		//增加
				juesglService.addJs(jsbEntity);
			}else{					//修改
				juesglService.updJsByJsdm(jsbEntity);
			}
		} catch (Exception e) {
			System.err.println("addOrUpdJs操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	
	/**
 	 * 根据角色代码查询角色
 	 * @param jsdm
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("queryJsByJsdm")
    public JsbEntity queryJsByJsdm(String jsdm){
		JsbEntity jsbEntity = null;
		try {
			jsbEntity = juesglService.queryJsByJsdm(jsdm);
		} catch (Exception e) {
			System.err.println("queryJsByJsdm操作失败!!");
			e.printStackTrace();
		}
    	return jsbEntity;
    }
	
	/**
	 * 获取权限树形菜单
	 * @param jsdm
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryQx")
	public Object queryQx(String jsdm,HttpSession session){
		Map map = new HashMap();
		Map xxMap = new HashMap();
		try {
			xxMap.put("jsdm", jsdm);
			xxMap.put("sfcjgly", ((UserEntity)session.getAttribute(WebConstants.CURRENT_USER)).getSfcjgly());
			xxMap.put("yhdm", ((UserEntity)session.getAttribute(WebConstants.CURRENT_USER)).getYhdm());
			xxMap.put("yhjsdm", ((UserEntity)session.getAttribute(WebConstants.CURRENT_USER)).getJsdm());
			List<Map<String, String>> list1 = juesglService.queryQx(xxMap);
			map.put("list1", list1);
		} catch (Exception e) {
			System.err.println("queryQx操作失败!!");
			e.printStackTrace();
		}
		return map;
	}
	
	/**
	 * 添加权限
	 * @param jsdm
	 * @param obj 菜单and按钮
	 * @param objqxfdm 菜单父代码
	 * @param objqxzt 判断按钮or菜单状态
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addQx")
	public String addQx(String jsdm,String obj,String objqxfdm,String objqxzt,HttpSession session){
		UserEntity user = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		try {
			juesglService.addQx(jsdm, obj, objqxfdm, objqxzt,user);
		} catch (Exception e) {
			System.err.println("addQx操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	
	/**
 	 * 删除角色
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delJs")
    public String delJs(String[] ids){
		try {
			juesglService.delJs(ids);
		} catch (Exception e) {
			System.err.println("delJs操作失败!!");
			e.printStackTrace();
		}
    	return null;
    }
	
	/**
	 * 查询jsdm是否重复
	 * @param jsdm
	 * @param 1:增加		2:修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryByJsdmCount")
	public Boolean queryByJsdmCount(String jsdm,String zt){
		Boolean bo = false;
		try {
			if(zt.equals("1")){
				bo = juesglService.queryByJsdmCount(jsdm) == 0 ? true : false;
			}else{
				bo = juesglService.queryByJsdmCount(jsdm) == 1 ? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByJsdmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
	/**
	 * 根据角色代码批量插入用户角色比表
	 * @param jsdm
	 * @param zt
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addRyjsbByJsdm")
	public Boolean addRyjsbByJsdm(String jsdm,HttpSession session,HttpServletResponse res){
		UserEntity user = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		Boolean bo = false;
		try {
			juesglService.addRyjsbByJsdm(user.getYhdm(), jsdm);
			bo = true;
		} catch (Exception e) {
			System.err.println("addRyjsbByJsdm操作失败!!");
			e.printStackTrace();
		}		
		
		return bo;
	}
}

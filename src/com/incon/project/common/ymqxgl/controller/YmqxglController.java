package com.incon.project.common.ymqxgl.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.pojo.common.AnbEntity;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.QxbEntity;
import com.incon.pojo.common.YxdmbEntity;
import com.incon.pojo.common.ZybEntity;
import com.incon.project.common.ymqxgl.page.YmqxglPage;
import com.incon.project.common.ymqxgl.service.YmqxglService;
import com.incon.project.common.yxgl.service.YxglService;

/**
 * 
 * @类名： com.incon.project.common.ymqxgl.YmqxglController
 * @创建人： 杨文龙
 * @日期： 2014-3-12
 * @修改人：
 * @日期：
 * @描述：  页面权限管理
 * @版本号：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/ymqxgl")
public class YmqxglController {

	@Resource(name="ymqxglService")
	private YmqxglService ymqxglService;
	
	/**
	 * 查询按钮管理
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("queryAnb")
	public String queryAnb(Model model,YmqxglPage ymqxglPage,AnbEntity anbEntity){
		try {
			List<AnbEntity> anlist = ymqxglService.query(ymqxglPage);
			List<AnbEntity> qxlist = ymqxglService.queryQxbToList(anbEntity);
			model.addAttribute("anlist", anlist);
			model.addAttribute("qxlist", qxlist);
			model.addAttribute("ymqxglPage", ymqxglPage);
		} catch (Exception e) {
			System.err.println("queryAnb操作失败!!");
			e.printStackTrace();
		}
		return "commons/ymqxgl/ymqxgl";
	}
	/**
	 * 增加或修改角色
	 * @param jsbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addAnsz")
	public String addOrUpdYx(AnbEntity anbEntity,String zt,YmqxglPage ymqxglPage){
		try {
			if(zt.equals("1")){		//增加
				ymqxglService.addAn(anbEntity);
			}else{					//修改
				ymqxglService.updAn(anbEntity);
			}
		} catch (Exception e) {
			System.err.println("addOrUpdYx操作失败!!");
			e.printStackTrace();
		}
		return null;
	}

	
	/**
	 * 查询一个按钮信息
	 * @param andm
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryOneAn")
	public AnbEntity queryOneAn(String andm){
		AnbEntity anbEntity=null;
		try{
			anbEntity=ymqxglService.queryOneAn(andm);
			
		}catch(Exception e){
			System.err.println("queryOneAn操作失败!!");
			e.printStackTrace();
		}
		return anbEntity;
	}
	
	/**
	 * 删除按钮
	 * @param session
	 * @param ret
	 * @return
	 */
	@ResponseBody
	@RequestMapping("delAn")
	public String delAn(String[] ids){
		//查询
		try {
			ymqxglService.delAn(ids);
		} catch (Exception e) {
			System.err.println("delAn操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 查询andh是否重复
	 * @param andh
	 * @param 1:增加		2:修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryByAndhCount")
	public Object queryByAndhCount(AnbEntity anbEntity,String zt){
		Integer ret = 0;
		try {
			if(zt.equals("1")){
				ret = ymqxglService.queryByAndhCount(anbEntity) == 0 ? 0 : 1;
			}else{
				AnbEntity an = ymqxglService.queryOneAn(anbEntity.getAndm());
				if(an.getAndh().equals(anbEntity.getAndh()) && an.getFwlj().equals(anbEntity.getFwlj()) && an.getQxdm().equals(anbEntity.getQxdm())){
					ret = ymqxglService.queryByAndhCount(anbEntity) == 1 ? 0 : 1;
				}else{
					ret = ymqxglService.queryByAndhCount(anbEntity) == 0 ? 0 : 1;
				}
			}
		} catch (Exception e) {
			System.err.println("queryByAndhCount操作失败!!");
			e.printStackTrace();
		}
		return ret;
	}
	
	/**********按钮功能表 丁起明 20170717*********************************************************************/
	@ResponseBody
	@RequestMapping(value="updOrAddAngnb",method = RequestMethod.POST)
	public void updOrAddAngnb(HttpServletResponse res,HttpServletRequest request,@RequestBody Map m1) throws Exception{
		PrintWriter writer = res.getWriter();
		JSONObject jsonObject  = new JSONObject();  
		boolean success = true;
		String message = "执行失败";
		ymqxglService.updOrAddAngnb(m1);
		jsonObject.put("success", success);
		if(success==true){
			message="执行成功";
		}
		jsonObject.put("message", message);
		writer.print(jsonObject);
	}	

	@ResponseBody
	@RequestMapping(value="delAngnb",method = RequestMethod.POST)
	public void delAngnb(HttpServletResponse res,HttpServletRequest request,String andm) throws Exception{
		PrintWriter writer = res.getWriter();
		JSONObject jsonObject  = new JSONObject();  
		boolean success = true;
		String message = "执行失败";
		ymqxglService.delAngnb(andm);
		jsonObject.put("success", success);
		if(success==true){
			message="执行成功";
		}
		jsonObject.put("message", message);
		writer.print(jsonObject);
	}
	@ResponseBody
	@RequestMapping(value="queryAngnbList")
	public List<AnbEntity> queryAngnbList(HttpServletRequest request) throws Exception{
		return ymqxglService.queryAngnbList();
	}
	/**********按钮功能表 丁起明 20170717*********************************************************************/
}
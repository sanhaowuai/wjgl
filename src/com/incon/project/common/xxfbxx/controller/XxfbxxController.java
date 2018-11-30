package com.incon.project.common.xxfbxx.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.incon.common.upload.service.UploadService;
import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.YxdmbEntity;
import com.incon.pojo.common.ZybEntity;
import com.incon.pojo.common.xxfbxx.XxfbEntity;
import com.incon.project.common.xxfbxx.page.XxfbxxglPage;
import com.incon.project.common.xxfbxx.page.XxfbxxlljlPage;
import com.incon.pojo.common.xxfbxx.XxfbEntity;
import com.incon.project.common.xxfbxx.page.XxfbckPage;
import com.incon.project.common.xxfbxx.service.XxfbxxService;
import com.incon.project.common.yxgl.page.YxglPage;
import com.incon.project.common.yxgl.service.YxglService;
import com.incon.project.common.zygl.page.ZyglPage;
import com.incon.project.common.zygl.service.ZyglService;
/**
 * 
 * @类名：com.incon.project.common.xxfbxx.controller.XxfbxxController
 * @创建人：安智博
 * @日期：2016-8-17
 * @描述：学校发布信息控制器
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/xxfbxx")
public class XxfbxxController {

	@Resource(name="xxfbxxService")
	private XxfbxxService xxfbxxService;
	@Resource(name="uploadService")
	private UploadService uploadService;
	
	/**
	 * 查询学校信息发布（管理端）
	 * @param model
	 * @param xxfbxxglPage
	 * @return
	 */
	@RequestMapping("queryXxfbgl")
	public String queryXxfbgl(Model model, XxfbxxglPage xxfbxxglPage, String flag){
		try {
			List<Map<String, String>> xxlbList = xxfbxxService.queryXxlblist();
			model.addAttribute("xxlbList", xxlbList);
			List<Map<String, String>> bmList = xxfbxxService.queryFbbmlist();
			model.addAttribute("bmList", bmList);
			List<XxfbEntity> list = xxfbxxService.query(xxfbxxglPage);
			model.addAttribute("list", list);
			model.addAttribute("flag", flag);
		} catch (Exception e) {
			System.err.println("queryXxfbgl操作失败!!");
			e.printStackTrace();
		}
		return "commons/xxfbxx/xxfbxxgl";
	}
	
	/**
	 * 跳转学校发布信息维护页
	 * @param model
	 * @param xxfbxxglPage
	 * @param xxid
	 * @return
	 */
	@RequestMapping("toXxfbxxwh")
	public String toXxfbxxwh(Model model, XxfbxxglPage xxfbxxglPage, String xxid, String FQXMC, String QXMC){
		try {
			Map<String, String> QXB = new HashMap<String, String>();
			QXB.put("FQXMC", FQXMC);
			QXB.put("QXMC", QXMC);
			model.addAttribute("QXB", QXB);
			List<Map<String, String>> xxlbList = xxfbxxService.queryXxlblist();
			model.addAttribute("xxlbList", xxlbList);
			if (xxid != null && !xxid.equals("")) {
				XxfbEntity entity = xxfbxxService.queryXxfbxxByXxid(xxid);
				model.addAttribute("entity", entity);
				String listfjjson = JSON.toJSONString(uploadService.queryFj("PT_XT_XXFB", "XXID", xxid)).replaceAll("\"", "'");
				model.addAttribute("listfjjson", listfjjson);
			}else {
				model.addAttribute("newxxid", UUID.randomUUID().toString());
			}
		} catch (Exception e) {
			System.err.println("toXxfbxxwh操作失败!!");
			e.printStackTrace();
		}
		return "commons/xxfbxx/xxfbxxwh";
	}
	
	/**
	 * 添加或修改学校发布信息
	 * @param model
	 * @param request
	 * @param session
	 * @param qfjs
	 * @param hfjs
	 * @param del_fjs
	 * @param entity
	 * @param xxfbxxglPage
	 * @return
	 */
	@RequestMapping("addOrUpdXxfbxx")
	public String addOrUpdXxfbxx(Model model, HttpServletRequest request, HttpSession session, String[] qfjs, String[] hfjs, String[] del_fjs, 
			XxfbEntity entity,XxfbxxglPage xxfbxxglPage){
		String flag = "";
		try{  
			UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
			xxfbxxService.addOrUpdXxfbxx("xxfbxx", "PT_XT_XXFB", "XXID", userEntity.getYhdm(), "", qfjs, hfjs, del_fjs, entity);
			flag = "success";
		}catch(Exception e){
			System.err.println("addOrUpdXxfbxx操作失败！");
			e.printStackTrace();
			flag = "error";
		}
		return "forward:/xxfbxx/queryXxfbgl?xxfbxxglPage="+xxfbxxglPage+"&flag="+flag;
	}
	
	/**
	 * 删除学校发布信息
	 * @param xxids
	 * @return
	 */
	@ResponseBody
	@RequestMapping("delXxfbxx")
	public int delXxfbxx(String[] xxids){
		try {
			xxfbxxService.delXxfbxx(xxids);
		} catch (Exception e) {
			System.err.println("delXxfbxx操作失败!!");
			e.printStackTrace();
			return -1;
		}
		return 1;
	}
	
	/**
	 * 查询学校发布信息浏览记录
	 * @param model
	 * @param xxfbxxglPage
	 * @param xxfbxxlljlPage
	 * @param FQXMC
	 * @param QXMC
	 * @return
	 */
	@RequestMapping("queryXxfbLljl")
	public String queryXxfbLljl(Model model, XxfbxxglPage xxfbxxglPage, XxfbxxlljlPage xxfbxxlljlPage, String FQXMC, String QXMC){
		try {
			Map<String, String> QXB = new HashMap<String, String>();
			QXB.put("FQXMC", FQXMC);
			QXB.put("QXMC", QXMC);
			model.addAttribute("QXB", QXB);
			List list = xxfbxxService.query(xxfbxxlljlPage);
			model.addAttribute("list", list);
		} catch (Exception e) {
			System.err.println("queryXxfbLljl操作失败!!");
			e.printStackTrace();
		}
		return "commons/xxfbxx/xxfbxxlljl";
	}
	
	/**
	 * 信息发布
	 * @param xxid
	 * @return
	 */
	@ResponseBody
	@RequestMapping("updXxfb")
	public int updXxfb(XxfbEntity entity, HttpSession session){
		try {
			UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
			xxfbxxService.updXxfb(entity, userEntity);
		} catch (Exception e) {
			System.err.println("updXxfb操作失败!!");
			e.printStackTrace();
			return -1;
		}
		return 1;
	}
	
	/***
	 * 信息发布查看
	 * 
	 * 
	 * */
	
	@RequestMapping("queryXXfbck")
	public String queryXXfbck(Model model,XxfbckPage xxfbckPage,HttpSession session){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		try {
			System.out.println("yonghuleixing===="+userEntity.getYhlx());
			xxfbckPage.setYhdm(userEntity.getYhdm());
			xxfbckPage.setYhlx(userEntity.getYhlx());
			 List<Map<String,String>> xxlblist = xxfbxxService.queryXxlblist();
			 model.addAttribute("xxlblist", xxlblist);
			 List<Map<String,String>> fbbmlist = xxfbxxService.queryFbbmlist();
			 model.addAttribute("fbbmlist", fbbmlist);
			 List<XxfbEntity> list = xxfbxxService.query(xxfbckPage);
			 model.addAttribute("list", list);
		} catch (Exception e) {
			System.err.println("queryXXfbck操作失败!!");
			e.printStackTrace();
		}
		return "commons/xxfbxx/xxfbck";
	}
	/***
	 * 通过xxid查询发布信息
	 * 
	 * 
	 * **/
	@RequestMapping("queryXXbyid")
	public   String  queryXXbyid(Model model,XxfbEntity xxfby,HttpSession session){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		try {
			xxfby.setYhdm(userEntity.getYhdm());
			XxfbEntity  xxfbEntity = xxfbxxService.queryXxByXxid(xxfby);
//			xxfbEntity.setQxdm(xxfby.getQxdm());
//			xxfbEntity.setFqxdm(xxfby.getFqxdm());
			List<Map<String,String>> fjlist = xxfbxxService.querFjlist(xxfby);
			model.addAttribute("fjlist", fjlist);
			xxfbEntity.setYhdm(userEntity.getYhdm());
			model.addAttribute("xxfbEntity", xxfbEntity);
		} catch (Exception e) {
			System.err.println("queryXXfbck操作失败!!");
			e.printStackTrace();
		}
		return "commons/xxfbxx/xxfbxxck";
	}
	
	
	
	/***
	 * 组件信息发布查看
	 * 
	 * 
	 * */
	
	@RequestMapping("queryZjXXfbck/{number}")
	public String queryZjXXfbck(Model model,XxfbckPage xxfbckPage,HttpSession session,@PathVariable("number") Integer number){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		try {
			xxfbckPage.setYhdm(userEntity.getYhdm());
			xxfbckPage.setYhlx(userEntity.getYhlx());
			xxfbckPage.setPageSize(number);
			 List<XxfbEntity> list = xxfbxxService.query(xxfbckPage);
			 model.addAttribute("list", list);
		} catch (Exception e) {
			System.err.println("queryZjXXfbck操作失败!!");
			e.printStackTrace();
		}
		return "commons/xxfbxx/zjxxfblist";
	}
}

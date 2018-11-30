package com.incon.project.common.zxtwh.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.zxtwh.ZxtwhEntity;
import com.incon.project.common.zxtwh.page.ZxtwhJsqxPage;
import com.incon.project.common.zxtwh.page.ZxtwhPage;
import com.incon.project.common.zxtwh.page.ZxtwhRyjsqxPage;
import com.incon.project.common.zxtwh.service.ZxtwhService;


/**
 * 子系统维护
 * @author zjn
 * @date 2016-09-01
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/zxtwh")
public class ZxtwhController {

	@Resource(name="zxtwhService")
	private ZxtwhService zxtwhService;
	
	@RequestMapping("queryZxtwh")
	public String queryZxtwh(Model model,ZxtwhPage page){		
		try {
			List<ZxtwhEntity> list = zxtwhService.query(page);			
			model.addAttribute("list", list);
			model.addAttribute("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return "commons/zxtwh/zxtwh";
	}
	
	/**
	 * 校验xtdm是否重复
	 * checkXtdm
	 * 1不重复 0重复
	 */
	@ResponseBody
	@RequestMapping("/checkXtdm")
	public String checkXtdm(String xtdm){
		return zxtwhService.checkXtdm(xtdm);
	}
	
	/**
	 * 添加或修改保存
	 * @param entity
	 * @param zt
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/addOrUpdZxtwh")
	public String addOrUpdZjwh(ZxtwhEntity entity,String zt){
		
		try {
			if(zt.equals("1")){
				zxtwhService.addZxtwh(entity);
			}else if(zt.equals("2")){
				zxtwhService.UpdZxtwh(entity);
			}				
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}		
		return "1";
	}
	
	/**
	 * 修改查询
	 * queryZxtwhOne
	 * @param dm
	 */
	@ResponseBody
	@RequestMapping("queryZxtwhOne")
	public ZxtwhEntity queryZxtwhOne(String dm){
		ZxtwhEntity zxtwhEntity = new ZxtwhEntity();
		try {
			zxtwhEntity = zxtwhService.queryZxtwhOne(dm);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return zxtwhEntity;		
	}
	/**
	 * 删除
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/delZxtwh")
	public String delZxtwh(String[] ids){		
		try {
			zxtwhService.delZxtwh(ids);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "1";
	}
	
	
	/**
	 * 角色管理-子系统授权
	 * @param model
	 * @param session
	 * @param page
	 * @param jsdm
	 * @return
	 */
	@RequestMapping("/queryZxtqx")
	public String queryZxtqx(Model model,HttpSession session,ZxtwhJsqxPage page,String jsdm){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		try {
			//System.out.println("================="+jsdm);
			page.setPjsdm(jsdm);
			List<ZxtwhEntity> list = zxtwhService.queryZxtqx(page);
			int sfqx = 0;
			for(ZxtwhEntity z : list){
				if("1".equals(z.getSfxz())){
					sfqx++;
				}
			}
			if(sfqx == list.size()){
				model.addAttribute("sfqx", "1");
			}else{
				model.addAttribute("sfqx", "0");
			}
			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("jsdm", jsdm);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "commons/juesgl/zxtsq";
	}
	/**
	 * 授权
	 * @param ids
	 * @param jsdm
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/addJsZxtsq")
	public String addJsZxtsq(String[] ids,String jsdm,String pxtmc){
		try {
//			zxtwhService.delJsZjsq(jsdm);				
			zxtwhService.addJsZxtsq(jsdm,ids,pxtmc);						
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}
		return "1";
	}
	
	/**
	 * 人员角色管理 -  授权
	 * @param model
	 * @param page
	 * @return
	 */
	@RequestMapping("/queryRyjsZxtqx")
	public String queryRyjsZxtqx(Model model,ZxtwhRyjsqxPage page){
		try {
			List<ZxtwhEntity> list = zxtwhService.queryRyjsZxtqx(page);
			int sfqx = 0;
			for(ZxtwhEntity z : list){
				if("1".equals(z.getSfxz())){
					sfqx++;
				}
			}
			if(sfqx == list.size()){
				model.addAttribute("sfqx", "1");
			}else{
				model.addAttribute("sfqx", "0");
			}
			model.addAttribute("list", list);
			model.addAttribute("page", page);			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return "commons/rygl/ryjszxtsq";
	}
	/**
	 * 人员角色管理 -  授权-保存
	 * @param ids
	 * @param jsdm
	 * @param yhdm
	 * @param qxlb
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addRyjsZxtsq")
	public String addRyjsZxtsq(String[] ids,String jsdm,String yhdm){
		String flg = "1";
		try {
			zxtwhService.addRyjsZxtsq(ids,jsdm,yhdm);			
		} catch (Exception e) {
			e.printStackTrace();
			flg =  "0";
		}
		return flg;
	}
}

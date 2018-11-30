package com.incon.project.common.xtfk.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.XtfkbEntity;
import com.incon.project.common.juesgl.page.JuesglPage;
import com.incon.project.common.juesgl.service.JuesglService;
import com.incon.project.common.xtfk.page.XtfkPage;
import com.incon.project.common.xtfk.service.XtfkService;

/**
 * 
 * @类名：  com.incon.project.common.xtfk.controller.XtfkController
 * @创建人： 于洋
 * @日期： 2014-5-6
 * @修改人：
 * @日期：
 * @描述： 系统反馈
 * @版本号：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/xtfk")
public class XtfkController {
	private static final Logger logger = Logger
    .getLogger(XtfkController.class);
	@Resource(name="xtfkService")
	private XtfkService xtfkService;

	/**
	 * 查询反馈信息
	 * @param model
	 * @param xtfkPage
	 * @param czlx 1:管理员 ； 2：普通用户
	 * @return
	 */
	@RequestMapping("queryXtfk/{czlx}")
	public String queryXtfk(HttpSession session,Model model,XtfkPage xtfkPage,@PathVariable("czlx") String czlx){
		String ret = "";
		try {
	        UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);	
	        if("2".equals(czlx)){
	        	xtfkPage.setYhdm(userEntity.getYhdm());
	        }
			List<XtfkbEntity> fkList = xtfkService.query(xtfkPage);
			model.addAttribute("fkList",fkList);
			List fklbbList = xtfkService.qeuryXtfklbb();
			model.addAttribute("fklbbList",fklbbList);
			model.addAttribute("xtfkPage", xtfkPage);
			model.addAttribute("czlx", czlx);
			
		} catch (Exception e) {
			System.err.println("queryXtfk操作失败!!");
			e.printStackTrace();
		}
		if(czlx.equals("1")){
			ret = "commons/xtfk/xtfk";
		}else if(czlx.equals("2")){
			ret = "commons/xtfk/xtfkForUser";
		}
		return ret;
	}
	
	
	/**
 	 * 删除反馈信息
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delFk")
    public String delFk(String[] ids){
		try {
			
			xtfkService.delFk(ids);
		} catch (Exception e) {
			System.err.println("delFk操作失败!!");
			e.printStackTrace();
		}
    	return null;
    }
	
	/**
	 * 修改处理标志
	 * @param dm
	 * @return
	 */
	@ResponseBody
	@RequestMapping("updClbz")
	public String updClbz(XtfkbEntity xtfkEntity){
		try {
			xtfkService.updClbz(xtfkEntity);
		} catch (Exception e) {
			System.err.println("updClbz操作失败!!");
			e.printStackTrace();
		}
		return "success";
	}
	
	/**
	 * 修改是否置顶
	 * @param xtfkEntity
	 * @return
	 */
	@ResponseBody
	@RequestMapping("updSfzd")
	public String updSfzd(XtfkbEntity xtfkEntity){
		try {
			xtfkService.updSfzd(xtfkEntity);
		} catch (Exception e) {
			System.err.println("updSfzd操作失败!!");
			e.printStackTrace();
		}
		return "success";
	}	
	
	/**
	 * 查询反馈详细信息
	 * @param model
	 * @param dm
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryFknrByDm")
	public XtfkbEntity queryFknrByDm(Model model,String dm){
		XtfkbEntity fknr = null;
		try {
			fknr = xtfkService.queryFknrByDm(dm);
			model.addAttribute("fknr",fknr);
		} catch (Exception e) {
			System.err.println("queryFknrByDm操作失败!!");
			e.printStackTrace();
		}
		return fknr;
	}
	

	
    /**
     * 增加反馈信息
	 * @param czlx 1:管理员 ； 2：普通用户
     * @param session
     * @return
     */
    @RequestMapping("addFk/{czlx}")
    @ResponseBody
    public String addFk(HttpSession session, XtfkbEntity xtfkbEntity,@PathVariable String czlx)
    {
        logger.debug("执行：addFk()");
        UserEntity userEntity = (UserEntity) session
                .getAttribute(WebConstants.CURRENT_USER);
        try
        {
        	if(czlx.equals("1")){
        		xtfkbEntity.setClr(userEntity.getYhdm());
                xtfkbEntity.setCzr(userEntity.getYhdm());
                xtfkService.addFk(xtfkbEntity);        		
        	}else if(czlx.equals("2")){
        		xtfkbEntity.setCzr(userEntity.getYhdm());
        		 xtfkService.addFk_user(xtfkbEntity);       
        	}
        }
        catch (Exception e)
        {
            logger.error("执行：addFk() 操作失败", e);
        }
        return "success";
    }
    
    /**
     * 修改反馈信息
	 * @param czlx 1:管理员 ； 2：普通用户
     * @param session
     * @return
     */
    @RequestMapping("updFk/{czlx}")
    @ResponseBody
    public String updFk(HttpSession session, XtfkbEntity xtfkbEntity,@PathVariable String czlx)
    {
        logger.debug("执行：updFk()");
        UserEntity userEntity = (UserEntity) session
                .getAttribute(WebConstants.CURRENT_USER);
        try
        {
        	if(czlx.equals("1")){
        		xtfkbEntity.setClr(userEntity.getYhdm());
                xtfkService.updFk(xtfkbEntity);        		
        	}else if(czlx.equals("2")){
        		xtfkbEntity.setClr(userEntity.getYhdm());
                xtfkService.updFk_user(xtfkbEntity);    
        	}        	
        }
        catch (Exception e)
        {
            logger.error("执行：updFk() 操作失败", e);
        }
        return "success";
    } 
    
 
}

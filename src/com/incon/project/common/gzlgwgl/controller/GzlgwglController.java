package com.incon.project.common.gzlgwgl.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.DataFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.incon.common.pub.pubYx.page.PubYxPage;
import com.incon.common.pub.pubYx.service.PubYxService;
import com.incon.framework.interseptor.WebConstants;
import com.incon.framework.util.FileUtil;
import com.incon.pojo.common.HelpbEntity;
import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.JsqxbEntity;
import com.incon.pojo.common.QxEntity;
import com.incon.pojo.common.RyjsqxbEntity;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.XxfbbEntity;
import com.incon.pojo.common.gzlgwgl.GzlgwglEntity;
import com.incon.pojo.common.gzlgwgl.RygwglEntity;
import com.incon.project.common.bmxxgl.page.BmxxPage;
import com.incon.project.common.gzlgwgl.page.RygwglPage;
import com.incon.project.common.gzlgwgl.page.RyxzPage;
import com.incon.project.common.gzlgwgl.service.GzlgwglService;
import com.incon.project.common.qxcdgl.page.RyjsqxPage;
import com.incon.project.common.qxcdgl.service.QxcdglService;
import com.incon.project.common.ymqxgl.service.YmqxglService;

/**
 * 
 * @类名：  com.incon.project.common.gzlgwgl.controller.GzlgwglController
 * @创建人： 李旭
 * @日期： 2018-2-2
 * @修改人：
 * @日期：
 * @描述： 岗位管理
 * @版本号：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/gzlgwgl")
public class GzlgwglController {
	@Resource(name="gzlgwglService")
	private GzlgwglService gzlgwglService;
	@Resource(name="pubYxService")
	private PubYxService pubYxService;
	
	
	private static final Logger logger = Logger.getLogger(GzlgwglController.class);
	
	/**
	 * 树形查询所有岗位
	 * @param model
	 * @return
	 */
	@RequestMapping("queryGzlgwgl")
	public String queryGzlgwgl(Model model,HttpSession session){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		try {
			List<GzlgwglEntity> gwgl_list = gzlgwglService.queryGzlgwgl();						
			model.addAttribute("gwgl_list",gwgl_list);
			//院系列表
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
			System.out.println("queryGzlgwgl操作失败!!");
		}
		System.out.println("========================bye");
		return "commons/gzlgwgl/gzlgwgl";
	}
	
	/**
	 * 查询所有岗位名称
	 * @return
	 */
	@RequestMapping("queryGwmc")
	@ResponseBody
	public List<GzlgwglEntity> queryGwmc(){
		List<GzlgwglEntity> list = new ArrayList<GzlgwglEntity>();
		try {
			list = gzlgwglService.queryGWcdgl();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryCdmc操作失败!!");
		}
		return list;
	}
	
	/**
	 * 查询所有岗位名称
	 * @return
	 */
	@RequestMapping("queryGwmcry")
	@ResponseBody
	public List<GzlgwglEntity> queryGwmcry(){
		List<GzlgwglEntity> list = new ArrayList<GzlgwglEntity>();
		try {
			list = gzlgwglService.queryGWcdglry();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryCdmcry操作失败!!");
		}
		return list;
	}
	
	
	/**
	 * 添加岗位
	 * @param qxcdglEntity
	 * @return
	 */
	@RequestMapping("addGzlgwgl")
	@ResponseBody
	public String addGzlgwgl(GzlgwglEntity gzlgwglEntity){
		
		String s="0";
		try {			
			gzlgwglService.addGzlgwgl(gzlgwglEntity);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("addGzlgwgl操作失败!!");
			s="1";
		}
		return s;
	}
	
	
	/**
	 * 根据岗位代码查询岗位
	 * @param zhi
	 * @return
	 */
	@RequestMapping("queryByGwdm")
	@ResponseBody
	public GzlgwglEntity queryByGwdm(String gwdm){
		GzlgwglEntity gwEntity = new GzlgwglEntity();
		try {
			gwEntity = gzlgwglService.queryByGwdm(gwdm);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryByGwdm操作失败!!");
		}
		return gwEntity;
	}
	
	
	/**
	 * 根据岗位代码修改岗位
	 * @param gzlgwglEntity
	 * @return
	 */
	@ResponseBody
	@RequestMapping("updGwcd")
	public String updGwcd(GzlgwglEntity gzlgwglEntity){
		try {
			
			gzlgwglService.updGwcd(gzlgwglEntity);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updGwcd操作失败!!");
		}
		return null;
	}
	
	/**
	 * 删除权限菜单
	 * @return
	 */
	@ResponseBody
	@RequestMapping("delGw")
	public String delQx(String gwdm){
		try {
			Map map=new HashMap<String,String>();
			map.put("gwdm", gwdm);
			gzlgwglService.delGw(map);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("delQx操作失败!!");
		}
		return null;
	}
	
	/**
	 * 查询所有人员岗位
	 * @param model
	 * @return
	 */
	@RequestMapping("queryRygwgl")
	public String queryRygwgl(Model model,HttpSession session,RygwglPage page){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		try {
			List<Map> rygw_list = gzlgwglService.query(page);						
			model.addAttribute("rygw_list",rygw_list);
			model.addAttribute("page",page);		
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryGzlgwgl操作失败!!");
		}
		System.out.println("========================bye");
		return "commons/gzlgwgl/rygwgl";
	}
	
	/**
     * 查询用户
     *
     * @param model
     * @param RyxzPage
     * @return
     */
    @RequestMapping("queryRyxz")
    public String queryRyxz(Model model,RyxzPage ryxzPage) {
        try {
            List<Map> xspyfakcblist = gzlgwglService.query(ryxzPage);	              		               		
            model.addAttribute("list", xspyfakcblist);
            model.addAttribute("page", ryxzPage);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("queryRyxz!!");
        }
        return "commons/gzlgwgl/selectryxz";
    }
    
	/**
	 * 添加人员岗位
	 * @param qxcdglEntity
	 * @return
	 */
	@RequestMapping("addRygwgl")
	@ResponseBody
	public String addRygwgl(RygwglEntity gygwglEntity){
		
		String s="0";
		try {			
			gzlgwglService.addRygwgl(gygwglEntity);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("addGzlgwgl操作失败!!");
			s="1";
		}
		return s;
	}
	
	
	/**
	 * 根据人员岗位代码查询人员岗位
	 * @param zhi
	 * @return
	 */
	@RequestMapping("queryRygwdm")
	@ResponseBody
	public RygwglEntity queryRygwdm(String rygwdm){
		RygwglEntity RyEntity = new RygwglEntity();
		try {
			RyEntity = gzlgwglService.queryRygwdm(rygwdm);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryByGwdm操作失败!!");
		}
		return RyEntity;
	}
	
	
	/**
	 * 根据人员岗位代码修改人员岗位
	 * @param gzlgwglEntity
	 * @return
	 */
	@ResponseBody
	@RequestMapping("updRycd")
	public String updRycd(RygwglEntity rygwglEntity){
		try {
			
			gzlgwglService.updRycd(rygwglEntity);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updRycd操作失败!!");
		}
		return null;
	}
	
	/**
 	 * 删除教师
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delRy")
    public String delRy(String[] ids){
		try {
			gzlgwglService.delRy(ids);
		} catch (Exception e) {
			System.err.println("delRy操作失败!!");
			e.printStackTrace();
		}
    	return null;
    }
	
	
	/**
 	 * 删除教师
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("queryRyyz")
    public int queryRyyz(RygwglEntity rygwglEntity){
		int i=0;
		try {
			 i= gzlgwglService.queryRyyz(rygwglEntity);
		} catch (Exception e) {
			System.err.println("delRy操作失败!!");
			e.printStackTrace();
		}
    	return i;
    }
}

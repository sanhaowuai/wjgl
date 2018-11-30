package com.incon.project.common.zxtrywh.controller;
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
import com.incon.common.pub.pubYx.service.PubYxService;
import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.JsxxbEntity;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.XsxxbEntity;
import com.incon.pojo.common.ZybEntity;
import com.incon.pojo.common.zxtrywhEntity;
import com.incon.pojo.common.dbsx.DbsxEntity;
import com.incon.pojo.common.lwgl.KxkzybEntity;
import com.incon.pojo.common.lwgl.LwsbbEntity;
import com.incon.pojo.common.lwgl.XsxtbEntity;
import com.incon.pojo.common.lwgl.XtczbEntity;
import com.incon.project.common.xtgl.page.XtglPage;
import com.incon.project.common.xtgl.service.XtglService;
import com.incon.project.common.zxtrywh.page.ZxtrywhPage;
import com.incon.project.common.zxtrywh.page.zxtwhPage;
import com.incon.project.common.zxtrywh.service.ZxtrywhService;
import com.incon.project.dbsx.page.DbsxPage;
import com.incon.project.dbsx.service.DbsxService;

/**
 * 
 * @类名： com.incon.project.common.zxtrywh.controller
 * @创建人： 赵玥(zhaoyue)
 * @日期： 2016-10-22
 * @版本号：
 * @说明：子系统人员维护
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/zxtrywh")
public class ZxtrywhController
{

    @Resource(name = "zxtrywhService")
    private ZxtrywhService zxtrywhService;



    @RequestMapping("/queryzxt")
    public String queryzxt(Model model ,zxtwhPage page, HttpSession session,String falg){
    	UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
    	try {
    		 
    		
    		List<zxtrywhEntity> List=zxtrywhService.query(page);
    		List<Map<String, String>> yxList=zxtrywhService.queryAllxy();
    		List<Map<String, String>> zxtList=zxtrywhService.queryAllzxt();
    		model.addAttribute("List", List);
       		model.addAttribute("yxList", yxList);
       		model.addAttribute("zxtList", zxtList);
       		model.addAttribute("page", page);
       		model.addAttribute("falg", falg);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryzxt 错误!"+e);
		}

        return "commons/zxtrywh/zxtrywh";
    }
    
    @RequestMapping("/queryzxtYh")
    public String queryzxtYh(Model model ,ZxtrywhPage page, HttpSession session){
    	DbsxEntity entity=null;
    	try {
    		List<zxtrywhEntity> List=zxtrywhService.query(page);
    		List<Map<String, String>> yxList=zxtrywhService.queryAllxy();
    		model.addAttribute("List", List);
       		model.addAttribute("yxList", yxList);
       		model.addAttribute("page", page);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryzxtYh 错误!"+e);
		}
        return "commons/zxtrywh/yhlist";
    }
   
  
    
    
    
	/**
	 * 增加或修改 
	 * @param  
	 * @param zt 1：增加  2：修改
	 * @return
	 */
    @ResponseBody
	@RequestMapping("addOrUpdZxt")
	public String addOrUpdZxt(zxtrywhEntity entity,String zt,String idss){
		String falg="";
		try {
			if(zt.equals("1")){		//增加
				zxtrywhService.addzxt(entity);
			}else{					//修改
				entity.setIds(idss);
				zxtrywhService.updzxt(entity);
			}
			falg="1";
		} catch (Exception e) {
			falg="0";
//			System.err.println("addOrUpdZxt操作失败!!");
//			e.printStackTrace();
		}
//		return "forward:/zxtrywh/queryzxt?falg="+falg;
		return falg;
	}
	/**
	 * 查询一个 
	 * @param zydm
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryOneZxt")
	public zxtrywhEntity queryOneZxt(String ids){
		zxtrywhEntity entity=null;
		try{
			entity=zxtrywhService.queryByidzxt(ids);
		}catch(Exception e){
			System.err.println("queryOneZxt操作失败!!");
			e.printStackTrace();
		}
		return entity;
	}
	

	/**
 	 * 删除 
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delZxt")
    public String delZxt(String[] ids){
		String falg="";
		try {
			zxtrywhService.delzxt(ids);
			falg="1";
		} catch (Exception e) {
			falg="0";
			System.err.println("delZxt操作失败!!");
			e.printStackTrace();
		}
    	//return "forward:/zxtrywh/queryzxt?falg="+falg;
		return falg;
	}
	/**
	 * 查询 是否重复
	 * @param  
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryByZxtCount")
	public Boolean queryByZxtCount(String ids,String zt){
		Boolean bo = false;
		try {
			if(zt.equals("1")){
				bo = zxtrywhService.querybyoneCount(ids) == 0? true:false;
			}else {
				bo = zxtrywhService.querybyoneCount(ids) == 1? true:false;
			}
		} catch (Exception e) {
			System.err.println("queryByZxtCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
  
   
}

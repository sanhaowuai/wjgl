package com.incon.project.dbsx.controller;
import java.util.Date;
import java.util.List;
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
import com.incon.pojo.common.dbsx.DbsxEntity;
import com.incon.pojo.common.lwgl.KxkzybEntity;
import com.incon.pojo.common.lwgl.LwsbbEntity;
import com.incon.pojo.common.lwgl.XsxtbEntity;
import com.incon.pojo.common.lwgl.XtczbEntity;
import com.incon.project.common.xtgl.page.XtglPage;
import com.incon.project.common.xtgl.service.XtglService;
import com.incon.project.dbsx.page.DbsxPage;
import com.incon.project.dbsx.service.DbsxService;

/**
 * 
 * @类名： com.incon.project.common.jsgl.controller.XtglController
 * @创建人： 赵玥(zhaoyue)
 * @日期： 2016-08-09
 * @版本号：
 * @说明：代办事项(更多)
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/dbsx")
public class DbsxController
{

    @Resource(name = "dbsxService")
    private DbsxService dbsxService;



    @RequestMapping("/queryDbsx")
    public String queryDbsx(Model model, DbsxEntity dbsxEntity,DbsxPage dbsxPage, HttpSession session){
    	UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
    	try {
    		dbsxPage.setJsdm(userEntity.getJsdm());//角色
    		dbsxPage.setYhdm(userEntity.getYhdm());//用户名
    		if(dbsxPage.getSfyd()==null ||dbsxPage.getSfyd().equals("")  )//判断是否已读
    		  {
    			dbsxPage.setSfyd("1");//1 标识  已读
    		  }
			List<DbsxEntity> listdbsx=dbsxService.query(dbsxPage);
			model.addAttribute("listdbsx", listdbsx);
			model.addAttribute("dbsxPage", dbsxPage);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryDbsx 错误!"+e);
		}

        return "commons/dbsx/dbsx";
    }
    
    @RequestMapping("/queryByidDbsx")
    public String queryByidDbsx(String id,String sfyd,Model model,DbsxPage dbsxPage, HttpSession session){
    	DbsxEntity entity=null;
         	UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
    	try {
    		System.out.println("???"+sfyd);
		    	if(sfyd.equals("0"))//如果已读状态为0  未读的时候   修改状态 为1
		    	{
		    		dbsxService.updByidDbsx(id,userEntity.getYhdm());
		    	}
		    	entity=dbsxService.queryByidDbsx(id);
		    	model.addAttribute("entity", entity);
		    	model.addAttribute("dbsxPage",dbsxPage);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryByidDbsx 错误!"+e);
		}
        return "commons/dbsx/oneDbsx";
    }
    
    /**
     * @author 丁起明
     * 控件查看地址
     * @param id
     * @param sfyd
     * @param model
     * @param dbsxPage
     * @param session
     * @return
     */
    @RequestMapping("/queryByidDbsx_sig")
    public String queryByidDbsx_sig(String id,String sfyd,Model model,DbsxPage dbsxPage, HttpSession session){
    	DbsxEntity entity=null;
         	UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
    	try {
		    	if(sfyd.equals("0"))//如果已读状态为0  未读的时候   修改状态 为1
		    	{
		    		dbsxService.updByidDbsx(id,userEntity.getYhdm());
		    	}
		    	entity=dbsxService.queryByidDbsx(id);
		    	model.addAttribute("entity", entity);
		    	model.addAttribute("dbsxPage",dbsxPage);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryByidDbsx_sig 错误!"+e);
		}
        return "commons/dbsx/oneDbsx_sig";
    }

    @RequestMapping("/queryDbsxTop5")
    public String queryDbsxTop5(Model model, DbsxEntity dbsxEntity,DbsxPage dbsxPage, HttpSession session){
    	UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
    	try {
    		dbsxPage.setJsdm(userEntity.getJsdm());//角色
    		dbsxPage.setYhdm(userEntity.getYhdm());//用户名
			List<DbsxEntity> listdbsx=dbsxService.queryDbsxTop5(dbsxPage);//查询未读前5条
			model.addAttribute("listdbsx", listdbsx);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryDbsxTop5 错误!"+e);
		}

        return "commons/dbsx/dbsxTop5";
    }
    
    @RequestMapping("/updSee")
    public String updSee(String id,String href, HttpSession session){
     	UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
    	String falg="";
    	try {
    		dbsxService.updByidDbsx(id,userEntity.getYhdm());
		} catch (Exception e) {
			e.printStackTrace();
			falg="0";
			System.out.println("updSee 错误!"+e);
		}
//		   return "redirect:"+href;
		return "redirect:"+href;
    }
    
    
    @ResponseBody
    @RequestMapping("/querySfkck")
    public Integer querySfkck(String id){
    	Integer falg=0;
   	try {
   		falg=dbsxService.querySfkck(id);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updSee 错误!"+e);
		}
//		   return "redirect:"+href;
		return falg;
   }
   
}

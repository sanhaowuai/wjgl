package com.incon.project.swtx.controller;
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
import com.incon.pojo.common.swtx.SwtxEntity;
import com.incon.project.common.xtgl.page.XtglPage;
import com.incon.project.common.xtgl.service.XtglService;
import com.incon.project.dbsx.page.DbsxPage;
import com.incon.project.dbsx.service.DbsxService;
import com.incon.project.swtx.page.SwtxPage;
import com.incon.project.swtx.service.SwtxService;

/**
 * 
 * @类名： com.incon.project.common.jsgl.controller.XtglController
 * @创建人： 赵玥(zhaoyue)
 * @日期： 2016-08-09
 * @版本号：
 * @说明：事务提醒(更多)
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/swtx")
public class SwtxController
{

    @Resource(name = "swtxService")
    private SwtxService swtxService;



    @RequestMapping("/querySwtx")
    public String querySwtx(Model model, SwtxEntity swtxEntity,SwtxPage swtxPage, HttpSession session){
    	UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
    	try {
    		swtxPage.setJsdm(userEntity.getJsdm());//角色
    		swtxPage.setYhdm(userEntity.getYhdm());//用户名
    		if(swtxPage.getSfyd()==null ||swtxPage.getSfyd().equals("")  )//判断是否已读
    		  {
    			swtxPage.setSfyd("1");//1 标识  已读
    		  }
			List<SwtxEntity> listswtx=swtxService.query(swtxPage);
			model.addAttribute("listswtx", listswtx);
			model.addAttribute("swtxPage", swtxPage);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryswtx 错误!"+e);
		}

        return "commons/swtx/swtx";
    }
    
    @RequestMapping("/queryByidSwtx")
    public String queryByidSwtx(String id,String sfyd,Model model,SwtxPage swtxPage, HttpSession session){
    	SwtxEntity entity=null;
    	UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
    	try {
		    	if(sfyd.equals("0"))//如果已读状态为0  未读的时候   修改状态 为1
		    	{
		    		swtxService.updByidSwtx(id,userEntity.getYhdm());
		    	}
		    	entity=swtxService.queryByidSwtx(id);
		    	model.addAttribute("entity", entity);
		    	model.addAttribute("swtxPage",swtxPage);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryByidDbsx 错误!"+e);
		}
        return "commons/swtx/oneSwtx";
    }
    
    /**
     * @author 丁起明
     * 控件跳转地址 
     * @param id
     * @param sfyd
     * @param model
     * @param swtxPage
     * @param session
     * @return
     */
    @RequestMapping("/queryByidSwtx_sig")
    public String queryByidSwtx_sig(String id,String sfyd,Model model,SwtxPage swtxPage, HttpSession session){
    	SwtxEntity entity=null;
    	UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
    	try {
		    	if(sfyd.equals("0"))//如果已读状态为0  未读的时候   修改状态 为1
		    	{
		    		swtxService.updByidSwtx(id,userEntity.getYhdm());
		    	}
		    	entity=swtxService.queryByidSwtx(id);
		    	model.addAttribute("entity", entity);
		    	model.addAttribute("swtxPage",swtxPage);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryByidDbsx 错误!"+e);
		}
        return "commons/swtx/oneSwtx_sig";
    }    

    @RequestMapping("/querySwtxTop5")
    public String querySwtxTop5(Model model, SwtxEntity swtxEntity,SwtxPage swtxPage, HttpSession session){
    	UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
    	try {
    		swtxPage.setJsdm(userEntity.getJsdm());//角色
    		swtxPage.setYhdm(userEntity.getYhdm());//用户名
			List<SwtxEntity> listswtx=swtxService.querySwtxTop5(swtxPage);//查询未读前5条
			model.addAttribute("listswtx", listswtx);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryswtxTop5 错误!"+e);
		}

        return "commons/swtx/swtxTop5";
    }
    
    
    @RequestMapping("/updSee")
     public String updSee(String id,String href, HttpSession session){
     	UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
     	String falg="";
    	try {
    		swtxService.updByidSwtx(id,userEntity.getYhdm());
		} catch (Exception e) {
			e.printStackTrace();
			falg="0";
			System.out.println("updSee 错误!"+e);
		}
		System.out.println(href+"-1-1-");
//		   return "redirect:"+href;
		return "redirect:"+href;
    }
    @ResponseBody
    @RequestMapping("/querySfkck")
    public Integer querySfkck(String id){
    	Integer falg=0;
   	try {
   		falg=swtxService.querySfkck(id);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updSee 错误!"+e);
		}
//		   return "redirect:"+href;
		return falg;
   }
   
    
}

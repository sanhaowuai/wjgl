package com.incon.project.common.yxzygl.controller;

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
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.YxdmbEntity;
import com.incon.pojo.common.ZybEntity;
import com.incon.project.common.xsgl.service.XsglService;
import com.incon.project.common.yxgl.page.YxglPage;
import com.incon.project.common.yxgl.service.YxglService;
import com.incon.project.common.yxzygl.page.YxZyglPage;
import com.incon.project.common.yxzygl.service.YxZyglService;
import com.incon.project.common.zygl.page.ZyglPage;
import com.incon.project.common.zygl.service.ZyglService;

/**
 * 
 * @类名： com.incon.project.common.zygl.controller.ZyglController
 * @修改人：
 * @日期：
 * @描述：  专业管理
 * @版本号：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/yxzygl")
public class YxZyglController {

 
	
	@Resource(name="yxzyglService")
	private YxZyglService yxzyglService;
	@Resource(name="zyglService")
	private ZyglService zyglService;
	@Resource(name="pubYxService")
	private PubYxService pubYxService;
	@Resource(name="xsglService")
	private XsglService xsglService;
	/**
	 * 查询专业管理
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("queryYxZygl")
	public String queryZygl(Model model,YxZyglPage yxzyglPage,HttpSession session){
		try {
			UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
			UserEntity user = xsglService.queryUser(userEntity);
			Map yxMap = new HashMap();
		    if(user.getSfcjgly() == null || user.getSfcjgly().equals("")){//是否超级管理员
				yxMap.put("sfcjgly","0");			
			}else{
				yxMap.put("sfcjgly", user.getSfcjgly());
			}
		    yxMap.put("gljb", user.getGljb());
		    yxMap.put("yhdm", user.getYhdm());
		    yxMap.put("jsdm", user.getJsdm());
			List<ZybEntity> zylist = yxzyglService.query(yxzyglPage);
			List<ZybEntity> zyxzlist = yxzyglService.queryZy();
			model.addAttribute("zylist", zylist);
			model.addAttribute("zyxzlist", zyxzlist);
			model.addAttribute("zyglPage",yxzyglPage);
			
			//List<Map> yxlist2 = yxzyglService.queryPubYxList(yxMap);//院系列表(添加)
			PubYxPage pubYxPage = new PubYxPage();
			if(userEntity.getSfcjgly() == null){
				pubYxPage.setSfcjgly("0");
			}else {
				pubYxPage.setSfcjgly(userEntity.getSfcjgly());
			}
			pubYxPage.setGljb(userEntity.getGljb());
			pubYxPage.setYhdm(userEntity.getYhdm());
			pubYxPage.setJsdm(userEntity.getJsdm());
			List<Map> yxlist2 = pubYxService.queryPubYxList(pubYxPage);
			model.addAttribute("yxlist2", yxlist2);
		} catch (Exception e) {
			System.err.println("queryZygl操作失败!!");
			e.printStackTrace();
		}
		return "commons/yxzygl/yxzygl";
	}

	/**
 	 * 删除专业
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delYxZy")
    public String delZy(String[] ids){
		try {
			yxzyglService.delZy(ids);
		} catch (Exception e) {
			System.err.println("delZy操作失败!!");
			e.printStackTrace();
		}
    	return null;
    }
	
	/**
 	 * 修改院系专业可用否
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("updYxzyKyf")
    public Integer updYxzyKyf(ZybEntity zybEntity){
		Integer result = null;
		try {
			result = yxzyglService.updYxzyKyf(zybEntity);
		} catch (Exception e) {
			System.err.println("updYxzyKyf 操作失败!!");
			e.printStackTrace();
		}
    	return result;
    }	
	
	/**
	 * 增加
	 * @param zybEntity
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addYxZy")
	public String addYxZy(ZybEntity zybEntity){
		yxzyglService.addYxZy(zybEntity);
		return null;
	}
}

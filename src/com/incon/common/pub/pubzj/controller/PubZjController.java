package com.incon.common.pub.pubzj.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.common.pub.pubzj.service.PubZjService;
import com.incon.framework.interseptor.WebConstants;
import com.incon.framework.util.propertiesLoader;
import com.incon.pojo.common.QxEntity;
import com.incon.pojo.common.UserEntity;
@Controller
public class PubZjController {
     
	private propertiesLoader loader = new propertiesLoader();//加载配置文件
	@Resource(name="pubZjService")
	private PubZjService pubZjService;
    	
	@ResponseBody
	@RequestMapping("saveLayout")
	public Map saveLayout(HttpSession session ,Model model,@RequestBody List<Map>   items){
		UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
		for(Map m:items){
			m.put("zjdm", m.get("id"));
			m.put("yhdm", userEntity.getYhdm());
			m.put("jsdm", userEntity.getJsdm());
		}
		pubZjService.saveLayout(items,userEntity);
		Map map= new HashMap();
		map.put("SUCCESS", true);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("saveLayout/{jsdm}")
	public Map saveLayoutJsdm(HttpSession session ,Model model,@RequestBody List<Map>   items){
		UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
		for(Map m:items){
			m.put("zjdm", m.get("id"));
			m.put("yhdm", userEntity.getYhdm());
			m.put("jsdm", userEntity.getJsdm());
		}
		pubZjService.saveLayoutJsdm(items,userEntity);
		Map map= new HashMap();
		map.put("SUCCESS", true);
		return map;
	}
	
	
	
	@ResponseBody
	@RequestMapping("loadLayout")
	public List<Map> loadLayout(HttpSession session ,Model model ){
		UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
		List<Map>   items =pubZjService.loadLayout(userEntity);
		if (items==null || items.isEmpty() || items.size()==0){
		            items =pubZjService.loadLayoutJsZj(userEntity);
		}
		return items;
	}
	
	@ResponseBody
	@RequestMapping("loadLayout/{jsdm}")
	public List<Map> loadLayoutJsdm(HttpSession session ,Model model ,@PathVariable Integer jsdm){
		UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
		userEntity.setJsdm(jsdm);
		List<Map>   items =pubZjService.loadLayoutJsZj(userEntity);
		 
		return items;
	}
	@ResponseBody
	@RequestMapping("querykyzj")
	public List<Map> querykyzj(HttpSession session ,Model model){
		UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
		List<Map> zjlist = pubZjService.ryZjqx(userEntity);
		return  zjlist;
	}
	@ResponseBody
	@RequestMapping("querykyzj/{jsdm}")
	public List<Map> querykyzjJsdm(HttpSession session ,Model model,@PathVariable Integer jsdm){
		UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
		userEntity.setJsdm(jsdm);
		List<Map> zjlist = pubZjService.ryZjqxJsdm(userEntity);
		return  zjlist;
	}
	@RequestMapping("querykjcd")
	public List<QxEntity> querykjcd(HttpSession session ,Model model){
		UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
		List<QxEntity> kjcdlist =pubZjService.querykjcd(userEntity);
		return kjcdlist;
	}
	
	@RequestMapping("querykjcdwz")
	public String querykjcdwz(HttpSession session ,Model model){
		UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
		String kjcdwz =pubZjService.querykjcdwz(userEntity);
		return kjcdwz;
	}
	@RequestMapping("jskjzjwh/{jsdm}")
	public String  jskjzjwh(Model model,@PathVariable Integer jsdm){
		model.addAttribute("jsdm", jsdm);
		return  "commons/jszjbj/zjbjwh";
	}
	@RequestMapping("jsmhzjwh/{yhlx}")
	public String  jsmhzjwh(Model model,@PathVariable String yhlx){
		model.addAttribute("yhlx", yhlx);
		String url=loader.getPropertyKey("/config/others/config.properties","inconmh.url");
		return  "redirect:"+url+"commons/jszjbj/zjbjwh";
	}
	
	
}

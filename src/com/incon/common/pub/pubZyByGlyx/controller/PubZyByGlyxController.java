package com.incon.common.pub.pubZyByGlyx.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.common.pub.pubZyByGlyx.sercice.PubZyByGlyxServive;
import com.incon.common.pub.pubZyByYx.service.PubZyByYxService;

@Controller
@RequestMapping("pubZyByGlyx")
public class PubZyByGlyxController {

	@Resource(name="pubZyByGlyxServive")
	private PubZyByGlyxServive pubZyByGlyxServive;
	
	@ResponseBody
	@RequestMapping("queryZyByGlyx")
	public Object queryZyByGlyx(String xydm){
		List<Map> zyList = null;
		try{
			zyList = pubZyByGlyxServive.queryZyByGlyx(xydm);
		}catch(Exception e){
			System.err.println("queryZyByGlyx操作失败!!");
			e.printStackTrace();
		}
		return zyList;
	}
}

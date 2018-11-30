package com.incon.common.pub.pubZyByYx.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.common.pub.pubZyByYx.service.PubZyByYxService;

@Controller
@RequestMapping("pubZyByYx")
public class PubZyByYxController {
	@Resource(name="pubZyByYxService")
	private PubZyByYxService pubZyByYxService;
	
	@ResponseBody
	@RequestMapping("queryZyByYx")
	public Object queryZyByYx(String xydm){
		List<Map> zyList = null;
		try{
			zyList = pubZyByYxService.queryZyByYx(xydm);
		}catch(Exception e){
			System.err.println("queryZyByX操作失败!!");
			e.printStackTrace();
		}
		return zyList;
	}
	
}

package com.incon.common.pub.pubZyByX.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.common.pub.pubZyByX.service.PubZyByXService;

@Controller
@RequestMapping("pubZyByX")
public class PubZyByXController {
	@Resource(name="pubZyByXService")
	private PubZyByXService pubZyByXService;
	/**
	 * 根据系查询专业
	 * @param yxdm
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryZyByX")
	public Object queryZyByX(String xydm){
		List<Map> zylist = null;
		try{
			System.out.println(xydm);
			zylist = pubZyByXService.queryZyByX(xydm);
		}catch(Exception e){
			System.err.println("queryZyByX操作失败!!");
			e.printStackTrace();
		}
		return zylist;
	}
	
}

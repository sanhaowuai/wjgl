package com.incon.common.pub.pubXnxq.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.common.pub.pubXnxq.service.PubXnxqService;
@SuppressWarnings("all")
@Controller
@RequestMapping("/pubXnxq")
public class PubXnxqController {

	@Resource(name="pubXnxqService")
	private PubXnxqService pubXnxqService;
	
	/**
	 * 查询学年学期
	 * @param model
	 * @param map
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryPubXnxq")
	public Object queryPubXnxq(Model model,HashMap map){
		List<Map> xnxqList = null;
		try{
			 xnxqList =  pubXnxqService.queryPubXnxq(map);
			model.addAttribute("xnxqList",xnxqList);
		}catch(Exception e){
			System.err.println("queryPubXnxq操作失败!!");
			e.printStackTrace();
		}
		return xnxqList;
	}
}

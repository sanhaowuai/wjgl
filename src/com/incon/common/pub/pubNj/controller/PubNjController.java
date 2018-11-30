package com.incon.common.pub.pubNj.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.common.pub.pubNj.service.PubNjService;
@SuppressWarnings("all")
@Controller
@RequestMapping("/pubNj")
public class PubNjController {
	@Resource(name="pubNjService")
	private PubNjService pubNjService;
	
	/**
	 * 查询年级
	 * @param model
	 * @param map
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/queryPubNj")
	public Object queryPubNj(Model model){
		List<Map> njList = null;
		try{
			 njList = pubNjService.queryPubNj();
			model.addAttribute("njList",njList);
		}catch(Exception e){
			System.err.println("queryPubNj操作失败!!");
			e.printStackTrace();
		}
		return njList;
	}
}

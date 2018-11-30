package com.incon.common.pub.pubZy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.common.pub.pubZy.service.PubZyService;


@Controller
@RequestMapping("/pubZy")
public class PubZyController {
	@Resource(name="PubZyService")
	private PubZyService PubZyService;
	
	/**
	 * 查询专业
	 * @param model
	 * @param map
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/queryPubZy")
	public Object queryPubZy(Model model,HashMap map){

		List<Map> zyList = null;
		try {
			zyList = PubZyService.queryPubZy(map);
			model.addAttribute("zyList", zyList);
		} catch (Exception e) {
			System.err.println("queryPubZy操作失败!!");
			e.printStackTrace();
		}
		return zyList;
	}
	
}

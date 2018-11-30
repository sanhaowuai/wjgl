package com.incon.common.pub.pubBjByZy.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.common.pub.pubBjByZy.service.PubBjByZyService;
@SuppressWarnings("all")
@Controller
@RequestMapping("/pubBjByZy")
public class PubBjByZyController {
	@Resource(name="pubBjByZyService")
	private PubBjByZyService pubBjByZyService;
	
	/**
	 * 根据专业查询班级
	 * @param zydm
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/queryBjByZy")
	public Object queryBjByZy(String zydm){
		List<Map> bjList = null;
		try{
			bjList = pubBjByZyService.queryBjByZy(zydm);
		}catch(Exception e){
			System.err.println("queryBjByZy操作失败!!");
			e.printStackTrace();
		}
		return bjList;
	}
}

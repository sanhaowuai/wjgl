package com.incon.common.pub.pubJysByYx.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.common.pub.pubJysByYx.service.PubJysByYxService;

@Controller
@RequestMapping("pubJysByYx")
public class PubJysByYxController {

	@Resource(name="pubJysByYxService")
	private  PubJysByYxService pubJysByYxService;
	
	/**
	 * 根据院查询所有教研室
	 * @param yxdm
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryJysByY")
	public Object queryJysByY(String yxdm){
		List<Map> jysList = null;
		try{
			jysList = pubJysByYxService.queryJysByY(yxdm);
		}catch(Exception e){
			System.err.println("queryJysByY操作失败!!");
			e.printStackTrace();
		}
		return jysList;
	}
	
	/**
	 * 根据系查询所有教研室
	 * @param yxdm
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryJysByX")
	public Object queryJysByX(String yxdm){
		List<Map> jysList = null;
		try{
			jysList = pubJysByYxService.queryJysByX(yxdm);
		}catch(Exception e){
			System.err.println("queryJysByX操作失败!!");
			e.printStackTrace();
		}
		return jysList;
	}
	/**
	 * 根据管理院系查询教研室 
	 * @param yxdm
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryJysByGlyx")
	public Object queryJysByGlyx(String yxdm){
		List<Map> jysList = null;
		try{
			jysList = pubJysByYxService.queryJysByGlyx(yxdm);
		}catch(Exception e){
			System.err.println("queryJysByGlyx操作失败!!");
			e.printStackTrace();
		}
		return jysList;
	}
}

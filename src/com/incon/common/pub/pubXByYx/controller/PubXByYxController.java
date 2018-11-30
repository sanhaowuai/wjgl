package com.incon.common.pub.pubXByYx.controller; 
import java.util.Map;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.common.pub.pubXByYx.service.PubXByYxService;

@Controller
@RequestMapping("/pubXByYx")
public class PubXByYxController {
	
	@Resource(name="pubXByYxService")
	private PubXByYxService pubXByYxService;
	/**
	 * 根据院查询系
	 * @param yxdm
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/queryXByYx")
	public Object queryXByYx(String yxdm){
		List<Map> xList = null;
		try {
			System.out.println(yxdm);
			xList = pubXByYxService.queryXByYx(yxdm);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryXList操作失败!!");
		}
		return xList;
	}
}

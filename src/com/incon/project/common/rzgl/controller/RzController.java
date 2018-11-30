package com.incon.project.common.rzgl.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.incon.pojo.common.JsbEntity;
import com.incon.pojo.common.RzEntity;
import com.incon.project.common.rzgl.page.RzPage;
import com.incon.project.common.rzgl.service.RzService;


@SuppressWarnings("all")
@Controller
@RequestMapping("/rz")
public class RzController {
	
	@Resource(name="rzService")
	public RzService rzService;
	
	@RequestMapping("/queryRz")
	public String queryRz(Model model,RzPage page){
		try {
			List<RzEntity> list=rzService.query(page);			
			List<JsbEntity> jsList=rzService.queryJsmc();
			model.addAttribute("jsList", jsList);
			model.addAttribute("page", page);
			model.addAttribute("list", list);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "commons/rz/rz";
	}
	
	
}

package com.incon.project.lctp.controller;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.incon.project.lctp.service.LctpService;

@Controller
@RequestMapping("/lctp")
@SuppressWarnings("all")
public class LctpController {
	
	@Resource(name="lctpService")
	private LctpService lctpService;
	
	/*
	 * 查询流程图片
	 */
	@RequestMapping(value="queryLctp")
	public String queryLctp(HttpSession session,Model model){
		//查询出流程图片的后缀名
		String lctphzm = (String) lctpService.queryForObject("lctp.getLctphzm", null);
		
		model.addAttribute("lctphzm", lctphzm);
		return "commons/lctp/queryLctp";
	}
	
	/*
	 * 上传流程图片
	 */
	@RequestMapping(value="uploadLctp")
	public String uploadLctp(@RequestParam(value="lctp",required=false) MultipartFile file,  
            HttpServletRequest request)throws Exception{
		//获得物理路径webapp所在路径  
		String pathRoot = request.getSession().getServletContext().getRealPath("");  
        String path="";
        if(!file.isEmpty()){
    		String filenames = file.getOriginalFilename();
        	String filehzm = filenames.substring(filenames.lastIndexOf("."));
        	path="/resources/img/lctp"+filehzm;
        	file.transferTo(new File(pathRoot+path));
        	//将流程图片后缀名保存到流程图片表中
        	lctpService.update("lctp.updLctp", filehzm);
        }
        
        return "redirect:/lctp/queryLctp";
	}
	
	/*
	 * 查看流程图片
	 */
	@RequestMapping(value="searchLctp")
	public String searchLctp(HttpSession session,Model model){
		//查询出流程图片的后缀名
		String lctphzm = (String) lctpService.queryForObject("lctp.getLctphzm", null);
		
		model.addAttribute("lctphzm", lctphzm);
		return "commons/lctp/searchLctp";
	}
}

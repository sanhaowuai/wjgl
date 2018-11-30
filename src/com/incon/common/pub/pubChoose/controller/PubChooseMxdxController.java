package com.incon.common.pub.pubChoose.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.framework.interseptor.WebConstants;
import com.incon.framework.util.RequestUtil;
import com.incon.pojo.common.UserEntity;
import com.incon.common.pub.pubChoose.service.PubChooseMxdxService;
import com.incon.common.pub.pubJs.service.PubJsService;

/**
 * 面向对象选择器
 * @author 丁起明
 *
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/pubChoose/pubChooseMxdx")
public class PubChooseMxdxController {

	@Resource(name="pubChooseMxdxService")
	private PubChooseMxdxService pubChooseMxdxService;

	/**
	 * 选择面向对象
	 * @param glb 关联表
	 * @param glzjm 关联主键明
	 * @param glzjz 关联主键值
	 * @param request
	 * @return 视图路径
	 */
    @RequestMapping(value = {"/chooseMxdx/{glb}/{glzjm}/{glzjz}", ""})
    public String chooseMxdx(
    		@PathVariable("glb") String glb ,
    		@PathVariable("glzjm") String glzjm ,
    		@PathVariable("glzjz") String glzjz ,
    		HttpServletRequest request) {
        request.setAttribute("glb",glb); 
        request.setAttribute("glzjm",glzjm); 
        request.setAttribute("glzjz",glzjz); 
        
        Map<String, Object> xxMap = new HashMap<String, Object>();
        xxMap.put("glb", glb);
        xxMap.put("glzjm", glzjm);
        xxMap.put("glzjz", glzjz);
        String mxdxlx = pubChooseMxdxService.queryMxdxlxToString(xxMap);
        request.setAttribute("mxdxlx",mxdxlx); 
        return "/window/pub/pubChoose/chooseMxdx";
    }
    

	/**
	 * 查询学生信息表
	 * @param xxMap
	 * @return
	 */
    @ResponseBody
    @RequestMapping(value = {"/queryXsxxbList", ""})
	public List<Map<String,Object>> queryXsxxbList(HttpServletRequest request){
    	Map<String, Object> xxMap = RequestUtil.asMap(request, false);
		return pubChooseMxdxService.queryXsxxbList(xxMap);
	}
	
	/**
	 * 查询教师信息表
	 * @param xxMap
	 * @return
	 */	
    @ResponseBody
    @RequestMapping(value = {"/queryJsxxbList", ""})
	public List<Map<String,Object>> queryJsxxbList(HttpServletRequest request){
    	Map<String, Object> xxMap = RequestUtil.asMap(request, false);
		return pubChooseMxdxService.queryJsxxbList(xxMap);
	}
	/**
	 * 查询角色信息表
	 * @param xxMap
	 * @return
	 */
    @ResponseBody
    @RequestMapping(value = {"/queryJuesxxbList", ""})
	public List<Map<String,Object>> queryJuesxxbList(HttpServletRequest request){
    	Map<String, Object> xxMap = RequestUtil.asMap(request, false);
		return pubChooseMxdxService.queryJuesxxbList(xxMap);
	}
	/**
	 * 查询群组信息表
	 * @param xxMap
	 * @return
	 */	
    @ResponseBody
    @RequestMapping(value = {"/queryQzxxbList", ""})
	public List<Map<String,Object>> queryQzxxbList(HttpServletRequest request,HttpSession session){
    	Map<String, Object> xxMap = RequestUtil.asMap(request, false);
    	UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
    	xxMap.put("cjrdm", userEntity.getYhdm());
		return pubChooseMxdxService.queryQzxxbList(xxMap);
	}
	/**
	 * 查询院系信息表
	 * @param xxMap
	 * @return
	 */
    @ResponseBody
    @RequestMapping(value = {"/queryYxxxbList", ""})
	public List<Map<String,Object>> queryYxxxbList(HttpServletRequest request){
    	Map<String, Object> xxMap = RequestUtil.asMap(request, false);
		return pubChooseMxdxService.queryYxxxbList(xxMap);
	}
   
	/**
	 * 查询教研室信息表
	 * @param xxMap
	 * @return
	 */
    @ResponseBody
    @RequestMapping(value = {"/queryJysxxbList", ""})
	public List<Map<String,Object>> queryJysxxbList(HttpServletRequest request){
    	Map<String, Object> xxMap = RequestUtil.asMap(request, false);
		return pubChooseMxdxService.queryJysxxbList(xxMap);
	}    
    
	/**
	 * 查询专业信息表
	 * @param xxMap
	 * @return
	 */		
    @ResponseBody
    @RequestMapping(value = {"/queryZyxxbList", ""})
	public List<Map<String,Object>> queryZyxxbList(HttpServletRequest request){
    	Map<String, Object> xxMap = RequestUtil.asMap(request, false);
		return pubChooseMxdxService.queryZyxxbList(xxMap);
	}
	/**
	 * 查询年级信息表
	 * @param xxMap
	 * @return
	 */		
    @ResponseBody
    @RequestMapping(value = {"/queryNjxxbList", ""})
	public List<Map<String,Object>> queryNjxxbList(HttpServletRequest request){
		Map<String, Object> xxMap = RequestUtil.asMap(request, false);
		return pubChooseMxdxService.queryNjxxbList(xxMap);
	}
	/**
	 * 查询班级信息表
	 * @param xxMap
	 * @return
	 */		
    @ResponseBody
    @RequestMapping(value = {"/queryBjxxbList", ""})
	public List<Map<String,Object>> queryBjxxbList(HttpServletRequest request){
    	Map<String, Object> xxMap = RequestUtil.asMap(request, false);
		return pubChooseMxdxService.queryBjxxbList(xxMap);
	}
	
	
	/**
	 * 保存到面向对象表中
	 * @param xxMap
	 * @return
	 */
    @ResponseBody
    @RequestMapping(value = {"/saveToMxdxxxb", ""})
	public String saveToMxdxxxb(HttpServletRequest request,HttpSession session){
    	Map<String, Object> xxMap = RequestUtil.asMap(request, false);
    	UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
    	xxMap.put("cjrdm", userEntity.getYhdm());
		pubChooseMxdxService.saveToMxdxxxb(xxMap);
		return "ok";
	}
}	

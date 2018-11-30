package com.incon.project.common.jcxgxxwh.xnxq.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.pojo.common.jcxgxxwh.XnxqbEntity;
import com.incon.project.common.jcxgxxwh.xnxq.page.XnxqglPage;
import com.incon.project.common.jcxgxxwh.xnxq.service.XnxqglService;
import com.itextpdf.text.log.SysoLogger;



/**
 * 
 * @类名： com.incon.project.common.jcxgxxwh.xnxq.controller.XnxqglController
 * @创建人： 杨文龙
 * @日期： 2014-4-2
 * @修改人：
 * @日期：
 * @描述： 学年学期管理
 * @版本号：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/xnxqgl")
public class XnxqglController {

	@Resource(name="xnxqglService")
	private XnxqglService xnxqglService;
	
	@RequestMapping("/queryXnxqgl")
	public String queryXnxqgl(Model model,XnxqbEntity xnxqbEntity,XnxqglPage xnxqglPage){
		//学年学期列表
		try{
			List<XnxqbEntity> xnxqList =  xnxqglService.query(xnxqglPage);
			model.addAttribute("xnxqList",xnxqList);
		}catch(Exception e){
			System.err.println("queryXnxqgl操作失败!!");
			e.printStackTrace();
		}
		return "commons/jcxgxxwh/xnxqgl";
	}
	/**
	 * 增加或修改学年学期
	 * @param xnxqbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addXnxqglSz")
	public String addOrUpdXnxqgl(XnxqbEntity xnxqbEntity,String zt){
		try{
			if(zt.equals("1")){
				xnxqglService.addXnxq(xnxqbEntity);
			}else{
				xnxqglService.updXnxq(xnxqbEntity);
			}
		}catch(Exception e){
			System.err.println("addOrUpdZylbgl操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	/**
 	 * 根据学年和学期查询学年学期
 	 * @param 
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("queryXnxqByDm")
	public XnxqbEntity queryXnxqByDm(XnxqbEntity xnxqbEntity){
		try{
			xnxqbEntity = xnxqglService.queryXnxqByDm(xnxqbEntity);
		}catch(Exception e){
			System.err.println("queryXnxqByDm操作失败!!");
			e.printStackTrace();
		}
		return xnxqbEntity;
	}
	/**
 	 * 删除学年学期
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delXnxq")
	public String delXnxq(String[] ids,String xqs){
		try{
			xnxqglService.delXnxq(ids,xqs);
		}catch(Exception e){
			System.err.println("delXnxq操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 查询当前学年下学期是否重复
	 * @param dm
	 * @param 1:增加		2:修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryByDmCount")
	public Boolean queryByDmCount(XnxqbEntity xnxqbEntity,String zt){
		Boolean bo = false;
		try {
			if(zt.equals("1")){
				bo = xnxqglService.queryByDmCount(xnxqbEntity) == 0 ? true : false;
			}else{
				bo = xnxqglService.queryByDmCount(xnxqbEntity) == 1 ? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByDmCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
}

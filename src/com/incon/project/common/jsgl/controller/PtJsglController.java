package com.incon.project.common.jsgl.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.DataFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.incon.common.pub.pubYx.page.PubYxPage;
import com.incon.common.pub.pubYx.service.PubYxService;
import com.incon.framework.interseptor.WebConstants;
import com.incon.framework.util.IeasTool;
import com.incon.pojo.common.JsxxbEntity;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.XsxxbEntity;
import com.incon.pojo.common.YxdmbEntity;
import com.incon.pojo.common.jcxgxxwh.JysbEntity;
import com.incon.pojo.common.ryxgxxwh.JgbEntity;
import com.incon.pojo.common.ryxgxxwh.MzbEntity;
import com.incon.pojo.common.ryxgxxwh.WhcdbEntity;
import com.incon.pojo.common.ryxgxxwh.XbbEntity;
import com.incon.pojo.common.ryxgxxwh.XlbEntity;
import com.incon.pojo.common.ryxgxxwh.XwbEntity;
import com.incon.pojo.common.ryxgxxwh.XzjbbEntity;
import com.incon.pojo.common.ryxgxxwh.ZcbEntity;
import com.incon.pojo.common.ryxgxxwh.ZzmmbEntity;
import com.incon.project.common.jsgl.page.JsglPage;
import com.incon.project.common.jsgl.page.PtxzJsPage;
import com.incon.project.common.jsgl.service.JsglService;
/**
 * 
 * @类名：com.incon.project.common.jsgl.controller.PtJsglController
 * @创建人：安智博
 * @日期：2016-8-10
 * @描述：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/ptjsgl")
public class PtJsglController {

	@Resource(name="jsglService")
	private JsglService jsglService;
	
	@Resource(name="pubYxService")
	private PubYxService pubYxService;
	
	@RequestMapping("/queryJsgl")
	public String queryJsgl(Model model,JsxxbEntity jsxxbEntity,JsglPage jsglPage,HttpSession session){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		try{
			jsglPage.setYhdm(userEntity.getYhdm());//登录用户名
			UserEntity user = jsglService.queryUser(userEntity);
			jsglPage.setGljb(user.getGljb());//管理级别
			if(user.getSfcjgly() == null || user.getSfcjgly().isEmpty()){//是否超级管理员
				jsglPage.setSfcjgly("0");			
			}else{
				jsglPage.setSfcjgly(user.getSfcjgly());
			}
			jsglPage.setJsdm(user.getJsdm());//角色代码
			Map map = new HashMap();
			map.put("jsdm", userEntity.getJsdm());
			map.put("yhdm", userEntity.getYhdm());
			int jysCount = jsglService.queryJyssjqxCount(map);
			if(jysCount>0){
				jsglPage.setResultCount("1");
			}else{
				jsglPage.setResultCount("0");
			}
			//院系列表
			PubYxPage pubYxPage= new PubYxPage();
			pubYxPage.setGljb(userEntity.getGljb());//管理级别
			pubYxPage.setYhdm(userEntity.getYhdm());//登录用户名
			if(userEntity.getSfcjgly() == null || userEntity.getSfcjgly().trim().equals("")){//是否超级管理员
				pubYxPage.setSfcjgly("0");			
			}else{
				pubYxPage.setSfcjgly(userEntity.getSfcjgly());
			}
			pubYxPage.setJsdm(userEntity.getJsdm());//角色代码
			List<Map> yxlist = pubYxService.queryPubYx(pubYxPage);//院系列表(搜索)
			model.addAttribute("yxlist", yxlist);
			
			//学院列表(添加)
			List<Map> xyList = pubYxService.queryPubYxList(pubYxPage);
			model.addAttribute("xyList", xyList);
			//教师列表
			List<JsxxbEntity> jslist = jsglService.query(jsglPage);
			model.addAttribute("jslist", jslist);
			
			//性别
			List<XbbEntity> xbList = jsglService.queryXb();
			model.addAttribute("xbList", xbList);
			//籍贯
			List<JgbEntity> jgList = jsglService.queryJg();
			model.addAttribute("jgList", jgList);
			//民族
			List<MzbEntity> mzList = jsglService.queryMz();
			model.addAttribute("mzList", mzList);
			//文化程度
			List<WhcdbEntity> whcdList = jsglService.queryWhcd();
			model.addAttribute("whcdList", whcdList);
			//学历
			List<XlbEntity> xlList = jsglService.queryXl();
			model.addAttribute("xlList", xlList);
			//学位
			List<XwbEntity> xwList = jsglService.queryXw();
			model.addAttribute("xwList", xwList);
			//行政级别
			List<XzjbbEntity> xzjbList = jsglService.queryXzjb();
			model.addAttribute("xzjbList", xzjbList);
			//职称
			List<ZcbEntity> zcList = jsglService.queryZc();
			model.addAttribute("zcList", zcList);
			//政治面貌
			List<ZzmmbEntity> zzmmList = jsglService.queryZzmm();
			model.addAttribute("zzmmList", zzmmList);
		}catch(Exception e){
			System.err.println("queryJsgl操作失败!!");
			e.printStackTrace();
		}
		return "commons/ptjsgl/ptjsgl";
	}
	
	@RequestMapping("/queryPtxzJs")
	public String queryPtxzJs(Model model,JsxxbEntity jsxxbEntity,PtxzJsPage ptxzjsPage,HttpSession session){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		try{
			ptxzjsPage.setYhdm(userEntity.getYhdm());//登录用户名
			UserEntity user = jsglService.queryUser(userEntity);
			ptxzjsPage.setGljb(user.getGljb());//管理级别
			if(user.getSfcjgly() == null || user.getSfcjgly().isEmpty()){//是否超级管理员
				ptxzjsPage.setSfcjgly("0");			
			}else{
				ptxzjsPage.setSfcjgly(user.getSfcjgly());
			}
			ptxzjsPage.setJsdm(user.getJsdm());//角色代码
			Map map = new HashMap();
			map.put("jsdm", userEntity.getJsdm());
			map.put("yhdm", userEntity.getYhdm());
			int jysCount = jsglService.queryJyssjqxCount(map);
			if(jysCount>0){
				ptxzjsPage.setResultCount("1");
			}else{
				ptxzjsPage.setResultCount("0");
			}
			//院系列表
			PubYxPage pubYxPage= new PubYxPage();
			pubYxPage.setGljb(userEntity.getGljb());//管理级别
			pubYxPage.setYhdm(userEntity.getYhdm());//登录用户名
			if(userEntity.getSfcjgly() == null || userEntity.getSfcjgly().trim().equals("")){//是否超级管理员
				pubYxPage.setSfcjgly("0");			
			}else{
				pubYxPage.setSfcjgly(userEntity.getSfcjgly());
			}
			pubYxPage.setJsdm(userEntity.getJsdm());//角色代码
			List<Map> yxlist = pubYxService.queryPubYx(pubYxPage);//院系列表(搜索)
			model.addAttribute("yxlist", yxlist);
			
			//学院列表(添加)
			List<Map> xyList = pubYxService.queryPubYxList(pubYxPage);
			model.addAttribute("xyList", xyList);
			//教师列表
			List<JsxxbEntity> jslist = jsglService.query(ptxzjsPage);
			model.addAttribute("jslist", jslist);
			model.addAttribute("ptxzjsPage", ptxzjsPage);
		}catch(Exception e){
			System.err.println("queryPtxzJs操作失败!!");
			e.printStackTrace();
		}
		return "commons/ptjsgl/ptxzjs";
	}
	
	/**
	 * 增加或修改教师
	 * @param jsxxbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addJssz")
	public String addOrUpdJs(JsxxbEntity jsxxbEntity,String zt,HttpSession session){
		try {
			if(zt.equals("1")){		//增加
				UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
				jsxxbEntity.setCjr(userEntity.getYhdm());
				String mm = "123456";//初始密码为123456
				jsxxbEntity.setMm(IeasTool.jiami(mm));
				jsglService.addJs(jsxxbEntity);
			}else{					//修改
				jsglService.updJs(jsxxbEntity);
			}
		} catch (Exception e) {
			System.err.println("addOrUpdJs操作失败!!");
			e.printStackTrace();
		}
		return null;
	}
	@ResponseBody
	@RequestMapping("addXzjs")
	public int addXzjs(String[] ids, HttpSession session){
		try {
			UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
			String mm = IeasTool.jiami("123456");//初始密码为123456
			List<JsxxbEntity> list = new ArrayList<JsxxbEntity>();
			for (int i = 0; i < ids.length; i++) {
				JsxxbEntity jsxxbEntity = new JsxxbEntity();
				jsxxbEntity.setCjr(userEntity.getYhdm());
				jsxxbEntity.setZgh(ids[i]);
				jsxxbEntity.setMm(mm);
				list.add(jsxxbEntity);
			}
			jsglService.addXzjs(list);
		} catch (Exception e) {
			System.err.println("addXzjs操作失败!!");
			e.printStackTrace();
			return -1;
		}
		return 1;
	}
	/**
 	 * 删除教师
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delJs")
    public String delJs(String[] ids){
		try {
			jsglService.delJs(ids);
		} catch (Exception e) {
			System.err.println("delJs操作失败!!");
			e.printStackTrace();
		}
    	return null;
    }
	@ResponseBody
	@RequestMapping("updKyf")
	public int updKyf(String[] ids, String kyf){
		try {
			List<JsxxbEntity> list = new ArrayList<JsxxbEntity>();
			for (int i = 0; i < ids.length; i++) {
				JsxxbEntity e = new JsxxbEntity();
				e.setZgh(ids[i]);
				e.setKyf(kyf);
				list.add(e);
			}
			jsglService.updKyf(list);
		} catch (Exception e) {
			System.err.println("delJs操作失败!!");
			e.printStackTrace();
			return -1;
		}
		return 1;
	}
	/**
	 * 查询zgh是否重复
	 * @param zgh
	 * @param 1:增加		2:修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryByZghCount")
	public Boolean queryByZghCount(String zgh,String zt){
		Boolean bo = false;
		try {
			if(zt.equals("1")){
				bo = jsglService.queryByZghCount2(zgh) == 0 ? true : false;
			}else{
				bo = jsglService.queryByZghCount2(zgh) == 1 ? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByZghCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
	
	/**
	 * 根据管理院系查询教研室
	 * @param yxdm  
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryJysList")
	public List<JysbEntity> queryJysList(String yxdm){
		List<JysbEntity> jysList = null;
		try{
			jysList = jsglService.queryJysList(yxdm);
		}catch(Exception e){
			System.err.println("queryJysList操作失败!!");
			e.printStackTrace();
		}
		return jysList;
	}
	
	/**
	 * 根据院代码查询所有系---替换了
	 * @param yxdm
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryXList")
	public List<YxdmbEntity> queryXList(String yxdm){
		List<YxdmbEntity> list = null;
		try {
			list = jsglService.queryXList(yxdm);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("queryXList操作失败!!");
		}
		return list;
	}
	
	/**
	 * 查询是否管理部门
	 * @param xydm
	 * @return
	 */
	@RequestMapping("querySfglbm")
	@ResponseBody
	public String querySfglbm(YxdmbEntity yxdmbEntity){
		String sfglbm = "";
		try {
			YxdmbEntity yxdmb = jsglService.querySfglbm(yxdmbEntity);
			if(yxdmb == null){
				sfglbm = "";
			}else{
				sfglbm = yxdmb.getSfglbm();
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("querySfglbm操作失败!!");
		}
		
		return sfglbm;
	}
	
	/**
	 * 根据院查询所有教研室---替换了
	 * @param yxdm
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryJysListNoGl")
	public List<JysbEntity> queryJysListNoGl(String yxdm){
		List<JysbEntity> jysList = null;
		try{
			jysList = jsglService.queryJysListNoGl(yxdm);
		}catch(Exception e){
			System.err.println("queryJysListNoGl操作失败!!");
			e.printStackTrace();
		}
		return jysList;
	}
	
	/**
	 * 根据系查询所有教研室---替换了
	 * @param yxdm
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryJysListNoGlByX")
	public List<JysbEntity> queryJysListNoGlByX(String yxdm){
		List<JysbEntity> jysList = null;
		try{
			jysList = jsglService.queryJysListNoGlByX(yxdm);
		}catch(Exception e){
			System.err.println("queryJysListNoGlByX操作失败!!");
			e.printStackTrace();
		}
		return jysList;
	}
	
	
	
	/**
	 * 导出 模板
	 * @param response
	 */
	@RequestMapping("expYkcjmb")//设置访问路径
	public void expYkcjmb(HttpServletResponse response) {
		HSSFWorkbook workbook = new HSSFWorkbook(); //创建Excel
		HSSFSheet sheet = workbook.createSheet("Sheet1");//创建Sheet
		HSSFCellStyle style = workbook.createCellStyle();//样式
		DataFormat dataFormat = workbook.createDataFormat();
		style.setDataFormat(dataFormat.getFormat("@"));
		sheet.setDefaultColumnStyle(0,style);
		sheet.setDefaultColumnStyle(1,style);
		sheet.setDefaultColumnStyle(2,style);
		sheet.setDefaultColumnStyle(3,style);
		sheet.setDefaultColumnStyle(4,style);
		sheet.setDefaultColumnStyle(5,style);
		sheet.setDefaultColumnStyle(6,style);
		sheet.setDefaultColumnStyle(7,style);
		sheet.setDefaultColumnStyle(8,style);
		sheet.setDefaultColumnStyle(9,style);
		sheet.setDefaultColumnStyle(10,style);
		sheet.setDefaultColumnStyle(11,style);
		sheet.setDefaultColumnStyle(12,style);
		sheet.setDefaultColumnStyle(13,style);
		sheet.setDefaultColumnStyle(14,style);
		
		
		sheet.setColumnWidth(0, 4000);
		sheet.setColumnWidth(1, 3500);
		sheet.setColumnWidth(2, 6500);
		sheet.setColumnWidth(3, 3500);
		sheet.setColumnWidth(4, 3500);
		sheet.setColumnWidth(5, 6000);
		sheet.setColumnWidth(6, 6000);
		HSSFRow T_row = sheet.createRow(0);//创建一行表头
		T_row.createCell(0, HSSFCell.CELL_TYPE_STRING).setCellValue("职工号(必填)");		//设置表头列名
		T_row.createCell(1, HSSFCell.CELL_TYPE_STRING).setCellValue("姓名(必填)");			//设置表头列名
		T_row.createCell(2, HSSFCell.CELL_TYPE_STRING).setCellValue("性别(代码)");		//设置表头列名
		T_row.createCell(3, HSSFCell.CELL_TYPE_STRING).setCellValue("学院(必填)");		//设置表头列名
		T_row.createCell(4, HSSFCell.CELL_TYPE_STRING).setCellValue("系(代码)");		//设置表头列名
		T_row.createCell(5, HSSFCell.CELL_TYPE_STRING).setCellValue("教研室(代码)");			//设置表头列名
		T_row.createCell(6, HSSFCell.CELL_TYPE_STRING).setCellValue("籍贯(代码)");		//设置表头列名
		T_row.createCell(7, HSSFCell.CELL_TYPE_STRING).setCellValue("民族(代码)");		//设置表头列名
		T_row.createCell(8, HSSFCell.CELL_TYPE_STRING).setCellValue("文化程度(代码)");			//设置表头列名
		T_row.createCell(9, HSSFCell.CELL_TYPE_STRING).setCellValue("学历(代码)");		//设置表头列名
		T_row.createCell(10, HSSFCell.CELL_TYPE_STRING).setCellValue("学位(代码)");
		T_row.createCell(11, HSSFCell.CELL_TYPE_STRING).setCellValue("行政级别(代码)");			//设置表头列名
		T_row.createCell(12, HSSFCell.CELL_TYPE_STRING).setCellValue("职称(代码)");		//设置表头列名
		T_row.createCell(13, HSSFCell.CELL_TYPE_STRING).setCellValue("政治面貌(代码)");		//设置表头列名
		try {
			 //设置文件头
			ServletOutputStream outStream = response.getOutputStream(); 
			String fileName = URLEncoder.encode("jsdr.xls", "UTF-8");  //设置文件名
			response.reset();
			response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
			response.setContentType("application/octet-stream; charset=UTF-8");
			//将文件流写入response 流
			workbook.write(outStream);
			outStream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	//导入教师
	@ResponseBody
	@RequestMapping(value = "impPtjsxx",method = RequestMethod.POST)//设置访问路径
	public String impPtjsxx(Model model,HttpSession session,@RequestParam("excel") MultipartFile excel,HttpServletResponse response){
		HSSFWorkbook workbook = null;
		Map map = null;
		String msg = "";
		boolean fhz;
		try {
			workbook = new HSSFWorkbook(excel.getInputStream());	//将获取的流转成Excel	
			map= jsglService.impJsxx(workbook);
			System.out.println(msg);
//			//model.addAttribute("msg", map.get("msg"));
//			//msg = (String) map.get("msg");
//			HSSFWorkbook returnWorkBook = (HSSFWorkbook) map.get("returnWorkBook"); 
//			//设置文件头
//			ServletOutputStream outStream = response.getOutputStream(); 
//			String fileName = URLEncoder.encode("JsxxError.xls", "UTF-8");  //设置文件名
//			response.reset();
//			response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
//			response.setContentType("application/octet-stream; charset=UTF-8");
//			//将文件流写入response 流
//			returnWorkBook.write(outStream);
//			outStream.close();
			msg = "1";
		} catch (IOException e) {
			msg = "0";
			e.printStackTrace();
		}
		System.out.println(msg);
		return msg;
	}
	

	//平台教师  按条件导入教师用  tree
	@RequestMapping("queryYxByJysTree")
	public String queryYxByJysTree(JsxxbEntity entity,Model model){
		List<JsxxbEntity> treeList = null;
		try{
			treeList = jsglService.queryYxByJysTree(entity);
			model.addAttribute("treeList", treeList);
			model.addAttribute("entity", entity);
		}catch(Exception e){
			System.err.println("queryYxByJysTree操作失败!!");
			e.printStackTrace();
		}
		return "commons/ptjsgl/drjs";
	}
	
	/**
	 * 平台导入师资表
	 * @param yxdm
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addorupdJs")
	public String addorupdJs(String[]ids){
		String falg="";
		try{
			for (int i = 0; i < ids.length; i++) {
			List<JsxxbEntity> jslist=jsglService.queryAllJsxx(ids[i]);
				for (JsxxbEntity jsxxbEntity : jslist) {
					System.out.println(jsxxbEntity.getZgh()+jsxxbEntity.getJsxm());
					jsxxbEntity.setMm(IeasTool.jiami("123456"));
					jsglService.addJs(jsxxbEntity);
				}
			}
			falg="1";
		}catch(Exception e){
			falg="0";
			System.err.println("addorupdJs操作失败!!");
			e.printStackTrace();
		}
		return falg;
	}
	
}

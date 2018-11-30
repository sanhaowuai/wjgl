package com.incon.project.common.xsgl.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
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
import com.incon.pojo.common.ZybEntity;
import com.incon.pojo.common.jcxgxxwh.BjbEntity;
import com.incon.pojo.common.ryxgxxwh.JgbEntity;
import com.incon.pojo.common.ryxgxxwh.MzbEntity;
import com.incon.pojo.common.ryxgxxwh.XbbEntity;
import com.incon.pojo.common.ryxgxxwh.ZzmmbEntity;
import com.incon.project.common.xsgl.page.PtxzXsPage;
import com.incon.project.common.xsgl.page.XsglPage;
import com.incon.project.common.xsgl.service.XsglService;

/**
 * 
 * @类名：com.incon.project.common.xsgl.controller.PtXsglController
 * @创建人：安智博
 * @日期：2016-8-10
 * @描述：
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/ptxsgl")
public class PtXsglController {

	@Resource(name="xsglService")
	private XsglService xsglService;
	

	@Resource(name="pubYxService")
	private PubYxService pubYxService;
	
	
	@RequestMapping("queryXsgl")
	public String queryXsgl(Model model,XsxxbEntity xsxxbEntity,XsglPage xsglPage,HttpSession session){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		try{

			xsglPage.setYhdm(userEntity.getYhdm());//登录用户名
			UserEntity user = xsglService.queryUser(userEntity);
			if(user.getSfcjgly() == null || user.getSfcjgly().isEmpty()){//是否超级管理员
				xsglPage.setSfcjgly("0");			
			}else{
				xsglPage.setSfcjgly(user.getSfcjgly());
			}
			xsglPage.setJsdm(user.getJsdm());//角色代码
			xsglPage.setGljb(user.getGljb());//管理级别
			
			//院系查询
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
			System.out.println("................."+yxlist);
			//
			//院系列表2(添加)
			List<Map> yxlist2 = pubYxService.queryPubYxList(pubYxPage);
			model.addAttribute("yxlist2", yxlist2);
			
			//专业列表(院系)
			List<ZybEntity> zylist = xsglService.queryZyList(xsglPage.getXsyxdm());
			model.addAttribute("zylist", zylist);
			//学生列表
			List<XsxxbEntity> xslist = xsglService.query(xsglPage);
			model.addAttribute("xslist", xslist);
			//性别
			List<XbbEntity> xbList = xsglService.queryXb();
			model.addAttribute("xbList", xbList);
			//籍贯
			List<JgbEntity> jgList = xsglService.queryJg();
			model.addAttribute("jgList", jgList);
			//民族
			List<MzbEntity> mzList = xsglService.queryMz();
			model.addAttribute("mzList", mzList);	
			//政治面貌
			List<ZzmmbEntity> zzmmList = xsglService.queryZzmm();
			model.addAttribute("zzmmList", zzmmList);
			//年级
			List<XsxxbEntity> njList= xsglService.qyeryAllNj();
			model.addAttribute("njList", njList);
		}catch(Exception e){
			System.err.println("queryXsgl操作失败!!");
			e.printStackTrace();
		}
		return "commons/ptxsgl/ptxsgl";
	}
	@RequestMapping("queryPtxzXs")
	public String queryPtxzXs(Model model,XsxxbEntity xsxxbEntity,PtxzXsPage ptxzXsPage,HttpSession session){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		try{
			
			ptxzXsPage.setYhdm(userEntity.getYhdm());//登录用户名
			UserEntity user = xsglService.queryUser(userEntity);
			if(user.getSfcjgly() == null || user.getSfcjgly().isEmpty()){//是否超级管理员
				ptxzXsPage.setSfcjgly("0");			
			}else{
				ptxzXsPage.setSfcjgly(user.getSfcjgly());
			}
			ptxzXsPage.setJsdm(user.getJsdm());//角色代码
			ptxzXsPage.setGljb(user.getGljb());//管理级别
			
			//院系查询
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
			//院系列表2(添加)
			List<Map> yxlist2 = pubYxService.queryPubYxList(pubYxPage);
			model.addAttribute("yxlist2", yxlist2);
			
			//专业列表(院系)
			List<ZybEntity> zylist = xsglService.queryZyList(ptxzXsPage.getXsyxdm());
			model.addAttribute("zylist", zylist);
			//学生列表
			List<XsxxbEntity> xslist = xsglService.query(ptxzXsPage);
			model.addAttribute("xslist", xslist);
		}catch(Exception e){
			System.err.println("queryPtxzXs操作失败!!");
			e.printStackTrace();
		}
		return "commons/ptxsgl/ptxzxs";
	}
	/**
	 *
	 * 根据院系查询专业---替换了
	 * @param yxdm  
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryZyByYx")
	public Object queryZyByYx(String yxdm){
		List<ZybEntity> zylist = null;
		try{
			//专业列表(院系)
			zylist = xsglService.queryZyList(yxdm);
		}catch(Exception e){
			System.err.println("queryZyByYx操作失败!!");
			e.printStackTrace();
		}
		return zylist;
	}
	
	/**
	 * 增加或修改学生
	 * @param xsxxbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	
	@ResponseBody
	@RequestMapping("addOrUpdXs")
	public boolean addOrUpdXs(@RequestParam("filed")MultipartFile fileField,HttpServletResponse response,
			HttpServletRequest request,XsxxbEntity xsxxbEntity,String zt,HttpSession session){
		int success =0;//0失败1成功
		boolean sf=false;
		InputStream in = null;
		FileOutputStream out = null;
		PrintWriter writer = null;
		try {
			writer = response.getWriter();
			File file = new File(request.getRealPath("/")+"jsp/upload/images/student");
			if(!file.exists()){
				file.mkdirs();
			}
			String newname = fileField.getContentType().substring(fileField.getContentType().indexOf("/")+1,fileField.getContentType().length());
			String fileName = "jsp/upload/images/student/"+System.currentTimeMillis()+"."+newname;
			String filePath = request.getRealPath("/") + fileName;
			if(fileField != null && !fileField.isEmpty()){
				in = fileField.getInputStream();
				out = new FileOutputStream(filePath);  
				int c;  
				byte b[] = new byte[4*1024];  
				while ((c=in.read(b))!=-1) { 
					System.out.println("开始读取流:"+c);
					out.write(b, 0, c);  
				}  
				out.flush();
				xsxxbEntity.setBszplj(fileName);
			}
			if(zt.equals("1")){		//增加
			   UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
			   xsxxbEntity.setCjr(userEntity.getYhdm());
			   String mm = "123456";//初始密码为123456
			   xsxxbEntity.setMm(IeasTool.jiami(mm));
			   xsglService.addXs(xsxxbEntity);
			}else{	
				if(fileField == null || fileField.isEmpty()){
					XsxxbEntity xs = xsglService.queryXsByXh(xsxxbEntity.getXh());
					xsxxbEntity.setBszplj(xs.getBszplj());
				}
				xsglService.updXsByXh(xsxxbEntity);
			}
			success = 1;
			sf=true;
		} catch (Exception e) {
			System.err.println("addOrUpdXs操作失败!!");
			e.printStackTrace();
			success = 0;
			sf=false;
		}finally{
			writer.print(success);
			writer.flush();
			if(writer != null){
				writer.close();
			}
			return sf;
		}
		
	}
	 */

	/**
	 * 增加或修改学生
	 * @param xsxxbEntity
	 * @param zt 1：增加  2：修改
	 * @return
	*/
	@ResponseBody
	@RequestMapping("addOrUpdXs")
	public boolean addOrUpdXs(HttpServletResponse response,
			HttpServletRequest request,XsxxbEntity xsxxbEntity,String zt,HttpSession session){
		boolean sf=false;
		try {
			if(zt.equals("1")){		//增加
			   UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
			   xsxxbEntity.setCjr(userEntity.getYhdm());
			   String mm = "123456";//初始密码为123456
			   xsxxbEntity.setMm(IeasTool.jiami(mm));
			   xsglService.addXs(xsxxbEntity);
			   sf=true;
			}else{	
				xsglService.updXsByXh(xsxxbEntity);
			}
		} catch (Exception e) {
			System.err.println("addOrUpdXs操作失败!!");
			e.printStackTrace();
			sf=false;
		}
		return sf; 
		
	}
	@ResponseBody
	@RequestMapping("addXzxs")
	public int addOrUpdXs(String[] ids,HttpSession session){
		try {
			UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
			String mm = IeasTool.jiami("123456");//初始密码为123456
			List<XsxxbEntity> list = new ArrayList<XsxxbEntity>();
			for (int i = 0; i < ids.length; i++) {
				XsxxbEntity xsxxbEntity = new XsxxbEntity();
				xsxxbEntity.setCjr(userEntity.getYhdm());
				xsxxbEntity.setMm(mm);
				xsxxbEntity.setXh(ids[i]);
				list.add(xsxxbEntity);
			}
			xsglService.addXzxs(list);
		} catch (Exception e) {
			System.err.println("addXzxs操作失败!!");
			e.printStackTrace();
			return -1;
		}
		return 1;
	}
	/**
 	 * 根据学号查询学生
 	 * @param xh
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("queryXsByXh")
    public Map queryXsByXh(String xh){
		Map map  = new HashMap();
		XsxxbEntity xsxxbEntity = null;
		try {
			xsxxbEntity = xsglService.queryXsByXh(xh);
			map.put("xsxxbEntity", xsxxbEntity);
//				//院系列表
//				List<YxdmbEntity> yxlist = xsglService.queryYxList();
//				map.put("yxlist", yxlist);
//				//专业列表(院系)
//				List<ZybEntity> zylist = xsglService.queryZyList(xsxxbEntity.getXydm());
//				map.put("zylist", zylist);
		} catch (Exception e) {
			System.err.println("queryXsByXh操作失败!!");
			e.printStackTrace();
		}
    	return map;
    }
	
	/**
	 * 查询xh是否重复
	 * @param xh
	 * @param 1:增加		2:修改
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryByXhCount")
	public Boolean queryByXhCount(String xh,String zt){
		Boolean bo = false;
		try {
			if(zt.equals("1")){
				bo = xsglService.queryByXhCount2(xh) == 0 ? true : false;
			}else{
				bo = xsglService.queryByXhCount2(xh) == 1 ? true : false;
			}
		} catch (Exception e) {
			System.err.println("queryByXhCount操作失败!!");
			e.printStackTrace();
		}
		return bo;
	}
	/**
 	 * 删除学生
 	 * @param ids
	 * @return
  	 */
	@ResponseBody
	@RequestMapping("delXs")
    public String delXs(String[] ids){
		try {
			xsglService.delXs(ids);
		} catch (Exception e) {
			System.err.println("delJs操作失败!!");
			e.printStackTrace();
		}
    	return null;
    }
	
	/**
	 * 根据专业查询班级---替换了
	 * @param zydm  
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryBjList")
	public Object queryBjList(String zydm){
		List<BjbEntity> bjlist = null;
		try{
			//专业列表(院系)
			bjlist = xsglService.queryBjList(zydm);
		}catch(Exception e){
			System.err.println("queryBjList操作失败!!");
			e.printStackTrace();
		}
		return bjlist;
	}
	
	/**
	 * 根据学院查询系---替换了
	 * @param yxdm
	 * @return
	 */
	@RequestMapping("queryXList")
	@ResponseBody
	public List<YxdmbEntity> queryXList(String yxdm){
		List<YxdmbEntity> list = null;
		try {
			list = xsglService.queryXList(yxdm);
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
			YxdmbEntity yxdmb = xsglService.querySfglbm(yxdmbEntity);
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
	 * 根据院系查询专业---替换了
	 * @param yxdm  
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryZyByY")
	public Object queryZyByY(String xydm){
		List<ZybEntity> zylist = null;
		try{
			//专业列表(院)
			zylist = xsglService.queryZyListByY(xydm);
		}catch(Exception e){
			System.err.println("queryZyByY操作失败!!");
			e.printStackTrace();
		}
		return zylist;
	}
	
	/**
	 * 通过系代码查询专业
	 * @param xydm
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryZyByX")
	public Object queryZyByX(String xydm){
		List<ZybEntity> zylist = null;
		try{
			//专业列表(系)
			zylist = xsglService.queryZyListByX(xydm);
		}catch(Exception e){
			System.err.println("queryZyByX操作失败!!");
			e.printStackTrace();
		}
		return zylist;
	}
	
	/**
	 * 根据专业查询班级---替换了
	 * @param zydm  
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryBjList2")
	public Object queryBjList2(String zydm){
		List<BjbEntity> bjlist = null;
		try{
			//专业列表(院系)
			bjlist = xsglService.queryBjList2(zydm);
		}catch(Exception e){
			System.err.println("queryBjList操作失败!!");
			e.printStackTrace();
		}
		return bjlist;
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
		sheet.setColumnWidth(0, 4000);
		sheet.setColumnWidth(1, 3500);
		sheet.setColumnWidth(2, 6500);
		sheet.setColumnWidth(3, 3500);
		sheet.setColumnWidth(4, 3500);
		sheet.setColumnWidth(5, 6000);
		sheet.setColumnWidth(6, 6000);
		HSSFRow T_row = sheet.createRow(0);//创建一行表头
		T_row.createCell(0, HSSFCell.CELL_TYPE_STRING).setCellValue("学号(必填)");		//设置表头列名
		T_row.createCell(1, HSSFCell.CELL_TYPE_STRING).setCellValue("姓名(必填)");			//设置表头列名
		T_row.createCell(2, HSSFCell.CELL_TYPE_STRING).setCellValue("性别(代码)");		//设置表头列名
		T_row.createCell(3, HSSFCell.CELL_TYPE_STRING).setCellValue("学院(必填)");		//设置表头列名
		T_row.createCell(4, HSSFCell.CELL_TYPE_STRING).setCellValue("系(代码)");		//设置表头列名
		T_row.createCell(5, HSSFCell.CELL_TYPE_STRING).setCellValue("专业(代码)");		//设置表头列名
		T_row.createCell(6, HSSFCell.CELL_TYPE_STRING).setCellValue("班级(代码)");			//设置表头列名
		T_row.createCell(7, HSSFCell.CELL_TYPE_STRING).setCellValue("籍贯(代码)");		//设置表头列名
		T_row.createCell(8, HSSFCell.CELL_TYPE_STRING).setCellValue("民族(代码)");		//设置表头列名
		T_row.createCell(9, HSSFCell.CELL_TYPE_STRING).setCellValue("政治面貌(代码)");		//设置表头列名
		T_row.createCell(10, HSSFCell.CELL_TYPE_STRING).setCellValue("年级(代码)");		//设置表头列名
		try {
			 //设置文件头
			ServletOutputStream outStream = response.getOutputStream(); 
			String fileName = URLEncoder.encode("xsdr.xls", "UTF-8");  //设置文件名
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
	
	
	//导入学生
	@ResponseBody
	@RequestMapping(value = "impPtxsxx",method = RequestMethod.POST)//设置访问路径
	public String impPtxsxx(Model model,HttpSession session,@RequestParam("excel") MultipartFile excel,HttpServletResponse response){
		HSSFWorkbook workbook = null;
		Map map = null;
		String msg = "";
		try {
			workbook = new HSSFWorkbook(excel.getInputStream());	//将获取的流转成Excel	
			map = xsglService.impXsxx(workbook);
//			//model.addAttribute("msg", map.get("msg"));
//			//msg = (String) map.get("msg");
//			HSSFWorkbook returnWorkBook = (HSSFWorkbook) map.get("returnWorkBook"); 
//			//设置文件头
//			ServletOutputStream outStream = response.getOutputStream(); 
//			String fileName = URLEncoder.encode("XsxxError.xls", "UTF-8");  //设置文件名
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
		return msg;
	}
	
	
	//平台学生  按条件导入学生用  tree
	@RequestMapping("queryYxByZyTree")
	public String queryYxByZyTree(XsxxbEntity entity,Model model){
		List<XsxxbEntity> treeList = null;
		try{
			treeList = xsglService.queryYxByZyTree(entity);
			model.addAttribute("treeList", treeList);
			model.addAttribute("entity", entity);
		}catch(Exception e){
			System.err.println("queryYxByJysTree操作失败!!");
			e.printStackTrace();
		}
		return "commons/ptxsgl/drxs";
	}
	
	/**
	 * 平台导入学籍表
	 * @param yxdm
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addorupdXs")
	public String addorupdJs(String[]ids){
		String falg="";
		try{
			for (int i = 0; i < ids.length; i++) {
			List<XsxxbEntity> jslist=xsglService.queryAllXsxx(ids[i]);
				for (XsxxbEntity xsxxbEntity : jslist) {
					xsxxbEntity.setMm(IeasTool.jiami("123456"));
					xsglService.addXzxs1(xsxxbEntity);
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
	//平台学生  按条件导入学生用  tree
	@RequestMapping("qyeryAllNj")
	public String qyeryAllNj(Model model){
		List<XsxxbEntity> treeList = null;
		try{
			treeList = xsglService.qyeryAllNj();
			model.addAttribute("treeList", treeList);
		}catch(Exception e){
			System.err.println("qyeryAllNj操作失败!!");
			e.printStackTrace();
		}
		return "commons/ptxsgl/drxsNj";
	}
	
	/**
	 * 平台导入学籍表
	 * @param yxdm
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addorupdXsNj")
	public String addorupdXsNj(String[]ids){
		String falg="";
		try{
			for (int i = 0; i < ids.length; i++) {
			List<XsxxbEntity> jslist=xsglService.queryAllXsxxByNj(ids[i]);
				for (XsxxbEntity xsxxbEntity : jslist) {
					System.out.println(xsxxbEntity.getXh()+xsxxbEntity.getXm());
					xsxxbEntity.setMm(IeasTool.jiami("123456"));
					xsglService.addXzxs1(xsxxbEntity);
				}
			}
			falg="1";
		}catch(Exception e){
			falg="0";
			System.err.println("addorupdXsNj操作失败!!");
			e.printStackTrace();
		}
		return falg;
	}
}

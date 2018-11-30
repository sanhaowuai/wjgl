package com.incon.project.common.demo.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.incon.common.login.controller.LoginController;
import com.incon.common.pdf.app.pdf.PdfDocumentGenerator;
import com.incon.common.treetable.Service.TreeTableService;
import com.incon.common.upload.service.UploadService;
import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.DemoPdfEntity;
import com.incon.pojo.common.JsxxbEntity;
import com.incon.pojo.common.QxEntity;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.XsxxbEntity;
import com.incon.project.common.demo.demo1.demoA.service.DemoAService;
import com.incon.project.common.demo.page.DemoJsonPage;
import com.incon.project.common.demo.service.DemoService;
import com.incon.project.common.xsgl.page.XsglPage;
import com.incon.project.common.xsgl.service.XsglService;

@SuppressWarnings("all")
@Controller
@RequestMapping("/demo")
public class DemoController {
	private static final Logger logger = Logger.getLogger(DemoController.class);
	@Resource(name = "uploadService")
	private UploadService uploadService;
	
	@Resource(name = "treeTableService")
	private TreeTableService treeTableService;
	
	@Resource(name="xsglService")
	private XsglService xsglService;

	
	@Resource(name="demoService")
	private DemoService demoService;
	
	@Resource(name="demoAService")
	private DemoAService demoAService;
	
	

	// //////////////////////////////////附件begin////////////////////////////////////
	/**
	 * 查询附件
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("queryFj")
	public String queryXwxxByBh(Model model) {
		try {
			String listfjjson = JSON.toJSONString(
					uploadService.queryFj("demo", "demo", "demo")).replaceAll(
					"\"", "'");
			model.addAttribute("listfjjson", listfjjson);
		} catch (Exception e) {
			System.err.println("queryFj操作失败!!");
			e.printStackTrace();
		}
		return "commons/demo/plupload/pluploadDemo";
	}

	/**
	 * 保存附件
	 * 
	 * @param model
	 * @param request
	 * @param session
	 * @param qfjs
	 * @param hfjs
	 * @param del_fjs
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/saveFj")
	public String saveFj(Model model, HttpServletRequest request,
			HttpSession session, String[] qfjs, String[] hfjs, String[] del_fjs) {
		try {
			UserEntity userEntity = (UserEntity) session
					.getAttribute(WebConstants.CURRENT_USER);
			// 更新附件
			uploadService.addFj("demo", "demo", "demo", userEntity.getYhdm(),
					"demo", qfjs, hfjs, del_fjs);
		} catch (Exception e) {
			System.err.println("saveFj操作失败!!");
			e.printStackTrace();
		}
		return null;
	}

	// //////////////////////////////////附件end////////////////////////////////////

	// //////////////////////////////////TreeTable
	// begin////////////////////////////////

	/**
	 * TreeTable获取数据
	 */
	@RequestMapping("querySj")
	public String querySj(Model model) {
		try {
			List<QxEntity> qxcd_list = treeTableService.queryAll();
			model.addAttribute("qxcd_list", qxcd_list);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("querySj操作失败!!");
		}
		return "commons/demo/treeTable/treeTableDemo";
	}

	// //////////////////////////////////TreeTable
	// end////////////////////////////////

	// //////////////////////////////////ckeditor
	// begin////////////////////////////////

	/**
	 * ckeditor跳转页面
	 * 
	 * @return
	 */
	@RequestMapping("queryCk")
	public String queryCk() {
		return "commons/demo/ckeditor/ckeditorDemo";
	}

	// //////////////////////////////////ckeditor
	// end////////////////////////////////

	// //////////////////////////////////excel
	// start////////////////////////////////
	@RequestMapping("queryExcelDemo")
	public String queryExcelDemo() {
      System.out.println("==================345444===cccccccc===================");
		return "commons/demo/excel/ExcelDemo";
	}

	@ResponseBody //设置以文件流方式返回页面
	@RequestMapping("exportExcelDemo")//设置访问路径
	public void exportExcelDemo(HttpServletResponse response) {
		HSSFWorkbook workbook = new HSSFWorkbook(); //创建Excel
		HSSFSheet sheet = workbook.createSheet("Sheet1");//创建Sheet
		HSSFRow T_row = sheet.createRow(0);//创建一行表头
		T_row.createCell(0, HSSFCell.CELL_TYPE_STRING).setCellValue("职工号");//设置表头列名
		T_row.createCell(1, HSSFCell.CELL_TYPE_STRING).setCellValue("姓名");//设置表头列名
		T_row.createCell(2, HSSFCell.CELL_TYPE_STRING).setCellValue("性别");//设置表头列名
		for (int i = 1; i < 10; i++) {  // 插入数据
			JsxxbEntity Jsxxb = new JsxxbEntity(); //new 实体
			Jsxxb.setZgh("ZGH00" + i);    //向实体中set值
			Jsxxb.setJsxm("教师_" + i); //向实体中set值
			Jsxxb.setXb("男"); //向实体中set值
			HSSFRow row = sheet.createRow(i);  //创建一行Excel
			row.createCell(0, HSSFCell.CELL_TYPE_STRING).setCellValue( Jsxxb.getZgh()); //向Excel中第 i 行第 0 列赋值
			row.createCell(1, HSSFCell.CELL_TYPE_STRING).setCellValue( Jsxxb.getJsxm()); //向Excel中第 i 行第 1 列赋值
			row.createCell(2, HSSFCell.CELL_TYPE_STRING).setCellValue( Jsxxb.getXb()); //向Excel中第 i 行第 2 列赋值
		}

		try {
			String filename = "demo.xls";  //设置文件名
			 //设置文件头
			ServletOutputStream Out = response.getOutputStream(); response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
			//设置字符集
			response.setCharacterEncoding("UTF-8");
			//设置文件类型
			response.setContentType("application/octet-stream; charset=UTF-8");
			//将文件流写入response 流
			workbook.write(Out);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/importExcelDemo", method = RequestMethod.POST)//设置访问路径
	public String importExcelDemo(
			Model model, //模型参数 提供返回信息等方法
			@RequestParam("excel") MultipartFile excel // 文件流获取参数   @RequestParam("excel")中 参数与页面form  文件上传标签name对应
			) {
		HSSFWorkbook workbook = null;
		List<JsxxbEntity> list=null;
		try {
			workbook = new HSSFWorkbook(excel.getInputStream());	//将获取的流转成Excel	
			HSSFSheet sheet = workbook.getSheet("Sheet1");//获取Sheet
		    list=new ArrayList<JsxxbEntity>(); 
			Iterator<Row> rows = sheet.rowIterator();//将Excel行数据装入迭代器
			  while (rows.hasNext()) {      //迭代Excel 行
				      JsxxbEntity Jsxxb = new JsxxbEntity();// 创建实体接收数据
			          Row row = (Row) rows.next();    // 获取一行数据
			          Jsxxb.setZgh(row.getCell(0)+"");   // 获取一列数据装入实体
			          Jsxxb.setJsxm( row.getCell(1)+"");
			          Jsxxb.setXb(row.getCell(2)+"");
			          list.add(Jsxxb);   //将实体装入list集合类
			     }
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        model.addAttribute("list", list);//将数据装入Spring 值栈中共前台获取
		return "commons/demo/excel/ExcelDemo"; //返回地址  
	}

	// //////////////////////////////////excel
	// start////////////////////////////////

	
	
	/**
	 * 导出pdf
	 */
	@RequestMapping("queryPdf")
	public String queryPdf(HttpServletRequest request,HttpServletResponse response,XsglPage xsglPage) {
		
		List<XsxxbEntity> xslist = xsglService.query(xsglPage);//学生信息列表
		for(int i=0;i<xslist.size();i++){
			XsxxbEntity xs = xslist.get(i);
			String xb = xs.getXb();
			if(xb == null){
				xb = "";
			}
			xs.setXb(xb);
			xslist.set(i, xs);
		}
		//制造假数据
		xslist.addAll(xslist);
		xslist.addAll(xslist);
		xslist.addAll(xslist);
		xslist.addAll(xslist);
		
		
		DemoPdfEntity demoPdfEntity = new DemoPdfEntity();
		demoPdfEntity.setXslist(xslist);
		
		// classpath 模板地址
		String template = "freemaker/templates/demoPdf.html";
		
		// pdf·
		PdfDocumentGenerator pdfGenerator = new PdfDocumentGenerator();
		String fileName;
		
		try {
			fileName = URLEncoder.encode("demo.pdf", "UTF-8");
		
			//ServletOutputStream outStream = response.getOutputStream();
			response.setHeader("Content-Disposition", "attachment; filename=\""+ fileName + "\"");
			response.setContentType("application/pdf; charset=UTF-8");
			pdfGenerator.generate(template, demoPdfEntity, response );
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "commons/demo/excel/queryPdf";
	}

	
	////////////////////////////////////ueditor begin////////////////////////////////
	
	/**
	 * ueditor跳转页面
	 * @return
	 */
	@RequestMapping("queryUeditor")
	public String queryUeditor(){
		return "commons/demo/ueditor/ueditorDemo";
	}
	
	////////////////////////////////////ueditor end////////////////////////////////
	////////////////////////////////////umeditor begin////////////////////////////////
	
	/**
	 * umeditor跳转页面
	 * @return
	 */
	@RequestMapping("queryUmeditor")
	public String queryUmeditor(){
		return "commons/demo/umeditor/umeditorDemo";
	}
	
	////////////////////////////////////umeditor end////////////////////////////////

	/**
	 * 演示事务回滚
	 */
	
	@RequestMapping("transactionDemo")
	public String transactionDemo(String dm,String mc,Model model){
		
		try{
			HashMap map = new  HashMap();
			map.put("mc", mc);
			map.put("dm", dm);
			demoService.addTest_dmwh_1(map);
			demoService.addTest_dmwh_2(map);
		}catch(Exception e){
			logger.error("执行： transactionDemo() 失败", e);
			model.addAttribute("message", e.toString());
		}
		return "commons/demo/transaction/transactionDemo";
	}	
	
	/**
	 * 返回DataGrid
	 * @param model
	 * @param zdglPage
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="queryNjListData")
	public Object queryNjListData(Model model,DemoJsonPage demoJsonPage,HttpSession session){
		JSONObject jsonObject = null;
		try{
			logger.info("queryNjListData() ");			
			List<Map> njList = demoService.queryNjList(demoJsonPage);
			Integer total = demoService.queryNjListCount(demoJsonPage);
			jsonObject = new JSONObject();
			jsonObject.put("total", total);
			jsonObject.put("rows", njList);
		}catch(Exception e){
			logger.error("queryNjListData() 失败", e);
		}
		return jsonObject;
	}	
	
}

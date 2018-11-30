package com.incon.project.common.jsgl.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.incon.framework.aop.MethodLog;
import com.incon.framework.service.impl.CommServiceImpl;
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
/**
 * 
 * @类名：  com.incon.project.common.jsgl.service.JsglServiceImpl
 * @创建人： 赵玥
 * @日期： 2014-03-11
 * @修改人：
 * @日期：
 * @描述：  
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value="jsglService")
public class JsglServiceImpl extends CommServiceImpl implements JsglService{
	//添加教师
	@Override
	@MethodLog(description="增加教师")
	public void addJs(JsxxbEntity jsxxbEntity) {
		dbDao.insert("jsgl.addJs", jsxxbEntity);
		
	}
	//添加教师
	@Override
	@MethodLog(description="增加教师")
	public void addXzjs(List<JsxxbEntity> list) {
		dbDao.executeBatchOperation("jsgl.addXzjs", list, "insert");
	}
	//删除教师
	@Transactional
	@Override
	@MethodLog(description="删除教师")
	public void delJs(String[] ids){
		dbDao.executeBatchOperation("jsgl.delJs", Arrays.asList(ids), "delete");
	}
	@Transactional
	@Override
	@MethodLog(description="修改教师状态")
	public void updKyf(List<JsxxbEntity> list){
		dbDao.executeBatchOperation("jsgl.updKyf", list, "update");
	}
	//查询教师
	@Override
	public List<JsxxbEntity> queryJsList() {
		
		return dbDao.query("jsgl.queryJsList");
	}
	//查询院系列表
	@Override
	public List<YxdmbEntity> queryYxList() {
		
		return dbDao.query("jsgl.queryYxList");
	}
	
	//查询教研室
	@Override
	public List<JysbEntity> queryJysList(String yxdm){
		return dbDao.query("jsgl.queryJysList",yxdm);
	}
	
	//查询zgh是否重复
	@Override
	public Integer queryByZghCount(String zgh){
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("jsgl.queryByZghCount", zgh)));
	}
	
	//查询zgh是否重复
	@Override
	public Integer queryByZghCount2(String zgh){
		return Integer.parseInt(String.valueOf(dbDao.queryForObject("jsgl.queryByZghCount2", zgh)));
	}
	
	//修改教师
	@Override
	@MethodLog(description="根据教师号修改教师")
	public void updJs(JsxxbEntity jsxxbEntity) {
		dbDao.update("jsgl.updJs", jsxxbEntity);
		
	}
	//根据教师职工号查询教师
	@Override
	public JsxxbEntity queryJsByZgh(String zgh){
		return (JsxxbEntity) dbDao.queryForObject("jsgl.queryJsByZgh", zgh);
	}
	
	//查询学院
	@Override
	public List<YxdmbEntity> queryYxb(){
		return dbDao.query("jsgl.queryYxb");
	}
	
	//性别表
	@Override
	public List<XbbEntity> queryXb(){
		return dbDao.query("jsgl.queryXb");
	}
	@Override
	public List<JgbEntity> queryJg() {
		return dbDao.query("jsgl.queryJg");
	}
	@Override
	public List<MzbEntity> queryMz() {
		return dbDao.query("jsgl.queryMz");
	}
	@Override
	public List<WhcdbEntity> queryWhcd() {
		return dbDao.query("jsgl.queryWhcd");
	}
	@Override
	public List<XlbEntity> queryXl() {
		return dbDao.query("jsgl.queryXl");
	}
	@Override
	public List<XwbEntity> queryXw() {
		return dbDao.query("jsgl.queryXw");
	}
	@Override
	public List<XzjbbEntity> queryXzjb() {
		return dbDao.query("jsgl.queryXzjb");
	}
	@Override
	public List<ZcbEntity> queryZc() {
		return dbDao.query("jsgl.queryZc");
	}
	@Override
	public List<ZzmmbEntity> queryZzmm() {
		return dbDao.query("jsgl.queryZzmm");
	}
	
	//根据院查询系
	@Override
	public List<YxdmbEntity> queryXList(String yxdm){
		return dbDao.query("jsgl.queryXList",yxdm);
	}
	
	//查询院是否为管理院系
	@Override
	public YxdmbEntity querySfglbm(YxdmbEntity yxdmbEntity){
		return (YxdmbEntity) dbDao.queryForObject("jsgl.querySfglbm",yxdmbEntity);
	}
	
	//根据院代码查询教研室
	@Override
	public List<JysbEntity> queryJysListNoGl(String yxdm){
		return dbDao.query("jsgl.queryJysByYx", yxdm);
	}
	
	//根据系代码查询教研室
	@Override
	public List<JysbEntity> queryJysListNoGlByX(String yxdm){
		return dbDao.query("jsgl.queryJysListNoGlByX", yxdm);
	}
	
	@Override
	public int queryJyssjqxCount(Map map) {
		
		return (Integer)dbDao.queryForObject("jysgl.queryJyssjqxCount",map);
	}
	
	@Override
	public UserEntity queryUser(UserEntity userEntity) {
		
		return (UserEntity) dbDao.queryForObject("jysgl.queryUser", userEntity);
	}
	//-------------------导入   赵玥  16-11-14
	@Override
	public boolean impPyfa(HSSFWorkbook workbook,UserEntity userEntity) {
//		Map map = new HashMap();
		//=====================创建导入错误Excel begin===========================
//		int r_index = 1;	//生成错误数据Excel的下标,0为表头
//		HSSFWorkbook returnWorkBook = new HSSFWorkbook(); //创建Excel
//		HSSFSheet returnSheet = returnWorkBook.createSheet("Sheet1");//创建Sheet
//		//=====================Excel样式 begin===========================
//		HSSFCellStyle style = returnWorkBook.createCellStyle();
//		style.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 下边框
//		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);// 左边框
//		style.setBorderTop(HSSFCellStyle.BORDER_THIN);// 上边框
//		style.setBorderRight(HSSFCellStyle.BORDER_THIN);// 右边框
//		style.setBottomBorderColor(IndexedColors.BLACK.getIndex());// 黑色
//		style.setLeftBorderColor(IndexedColors.BLACK.getIndex());// 黑色
//		style.setTopBorderColor(IndexedColors.BLACK.getIndex());// 黑色
//		style.setRightBorderColor(IndexedColors.BLACK.getIndex());// 黑色
//		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
//		style.setDataFormat(HSSFDataFormat.getBuiltinFormat("@"));
//		style.setWrapText(true);   
//		style.setLocked(false);
//		HSSFFont font = returnWorkBook.createFont();
//		font.setFontName("黑体");
//		style.setFont(font);
		try {
			//=====================Excel样式 end===========================
			//=====================Excel表头 begin===========================
//			List<String> titlesList = new ArrayList<String>(); // 表头list	
//			titlesList.add("教师号(必填)");
//			titlesList.add("教师名称(必填)");
//			titlesList.add("性别(填写数字,1:男,2:女,3:未知)");
//			titlesList.add("学院代码(必填)");
//			titlesList.add("系代码(必填)");
//			titlesList.add("教研室代码(必填)");
//			titlesList.add("管理院系(必填)");
//			HSSFRow T_row = returnSheet.createRow(0);//创建一行表头
//			//设置第一行行头
//			for (int i = 0; i < titlesList.size(); i++) {
//				HSSFCell titleCell = T_row.createCell(i);
//				titleCell.setCellStyle(style);
//				titleCell.setCellValue(titlesList.get(i));
//			}
//			//=====================Excel表头 end===========================
			//=====================创建导入错误Excel end===========================
//			String msg;
			HSSFSheet sheet = workbook.getSheet("Sheet1"); //获取Sheet
			List<JsxxbEntity> list = new ArrayList<JsxxbEntity>();
			Iterator<Row> rows = sheet.rowIterator(); //将Excel行数据装入迭代器
			while (rows.hasNext()) {
//				msg = "";//迭代Excel 行
				JsxxbEntity entity = new JsxxbEntity(); //创建实体接收数据
				Row row = (Row) rows.next(); //获取一行数据
				if (row.getRowNum() == 0) { //第一行列头 continue
					continue;
				}
				if (row.getCell(0) != null && row.getCell(1) != null
						&& row.getCell(3) != null 
						&& !row.getCell(0).toString().trim().equals("")
						&& !row.getCell(1).toString().trim().equals("")
						&& !row.getCell(3).toString().trim().equals("")
						) {					
					entity.setZgh(row.getCell(0)== null ? "" :row.getCell(0).toString().trim()); //获取一列数据装入实体
					entity.setJsxm(row.getCell(1)== null ? "" :row.getCell(1).toString().trim());
					entity.setXb(row.getCell(2)== null ? "" :row.getCell(2).toString().trim());
					entity.setXydm(row.getCell(3)== null ? "" :row.getCell(3).toString().trim());
					entity.setXdm(row.getCell(4)== null ? "" :row.getCell(4).toString().trim());
					entity.setJysdm(row.getCell(5)== null ? "" :row.getCell(5).toString().trim());
					entity.setGlyx(row.getCell(6)== null ? "" :row.getCell(6).toString().trim());
					entity.setCjr(userEntity.getYhdm());
					//判断是否存在师资表中
					if (this.queryOneJsxxbByzgh(
							row.getCell(0).toString().trim()).equals("0")) { //增加
						this.addBathJsxx(entity);
					} else {
						this.updBathJsxx(entity);
					}
				}
//				} else {
//					HSSFRow r_row = returnSheet.createRow(r_index);
//					r_row.createCell(0, HSSFCell.CELL_TYPE_STRING)
//							.setCellValue(
//									null == row.getCell(0) ? "" : row
//											.getCell(0).toString());
//					r_row.createCell(1, HSSFCell.CELL_TYPE_STRING)
//							.setCellValue(
//									null == row.getCell(1) ? "" : row
//											.getCell(1).toString());
//					r_row.createCell(2, HSSFCell.CELL_TYPE_STRING)
//							.setCellValue(
//									null == row.getCell(2) ? "" : row
//											.getCell(2).toString());
//					r_row.createCell(3, HSSFCell.CELL_TYPE_STRING)
//							.setCellValue(
//									null == row.getCell(3) ? "" : row
//											.getCell(3).toString());
//					r_row.createCell(4, HSSFCell.CELL_TYPE_STRING)
//							.setCellValue(
//									null == row.getCell(4) ? "" : row
//											.getCell(4).toString());
//					r_row.createCell(5, HSSFCell.CELL_TYPE_STRING)
//							.setCellValue(
//									null == row.getCell(5) ? "" : row
//											.getCell(5).toString());
//					r_row.createCell(6, HSSFCell.CELL_TYPE_STRING)
//							.setCellValue(
//									null == row.getCell(6) ? "" : row
//											.getCell(6).toString());
//					r_row.createCell(7, HSSFCell.CELL_TYPE_STRING)
//							.setCellValue("教师号,教师名称,学院代码,系代码,教研室代码,管理院系有空值");
//					r_index++;
//					continue;
//				}
			}
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("报错了！");
			e.printStackTrace();
			return false;
		}
		//map.put("msg", msg);
//		map.put("returnWorkBook", returnWorkBook);
		
	}
	@Override
	public String queryOneJsxxbByzgh(String zgh) {
		// TODO Auto-generated method stub
		return (String)dbDao.queryForObject("jsgl.queryOneJsxxbByzgh", zgh);
	}
	@Override
	public void addBathJsxx(JsxxbEntity entity) {
		// TODO Auto-generated method stub
		dbDao.insert("jsgl.addBathJsxx", entity);
	}
	@Override
	public void updBathJsxx(JsxxbEntity entity) {
		// TODO Auto-generated method stub
		dbDao.update("jsgl.updBathJsxx", entity);
	}
	@Override
	public Integer queryJgCount(String dmormc) {
		// TODO Auto-generated method stub
		return (Integer) dbDao.queryForObject("jsgl.queryJgCount", dmormc);
	}
	@Override
	public String queryJgDm(String dmormc) {
		// TODO Auto-generated method stub
		return (String) dbDao.queryForObject("jsgl.queryJgDm", dmormc);
	}
	@Override
	public Integer queryJysCount(String dmormc) {
		// TODO Auto-generated method stub
		return (Integer) dbDao.queryForObject("jsgl.queryJysCount", dmormc);
	}
	@Override
	public String queryJysDm(String dmormc) {
		// TODO Auto-generated method stub
		return (String) dbDao.queryForObject("jsgl.queryJysDm", dmormc);
	}
	@Override
	public Integer queryMzCount(String dmormc) {
		// TODO Auto-generated method stub
		return (Integer) dbDao.queryForObject("jsgl.queryMzCount", dmormc);
	}
	@Override
	public String queryMzDm(String dmormc) {
		// TODO Auto-generated method stub
		return (String) dbDao.queryForObject("jsgl.queryMzDm", dmormc);
	}
	@Override
	public Integer queryWhcdCount(String dmormc) {
		// TODO Auto-generated method stub
		return (Integer) dbDao.queryForObject("jsgl.queryWhcdCount", dmormc);
	}
	@Override
	public String queryWhcdDm(String dmormc) {
		// TODO Auto-generated method stub
		return (String) dbDao.queryForObject("jsgl.queryWhcdDm", dmormc);
	}
	@Override
	public Integer queryXbCount(String dmormc) {
		// TODO Auto-generated method stub
		return (Integer) dbDao.queryForObject("jsgl.queryXbCount", dmormc);
	}
	@Override
	public String queryXbDm(String dmormc) {
		// TODO Auto-generated method stub
		return (String) dbDao.queryForObject("jsgl.queryXbDm", dmormc);
	}
	@Override
	public Integer queryXlCount(String dmormc) {
		// TODO Auto-generated method stub
		return (Integer) dbDao.queryForObject("jsgl.queryXlCount", dmormc);
	}
	@Override
	public String queryXlDm(String dmormc) {
		// TODO Auto-generated method stub
		return (String) dbDao.queryForObject("jsgl.queryXlDm", dmormc);
	}
	@Override
	public Integer queryXwCount(String dmormc) {
		// TODO Auto-generated method stub
		return (Integer) dbDao.queryForObject("jsgl.queryXwCount", dmormc);
	}
	@Override
	public String queryXwDm(String dmormc) {
		// TODO Auto-generated method stub
		return (String) dbDao.queryForObject("jsgl.queryXwDm", dmormc);
	}
	@Override
	public Integer queryXzjbCount(String dmormc) {
		// TODO Auto-generated method stub
		return (Integer) dbDao.queryForObject("jsgl.queryXzjbCount", dmormc);
	}
	@Override
	public String queryXzjbDm(String dmormc) {
		// TODO Auto-generated method stub
		return (String) dbDao.queryForObject("jsgl.queryXzjbDm", dmormc);
	}
	@Override
	public Integer queryYxCount(String dmormc) {
		// TODO Auto-generated method stub
		return (Integer) dbDao.queryForObject("jsgl.queryYxCount", dmormc);
	}
	@Override
	public String queryYxDm(String dmormc) {
		// TODO Auto-generated method stub
		return (String) dbDao.queryForObject("jsgl.queryYxDm", dmormc);
	}
	@Override
	public Integer queryZcCount(String dmormc) {
		// TODO Auto-generated method stub
		return (Integer) dbDao.queryForObject("jsgl.queryZcCount", dmormc);
	}
	@Override
	public String queryZcDm(String dmormc) {
		// TODO Auto-generated method stub
		return (String) dbDao.queryForObject("jsgl.queryZcDm", dmormc);
	}
	@Override
	public Integer queryZyCount(String dmormc) {
		// TODO Auto-generated method stub
		return (Integer) dbDao.queryForObject("jsgl.queryZyCount", dmormc);
	}
	@Override
	public String queryZyDm(String dmormc) {
		// TODO Auto-generated method stub
		return (String) dbDao.queryForObject("jsgl.queryZyDm", dmormc);
	}
	@Override
	public Integer queryZzmmCount(String dmormc) {
		// TODO Auto-generated method stub
		return (Integer) dbDao.queryForObject("jsgl.queryZzmmCount", dmormc);
	}
	@Override
	public String queryZzmmDm(String dmormc) {
		// TODO Auto-generated method stub
		return (String) dbDao.queryForObject("jsgl.queryZzmmDm", dmormc);
	}
	@Override
	public Map impJsxx(HSSFWorkbook workbook) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		//=====================创建导入错误Excel begin===========================
		int r_index = 1;	//生成错误数据Excel的下标,0为表头
		HSSFWorkbook returnWorkBook = new HSSFWorkbook(); //创建Excel
		HSSFSheet returnSheet = returnWorkBook.createSheet("Sheet1");//创建Sheet
		//=====================Excel样式 begin===========================
		HSSFCellStyle style = returnWorkBook.createCellStyle();
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 下边框
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);// 左边框
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);// 上边框
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);// 右边框
		style.setBottomBorderColor(IndexedColors.BLACK.getIndex());// 黑色
		style.setLeftBorderColor(IndexedColors.BLACK.getIndex());// 黑色
		style.setTopBorderColor(IndexedColors.BLACK.getIndex());// 黑色
		style.setRightBorderColor(IndexedColors.BLACK.getIndex());// 黑色
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setDataFormat(HSSFDataFormat.getBuiltinFormat("@"));
		style.setWrapText(true);   
		style.setLocked(false);
		HSSFFont font = returnWorkBook.createFont();
		font.setFontName("黑体");
		style.setFont(font);
		//=====================Excel样式 end===========================
		//=====================Excel表头 begin===========================
		List<String> titlesList = new ArrayList<String>(); // 表头list
		titlesList.add("职工号(必填)");
		titlesList.add("姓名(必填)");
		titlesList.add("性别");
		titlesList.add("学院(必填)");
		titlesList.add("系");
		titlesList.add("教研室");
		titlesList.add("籍贯");
		titlesList.add("民族");
		titlesList.add("文化程度");
		titlesList.add("学历");
		titlesList.add("学位");
		titlesList.add("行政级别");
		titlesList.add("职称");
		titlesList.add("政治面貌");
		HSSFRow T_row = returnSheet.createRow(0);//创建一行表头
		//设置第一行行头
		for (int i = 0; i < titlesList.size(); i++) {
			HSSFCell titleCell = T_row.createCell(i);
			titleCell.setCellStyle(style);  
			titleCell.setCellValue(titlesList.get(i));
		}
		//=====================Excel表头 end===========================
		//=====================创建导入错误Excel end===========================
		String msg;
		HSSFSheet sheet = workbook.getSheet("Sheet1");			//获取Sheet
	    List<JsxxbEntity> list = new ArrayList<JsxxbEntity>(); 
		Iterator<Row> rows = sheet.rowIterator();				//将Excel行数据装入迭代器
		while (rows.hasNext()){      
			 msg = "";//迭代Excel 行
			 JsxxbEntity entity = new JsxxbEntity();		//创建实体接收数据
			Row row = (Row) rows.next();    					//获取一行数据
			if (row.getRowNum() == 0){							//第一行列头 continue
				continue;
			}
			if(row.getCell(0) != null && row.getCell(1) != null  && row.getCell(3) != null 
					&& !row.getCell(0).toString().trim().equals("")
					&& !row.getCell(1).toString().trim().equals("") 
					&& !row.getCell(3).toString().trim().equals("") 
					 ){
//				if((this.queryYxCount(row.getCell(3).toString().trim())<1 &&row.getCell(3)!=null&& !row.getCell(3).toString().equals(""))
//						|| (this.queryZyCount(row.getCell(4).toString().trim())<1 && !row.getCell(4).toString().equals(""))
//						  ||(this.queryJysCount(row.getCell(5).toString().trim())<1  && !row.getCell(5).toString().equals(""))
//						    || (this.queryXbCount(row.getCell(2).toString().trim())<1 && !row.getCell(2).toString().equals(""))
//						      ||(this.queryJgCount(row.getCell(6).toString().trim())<1  && !row.getCell(6).toString().equals(""))
//								|| (this.queryMzCount(row.getCell(7).toString().trim())<1 && !row.getCell(7).toString().equals(""))
//								  ||(this.queryWhcdCount(row.getCell(8).toString().trim())<1  && !row.getCell(8).toString().equals(""))
//								    || (this.queryXlCount(row.getCell(9).toString().trim())<1 && !row.getCell(9).toString().equals(""))
//								     ||(this.queryXwCount(row.getCell(10).toString().trim())<1  && !row.getCell(10).toString().equals(""))
//								      || (this.queryXzjbCount(row.getCell(11).toString().trim())<1 && !row.getCell(11).toString().equals(""))
//									   ||(this.queryZcCount(row.getCell(12).toString().trim())<1  && !row.getCell(12).toString().equals(""))
//									    || (this.queryZzmmCount(row.getCell(13).toString().trim())<1 && !row.getCell(13).toString().equals(""))
//				)
//				{
//					HSSFRow r_row = returnSheet.createRow(r_index);
//					r_row.createCell(0, HSSFCell.CELL_TYPE_STRING).setCellValue(null == row.getCell(0) ? "" : row.getCell(0).toString());
//					r_row.createCell(1, HSSFCell.CELL_TYPE_STRING).setCellValue(null == row.getCell(1) ? "" : row.getCell(1).toString());
//					r_row.createCell(2, HSSFCell.CELL_TYPE_STRING).setCellValue(null == row.getCell(2) ? "" : row.getCell(2).toString());
//					r_row.createCell(3, HSSFCell.CELL_TYPE_STRING).setCellValue(null == row.getCell(3) ? "" : row.getCell(3).toString());
//					r_row.createCell(4, HSSFCell.CELL_TYPE_STRING).setCellValue(null == row.getCell(4) ? "" : row.getCell(4).toString());
//					r_row.createCell(5, HSSFCell.CELL_TYPE_STRING).setCellValue(null == row.getCell(5) ? "" : row.getCell(5).toString());
//					r_row.createCell(6, HSSFCell.CELL_TYPE_STRING).setCellValue(null == row.getCell(6) ? "" : row.getCell(6).toString());
//					r_row.createCell(7, HSSFCell.CELL_TYPE_STRING).setCellValue(null == row.getCell(7) ? "" : row.getCell(7).toString());
//					r_row.createCell(8, HSSFCell.CELL_TYPE_STRING).setCellValue(null == row.getCell(8) ? "" : row.getCell(8).toString());
//					r_row.createCell(9, HSSFCell.CELL_TYPE_STRING).setCellValue(null == row.getCell(9) ? "" : row.getCell(9).toString());
//					r_row.createCell(10, HSSFCell.CELL_TYPE_STRING).setCellValue(null == row.getCell(10) ? "" : row.getCell(10).toString());
//					r_row.createCell(11, HSSFCell.CELL_TYPE_STRING).setCellValue(null == row.getCell(11) ? "" : row.getCell(11).toString());
//					r_row.createCell(12, HSSFCell.CELL_TYPE_STRING).setCellValue(null == row.getCell(12) ? "" : row.getCell(12).toString());
//					r_row.createCell(13, HSSFCell.CELL_TYPE_STRING).setCellValue(null == row.getCell(13) ? "" : row.getCell(13).toString());
//					r_row.createCell(14, HSSFCell.CELL_TYPE_STRING).setCellValue("学院,专业,教研室,性别,籍贯,民族,文化程度,学历,学位,行政级别,职称,政治面貌有不正确的值");
//					r_index++;
//					continue;
//				
//				}else{
//				entity.setZgh(row.getCell(0).toString().trim());   	//获取一列数据装入实体
//				entity.setJsxm(row.getCell(1).toString().trim());
//				entity.setXb( this.queryXbDm( row.getCell(3).toString().trim()));
//				entity.setXydm(this.queryYxDm( row.getCell(4).toString().trim()));
//				entity.setXdm(this.queryYxDm( row.getCell(5).toString().trim()));
//				entity.setJysdm(this.queryJysDm( row.getCell(6).toString().trim()));
//				entity.setJg(this.queryJgDm( row.getCell(7).toString().trim()));
//				entity.setMz(this.queryMzDm( row.getCell(8).toString().trim()));
//				entity.setWhcd(this.queryWhcdDm( row.getCell(9).toString().trim()));
//				entity.setXl(this.queryXlDm( row.getCell(10).toString().trim()));
//				entity.setXw(this.queryXwDm( row.getCell(11).toString().trim()));
//				entity.setXzjb(this.queryXzjbDm(row.getCell(12).toString().trim()) );
//				entity.setZc(this.queryZcDm(row.getCell(13).toString().trim()));
//				entity.setZzmm(this.queryZzmmDm( row.getCell(14).toString().trim()));
				entity.setZgh(row.getCell(0)==null?"":row.getCell(0).toString().trim());   	//获取一列数据装入实体
				entity.setJsxm(row.getCell(1)==null?"":row.getCell(1).toString().trim());
				entity.setXb(row.getCell(2)==null?"":row.getCell(2).toString().trim());
				entity.setXydm(row.getCell(3)==null?"":row.getCell(3).toString().trim());
				entity.setXdm(row.getCell(4)==null?"":row.getCell(4).toString().trim());
				entity.setJysdm(row.getCell(5)==null?"":row.getCell(5).toString().trim());
				entity.setJg(row.getCell(6)==null?"":row.getCell(6).toString().trim());
				entity.setMz(row.getCell(7)==null?"":row.getCell(7).toString().trim());
				entity.setWhcd(row.getCell(8)==null?"":row.getCell(8).toString().trim());
				entity.setXl(row.getCell(9)==null?"":row.getCell(9).toString().trim());
				entity.setXw(row.getCell(10)==null?"":row.getCell(10).toString().trim());
				entity.setXzjb(row.getCell(11)==null?"":row.getCell(11).toString().trim());
				entity.setZc(row.getCell(12)==null?"":row.getCell(12).toString().trim());
				entity.setZzmm(row.getCell(13)==null?"":row.getCell(13).toString().trim());
					if (this.queryByPtZghCount(entity.getZgh()).equals(0)){	//增加
						this.addPtJsxx(entity);
					}else{				
						this.updPtJsxx(entity);
					}
//				}
			}else{
				HSSFRow r_row = returnSheet.createRow(r_index);
				r_row.createCell(0, HSSFCell.CELL_TYPE_STRING).setCellValue(null == row.getCell(0) ? "" : row.getCell(0).toString());
				r_row.createCell(1, HSSFCell.CELL_TYPE_STRING).setCellValue(null == row.getCell(1) ? "" : row.getCell(1).toString());
				r_row.createCell(2, HSSFCell.CELL_TYPE_STRING).setCellValue(null == row.getCell(2) ? "" : row.getCell(2).toString());
				r_row.createCell(3, HSSFCell.CELL_TYPE_STRING).setCellValue(null == row.getCell(3) ? "" : row.getCell(3).toString());
				r_row.createCell(4, HSSFCell.CELL_TYPE_STRING).setCellValue(null == row.getCell(4) ? "" : row.getCell(4).toString());
				r_row.createCell(5, HSSFCell.CELL_TYPE_STRING).setCellValue(null == row.getCell(5) ? "" : row.getCell(5).toString());
				r_row.createCell(6, HSSFCell.CELL_TYPE_STRING).setCellValue(null == row.getCell(6) ? "" : row.getCell(6).toString());
				r_row.createCell(7, HSSFCell.CELL_TYPE_STRING).setCellValue(null == row.getCell(7) ? "" : row.getCell(7).toString());
				r_row.createCell(8, HSSFCell.CELL_TYPE_STRING).setCellValue(null == row.getCell(8) ? "" : row.getCell(8).toString());
				r_row.createCell(9, HSSFCell.CELL_TYPE_STRING).setCellValue(null == row.getCell(9) ? "" : row.getCell(9).toString());
				r_row.createCell(10, HSSFCell.CELL_TYPE_STRING).setCellValue(null == row.getCell(10) ? "" : row.getCell(10).toString());
				r_row.createCell(11, HSSFCell.CELL_TYPE_STRING).setCellValue(null == row.getCell(11) ? "" : row.getCell(11).toString());
				r_row.createCell(12, HSSFCell.CELL_TYPE_STRING).setCellValue(null == row.getCell(12) ? "" : row.getCell(12).toString());
				r_row.createCell(13, HSSFCell.CELL_TYPE_STRING).setCellValue(null == row.getCell(13) ? "" : row.getCell(13).toString());
				r_row.createCell(14, HSSFCell.CELL_TYPE_STRING).setCellValue("职工号,教师姓名,学院有空值");
				r_index++;
				continue;
			}
		}
		return map;
	}
	@Override
	public void addPtJsxx(JsxxbEntity jsxxbEntity) {
		// TODO Auto-generated method stub
		dbDao.insert("jsgl.addPtJsxx", jsxxbEntity);
	}
	@Override
	public Integer queryByPtZghCount(String zgh) {
		// TODO Auto-generated method stub
		return (Integer) dbDao.queryForObject("jsgl.queryByPtZghCount", zgh);
	}
	@Override
	public void updPtJsxx(JsxxbEntity jsxxbEntity) {
		// TODO Auto-generated method stub
		dbDao.update("jsgl.updPtJsxx", jsxxbEntity);
	}
	@Override
	public String queryBj(String dmormc) {
		// TODO Auto-generated method stub
		return (String) dbDao.queryForObject("jsgl.queryBj", dmormc);
	}
	@Override
	public Integer queryBjCount(String dmormc) {
		// TODO Auto-generated method stub
		return (Integer) dbDao.queryForObject("jsgl.queryBjCount", dmormc);
	}
	@Override
	public List<JsxxbEntity> queryYxByJysTree(JsxxbEntity entity) {
		// TODO Auto-generated method stub
		return dbDao.query("jsgl.queryYxByJysTree",entity);
	}
	@Override
	public void addorupdJs(JsxxbEntity entity) {
		// TODO Auto-generated method stub
		System.out.println(entity.getZgh()+entity.getJsxm()+"sv");
		dbDao.insert("jsgl.addorupdJs", entity);
	}
	@Override
	public List<JsxxbEntity> queryAllJsxx(String ids) {
		// TODO Auto-generated method stub
		return dbDao.query("jsgl.queryAllJsxx",ids);
	}
	
	
}

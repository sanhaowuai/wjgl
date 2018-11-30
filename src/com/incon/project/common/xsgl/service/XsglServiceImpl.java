package com.incon.project.common.xsgl.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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
import com.incon.pojo.common.ZybEntity;
import com.incon.pojo.common.jcxgxxwh.BjbEntity;
import com.incon.pojo.common.ryxgxxwh.JgbEntity;
import com.incon.pojo.common.ryxgxxwh.MzbEntity;
import com.incon.pojo.common.ryxgxxwh.XbbEntity;
import com.incon.pojo.common.ryxgxxwh.ZzmmbEntity;
import com.incon.project.common.jsgl.service.JsglService;

/**
 * 
 * @类名： com.incon.project.common.xsgl.service.XsglServiceImpl
 * @创建人： 杨文龙
 * @日期： 2013-3-11
 * @修改人：
 * @日期：
 * @描述：
 * @版本号：
 */
@SuppressWarnings("all")
@Service(value = "xsglService")
public class XsglServiceImpl extends CommServiceImpl implements XsglService
{
	@Resource(name="jsglService")
	private JsglService jsglService;
    // 添加学生
    @Override
    @MethodLog(description = "增加学生")
    public void addXs(XsxxbEntity xsxxbEntity)
    {
        dbDao.insert("xsgl.addXs", xsxxbEntity);

    }
    // 添加学生
    @Override
    @MethodLog(description = "增加学生")
    public void addXzxs(List<XsxxbEntity> list)
    {
    	dbDao.executeBatchOperation("xsgl.addXzxs", list, "insert");
    }

    // 根据学生学号查询学生
    @Override
    public XsxxbEntity queryXsByXh(String xh)
    {
        return (XsxxbEntity) dbDao.queryForObject("xsgl.queryXsByXh", xh);
    }

    // 查询院系列表
    @Override
    public List<YxdmbEntity> queryYxList(UserEntity userEntity)
    {
        return dbDao.query("xsgl.queryYxList", userEntity);
    }

    // 查询院系列表
    public List<YxdmbEntity> queryYxList2()
    {
        return dbDao.query("xsgl.queryYxList2");
    }

    // 查询专业列表

    public List<ZybEntity> queryZyList(String yxdm)
    {
        return dbDao.query("xsgl.queryZyList", yxdm);
    }

    // 根据学生学号修改学生
    @Override
    @MethodLog(description = "根据学生学号修改学生")
    public void updXsByXh(XsxxbEntity xsxxbEntity)
    {
        dbDao.update("xsgl.updXsByXh", xsxxbEntity);
    }

    @Override
    public List<XsxxbEntity> queryXsList()
    {
        return dbDao.query("xsgl.queryXsList");
    }

    // 删除学生
    @Override
    @Transactional
    @MethodLog(description = "删除学生")
    public void delXs(String[] ids)
    {
        dbDao.executeBatchOperation("xsgl.delXs", Arrays.asList(ids), "delete");
    }

    // 查询xh是否重复
    @Override
    public Integer queryByXhCount(String xh)
    {
        return Integer.parseInt(String.valueOf(dbDao.queryForObject(
                "xsgl.queryByXhCount", xh)));
    }

    // 查询xh在登录表中是否存在
    @Override
    public Integer queryByXhCount2(String xh)
    {
        return Integer.parseInt(String.valueOf(dbDao.queryForObject(
                "xsgl.queryByXhCount2", xh)));
    }

    // 查询性别
    @Override
    public List<XbbEntity> queryXb()
    {
        return dbDao.query("xsgl.queryXb");
    }

    // 查询籍贯
    @Override
    public List<JgbEntity> queryJg()
    {
        return dbDao.query("xsgl.queryJg");
    }

    // 查询民族
    @Override
    public List<MzbEntity> queryMz()
    {
        return dbDao.query("xsgl.queryMz");
    }

    // 查询政治面貌
    @Override
    public List<ZzmmbEntity> queryZzmm()
    {
        return dbDao.query("xsgl.queryZzmm");
    }

    // 查询班级
    @Override
    public List<BjbEntity> queryBjList(String zydm)
    {
        return dbDao.query("xsgl.queryBjList", zydm);
    }

    // 根据学院查询系
    @Override
    public List<YxdmbEntity> queryXList(String yxdm)
    {
        return dbDao.query("xsgl.queryXList", yxdm);
    }

    // 查询院是否为管理院系
    @Override
    public YxdmbEntity querySfglbm(YxdmbEntity yxdmbEntity)
    {
        return (YxdmbEntity) dbDao.queryForObject("xsgl.querySfglbm",
                yxdmbEntity);
    }

    // 查询专业列表
    @Override
    public List<ZybEntity> queryZyListByY(String xydm)
    {
        return dbDao.query("xsgl.queryZyListByY", xydm);
    }

    // 根据系查询专业
    @Override
    public List<ZybEntity> queryZyListByX(String xydm)
    {
        return dbDao.query("xsgl.queryZyListByX", xydm);
    }

    // 查询班级
    @Override
    public List<BjbEntity> queryBjList2(String zydm)
    {
        return dbDao.query("xsgl.queryBjList2", zydm);
    }

    @Override
    public UserEntity queryUser(UserEntity userEntity)
    {

        return (UserEntity) dbDao.queryForObject("xsgl.queryUser", userEntity);
    }
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
//			titlesList.add("学号(必填)");
//			titlesList.add("姓名(必填)");
//			titlesList.add("性别(填写数字,1:男,2:女,3:未知)");
//			titlesList.add("学院代码(必填))");
//			titlesList.add("系代码(必填)");
//			titlesList.add("管理院系(必填)");
//			titlesList.add("专业代码(必填)");
//			titlesList.add("年级(必填数字)");
//			titlesList.add("班级代码(必填)");
//			HSSFRow T_row = returnSheet.createRow(0);//创建一行表头
//			//设置第一行行头
//			for (int i = 0; i < titlesList.size(); i++) {
//				HSSFCell titleCell = T_row.createCell(i);
//				titleCell.setCellStyle(style);
//				titleCell.setCellValue(titlesList.get(i));
//			}
			//=====================Excel表头 end===========================
			//=====================创建导入错误Excel end===========================
//			String msg;
			HSSFSheet sheet = workbook.getSheet("Sheet1"); //获取Sheet
			List<XsxxbEntity> list = new ArrayList<XsxxbEntity>();
			Iterator<Row> rows = sheet.rowIterator(); //将Excel行数据装入迭代器
			while (rows.hasNext()) {
//				msg = "";//迭代Excel 行				
				XsxxbEntity entity = new XsxxbEntity(); //创建实体接收数据
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

					entity.setXh(row.getCell(0)== null ? "" :row.getCell(0).toString().trim()); //获取一列数据装入实体
					entity.setXm(row.getCell(1)== null ? "" :row.getCell(1).toString().trim());
					entity.setXb(row.getCell(2)== null ? "" :row.getCell(2).toString().trim());
					entity.setXydm(row.getCell(3)== null ? "" :row.getCell(3).toString().trim());
					entity.setXdm(row.getCell(4)== null ? "" :row.getCell(4).toString().trim());
					entity.setGlyx(row.getCell(5)== null ? "" :row.getCell(5).toString().trim());
					entity.setZydm(row.getCell(6)== null ? "" :row.getCell(6).toString().trim());
					entity.setNj(row.getCell(7)== null ? "" :row.getCell(7).toString().trim());
					entity.setBjdm(row.getCell(8)== null ? "" :row.getCell(8).toString().trim());
					entity.setCjr(userEntity.getYhdm());
					//判断是否存在师资表中
					if (this.queryOneXsxxbByXh(
							row.getCell(0).toString().trim()).equals("0")) { //增加
						this.addBathXsxx(entity);
					} else {
						this.updBathXsxx(entity);
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
//					.setCellValue(
//							null == row.getCell(7) ? "" : row
//									.getCell(7).toString());
//					r_row.createCell(8, HSSFCell.CELL_TYPE_STRING)
//					.setCellValue(
//							null == row.getCell(8) ? "" : row
//									.getCell(8).toString());
//					r_row.createCell(9, HSSFCell.CELL_TYPE_STRING)
//							.setCellValue("学号,姓名,学院代码,系代码,管理院系,专业代码,年级,班级代码有空值");
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
//		return map;
	}
	@Override
	public String queryOneXsxxbByXh(String xh) {
		// TODO Auto-generated method stub
		return (String)dbDao.queryForObject("xsgl.queryOneXsxxbByXh", xh);
	}
	@Override
	public void addBathXsxx(XsxxbEntity entity) {
		// TODO Auto-generated method stub
		dbDao.insert("xsgl.addBathXsxx", entity);
	}
	@Override
	public void updBathXsxx(XsxxbEntity entity) {
		// TODO Auto-generated method stub
		dbDao.update("xsgl.updBathXsxx", entity);
	}
	
	
	
	@Override
	public Map impXsxx(HSSFWorkbook workbook) {
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
		titlesList.add("学号(必填))");
		titlesList.add("姓名(必填)");
		titlesList.add("性别");
		titlesList.add("学院(必填)");
		titlesList.add("系");
		titlesList.add("专业");
		titlesList.add("班级");
		titlesList.add("籍贯");
		titlesList.add("民族");
		titlesList.add("政治面貌");
		titlesList.add("年级");
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
	    List<XsxxbEntity> list = new ArrayList<XsxxbEntity>(); 
		Iterator<Row> rows = sheet.rowIterator();				//将Excel行数据装入迭代器
		while (rows.hasNext()){      
			 msg = "";//迭代Excel 行
			 XsxxbEntity entity = new XsxxbEntity();		//创建实体接收数据
			Row row = (Row) rows.next();    					//获取一行数据
			if (row.getRowNum() == 0){							//第一行列头 continue
				continue;
			}
			if(row.getCell(0) != null && row.getCell(1) != null  && row.getCell(3) != null 
					&& !row.getCell(0).toString().trim().equals("")
					&& !row.getCell(1).toString().trim().equals("") 
					&& !row.getCell(3).toString().trim().equals("") 
					 ){
//				if( (jsglService.queryXbCount(row.getCell(2).toString().trim())<1 && row.getCell(2)!=null )
//					||(jsglService.queryYxCount(row.getCell(3).toString().trim())<1 &&  row.getCell(3)!=null )
//				   	  ||(jsglService.queryYxCount(row.getCell(4).toString().trim())<1 &&  row.getCell(4)!=null )
//						|| (jsglService.queryYxCount(row.getCell(5).toString().trim())<1 &&  row.getCell(5)!=null )
//						  ||(jsglService.queryBjCount(row.getCell(6).toString().trim())<1  &&  row.getCell(6)!=null )
//						      ||(jsglService.queryJgCount(row.getCell(7).toString().trim())<1 &&  row.getCell(7)!=null )
//								|| (jsglService.queryMzCount(row.getCell(8).toString().trim())<1 &&  row.getCell(8)!=null )
//								   || (jsglService.queryZzmmCount(row.getCell(9).toString().trim())<1 &&  row.getCell(9)!=null )
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
//					r_row.createCell(10, HSSFCell.CELL_TYPE_STRING).setCellValue("学院,专业,班级,性别,籍贯,民族,政治面貌有不正确的值");
//					r_index++;
//					continue;
//				}else{
//				entity.setXh(row.getCell(0).toString().trim());   	//获取一列数据装入实体
//				entity.setXm(row.getCell(1).toString().trim());
//				entity.setXb( jsglService.queryXbDm( row.getCell(2).toString().trim()));
//				entity.setXydm(jsglService.queryYxDm( row.getCell(3).toString().trim()));
//				entity.setXdm(jsglService.queryYxDm( row.getCell(4).toString().trim()));
//				entity.setZydm(jsglService.queryZyDm( row.getCell(5).toString().trim()));
//				entity.setBjdm(jsglService.queryBj( row.getCell(6).toString().trim()));
//				entity.setJg(jsglService.queryJgDm( row.getCell(7).toString().trim()));
//				entity.setMz(jsglService.queryMzDm( row.getCell(8).toString().trim()));
//				entity.setZzmm(jsglService.queryZzmmDm( row.getCell(9).toString().trim()));
//					if (this.queryByPtXhCount(entity.getXh())<1){	//增加
//						this.addBathXsxx(entity);
//					}else{				
//						this.updBathXsxx(entity);
//					}
				entity.setXh(row.getCell(0)==null?"":row.getCell(0).toString().trim());   	//获取一列数据装入实体
				entity.setXm(row.getCell(1)==null?"":row.getCell(1).toString().trim());
				entity.setXb( row.getCell(2)==null?"":row.getCell(2).toString().trim());
				entity.setXydm(row.getCell(3)==null?"":row.getCell(3).toString().trim());
				entity.setXdm(row.getCell(4)==null?"":row.getCell(4).toString().trim());
				entity.setZydm(row.getCell(5)==null?"":row.getCell(5).toString().trim());
				entity.setBjdm(row.getCell(6)==null?"":row.getCell(6).toString().trim());
				entity.setJg(row.getCell(7)==null?"":row.getCell(7).toString().trim());
				entity.setMz(row.getCell(8)==null?"":row.getCell(8).toString().trim());
				entity.setZzmm(row.getCell(9)==null?"":row.getCell(9).toString().trim());
				entity.setNj(row.getCell(10)==null?"":row.getCell(10).toString().trim());
					if (this.queryByPtXhCount(entity.getXh())<1){	//增加
						this.addPtXsxx(entity);
					}else{				
						this.updPtXsxx(entity);
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
				r_row.createCell(11, HSSFCell.CELL_TYPE_STRING).setCellValue("学号,姓名,院系有空值");
				r_index++;
				continue;
			}
		}
		map.put("returnWorkBook", returnWorkBook);
		return map;
	}
	@Override
	public List<XsxxbEntity> queryYxByZyTree(XsxxbEntity entity) {
		// TODO Auto-generated method stub
		return dbDao.query("xsgl.queryYxByZyTree", entity);
	}
	@Override
	public void addorupdXs(XsxxbEntity entity) {
		// TODO Auto-generated method stub
		dbDao.insert("xsgl.addorupdXs", entity);
	}
	@Override
	public List<XsxxbEntity> queryAllXsxx(String ids) {
		// TODO Auto-generated method stub
		return dbDao.query("xsgl.queryAllXsxx", ids);
	}
	@Override
	public List<XsxxbEntity> queryAllXsxxByNj(String nj) {
		// TODO Auto-generated method stub
		return dbDao.query("xsgl.queryAllXsxxByNj",nj);
	}
	@Override
	public List<XsxxbEntity> qyeryAllNj() {
		// TODO Auto-generated method stub
		return dbDao.query("xsgl.qyeryAllNj");
	}
	@Override
	public Integer queryByPtXhCount(String xh) {
		// TODO Auto-generated method stub
		return (Integer) dbDao.queryForObject("xsgl.queryByPtXhCount", xh);
	}
	@Override
	public void addPtXsxx(XsxxbEntity entity) {
		// TODO Auto-generated method stub
		dbDao.insert("xsgl.addPtXsxx", entity);
	}
	@Override
	public void updPtXsxx(XsxxbEntity entity) {
		// TODO Auto-generated method stub
		dbDao.insert("xsgl.updPtXsxx", entity);
	}
	@Override
	public void addXzxs1(XsxxbEntity list) {
		// TODO Auto-generated method stub
		dbDao.insert("xsgl.addXzxs", list);
	}
}

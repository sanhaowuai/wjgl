package com.incon.framework.util;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.IndexedColors;

public class ExcelStyles {
  
	public static HSSFCellStyle getCellStyleBlackBorder(HSSFWorkbook   workbook){
        HSSFCellStyle sheetStyle = workbook.createCellStyle();
		sheetStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("@"));
		sheetStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 下边框
		sheetStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);// 左边框
		sheetStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);// 上边框
		sheetStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);// 右边框
		sheetStyle.setBottomBorderColor(IndexedColors.BLACK.getIndex());// 黑色
		sheetStyle.setLeftBorderColor(IndexedColors.BLACK.getIndex());// 黑色
		sheetStyle.setTopBorderColor(IndexedColors.BLACK.getIndex());// 黑色
		sheetStyle.setRightBorderColor(IndexedColors.BLACK.getIndex());// 黑色
		return sheetStyle;
	}
	public static HSSFCellStyle getCellStyleTitle(HSSFWorkbook   workbook){
        HSSFCellStyle sheetStyle = workbook.createCellStyle();
		sheetStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("@"));
		sheetStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 下边框
		sheetStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);// 左边框
		sheetStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);// 上边框
		sheetStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);// 右边框
		sheetStyle.setBottomBorderColor(IndexedColors.BLACK.getIndex());// 黑色
		sheetStyle.setLeftBorderColor(IndexedColors.BLACK.getIndex());// 黑色
		sheetStyle.setTopBorderColor(IndexedColors.BLACK.getIndex());// 黑色
		sheetStyle.setRightBorderColor(IndexedColors.BLACK.getIndex());// 黑色
		HSSFFont font = workbook.createFont();
		font.setFontName("黑体");
        font.setFontHeight((short)230);
        sheetStyle.setFont(font);
        sheetStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		return sheetStyle;
	}
}

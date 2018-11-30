package com.incon.framework.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.hssf.usermodel.DVConstraint;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFDataValidation;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.CellRangeAddressList;
import org.apache.poi.ss.usermodel.DataValidationConstraint;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
  
/**
 * 
 * @类名： com.incon.framework.util.ExcelUtil
 * @创建人： 林乐松
 * @日期： 2013-3-16 : 下午6:00:50
 * @修改人：
 * @日期：
 * @描述： Excel 导出
 * @版本号：
 */
public class ExcelUtil {
	 
	/**
	 * 
	 * @param titles
	 * @param columns
	 * @param data
	 * @param fileName
	 * @param response
	 * @说明 简单的二维表excel导出
	 */
	  private HttpServletResponse res;
	  private HSSFWorkbook workbook;
	 
	
	public ExcelUtil(HSSFWorkbook workbook) {
		this.workbook = workbook;
	}
	public ExcelUtil() {
		this.workbook = workbook;
	}

	public static void ExportExcelSimple(String[] titles, String columns[], Map< CellRangeAddressList,DVConstraint> Boxmap,
		List data, String fileName, HttpServletResponse response) {
      
	   HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet("Sheet1");
		sheet.protectSheet(new String("WRTYUIOPLPMKONJI")); 
		HSSFRow T_row = sheet.createRow(0);
		HSSFCellStyle style = workbook.createCellStyle();
		HSSFCellStyle cellstyle = workbook.createCellStyle();
		for (int i = 0; i < titles.length; i++) {
			HSSFCell titleCell = T_row.createCell(i);
			//style.setDataFormat(HSSFDataFormat.getBuiltinFormat("@"));
			style.setBorderBottom(HSSFCellStyle.BORDER_THIN); // 下边框
			style.setBorderLeft(HSSFCellStyle.BORDER_THIN);// 左边框
			style.setBorderTop(HSSFCellStyle.BORDER_THIN);// 上边框
			style.setBorderRight(HSSFCellStyle.BORDER_THIN);// 右边框
			style.setBottomBorderColor(IndexedColors.BLACK.getIndex());// 黑色
			style.setLeftBorderColor(IndexedColors.BLACK.getIndex());// 黑色
			style.setTopBorderColor(IndexedColors.BLACK.getIndex());// 黑色
			style.setRightBorderColor(IndexedColors.BLACK.getIndex());// 黑色
			style.setWrapText(true);   
			style.setLocked(false);
			style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			HSSFFont font = workbook.createFont();
			font.setFontName("黑体");
			style.setFont(font);
			cellstyle.cloneStyleFrom(style);
			cellstyle.setLocked(true);
			cellstyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("@"));
			titleCell.setCellStyle(cellstyle);
			titleCell.setCellValue(titles[i]);
			int k=0;
			for(String str:titles[i].split(":")){
				if (k++==0){
					titleCell.setCellValue(str);
					}else{
					if (str.endsWith("hidden"))
					sheet.setColumnHidden(i, true);
				}
			}
			
		}

		for (int i = 0; i < data.size(); i++) {
			HSSFRow row = sheet.createRow(i + 1);
			for (int j = 0; j < columns.length; j++) {
				HSSFCell titleCell = row.createCell(j);
				Object obj = data.get(i);
				Class col = data.get(i).getClass();
				String datacol = null;
				Method m;
				String fieldname=null;
				try {
					int key=0;
				 
					for(String str:columns[j].split(":")){
						if(key++==0){
						titleCell.setCellValue(str);
						fieldname=str;
					 	titleCell.setCellStyle(style);
						}else{
							if (str.indexOf("LOCKED")==0){
							 	titleCell.setCellStyle(cellstyle);
							}else{
						 		titleCell.setCellStyle(style);
							}
							   
						}
					}
					
					fieldname = (fieldname.charAt(0) + "").toUpperCase()+fieldname.substring(1);
				 
					m = col.getMethod("get" + fieldname);
					datacol = (String) m.invoke(obj);
				} catch (SecurityException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NoSuchMethodException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				titleCell.setCellValue(datacol);
				sheet.setColumnWidth(j, ("" + datacol).getBytes().length * 250);
				sheet.autoSizeColumn((short) j);
			}

		}
		
		for(Entry e:Boxmap.entrySet()){
			HSSFDataValidation data_validation = new HSSFDataValidation((org.apache.poi.ss.util.CellRangeAddressList) e.getKey(),(DataValidationConstraint) e.getValue());
			   DataValidationConstraint validation = ((DataValidationConstraint) e.getValue());
			if (validation.getValidationType()==DVConstraint.ValidationType.DECIMAL){
				data_validation.createErrorBox("警告", "请录入合法的成绩数值");
			}else{
				data_validation.createErrorBox("警告", "只可录入选项中的数值");
			}
			sheet.addValidationData(data_validation);
			
			//=========================
//	         DVConstraint constraint_0_100 = DVConstraint.createNumericConstraint(  
//	         DVConstraint.ValidationType.DECIMAL,  
//	         DVConstraint.OperatorType.BETWEEN, "1", "100");
			
		}
		try {
			ServletOutputStream outStream = response.getOutputStream();
			String filename = URLEncoder.encode(fileName + ".xls", "UTF-8");
			response.reset();
			response.setHeader("Content-Disposition", "attachment; filename=\""
					+ filename + "\"");
			response.setContentType("application/octet-stream; charset=UTF-8");
			workbook.write(outStream);
			outStream.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}
	public static void ExportExcelSimple(String[] titles, String columns[],  
			List data, String fileName, HttpServletResponse response) {
			HSSFWorkbook workbook = new HSSFWorkbook();
			HSSFSheet sheet = workbook.createSheet("Sheet1");
			HSSFRow T_row = sheet.createRow(0);
			for (int i = 0; i < titles.length; i++) {
				HSSFCell titleCell = T_row.createCell(i);
				HSSFCellStyle style = workbook.createCellStyle();
				style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
				HSSFFont font = workbook.createFont();
				font.setFontName("黑体");
				style.setFont(font);
				titleCell.setCellStyle(style);
				titleCell.setCellValue(titles[i]);
			}

			for (int i = 0; i < data.size(); i++) {
				HSSFRow row = sheet.createRow(i + 1);
				for (int j = 0; j < columns.length; j++) {
					HSSFCell titleCell = row.createCell(j);
					Object obj = data.get(i);
					Class col = data.get(i).getClass();
					String fieldname = (columns[j].charAt(0) + "").toUpperCase()+ columns[j].substring(1);
					String datacol = null;
					Method m;
					try {
						m = col.getMethod("get" + fieldname);
						datacol = (String) m.invoke(obj);
					} catch (SecurityException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (NoSuchMethodException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IllegalArgumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IllegalAccessException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (InvocationTargetException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					titleCell.setCellValue(datacol);
					sheet.setColumnWidth(j, ("" + datacol).getBytes().length * 250);
					sheet.autoSizeColumn((short) j);
				}

			}
			try {
				ServletOutputStream outStream = response.getOutputStream();
				String filename = URLEncoder.encode(fileName + ".xls", "UTF-8");
				response.reset();
				response.setHeader("Content-Disposition", "attachment; filename=\""
						+ filename + "\"");
				response.setContentType("application/octet-stream; charset=UTF-8");
				workbook.write(outStream);
				outStream.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
   
	 
	public ExcelUtil listToExcel(String[] titles, String columns[],  
			 List data ) {
		       Integer[] columnwidth=  new Integer[titles.length];
		        workbook = new HSSFWorkbook();
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
				HSSFSheet sheet = workbook.createSheet("Sheet1");
				int lastrow=sheet.getLastRowNum() ;
				 for(int i=0;i<data.size()+lastrow ;i++){
					HSSFRow rows = sheet.createRow(i);
					 for (int j=0;j<columns.length;j++){
						 rows.createCell(j).setCellValue("");
						 rows.createCell(j).setCellStyle(sheetStyle);
					 }
				 }
			 HSSFRow T_row = sheet.createRow(0);
			 
			 for (int i = 0; i < titles.length; i++) {
				columnwidth[i]=0;
				HSSFCell titleCell = T_row.createCell(i);
				HSSFCellStyle style = workbook.createCellStyle();
				style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
				HSSFFont font = workbook.createFont();
				font.setFontName("黑体");
				style.setFont(font);
				titleCell.setCellStyle(style);
				titleCell.setCellValue(titles[i]);
				titleCell.setCellStyle(sheetStyle);
				 if (stringlength("" + titles[i])>columnwidth[i])
					 columnwidth[i]=stringlength("" + titles[i]);{
				     sheet.setColumnWidth(i, columnwidth[i]);
				     System.out.println(columnwidth[i]+"==============ttttt==============="+titles[i]);
					 }
				 
			}
			for (int i = 0; i < data.size(); i++) {
				HSSFRow row = sheet.createRow(i + 1);
 				for (int j = 0; j < columns.length; j++) {
					HSSFCell titleCell = row.createCell(j);
					Object obj = data.get(i);
					Class col = data.get(i).getClass();
					String fieldname = (columns[j].charAt(0) + "").toUpperCase()+ columns[j].substring(1);
					String datacol = null;
					Method m;
					try {
						m = col.getMethod("get" + fieldname);
						datacol = String.valueOf(m.invoke(obj)==null? "" : m.invoke(obj) );
					} catch (SecurityException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (NoSuchMethodException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IllegalArgumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IllegalAccessException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (InvocationTargetException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					titleCell.setCellValue(datacol);
					titleCell.setCellStyle(sheetStyle);
					 if (stringlength("" + datacol)>columnwidth[j]){
						 System.out.println(columnwidth[j]+"==============ttttt========="+stringlength("" + datacol)+"======"+datacol);
						 columnwidth[j]=stringlength("" + datacol);
				     	 sheet.setColumnWidth(j, columnwidth[j]);
					 }
					 
				}

			}
			 return this;
		}
	
 
	/**
	 * 
	 * @param titles
	 * @param columns
	 * @param data
	 * @param fileName
	 * @param response
	 * @说明 简单的二维表excel导入
	 */
	public void export(HttpServletResponse response ,String fileName){
		
		try {
			ServletOutputStream outStream = response.getOutputStream();
			String filename = URLEncoder.encode(fileName + ".xls", "UTF-8");
			response.reset();
			response.setHeader("Content-Disposition", "attachment; filename=\""
					+ filename + "\"");
			response.setContentType("application/octet-stream; charset=UTF-8");
			workbook.write(outStream);
			outStream.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	@SuppressWarnings("all")
	public static List ImportExcelSimple(String[] titles, String columns[],
		HSSFWorkbook workbook, Class objType) {
		HSSFSheet sheet = workbook.getSheet("Sheet1");
		// 模板表头校验
		HSSFRow titlerow = sheet.getRow(0);
		Map map = new HashMap();
		for (int i = 0; i < columns.length; i++) {
			if (titlerow.getCell(i).getStringCellValue().equals(titles[i]) == false) {
			      
			}
		}
		Iterator<Row> rowIterator = sheet.rowIterator();
		List list=new ArrayList();
		for (Iterator<Row> iterator = rowIterator; iterator.hasNext();) {	 
			Object obj=null;
			try {
				obj = objType.newInstance();
			} catch (InstantiationException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (IllegalAccessException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			Row row = iterator.next();
			for (int i = 0; i < titles.length; i++) {
				String fieldname = (columns[i].charAt(0) + "").toUpperCase() + columns[i].substring(1);
				Method mothod;
				try {
					if (!titles[i].equals("@")){
				    Class[] parameterTypes = new Class[1];  
				    Field field=obj.getClass().getDeclaredField(columns[i]);
				    field.setAccessible(true);
		            parameterTypes[0] =String.class;//field.get(obj).getClass() ;// 返回参数类型  
		            // // field.setAccessible(false);
	                    mothod = objType.getMethod("set" + fieldname, parameterTypes);
	                    if  (null==row.getCell(i))row.createCell(i).setCellValue("") ;
	                if  (row.getCell(i).getCellType()==0) {
	                	mothod.invoke(obj, new Object[] {row.getCell(i).getNumericCellValue()+"" });
	                }else{
	                	mothod.invoke(obj, new Object[] {row.getCell(i).getStringCellValue().toString() });
	                }
					} 
				} catch (SecurityException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NoSuchMethodException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NoSuchFieldException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}  
			}
			 
			list.add(obj);
			 
		}
		return list.subList(1, list.size());
	}
	
	
	@SuppressWarnings("all")
	public   List  ExceltoListSimple(String columns[],HSSFWorkbook workbook, Class objType) throws InstantiationException, IllegalAccessException {
		HSSFSheet sheet = workbook.getSheet("Sheet1");
		// 模板表头校验
		HSSFRow titlerow = sheet.getRow(0);
		Map map = new HashMap();
	 
		Iterator<Row> rowIterator = sheet.rowIterator();
		List list=new ArrayList();
		for (Iterator<Row> iterator = rowIterator; iterator.hasNext();) {
			Object obj = objType.newInstance() ;
			Row row = iterator.next();
			for (int i = 0; i < columns.length; i++) {
				String fieldname = (columns[i].charAt(0) + "").toUpperCase() + columns[i].substring(1);
				Method mothod;
				try {
					if (!columns[i].equals("@")){
				    Class[] parameterTypes = new Class[1];  
				    Field field=obj.getClass().getDeclaredField(columns[i]);
				    field.setAccessible(true);
		            parameterTypes[0] =String.class;//field.get(obj).getClass() ;// 返回参数类型  
		            // // field.setAccessible(false);
	                    mothod = objType.getMethod("set" + fieldname, parameterTypes);
	                    if  (null==row.getCell(i))row.createCell(i).setCellValue("") ;
	                if  (row.getCell(i).getCellType()==0) {
	                	mothod.invoke(obj, new Object[] {row.getCell(i).getNumericCellValue()+"" });
	                }else{
	                	mothod.invoke(obj, new Object[] {row.getCell(i).getStringCellValue().toString() });
	                }
					} 
				} catch (Exception e) {
					// TODO Auto-generated catch block			 
					e.printStackTrace();
				}  
			}
			 
			list.add(obj);
			 
		}
		return list.subList(1, list.size());
	}
  	 
	@SuppressWarnings("all")
	public   List<Map<String,String> >  ExceltoListSimple(Workbook workbook) throws InstantiationException, IllegalAccessException {
		Sheet sheet = workbook.getSheet("Sheet1");
		// 模板表头校验
		Row titlerow = sheet.getRow(0);
		Map map = new HashMap();
	    Row rows = sheet.getRow(0);
		rows.getLastCellNum();
		Iterator<Row> rowIterator = sheet.rowIterator();
		List<Map<String,String> > list=new ArrayList<Map<String,String> >();
		for (Iterator<Row> iterator = rowIterator; iterator.hasNext();) {
			 
			Map m =new HashMap();
			Row row = iterator.next();
			for (int i = 0; i < rows.getLastCellNum(); i++) {
				if(null== row.getCell(i)){
					m.put("COL"+i,"");
				}else{
					m.put("COL"+i,getValue( row.getCell(i)));
				}
			}
			list.add(m);
		}
		return list;
	}
  	 
	  public static void main(String[] args) {  
		           System.out.println("1".getBytes().length);
		           System.out.println("a".getBytes().length);
		           System.out.println("A".getBytes().length);
		           System.out.println("萨".getBytes().length);
		          String str = "adasfAAADFD阿萨德发123";  
		          System.out.println(stringlength( str));
		          int unicodeCount = 0;  
		           int szCount = 0;  
		          int zmCount = 0;  
		        for (int i = 0; i < str.length(); i++) {  
		              char c = str.charAt(i);  
		               if (c >= '0' && c <= '9') {  
		                 szCount++;  
		               }else if((c >= 'a' && c<='z') || (c >= 'A' && c<='Z')){  
		                   zmCount++;  
		              }else{  
		                  unicodeCount++;  
		               }  
		           }  
		           System.out.println(unicodeCount);  
		         System.out.println(szCount);  
		           System.out.println(zmCount);  
		       }  

	private static Integer stringlength(String str){
		          
		        int unicodeCount = 0;  
		         int szCount = 0;  
		         int zmCount = 0;  
		         for (int i = 0; i < str.length(); i++) {  
		             char c = str.charAt(i);  
		            if (c >= '0' && c <= '9') {  
		                 szCount++;  
		             }else if((c >= 'a' && c<='z') || (c >= 'A' && c<='Z')){  
		                 zmCount++;  
		             }else{  
		                 unicodeCount++;  
		             }  
		         }  
		return  unicodeCount*530+szCount*267+zmCount*267;
	}
	@SuppressWarnings("all")
	public   HSSFWorkbook  ExportExcel(String[] titles, String columns[], 
	      List data, String fileName ) {
		  HSSFSheet sheet = workbook.getSheetAt(1);
		  HSSFRow T_row = sheet.createRow(sheet.getLastRowNum() );
		  int columnwidth=0;
		  for (int i = 0; i < titles.length; i++) {
			HSSFCell titleCell = T_row.createCell(i);
			HSSFCellStyle style = workbook.createCellStyle();
			style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			HSSFFont font = workbook.createFont();
			font.setFontName("黑体");
			style.setFont(font);
			titleCell.setCellStyle(style);
			titleCell.setCellValue(titles[i]);
			 if (("" + titles[i]).getBytes().length * 250>columnwidth){
				 columnwidth=("" + titles[i]).getBytes().length * 250;
				 System.out.println(titles[i]+"========="+columnwidth);
			     sheet.setColumnWidth(i, columnwidth);
			 }
		 }
	    int i = sheet.getLastRowNum() ;  
		for (; i < data.size(); i++) {
			HSSFRow row = sheet.createRow(i + 1);
			for (int j = 0; j < columns.length; j++) {
				HSSFCell titleCell = row.createCell(j);
				Object obj = data.get(i);
				Class col = data.get(i).getClass();
				String fieldname = (columns[j].charAt(0) + "").toUpperCase()+ columns[j].substring(1);
				String datacol = null;
				Method m;
				try {
					m = col.getMethod("get" + fieldname);
					datacol = (String)( m.invoke(obj)==null ? "":m.invoke(obj));
				} catch (SecurityException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NoSuchMethodException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				titleCell.setCellValue(datacol);
				 if (("" + datacol).getBytes().length * 250>columnwidth){
					 columnwidth=("" + datacol).getBytes().length * 250;
				     sheet.setColumnWidth(j, columnwidth);
				 }
			//	sheet.autoSizeColumn((short) j);
			}
   
		}
		return workbook;
	}
	
	public static Object getValue(Cell cell){
		 switch (cell.getCellType()) {
		  case HSSFCell.CELL_TYPE_NUMERIC :  //  CELL_TYPE_NUMERIC 数值型
			  return cell.getNumericCellValue() ;
		  case HSSFCell.CELL_TYPE_STRING :  //    CELL_TYPE_STRING 字符串型
			  return  cell.getStringCellValue();
		  case HSSFCell.CELL_TYPE_FORMULA :  // CELL_TYPE_FORMULA 公式型
			  return   cell.getCellFormula().toString() ;
		  case HSSFCell.CELL_TYPE_BLANK  :  //     CELL_TYPE_BLANK 空值
			  return   "" ;
		  case HSSFCell.CELL_TYPE_BOOLEAN  :  //  // CELL_TYPE_BOOLEAN 布尔型
			  return   cell.getBooleanCellValue() ;
		  case HSSFCell.CELL_TYPE_ERROR   :  //    CELL_TYPE_ERROR 错误
			  return   "" ;
		}
		return "类型错误";
	}
	public HttpServletResponse getRes() {
		return res;
	}
	public void setRes(HttpServletResponse res) {
		this.res = res;
	}
	public HSSFWorkbook getWorkbook() {
		return workbook;
	}
	public void setWorkbook(HSSFWorkbook workbook) {
		this.workbook = workbook;
	}
	
	
 

}

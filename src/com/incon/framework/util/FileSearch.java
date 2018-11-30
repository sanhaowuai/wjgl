package com.incon.framework.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

public class FileSearch {

	//读取Word
	public String readDoc(String doc,String sfind) throws Exception {
		// 创建输入流读取doc文件
		FileInputStream in = new FileInputStream(new File(doc));
		WordExtractor extractor = null;
		String text = null;
		// 创建WordExtractor
		extractor = new WordExtractor(in);
		// 对doc文件进行提取
		try{
			text = extractor.getText();
		}catch(Exception e){
			text = "";
		}
		
		if(text.indexOf(sfind)>=0){
			text="Y";
		}else{
			text="N";
		}
		return text;
	}
	//**********读取WordToString**********
	public String readDocToString(String doc) throws Exception {
		// 创建输入流读取doc文件
		FileInputStream in = new FileInputStream(new File(doc));
		WordExtractor extractor = null;
		String text = null;
		// 创建WordExtractor
		extractor = new WordExtractor(in);
		// 对doc文件进行提取
		try{
			text = extractor.getText();
		}catch(Exception e){
			text = "";
		}
		return text;
	}
	
	//读取Excel
	@SuppressWarnings("deprecation")
	public String readXls(String xls,String sfind) throws Exception {
		FileInputStream finput;
		String text="";
		try {
			finput = new FileInputStream(new File(xls));
			// 设定FileINputStream读取Excel档
			POIFSFileSystem fs = new POIFSFileSystem(finput);
			HSSFWorkbook wb = new HSSFWorkbook(fs);
			HSSFSheet sheet = wb.getSheetAt(0);
			// 读取第一个工作表，宣告其为sheet
			finput.close();
			HSSFRow row = null;
			// 宣告一列
			HSSFCell cell = null;
			// 宣告一个储存格
			short i = 0;
			short y = 0;
			String str="";
			
			// 以巢状迴圈读取所有储存格资料
			for (i = 0; i <= sheet.getLastRowNum(); i++) {
				row = sheet.getRow(i);
				for (y = 0; y < row.getLastCellNum(); y++) {
					cell = row.getCell(y);
					str=cell+",";
					if("".equals(cell)||null==cell){
						str=" "+",";
					}
					text+=str;
				}
			}
			if(text.indexOf(sfind)>=0){
				text="Y";
			}else{
				text="N";
			}
		} catch (Exception e) {
			//e.printStackTrace();
		}
		return text;

	}
	//**********读取ExcelToString**********
	@SuppressWarnings("deprecation")
	public String readXlsToString(String xls) throws Exception {
		FileInputStream finput;
		String text = "";
		try {
			finput = new FileInputStream(new File(xls));
			// 设定FileINputStream读取Excel档
			POIFSFileSystem fs = new POIFSFileSystem(finput);
			HSSFWorkbook wb = new HSSFWorkbook(fs);
			HSSFSheet sheet = wb.getSheetAt(0);
			// 读取第一个工作表，宣告其为sheet
			finput.close();
			HSSFRow row = null;
			// 宣告一列
			HSSFCell cell = null;
			// 宣告一个储存格
			short i = 0;
			short y = 0;
			String str = "";

			text += "<table border=1>";
			// 以巢状迴圈读取所有储存格资料
			for (i = 0; i <= sheet.getLastRowNum(); i++) {
				text += "<tr>";
				row = sheet.getRow(i);
				if (row != null) {
					for (y = 0; y < row.getLastCellNum(); y++) {
						cell = row.getCell(y);
						str = cell + " ";
						if ("".equals(cell) || null == cell) {
							str = " ";
						}
						text += "<td>" + str + "</td>";
					}
				}
				text += "</tr>";
			}
			text+="</table>";

		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
		return text;

	}
	
	
	
	//读取txt
	public String readTxt(String txt, String sfind) throws Exception {
		String text="";
		File file = new File(txt);
        try {   

        	//判断txt编码
        	String code="";
            InputStream inputStream=new FileInputStream(file);
            byte []b=new byte[3];
            inputStream.read(b);

            if(b[0] == -17 && b[1] == -69 && b[2] == -65){
            	code="UTF-8";		//utf-8
            }else if (b[0] == -2 && b[1] == -1 && b[2] == 102){
            	code="Unicode";		//unicode big endian
            }else if (b[0] == -1 && b[1] == -2 && b[2] == 104){
            	code="UTF-16";		//unicode
            }else{
            	code="GBK";		//GBK或其它格式
            }
        	
            InputStreamReader isr = new InputStreamReader(new FileInputStream(file),code);
                        
            BufferedReader reader = new BufferedReader(isr);
            String str = reader.readLine();
            while (str != null) {
            	text+="\r\n"+str;
                str = reader.readLine(); 
            }
			if(text.indexOf(sfind)>=0){
				text="Y";
			}else{
				text="N";
			}   
        } catch (FileNotFoundException e) {
            //e.printStackTrace();   
        } catch (IOException e) {   
            //e.printStackTrace();   
        }
		return text;
	}
	//**********读取txtToString**********
	public String readTxtToString(String txt) throws Exception {
		String text="";
        File file = new File(txt);
        try {   
        	
        	//判断txt编码
        	String code="";
            InputStream inputStream=new FileInputStream(file);
            byte []b=new byte[3];
            inputStream.read(b);

            if(b[0] == -17 && b[1] == -69 && b[2] == -65){
            	code="UTF-8";		//utf-8
            }else if (b[0] == -2 && b[1] == -1 && b[2] == 102){
            	code="Unicode";		//unicode big endian
            }else if (b[0] == -1 && b[1] == -2 && b[2] == 104){
            	code="UTF-16";		//unicode
            }else{
            	code="GBK";		//GBK或其它格式
            }
        	
        	//FileReader f_reader = new FileReader(file);   
            InputStreamReader isr = new InputStreamReader(new FileInputStream(file),code);
        	
        	//FileReader f_reader = new FileReader(file);   
            BufferedReader reader = new BufferedReader(isr);   
            String str = reader.readLine();   
            while (str != null) {
            	text+="\r\n"+str;
                str = reader.readLine(); 
            }
            
        } catch (FileNotFoundException e) {
            //e.printStackTrace();   
        } catch (IOException e) {   
            //e.printStackTrace();   
        }
		return text;
	}
	
	public static void main(String args[]) throws Exception{
		FileSearch aaa=new FileSearch();
		//System.out.println("===========================================");
		//System.out.println(aaa.readXlsToString("c:\\aaa.xls"));

		//System.out.println("==============gbk=============================");
		//System.out.println(aaa.readTxtToString("c:\\gbk.txt"));
		//System.out.println("==============utf8=============================");
		//System.out.println(aaa.readTxtToString("c:\\utf8.txt"));
		//System.out.println("==============unicodebigendian=============================");
		//System.out.println(aaa.readTxtToString("c:\\unicodebigendian.txt"));
		//System.out.println("==============unicode=============================");
		//System.out.println(aaa.readTxtToString("c:\\unicode.txt"));
	}
	
}

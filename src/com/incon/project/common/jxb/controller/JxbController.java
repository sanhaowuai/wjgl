package com.incon.project.common.jxb.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
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
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.incon.pojo.common.JxbEntity;
import com.incon.project.common.jxb.page.JxbPage;
import com.incon.project.common.jxb.service.JxbService;

@Controller
@RequestMapping("/jxb")
public class JxbController {
	@Resource(name="jxbService")
	private JxbService jxbService;
	
	/**
	 * 查询教学班
	 * @param model
	 * @param jxbPage
	 * @return
	 */
	@RequestMapping("queryJxb")
	public String queryJxb(Model model,JxbPage jxbPage, String error, String flag){
		try {
			List<JxbEntity> jxbList = jxbService.query(jxbPage);
			model.addAttribute("jxbList", jxbList);
			model.addAttribute("jxbPage", jxbPage);
			

			model.addAttribute("error", error);
			model.addAttribute("flag", flag);
		} catch (Exception e) {
			System.err.println("queryJxb操作失败!!");
			e.printStackTrace();
		}
		return "commons/jxb/jxb";
	}
	/**
	 * 添加教学班
	 * @param jxbEntity
	 * @return
	 */
	@ResponseBody 
	@RequestMapping("addJxb")
	public String addJxb(JxbEntity jxbEntity){
		try {
			jxbService.addJxb(jxbEntity);
		} catch (Exception e) {
			System.err.println("addJxb操作失败!!");
			e.printStackTrace();
		}
		return "1";
	}
	
	/**
	 * 修改教学班
	 * @param jxbEntity
	 * @return
	 */
	@ResponseBody
	@RequestMapping("updJxb")
	public String updJxb(JxbEntity jxbEntity){
		try {
			jxbService.updJxb(jxbEntity);
		} catch (Exception e) {
			System.err.println("updJxb操作失败!!");
			e.printStackTrace();
		}
		return "2";
	}
	
	/**
	 * 根据CMCODE查询教学班
	 * @param CMCODE
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryJxbByCMCODE")
	public JxbEntity queryJxbByCMCODE(String CMCODE){
		JxbEntity jxbEntity = null;
		try {
			jxbEntity = jxbService.queryJxbByCMCODE(CMCODE);
		} catch (Exception e) {
			System.err.println("queryJxbByCMCODE操作失败!!");
			e.printStackTrace();
			}
		return jxbEntity;
	}
	
	
	
	

	/**
	 *     教学班导入
	 * @param model
	 * @param session
	 * @param excel
	 * @param request
	 * @param redirectAttributes
	 * @param jxbPage
	 * @return
	 */
	@RequestMapping(value = "/importJxbList", method = RequestMethod.POST)
    public String importJxbList(Model model, HttpSession session, @RequestParam("excel") MultipartFile excel, HttpServletRequest request,
             RedirectAttributes redirectAttributes) {
		    Map<String,Object> turnMap=new HashMap<String,Object>();
		try {
			    HSSFWorkbook hssfWorkbook = new HSSFWorkbook(excel.getInputStream());
			    //工作表Sheet
			    HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(0); 
			    int rowCount=1;//从第几行开始读数据
			    List<String> errorList=new ArrayList<String>();
			    List<Map<String,String>> list=new ArrayList<Map<String,String>>();
			    System.out.println("roecount="+hssfSheet.getLastRowNum());
			    for(int i=rowCount;i<=hssfSheet.getLastRowNum();i++){
			    	Map<String,String> map=new HashMap<String,String>();
			    	System.out.println(hssfSheet.getRow(i));
			    	if(hssfSheet.getRow(i).getCell((short)0) != null){//班级名称
			    		hssfSheet.getRow(i).getCell((short)0).setCellType(Cell.CELL_TYPE_STRING);
			    		String CMCLASSNAME = hssfSheet.getRow(i).getCell((short)0).getStringCellValue();
			    		map.put("CMCLASSNAME", CMCLASSNAME);
			    	}else{
			    		errorList.add("【第"+(i)+"行】班级名称未填写");
			    	}
			    	
			    	if(hssfSheet.getRow(i).getCell((short)1) != null){//班级人数
			    		hssfSheet.getRow(i).getCell((short)1).setCellType(Cell.CELL_TYPE_STRING);
			    		String CMCLASSPEOPLENUM = hssfSheet.getRow(i).getCell((short)1).getStringCellValue();
			    		map.put("CMCLASSPEOPLENUM", CMCLASSPEOPLENUM);
			    	}
			    	
			    	if(hssfSheet.getRow(i).getCell((short)2) != null){//可用否
			    		hssfSheet.getRow(i).getCell((short)2).setCellType(Cell.CELL_TYPE_STRING);
			    		String CMWHETHERAVAILABLE   = hssfSheet.getRow(i).getCell((short)2).getStringCellValue();
			    		
			    		map.put("CMWHETHERAVAILABLE", CMWHETHERAVAILABLE);
			    	}else{
			    		map.put("CMWHETHERAVAILABLE","1");
			    	}
			    	
			    	list.add(map);
			    }
			    
			    turnMap.put("errorList", errorList);
				if(errorList.size() == 0){
					turnMap.put("listobj", list);
				}
				
			List<String> errorlist=(List<String>) turnMap.get("errorList");
			if(errorlist!=null && errorlist.size()>0){//有错误
				 
			}else{//没错误,存数据库
				List<Map<String,String>>  listObj = (List<Map<String, String>>) turnMap.get("listobj");
				if(listObj != null){
					jxbService.addJxbs(listObj);
					System.out.println("listObj===>"+listObj);
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String listfjjson = turnMap.get("errorList").toString();

        return "forward:/jxb/queryJxb?error="+listfjjson+"&flag=1";
    }

	
	
	/**
	 * 模板下载
	 * @param response
	 */
	@ResponseBody 
    @RequestMapping("exportExcelDemo")
    public void exportExcelDemo(HttpServletResponse response) {
           HSSFWorkbook workbook = new HSSFWorkbook(); //创建Excel
           HSSFSheet sheet = workbook.createSheet("Sheet1");//创建Sheet
           HSSFRow T_row = sheet.createRow(0);//创建一行表头
           T_row.createCell(0, HSSFCell.CELL_TYPE_STRING).setCellValue("班级名称");//设置表头列名
           T_row.createCell(1, HSSFCell.CELL_TYPE_STRING).setCellValue("班级人数");//设置表头列名
           T_row.createCell(2, HSSFCell.CELL_TYPE_STRING).setCellValue("可用否");//设置表头列名
           try {
           String filename = "jxb.xls";  //设置文件名
           //设置文件头
           ServletOutputStream Out = response.getOutputStream(); response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
           //设置字符集
           response.setCharacterEncoding("UTF-8");
           //设置文件类型
           response.setContentType("application/octet-stream; charset=UTF-8");
           //将文件流写入response 流
           workbook.write(Out);
           } catch (IOException e) {
                  e.printStackTrace();
           }
    }
}

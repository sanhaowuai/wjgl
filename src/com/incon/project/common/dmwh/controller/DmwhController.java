package com.incon.project.common.dmwh.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.incon.framework.util.ExcelUtil;
import com.incon.pojo.common.dmwh.Dmwh;
import com.incon.project.common.dmwh.page.DmwhPage;
import com.incon.project.common.dmwh.service.DmwhService;




@RequestMapping("/dmwh")
@Controller
@SuppressWarnings("unchecked")
public class DmwhController {

	@Resource(name = "dmwhService")
	private DmwhService dmwhService;

	//查询用户
	@RequestMapping("queryDmwh")
	public String queryDmwh(Model model, DmwhPage dmwhPage) {
		try{
			List<Map> jcdmlxbs = dmwhService.queryJclxdmb();
			String tabName = dmwhPage.getTabName();
			List<Map<String,String>> tabNameList =(List<Map<String,String>>)dmwhService.queryTabName();
			for(Map<String,String> temp :tabNameList){
				String tempName=(String)temp.get("BM");
				if(tempName!=null &&tempName.equals(tabName)){
					String tabZs=(String)temp.get("BZS");
					dmwhPage.setTabZs(tabZs);
					break;
				}
			}
			
			List< Map< String, String>> tabStrList = dmwhService.queryTabStr(tabName);
			/**
			 * <p>查询表 的约束条件 丁起明 20161207</p> 开始
			 */
			List< Map< String, String>> tabConstraints = dmwhService.queryTabConstraints(tabName);
			model.addAttribute("tabConstraints", tabConstraints);
			/**
			 * <p>查询表 的约束条件 丁起明 20161207</p> 结束
			 */			
			System.out.println("----------------------------"+tabStrList+"----------------------------");
			Map<String,List> glbMap=new HashMap<String, List>();
			for(Map<String,String> tabStr : tabStrList){
				String glfs=tabStr.get("GLFS");
				if("1".equals(glfs)){
					String COLUMN_NAME=tabStr.get("COLUMN_NAME");
					String glbm=tabStr.get("GLBM");
					List<Map> glbDataList=(List<Map>)this.dmwhService.queryListTabName(glbm);
					glbMap.put(COLUMN_NAME,glbDataList);
					System.out.println("----------------------------"+glbDataList+"----------------------------");
				}
			}
			
			dmwhPage.setId(tabStrList.get(0).get("COLUMN_NAME"));
			dmwhPage.setMc(tabStrList.get(1).get("COLUMN_NAME"));
			dmwhPage.setList(tabStrList);
			List<Map<String,String>> datalist = dmwhService.query(dmwhPage);
			model.addAttribute("datalist", datalist);
			model.addAttribute("tabStrList", tabStrList);
			model.addAttribute("tabNameList", tabNameList);
			model.addAttribute("dmwhPage", dmwhPage);
			model.addAttribute("dmwhService",dmwhService);
			model.addAttribute("glbMap",glbMap);	
			model.addAttribute("jcdmlxbs",jcdmlxbs);	
		}catch(Exception e){
			e.printStackTrace();			
		}

		return "/commons/dmwh/dmwhList";
	}
	//导出
	@ResponseBody //设置以文件流方式返回页面
	@RequestMapping("exportDmwhPage")
	public void exportDmwhPage(Model model, DmwhPage dmwhPage,HttpServletResponse response) throws IOException {

			List<Map> jcdmlxbs = dmwhService.queryJclxdmb();
			String tabName = dmwhPage.getTabName();
			List<Map<String,String>> tabNameList =(List<Map<String,String>>)dmwhService.queryTabName();
			for(Map<String,String> temp :tabNameList){
				String tempName=(String)temp.get("BM");
				if(tempName!=null &&tempName.equals(tabName)){
					String tabZs=(String)temp.get("BZS");
					dmwhPage.setTabZs(tabZs);
					break;
				}
			}
			
			List< Map< String, String>> tabStrList = dmwhService.queryTabStr(tabName);
			/**
			 * <p>查询表 的约束条件 丁起明 20161207</p> 开始
			 */
			List< Map< String, String>> tabConstraints = dmwhService.queryTabConstraints(tabName);
			model.addAttribute("tabConstraints", tabConstraints);
			/**
			 * <p>查询表 的约束条件 丁起明 20161207</p> 结束
			 */			
			System.out.println("----------------------------"+tabStrList+"----------------------------");
			Map<String,List> glbMap=new HashMap<String, List>();
			for(Map<String,String> tabStr : tabStrList){
				String glfs=tabStr.get("GLFS");
				if("1".equals(glfs)){
					String COLUMN_NAME=tabStr.get("COLUMN_NAME");
					String glbm=tabStr.get("GLBM");
					List<Map> glbDataList=(List<Map>)this.dmwhService.queryListTabName(glbm);
					glbMap.put(COLUMN_NAME,glbDataList);
					System.out.println("----------------------------"+glbDataList+"----------------------------");
				}
			}
			
			dmwhPage.setId(tabStrList.get(0).get("COLUMN_NAME"));
			dmwhPage.setMc(tabStrList.get(1).get("COLUMN_NAME"));
			dmwhPage.setList(tabStrList);
			List<Map<String,String>> datalist = dmwhService.queryDmwhNotPage(dmwhPage);
			
			
			
			model.addAttribute("datalist", datalist);
			model.addAttribute("tabStrList", tabStrList);
			model.addAttribute("tabNameList", tabNameList);
			model.addAttribute("dmwhPage", dmwhPage);
			model.addAttribute("dmwhService",dmwhService);
			model.addAttribute("glbMap",glbMap);	
			model.addAttribute("jcdmlxbs",jcdmlxbs);	
			
			HSSFWorkbook workbook = new HSSFWorkbook(); //创建Excel
			HSSFSheet sheet = workbook.createSheet("Sheet1");//创建Sheet
			HSSFRow T_row = sheet.createRow(0);//创建一行表头
		 

			int _t_index = 0;
			for(Map< String, String> t: tabStrList ){
					T_row.createCell(_t_index, HSSFCell.CELL_TYPE_STRING).setCellValue((t.get("COMMENTS")==null?"":t.get("COMMENTS")+""));//设置表头列名
					_t_index++;

			}
			int i=1;
			for(Map< String, String> map: datalist ){
				_t_index = 0;
				HSSFRow row = sheet.createRow(i);  //创建一行Excel
				for(Map< String, String> t: tabStrList ){
						String _t = (t.get("COLUMN_NAME")==null?"":t.get("COLUMN_NAME")+"");
						String _v = (map.get(_t)==null?"":map.get(_t)+"");
						row.createCell(_t_index, HSSFCell.CELL_TYPE_STRING).setCellValue(_v);//向Excel中第 i 行第 0 列赋值
						_t_index++;
				}
				i++;
			}
			
			String filename = dmwhPage.getTabName()+".xls";  //设置文件名
			ServletOutputStream Out = response.getOutputStream();
			response.setHeader("Content-Disposition","attachment;filename=" +  new String(filename.getBytes(),"iso-8859-1"));  
			//设置字符集
			response.setCharacterEncoding("UTF-8");
			//设置文件类型
			response.setContentType("application/octet-stream; charset=UTF-8");
			//将文件流写入response 流
			workbook.write(Out);
	}	
	@RequestMapping("importDmwhPage")
	public String importDmwhPage(Model model, DmwhPage dmwhPage) {
		try{
			List<Map> jcdmlxbs = dmwhService.queryJclxdmb();
			String tabName = dmwhPage.getTabName();
			List<Map<String,String>> tabNameList =(List<Map<String,String>>)dmwhService.queryTabName();
			for(Map<String,String> temp :tabNameList){
				String tempName=(String)temp.get("BM");
				if(tempName!=null &&tempName.equals(tabName)){
					String tabZs=(String)temp.get("BZS");
					dmwhPage.setTabZs(tabZs);
					break;
				}
			}
			
			List< Map< String, String>> tabStrList = dmwhService.queryTabStr(tabName);
			System.out.println("----------------------------"+tabStrList+"----------------------------");
			Map<String,List> glbMap=new HashMap<String, List>();
			for(Map<String,String> tabStr : tabStrList){
				String glfs=tabStr.get("GLFS");
				if("1".equals(glfs)){
					String COLUMN_NAME=tabStr.get("COLUMN_NAME");
					String glbm=tabStr.get("GLBM");
					List<Map> glbDataList=(List<Map>)this.dmwhService.queryListTabName(glbm);
					glbMap.put(COLUMN_NAME,glbDataList);
					System.out.println("----------------------------"+glbDataList+"----------------------------");
				}
			}
			
			dmwhPage.setId(tabStrList.get(0).get("COLUMN_NAME"));
			dmwhPage.setMc(tabStrList.get(1).get("COLUMN_NAME"));
			dmwhPage.setList(tabStrList);
			List<Map<String,String>> datalist = dmwhService.query(dmwhPage);
			model.addAttribute("datalist", datalist);
			model.addAttribute("tabStrList", tabStrList);
			model.addAttribute("tabNameList", tabNameList);
			model.addAttribute("dmwhPage", dmwhPage);
			model.addAttribute("dmwhService",dmwhService);
			model.addAttribute("glbMap",glbMap);	
			model.addAttribute("jcdmlxbs",jcdmlxbs);	
		}catch(Exception e){
			e.printStackTrace();			
		}

		return "/commons/dmwh/importDmwh";
	}
	// 根据主键查询一条记录
	@ResponseBody
	@RequestMapping("queryByID")
	public 	Map queryDmwhById(String tabName,String id,String zhi) {
		
		Map<String,String> map = null;
		try{
			List<Map<String,String>> tabStrList = dmwhService.queryTabStr(tabName);
			map = dmwhService.queryByID( tabName, id, zhi, tabStrList);
		}catch(Exception e){
			System.out.println(e);
		}
		return map;
	}
	
	// 重复判断
	@ResponseBody
	@RequestMapping("repeatJudg")
	public Map repeatJudg(String tabName,String id,String mc,String zhi){
		Map<String,Integer> result=new HashMap<String, Integer>();
		Map<String,String> map=new HashMap<String, String>();
		map.put("tabName", tabName);
		map.put("idVal", zhi);
		map.put("id", id);
		map.put("IDCOUNT", dmwhService.repeatJudg(map) + "") ;
		int count=dmwhService.repeatJudg(map);
		result.put("count",count);
		return result; 
	}
	
	
	/**
	 * 向代码维护表中添加新的可维护表时判断新添加的表在系统中是否存在
	 * @param tabName
	 * @param id
	 * @param mc
	 * @param zhi
	 * @return
	 */
	@ResponseBody
	@RequestMapping("existTable")
	public Map existTable(String tabName){
		Map<String,String> result=new HashMap<String, String>();
		int count=(Integer)dmwhService.queryForObject("dmwh.existTable",tabName);
		result.put("count",Integer.toString(count));
		System.out.println("msg"+"数据库系统中没有名为"+tabName+"的表");
		if(count<=0) {
			result.put("msg","数据库系统中没有名为"+tabName+"的表");
		}
		System.out.println("--------------------------------"+result+"--------------------------------");
		return result;
	}	
	
	
	
	// 添加
	@ResponseBody
	@RequestMapping("addDmwh")
	public void addDmwh(HttpSession session,Dmwh dmwh,String tabName){
		System.out.println("--------------------------------"+dmwh.getVal()+"--------------------------------");
		System.out.println("--------------------------------"+tabName+"--------------------------------");
		Map<String,String> paramsMap=dmwh.getVal();
	   dmwhService.addDmwh(paramsMap, tabName);
	}

	 // 删除
	@ResponseBody
	@RequestMapping("deleteDmwh")
	public void deleteDmwh(String tabName,String id,String[] ids) {
		dmwhService.deleteDmwh(tabName, id, ids);
	}
	
	
	// 修改
	@ResponseBody
	@RequestMapping("updateDmwh")
	public void updateDmwh(String tabName,String id,String zhi,Dmwh dmwh){
		Map<String,String> paramsMap=dmwh.getVal();
	    dmwhService.updateDmwh(paramsMap, tabName, id, zhi);
	}
	
	// 导入
	@ResponseBody
	@RequestMapping("importDmwh")
	public Map importDmwh(HttpSession session,@RequestBody Map <String ,Object>   items  ){
	//	System.out.println(items);
		List<Map<String,String>> columns=(List<Map<String,String>>) items.get("columns");
		List<HashMap<String,String>> datas=(List<HashMap<String,String>>)items.get("datas");
		  
		List<Map<String,String>>  savedatalist=new ArrayList<Map<String,String>>();
	 
	    for(int i = 1;i<datas.size();i++){
	    	Map map =new HashMap();
		    
			for(    Map<String, String> m:columns ){
		    	map.put(m.get("name"), datas.get(i).get(m.get("value")));
		    }
		    savedatalist.add(map);
	    }    ;
 
 		dmwhService.importDmwh(savedatalist, items.get("tablename")+"");
 		Map m=new HashMap();
 		m.put("SUCCESS", "true");
 	    return m;
	}

	// 根据表名查询List
	@RequestMapping("queryListTabName")
  	public List<Dmwh> queryListTabName(String tableName){
		return null;
  	}
        @ResponseBody
	    @RequestMapping("excelupload")  
	    public List<Map<String,String>> upload(@RequestParam(value = "file", required = false) MultipartFile file, String name ,HttpServletRequest request, ModelMap model) {  
	  
	        System.out.println("开始");  
	        String path = request.getSession().getServletContext().getRealPath("upload");  
	        String fileName = file.getOriginalFilename();  
	        File targetFile = new File(path, fileName);  
	        if(!targetFile.exists()){  
	            targetFile.mkdirs();  
	        }  
	        model.addAttribute("fileUrl", request.getContextPath()+"/upload/"+fileName);  
	        ExcelUtil  exceutil =new ExcelUtil();
	        
			Workbook  workbook = null;
		
			try {
				if (file.getOriginalFilename().endsWith(".xls")){
					
					workbook = new HSSFWorkbook(file.getInputStream());
				}else if (file.getOriginalFilename().endsWith(".xlsx")){
				    workbook = new XSSFWorkbook( file.getInputStream() );
					 
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}    
			  
			try {
				System.out.println("========================excel-----------file============================");
				List<Map<String,String>> list=exceutil.ExceltoListSimple(workbook);
				System.out.println(list);
				return	list;
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        return null;  
	    }  
	  
}
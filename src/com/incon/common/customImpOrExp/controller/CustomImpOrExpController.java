package com.incon.common.customImpOrExp.controller;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import com.incon.common.consumerExp.controller.ObjectExcelViewNew;
import com.incon.common.consumerExp.page.PageData;
import com.incon.common.consumerExp.service.ConsumerExpService;
import com.incon.common.customImpOrExp.page.CustomImpOrExpEntity;
import com.incon.common.customImpOrExp.page.CustomImpOrExpPage;
import com.incon.common.customImpOrExp.page.ImpColCheckEntity;
import com.incon.common.customImpOrExp.page.ImpColEntity;
import com.incon.common.customImpOrExp.page.JsEntity;
import com.incon.common.customImpOrExp.page.TabColumnsEntity;
import com.incon.common.customImpOrExp.service.CustomImpOrExpService;
import com.incon.framework.interseptor.WebConstants;
import com.incon.framework.util.FileDownload;
import com.incon.framework.util.FileUpload;
import com.incon.framework.util.ObjectExcelRead;
import com.incon.framework.util.PathUtil;
import com.incon.framework.util.TimeStampKey;
import com.incon.pojo.common.UserEntity;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/customImpOrExp")
@SuppressWarnings("all")
public class CustomImpOrExpController {
	
	@Resource(name="customImpOrExpService")
	private CustomImpOrExpService customImpOrExpService;
	
	@RequestMapping("/queryCustomImpOrExp")
	public String  queryCustomImpOrExp(HttpServletRequest request,HttpSession session,Model model,CustomImpOrExpPage customImpOrExpPage){
		try{
	//		List<JsEntity> jsList = customImpOrExpService.queryJsList();
			List<CustomImpOrExpEntity> customImpOrExpList = customImpOrExpService.query(customImpOrExpPage); 
	//		if(customImpOrExpList !=null && customImpOrExpList.size()>0){
	//			for(CustomImpOrExpEntity customImpOrExp : customImpOrExpList){
	//				List<JsEntity> newJsList = new ArrayList<JsEntity>();
	//				String roleid= customImpOrExp.getRoleid();
	//				String[] role = roleid.split(",");
	//				for(int i=0;i<role.length;i++){
	//					JsEntity js = customImpOrExpService.queryJsEntity(role[i]);
	//					newJsList.add(js);
	//				}
	//				customImpOrExp.setJs(newJsList);
	//				
	//			}
	//			
	//		}
	//		model.addAttribute("jsList", jsList);
			
			model.addAttribute("customImpOrExpList", customImpOrExpList);
			model.addAttribute("customImpOrExpPage", customImpOrExpPage);
			return "commons/customImpOrExp/customImpOrExpList";
		}catch (Exception e) {
			e.printStackTrace();
			return "error/klerror";
		}
	}
	
	
	@RequestMapping("/queryCustomImpOrExpByjs")
	public String  queryCustomImpOrExpByjs(HttpServletRequest request,HttpSession session,Model model,CustomImpOrExpPage customImpOrExpPage,String yzkl){
		try{
			String referer = request.getHeader("Referer"); // REFRESH
			UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
//			String jsdm = userEntity.getJsdm()+"";
//			customImpOrExpPage.setRoleid(jsdm);
//			List<JsEntity> jsList = customImpOrExpService.queryJsList();
			List<CustomImpOrExpEntity> customImpOrExpList = customImpOrExpService.query(customImpOrExpPage); 
//			if(customImpOrExpList !=null && customImpOrExpList.size()>0){
//				for(CustomImpOrExpEntity customImpOrExp : customImpOrExpList){
//					List<JsEntity> newJsList = new ArrayList<JsEntity>();
//					String roleid= customImpOrExp.getRoleid();
//					String[] role = roleid.split(",");
//					for(int i=0;i<role.length;i++){
//						JsEntity js = customImpOrExpService.queryJsEntity(role[i]);
//						newJsList.add(js);
//					}
//					customImpOrExp.setJs(newJsList);
//					
//				}
//				
//			}
//			model.addAttribute("jsList", jsList);
			model.addAttribute("customImpOrExpList", customImpOrExpList);
			model.addAttribute("customImpOrExpPage", customImpOrExpPage);
			//判断验证口令是否为true(本系统不做判断，其他系统判断)
			if(null!=referer && !(referer.indexOf("incon") > -1)){
				String sfkfw = TimeStampKey.decrypt(yzkl);
				if("true".equals(sfkfw)){
					return "commons/customImpOrExp/customImpOrExpByJsList";
				}else{
					return "error/klerror";
				}
			}else{
				return "commons/customImpOrExp/customImpOrExpByJsList";
			}
		}catch (Exception e) {
			e.printStackTrace();
			return "error/klerror";
		}
	}
	
	
	@RequestMapping("/saveMbxx")
	@ResponseBody
	public int saveMbxx(String[] curjsdm,CustomImpOrExpEntity customImpOrExp){
		//去除角色功能
//		String roleid= "";
		int rel=0;
//		for(int i=0;i<curjsdm.length;i++){
//			if(i==curjsdm.length-1){
//				roleid= roleid+curjsdm[i];
//			}else{
//				roleid= roleid+curjsdm[i]+",";
//			}
//		}
//		customImpOrExp.setRoleid(roleid);
		String curtablename = customImpOrExp.getTablename();
		customImpOrExp.setTablename(curtablename.toUpperCase());
		rel = customImpOrExpService.saveMbxx(customImpOrExp);
		return rel;
	}
	
	@RequestMapping("/customImpOrExpMbwh")
	public String  customImpOrExpMbwh(HttpSession session,Model model,String id){
		//去除显示角色功能
//		List<JsEntity> jsList = customImpOrExpService.queryJsList();
		List<TabColumnsEntity> tabColumns = new ArrayList<TabColumnsEntity>();
		CustomImpOrExpEntity customImpOrExp = customImpOrExpService.queryMbxxById(id);
		//获取imptype(如果imptype为修改则必须选择主键)添加选择主键标识'0'为添加,'1'为修改
		String xzzjbs = "0";
		if("修改".equals(customImpOrExp.getImptype())){
			xzzjbs = "1";
		}
		String tablename = customImpOrExp.getTablename();
		if(customImpOrExp !=null){
			tabColumns = customImpOrExpService.queryTabColumnsByTabName(tablename);
//			String roleid= customImpOrExp.getRoleid();
//			String[] role = roleid.split(",");
//			for(JsEntity jsEntity :jsList){
//				for(int i=0;i<role.length;i++){
//					if(jsEntity.getJsdm().equals(role[i])){
//						jsEntity.setSfxz("1");
//					}
//					
//				}
//			}
			
		}
//		List<ImpColEntity> impColList = customImpOrExpService.queryImpColList(id);
		List<ImpColEntity> impColList = customImpOrExpService.queryCurImpColList(tablename,id);
		//数据库字段类型如果不为varchar2，number，date，手动设置默认为varchar2
		for(ImpColEntity im :impColList){
			String dataType = im.getColumn_lx(); 
			dataType = dataType.toLowerCase();
			if(!(("varchar2".equals(dataType) || "number".equals(dataType)) || "date".equals(dataType))){
				im.setColumn_lx("varchar2");
			}else{
				im.setColumn_lx(dataType);
			}
		}
		
		List<ImpColCheckEntity> impColCheckList = customImpOrExpService.queryImpColCheckList();
		model.addAttribute("id", id);
		model.addAttribute("impColList", impColList);
		model.addAttribute("tabColumns", tabColumns);
		model.addAttribute("impColCheckList",impColCheckList);
//		model.addAttribute("jsList", jsList);
		model.addAttribute("customImpOrExp", customImpOrExp);
		model.addAttribute("xzzjbs", xzzjbs);
		return "commons/customImpOrExp/customImpOrExpMbwh";
	}
	
	
	@ResponseBody
	@RequestMapping("addrows")
	public void addrows(PrintWriter out,Model model,String id){
		CustomImpOrExpEntity customImpOrExp = customImpOrExpService.queryMbxxById(id);
		List<TabColumnsEntity> tabColumns = new ArrayList<TabColumnsEntity>();
		if(customImpOrExp !=null){
			String tablename = customImpOrExp.getTablename();
			tabColumns = customImpOrExpService.queryTabColumnsByTabName(tablename);
		}
		String json = JSONArray.fromObject(tabColumns).toString();
		out.write(json);
		
	}
	
	//添加新字段
	@RequestMapping("/queryTjzdList")
	public String  queryTjzdList(HttpSession session,Model model,String id,String columnenVal){
		CustomImpOrExpEntity customImpOrExp = customImpOrExpService.queryMbxxById(id);
		String tablename = customImpOrExp.getTablename();
		//拼接字段字符串
		String zdStr="";
		if(!"".equals(columnenVal)&& null!=columnenVal){
			String colStr[] = columnenVal.split(",");
		    if(null!=colStr && colStr.length>0){
		    	for(int j=0;j<colStr.length;j++){
		    		if(j!=colStr.length-1){
		    			zdStr = zdStr+"'"+colStr[j]+"'"+",";
		    		}else{
		    			zdStr = zdStr+"'"+colStr[j]+"'";
		    		}	
		    	}
		    }	
		
		}
		List<ImpColEntity> impColList = new ArrayList<ImpColEntity>();
		if(!"".equals(zdStr)){
			Map map = new HashMap();
			map.put("tableName", tablename);
			map.put("zdStr", zdStr);
			impColList = customImpOrExpService.queryTabColsByTabName(map);
		}
		model.addAttribute("impColList", impColList);
		return "commons/customImpOrExp/queryTjzdList";
	}
	
	
	
	@ResponseBody
	@RequestMapping("queryDmbmc")
	public void queryDmbmc(PrintWriter out,Model model,String id){
		List<ImpColCheckEntity> impColCheckList = customImpOrExpService.queryImpColCheckList();
		String json = JSONArray.fromObject(impColCheckList).toString();
		out.write(json);
	}
	//校验序列值是否存在库中
	@RequestMapping("querySfczxl")
	@ResponseBody
	public String  querySfczxl(HttpSession session,Model model,String xlmcVal){
		String result="1";
		xlmcVal = xlmcVal.toUpperCase();
		try{
			result = (String) customImpOrExpService.queryForObject("customImpOrExp.querySfczxl", xlmcVal);
		}catch (Exception e) {
			result="0";
			e.printStackTrace();
		
		}
		return result;
	}
	
	@RequestMapping("/saveImpCol")
	@ResponseBody
	public int saveImpCol(String curid,String[] column_cd,String[] column_lx,String[] column_en,String[] column_zh,String[] dmbmc,String impColMesg,String[] curjsdm,String curywmc,String curimptype){
		String roleid ="";
//		for(int i=0;i<curjsdm.length;i++){
//			if(i==curjsdm.length-1){
//				roleid = roleid+curjsdm[i];
//			}else{
//				roleid = roleid+curjsdm[i]+",";
//			}
//			
//		}
		int rel =0;
		Map map = new HashMap();
		map.put("id", curid);
		map.put("ywmc", curywmc);
//		map.put("roleid", roleid);
		map.put("imptype", curimptype);
		rel = customImpOrExpService.saveImpcol(map,column_en,column_zh,column_cd,column_lx,impColMesg,dmbmc);
		return rel;
	}
	
	@RequestMapping("/customImpOrExpZdydr")
	public String customImpOrExpZdydr(HttpSession session,HttpServletRequest request,Model model,String id,String sfimpfile){
		session.removeAttribute("btList");
		session.removeAttribute("sjList");
		session.removeAttribute("errorTipsMap");
		session.removeAttribute("errorListMap");
		
		//如果选择了导入文件
		if(sfimpfile!=null && "1".equals(sfimpfile)){
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			MultipartFile excel = multipartRequest.getFile("excel");
			String readExcelTag = "false";	//读取excel文件状态
			try {
				//表头List
				List<String> btList = new ArrayList<String>();
				//数据List
				List<List<String>> sjList = new ArrayList<List<String>>();
				
				HSSFWorkbook workbook = new HSSFWorkbook(excel.getInputStream());	//将获取的流转成Excel
				HSSFSheet sheet = workbook.getSheet("Sheet1"); //获取Sheet
				
				if(sheet!=null){
					int rowNum = sheet.getLastRowNum() + 1; //取得最后一行的行号
					
					for (int i = 0; i < rowNum; i++) {	//行循环开始
						Row row = sheet.getRow(i);	//行
						int cellNum = row.getLastCellNum(); //每行的最后一个单元格位置
						if(i==0){
							//获取一行数据(列头),把数据封装到btList
							for (int j = 0; j < cellNum; j++) {	//列循环开始
								btList.add((row.getCell(j)== null || "".equals(row.getCell(j))) ? "列头"+j : this.zhCellValue(row.getCell(j)));
							}
						}else{
							//把每行的数据封装到sjrowList
							List<String> sjrowList = new ArrayList<String>();
							for (int j = 0; j < btList.size(); j++) {	//列循环开始
								sjrowList.add(row.getCell(j)== null ? "" : this.zhCellValue(row.getCell(j)));
							}
							
							//把sjrowList封装到sjList
							sjList.add(sjrowList);
						}
					}
					
					model.addAttribute("btList", btList);
					model.addAttribute("sjList", sjList);
					session.setAttribute("btList", btList);
					session.setAttribute("sjList", sjList);
					readExcelTag = "true";
				}
				
			} catch (Exception e) {
				readExcelTag = "false";
				e.printStackTrace();
			}
			
			model.addAttribute("readExcelTag", readExcelTag);
		}
		
		HashMap<String, String> cxMap = new HashMap<String, String>();
		cxMap.put("id", id);
		cxMap.put("sfxlzj", "0");
		List<ImpColEntity> impColEntitys = customImpOrExpService.queryImpColById(cxMap); 
		
		model.addAttribute("id", id);
		model.addAttribute("impColEntitys", impColEntitys);
		
		return "commons/customImpOrExp/customImpOrExpZdydr";
	}
	
	@ResponseBody
	@RequestMapping("saveImport")
	public HashMap<String, String> saveImport(HttpSession session,String[] columnIndex,String id){
		session.removeAttribute("errorTipsMap");
		session.removeAttribute("errorListMap");
		//提示Map
		HashMap<String, String> imptips = new HashMap<String, String>();
		//字段和表头的对应关系Map
		HashMap<String, Integer> columnMap = new HashMap<String, Integer>();
		//错误提示Map
		HashMap<String, String> errorTipsMap = new HashMap<String, String>();
		//错误数据ListMap
		HashMap<String, List<String>> errorListMap = new HashMap<String, List<String>>();
		
		try {
			//表头List
			List<String> btList = (List<String>) session.getAttribute("btList");
			//数据List
			List<List<String>> sjList = (List<List<String>>) session.getAttribute("sjList");
			
			int okDataSize = 0;	//导入成功条数
			
			String saveSql="";
			String saveValSql ="";
			String updateSql ="";
			String updateZjCxSql="";
			String zjorgxzt = "0";//默认Excel导入为增加操作
			//查询出自定义导入模板设置
			CustomImpOrExpEntity customImpOrExp = customImpOrExpService.queryMbxxById(id);
			String tableName = customImpOrExp.getTablename();//拼接tableName
			String impType = customImpOrExp.getImptype();//操作类型(增加or更新)
			
			if("修改".equals(impType)){
				zjorgxzt="1";
			}
			
			//根据id查询模板维护的所有主键,进行拼接sql
			List<ImpColEntity> impColEntitys = customImpOrExpService.queryImpZjColList(id);
			for(int i=0;i<impColEntitys.size();i++){
				String sfxlzj = impColEntitys.get(i).getSfxlzj();
				if("1".equals(sfxlzj)){
					saveSql = saveSql+impColEntitys.get(i).getColumn_en()+","; 
					saveValSql = saveValSql+impColEntitys.get(i).getXlmc()+".nextval"+","; 
				}
			}
			
			//字段和表头的对应关系封装,字段拼接sql
			for(int i=0;i<columnIndex.length;i++){
				if(columnIndex[i]!=null && !"".equals(columnIndex[i])){
					String column = columnIndex[i].split("\\!\\@\\#")[0];//字段名
					int index = Integer.valueOf(columnIndex[i].split("\\!\\@\\#")[1]);//对应列名索引
					String sfzj = columnIndex[i].split("\\!\\@\\#")[2];//是否主键
					//字段和表头的对应关系封装
					columnMap.put(column, index);
					
					//通过字段名拼接sql
					if("0".equals(zjorgxzt)){
						//添加sql拼接
						if(i!=columnIndex.length-1){
							saveSql = saveSql + column + ",";
						}else{
							saveSql = saveSql + column; 
						}
					}else{
						//修改sql拼接
						if("1".equals(sfzj)){
							//通过字段名拼接sql
							if(i!=columnIndex.length-1){
								updateZjCxSql = updateZjCxSql + column+"|";
							}else{
								updateZjCxSql = updateZjCxSql + column; 
							}
						}else{
							//通过字段名拼接sql
							if(i!=columnIndex.length-1){
								updateSql = updateSql + column+"|";
							}else{
								updateSql = updateSql + column; 
							}
						}
					}
				}
			}
			
			//循环数据list,判断并保存到数据库
			for(int i=0;i<sjList.size();i++){
				String lsSaveVal="";//添加拼接数据sql
				String updateValSql = "";//修改拼接数据sql
				String updateZjCxValSql = "";//修改主键查询sql
				List<String> sj = sjList.get(i);//取出每一条数据
				boolean bterror = false;	//必填错误
				try {
					//错误校验提示Map
					for(int j=0;j<columnIndex.length;j++){
						if(columnIndex[j]!=null && !"".equals(columnIndex[j])){
							String column = columnIndex[j].split("\\!\\@\\#")[0];//字段名
							int index = Integer.valueOf(columnIndex[j].split("\\!\\@\\#")[1]);//对应列名索引
							String sfzj = columnIndex[j].split("\\!\\@\\#")[2];//是否主键
							String sfxlzj = columnIndex[j].split("\\!\\@\\#")[3];//是否序列增加
							String xlmc = columnIndex[j].split("\\!\\@\\#")[4]==null?"":columnIndex[j].split("\\!\\@\\#")[4];//序列名称
							String dmbmc = columnIndex[j].split("\\!\\@\\#")[5]==null?"":columnIndex[j].split("\\!\\@\\#")[5];//代码表名称
							String datelength = columnIndex[j].split("\\!\\@\\#")[6]==null?"":columnIndex[j].split("\\!\\@\\#")[6];//字段长度
							String dateType = columnIndex[j].split("\\!\\@\\#")[7]==null?"":columnIndex[j].split("\\!\\@\\#")[7];//字段类型
							
							//单元格值
							String sjValue = sj.get(index)==null?"":sj.get(index);
							
							//主键判断
							if("1".equals(sfzj)){
								if(sj.get(index)==null || "".equals(sj.get(index))){
									errorTipsMap.put(i+"", btList.get(index)+"列对应了主键，值不能为空。");
									bterror = true;
									break;
								}
							}
							
							//代码表判断
							if(!"".equals(dmbmc) && !"".equals(sjValue)){
								//获取chk代码表中字段与字段名
								ImpColCheckEntity impColChk = customImpOrExpService.queryImpChkBytblName(dmbmc);
								String dm = impColChk.getDm();//代码表中字段名
								String mc = impColChk.getMc();//代码表中字段名称
								//获取对应代码
								String dmbdm = customImpOrExpService.querydmbfhz(dmbmc,dm,mc,sjValue);
								if(dmbdm==null || "".equals(dmbdm)){
									errorTipsMap.put(i+"", btList.get(index)+"列对应的代码表："+dmbmc+"中没有对应代码。");
									bterror = true;
									break;
								}else{
									//设置为转换后的代码
									sjValue = dmbdm; 
								}
							}
							

							//判断字段类型及字段长度
							if("number".equals(dateType)){
								int curdatelength = Integer.parseInt(datelength);
								Pattern p = Pattern.compile("^[1-9]*[1-9][0-9]*$");
								Matcher m = p.matcher(sjValue);
								boolean r = m.matches();
								if(!r){
							    	errorTipsMap.put(i+"", btList.get(index)+"列值应为数字。");
									bterror = true;
									break;
								}else{
									int numlength = sjValue.length();
									if(numlength>curdatelength){
								    	errorTipsMap.put(i+"", btList.get(index)+"列值长度过长，应不超过"+curdatelength+"位数字。");
										bterror = true;
										break;
									}
								}
							}else if("date".equals(dateType)){
								if(!isValidDate(sjValue)){
							    	errorTipsMap.put(i+"", btList.get(index)+"列值不是合法的日期类型。");
									bterror = true;
									break;
								}else{
									if(isValidDategs1(sjValue)){
										sjValue = "to_date('"+sjValue+"','yyyymmdd')";
									}else if(isValidDategs2(sjValue)){
										sjValue = "to_date('"+sjValue+"','yyyy-mm-dd')";
									}else if(isValidDategs3(sjValue)){
										sjValue = "to_date('"+sjValue+"','yyyy-mm-dd hh24:mi:ss')";
									}
								}
							}else{
								 //判断varchar2长度
								 int curdatelength = Integer.parseInt(datelength);
								 String regEx = "[\u4e00-\u9fa5]";
								 Pattern p = Pattern.compile(regEx);
						         int num = 0;//汉字长度
						         int qtnum =0;//其他字符
						         for(int k=0;k<sjValue.length();k++){
						            if(p.matches(regEx, sjValue.substring(k, k + 1))){
						                num++;
						            }else{
						            	qtnum++;
						            }
						        }
						        int totalLeng = num*2+qtnum; 
						        if(totalLeng > curdatelength){
						        	errorTipsMap.put(i+"", btList.get(index)+"列值长度已超过数据库字段长度："+curdatelength+"。");
									bterror = true;
									break;
						        }
							}
							
							if(j!=columnIndex.length-1){
								//添加数据sql拼接
								if(j==0){
									if("date".equals(dateType)){
										lsSaveVal = saveValSql + sjValue + ",";	
									}else{
										lsSaveVal = saveValSql+"'" + sjValue + "'" + ","; 	
									}
								
								}else{
									if("date".equals(dateType)){
										lsSaveVal = lsSaveVal + sjValue + ",";
									}else{
										lsSaveVal = lsSaveVal+"'" + sjValue + "'" + ",";
									}
								}
								
								//修改数据sql拼接
								if("1".equals(sfzj)){
									if("date".equals(dateType)){
										updateZjCxValSql = updateZjCxValSql+sjValue+"|";
									}else{
										updateZjCxValSql = updateZjCxValSql+"'"+sjValue+"'"+"|";
									}
									
								}else{
									if("date".equals(dateType)){
										updateValSql = updateValSql+sjValue+"|";
									}else{
										updateValSql = updateValSql+"'"+sjValue+"'"+"|";
									}
								}
							}else{
								//添加数据sql拼接
								if("date".equals(dateType)){
									lsSaveVal = lsSaveVal + sjValue; 	
								}else{
									lsSaveVal = lsSaveVal + "'" + sjValue + "'"; 	
								}
								
								//修改数据sql拼接
								if("1".equals(sfzj)){
									if("date".equals(dateType)){
										updateZjCxValSql = updateZjCxValSql+sjValue; 	
									}else{
										updateZjCxValSql = updateZjCxValSql+"'"+sjValue+"'"; 	
									}
								}else{
									if("date".equals(dateType)){
										updateValSql = updateValSql+sjValue; 	
									}else{
										updateValSql = updateValSql+"'"+sjValue+"'"; 	
									}
								}
							}
						}
					}
					
					//添加到错误数据ListMap
					if(bterror){
						errorListMap.put(i+"", sj);
					}else{
						//如果所有判断都没有错误，则导入进数据库
						//判断为添加还是修改
						if("0".equals(zjorgxzt)){
							//添加
							Map impMap = new HashMap();
							impMap.put("tableName", tableName);
							impMap.put("zdsql", saveSql);
							impMap.put("valSql", lsSaveVal);
							customImpOrExpService.saveImpMesg(impMap);
						}else{
							//修改
							String[] updSqlArray = updateSql.split("\\|");
							String[] updValSqlArray = updateValSql.split("\\|"); 
							String[] updZjCxSqlArray = updateZjCxSql.split("\\|");
							String[] updZjCxValSqlArray = updateZjCxValSql.split("\\|");
							String zdzsql="";
							String zdzjsql="";
							for(int m=0;m<updSqlArray.length;m++){
						    	if(m!=updSqlArray.length-1){
						    	   zdzsql = zdzsql+updSqlArray[m]+"="+updValSqlArray[m]+",";  
						    	}else{
						    	   zdzsql = zdzsql+updSqlArray[m]+"="+updValSqlArray[m];  
						    	}
						    }
							for(int n=0;n<updZjCxSqlArray.length;n++){
								if(n!=updZjCxSqlArray.length-1){
									zdzjsql = zdzjsql+updZjCxSqlArray[n]+"="+updZjCxValSqlArray[n]+"and ";
								}else{
									zdzjsql = zdzjsql+updZjCxSqlArray[n]+"="+updZjCxValSqlArray[n];
								}
							}
							Map impMap = new HashMap();
							impMap.put("tableName", tableName);
							impMap.put("zdzsql", zdzsql);
							impMap.put("zdzjsql", zdzjsql);
							customImpOrExpService.updateImpMesg(impMap);
						}
						
						//导入成功条数加1
						okDataSize ++;
					}
				} catch (Exception e) {
					errorTipsMap.put(i+"", "数据有误，不能导入。"+e.toString());
					errorListMap.put(i+"", sj);
					continue;
				}
			}
			
			//总数据条数
			imptips.put("dataSize", sjList.size()+"");
			//导入成功条数
			imptips.put("okDataSize", okDataSize+"");
			//导入失败条数
			imptips.put("errorDataSize", errorListMap.size()+"");
			
			session.setAttribute("errorTipsMap",errorTipsMap);
			session.setAttribute("errorListMap",errorListMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return imptips;
	}
	
	/**
	 * 导出错误信息
	 */
	@RequestMapping("impError")
	public void impError(HttpSession session,HttpServletResponse response,HttpServletRequest request)throws Exception{
		//表头List
		List<String> btList = (List<String>) session.getAttribute("btList");
		//错误提示Map
		HashMap<String, String> errorTipsMap = (HashMap<String, String>) session.getAttribute("errorTipsMap");
		//错误数据ListMap
		HashMap<String, List<String>> errorListMap = (HashMap<String, List<String>>) session.getAttribute("errorListMap");
		
		// 第一步，创建一个webbook，对应一个Excel文件  
        HSSFWorkbook wb = new HSSFWorkbook();
        // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet  
        HSSFSheet sheet = wb.createSheet("导入失败数据");
        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short  
        HSSFRow row = sheet.createRow((int) 0);  
        // 第四步，创建单元格，并设置值表头 设置表头居中  
        HSSFCellStyle style = wb.createCellStyle();  
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 水平居中格式 
        style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);//垂直居中
        style.setWrapText(true);//设置自动换行
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN); //下边框    
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);//左边框    
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);//上边框    
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);//右边框
        
        //设置表头
        HSSFCell cell = null;
        for(int i=0;i<btList.size();i++){
        	cell = row.createCell(i);
        	cell.setCellValue(btList.get(i));
            cell.setCellStyle(style);
        }
        cell = row.createCell(btList.size());
        cell.setCellValue("错误原因");
        cell.setCellStyle(style);
        
        // 第五步，写入数据
        int index = 0;
        for(Map.Entry<String,List<String>> sj: errorListMap.entrySet()){
        	row = sheet.createRow(index + 1);
        	//给每列设置值
        	List<String> sjValueList = sj.getValue();
        	for(int i=0;i<sjValueList.size();i++){
        		cell = row.createCell(i);
        		cell.setCellValue(sjValueList.get(i));
            	cell.setCellStyle(style);
        	}
        	cell = row.createCell(sjValueList.size());
            cell.setCellValue(errorTipsMap.get(sj.getKey()));
            cell.setCellStyle(style);
        	
        	index++;
        }
        
        // 第六步，将文件存到指定位置,并返回下载
        try{ 
        	//设置文件头
			ServletOutputStream outStream = response.getOutputStream(); 
			String fileName = URLEncoder.encode("error.xls", "gbk");  //设置文件名
			response.reset();
			response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
			response.setContentType("application/octet-stream; charset=UTF-8");
			//将文件流写入response 流
			wb.write(outStream);
			outStream.close();
        }catch (Exception e){  
            e.printStackTrace();  
        }
	}
	
	public static boolean isValidDate(String str){
		boolean convertSuccess=false;
		if(isValidDategs1(str)||isValidDategs2(str)||isValidDategs3(str)){
			convertSuccess=true;
		}
		return convertSuccess;
	}
	public static final DateFormat formatter1 = new SimpleDateFormat("yyyyMMdd"); 
	public static final DateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd"); 
	public static final DateFormat formatter3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
	public static boolean isValidDategs1(String str){
	 try{
        Date date = (Date)formatter1.parse(str);
        return str.equals(formatter1.format(date));
	    }catch(Exception e){
	       return false;
	    }
	} 
	
	public static boolean isValidDategs2(String str){
	 try{
        Date date = (Date)formatter2.parse(str);
        return str.equals(formatter2.format(date));
	    }catch(Exception e){
	       return false;
	    }
	}
	
	public static boolean isValidDategs3(String str){
	 try{
        Date date = (Date)formatter3.parse(str);
        return str.equals(formatter3.format(date));
	    }catch(Exception e){
	       return false;
	    }
	}
	
	/**
	 * 下载模版
	 */
	@RequestMapping(value="/downExcel")
	public ModelAndView downExcel(HttpServletResponse response,Model model,String id)throws Exception{
		//FileDownload.fileDownload(response, PathUtil.getClasspath() + "mbxxdrFiles/file/down/"+ "Mbxxdr.xls", "Mbxxdr.xls");
		ModelAndView mv = new ModelAndView();
		//根据id获取字段及表的相关信息
		List<HashMap<String,String>> mapList = customImpOrExpService.queryById(id);
		//表名
		String tableName = "";
		String ywmc = "";
		try{
			if(mapList.size()>0){
				tableName = mapList.get(0).get("TABLENAME");
				ywmc = mapList.get(0).get("YWMC");
				Map<String,Object> dataMap = new HashMap<String,Object>();
				List<String> titles = new ArrayList<String>();
				for(int i=0;i<mapList.size();i++){
					titles.add(mapList.get(i).get("COLUMN_ZH"));
				}
				dataMap.put("titles", titles);
				//获取表内字段的值
				List<PageData> varList = new ArrayList<PageData>();
				dataMap.put("varList", varList);
				dataMap.put("ywmc", ywmc);
				ObjectExcelViewNew erv = new ObjectExcelViewNew();
				mv = new ModelAndView(erv,dataMap);
			}
			
		} catch(Exception e){
			e.printStackTrace();
		}
		return mv;
	}	
	
	@RequestMapping("/delCustomImp")
	@ResponseBody
	public String delCustomImp(String[] ids){		
			String res = customImpOrExpService.delCustomImp(ids);
			return res;
	}
	
	
	//判断excel单元格内容的格式，并对其进行转换
	private String zhCellValue(Cell cell) throws Exception{
		String cellValue = "";
		switch (cell.getCellType()) { 					// 判断excel单元格内容的格式，并对其进行转换，以便插入数据库
			case 0:
				cellValue = String.valueOf((int) cell.getNumericCellValue()).trim();
				break;
			case 1:
				cellValue = cell.getStringCellValue().trim();
				break;
			case 2:
				cellValue = cell.getNumericCellValue() + "";
				break;
			case 3:
				cellValue = "";
				break;
			case 4:
				cellValue = String.valueOf(cell.getBooleanCellValue()).trim();
				break;
			case 5:
				cellValue = String.valueOf(cell.getErrorCellValue()).trim();
				break;
		}
		return cellValue;
	}
}

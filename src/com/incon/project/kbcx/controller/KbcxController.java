package com.incon.project.kbcx.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFPrintSetup;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.util.Region;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.common.pub.pubXnxq.service.PubXnxqService;
import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.kbcx.Kcb;
import com.incon.pojo.common.kbcx.Zkb;
import com.incon.project.kbcx.services.KbcxService;
/**
 * 课表查询
 * @author sy
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("/kbcx")
public class KbcxController {
	@Resource(name = "pubXnxqService") 
	private PubXnxqService pubXnxqService;
	
	@Resource(name = "kbcxService")
	private KbcxService kbcxService;

	
	/**
	 * 周次32位转换(前加1位，后加一位 共34位)
	 */
	public static String getzc(int mi,int k){
		int count=0;
		int m=mi;
		for(;mi<=k;mi++){
			count+=1<<32-mi;
		}
		String zc = "";
		int j=0;
		while(j<m-1){
			j++;
			zc+="0";
		}
		return "0"+zc+Integer.toBinaryString(count)+"0";
	}
	
	  
	  
	  //学生个人课表查询
	  @RequestMapping("/queryGrkb")
	  public String queryGrkb(Model model,HttpSession session ,@RequestParam(value="xnxq" , required=false ) String xnxq,@RequestParam(value="zc" , required=false ) String zc){
		  if(xnxq==null){
			    Map<String,String> m = new HashMap<String,String>();
	        	m=pubXnxqService.queryDqXnxq();
	        	xnxq=(String)m.get("XNXQ");
		  }
		    Map xnxqmap = pubXnxqService.queryXnxqByOne(xnxq);
			UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
			int count=kbcxService.queryKbkgzt(xnxq);
			
			if(count==1){//count==1 能查看课表
				 Map<String,String> map = new HashMap<String,String>();
				 map.put("xh", userEntity.getYhdm());
				 map.put("xn", xnxqmap.get("XN")+"");
				 map.put("xq", xnxqmap.get("XQ")+"");
//				 //个人课表确认
//				 String grkbqr = pubXnxqService.queryXtcsxx("XKGL_SFXSGRKBQR");
//				 model.addAttribute("grkbqr",grkbqr);
//				 String grkbqransfky ="";
				
				 Map xsxxmap = kbcxService.queryXsxx(userEntity.getYhdm());
				 map.put("glyx", xsxxmap.get("GLYX").toString());
				
//				 int xkCount =0;
//				 if("1".equals(grkbqr)){
//					 //判断个人课表确认按钮是否显示
//					 grkbqransfky =kbcxService.queryQransfky(map);
//					 model.addAttribute("grkbqransfky",grkbqransfky);
//					 //是否已选课
//					 xkCount = kbcxService.querySfyxk(map);
//					 model.addAttribute("xkCount",xkCount);
//				 }
				 model.addAttribute("kcbList",kbcxService.GrkbcxList(map));//查询课程表信息
				 model.addAttribute("xssjk",  kbcxService.queryGrsjkc(map));//查询实践课程信息
				 Map<String,String> mm = pubXnxqService.queryXnxqByOne(xnxq);
				 //课表是否已确认
//				 model.addAttribute("kbsfyqr",  kbcxService.queryGrkbsfqr(map));
//				 if(grkbqransfky.equals("1") && grkbqr.equals("1") && xkCount>0){
//					 model.addAttribute("kbxx", mm.get("XNXQMC")+"学期("+ userEntity.getYhdm() +")"+userEntity.getXm()+"课表("+xsxxmap.get("XTSJ")+")" );	
//				 }else{
					 model.addAttribute("kbxx", mm.get("XNXQMC")+"学期("+ userEntity.getYhdm() +")"+userEntity.getXm()+"课表" );	
//				}
				
			}else{
				model.addAttribute("msg", "课程查询暂未开放！");
				model.addAttribute("bs", "-1");
			}
			
			model.addAttribute("xnxq", xnxq);
			model.addAttribute("zc", zc);
			
			List xnxqList = pubXnxqService.queryXsXnxqDxq(userEntity.getYhdm());
	    	model.addAttribute("xnxqList", xnxqList);
		return "commons/kbcx/queryGrkbList";
	   }
	  
	  
	  //学生个人周课表查询
	  @RequestMapping("/queryXszkb") 
	   public String queryXszkb(Model model,HttpSession session ,@RequestParam(value="xnxq" , required=false ) String xnxq,@RequestParam(value="zc" , required=false ) String zc){
		   UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		   if(xnxq==null){
			  Map<String,String> m = new HashMap<String,String>();
	        	m=pubXnxqService.queryDqXnxq();
	        	xnxq=(String)m.get("XNXQ");
		   }
		   int count=kbcxService.queryKbkgzt(xnxq);
			//count==1 能查看课表
		   Map xnxqmap = pubXnxqService.queryXnxqByOne(xnxq);
		   
			if(count==1){
			    Map<String,String> map = new HashMap<String,String>();
				map.put("xh", userEntity.getYhdm());
				map.put("xn", xnxqmap.get("XN")+"");
				map.put("xq", xnxqmap.get("XQ")+"");
				 
			    //判断周次是否为空，如为空则走学生课表查询，不为空走学生周课表查询
				if(zc==null || zc.equals("")){
					zc = kbcxService.queryDqzc();
				}
				
				//如果当前日期zc为空，默认第一周
				if(zc==null || zc.equals("")){
					zc = "1";
				}
				map.put("kbzc",zc);
				String  rqStr ="";
				List<Zkb> kbrqList = kbcxService.queryKbrqList(map);// 查询课表日期
				if(kbrqList!=null){
					for(int k=0;k<kbrqList.size();k++){//取周一和周末 日期
						rqStr="("+kbrqList.get(0).getRq()+"-"+kbrqList.get(kbrqList.size()-1).getRq()+")";
					}
				}
				model.addAttribute("rqStr", rqStr);

				/**
				 * 周次转换成32位
				 */
				if(zc!=null && !zc.equals("")){
					map.put("zc", getzc(Integer.parseInt(zc),Integer.parseInt(zc)));
				}
				model.addAttribute("kcbList",kbcxService.GrZkbcxList(map));//查询学生周课程表信息
				
				 Map xnxqmm = pubXnxqService.queryXnxqByOne(xnxq);
				 Map<String,String> map1 = new HashMap<String,String>();
				 map1.put("xn", xnxqmm.get("XN")+"");
				 map1.put("xq", xnxqmm.get("XQ")+"");
			    List zclist = kbcxService.queryzklistbyxnxq(map1);
			    model.addAttribute("zclist",zclist);
			    
				model.addAttribute("xssjk",  kbcxService.queryGrsjkc(map));//查询实践课程信息
			    Map<String,String> mm = pubXnxqService.queryXnxqByOne(xnxq);
				model.addAttribute("kbxx", mm.get("XNXQMC")+"学期("+ userEntity.getYhdm() +")"+userEntity.getXm()+"周课表" );	
			}else{
				model.addAttribute("msg", "学生周课表查询暂未开放！");
				model.addAttribute("bs", "-1");
			}
			model.addAttribute("xnxq", xnxq);
			model.addAttribute("zc", zc);
		    List xnxqList = pubXnxqService.queryXsXnxqDxq(userEntity.getYhdm());
	    	model.addAttribute("xnxqList", xnxqList);
    	   return "commons/kbcx/queryXszkbList";
	   }
	  
	  
	  //导出学生个人课表信息
	  @RequestMapping("/ExportGrKbxx")
	  public void ExportGrKbxx(Model model, HttpSession session, @RequestParam(value="xnxq" , required=false ) String xnxq, 
				  HttpServletResponse response) throws IOException{
				    UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
					String xh = userEntity.getYhdm();
					Map<String,String> map = new HashMap<String,String> ();
					map.put("xh", xh);
					 Map xnxqmap = pubXnxqService.queryXnxqByOne(xnxq);
					 map.put("xn", xnxqmap.get("XN")+"");
					 map.put("xq", xnxqmap.get("XQ")+"");
					 
//					map.put("xnxq", xnxq);
					List<Kcb> kbList=kbcxService.GrkbcxList(map);//查课表
					List<Map<String, Object>> sjk = new ArrayList<Map<String, Object>>();
					sjk=kbcxService.queryGrsjkc(map);//学生查询实践
					
					//产生工作薄对象
					HSSFWorkbook workbook = new HSSFWorkbook();
					//产生工作表对象
					HSSFSheet sheet = workbook.createSheet("学生课表"); 
					sheet.setDefaultColumnWidth((short)18);
					sheet.setColumnWidth(0, 1200);
					sheet.setColumnWidth(1, 900);
					sheet.setDefaultRowHeight((short)375);
					/*打印设置 */
					HSSFPrintSetup ps = sheet.getPrintSetup();
				    ps.setLandscape(true); //打印方向，true:横向，false:纵向
				    ps.setPaperSize(HSSFPrintSetup.A4_PAPERSIZE); //纸张
					sheet.setHorizontallyCenter(true); //设置打印页面为水平居中
					sheet.setMargin(HSSFSheet.LeftMargin, (double)0.3); //页边距（左）
					sheet.setMargin(HSSFSheet.RightMargin, (double)0.3); //页边距（右）
					sheet.setMargin(HSSFSheet.TopMargin, (double)0.3); //页边距（上）
					sheet.setMargin(HSSFSheet.BottomMargin, (double)0.2); //页边距（下）
					HSSFCellStyle allStyle = workbook.createCellStyle();
					allStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
					allStyle.setWrapText(true);
					allStyle.setVerticalAlignment(HSSFCellStyle.ALIGN_CENTER);
					HSSFFont allFont = workbook.createFont();
					allFont.setFontName("宋体");
					allFont.setFontHeightInPoints((short) 10);
					allStyle.setFont(allFont);
					allStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN );
					allStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN );
					allStyle.setBorderRight(HSSFCellStyle.BORDER_THIN );
					allStyle.setBorderTop(HSSFCellStyle.BORDER_THIN );
					allStyle.setBottomBorderColor(IndexedColors.BLACK.getIndex());// 黑色
					allStyle.setLeftBorderColor(IndexedColors.BLACK.getIndex());// 黑色
					allStyle.setTopBorderColor(IndexedColors.BLACK.getIndex());// 黑色
					allStyle.setRightBorderColor(IndexedColors.BLACK.getIndex());// 黑色
					allStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
					allStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
					int rowNo=0;//行号
					//第一行
					HSSFRow row1 = sheet.createRow((short) rowNo);
					row1.setHeightInPoints(18);
					HSSFCell cell2;
					HSSFCellStyle row1style=workbook.createCellStyle();
					row1style.cloneStyleFrom(allStyle);
					HSSFFont row1Font = workbook.createFont();
					row1style.setBorderBottom(HSSFCellStyle.BORDER_NONE );
					row1style.setBorderLeft(HSSFCellStyle.BORDER_NONE );
					row1style.setBorderRight(HSSFCellStyle.BORDER_NONE );
					row1style.setBorderTop(HSSFCellStyle.BORDER_NONE );
					row1Font.setFontName("宋体");
					row1Font.setFontHeightInPoints((short) 14);
					row1style.setFont(row1Font);
					for(int i = 0;i<9;i++){
					 cell2 = row1.createCell(i);
					 cell2.setCellStyle(row1style);
					}
					Map<String,String> mm = pubXnxqService.queryXnxqByOne(xnxq);
					
					sheet.addMergedRegion(new Region(rowNo,(short)0,rowNo,(short)8));
					HSSFCell cell0=row1.getCell(0);
					cell0.setCellValue(mm.get("XNXQMC")+"学期("+userEntity.getYhdm()+")"+userEntity.getXm()+"课表");
					//第二行
					rowNo++;
					HSSFRow row2 = sheet.createRow((short) rowNo);
					row2.setHeightInPoints(25);
					HSSFCell cell3;
					for(int i = 0;i<9;i++){
					 cell3 = row2.createCell(i);
					 cell3.setCellStyle(allStyle);
					}
					row2.getCell(2).setCellValue("星期一");
					row2.getCell(3).setCellValue("星期二");
					row2.getCell(4).setCellValue("星期三");
					row2.getCell(5).setCellValue("星期四");
					row2.getCell(6).setCellValue("星期五");
					row2.getCell(7).setCellValue("星期六");
					row2.getCell(8).setCellValue("星期日");
					sheet.addMergedRegion(new Region(rowNo,(short)0,rowNo,(short)1));
					//循环N行
					HSSFCellStyle stylen=workbook.createCellStyle();
					stylen.cloneStyleFrom(allStyle);
					stylen.setAlignment(HSSFCellStyle.ALIGN_LEFT);
					stylen.setVerticalAlignment(HSSFCellStyle.VERTICAL_TOP);
					for(int j=0;j<kbList.size();j++){
					Kcb kbxx=kbList.get(j);
					sheet.setColumnWidth((short) (0), (short) 1250);
					rowNo++;
					HSSFRow rown = sheet.createRow((short) rowNo);
					rown.setHeightInPoints(85);
					
					HSSFCell cell4;
					for(int i = 0;i<9;i++){
					 cell4 = rown.createCell(i);
					 if(i<2)cell4.setCellStyle(allStyle);
					 else cell4.setCellStyle(stylen);
					}
					rown.getCell(0).setCellValue(kbxx.getSXW_CN()!=null?kbxx.getSXW_CN():"");
					rown.getCell(1).setCellValue(kbxx.getBZ()!=null?kbxx.getBZ():"");
					rown.getCell(2).setCellValue(kbxx.getMON()!=null?kbxx.getMON():"");
					rown.getCell(3).setCellValue(kbxx.getTUES()!=null?kbxx.getTUES():"");
					rown.getCell(4).setCellValue(kbxx.getWED()!=null?kbxx.getWED():"");
					rown.getCell(5).setCellValue(kbxx.getTHUR()!=null?kbxx.getTHUR():"");			
					rown.getCell(6).setCellValue(kbxx.getFRI()!=null?kbxx.getFRI():"");
					rown.getCell(7).setCellValue(kbxx.getSAT()!=null?kbxx.getSAT():"");
					rown.getCell(8).setCellValue(kbxx.getSUN()!=null?kbxx.getSUN():"");			
					}
					//**********************查询实践**************************
					if(sjk!=null && sjk.size()>0){
					rowNo++;//第N++行
					HSSFRow rown = sheet.createRow((short) rowNo);
					rown.setHeightInPoints(20);
					HSSFCellStyle style = workbook.createCellStyle();
					style.cloneStyleFrom(allStyle);
					style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);   
					style.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
					style.setAlignment(HSSFCellStyle.ALIGN_LEFT);
					for(int i = 0;i<9;i++){
					HSSFCell cell4 = rown.createCell(i);
					 cell4.setCellStyle(style);
					}
					sheet.addMergedRegion(new Region(rowNo,(short)0,rowNo,(short)8));
					String str="";
					for(int i=0;i<sjk.size();i++){
						Map m = (Map)sjk.get(i);
					    str+=(String)m.get("SJKCZW");
					}
					rown.getCell(0).setCellValue("其它课程："+ str);
					}
					
					String filename;
					ServletOutputStream outStream = null;
					try {
						filename = new String((userEntity.getXm()+"课表").getBytes("GBK"), "ISO8859-1")+".xls";
						outStream = response.getOutputStream();
						response.setHeader("Content-Disposition", "attachment; filename=\""+ filename + "\"");
						response.setContentType("application/octet-stream; charset=UTF-8");
						workbook.write(outStream);
					} catch (Exception e) {
						System.out.println("Err : "+e);
					}finally{
						if (outStream != null) {
							try {
								outStream.close();
							} catch (IOException e) {
								System.out.println("Err : "+e);
							}
						}
					}
		  }
		  
	 
		
		//个人课表确认
		@SuppressWarnings("unchecked")
		@ResponseBody
		@RequestMapping("/kbqr")
		public String kbqr(HttpSession session,Model model,String xnxq){
			String result="";
			try{
				Map<String, String> map  = new HashMap<String, String>();
				//登陆者基本信息
				UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
				map.put("xh", userEntity.getYhdm());
				//拆分学年学期
				Map xnxqmap = pubXnxqService.queryXnxqByOne(xnxq);
				map.put("xn", xnxqmap.get("XN")+"");
				map.put("xq", xnxqmap.get("XQ")+"");
				
				//个人课表确认
				kbcxService.queryGrkbqr(map);
	 			
	 		}catch(Exception e){
	 			result="0";
	 			e.printStackTrace();
	 		}
	 		return result;
		}

	
	  //学生个人课表查询(英文版)
	  @RequestMapping("/queryYwGrkb")
	  public String queryYwGrkb(Model model,HttpSession session ,@RequestParam(value="xnxq" , required=false ) String xnxq){
		  if(xnxq==null){
			    Map<String,String> m = new HashMap<String,String>();
	        	m=pubXnxqService.queryDqXnxq();
	        	xnxq=(String)m.get("XNXQ");
		  }
			UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
			int count=kbcxService.queryKbkgzt(xnxq);
			//count==1 能查看课表
			if(count==1){
				 Map<String,String> map = new HashMap<String,String>();
				 map.put("xh", userEntity.getYhdm());
				 Map xnxqmap = pubXnxqService.queryXnxqByOne(xnxq);
				 map.put("xn", xnxqmap.get("XN")+"");
				 map.put("xq", xnxqmap.get("XQ")+"");
				 
				 model.addAttribute("kcbList",kbcxService.queryYwGrkb(map));//查询课程表信息
				 Map<String,String> mm = pubXnxqService.queryXnxqByOne(xnxq);
				 
				 String xn = xnxq.substring(0, 4);
					String xq = xnxq.substring(9, 10);
					
					if(xq.equals("1")){
						xq="Fall";
					}else if(xq.equals("2")){
						xq="Spring";
					}else{
						xq="Summer"; 
					}
					
					Map<String,String> xsxxMap =  kbcxService.queryXsxx(userEntity.getYhdm());//查某一个学生

					String ywxm="";
					if(xsxxMap!=null){
						if(xsxxMap.get("YWXM")!=null){
							ywxm=xsxxMap.get("YWXM");
						}
					}
				 model.addAttribute("kbxx", "Time Table for ("+ userEntity.getYhdm() +") "+ywxm+ " in "+ xn+" "+ xq +" Semester");

			}else{
				model.addAttribute("msg", "课程查询暂未开放！");
				model.addAttribute("bs", "-1");
			}
			
			model.addAttribute("xnxq", xnxq);
			List xnxqList = pubXnxqService.queryXsXnxqDxq(userEntity.getYhdm());
	    	model.addAttribute("xnxqList", xnxqList);
		    return "commons/kbcx/queryYwGrkbList";
	   }
}
	  
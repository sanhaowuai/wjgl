package com.incon.project.common.bmxxgl.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
 
import javax.servlet.http.HttpServletRequest;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.incon.common.pub.pubYx.service.PubYxService;
import com.incon.common.upload.service.UploadService;
import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.FjbEntity;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.XxfbbEntity;
import com.incon.pojo.common.YxdmbEntity;
 
import com.incon.project.common.bmxxgl.page.BmxxPage;
 
import com.incon.project.common.bmxxgl.page.BmxxhzPage;
 
import com.incon.project.common.bmxxgl.page.BmxxcxPage;
 
import com.incon.project.common.bmxxgl.service.BmxxglService;
 
 
 
@SuppressWarnings("all")
@Controller
@RequestMapping("/bmxxgl")
public class BmxxglController {
	@Resource(name="pubYxService")
	private PubYxService pubYxService;
	
	@Resource(name="bmxxglService")
	private BmxxglService bmxxService;
	@Resource(name="uploadService")
	private UploadService uploadService;
	
	@RequestMapping("queryAllBmxx")
	public String queryAllBmxx(HttpSession session,Model model,BmxxPage bmxxPage,String queryflag,
			Integer pageCount1,Integer pageNo1,Integer pageSize1,String FQXMC,String QXMC){
		UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
		try {
 
			Map<String, String> qxb = new HashMap<String, String>();
			 model.addAttribute("lb", bmxxService.queryLb());
			//查询全部院系
			List<Map<String,String>> yxlist=pubYxService.queryPubYxAll(null,null);
			model.addAttribute("yxlist", yxlist);
			bmxxPage.setPyhdm(userEntity.getYhdm());
			List<XxfbbEntity> list = bmxxService.query(bmxxPage);
			model.addAttribute("list", list);
			
			 
		} catch (Exception e) {
			System.err.println("queryAllBmxx操作失败!");
			e.printStackTrace();
		}
		return "/commons/bmxxgl/bmxxgl";
	}
	
	/**
	 * 跳转到添加  部门信息
	 * @param model
	 * @param bmxxPage
	 * @return
	 */
	@RequestMapping("queryForAddBmxx")
	public String queryForAddBmxx(HttpSession session,Model model,BmxxPage bmxxPage,String FQXMC,String QXMC){
		UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
		try{
			 model.addAttribute("lb", bmxxService.queryLb());
			Map<String, String> qxb = new HashMap<String, String>();
			qxb.put("FQXMC", FQXMC);
			qxb.put("QXMC", QXMC);
			model.addAttribute("QXB", qxb);
			//(根据权限)  查询所有院系
			List<Map<String,String>> xylist = pubYxService.queryPubYxAll("1",null);
			model.addAttribute("xylist", xylist);
			model.addAttribute("bmxxPage", bmxxPage);
			model.addAttribute("saveflag", "1");//添加页面标志位
			model.addAttribute("newxxid", UUID.randomUUID().toString());
		}catch(Exception e){
			System.err.println("queryForAddGgxx操作失败！");
			e.printStackTrace();
		}
		return "/commons/bmxxgl/addBmxx";
	}
	@RequestMapping("queryToXzbm")
	public String queryToXzbm(){
		try{
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/commons/bmxxgl/iframe_xzbm";
	}
	@ResponseBody
	@RequestMapping("queryYxTree")
	public List queryYxTree(HttpSession session,Model model,String yxmc){
		UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
		List<Map<String,String>> xylist = null;
		try{
		 
			//(根据权限)  查询所有院系
			xylist = pubYxService.queryPubYxAll("1",yxmc);
		}catch(Exception e){
			e.printStackTrace();
		}
		return xylist;
	}
	
	@ResponseBody
	@RequestMapping("deleteBmxx")
	public String deleteBmxx(String [] ids){
		try{
		bmxxService.delGg(ids);
		}catch(Exception e){
			e.printStackTrace();
			return "-1";
		}
		return "0";
	}
	
	/**
	 *   发布部门信息
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping("updGgSffb")
    public String updGgSffb(String xxid){
		String flag="";
		try {
			bmxxService.updateGgSffb(xxid);
			flag="0";
		} catch (Exception e) {
			flag="1";
			System.err.println("updGgSffb操作失败!!");
			e.printStackTrace();
		}
    	return flag;
    }
	/**
	 * 发布部门保存
	 * @param model
	 * @param request
	 * @param session
	 * @param qfjs
	 * @param hfjs
	 * @param del_fjs
	 * @param xxfbbEntity
	 * @param bmxxPage
	 * @return
	 */
	@RequestMapping("addBmxx")
	public String addBmxx(Model model, HttpServletRequest request, HttpSession session, String[] qfjs, String[] hfjs, String[] del_fjs, 
			XxfbbEntity xxfbbEntity,BmxxPage bmxxPage){
		try{  
			UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
			xxfbbEntity.setFbr(userEntity.getYhdm());//发布人
            String xxid = xxfbbEntity.getXxid();//新闻bh
            String flag = "";
            
			if(xxid == null || "".equals(xxid)){//新增
				xxid = xxfbbEntity.getNewxxid();//查询一个bh
				
				
				xxfbbEntity.setXxid(xxid);
				bmxxService.addGg(xxfbbEntity,  userEntity.getYhdm(), qfjs,  hfjs, del_fjs);
			}else{//修改
				bmxxService.updGg(xxfbbEntity,  userEntity.getYhdm(), qfjs,  hfjs, del_fjs);
			}
			
		}catch(Exception e){
			System.err.println("addGgxx操作失败！");
			e.printStackTrace();
		}
		return "redirect:/bmxxgl/queryAllBmxx?bmxxPage="+bmxxPage;
	}
	/**
	 * 发布部门保存(接口用)
	 * 
	 */
	@RequestMapping("yxxxbc")
	public void yxxxbc(XxfbbEntity xxfbbEntity){
		try{  
			bmxxService.yxxxbc(xxfbbEntity);
			
		}catch(Exception e){
			System.err.println("yxxxbc操作失败！");
			e.printStackTrace();
		}
	}
	@RequestMapping("queryForUpdateBmxx")
	public String queryForUpdateBmxx(HttpSession session,Model model,BmxxPage bmxxPage,String xxid,String FQXMC,String QXMC){
		UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
		try{
			 model.addAttribute("lb", bmxxService.queryLb());
			Map<String, String> qxb = new HashMap<String, String>();
			qxb.put("FQXMC", FQXMC);
			qxb.put("QXMC", QXMC);
			model.addAttribute("QXB", qxb);
			//(根据权限)  查询所有院系
			List<Map<String,String>> xylist0 =pubYxService.queryPubYxAll("1",null);
			List<Map<String,String>> xylist = new ArrayList(); 
			XxfbbEntity xxfbbEntity = bmxxService.queryOneXxfb(xxid);
			if(xxid!=null && !"".equals(xxid)){
				String xydms = xxfbbEntity.getKjyhfw();
				String xydm[] = xydms.split(",");
				for(int i=0;i<xydm.length;i++){
					for(int j=0;j<xylist0.size();j++){
						Map<String,String> entity = xylist0.get(j);
						if(xydm[i].equals(entity.get("YXDM"))){
							entity.put("checked", "1");
							xylist.add(entity);
						}
					}
				}
			}
			model.addAttribute("xylist", xylist);
			model.addAttribute("bmxxPage", bmxxPage);
			
			
			model.addAttribute("xxfbbEntity", xxfbbEntity);
			
			String listfjjson = JSON.toJSONString(uploadService.queryFj("PT_XT_XXFB", "XXID", xxid)).replaceAll("\"", "'");
			model.addAttribute("listfjjson", listfjjson);
		}catch(Exception e){
			System.err.println("queryForUpdateBmxx操作失败！");
			e.printStackTrace();
		}
		return "/commons/bmxxgl/addBmxx";
		
	}
	
	@RequestMapping("queryForCkhzBmxx")
	public String queryForCkhzBmxx(HttpSession session,Model model,String xxid,BmxxhzPage bmxxhzPage
			,BmxxPage bmxxPage
			,String FQXMC,String QXMC){
		UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
		try{
			Map<String, String> qxb = new HashMap<String, String>();
			qxb.put("FQXMC", FQXMC);
			qxb.put("QXMC", QXMC);
			model.addAttribute("QXB", qxb);
			
			bmxxhzPage.setPpxxid(xxid);
			List<Map<String,String>> list = bmxxService.query(bmxxhzPage);
			model.addAttribute("list", list);
			model.addAttribute("fbxxhzPage", bmxxhzPage);
			//  ======上一页page参数传递  开始===========
			 
			 
			//  ======上一页page参数传递  结束===========
		}catch(Exception e){
			System.err.println("queryForCkhzBmxx操作失败！");
			e.printStackTrace();
		}
		return "/commons/bmxxgl/bmxxhz";
	}
	
	
	
	/**************************************   部门信息查询    begin      **********************************************/
	
	
	
	@RequestMapping("queryBmxxcx")
	public String queryBmxxcx(HttpSession session,Model model,BmxxcxPage bmxxcxPage,String queryflag,
			Integer pageCount1,Integer pageNo1,Integer pageSize1){
		UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
		try {
			if(null!=pageCount1||null!=pageNo1||null!=pageSize1){
				bmxxcxPage.setPageCount(pageCount1);
				bmxxcxPage.setPageNo(pageNo1);
				bmxxcxPage.setPageSize(pageSize1);
			}
			bmxxcxPage.setSyhdm(userEntity.getYhdm());
			bmxxcxPage.setSyhlx(userEntity.getYhlx());
//			if(bmxxcxPage.getPglfw()==null || "".equals(bmxxcxPage.getPglfw())){
//				bmxxcxPage.setPglfw("5");//默认   是查看部门信息
//			}
			
			//查询全部院系
			List<Map<String,String>> yxlist = pubYxService.queryPubYxAll(null,null);
			model.addAttribute("yxlist", yxlist);
			
			List<XxfbbEntity> list = bmxxService.query(bmxxcxPage);
			model.addAttribute("list", list);
			//查看范围
			String ckfw = bmxxcxPage.getSckfw();
			if("1".equals(ckfw)){ //查看今日
				Date dt=new Date();    
				SimpleDateFormat matter1=new SimpleDateFormat("yyyy-MM-dd");
				matter1.format(dt);   
				bmxxcxPage.setSkssj(matter1.format(dt).toString());
				bmxxcxPage.setSjssj(matter1.format(dt).toString());
			}else if("2".equals(ckfw)){ //查看本周
				Calendar cal =Calendar.getInstance();
		        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");                   
		        cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY); //获取本周一的日期 		
		        bmxxcxPage.setSkssj(df.format(cal.getTime()).toString());
		        cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
				cal.add(Calendar.WEEK_OF_YEAR, 1);
				bmxxcxPage.setSjssj(df.format(cal.getTime()).toString());
			}else if("3".equals(ckfw)){  //查看本月
				 Calendar cal = Calendar.getInstance();
				 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				 cal.set(Calendar.DATE,1);      //第一天   
				 bmxxcxPage.setSkssj(df.format(cal.getTime()).toString());
				 int max = cal.getActualMaximum(Calendar.DATE);     //最后一天    
				 cal.set(Calendar.DATE,max);
				 bmxxcxPage.setSjssj(df.format(cal.getTime()).toString());
			}
			model.addAttribute("bmxxcxPage", bmxxcxPage);
		} catch (Exception e) {
			System.err.println("queryBmxxcx操作失败!");
			e.printStackTrace();
		}
		return "/commons/bmxxgl/bmxxcx";
	}
	
	/**
	 * 跳转到  公告信息 详细页面  （ 桌面跳入查看部门信息页面用） 
	 * @param model
	 * @param xwfbglPage
	 * @return
	 */
	@RequestMapping("bmxxcxOne")
	public String bmxxcxOne(HttpSession session,Model model,String xxid,String flag,BmxxcxPage bmxxPage,String FQXMC,String QXMC){
		UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
		try{
			if(FQXMC==null || "".equals(FQXMC)){FQXMC = "基础信息";}
			if(QXMC==null || "".equals(QXMC)){QXMC = "学院信息查看";}
			Map<String, String> qxb = new HashMap<String, String>();
			qxb.put("FQXMC", FQXMC);
			qxb.put("QXMC", QXMC);
			model.addAttribute("qxb", qxb);
			
			model.addAttribute("bmxxPage", bmxxPage);
			XxfbbEntity xxfbbEntity = bmxxService.queryOneXxfb(xxid);
//			System.out.println("================"+xxfbbEntity.getFbrxymc());
			model.addAttribute("xxfbbEntity", xxfbbEntity);
			
			//查询附件列表
			List<FjbEntity> fjList = bmxxService.queryFj("PT_XT_XXFB", "XXID", xxid);
			model.addAttribute("fjList", fjList);
			model.addAttribute("flag", flag);
			//在回执表中插入数据
			Map<String,String> map = new HashMap<String,String>();
			map.put("xxid", xxid);
			map.put("yhdm", userEntity.getYhdm());
			map.put("sfhz",xxfbbEntity.getSfhz());
			//回执表中插入记录
			bmxxService.addXxfbHzb(map);
		}catch(Exception e){
			System.err.println("bmxxcxOne操作失败！");
			e.printStackTrace();
			//return "forward:/hytzgl/queryForCkBmhytz?hyid="+xxid;
		}
		return "/commons/bmxxgl/bmxxcxOne";
	}
	
	@RequestMapping(value = "downloadFile")
	public String download2(String fjbh,final HttpServletRequest request, final HttpServletResponse response){
		
		java.io.BufferedInputStream bis = null;
		java.io.BufferedOutputStream bos = null;
		
		try { 
			response.setContentType("text/html;charset=utf-8"); 
			request.setCharacterEncoding("UTF-8");
	 
			FjbEntity fjbEntity = bmxxService.queryFjByFjbh(fjbh);
			String savepath = fjbEntity.getCclj() +File.separator+fjbEntity.getScr() +File.separator+fjbEntity.getCcm();
			String downLoadPath = request.getSession().getServletContext().getRealPath(File.separator+"upload"+File.separator+savepath+File.separator); 
 
			long fileLength = new File(downLoadPath).length(); 
			response.setContentType("application/x-msdownload;"); 
			response.setHeader("Content-disposition", "attachment; filename="+ new String(fjbEntity.getXsmc().getBytes("GBK"), "ISO8859-1")); 
			response.setHeader("Content-Length", String.valueOf(fileLength)); 
	
			bis = new BufferedInputStream(new FileInputStream(downLoadPath));
			bos = new BufferedOutputStream(response.getOutputStream());
			byte[] buff = new byte[2048]; 
			int bytesRead; 
			while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) { 
				bos.write(buff, 0, bytesRead); 
			} 

		} catch (Exception e) { 
			System.out.println("Err :"+e);
		} finally { 
			try {
				if (bis != null)	bis.close();
				if (bos != null)  	bos.close(); 
			} catch (IOException e) {
				System.out.println("Err :"+e);
			} 
		} 
		return null; 
	}
	
	/**
	 * 组件显示
	 * @param session
	 * @param model
	 * @param bmxxcxPage
	 * @param queryflag
	 * @param pageCount1
	 * @param pageNo1
	 * @param pageSize1
	 * @return
	 */
	@RequestMapping("queryBmxxcxZj/{num}")
	public String queryBmxxcxZj(HttpSession session,Model model,BmxxcxPage bmxxcxPage,String queryflag,
			Integer pageCount1,Integer pageNo1,Integer pageSize1,@PathVariable Integer num){
		UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
		try {
			if(null!=pageCount1||null!=pageNo1||null!=pageSize1){
				bmxxcxPage.setPageCount(pageCount1);
				bmxxcxPage.setPageNo(pageNo1);
				bmxxcxPage.setPageSize(num);
			}
			bmxxcxPage.setSyhdm(userEntity.getYhdm());
			bmxxcxPage.setSyhlx(userEntity.getYhlx());
			
			
			List<XxfbbEntity> list = bmxxService.query(bmxxcxPage);
			model.addAttribute("list", list);
//			//查看范围
//			String ckfw = bmxxcxPage.getSckfw();
//			if("1".equals(ckfw)){ //查看今日
//				Date dt=new Date();    
//				SimpleDateFormat matter1=new SimpleDateFormat("yyyy-MM-dd");
//				matter1.format(dt);   
//				bmxxcxPage.setSkssj(matter1.format(dt).toString());
//				bmxxcxPage.setSjssj(matter1.format(dt).toString());
//			}else if("2".equals(ckfw)){ //查看本周
//				Calendar cal =Calendar.getInstance();
//		        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");                   
//		        cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY); //获取本周一的日期 		
//		        bmxxcxPage.setSkssj(df.format(cal.getTime()).toString());
//		        cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
//				cal.add(Calendar.WEEK_OF_YEAR, 1);
//				bmxxcxPage.setSjssj(df.format(cal.getTime()).toString());
//			}else if("3".equals(ckfw)){  //查看本月
//				 Calendar cal = Calendar.getInstance();
//				 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//				 cal.set(Calendar.DATE,1);      //第一天   
//				 bmxxcxPage.setSkssj(df.format(cal.getTime()).toString());
//				 int max = cal.getActualMaximum(Calendar.DATE);     //最后一天    
//				 cal.set(Calendar.DATE,max);
//				 bmxxcxPage.setSjssj(df.format(cal.getTime()).toString());
//			}
			model.addAttribute("bmxxcxPage", bmxxcxPage);
		} catch (Exception e) {
			System.err.println("queryBmxxcx操作失败!");
			e.printStackTrace();
		}
		return "/commons/bmxxgl/bmxxcxZj";
	}
	
	
	/**************************************   部门信息查询    end      **********************************************/
}

package com.incon.common.consumerExp.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.incon.common.consumerExp.page.ConsumerExpEntity;
import com.incon.common.consumerExp.page.ConsumerExpJsPage;
import com.incon.common.consumerExp.page.ConsumerExpPage;
import com.incon.common.consumerExp.page.PageData;
import com.incon.common.consumerExp.service.ConsumerExpService;
import com.incon.common.customImpOrExp.page.CustomImpOrExpEntity;
import com.incon.common.customImpOrExp.page.CustomImpOrExpPage;
import com.incon.common.customImpOrExp.page.ImpColEntity;
import com.incon.common.customImpOrExp.page.JsEntity;
import com.incon.common.customImpOrExp.page.TabColumnsEntity;
import com.incon.common.customImpOrExp.service.CustomImpOrExpService;
import com.incon.framework.interseptor.WebConstants;
import com.incon.framework.util.TimeStampKey;
import com.incon.pojo.common.UserEntity;
/**
 * 自定义导出
 * 赵恒
 * 2016年11月29日
 */
@Controller
@RequestMapping("/consumerExp")
@SuppressWarnings("all") 
public class ConsumerExpController {
	
	@Resource(name="consumerExpService")
	private ConsumerExpService consumerExpService;
	@Resource(name="customImpOrExpService")
	private CustomImpOrExpService customImpOrExpService;
	/**
	 * 显示导出模板列表
	 * @param session
	 * @param model
	 * @param consumerExpPage
	 * @return
	 */
	@RequestMapping("/queryConsumerExp")
	public String  queryConsumerExp(HttpServletRequest request,HttpSession session,Model model,ConsumerExpPage consumerExpPage){
		try{
			//角色list
//			List<JsEntity> jsList = customImpOrExpService.queryJsList();
			List<ConsumerExpEntity> consumerExpList = consumerExpService.query(consumerExpPage); 
//			if(consumerExpList !=null && consumerExpList.size()>0){
//				for(ConsumerExpEntity consumerExpEntity : consumerExpList){
//					List<JsEntity> newJsList = new ArrayList<JsEntity>();
//					String roleid= consumerExpEntity.getRoleid();
//					String[] role = roleid.split(",");
//					for(int i=0;i<role.length;i++){
//						JsEntity js = customImpOrExpService.queryJsEntity(role[i]);
//						newJsList.add(js);
//					}
//					consumerExpEntity.setJs(newJsList);
//				}
//			}
			model.addAttribute("consumerExpList", consumerExpList);
			model.addAttribute("consumerExpPage", consumerExpPage);
//			model.addAttribute("jsList", jsList);
			return "commons/consumerExp/consumerExpList";
		}catch (Exception e) {
			e.printStackTrace();
			return "error/klerror";
		}
	}
	/**
	 * 添加保存
	 * @param curjsdm
	 * @param consumerExpEntity
	 * @return
	 */
	@RequestMapping("/saveMbxx")
	@ResponseBody
	public int saveMbxx(String[] curjsdm,ConsumerExpEntity consumerExpEntity){
//		String roleid= "";
		int rel=0;
//		for(int i=0;i<curjsdm.length;i++){
//			if(("").equals(roleid)){
//				roleid = curjsdm[i];
//			}else{
//				roleid= roleid+","+curjsdm[i];
//			}
//		}
//		consumerExpEntity.setRoleid(roleid);
		try{
			consumerExpService.insert("consumerExp.saveMbxx", consumerExpEntity);
			rel=1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return rel;
		
	}
	/**
	 * 删除列表信息
	 * @param ids
	 * @return
	 */
	@RequestMapping("/deleteConsumerExp")
	@ResponseBody
	public String deleteConsumerExp(String[] ids){
		return consumerExpService.deleteConsumerExp(ids);
	}
	/**
	 * 维护模板
	 * @param session
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping("/whmb")
	public String  whmb(HttpSession session,Model model,String id){
		//查出所有角色
//		List<JsEntity> jsList = customImpOrExpService.queryJsList();
		List<TabColumnsEntity> tabColumns = new ArrayList<TabColumnsEntity>();  
		//根据id查询出导出模板表信息
		ConsumerExpEntity consumerExpEntity = consumerExpService.queryTabById(id);  
		if(consumerExpEntity !=null){
			String tablename = consumerExpEntity.getTablename();
//			//根据表查询出字段
			tabColumns = customImpOrExpService.queryTabColumnsByTabName(tablename);
//			String roleid= consumerExpEntity.getRoleid();
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
		//回显字段列表
		List<HashMap<String,String>> mapList = consumerExpService.query("consumerExp.queryByTabId", consumerExpEntity.getId());
		
		model.addAttribute("mapList", mapList);
		model.addAttribute("tabColumns", tabColumns);
//		model.addAttribute("jsList", jsList);
		model.addAttribute("consumerExpEntity", consumerExpEntity);
		return "commons/consumerExp/consumerExpMbwh";
	}
	/**
	 * 增加列
	 * @param out
	 * @param model
	 * @param id
	 */
	@ResponseBody
	@RequestMapping("addrows")
	public void addrows(PrintWriter out,Model model,String id){
		//根据id查询出导出模板表信息
		ConsumerExpEntity consumerExpEntity = consumerExpService.queryTabById(id);  
		List<TabColumnsEntity> tabColumns = new ArrayList<TabColumnsEntity>();
		if(consumerExpEntity !=null){
			String tablename = consumerExpEntity.getTablename();
			tabColumns = customImpOrExpService.queryTabColumnsByTabName(tablename);
		}
		String json = JSONArray.fromObject(tabColumns).toString();
		out.write(json);
	}
	/**
	 * 添加新字段
	 * @param session
	 * @param model
	 * @param id
	 * @param columnenVal
	 * @return
	 */
	@RequestMapping("/queryTjzdList")
	public String  queryTjzdList(HttpSession session,Model model,String id,String columnenVal){
		ConsumerExpEntity consumerExpEntity = consumerExpService.queryTabById(id);
		String tablename = consumerExpEntity.getTablename();
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
		List<Map<String,String>> expColList = new ArrayList<Map<String,String>>();
		Map map = new HashMap();
		map.put("tableName", tablename);
		if(!"".equals(zdStr)){
			map.put("zdStr", zdStr);
			expColList = consumerExpService.queryTabColsByTabName(map);
		}else{
			expColList = consumerExpService.query("consumerExp.queryTabNullColsByTabName",map);
		}
		model.addAttribute("expColList", expColList);
		return "commons/consumerExp/queryTjzdList";
	}
	
	/**
	 * 修改或者添加保存
	 * @param curjsdm
	 * @param consumerExpEntity
	 * @return
	 */
	@RequestMapping("/saveEdtOrUpd")
	@ResponseBody
	public String saveEdtOrUpd(String[] curjsdm,ConsumerExpEntity consumerExpEntity,String[] arr){
		String roleid= "";
		String rel="0";
//		for(int j=0;j<curjsdm.length;j++){
//			if(("").equals(roleid)){
//				roleid = curjsdm[j];
//			}else{
//				roleid= roleid+","+curjsdm[j];
//			}
//		}
//		consumerExpEntity.setRoleid(roleid);
		try{
			rel = consumerExpService.updateTabAndCol(consumerExpEntity,arr);
		}catch(Exception e){
			e.printStackTrace();
		}
		return rel;
	}
	
	/**
	 * 根据不同角色获取不同列表
	 * @param session
	 * @param model
	 * @param param
	 * @return
	 */
	@RequestMapping("/queryJsExp")
	public String  queryJsExp(HttpServletRequest request,HttpSession session,Model model,ConsumerExpJsPage consumerExpJsPage,String yzkl){
	    try{
	    	UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
//			String jsdm = String.valueOf(userEntity.getJsdm());
//			consumerExpJsPage.setJsdm(jsdm);
			List<ConsumerExpEntity> consumerExpList = consumerExpService.query(consumerExpJsPage); 
			model.addAttribute("consumerExpList", consumerExpList);
			model.addAttribute("consumerExpJsPage", consumerExpJsPage);
			return "commons/consumerExp/consumerExpJsList";
	    }catch (Exception e) {
	    	e.printStackTrace();
	    	return "error/klerror";
		}
		
	}
	
	/**
	 * 检查
	 * @param session
	 * @param model
	 * @param jsxmsqbEntity
	 * @return
	 */
	@RequestMapping("/checkExcel")
	@ResponseBody
	public String checkExcel(HttpSession session,Model model,String id){	
		//根据id获取字段及表的相关信息
		List<HashMap<String,String>> mapList = consumerExpService.queryById(id);
		if(mapList.size()>0){
			String tableName = mapList.get(0).get("TABLENAME");
			try{
				List<HashMap<String,String>> varOList = consumerExpService.query("consumerExp.queryByTable1",tableName);
				return "1";
			}catch(Exception e){
				e.printStackTrace();
				//此表或视图不存在，请联系管理员！
				return "2";
			}
		}else{
			//导出模板信息维护不全，请联系管理员！
			return "0";
		}
	}
	
	/**
	 * 导出到excel
	 * @param session
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel(HttpServletRequest request,HttpSession session,Model model,String id){
		ModelAndView mv = new ModelAndView();
		try{
			String referer = request.getHeader("Referer"); // REFRESH 
			//判断验证口令是否为true(本系统不做判断，其他系统判断)
			if(null!=referer && !(referer.indexOf("incon") > -1)){
				//根据id获取字段及表的相关信息
				id=TimeStampKey.decrypt(id);
			}
				//根据id获取字段及表的相关信息
			    List<HashMap<String,String>> mapList = consumerExpService.queryById(id);
			    //表名
		    	String tableName = "";
			    String ywmc = "";
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
					List<HashMap<String,String>> varOList = consumerExpService.query("consumerExp.queryByTable1",tableName);
					List<PageData> varList = new ArrayList<PageData>();
					String column = "";
					int temp = 0;
					for(int i=0;i<varOList.size();i++){
						PageData vpd = new PageData();
						for(int j=0;j<mapList.size();j++){
							temp = j+1;
							vpd.put("var"+temp, varOList.get(i).get(mapList.get(j).get("COLUMN_EN")));
						}
						varList.add(vpd);
					}
					dataMap.put("varList", varList);
					dataMap.put("ywmc", ywmc);
					ObjectExcelViewNew erv = new ObjectExcelViewNew();
					mv = new ModelAndView(erv,dataMap);
			}
		 	return mv;
		} catch(Exception e){
			e.printStackTrace();
			mv.setViewName("error/klerror");
			return mv;
		}
	}
}

package com.incon.project.common.pageGenerate.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.UserEntity;
import com.incon.project.common.pageGenerate.page.PageGeneratePage;
import com.incon.project.common.pageGenerate.page.PageSearchPage;
import com.incon.project.common.pageGenerate.service.ForFile;
import com.incon.project.common.pageGenerate.service.PageCreate;
import com.incon.project.common.pageGenerate.service.PageGenerateService;

import ewebeditor.admin.main_jsp;

@SuppressWarnings("all")
@Controller
@RequestMapping("/pageGen")
public class PageGenerateController {
	@Resource(name="pageGenerateService")
	private PageGenerateService pageGenerateService;
	
//	@Resource(name="pubService")
//	private PubService pubService;
	
    /**
     * 查询页面	
     * @param model
     * @param session
     * @param pageGeneratePage
     * @return
     */
	@RequestMapping("/queryPageGenList")
	public String queryPageGenList(Model model,HttpSession session,PageGeneratePage pageGeneratePage){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		try{
			List<Map<String,String>> pageGenList = pageGenerateService.query(pageGeneratePage);
			model.addAttribute("list", pageGenList);
		}catch(Exception e){
			System.err.println("queryPageGenList操作失败!!");
			e.printStackTrace();
		}
		return "commons/jiaosgl/pageGenList";
	}
	
	/**
	 * 新增页面
	 * @param pageGeneratePage
	 */
	@ResponseBody
	@RequestMapping("addPage")
	public void addPage(PageGeneratePage pageGeneratePage,HttpServletRequest request,String zt,String qxid){
		String [] sxdm = pageGeneratePage.getSxdm();//属性(代码)
		String [] gnlb = pageGeneratePage.getGnlb();//功能类别(代码)
		String [] hngnlb = pageGeneratePage.getHngnlb();//行内功能类别(代码)
		String id = "";
		if("2".equals(zt)){//修改
			//删除整个页面信息和jsp页面
			Map<String,String> pagexx = (Map<String, String>) pageGenerateService.queryForObject("pageGen.queryPageByid", pageGeneratePage.getId());
			if(null!=pagexx&&pagexx.size()>0){
				String path = request.getRealPath("/")+File.separator+"jsp"+File.separator+pagexx.get("LJ");
				ForFile.delFile(path);
				path = request.getRealPath("/")+File.separator+"jsp"+File.separator+pagexx.get("LJ2");
				ForFile.delFile(path);
			}
			pageGenerateService.delete("pageGen.delPageGen", pageGeneratePage.getId());//删除功能区
		}
		
		String searchPage = "";
		String listPage = "";
		String gnPage = "";
		List hngnPage = new ArrayList();
		if(null!=sxdm && sxdm.length>0){//查询条件
			String [] sxmc = pageGeneratePage.getSxmc();//属性(名称)
			String [] lxs = pageGeneratePage.getLx();//类型
			String [] bts = pageGeneratePage.getBt();//标题
			String [] tablename = pageGeneratePage.getTablename();//表名
			for (int i=0,len=sxdm.length;i<len;i++) {
				String dm = sxdm[i];
				String name = sxmc[i];
				String nameParam = sxdm[i];
				String bt = bts[i];
				String type = lxs[i];
				
				List<Map<String, String>> list = new ArrayList<Map<String, String>>();
				if("2".equals(lxs[i])){
					Map<String,String> map = new HashMap<String, String>();
					map.put("DM", dm);
					map.put("NAME", name);
					map.put("TABLENAME", tablename[i]);
					list = pageGenerateService.query("pageGen.queryToolkitList", map);
				}else{
					list = null;
				}
				
				searchPage+=PageCreate.getSearchPage(dm, name, list, bt, nameParam, type);
			}
		}
		
		if(hngnlb != null && hngnlb.length>0){
			String hntzlj[] = pageGeneratePage.getHntzlj();
			for(int i = 0;i<hngnlb.length;i++){
				String str = hngnlb[i];
				Map map = (Map) pageGenerateService.queryForObject("pageGen.queryHngnmcyId",str);
				map.put("HNTZLJ", hntzlj[i]);
				hngnPage.add(map);
			}
		}
		
		if(gnlb != null && gnlb.length>0){
			String[] tzlj = pageGeneratePage.getTzlj();
			for(int i = 0;i<gnlb.length;i++){
				String str = gnlb[i];
				String name = (String) pageGenerateService.queryForObject("pageGen.queryGnmcyId",str);
				gnPage += PageCreate.getMenuPage(name,tzlj[i]);
			}
		}
		
		listPage = PageCreate.getListPage(pageGeneratePage.getColumnname(),hngnPage);
		String path  = request.getRealPath("/")+File.separator+"jsp"+File.separator+"commons"+File.separator+"pageGen"+File.separator;
		String page = PageCreate.getNewPage(gnPage,searchPage, listPage);
		String bbPage = PageCreate.getBbPage(searchPage, listPage);
		UUID uuid = UUID.randomUUID();
		UUID uuid2 = UUID.randomUUID();
		String lj = uuid.toString();
		String lj2 = uuid2.toString();
		ForFile.createFile(lj, page, path);
		ForFile.createFile(lj2, bbPage, path);
		pageGeneratePage.setLj("commons/pageGen/"+lj);
		pageGeneratePage.setLj2("commons/pageGen/"+lj2);
		pageGeneratePage.setQxdm(qxid);
		pageGenerateService.insert("pageGen.insertPageGen", pageGeneratePage);
		id = pageGeneratePage.getId();
		
		pageGenerateService.delete("pageGen.delCxtj", id);
		if(null!=sxdm && sxdm.length>0){
			String [] sxmc = pageGeneratePage.getSxmc();//属性(名称)
			String [] lxs = pageGeneratePage.getLx();//类型
			String [] bts = pageGeneratePage.getBt();//标题
			String [] tablename = pageGeneratePage.getTablename();//表名
			for (int i=0,len=sxdm.length;i<len;i++) {
				Map<String,String> map = new HashMap<String, String>();
				map.put("wjid", id);
				map.put("sxdm", sxdm[i]);
				map.put("sxmc", sxmc[i]);
				map.put("lx", lxs[i]);
				map.put("bt", bts[i]);
				map.put("tablename", tablename[i]);
				pageGenerateService.insert("pageGen.insertCxtj", map);
			}
		}
		
		pageGenerateService.delete("pageGen.deleteGnlb",id);
		if(gnlb != null && gnlb.length>0){
			String[] tzlj = pageGeneratePage.getTzlj();
			for(int i = 0;i<gnlb.length;i++){
				String str = gnlb[i];
				Map map = new HashMap();
				map.put("pageid", id);
				map.put("gnid",str);
				map.put("tzlj", tzlj[i]);
				pageGenerateService.insert("pageGen.insertGnlb", map);
			}
		}
		
		pageGenerateService.delete("pageGen.deleteHngnlb",id);
		if(hngnlb != null && hngnlb.length>0){
			String hntzlj[] = pageGeneratePage.getHntzlj();
			for(int i = 0;i<hngnlb.length;i++){
				String str = hngnlb[i];
				Map map = new HashMap();
				map.put("pageid", id);
				map.put("gnid",str);
				map.put("tzlj", hntzlj[i]);
				pageGenerateService.insert("pageGen.insertHngnlb", map);
			}
		}
		//修改访问路径 dm_qxb
		Map<String,String> fmap = new HashMap<String, String>();
		fmap.put("fwlj", "/pageGen/queryView?searchId="+id);
		fmap.put("qxdm", qxid);
		pageGenerateService.update("pageGen.updFwlj", fmap);
	}
	
	/**
	 * 根据id查询页面信息
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("queryPageByid")
	public Map<String,Object> queryPageByid(String id){
		Map<String,String> pagexx = (Map<String, String>) pageGenerateService.queryForObject("pageGen.queryPageByid", id);
		List<Map<String,String>> cxtjList = pageGenerateService.query("pageGen.queryCxtjByid", id);
		List<Map<String,String>> gnlbList = pageGenerateService.query("pageGen.queryGnlbByid", id);
		List<Map<String,String>> hngnlbList = pageGenerateService.query("pageGen.queryHngnlbByid", id);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("pagexx", pagexx);
		map.put("cxtjList", cxtjList);
		map.put("gnlbList", gnlbList);
		map.put("hngnlbList", hngnlbList);
		if(null!=pagexx&&pagexx.size()>0){
			map.put("flag", "1");
		}else{
			map.put("flag", "0");
		}
		return map;
	}
	
	/**
	 * 修改页面
	 * @param pageGeneratePage
	 */
	@ResponseBody
	@RequestMapping("updPage")
	public void updPage(PageGeneratePage pageGeneratePage){
		pageGenerateService.insert("pageGen.updPageGen", pageGeneratePage);
		String id = pageGeneratePage.getId();
		String [] sxdm = pageGeneratePage.getSxdm();//属性(代码)
		if(null!=sxdm && sxdm.length>0){
			String [] sxmc = pageGeneratePage.getSxmc();//属性(名称)
			String [] lxs = pageGeneratePage.getLx();//类型
			String [] bts = pageGeneratePage.getBt();//标题
			String [] tablename = pageGeneratePage.getTablename();//表名
			for (int i=0,len=sxdm.length;i<len;i++) {
				Map<String,String> map = new HashMap<String, String>();
				map.put("wjid", id);
				map.put("sxdm", sxdm[i]);
				map.put("sxmc", sxmc[i]);
				map.put("lx", lxs[i]);
				map.put("bt", bts[i]);
				map.put("tablename", tablename[i]);
				pageGenerateService.insert("pageGen.updCxtj", map);
			}
		}
	}
	
	//查看列表
	@RequestMapping("queryView")
	public String queryView(Model model,HttpServletRequest request,String searchId,String type,PageSearchPage pageSearchPage){
		model.addAttribute("searchId", searchId);
		String path  = request.getRealPath("/")+File.separator+"jsp"+File.separator+"commons"+File.separator+"pageGen";
		Map<String,String> pagexx = (Map<String, String>) pageGenerateService.queryForObject("pageGen.queryPageByid", searchId);
		//根据SQLID查出输入的SQL
		String sql = pagexx.get("SQL");
		String sqlWhere = pagexx.get("SQLWHERE");
		//根据SQLID查出查询条件
		List<Map<String,String>> cxtjList = pageGenerateService.query("pageGen.queryCxtjByid", searchId);
		boolean b = false;
		for(Map<String,String> map : cxtjList){
			if(request.getParameter(map.get("SXDM")) != null){
				b = true;
				String key = String.valueOf(request.getParameter(map.get("SXDM")));
				if(key != null && !"".equals(key)){
					sqlWhere = sqlWhere.replaceAll("#"+map.get("SXDM")+"#", "'" + key + "'");
				}else{
					sqlWhere =sqlWhere.substring(0,sqlWhere.lastIndexOf("[",sqlWhere.indexOf("#"+map.get("SXDM")+"#"))) + sqlWhere.substring(sqlWhere.indexOf("]",sqlWhere.indexOf("#"+map.get("SXDM")+"#"))+1,sqlWhere.length());
				}
				model.addAttribute(map.get("SXDM"), key);
			}
		}
		if(b){
			sql = sqlWhere;
			sql = sql.replaceAll("\\["," ");
			sql = sql.replaceAll("]"," ");
		}
		String sffy = pagexx.get("SFFY");
//		sffy = "1";
		model.addAttribute("sffy", sffy);
		if("1".equals(sffy)){
			pageSearchPage.setSqlStr(sql);
			List<Map> list = pageGenerateService.query(pageSearchPage);
			model.addAttribute("list", list);
			model.addAttribute("pageSearchPage", pageSearchPage);
		}else{
			List<Map> list = pageGenerateService.query("pageGen.queryLeaf",sql);
			model.addAttribute("list", list);
		}
		//根据SQLID查出生成的页面路径
		return pagexx.get("LJ");
	}
	
	@ResponseBody
	@RequestMapping("delPage")
	public void delPage(String ids){
		
	}
}

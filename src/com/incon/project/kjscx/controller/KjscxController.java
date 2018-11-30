package com.incon.project.kjscx.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.incon.common.pub.pubXnxq.service.PubXnxqService;
import com.incon.project.kjscx.page.KjscxPage;
import com.incon.project.kjscx.service.KjscxService;

@Controller
@SuppressWarnings("unchecked")
@RequestMapping("/kjscx")
public class KjscxController {

	@Resource(name = "pubXnxqService") 
	private PubXnxqService pubXnxqService;

	@Resource(name = "kjscxService") 
	private KjscxService kjscxService;

	/**
	 * 周次32位转换
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

	//查询空教室
	@RequestMapping("/queryKjs")
	public String queryKjs(HttpSession session,Model model,KjscxPage kjscxPage){
		
		List jcList =new ArrayList();
		List kjsList=new ArrayList();
		String zc="";
		String sq="";
		if(kjscxPage.getPageXnxq()==null || "".equals(kjscxPage.getPageXnxq())){
			Map<String,String> xnxqmap=pubXnxqService.queryDqXnxq();
			kjscxPage.setPageXnxq((String)xnxqmap.get("XNXQ"));
		}
			Map<String,String> xnxqmap1 = pubXnxqService.queryXnxqByOne(kjscxPage.getPageXnxq());
			Map<String, String> map = new HashMap<String,String>();
			map.put("xn",xnxqmap1.get("XN")+"");
			map.put("xq",xnxqmap1.get("XQ")+"");
			kjscxPage.setPageXn(xnxqmap1.get("XN")+"");
			kjscxPage.setPageXq(xnxqmap1.get("XQ")+"");
			
			List<Map<String, String>> zcList=kjscxService.queryzklistbyxnxq(map);
			model.addAttribute("zclist", zcList);
//		}else {
//			Map<String,String> xnxqmap1 = pubService.queryXnxqByOne(kjscxPage.getPageXnxq());
//			Map<String, String> map = new HashMap<String,String>();
//			map.put("xn",xnxqmap1.get("XN")+"");
//			map.put("xq",xnxqmap1.get("XQ")+"");
//			
//			List<Map<String, String>> zcList=kjscxService.queryzklistbyxnxq(map);
//			model.addAttribute("zclist", zcList);
//		}
		if(kjscxPage.getPageZc1()!=null && !kjscxPage.getPageZc1().equals("")
				&& kjscxPage.getPageZc2()!=null && !kjscxPage.getPageZc2().equals("") 
				&& kjscxPage.getPageXnxq()!=null && !kjscxPage.getPageXnxq().equals("")){

			jcList =kjscxService.queryPkjc(kjscxPage);//查询节次总数
			zc=getzc(Integer.parseInt(kjscxPage.getPageZc1()),Integer.parseInt(kjscxPage.getPageZc2()));
//			System.out.println("jcList==========>"+jcList.size());

			//************************拼成查询场地sql********************************
			String sql="select dm_jxcd.dm,dm_jxcd.mc,";
			String sql1="";
			String sql2="";
			String sql3="";
			String sql4="";
			if(jcList!=null && jcList.size()>0){
				for(int i=1;i<=7;i++){//七日
					for(int j=1;j<=jcList.size();j++){//节次数
						sql1+="xq"+i+"_"+j+",";
						sql3+=" count(case when xqj="+i+" and jc="+j+" and jw_f_sjctjs(zc,'"+zc+"' )>0 then 1 else null end) xq"+i+"_"+j+",";
					}
				}
				sql1=sql1.substring(0, sql1.length()-1);
				sql2=" from  dm_jxcd left join  (select cddm,xn,xq, ";
				sql4=" from jw_v_cdsjb where xn='"+kjscxPage.getPageXn()+"'and xq = '"+kjscxPage.getPageXq()+"' group by xn,xq,xiaoqu,lhdm,cddm,mc)t on dm_jxcd.dm=t.cddm ";

				sql3=sql3.substring(0, sql3.length()-1);
				sq=sql+sql1+sql2+sql3+sql4;//拼成查询场地sql
				System.out.println("sq=============>"+sq);
				kjscxPage.setPageSql(sq);
				kjsList =kjscxService.query(kjscxPage);
			}
		}
		model.addAttribute("jcList", jcList);//获得节次列表
		model.addAttribute("kjsList", kjsList);
		model.addAttribute("kjscxPage", kjscxPage);

//		List xnxqList = pubService.queryAfterDqXnxq(userEntity.getYhdm());
		
		List xnxqList = pubXnxqService.queryXnxqList();
		model.addAttribute("xnxqList", xnxqList);

		List xiaoquList = pubXnxqService.queryXiaoquList();
		model.addAttribute("xiaoquList", xiaoquList);

		if(kjscxPage.getPageXiaoqu()!=null && !"".equals(kjscxPage.getPageXiaoqu())){
			List lhList = kjscxService.queryJxlListBySjid(kjscxPage.getPageXiaoqu());
			model.addAttribute("lhList", lhList);
		}

		if(kjscxPage.getPageLhdm()!=null && !"".equals(kjscxPage.getPageLhdm())){
		List cdList = kjscxService.queryJxcdListBySjid(kjscxPage.getPageLhdm());
		model.addAttribute("cdList", cdList);
		}
		return "commons/kjscx/kjscxList";
	}

	//根据学年学期查询周次
	@RequestMapping("querykclistbyxnxq")
	@ResponseBody
	public List<Map<String, String>> querykclistbyxnxq(String xnxq){
		Map<String,String> xnxqmap1 = pubXnxqService.queryXnxqByOne(xnxq);
		Map<String, String> map1 = new HashMap<String,String>();
		map1.put("xn",xnxqmap1.get("XN")+"");
		map1.put("xq",xnxqmap1.get("XQ")+"");
		
		List<Map<String, String>> map=kjscxService.queryzklistbyxnxq(map1);
		return map;
	}
	//根据校区查询楼号
	@RequestMapping("queryJxlListBySjid")
	@ResponseBody
	public List<Map<String, String>> queryJxlListBySjid(String id){
		List<Map<String, String>> map=kjscxService.queryJxlListBySjid(id);
		return map;
	}	
	//根据楼号查询场地
	@RequestMapping("queryJxcdListBySjid")
	@ResponseBody
	public List<Map<String, String>> queryJxcdListBySjid(String id){
		List<Map<String, String>> map=kjscxService.queryJxcdListBySjid(id);
		return map;
	}
	
	//查询空教室(不登录就能访问)电子大屏
	@RequestMapping("/queryKjs_wdl")
	public String queryKjs_wdl(HttpSession session,Model model,KjscxPage kjscxPage){
		List jcList =new ArrayList();
		List kjsList=new ArrayList();
		String zc="";
		String sq="";
		if(kjscxPage.getPageXnxq()==null || "".equals(kjscxPage.getPageXnxq())){
			Map<String,String> xnxqmap=pubXnxqService.queryDqXnxq();
			kjscxPage.setPageXnxq((String)xnxqmap.get("XNXQ"));
		}
			Map<String,String> xnxqmap1 = pubXnxqService.queryXnxqByOne(kjscxPage.getPageXnxq());
			Map<String, String> map1 = new HashMap<String,String>();
			map1.put("xn",xnxqmap1.get("XN")+"");
			map1.put("xq",xnxqmap1.get("XQ")+"");
			kjscxPage.setPageXn(xnxqmap1.get("XN")+"");
			kjscxPage.setPageXq(xnxqmap1.get("XQ")+"");
			
			List<Map<String, String>> zcList=kjscxService.queryzklistbyxnxq(map1);
			model.addAttribute("zclist", zcList);
//		}else {
//			Map<String,String> xnxqmap1 = pubService.queryXnxqByOne(kjscxPage.getPageXnxq());
//			Map<String, String> map1 = new HashMap<String,String>();
//			map1.put("xn",xnxqmap1.get("XN")+"");
//			map1.put("xq",xnxqmap1.get("XQ")+"");
//			List<Map<String, String>> zcList=kjscxService.queryzklistbyxnxq(map1);
//			model.addAttribute("zclist", zcList);
//		}
		if(kjscxPage.getPageZc1()!=null && !kjscxPage.getPageZc1().equals("")
				&& kjscxPage.getPageZc2()!=null && !kjscxPage.getPageZc2().equals("") 
				&& kjscxPage.getPageXnxq()!=null && !kjscxPage.getPageXnxq().equals("")){

			jcList =kjscxService.queryPkjc(kjscxPage);//查询节次总数
			zc=getzc(Integer.parseInt(kjscxPage.getPageZc1()),Integer.parseInt(kjscxPage.getPageZc2()));
//			System.out.println("jcList==========>"+jcList.size());

			//************************拼成查询场地sql********************************
			String sql="select dm_jxcd.dm,dm_jxcd.mc,";
			String sql1="";
			String sql2="";
			String sql3="";
			String sql4="";
			if(jcList!=null && jcList.size()>0){
				for(int i=1;i<=7;i++){//七日
					for(int j=1;j<=jcList.size();j++){//节次数
						sql1+="xq"+i+"_"+j+",";
						sql3+=" count(case when xqj="+i+" and jc="+j+" and jw_f_sjctjs(zc,'"+zc+"' )>0 then 1 else null end) xq"+i+"_"+j+",";
					}
				}
				sql1=sql1.substring(0, sql1.length()-1);
				sql2=" from  dm_jxcd left join  (select cddm,xn,xq, ";
				sql4=" from jw_v_cdsjb where xn='"+kjscxPage.getPageXn()+"' and  xq = '"+kjscxPage.getPageXq()+"' group by xn,xq,xiaoqu,lhdm,cddm,mc)t on dm_jxcd.dm=t.cddm ";

				sql3=sql3.substring(0, sql3.length()-1);
				sq=sql+sql1+sql2+sql3+sql4;//拼成查询场地sql
				System.out.println("sq=============>"+sq);
				kjscxPage.setPageSql(sq);
				kjsList =kjscxService.query(kjscxPage);
			}
		}
		model.addAttribute("jcList", jcList);//获得节次列表
		model.addAttribute("kjsList", kjsList);
		model.addAttribute("kjscxPage", kjscxPage);

		Map<String,String> mm = pubXnxqService.queryXnxqByOne(kjscxPage.getPageXnxq());
		model.addAttribute("xnxqmc", mm.get("XNXQMC"));
		model.addAttribute("xnxq", mm.get("XNXQ"));
		
		List xiaoquList = pubXnxqService.queryXiaoquList();
		model.addAttribute("xiaoquList", xiaoquList);

		if(kjscxPage.getPageXiaoqu()!=null && !"".equals(kjscxPage.getPageXiaoqu())){
			List lhList = kjscxService.queryJxlListBySjid(kjscxPage.getPageXiaoqu());
			model.addAttribute("lhList", lhList);
		}

		if(kjscxPage.getPageLhdm()!=null && !"".equals(kjscxPage.getPageLhdm())){
		List cdList = kjscxService.queryJxcdListBySjid(kjscxPage.getPageLhdm());
		model.addAttribute("cdList", cdList);
		}
		return "commons/kjscx/kjscxList_wdl";
	}
}

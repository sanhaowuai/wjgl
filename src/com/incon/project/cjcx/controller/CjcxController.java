package com.incon.project.cjcx.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.incon.common.pub.pubXnxq.service.PubXnxqService;
import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.cjcx.Cjszb;
import com.incon.pojo.common.cjcx.Qmcjcx;
import com.incon.pojo.common.cjcx.Rwmbxx;
import com.incon.project.cjcx.page.CjcxPage;
import com.incon.project.cjcx.service.CjcxService;


@Controller
@SuppressWarnings("unchecked")
@RequestMapping("/cjcx")
public class CjcxController {

	@Resource(name = "pubXnxqService") 
	private PubXnxqService pubXnxqService;

	@Resource(name = "cjcxService") 
	private CjcxService cjcxService;
	
	
	
	/**
	 * 查询期末成绩列表 
	 */
	@RequestMapping("/queryQmcj")
	public String queryQmcj(Model model,HttpSession session,CjcxPage cjcxPage){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
//		if(userEntity == null || userEntity.getYhdm() == null ||  "".equals(userEntity.getYhdm())){
//			model.addAttribute("msg", "出现错误，请重新选择导航菜单！");
//			return "commons/cjcx/cjcxPub/message";
//		}
		
		int sfkf =1;
		Cjszb cjszb = cjcxService.queryCjszb();
		if(cjszb!=null){
			if(cjszb.getKssj()!=null && cjszb.getJssj()!=null){
				   sfkf = cjcxService.querySfKf(userEntity.getYhdm());//查看成绩开关是否开放，若开放则可查询成绩
			}
		}
		
		if(sfkf>0){//开放中，可以查询成绩
			
			Map xnxqmap =(Map)pubXnxqService.queryDqXnxq();
			String dqxnxq=(String)xnxqmap.get("XNXQ");//查询当前学年学期
		 
			Cjszb cjszbobj = cjcxService.queryCjfhsj(dqxnxq);//查询成绩复核开始，结束时间
			model.addAttribute("cjszbobj", cjszbobj);
			model.addAttribute("dqxnxq", dqxnxq);

			String  xnxqString = cjcxService.queryXnxq();
			if("0".equals(xnxqString)){
				model.addAttribute("pjsfkf", "0");//评价是否开放标识 1是0否
				
				cjcxPage.setPageXh(userEntity.getYhdm());
				cjcxPage.setPageSffx("0");
				List<Qmcjcx> cjlist=cjcxService.query(cjcxPage);
				model.addAttribute("cjlist", cjlist);
				model.addAttribute("cjcxPage",cjcxPage);
				
				//成绩说明备注
				Map<String,String> cjsmbzMap = cjcxService.queryCjsmbz();
				if("1".equals(cjsmbzMap.get("KZXX"))){
					model.addAttribute("cjsmbz", cjsmbzMap.get("BZ"));
				}
			}else{
				//int count1 = cjcxService.queryPjsfkf(dqxnxq);
				int count1 = cjcxService.queryPjsfkf(xnxqString);
				
				if(count1==0){//当前学年学期评价关闭中
					model.addAttribute("pjsfkf", "0");//评价是否开放标识 1是0否
					
					cjcxPage.setPageXh(userEntity.getYhdm());
					cjcxPage.setPageSffx("0");
					List<Qmcjcx> cjlist=cjcxService.query(cjcxPage);
					model.addAttribute("cjlist", cjlist);
					model.addAttribute("cjcxPage",cjcxPage);
					
					//成绩说明备注
					Map<String,String> cjsmbzMap = cjcxService.queryCjsmbz();
					if("1".equals(cjsmbzMap.get("KZXX"))){
						model.addAttribute("cjsmbz", cjsmbzMap.get("BZ"));
					}
				}else{
					model.addAttribute("pjsfkf", "1");//评价是否开放标识 1是0否					
					if(cjcxPage.getPageXnxq()!=null ){
					
						if(cjcxPage.getPageXnxq().equals(xnxqString)){ //等于当前学年学期
							//====================成绩是否查看判断=================================
							Map<String,String> pdmap = new HashMap<String,String>();
							pdmap.put("xh", userEntity.getYhdm()+"");
							cjcxService.querySfckcjObj(pdmap);//存储过程
							if("-1".equals((String)(pdmap.get("sfbj")))){
								model.addAttribute("msg", (String)(pdmap.get("msg")));
								model.addAttribute("bj", "1");
							}else{
								cjcxPage.setPageXh(userEntity.getYhdm());
								cjcxPage.setPageSffx("0");
								List<Qmcjcx> cjlist=cjcxService.query(cjcxPage);
								model.addAttribute("cjlist", cjlist);
								model.addAttribute("cjcxPage",cjcxPage);
								
								//成绩说明备注
								Map<String,String> cjsmbzMap = cjcxService.queryCjsmbz();
								if("1".equals(cjsmbzMap.get("KZXX"))){
									model.addAttribute("cjsmbz", cjsmbzMap.get("BZ"));
								}
							}
						}else{
							cjcxPage.setPageXh(userEntity.getYhdm());
							cjcxPage.setPageSffx("0");
							List<Qmcjcx> cjlist=cjcxService.query(cjcxPage);
							model.addAttribute("cjlist", cjlist);
							model.addAttribute("cjcxPage",cjcxPage);
							
							//成绩说明备注
							Map<String,String> cjsmbzMap = cjcxService.queryCjsmbz();
							if("1".equals(cjsmbzMap.get("KZXX"))){
								model.addAttribute("cjsmbz", cjsmbzMap.get("BZ"));
							}
						}
					}
					
				}
			}	
		}else{
			model.addAttribute("msg", "成绩查询尚未开放！");
		}
		if( pubXnxqService.queryXtcsb("CJLR_XSCJCX")!=null){
			Map map =(Map) pubXnxqService.queryXtcsb("CJLR_XSCJCX");//注意：如果您想申请成绩复核，请务必在复核期限内向本院系教学秘书提出申请。过期后不接受任何理由的复核。
			model.addAttribute("map", map);
		}
		Map map1 =(Map) pubXnxqService.queryXtcsb("CJLR_SFXSCJFHSQ");//是否顯示成績複核申請
		model.addAttribute("map1", map1);
		Map map2 =(Map) pubXnxqService.queryXtcsb("CJLR_SFXSJXBPM");//是否显示教学班排名
		model.addAttribute("map2", map2);
		
		List<Map<String,String>> xnxqList = pubXnxqService.queryAfterDqXnxq(userEntity.getYhdm());//查询学年学期
		model.addAttribute("xnxqList", xnxqList);
		return "commons/cjcx/qmcj/qmcjcxList";
	}	
	
	/**
	 * 查询期末明细
	 */
	@RequestMapping("/queryCjxxView")
	public String queryCjxxView(Model model,HttpSession session,String id,String rwh,String jhh){
		//UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		
//		if(userEntity == null || userEntity.getYhdm() == null ||  "".equals(userEntity.getYhdm())){
//			model.addAttribute("msg", "出现错误，请重新选择导航菜单！");
//			return "commons/cjcx/cjcxPub/message";
//		}
 		
		//查询期末成绩信息
		Qmcjcx qmcjcx = cjcxService.queryCjrwxx(id);
		model.addAttribute("qmcjcx", qmcjcx);
		List<Rwmbxx> rwmbList = cjcxService.queryRwmbxxListRwByYd(rwh,jhh);
		model.addAttribute("rwmbList", rwmbList);
		return "commons/cjcx/qmcj/qmcjcxView";
	}
	
}

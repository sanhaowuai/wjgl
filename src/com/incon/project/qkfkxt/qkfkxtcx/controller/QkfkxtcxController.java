package com.incon.project.qkfkxt.qkfkxtcx.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.incon.common.upload.service.UploadService;
import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.FjbEntity;
import com.incon.pojo.common.UserEntity;
import com.incon.pojo.common.qkfkxt.QkfkxtFksqbEntity;
import com.incon.pojo.common.xxfbxx.XxfbEntity;
import com.incon.project.lctp.service.LctpService;
import com.incon.project.qkfkxt.qkfkxtcx.page.QkfkxtcxPage;
import com.incon.project.qkfkxt.qkfkxtcx.service.QkfkxtcxService;
import com.incon.project.qkfkxt.qkfkycl.service.QkfkyclService;

@Controller
@RequestMapping("/qkfkxtcx")
@SuppressWarnings("all")
public class QkfkxtcxController {
	
	@Resource(name="qkfkxtcxService")
	private QkfkxtcxService qkfkxtcxService;
	
	@Resource(name="qkfkyclService")
	private QkfkyclService qkfkyclService;
	
	@Resource(name="uploadService")
	private UploadService uploadService;
	
	@RequestMapping("queryList")
	public String queryList(Model model, QkfkxtcxPage qkfkxtcxPage,HttpSession session){
		UserEntity userEntity = (UserEntity) session.getAttribute(WebConstants.CURRENT_USER);
		try{
			
			
			
			qkfkxtcxPage.setYhdm(userEntity.getYhdm());
		
			//列表
			
 			List<QkfkxtFksqbEntity> rwlist = qkfkxtcxService.query(qkfkxtcxPage);
			model.addAttribute("rwlist", rwlist);
			
			model.addAttribute("qkfkxtcxPage", qkfkxtcxPage);
			
			//项目名称
			List<Map<String, String>> xtList =qkfkyclService.queryxmmc();

			//变更类型
			List<Map<String, String>> bglxList = qkfkyclService.queryqkfklx();
			
			

			//紧急程度
			List<Map<String, String>>   jjcdList  = qkfkyclService.queryjjcd();
			
		model.addAttribute("xtList", xtList);
			model.addAttribute("bglxList", bglxList);
			model.addAttribute("jjcdList", jjcdList);
			
			//查询教师列表
			List<Map<String, String>> jsList = new ArrayList <Map<String, String>>();
			jsList=qkfkyclService.queryjs();
			model.addAttribute("jsList", jsList);
			
			System.out.println("+++++++++++++=xtList+++++++++"+xtList);
			System.out.println("+++++++++++++=bglxList+++++++++"+bglxList);
			System.out.println("+++++++++++++=jjcdList+++++++++"+jjcdList);
		}catch(Exception e){
			e.printStackTrace();
			System.out.print("queryList操作失败");
		}
			return "commons/qkfkxt/qkfkxtcx/qkfkxtcxList";
	}
	
	
	
	/***
	 * 根据申请单号查询反馈详细信息
	 * 
	 * 
	 * **/
	@RequestMapping("queryQkfkxtxxbyid")
	public   String  queryQkfkxtxxbyid(Model model,HttpSession session,String sqdh){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		try {
			
			String yhdm =userEntity.getYhdm();
			Map<String,String> map =new HashMap<String,String>();
			map.put("sqdh", sqdh);
			map.put("yhdm", yhdm);
			//主表信息
			QkfkxtFksqbEntity  qkfkxtFksqbEntity = qkfkxtcxService.queryBySqdh(map);
//			//附件
			List<Map<String,String>> fjlist = qkfkxtcxService.querFjlist(sqdh);
			//附表集合
			List<Map<String,Object>> fbjhlist =qkfkxtcxService.queryBySqdhAll(map);
			
			
			List<Map<String,Object>> fbjhlistnew = new ArrayList<Map<String,Object>>();
			
			for(Map<String,Object> m : fbjhlist){
				
				List<FjbEntity> fjb = uploadService.queryFj( "QKFKXT_FKSQB_CYB", "ID",  m.get("ID").toString());
				m.put("fjb", fjb);
				fbjhlistnew.add(m);
;			}

			model.addAttribute("fbjhlist", fbjhlistnew);
			model.addAttribute("fjlist", fjlist);
			
			model.addAttribute("qkfkxtFksqbEntity", qkfkxtFksqbEntity);
		} catch (Exception e) {
			System.err.println("queryQkfkxtxxbyid操作失败!!");
			e.printStackTrace();
		}
		return "commons/qkfkxt/qkfkxtcx/qkfkxtxx";
	}
	
	
	
	
	
	
	
	
	
}

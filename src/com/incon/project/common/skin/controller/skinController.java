package com.incon.project.common.skin.controller;

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

import com.incon.framework.interseptor.WebConstants;
import com.incon.pojo.common.UserEntity;
import com.incon.project.common.skin.page.SkinPage;
import com.incon.project.common.skin.service.SkinService;
 
 
 
@SuppressWarnings("all")
@Controller
@RequestMapping("/skin")
public class skinController {
	@Resource(name="skinService")
	public SkinService skinService;
	
	
	@RequestMapping("changeSkin")
	public String changeSkin(HttpSession session,Model model,String skinId,String mrSkin){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		
		session.setAttribute("boxColorA1", session.getAttribute("boxColorA"));
		session.setAttribute("boxColorB1", session.getAttribute("boxColorB"));
		session.setAttribute("boxColorC1", session.getAttribute("boxColorC"));
		session.setAttribute("boxColorD1", session.getAttribute("boxColorD"));
		session.setAttribute("boxColorE1", session.getAttribute("boxColorE"));
		session.setAttribute("boxColorF1", session.getAttribute("boxColorF"));
		session.setAttribute("boxColorG1", session.getAttribute("boxColorG"));
		session.setAttribute("boxColorDd1", session.getAttribute("boxColorDd"));
		session.setAttribute("boxColorEe1", session.getAttribute("boxColorEe"));
		session.setAttribute("boxColorFf1", session.getAttribute("boxColorFf"));
		session.setAttribute("boxColorFfs1", session.getAttribute("boxColorFfs"));
		session.setAttribute("namKey1", session.getAttribute("namKey"));
		
		session.setAttribute("namKeys1", session.getAttribute("namKeys"));
		session.setAttribute("topFontColor1", session.getAttribute("topFontColor"));
		session.setAttribute("topFontColorR1", session.getAttribute("topFontColorR"));
		session.setAttribute("topHovR1", session.getAttribute("topHovR"));
		session.setAttribute("topFontLogo1", session.getAttribute("topFontLogo"));
		session.setAttribute("navBtnBg1", session.getAttribute("navBtnBg"));
		session.setAttribute("leftIconColB1", session.getAttribute("leftIconColB"));
		session.setAttribute("leftIconColC1", session.getAttribute("leftIconColC"));
		session.setAttribute("leftTextColA1", session.getAttribute("leftTextColA"));
		session.setAttribute("leftTextColB1", session.getAttribute("leftTextColB"));
		session.setAttribute("leftTextColC1", session.getAttribute("leftTextColC"));
		session.setAttribute("leftColorHovB1", session.getAttribute("leftColorHovB"));
		session.setAttribute("leftColorHovC1", session.getAttribute("leftColorHovC"));
		session.setAttribute("mainNavCol1", session.getAttribute("mainNavCol"));
		session.setAttribute("navMainBg1", session.getAttribute("navMainBg"));
		session.setAttribute("contentBg1", session.getAttribute("contentBg"));
		session.setAttribute("mrSkin", mrSkin);
		String res;
		
		if(skinId==null||"".equals(skinId)){
			model.addAttribute("boxColorA", "");
			model.addAttribute("boxColorB", "");
			model.addAttribute("boxColorC", "");
			model.addAttribute("boxColorD", "");
			model.addAttribute("boxColorE", "");
			model.addAttribute("boxColorF", "");
			model.addAttribute("boxColorG", "");
			model.addAttribute("boxColorDd", "");
			model.addAttribute("boxColorEe", "");
			model.addAttribute("boxColorFf", "");
			model.addAttribute("boxColorFfs", "");
			model.addAttribute("namKey", "");
			model.addAttribute("namKeys", "");
			model.addAttribute("topFontColor", "");
			model.addAttribute("topFontColorR", "");
			model.addAttribute("topHovR", "");
			model.addAttribute("topFontLogo", "");
			model.addAttribute("navBtnBg", "");
			model.addAttribute("leftIconColB", "");
			model.addAttribute("leftIconColC", "");
			model.addAttribute("leftTextColA", "");
			model.addAttribute("leftTextColB", "");
			model.addAttribute("leftTextColC", "");
			model.addAttribute("leftColorHovB", "");
			model.addAttribute("leftColorHovC", "");
			model.addAttribute("mainNavCol", "");
			model.addAttribute("navMainBg", "");
			model.addAttribute("contentBg", "");
			model.addAttribute("skinId", "");
			model.addAttribute("mrSkin", "mrSkin");
		}else{
			Map<String,String> map=new HashMap<String, String>();
            Map<String,String> skin=new HashMap<String, String>();
            map.put("skinId", skinId);
            skin=skinService.querySkinForUp(map);
			model.addAttribute("boxColorA", skin.get("BOXCOLORA"));
			model.addAttribute("boxColorB", skin.get("BOXCOLORB"));
			model.addAttribute("boxColorC", skin.get("BOXCOLORC"));
			model.addAttribute("boxColorD", skin.get("BOXCOLORD"));
			model.addAttribute("boxColorE", skin.get("BOXCOLORE"));
			model.addAttribute("boxColorF", skin.get("BOXCOLORF"));
			model.addAttribute("boxColorG", skin.get("BOXCOLORG"));
			model.addAttribute("boxColorDd", skin.get("BOXCOLORDD"));
			model.addAttribute("boxColorEe", skin.get("BOXCOLOREE"));
			model.addAttribute("boxColorFf", skin.get("BOXCOLORFF"));
			model.addAttribute("boxColorFfs", skin.get("BOXCOLORFFS"));
			model.addAttribute("namKey", skin.get("NAMKEY"));
			
			model.addAttribute("namKeys", skin.get("NAMKEYS"));
     	    model.addAttribute("topFontColor", skin.get("TOPFONTCOLOR"));
     	    model.addAttribute("topFontColorR", skin.get("TOPFONTCOLORR"));
     	    model.addAttribute("topHovR", skin.get("TOPHOVR"));
     	    model.addAttribute("topFontLogo", skin.get("TOPFONTLOGO"));
     	    model.addAttribute("navBtnBg", skin.get("NAVBTNBG"));
     	    model.addAttribute("leftIconColB", skin.get("LEFTICONCOLB"));
     	    model.addAttribute("leftIconColC", skin.get("LEFTICONCOLC"));
     	    model.addAttribute("leftTextColA", skin.get("LEFTTEXTCOLA"));
     	    model.addAttribute("leftTextColB", skin.get("LEFTTEXTCOLB"));
     	    model.addAttribute("leftTextColC", skin.get("LEFTTEXTCOLC"));
     	    model.addAttribute("leftColorHovB", skin.get("LEFTCOLORHOVB"));
     	    model.addAttribute("leftColorHovC", skin.get("LEFTCOLORHOVC"));
     	    model.addAttribute("mainNavCol", skin.get("MAINNAVCOL"));
     	    model.addAttribute("navMainBg", skin.get("NAVMAINBG"));
     	    model.addAttribute("contentBg", skin.get("CONTENTBG"));
			model.addAttribute("skinName", skin.get("SKINNAME"));
			model.addAttribute("skinId", skinId);
			model.addAttribute("mrSkin", mrSkin);
		}
		String syym=(String)session.getAttribute("syym");
		if(syym.equals("commons/main/main_08")){
			syym="/commons/skin/addOrUpSkin_08";
		}else if(syym.equals("commons/main/main_12")){
			syym="/commons/skin/addOrUpSkin_12";
		}else{
			syym="/commons/skin/addOrUpSkin";
		}
		return syym;
	}
	@ResponseBody
	@RequestMapping("saveSkin")
	public Map<String,String> saveSkin(HttpSession session,Model model,String namKey,String prom){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		Map<String,String> map=new HashMap<String,String>();
		map.put("yhdm", userEntity.getYhdm());
		try {
			if(prom.equals("1")){
				session.setAttribute("namKey", namKey);
				map.put("namKey", namKey);
				map.put("namKeys", "");
			}
			if(prom.equals("2")){
				session.setAttribute("namKeys", namKey);
				map.put("namKey", "");
				map.put("namKeys", namKey);
			}
			//int count=skinService.querySkinSfyy(map);
			//if(count>0){
			//	skinService.updateUserSkin(map);
			//}else{
			//	skinService.saveUserSkin(map);
			//}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	@ResponseBody
	@RequestMapping("querySkin")
	public Map<String,String> querySkin(HttpSession session,Model model){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		Map<String,String> map=new HashMap<String,String>();
		map.put("yhdm", userEntity.getYhdm());
		try {
			String namKey=(String)session.getAttribute("namKey");
			String namKeys=(String)session.getAttribute("namKeys");
			map.put("namKey", namKey);
			map.put("namKeys", namKeys);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping("saveSkin1")
	public String saveSkin1(HttpSession session,Model model,String boxColorA,String boxColorB,String boxColorC,String boxColorD,String boxColorE,String boxColorF,String boxColorG,String boxColorDd,String boxColorEe,String boxColorFf,String boxColorFfs
			,String topFontColor,String topFontColorR,String topHovR,String topFontLogo,String navBtnBg,String leftIconColB,String leftIconColC,String leftTextColA,String leftTextColB,String leftTextColC,String leftColorHovB,String leftColorHovC,String mainNavCol,String navMainBg,String contentBg
			){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		if(boxColorA==null||boxColorA.equals("#FFFFFF")){
			boxColorA="";
		}
		if(boxColorB==null||boxColorB.equals("#FFFFFF")){
			boxColorB="";
		}
		if(boxColorC==null||boxColorC.equals("#FFFFFF")){
			boxColorC="";
		}
		if(boxColorD==null||boxColorD.equals("#FFFFFF")){
			boxColorD="";
		}
		if(boxColorE==null||boxColorE.equals("#FFFFFF")){
			boxColorE="";
		}
		if(boxColorE==null||boxColorE.equals("#FFFFFF")){
			boxColorF="";
		}
		if(boxColorG==null||boxColorG.equals("#FFFFFF")){
			boxColorG="";
		}
		if(boxColorDd==null||boxColorDd.equals("#FFFFFF")){
			boxColorDd="";
		}
		if(boxColorEe==null||boxColorEe.equals("#FFFFFF")){
			boxColorEe="";
		}
		if(boxColorFf==null||boxColorFf.equals("#FFFFFF")){
			boxColorFf="";
		}
		if(boxColorFfs==null||boxColorFfs.equals("#FFFFFF")){
			boxColorFfs="";
		}
		
		if(topFontColor==null||topFontColor.equals("#FFFFFF")){
			topFontColor="";
		}
		if(topFontColorR==null||topFontColorR.equals("#FFFFFF")){
			topFontColorR="";
		}
		if(topHovR==null||topHovR.equals("#FFFFFF")){
			topHovR="";
		}
		if(topFontLogo==null||topFontLogo.equals("#FFFFFF")){
			topFontLogo="";
		}
		if(navBtnBg==null||navBtnBg.equals("#FFFFFF")){
			navBtnBg="";
		}
		if(leftIconColB==null||leftIconColB.equals("#FFFFFF")){
			leftIconColB="";
		}
		if(leftIconColC==null||leftIconColC.equals("#FFFFFF")){
			leftIconColC="";
		}
		if(leftTextColA==null||leftTextColA.equals("#FFFFFF")){
			leftTextColA="";
		}
		if(leftTextColB==null||leftTextColB.equals("#FFFFFF")){
			leftTextColB="";
		}
		if(leftTextColC==null||leftTextColC.equals("#FFFFFF")){
			leftTextColC="";
		}
		if(leftColorHovB==null||leftColorHovB.equals("#FFFFFF")){
			leftColorHovB="";
		}
		if(leftColorHovC==null||leftColorHovC.equals("#FFFFFF")){
			leftColorHovC="";
		}
		if(mainNavCol==null||mainNavCol.equals("#FFFFFF")){
			mainNavCol="";
		}
		if(navMainBg==null||navMainBg.equals("#FFFFFF")){
			navMainBg="";
		}
		if(contentBg==null||contentBg.equals("#FFFFFF")){
			contentBg="";
		}
		session.setAttribute("boxColorA", boxColorA);
		session.setAttribute("boxColorB", boxColorB);
		session.setAttribute("boxColorC", boxColorC);
		session.setAttribute("boxColorD", boxColorD);
		session.setAttribute("boxColorE", boxColorE);
		session.setAttribute("boxColorF", boxColorF);
		session.setAttribute("boxColorG", boxColorG);
		session.setAttribute("boxColorDd", boxColorDd);
		session.setAttribute("boxColorEe", boxColorEe);
		session.setAttribute("boxColorFf", boxColorFf);
		session.setAttribute("boxColorFfs", boxColorFfs);
		
		session.setAttribute("topFontColor", topFontColor);
		session.setAttribute("topFontColorR", topFontColorR);
		session.setAttribute("topHovR", topHovR);
		session.setAttribute("topFontLogo", topFontLogo);
		session.setAttribute("navBtnBg", navBtnBg);
		session.setAttribute("leftIconColB", leftIconColB);
		session.setAttribute("leftIconColC", leftIconColC);
		session.setAttribute("leftTextColA", leftTextColA);
		session.setAttribute("leftTextColB", leftTextColB);
		session.setAttribute("leftTextColC", leftTextColC);
		session.setAttribute("leftColorHovB", leftColorHovB);
		session.setAttribute("leftColorHovC", leftColorHovC);
		session.setAttribute("mainNavCol", mainNavCol);
		session.setAttribute("navMainBg", navMainBg);
		session.setAttribute("contentBg", contentBg);
		String res;
		try {
			Map<String,String> map=new HashMap<String,String>();
			map.put("yhdm", userEntity.getYhdm());
			map.put("boxColorA", boxColorA);
			map.put("boxColorB", boxColorB);
			map.put("boxColorC", boxColorC);
			map.put("boxColorD", boxColorD);
			map.put("boxColorE", boxColorE);
			map.put("boxColorF", boxColorF);
			map.put("boxColorG", boxColorG);
			map.put("boxColorDd", boxColorDd);
			map.put("boxColorEe", boxColorEe);
			map.put("boxColorFf", boxColorFf);
			map.put("boxColorFfs", boxColorFfs);
			
			map.put("topFontColor", topFontColor);
			map.put("topFontColorR", topFontColorR);
			map.put("topHovR", topHovR);
			map.put("topFontLogo", topFontLogo);
			map.put("navBtnBg", navBtnBg);
			map.put("leftIconColB", leftIconColB);
			map.put("leftIconColC", leftIconColC);
			map.put("leftTextColA", leftTextColA);
			map.put("leftTextColB", leftTextColB);
			map.put("leftTextColC", leftTextColC);
			map.put("leftColorHovB", leftColorHovB);
			map.put("leftColorHovC", leftColorHovC);
			map.put("mainNavCol", mainNavCol);
			map.put("navMainBg", navMainBg);
			map.put("contentBg", contentBg);
			int count=skinService.querySkinSfyy(map);
			if(count>0){
				skinService.updateUserSkin1(map);
			}else{
				if(boxColorA==null||boxColorA.equals("#FFFFFF")){
					boxColorA="";
				}
				if(boxColorB==null||boxColorB.equals("#FFFFFF")){
					boxColorB="";
				}
				if(boxColorC==null||boxColorC.equals("#FFFFFF")){
					boxColorC="";
				}
				if(boxColorD==null||boxColorD.equals("#FFFFFF")){
					boxColorD="";
				}
				if(boxColorE==null||boxColorE.equals("#FFFFFF")){
					boxColorE="";
				}
				if(boxColorE==null||boxColorE.equals("#FFFFFF")){
					boxColorF="";
				}
				if(boxColorG==null||boxColorG.equals("#FFFFFF")){
					boxColorG="";
				}
				if(boxColorDd==null||boxColorDd.equals("#FFFFFF")){
					boxColorDd="";
				}
				if(boxColorEe==null||boxColorEe.equals("#FFFFFF")){
					boxColorEe="";
				}
				if(boxColorFf==null||boxColorFf.equals("#FFFFFF")){
					boxColorFf="";
				}
				if(boxColorFfs==null||boxColorFfs.equals("#FFFFFF")){
					boxColorFfs="";
				}
				if(topFontColor==null||topFontColor.equals("#FFFFFF")){
					topFontColor="";
				}
				if(topFontColorR==null||topFontColorR.equals("#FFFFFF")){
					topFontColorR="";
				}
				if(topHovR==null||topHovR.equals("#FFFFFF")){
					topHovR="";
				}
				if(topFontLogo==null||topFontLogo.equals("#FFFFFF")){
					topFontLogo="";
				}
				if(navBtnBg==null||navBtnBg.equals("#FFFFFF")){
					navBtnBg="";
				}
				if(leftIconColB==null||leftIconColB.equals("#FFFFFF")){
					leftIconColB="";
				}
				if(leftIconColC==null||leftIconColC.equals("#FFFFFF")){
					leftIconColC="";
				}
				if(leftTextColA==null||leftTextColA.equals("#FFFFFF")){
					leftTextColA="";
				}
				if(leftTextColB==null||leftTextColB.equals("#FFFFFF")){
					leftTextColB="";
				}
				if(leftTextColC==null||leftTextColC.equals("#FFFFFF")){
					leftTextColC="";
				}
				if(leftColorHovB==null||leftColorHovB.equals("#FFFFFF")){
					leftColorHovB="";
				}
				if(leftColorHovC==null||leftColorHovC.equals("#FFFFFF")){
					leftColorHovC="";
				}
				if(mainNavCol==null||mainNavCol.equals("#FFFFFF")){
					mainNavCol="";
				}
				if(navMainBg==null||navMainBg.equals("#FFFFFF")){
					navMainBg="";
				}
				if(contentBg==null||contentBg.equals("#FFFFFF")){
					contentBg="";
				}
				skinService.saveUserSkin1(map);
			}
			res="1";
		} catch (Exception e) {
			e.printStackTrace();
			res="0";
		}
		return res;
	}
	
	@ResponseBody
	@RequestMapping("saveSkinModel")
	public String saveSkinModel(HttpSession session,Model model,String boxColorA,String boxColorB,String boxColorC,String boxColorD,String boxColorE,String boxColorF,String boxColorG,String boxColorDd,String boxColorEe,String boxColorFf,String boxColorFfs,String namKey,String namKeys,String skinName,String skinId
			,String topFontColor,String topFontColorR,String topHovR,String topFontLogo,String navBtnBg,String leftIconColB,String leftIconColC,String leftTextColA,String leftTextColB,String leftTextColC,String leftColorHovB,String leftColorHovC,String mainNavCol,String navMainBg,String contentBg
			){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		if(boxColorA==null||boxColorA.equals("#FFFFFF")){
			boxColorA="";
		}
		if(boxColorB==null||boxColorB.equals("#FFFFFF")){
			boxColorB="";
		}
		if(boxColorC==null||boxColorC.equals("#FFFFFF")){
			boxColorC="";
		}
		if(boxColorD==null||boxColorD.equals("#FFFFFF")){
			boxColorD="";
		}
		if(boxColorE==null||boxColorE.equals("#FFFFFF")){
			boxColorE="";
		}
		if(boxColorE==null||boxColorE.equals("#FFFFFF")){
			boxColorF="";
		}
		if(boxColorG==null||boxColorG.equals("#FFFFFF")){
			boxColorG="";
		}
		if(boxColorDd==null||boxColorDd.equals("#FFFFFF")){
			boxColorDd="";
		}
		if(boxColorEe==null||boxColorEe.equals("#FFFFFF")){
			boxColorEe="";
		}
		if(boxColorFf==null||boxColorFf.equals("#FFFFFF")){
			boxColorFf="";
		}
		if(boxColorFfs==null||boxColorFfs.equals("#FFFFFF")){
			boxColorFfs="";
		}
		if(namKey==null||namKey.equals("#FFFFFF")){
			namKey="";
		}
		if(namKeys==null||namKeys.equals("#FFFFFF")){
			namKeys="";
		}
		
		if(topFontColor==null||topFontColor.equals("#FFFFFF")){
			topFontColor="";
		}
		if(topFontColorR==null||topFontColorR.equals("#FFFFFF")){
			topFontColorR="";
		}
		if(topHovR==null||topHovR.equals("#FFFFFF")){
			topHovR="";
		}
		if(topFontLogo==null||topFontLogo.equals("#FFFFFF")){
			topFontLogo="";
		}
		if(navBtnBg==null||navBtnBg.equals("#FFFFFF")){
			navBtnBg="";
		}
		if(leftIconColB==null||leftIconColB.equals("#FFFFFF")){
			leftIconColB="";
		}
		if(leftIconColC==null||leftIconColC.equals("#FFFFFF")){
			leftIconColC="";
		}
		if(leftTextColA==null||leftTextColA.equals("#FFFFFF")){
			leftTextColA="";
		}
		if(leftTextColB==null||leftTextColB.equals("#FFFFFF")){
			leftTextColB="";
		}
		if(leftTextColC==null||leftTextColC.equals("#FFFFFF")){
			leftTextColC="";
		}
		if(leftColorHovB==null||leftColorHovB.equals("#FFFFFF")){
			leftColorHovB="";
		}
		if(leftColorHovC==null||leftColorHovC.equals("#FFFFFF")){
			leftColorHovC="";
		}
		if(mainNavCol==null||mainNavCol.equals("#FFFFFF")){
			mainNavCol="";
		}
		if(navMainBg==null||navMainBg.equals("#FFFFFF")){
			navMainBg="";
		}
		if(contentBg==null||contentBg.equals("#FFFFFF")){
			contentBg="";
		}
		session.setAttribute("boxColorA", boxColorA);
		session.setAttribute("boxColorB", boxColorB);
		session.setAttribute("boxColorC", boxColorC);
		session.setAttribute("boxColorD", boxColorD);
		session.setAttribute("boxColorE", boxColorE);
		session.setAttribute("boxColorF", boxColorF);
		session.setAttribute("boxColorG", boxColorG);
		session.setAttribute("boxColorDd", boxColorDd);
		session.setAttribute("boxColorEe", boxColorEe);
		session.setAttribute("boxColorFf", boxColorFf);
		session.setAttribute("boxColorFfs", boxColorFfs);
		session.setAttribute("namKey", namKey);
		
		session.setAttribute("namKeys", namKeys);
		session.setAttribute("topFontColor", topFontColor);
		session.setAttribute("topFontColorR", topFontColorR);
		session.setAttribute("topHovR", topHovR);
		session.setAttribute("topFontLogo", topFontLogo);
		session.setAttribute("navBtnBg", navBtnBg);
		session.setAttribute("leftIconColB", leftIconColB);
		session.setAttribute("leftIconColC", leftIconColC);
		session.setAttribute("leftTextColA", leftTextColA);
		session.setAttribute("leftTextColB", leftTextColB);
		session.setAttribute("leftTextColC", leftTextColC);
		session.setAttribute("leftColorHovB", leftColorHovB);
		session.setAttribute("leftColorHovC", leftColorHovC);
		session.setAttribute("mainNavCol", mainNavCol);
		session.setAttribute("navMainBg", navMainBg);
		session.setAttribute("contentBg", contentBg);
		String res;
		try {
			Map<String,String> map=new HashMap<String,String>();
			map.put("yhdm", userEntity.getYhdm());
			map.put("boxColorA", boxColorA);
			map.put("boxColorB", boxColorB);
			map.put("boxColorC", boxColorC);
			map.put("boxColorD", boxColorD);
			map.put("boxColorE", boxColorE);
			map.put("boxColorF", boxColorF);
			map.put("boxColorG", boxColorG);
			map.put("boxColorDd", boxColorDd);
			map.put("boxColorEe", boxColorEe);
			map.put("boxColorFf", boxColorFf);
			map.put("boxColorFfs", boxColorFfs);
			map.put("namKey", namKey);
			
			map.put("namKeys", namKeys);
			map.put("topFontColor", topFontColor);
			map.put("topFontColorR", topFontColorR);
			map.put("topHovR", topHovR);
			map.put("topFontLogo", topFontLogo);
			map.put("navBtnBg", navBtnBg);
			map.put("leftIconColB", leftIconColB);
			map.put("leftIconColC", leftIconColC);
			map.put("leftTextColA", leftTextColA);
			map.put("leftTextColB", leftTextColB);
			map.put("leftTextColC", leftTextColC);
			map.put("leftColorHovB", leftColorHovB);
			map.put("leftColorHovC", leftColorHovC);
			map.put("mainNavCol", mainNavCol);
			map.put("navMainBg", navMainBg);
			map.put("contentBg", contentBg);
			
			map.put("skinName", skinName);
			map.put("skinId", skinId);
			map.put("syym", (String)session.getAttribute("syym"));
			//int count=skinService.querySkinSfyy(map);
			if(skinId!=null&&!"".equals(skinId)){
				skinService.updateSkinModel(map);
			}else{
				skinService.saveSkinModel(map);
			}
			res="1";
		} catch (Exception e) {
			e.printStackTrace();
			res="0";
		}
		return res;
	}
	
	//查询皮肤模板列表
	@RequestMapping("querySkinList")
	public String querySkinList(HttpSession session,Model model,String skintab,SkinPage skinPage){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		skinPage.setSyym((String)session.getAttribute("syym"));
		try {
			List<Map<String,String>> skinModellist=(List<Map<String,String>>)skinService.query(skinPage);
			//查当前用户的皮肤ID
			Map<String,String> map=new HashMap<String, String>();
			map.put("yhdm", userEntity.getYhdm());
			map.put("syym", (String)session.getAttribute("syym"));
			Map<String,String> skinMap=(Map<String,String>)skinService.querySkinUsed(map);
			model.addAttribute("skinModellist",skinModellist);
			model.addAttribute("skinMap",skinMap);
			model.addAttribute("skinPage",skinPage);
			model.addAttribute("jsdm",userEntity.getJsdm());
			model.addAttribute("skintab",skintab);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		String mbym;
		if(skinPage.getSyym().equals("commons/main/main_00")){
			mbym="/commons/skin/skinModelList00";
		}else if(skinPage.getSyym().equals("commons/main/main_09")){
			mbym="/commons/skin/skinModelList09";
		}else if(skinPage.getSyym().equals("commons/main/main_08")){
			mbym="/commons/skin/skinModelList_08";
		}else if(skinPage.getSyym().equals("commons/main/main_12")){
			mbym="/commons/skin/skinModelList_12";
		}else{
			mbym="/commons/skin/skinModelList";
		}
		return mbym;
	}
	//选择皮肤
	@ResponseBody
	@RequestMapping("chooseSkin")
	public Map<String,String> chooseSkin(HttpSession session,Model model,String skinId){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		Map<String,String> res;
		try {
			Map<String,String> map=new HashMap<String, String>();
			map.put("yhdm",userEntity.getYhdm());
			map.put("skinId",skinId);
			map.put("syym", userEntity.getDlzylj());
			skinService.chooseSkin(map);
			Map<String,String> map1=new HashMap<String, String>();
            Map<String,String> skin=new HashMap<String, String>();
            map1.put("yhdm", userEntity.getYhdm());
            map1.put("syym", userEntity.getDlzylj());
            skin=skinService.querySkin(map1);
            if(skin!=null && !skin.isEmpty()){
        	   session.setAttribute("boxColorA", skin.get("BOXCOLORA"));
       		   session.setAttribute("boxColorB", skin.get("BOXCOLORB"));
       		   session.setAttribute("boxColorC", skin.get("BOXCOLORC"));
       		   session.setAttribute("boxColorD", skin.get("BOXCOLORD"));
       		   session.setAttribute("boxColorE", skin.get("BOXCOLORE"));
       		   session.setAttribute("boxColorF", skin.get("BOXCOLORF"));
       		   session.setAttribute("boxColorG", skin.get("BOXCOLORG"));
       		   session.setAttribute("boxColorDd", skin.get("BOXCOLORDD"));
       		   session.setAttribute("boxColorEe", skin.get("BOXCOLOREE"));
       		   session.setAttribute("boxColorFf", skin.get("BOXCOLORFF"));
       		   session.setAttribute("boxColorFfs", skin.get("BOXCOLORFFS"));
        	   session.setAttribute("namKey", skin.get("NAMKEY"));
        	  
        	   session.setAttribute("namKeys", skin.get("NAMKEYS"));
        	   session.setAttribute("topFontColor", skin.get("TOPFONTCOLOR"));
        	   session.setAttribute("topFontColorR", skin.get("TOPFONTCOLORR"));
        	   session.setAttribute("topHovR", skin.get("TOPHOVR"));
        	   session.setAttribute("topFontLogo", skin.get("TOPFONTLOGO"));
        	   session.setAttribute("navBtnBg", skin.get("NAVBTNBG"));
        	   session.setAttribute("leftIconColB", skin.get("LEFTICONCOLB"));
        	   session.setAttribute("leftIconColC", skin.get("LEFTICONCOLC"));
        	   session.setAttribute("leftTextColA", skin.get("LEFTTEXTCOLA"));
        	   session.setAttribute("leftTextColB", skin.get("LEFTTEXTCOLB"));
        	   session.setAttribute("leftTextColC", skin.get("LEFTTEXTCOLC"));
        	   session.setAttribute("leftColorHovB", skin.get("LEFTCOLORHOVB"));
        	   session.setAttribute("leftColorHovC", skin.get("LEFTCOLORHOVC"));
        	   session.setAttribute("mainNavCol", skin.get("MAINNAVCOL"));
        	   session.setAttribute("navMainBg", skin.get("NAVMAINBG"));
        	   session.setAttribute("contentBg", skin.get("CONTENTBG"));
            }
			res=skin;
		} catch (Exception e) {
			e.printStackTrace();
			res=null;
		}
		return res;
	}
	//管理员删除皮肤模板
	@ResponseBody
	@RequestMapping("deleteSkin")
	public String deleteSkin(HttpSession session,Model model,String[] ids){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		String res;
		try {
			System.out.println(ids[0]);
			skinService.deleteSkin(ids);
			res="1";
		} catch (Exception e) {
			e.printStackTrace();
			res="0";
		}
		return res;
	}
	//重置为默认皮肤
	@ResponseBody
	@RequestMapping("redefault")
	public String redefault(HttpSession session,Model model){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		String res;
		try {
			Map<String,String> map=new HashMap<String, String>();
			map.put("yhdm",userEntity.getYhdm());
			map.put("syym", userEntity.getDlzylj());
			skinService.redefault(map);
			session.setAttribute("boxColorA", "#50b3ee");
    		session.setAttribute("boxColorB", "#74C2F2");
    		session.setAttribute("boxColorC", "#213047");
    		session.setAttribute("boxColorD", "#374B63");
    		session.setAttribute("boxColorE", "#213047");
    		session.setAttribute("boxColorF", "#2d3d56");
    		session.setAttribute("boxColorG", "#50b3ee");
    		session.setAttribute("boxColorDd", "#666");
    		session.setAttribute("boxColorEe", "transparent");
    		session.setAttribute("boxColorFf", "#f1b458");
    		session.setAttribute("boxColorFfs", "#3371ad");
     	    session.setAttribute("namKey", "");
     	    
     	    session.setAttribute("namKeys", "#ACB2B8");
			session.setAttribute("topFontColor", "FFFFFF");
			session.setAttribute("topFontColorR", "FFFFFF");
			session.setAttribute("topHovR", "#50B3EE");
			session.setAttribute("topFontLogo", "#FFFFFF");
			session.setAttribute("navBtnBg", "#2D3D56");
			session.setAttribute("leftIconColB", "#50B3EE");
			session.setAttribute("leftIconColC", "#50B3EE");
			session.setAttribute("leftTextColA", "#FFFFFF");
			session.setAttribute("leftTextColB", "#FFFFFF");
			session.setAttribute("leftTextColC", "#FFFFFF");
			session.setAttribute("leftColorHovB", "#2D3D56");
			session.setAttribute("leftColorHovC", "#2D3D56");
			session.setAttribute("mainNavCol", "#ACB2B8");
			session.setAttribute("navMainBg", "#FAFAFA");
			session.setAttribute("contentBg", "#FFFFFF");
			res=(String)session.getAttribute("syym");
			
		} catch (Exception e) {
			e.printStackTrace();
			res="0";
		}
		return res;
	}
	
	@ResponseBody
	@RequestMapping("choose00")
	public String saveSkin00(HttpSession session,Model model,String pfbj){
		UserEntity userEntity = (UserEntity)session.getAttribute(WebConstants.CURRENT_USER);
		session.setAttribute("skinname", pfbj);
		String res;
		try {
			Map<String,String> map=new HashMap<String,String>();
			map.put("yhdm", userEntity.getYhdm());
			map.put("pfbj", pfbj);
			map.put("syym", userEntity.getDlzylj());
			skinService.chooseSkin00(map);
			res=pfbj;
		} catch (Exception e) {
			e.printStackTrace();
			res=pfbj;
		}
		return res;
	}
	
}

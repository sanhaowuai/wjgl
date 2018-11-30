package com.incon.project.common.skin.page;

import com.incon.framework.page.Page;
/**
 * @类名：com.incon.project.common.jsgl.page.JsglPage
 * @作者：杨文龙
 * @时间：2014-3-11
 * @版本：
 * @描述：教师管理
 */
@SuppressWarnings("all")
public class SkinPage extends Page{

	
	private String yhdm;	//用户代码
	private String namKey;	//
	private String boxcolorA;	//
	private String boxcolorB;	//
	private String boxcolorC;	//
	private String boxcolorD;	//
	private String boxcolorE;	//
	private String boxcolorF;	//
	private String boxcolorG;	//
	private String boxcolorDd;	//
	private String boxcolorEe;	//
	private String boxcolorFf;	//
	private String boxcolorFfs;	//
	
	private String namKeys;	//
	private String topFontColor;	//
	private String topFontColorR;	//
	private String topHovR;	//
	private String topFontLogo;	//
	private String navBtnBg;	//
	private String leftIconColB;	//
	private String leftIconColC;	//
	private String leftTextColA;	//
	private String leftTextColB;	//
	private String leftTextColC;	//
	private String leftColorHovB;	//
	private String leftColorHovC;	//
	private String mainNavCol;	//
	private String navMainBg;	//
	private String contentBg;	//
	private String skinId;	//
	private String skinName;	//皮肤名
	private String sfky;	//是否可用
	private String syym;	//使用页面
	
	public String getTopHovR() {
		return topHovR;
	}

	public void setTopHovR(String topHovR) {
		this.topHovR = topHovR;
	}

	public String getNamKeys() {
		return namKeys;
	}

	public void setNamKeys(String namKeys) {
		this.namKeys = namKeys;
	}

	public String getTopFontColor() {
		return topFontColor;
	}

	public void setTopFontColor(String topFontColor) {
		this.topFontColor = topFontColor;
	}

	public String getTopFontColorR() {
		return topFontColorR;
	}

	public void setTopFontColorR(String topFontColorR) {
		this.topFontColorR = topFontColorR;
	}

	public String getTopFontLogo() {
		return topFontLogo;
	}

	public void setTopFontLogo(String topFontLogo) {
		this.topFontLogo = topFontLogo;
	}

	public String getNavBtnBg() {
		return navBtnBg;
	}

	public void setNavBtnBg(String navBtnBg) {
		this.navBtnBg = navBtnBg;
	}

	public String getLeftIconColB() {
		return leftIconColB;
	}

	public void setLeftIconColB(String leftIconColB) {
		this.leftIconColB = leftIconColB;
	}

	public String getLeftIconColC() {
		return leftIconColC;
	}

	public void setLeftIconColC(String leftIconColC) {
		this.leftIconColC = leftIconColC;
	}

	public String getLeftTextColA() {
		return leftTextColA;
	}

	public void setLeftTextColA(String leftTextColA) {
		this.leftTextColA = leftTextColA;
	}

	public String getLeftTextColB() {
		return leftTextColB;
	}

	public void setLeftTextColB(String leftTextColB) {
		this.leftTextColB = leftTextColB;
	}

	public String getLeftTextColC() {
		return leftTextColC;
	}

	public void setLeftTextColC(String leftTextColC) {
		this.leftTextColC = leftTextColC;
	}

	public String getLeftColorHovB() {
		return leftColorHovB;
	}

	public void setLeftColorHovB(String leftColorHovB) {
		this.leftColorHovB = leftColorHovB;
	}

	public String getLeftColorHovC() {
		return leftColorHovC;
	}

	public void setLeftColorHovC(String leftColorHovC) {
		this.leftColorHovC = leftColorHovC;
	}

	public String getMainNavCol() {
		return mainNavCol;
	}

	public void setMainNavCol(String mainNavCol) {
		this.mainNavCol = mainNavCol;
	}

	public String getNavMainBg() {
		return navMainBg;
	}

	public void setNavMainBg(String navMainBg) {
		this.navMainBg = navMainBg;
	}

	public String getContentBg() {
		return contentBg;
	}

	public void setContentBg(String contentBg) {
		this.contentBg = contentBg;
	}

	public SkinPage(){
		this.setSql("skin.querySkinPage"); 
		this.setSqlCount("skin.querySkinPageCount");
	}

	public String getYhdm() {
		return yhdm;
	}

	public void setYhdm(String yhdm) {
		this.yhdm = yhdm;
	}

	public String getNamKey() {
		return namKey;
	}

	public void setNamkey(String namKey) {
		this.namKey = namKey;
	}

	public String getBoxcolorA() {
		return boxcolorA;
	}

	public void setBoxcolorA(String boxcolorA) {
		this.boxcolorA = boxcolorA;
	}

	public String getBoxcolorB() {
		return boxcolorB;
	}

	public void setBoxcolorB(String boxcolorB) {
		this.boxcolorB = boxcolorB;
	}

	public String getBoxcolorC() {
		return boxcolorC;
	}

	public void setBoxcolorC(String boxcolorC) {
		this.boxcolorC = boxcolorC;
	}

	public String getBoxcolorD() {
		return boxcolorD;
	}

	public void setBoxcolorD(String boxcolorD) {
		this.boxcolorD = boxcolorD;
	}

	public String getBoxcolorE() {
		return boxcolorE;
	}

	public void setBoxcolorE(String boxcolorE) {
		this.boxcolorE = boxcolorE;
	}

	public String getBoxcolorF() {
		return boxcolorF;
	}

	public void setBoxcolorF(String boxcolorF) {
		this.boxcolorF = boxcolorF;
	}

	public String getBoxcolorG() {
		return boxcolorG;
	}

	public void setBoxcolorG(String boxcolorG) {
		this.boxcolorG = boxcolorG;
	}

	public String getSkinId() {
		return skinId;
	}

	public void setSkinid(String skinId) {
		this.skinId = skinId;
	}

	public String getSkinName() {
		return skinName;
	}

	public void setSkinName(String skinName) {
		this.skinName = skinName;
	}

	public String getSfky() {
		return sfky;
	}

	public void setSfky(String sfky) {
		this.sfky = sfky;
	}

	public String getBoxcolorDd() {
		return boxcolorDd;
	}

	public void setBoxcolorDd(String boxcolorDd) {
		this.boxcolorDd = boxcolorDd;
	}

	public String getBoxcolorEe() {
		return boxcolorEe;
	}

	public void setBoxcolorEe(String boxcolorEe) {
		this.boxcolorEe = boxcolorEe;
	}

	public String getBoxcolorFf() {
		return boxcolorFf;
	}

	public void setBoxcolorFf(String boxcolorFf) {
		this.boxcolorFf = boxcolorFf;
	}

	public String getBoxcolorFfs() {
		return boxcolorFfs;
	}

	public void setBoxcolorFfs(String boxcolorFfs) {
		this.boxcolorFfs = boxcolorFfs;
	}

	public void setNamKey(String namKey) {
		this.namKey = namKey;
	}

	public void setSkinId(String skinId) {
		this.skinId = skinId;
	}

	public String getSyym() {
		return syym;
	}

	public void setSyym(String syym) {
		this.syym = syym;
	}
	
	
	
}

package com.incon.project.common.rygl.page;

import com.incon.framework.page.Page;

/**
 * @类名：com.incon.project.common.jsgl.page.JsglPage
 * @作者：杨文龙
 * @时间：2014-4-1
 * @版本：
 * @描述：教研室管理
 */
@SuppressWarnings("all")
public class JysQxPage extends Page{
	private String yhdm;	//用户代码
	private String jsdm;	//角色代码
	private String sfcjgly;	//是否超级管理员
	private String gljb;	//管理级别
	private String resultCount; //查询教研室数据权限表中是否有数据
	private String ids;
	private String idss;
	private String dmmc; //代码名称,查询用
	private String xydm;
	public JysQxPage(){
		this.setSql("ryjs.queryJysgl");
		this.setSqlCount("ryjs.queryJysglCount");
	}
	public String getDmmc() {
		return dmmc;
	}
	public void setDmmc(String dmmc) {
		this.dmmc = dmmc;
	}
	public String getYhdm() {
		return yhdm;
	}
	public void setYhdm(String yhdm) {
		this.yhdm = yhdm;
	}

	public String getSfcjgly() {
		return sfcjgly;
	}
	public void setSfcjgly(String sfcjgly) {
		this.sfcjgly = sfcjgly;
	}
	public String getGljb() {
		return gljb;
	}
	public void setGljb(String gljb) {
		this.gljb = gljb;
	}
	public String getResultCount() {
		return resultCount;
	}
	public void setResultCount(String resultCount) {
		this.resultCount = resultCount;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public String getXydm() {
		return xydm;
	}
	public void setXydm(String xydm) {
		this.xydm = xydm;
	}
	public String getIdss() {
		return idss;
	}
	public void setIdss(String idss) {
		this.idss = idss;
	}
	public String getJsdm() {
		return jsdm;
	}
	public void setJsdm(String jsdm) {
		this.jsdm = jsdm;
	}

}

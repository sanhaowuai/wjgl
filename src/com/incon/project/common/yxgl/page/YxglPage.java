package com.incon.project.common.yxgl.page;

import com.incon.framework.page.Page;

/**
 * 
 * @类名：  com.incon.project.common.yxgl.page.YxglPage
 * @创建人：杨文龙
 * @日期： 2014-3-19
 * @修改人：
 * @日期：
 * @描述： 院系管理
 * @版本号：
 */
public class YxglPage extends Page{
	private String dmmc; //院系名称
	
	private String yhdm;	//用户代码
	private Integer jsdm;	//角色代码
	private String sfcjgly;	//是否超级管理员
	private String gljb;	//管理级别
	public YxglPage(){
		this.setSql("yxgl.queryYx");
		this.setSqlCount("yxgl.queryYxCount");		
	}
	public String getDmmc() {
		return dmmc;
	}
	public void setDmmc(String dmmc) {
		this.dmmc = dmmc;
	}
	public String getGljb() {
		return gljb;
	}
	public void setGljb(String gljb) {
		this.gljb = gljb;
	}
	public String getYhdm() {
		return yhdm;
	}
	public void setYhdm(String yhdm) {
		this.yhdm = yhdm;
	}
	public Integer getJsdm() {
		return jsdm;
	}
	public void setJsdm(Integer jsdm) {
		this.jsdm = jsdm;
	}
	public String getSfcjgly() {
		return sfcjgly;
	}
	public void setSfcjgly(String sfcjgly) {
		this.sfcjgly = sfcjgly;
	}
	
}

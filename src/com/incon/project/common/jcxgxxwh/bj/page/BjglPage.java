package com.incon.project.common.jcxgxxwh.bj.page;

import com.incon.framework.page.Page;

/**
 * @类名：com.incon.project.common.jsgl.page.JsglPage
 * @作者：杨文龙
 * @时间：2014-4-1
 * @版本：
 * @描述：班级管理
 */
@SuppressWarnings("all")
public class BjglPage extends Page{

	private String yhdm;	//用户代码
	private Integer jsdm;	//角色代码
	private String sfcjgly;	//是否超级管理员
	private String gljb;	//管理级别
	private String dmmc; //代码名称,查询用
	public BjglPage(){
		this.setSql("bjgl.queryBjgl");
		this.setSqlCount("bjgl.queryBjglCount");
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
	public String getGljb() {
		return gljb;
	}
	public void setGljb(String gljb) {
		this.gljb = gljb;
	}

}

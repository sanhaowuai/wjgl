package com.incon.project.common.xsgl.page;

import com.incon.framework.page.Page;

/**
 * 
 * @类名：com.incon.project.common.xsgl.page.PtxzXsPage
 * @创建人：安智博
 * @日期：2016-8-10
 * @描述：
 */
@SuppressWarnings("all")
public class PtxzXsPage extends Page{

	private String dmmc;
	public String getDmmc() {
		return dmmc;
	}
	public void setDmmc(String dmmc) {
		this.dmmc = dmmc;
	}
	private String xsyxdm; //学生院系代码
	private String xszydm; //学生专业代码
	private String xsxh; //学生学号
	private String xsxm; //学生姓名
	private String xsxdm; //学生系代码
	private String xsbjdm;	//学生班级代码
	private String yhdm;	//用户代码
	private Integer jsdm;	//角色代码
	private String sfcjgly;	//是否超级管理员
	private String gljb;	//管理级别
	public PtxzXsPage(){
		this.setSql("xsgl.queryPtxzXs"); 
		this.setSqlCount("xsgl.queryPtxzXsCount");
	}
	public String getXsyxdm() {
		return xsyxdm;
	}
	public void setXsyxdm(String xsyxdm) {
		this.xsyxdm = xsyxdm;
	}
	public String getXszydm() {
		return xszydm;
	}
	public void setXszydm(String xszydm) {
		this.xszydm = xszydm;
	}
	public String getXsxh() {
		return xsxh;
	}
	public void setXsxh(String xsxh) {
		this.xsxh = xsxh;
	}
	public String getXsxm() {
		return xsxm;
	}
	public void setXsxm(String xsxm) {
		this.xsxm = xsxm;
	}
	public String getXsxdm() {
		return xsxdm;
	}
	public void setXsxdm(String xsxdm) {
		this.xsxdm = xsxdm;
	}
	public String getXsbjdm() {
		return xsbjdm;
	}
	public void setXsbjdm(String xsbjdm) {
		this.xsbjdm = xsbjdm;
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

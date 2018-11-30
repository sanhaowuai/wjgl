package com.incon.project.common.xsgl.page;

import com.incon.framework.page.Page;

/**
 * @类名：com.incon.project.common.xsgl.page.XsglPage
 * @作者：杨文龙
 * @时间：2014-3-11
 * @版本：
 * @描述：学生管理
 */
@SuppressWarnings("all")
public class XsglPage extends Page{

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
	private String xsnjdm;//学生年级代码
	public String getXsnjdm() {
		return xsnjdm;
	}
	public void setXsnjdm(String xsnjdm) {
		this.xsnjdm = xsnjdm;
	}
	private String yhdm;	//用户代码
	private Integer jsdm;	//角色代码
	private String sfcjgly;	//是否超级管理员
	private String gljb;	//管理级别
	public XsglPage(){
		this.setSql("xsgl.queryXsgl"); 
		this.setSqlCount("xsgl.queryXsglCount");
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

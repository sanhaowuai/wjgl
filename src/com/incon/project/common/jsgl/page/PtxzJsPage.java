package com.incon.project.common.jsgl.page;

import com.incon.framework.page.Page;
/**
 * 
 * @类名：com.incon.project.common.jsgl.page.PtxzJsPage
 * @创建人：安智博
 * @日期：2016-8-10
 * @描述：
 */
@SuppressWarnings("all")
public class PtxzJsPage extends Page{

	
	private String yhdm;	//用户代码
	private Integer jsdm;	//角色代码
	private String sfcjgly;	//是否超级管理员
	private String gljb;	//管理级别
	private String resultCount; //查询教研室数据权限表中是否有数据
	
	
	private String jszgh; //教师教师号
	private String jsyxdm; //教师院系代码
	private String dmmc; //教师姓名
	private String jsjysdm;	//教师教研室代码
	
	
	private String pjszgh; //教师教师号
	private String pjsyxdm; //教师院系代码
	private String pdmmc; //教师姓名
	private String pjsjysdm;	//教师教研室代码
	
	
	public PtxzJsPage(){
		this.setSql("jsgl.queryPtxzJs"); 
		this.setSqlCount("jsgl.queryPtxzJsCount");
	}
	
	public String getPjszgh() {
		return pjszgh;
	}

	public void setPjszgh(String pjszgh) {
		this.pjszgh = pjszgh;
	}

	public String getPjsyxdm() {
		return pjsyxdm;
	}

	public void setPjsyxdm(String pjsyxdm) {
		this.pjsyxdm = pjsyxdm;
	}

	public String getPdmmc() {
		return pdmmc;
	}

	public void setPdmmc(String pdmmc) {
		this.pdmmc = pdmmc;
	}

	public String getPjsjysdm() {
		return pjsjysdm;
	}

	public void setPjsjysdm(String pjsjysdm) {
		this.pjsjysdm = pjsjysdm;
	}

	public String getJszgh() {
		return jszgh;
	}

	public void setJszgh(String jszgh) {
		this.jszgh = jszgh;
	}

	public String getJsyxdm() {
		return jsyxdm;
	}
	public void setJsyxdm(String jsyxdm) {
		this.jsyxdm = jsyxdm;
	}

	public String getDmmc() {
		return dmmc;
	}

	public void setDmmc(String dmmc) {
		this.dmmc = dmmc;
	}

	public String getJsjysdm() {
		return jsjysdm;
	}

	public void setJsjysdm(String jsjysdm) {
		this.jsjysdm = jsjysdm;
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

	public String getResultCount() {
		return resultCount;
	}

	public void setResultCount(String resultCount) {
		this.resultCount = resultCount;
	}
	
}

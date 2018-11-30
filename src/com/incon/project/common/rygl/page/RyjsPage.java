package com.incon.project.common.rygl.page;

import com.incon.framework.page.Page;

/**
 * @类名：com.incon.project.common.rygl.page.RyjsPage
 * @作者：樊旭
 * @时间：2014-3-17
 * @版本：
 * @描述：人员角色管理
 */
@SuppressWarnings("all")
public class RyjsPage extends Page {
	private String xm;    //姓名
	private String jsdm;  //角色代码
	private String sfcjgly; //是否超级管理员 1是0否
	private String glyx; //管理院系
	private String yhdm;	//用户代码
	private String yhjsdm;	//用户角色代码
	private String gljb;//管理级别
	private String yxdm;
	
	public RyjsPage(){
		this.setSql("ryjs.queryRyjs");
		this.setSqlCount("ryjs.queryCount");
	}
	
	public String getYxdm() {
		return yxdm;
	}

	public void setYxdm(String yxdm) {
		this.yxdm = yxdm;
	}

	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getJsdm() {
		return jsdm;
	}
	public void setJsdm(String jsdm) {
		this.jsdm = jsdm;
	}
	public String getSfcjgly() {
		return sfcjgly;
	}
	public void setSfcjgly(String sfcjgly) {
		this.sfcjgly = sfcjgly;
	}
	public String getGlyx() {
		return glyx;
	}
	public void setGlyx(String glyx) {
		this.glyx = glyx;
	}
	public String getYhdm() {
		return yhdm;
	}
	public void setYhdm(String yhdm) {
		this.yhdm = yhdm;
	}
	public String getYhjsdm() {
		return yhjsdm;
	}
	public void setYhjsdm(String yhjsdm) {
		this.yhjsdm = yhjsdm;
	}
	public String getGljb() {
		return gljb;
	}
	public void setGljb(String gljb) {
		this.gljb = gljb;
	}
	
}

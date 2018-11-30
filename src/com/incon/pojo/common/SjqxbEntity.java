package com.incon.pojo.common;

import java.io.Serializable;

/**
 * 
 * @类名： com.incon.pojo.common.SjqxbEntity
 * @创建人： 樊旭
 * @日期： 2014-3-19
 * @修改人：
 * @日期：
 * @描述： 数据权限表(DM_SJQXB)
 * @版本号：
 */
public class SjqxbEntity implements Serializable{
	private String yxdm;        //院系代码
	private String yxmc;        //院系名称
	private String sjyxdm;      //上级院系代码
	private String checked;       //判断是否已被选中  false未选中 true选中
	private String jsdm;        //角色代码
	private String yhdm;        //用户代码
	private String dlr;         //登录人
	private String sfcjgly;     //是否超级管理员
	private String glyx;       //管理员系
	private String treedm;	    
	private String treefdm;
	private String gljb;//管理级别
	
	private String dlrjsdm;		//登陆人角色代码
	public String getYxdm() {
		return yxdm;
	}
	public void setYxdm(String yxdm) {
		this.yxdm = yxdm;
	}
	public String getYxmc() {
		return yxmc;
	}
	public void setYxmc(String yxmc) {
		this.yxmc = yxmc;
	}
	public String getSjyxdm() {
		return sjyxdm;
	}
	public void setSjyxdm(String sjyxdm) {
		this.sjyxdm = sjyxdm;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	public String getJsdm() {
		return jsdm;
	}
	public void setJsdm(String jsdm) {
		this.jsdm = jsdm;
	}
	public String getYhdm() {
		return yhdm;
	}
	public void setYhdm(String yhdm) {
		this.yhdm = yhdm;
	}
	public String getTreedm() {
		return treedm;
	}
	public void setTreedm(String treedm) {
		this.treedm = treedm;
	}
	public String getTreefdm() {
		return treefdm;
	}
	public void setTreefdm(String treefdm) {
		this.treefdm = treefdm;
	}
	public String getDlr() {
		return dlr;
	}
	public void setDlr(String dlr) {
		this.dlr = dlr;
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
	public String getDlrjsdm() {
		return dlrjsdm;
	}
	public void setDlrjsdm(String dlrjsdm) {
		this.dlrjsdm = dlrjsdm;
	}
	public String getGljb() {
		return gljb;
	}
	public void setGljb(String gljb) {
		this.gljb = gljb;
	}
	
}

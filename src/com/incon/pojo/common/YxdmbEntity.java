package com.incon.pojo.common;

import java.io.Serializable;

/**
 * 
 * @类名： com.incon.pojo.common.YxdmbEntity
 * @修改人：
 * @日期：
 * @描述： 院系代码表(DM_YXDMB)
 * @版本号：
 */
@SuppressWarnings("all")
public class YxdmbEntity implements Serializable{

	private String yxdm; //院系代码
	private String yxmc; //院系名称
	private String yxjc; //院系简称
	private String zjm;//助记码
	private String yxywmc; //院系英文名称
	private String sjyxdm; //上级院系代码,若是顶级则为‘0’
	private String sfglbm;//是否管理部门
	private String sfyxs;//是否有学生
	private String sfkkbm;//是否开课部门
	private String sxh;//顺序号(排序用)
	private String kyf; //可用否 0 否 1 是
	private String xjsl;	//下级数量
	private String checked;
	private Integer jsdm ;//角色代码
	private String yhdm;//用户代码
	public String getXjsl() {
		return xjsl;
	}
	public void setXjsl(String xjsl) {
		this.xjsl = xjsl;
	}
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
	public String getYxjc() {
		return yxjc;
	}
	public void setYxjc(String yxjc) {
		this.yxjc = yxjc;
	}
	public String getZjm() {
		return zjm;
	}
	public void setZjm(String zjm) {
		this.zjm = zjm;
	}
	public String getYxywmc() {
		return yxywmc;
	}
	public void setYxywmc(String yxywmc) {
		this.yxywmc = yxywmc;
	}
	public String getSjyxdm() {
		return sjyxdm;
	}
	public void setSjyxdm(String sjyxdm) {
		this.sjyxdm = sjyxdm;
	}
	public String getSfglbm() {
		return sfglbm;
	}
	public void setSfglbm(String sfglbm) {
		this.sfglbm = sfglbm;
	}
	public String getSfyxs() {
		return sfyxs;
	}
	public void setSfyxs(String sfyxs) {
		this.sfyxs = sfyxs;
	}
	public String getSfkkbm() {
		return sfkkbm;
	}
	public void setSfkkbm(String sfkkbm) {
		this.sfkkbm = sfkkbm;
	}
	public String getSxh() {
		return sxh;
	}
	public void setSxh(String sxh) {
		this.sxh = sxh;
	}
	public String getKyf() {
		return kyf;
	}
	public void setKyf(String kyf) {
		this.kyf = kyf;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	
	public Integer getJsdm() {
		return jsdm;
	}
	public void setJsdm(Integer jsdm) {
		this.jsdm = jsdm;
	}
	public String getYhdm() {
		return yhdm;
	}
	public void setYhdm(String yhdm) {
		this.yhdm = yhdm;
	}
	
	
}

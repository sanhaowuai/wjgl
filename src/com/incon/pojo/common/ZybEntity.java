package com.incon.pojo.common;

import java.io.Serializable;

/**
 * 
 * @类名： com.incon.pojo.common.ZybEntity
 * @创建人： 杨文龙
 * @日期： 2014-3-11
 * @修改人：
 * @日期：
 * @描述： 专业表(DM_ZYB)
 * @版本号：
 */
@SuppressWarnings("all")
public class ZybEntity implements Serializable{
	private String id;
	private String zydm; //专业代码
	private String zymc; //专业名称
	private String zyjc; //专业简称
	private String zjm; //助记码
	private String zyywmc; //专业英文名称
	private String zylb; //专业类别
	private String ssy; //所属院
	private String ssx; //所属系
	private String glyx; //管理院系
	private String xz; //学制
	private String xw; //学位
	private String gjzydm; //国家专业代码
	private int yxj; //优先级
	private String pycc; //培养层次
	private String yxmc; //院系名称
	private String kyf; //可用否 0 否 1 是
	private String flag;	//判断是否选中
	public String getZydm() {
		return zydm;
	}
	public void setZydm(String zydm) {
		this.zydm = zydm;
	}
	public String getZymc() {
		return zymc;
	}
	public void setZymc(String zymc) {
		this.zymc = zymc;
	}
	public String getZyjc() {
		return zyjc;
	}
	public void setZyjc(String zyjc) {
		this.zyjc = zyjc;
	}
	public String getZjm() {
		return zjm;
	}
	public void setZjm(String zjm) {
		this.zjm = zjm;
	}
	public String getZyywmc() {
		return zyywmc;
	}
	public void setZyywmc(String zyywmc) {
		this.zyywmc = zyywmc;
	}
	public String getZylb() {
		return zylb;
	}
	public void setZylb(String zylb) {
		this.zylb = zylb;
	}
	public String getSsy() {
		return ssy;
	}
	public void setSsy(String ssy) {
		this.ssy = ssy;
	}
	public String getSsx() {
		return ssx;
	}
	public void setSsx(String ssx) {
		this.ssx = ssx;
	}
	public String getGlyx() {
		return glyx;
	}
	public void setGlyx(String glyx) {
		this.glyx = glyx;
	}
	public String getXz() {
		return xz;
	}
	public void setXz(String xz) {
		this.xz = xz;
	}
	public String getXw() {
		return xw;
	}
	public void setXw(String xw) {
		this.xw = xw;
	}
	public String getGjzydm() {
		return gjzydm;
	}
	public void setGjzydm(String gjzydm) {
		this.gjzydm = gjzydm;
	}
	public int getYxj() {
		return yxj;
	}
	public void setYxj(int yxj) {
		this.yxj = yxj;
	}
	public String getPycc() {
		return pycc;
	}
	public void setPycc(String pycc) {
		this.pycc = pycc;
	}
	public String getYxmc() {
		return yxmc;
	}
	public void setYxmc(String yxmc) {
		this.yxmc = yxmc;
	}
	public String getKyf() {
		return kyf;
	}
	public void setKyf(String kyf) {
		this.kyf = kyf;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	
}

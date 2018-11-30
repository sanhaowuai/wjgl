package com.incon.pojo.common;

import java.io.Serializable;

/**
 * 
 * @类名： com.incon.pojo.common.AnbEntity
 * @创建人： 杨文龙
 * @日期： 2014-3-12
 * @修改人：
 * @日期：
 * @描述： 按钮表(DM_ANB)
 * @版本号：
 */
@SuppressWarnings("all")
public class AnbEntity implements Serializable{

	private String andm; //按钮代码
	private String qxdm; //权限代码
	private String anmc; //按钮名称
	private String andh; //按钮代号
	private String qxmc; //权限名称
	
	private String fwlj;//访问路径
	private String icon;//图标
	private String xssx,tcfs,title,kyf;
	
	public String getQxmc() {
		return qxmc;
	}
	public void setQxmc(String qxmc) {
		this.qxmc = qxmc;
	}
	public String getAndm() {
		return andm;
	}
	public void setAndm(String andm) {
		this.andm = andm;
	}
	public String getQxdm() {
		return qxdm;
	}
	public void setQxdm(String qxdm) {
		this.qxdm = qxdm;
	}
	public String getAnmc() {
		return anmc;
	}
	public void setAnmc(String anmc) {
		this.anmc = anmc;
	}
	public String getAndh() {
		return andh;
	}
	public void setAndh(String andh) {
		this.andh = andh;
	}
	public String getFwlj() {
		return fwlj;
	}
	public void setFwlj(String fwlj) {
		this.fwlj = fwlj;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getXssx() {
		return xssx;
	}
	public void setXssx(String xssx) {
		this.xssx = xssx;
	}
	public String getTcfs() {
		return tcfs;
	}
	public void setTcfs(String tcfs) {
		this.tcfs = tcfs;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getKyf() {
		return kyf;
	}
	public void setKyf(String kyf) {
		this.kyf = kyf;
	}
	
}

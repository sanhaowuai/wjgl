package com.incon.pojo.common;

import java.io.Serializable;

public class XyzybEntity implements Serializable{

	private String xydm; //所属学院
	private String xdm; //系代码
	private String zydm; //专业代码
	private String zymc; //专业名称
	private String glyx;	//管理院系
	private String kyf; //可用否
	public String getXydm() {
		return xydm;
	}
	public void setXydm(String xydm) {
		this.xydm = xydm;
	}
	public String getXdm() {
		return xdm;
	}
	public void setXdm(String xdm) {
		this.xdm = xdm;
	}
	public String getZydm() {
		return zydm;
	}
	public void setZydm(String zydm) {
		this.zydm = zydm;
	}
	public String getKyf() {
		return kyf;
	}
	public void setKyf(String kyf) {
		this.kyf = kyf;
	}
	public String getZymc() {
		return zymc;
	}
	public void setZymc(String zymc) {
		this.zymc = zymc;
	}
	public String getGlyx() {
		return glyx;
	}
	public void setGlyx(String glyx) {
		this.glyx = glyx;
	}
}

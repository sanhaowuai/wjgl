package com.incon.project.qkfkxt.qkfkycl.page;

import com.incon.framework.page.Page;

public class QkfkyclPage extends Page {
	public String  xtdm, bglx,jjcddm,zt,sqrdm,wz1,wz2,yj,qssj,jssj,lzjsrdm,sqdh,bggs;  
	
	public String getSqdh() {
		return sqdh;
	}
	public void setSqdh(String sqdh) {
		this.sqdh = sqdh;
	}
	public String getBggs() {
		return bggs;
	}
	public void setBggs(String bggs) {
		this.bggs = bggs;
	}
	public String getQssj() {
		return qssj;
	}
	public void setQssj(String qssj) {
		this.qssj = qssj;
	}
	public String getJssj() {
		return jssj;
	}
	public void setJssj(String jssj) {
		this.jssj = jssj;
	}
	public String getLzjsrdm() {
		return lzjsrdm;
	}
	public void setLzjsrdm(String lzjsrdm) {
		this.lzjsrdm = lzjsrdm;
	}
	public String getYj() {
		return yj;
	}
	public void setYj(String yj) {
		this.yj = yj;
	}
	public String getWz1() {
		return wz1;
	}
	public void setWz1(String wz1) {
		this.wz1 = wz1;
	}
	public String getWz2() {
		return wz2;
	}
	public void setWz2(String wz2) {
		this.wz2 = wz2;
	}
	public String getSqrdm() {
		return sqrdm;
	}
	public void setSqrdm(String sqrdm) {
		this.sqrdm = sqrdm;
	}
	public String getXtdm() {
		return xtdm;
	}
	public void setXtdm(String xtdm) {
		this.xtdm = xtdm;
	}
	public String getBglx() {
		return bglx;
	}
	public void setBglx(String bglx) {
		this.bglx = bglx;
	}
	public String getJjcddm() {
		return jjcddm;
	}
	public void setJjcddm(String jjcddm) {
		this.jjcddm = jjcddm;
	}
	public String getZt() {
		return zt;
	}
	public void setZt(String zt) {
		this.zt = zt;
	}
	public QkfkyclPage(){
	this.setSql("qkfkycl.queryqkfkList");
		this.setSqlCount("qkfkycl.queryqkfkListCount");
	}
}

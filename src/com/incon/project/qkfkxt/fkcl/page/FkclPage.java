/*
 * 文件名：XtglPage.java
 * 版权：Copyright 2011-2015 Libowei Tech. Co. Ltd. All Rights Reserved. 
 * 描述： XtglPage.java
 * 修改人：Administrator
 * 修改时间：2015-5-2
 * 修改内容：新增
 */
package com.incon.project.qkfkxt.fkcl.page;

import com.incon.framework.page.Page;


@SuppressWarnings("all")
public class FkclPage extends Page
{


    public FkclPage()
    {
        this.setSql("fkcl.queryFkcl");
        this.setSqlCount("fkcl.queryFkclCount");
    }
    public String xtdm;
    public String bglxdm;
    public String jjcddm;
    public String sqzt;
    public String yhdm;
    public String sqdh;
    public String wz1;
    public String wz2;
    public String qssj;
    public String jssj;
    public String lzjsrxmm;
    
   
	public String getLzjsrxmm() {
		return lzjsrxmm;
	}
	public void setLzjsrxmm(String lzjsrxmm) {
		this.lzjsrxmm = lzjsrxmm;
	}
	public String getBggs() {
		return bggs;
	}
	public void setBggs(String bggs) {
		this.bggs = bggs;
	}
	public String lzjsrdm;
    public String bggs;
	public String getLzjsrdm() {
		return lzjsrdm;
	}
	public void setLzjsrdm(String lzjsrdm) {
		this.lzjsrdm = lzjsrdm;
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
	public String getXtdm() {
		return xtdm;
	}
	public void setXtdm(String xtdm) {
		this.xtdm = xtdm;
	}
	public String getBglxdm() {
		return bglxdm;
	}
	public void setBglxdm(String bglxdm) {
		this.bglxdm = bglxdm;
	}
	public String getJjcddm() {
		return jjcddm;
	}
	public void setJjcddm(String jjcddm) {
		this.jjcddm = jjcddm;
	}
	public String getSqzt() {
		return sqzt;
	}
	public void setSqzt(String sqzt) {
		this.sqzt = sqzt;
	}
	public String getYhdm() {
		return yhdm;
	}
	public void setYhdm(String yhdm) {
		this.yhdm = yhdm;
	}
	public String getSqdh() {
		return sqdh;
	}
	public void setSqdh(String sqdh) {
		this.sqdh = sqdh;
	}


	

}

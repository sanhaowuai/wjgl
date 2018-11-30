package com.incon.project.common.gzljcsz.page;

import com.incon.framework.page.Page;

public class YwlcBlPage extends Page{
	private String fhdm,ywlcmc,bldm, blmc, ywlcdm, kyf, bllx, format, xtdm, ywlcbbh,zt;

	public String getFhdm() {
		return fhdm;
	}

	public void setFhdm(String fhdm) {
		this.fhdm = fhdm;
	}

	public String getYwlcmc() {
		return ywlcmc;
	}

	public void setYwlcmc(String ywlcmc) {
		this.ywlcmc = ywlcmc;
	}

	public String getZt() {
		return zt;
	}

	public void setZt(String zt) {
		this.zt = zt;
	}

	public String getBldm() {
		return bldm;
	}

	public void setBldm(String bldm) {
		this.bldm = bldm;
	}

	public String getBlmc() {
		return blmc;
	}

	public void setBlmc(String blmc) {
		this.blmc = blmc;
	}

	public String getYwlcdm() {
		return ywlcdm;
	}

	public void setYwlcdm(String ywlcdm) {
		this.ywlcdm = ywlcdm;
	}

	public String getKyf() {
		return kyf;
	}

	public void setKyf(String kyf) {
		this.kyf = kyf;
	}

	public String getBllx() {
		return bllx;
	}

	public void setBllx(String bllx) {
		this.bllx = bllx;
	}

	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}

	public String getXtdm() {
		return xtdm;
	}

	public void setXtdm(String xtdm) {
		this.xtdm = xtdm;
	}

	public String getYwlcbbh() {
		return ywlcbbh;
	}

	public void setYwlcbbh(String ywlcbbh) {
		this.ywlcbbh = ywlcbbh;
	}
	public YwlcBlPage()
	{
		this.setSql("gzljcsz.queryYwlcBl");
		this.setSqlCount("gzljcsz.queryYwlcBlCount");
	}

}

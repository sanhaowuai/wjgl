package com.incon.pojo.common.gzljcsz;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class YwDmxlhEntity  implements Serializable{
	 
	private String ywlcdm;
	private String ywlcmc;
	private String ywlcshcklj;
	private String swxqcklj;
	private String ywbm;
	private String ywbdbrzdm;
	private String kyf;
	private String ywlclb;
	private String xtdm;
	private String dmmc;
	private String ywlcbbh;
	private String ywlclbdm;
	private String ywbidzdm;
	
	private List<YwlcYmxlhEntity> listlc=new ArrayList<YwlcYmxlhEntity>();
	
	private List<YwlcBlxlhEnntity> listbl=new ArrayList<YwlcBlxlhEnntity>();
	
	
	public List<YwlcYmxlhEntity> getListlc() {
		return listlc;
	}
	public void setListlc(List<YwlcYmxlhEntity> listlc) {
		this.listlc = listlc;
	}
	public List<YwlcBlxlhEnntity> getListbl() {
		return listbl;
	}
	public void setListbl(List<YwlcBlxlhEnntity> listbl) {
		this.listbl = listbl;
	}
	public String getYwbidzdm() {
		return ywbidzdm;
	}
	public void setYwbidzdm(String ywbidzdm) {
		this.ywbidzdm = ywbidzdm;
	}
	public String getYwlclbdm() {
		return ywlclbdm;
	}
	public void setYwlclbdm(String ywlclbdm) {
		this.ywlclbdm = ywlclbdm;
	}
	public String getYwlcbbh() {
		return ywlcbbh;
	}
	public void setYwlcbbh(String ywlcbbh) {
		this.ywlcbbh = ywlcbbh;
	}
	public String getYwlcdm() {
		return ywlcdm;
	}
	public void setYwlcdm(String ywlcdm) {
		this.ywlcdm = ywlcdm;
	}
	public String getYwlcmc() {
		return ywlcmc;
	}
	public void setYwlcmc(String ywlcmc) {
		this.ywlcmc = ywlcmc;
	}
	public String getYwlcshcklj() {
		return ywlcshcklj;
	}
	public void setYwlcshcklj(String ywlcshcklj) {
		this.ywlcshcklj = ywlcshcklj;
	}
	public String getSwxqcklj() {
		return swxqcklj;
	}
	public void setSwxqcklj(String swxqcklj) {
		this.swxqcklj = swxqcklj;
	}
	public String getYwbm() {
		return ywbm;
	}
	public void setYwbm(String ywbm) {
		this.ywbm = ywbm;
	}
	public String getYwbdbrzdm() {
		return ywbdbrzdm;
	}
	public void setYwbdbrzdm(String ywbdbrzdm) {
		this.ywbdbrzdm = ywbdbrzdm;
	}
	public String getKyf() {
		return kyf;
	}
	public void setKyf(String kyf) {
		this.kyf = kyf;
	}
	public String getYwlclb() {
		return ywlclb;
	}
	public void setYwlclb(String ywlclb) {
		this.ywlclb = ywlclb;
	}
	public String getXtdm() {
		return xtdm;
	}
	public void setXtdm(String xtdm) {
		this.xtdm = xtdm;
	}
	public String getDmmc() {
		return dmmc;
	}
	public void setDmmc(String dmmc) {
		this.dmmc = dmmc;
	}

}

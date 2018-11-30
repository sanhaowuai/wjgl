package com.incon.pojo.common.zxtwh;

/**
 * 体系统维护实体
 * pt_xt_zxtb
 * @author zjn
 *
 */
public class ZxtwhEntity {

	private String dm;  //	varchar2(200)			
	private String xtmc;  //	varchar2(200)			
	private String xtdm;  //	varchar2(200)			
	private String fwlj;  //	varchar2(200)			
	private String kyf;  //	char(1)			
	private String appid;  //	varchar2(200)	y		appid（手机端用）
	private String xtlx;  //	char(1)	y		系统类型（0：bs；1：手机）
	private String icon;
	private String xssx;//显示顺序
	
	private String sfxz;//是否选择
	
	
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getSfxz() {
		return sfxz;
	}
	public void setSfxz(String sfxz) {
		this.sfxz = sfxz;
	}
	public String getDm() {
		return dm;
	}
	public void setDm(String dm) {
		this.dm = dm;
	}
	public String getXtmc() {
		return xtmc;
	}
	public void setXtmc(String xtmc) {
		this.xtmc = xtmc;
	}
	public String getXtdm() {
		return xtdm;
	}
	public void setXtdm(String xtdm) {
		this.xtdm = xtdm;
	}
	public String getFwlj() {
		return fwlj;
	}
	public void setFwlj(String fwlj) {
		this.fwlj = fwlj;
	}
	public String getKyf() {
		return kyf;
	}
	public void setKyf(String kyf) {
		this.kyf = kyf;
	}
	public String getAppid() {
		return appid;
	}
	public void setAppid(String appid) {
		this.appid = appid;
	}
	public String getXtlx() {
		return xtlx;
	}
	public void setXtlx(String xtlx) {
		this.xtlx = xtlx;
	}
	public String getXssx() {
		return xssx;
	}
	public void setXssx(String xssx) {
		this.xssx = xssx;
	}
	
}

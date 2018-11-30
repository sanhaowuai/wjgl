package com.incon.pojo.common;
/**
 * 
 * @类名：com.incon.pojo.common.ZxtbEntity
 * @创建人：安智博
 * @日期：2016-9-1
 * @描述：PT_子系统表(PT_XT_ZXTB)
 */
public class ZxtbEntity {
	private String dm;		//varchar2(200)	n			
	private String xtmc;	//varchar2(200)	n			
	private String xtdm;	//varchar2(200)	n			
	private String fwlj;	//varchar2(200)	n			
	private String kyf;		//char(1)	n			
	private String appid;	//varchar2(200)	y			appid（手机端用）
	private String xtlx;	//char(1)	y			系统类型（0：bs；1：手机）
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

}

package com.incon.pojo.common.shoujcd;

public class PtappqxbEntity {
	private String qxdm;	//carchar2(50)	n			权限代码
	private String qxmc;	//varchar2(200)	y			权限名称
	private String icon;	//varchar2(50)	y			icon（图标）
	private String appurl;	//varchar2(200)	y			appurl
	private String wz;		//varchar2(10)	y			位置（l：左、r：右、c：中、b：下）
	private String xsxx;	//number		y			显示顺序
	private String zxtdm;	//varchar2(50)	y			子系统代码

	private String sfxz;	//是否选中
	private String jsdm;	//角色代码

	public String getQxdm() {
		return qxdm;
	}

	public void setQxdm(String qxdm) {
		this.qxdm = qxdm;
	}

	public String getQxmc() {
		return qxmc;
	}

	public void setQxmc(String qxmc) {
		this.qxmc = qxmc;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getAppurl() {
		return appurl;
	}

	public void setAppurl(String appurl) {
		this.appurl = appurl;
	}

	public String getWz() {
		return wz;
	}

	public void setWz(String wz) {
		this.wz = wz;
	}

	public String getXsxx() {
		return xsxx;
	}

	public void setXsxx(String xsxx) {
		this.xsxx = xsxx;
	}

	public String getZxtdm() {
		return zxtdm;
	}

	public void setZxtdm(String zxtdm) {
		this.zxtdm = zxtdm;
	}

	public String getSfxz() {
		return sfxz;
	}

	public void setSfxz(String sfxz) {
		this.sfxz = sfxz;
	}

	public String getJsdm() {
		return jsdm;
	}

	public void setJsdm(String jsdm) {
		this.jsdm = jsdm;
	}
}

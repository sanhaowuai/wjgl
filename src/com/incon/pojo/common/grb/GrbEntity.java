package com.incon.pojo.common.grb;

public class GrbEntity {
	private String xtdm;//	varchar2(50)			系统代码
	private String yhdm;//	varchar2(50)			用户代码
	private String jsdm;//	varchar2(50)			角色代码
	private String qxdm;//	varchar2(50)			权限代码
	private String xssx;//	number	y		显示顺序
	private String id;//	varchar2(50)	y		id删除用
	
	private String qxmc;	//显示:菜单名称
	private String fwlj;	//显示：访问路径
	private String sfzxj;	//是否最下级
	
	public String getXtdm() {
		return xtdm;
	}
	public void setXtdm(String xtdm) {
		this.xtdm = xtdm;
	}
	public String getYhdm() {
		return yhdm;
	}
	public void setYhdm(String yhdm) {
		this.yhdm = yhdm;
	}
	public String getJsdm() {
		return jsdm;
	}
	public void setJsdm(String jsdm) {
		this.jsdm = jsdm;
	}
	public String getQxdm() {
		return qxdm;
	}
	public void setQxdm(String qxdm) {
		this.qxdm = qxdm;
	}
	public String getXssx() {
		return xssx;
	}
	public void setXssx(String xssx) {
		this.xssx = xssx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQxmc() {
		return qxmc;
	}
	public void setQxmc(String qxmc) {
		this.qxmc = qxmc;
	}
	public String getFwlj() {
		return fwlj;
	}
	public void setFwlj(String fwlj) {
		this.fwlj = fwlj;
	}
	public String getSfzxj() {
		return sfzxj;
	}
	public void setSfzxj(String sfzxj) {
		this.sfzxj = sfzxj;
	}

	
	
}

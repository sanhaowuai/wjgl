package com.incon.pojo.common.gzlgwgl;

public class GzlgwglEntity {

	
	private String gwdm;	//VARCHAR2(50)			岗位代码
	private String gwmc;	//VARCHAR2(500)	Y		岗位名称
	private String kyf;	//VARCHAR2(2)	Y		可用否
	private String xtdm;	//VARCHAR2(50)			系统代码
	private String sjgwdm;	//VARCHAR2(50)	Y		上级岗位代码(最上级-1)
	private String ssyx;	//VARCHAR2(50)	Y		所属院系
	private String treedm;
	private String treefdm;
	private String ssyxmc;
	private String sfzzdj;
	
	public String getSfzzdj() {
		return sfzzdj;
	}
	public void setSfzzdj(String sfzzdj) {
		this.sfzzdj = sfzzdj;
	}
	public String getSsyxmc() {
		return ssyxmc;
	}
	public void setSsyxmc(String ssyxmc) {
		this.ssyxmc = ssyxmc;
	}
	public String getSjgwdm() {
		return sjgwdm;
	}
	public void setSjgwdm(String sjgwdm) {
		this.sjgwdm = sjgwdm;
	}
	public String getTreedm() {
		return treedm;
	}
	public void setTreedm(String treedm) {
		this.treedm = treedm;
	}
	public String getTreefdm() {
		return treefdm;
	}
	public void setTreefdm(String treefdm) {
		this.treefdm = treefdm;
	}
	public String getGwdm() {
		return gwdm;
	}
	public void setGwdm(String gwdm) {
		this.gwdm = gwdm;
	}
	public String getGwmc() {
		return gwmc;
	}
	public void setGwmc(String gwmc) {
		this.gwmc = gwmc;
	}
	public String getKyf() {
		return kyf;
	}
	public void setKyf(String kyf) {
		this.kyf = kyf;
	}
	public String getXtdm() {
		return xtdm;
	}
	public void setXtdm(String xtdm) {
		this.xtdm = xtdm;
	}
	
	public String getSsyx() {
		return ssyx;
	}
	public void setSsyx(String ssyx) {
		this.ssyx = ssyx;
	}

	
	
}

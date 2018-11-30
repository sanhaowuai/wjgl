package com.incon.pojo.common;

import java.io.Serializable;

/**
 * 
 * @类名： com.incon.pojo.common.QxbEntity
 * @创建人： 杨文龙
 * @日期： 2014-3-18
 * @修改人：
 * @日期：
 * @描述： 按钮表(DM_QXB)
 * @版本号：
 */
public class QxbEntity implements Serializable{

	private String qxdm; //权限代码
	private String qxmc; //权限名称
	private String xssx; //显示顺序
	private String fqxdm; //父权限代码
	private String fwlj; //访问路径
	private Integer xtdm; //所属系统
	private String kyf; //可用否
	private String bz; //备注
	private String sfzxj;	//是否最下级
	private String jb;	//级别
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
	public String getXssx() {
		return xssx;
	}
	public void setXssx(String xssx) {
		this.xssx = xssx;
	}
	public String getFqxdm() {
		return fqxdm;
	}
	public void setFqxdm(String fqxdm) {
		this.fqxdm = fqxdm;
	}
	public String getFwlj() {
		return fwlj;
	}
	public void setFwlj(String fwlj) {
		this.fwlj = fwlj;
	}
	public Integer getXtdm() {
		return xtdm;
	}
	public void setXtdm(Integer xtdm) {
		this.xtdm = xtdm;
	}
	public String getKyf() {
		return kyf;
	}
	public void setKyf(String kyf) {
		this.kyf = kyf;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getSfzxj() {
		return sfzxj;
	}
	public void setSfzxj(String sfzxj) {
		this.sfzxj = sfzxj;
	}
	public String getJb() {
		return jb;
	}
	public void setJb(String jb) {
		this.jb = jb;
	}
	
}

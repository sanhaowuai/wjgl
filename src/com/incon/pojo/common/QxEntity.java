package com.incon.pojo.common;

import java.io.Serializable;
/**
 * 
 * @类名：  com.incon.pojo.common.qxcdgl.QxcdglEntity
 * @创建人： 樊旭
 * @日期： 2014-3-11
 * @修改人：
 * @日期：
 * @描述：  权限表
 * @版本号：
 */
@SuppressWarnings("all")
public class QxEntity implements Serializable{
	private String qxdm;      //权限代码
	private String qxmc;      //权限名称
	private String xssx;      //显示顺序
	private String fqxdm;     //父权限代码
	private String fqxmc;     //父权限名称
	private String fwlj;      //访问路径
	private String kyf;       //可用否
	private String sfzxj;     //是否最下级 1:是 0:否
	private String treedm;
	private String treefdm;
	private String icon;
	private String tcfs;
	private String qxdm2;
	private String id;
	
	 
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
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
	public String getFqxmc() {
		return fqxmc;
	}
	public void setFqxmc(String fqxmc) {
		this.fqxmc = fqxmc;
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
	public String getSfzxj() {
		return sfzxj;
	}
	public void setSfzxj(String sfzxj) {
		this.sfzxj = sfzxj;
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
	public String getQxdm2() {
		return qxdm2;
	}
	public void setQxdm2(String qxdm2) {
		this.qxdm2 = qxdm2;
	}
 
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getTcfs() {
		return tcfs;
	}
	public void setTcfs(String tcfs) {
		this.tcfs = tcfs;
	}
 
 
}

package com.incon.pojo.common;

import java.io.Serializable;

/**
 * 
 * @类名：  com.incon.pojo.common.RyjsqxbEntity
 * @创建人： 樊旭
 * @日期： 2014-3-17
 * @修改人：
 * @日期：
 * @描述：  人员角色权限表
 * @版本号：
 */
@SuppressWarnings("all")
public class RyjsqxbEntity implements Serializable{
	private String ryjsqxdm;      //人员角色权限代码
	private String jsdm;          //角色代码
	private String qxdm;          //权限代码
	private String yhdm;          //用户代码
	private String xm;            //姓名
	private String yx;            //院系
	private String xb;            //性别
	private String js;            //角色
	private String sfzxj;         //判断 1：人员角色权限表  2：人员角色按钮表
	private String sscddm;        //所属菜单代码
	private String fqxdm;         //父权限代码
	private String cjr;           //创建人
	private String sfcjgly;       //是否超级管理员 1是0否
	
	private Integer dqJsdm;//当前登录人的角色代码
	private String dqYhdm ;//当前登录人的用户代码
	public String getRyjsqxdm() {
		return ryjsqxdm;
	}
	public void setRyjsqxdm(String ryjsqxdm) {
		this.ryjsqxdm = ryjsqxdm;
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
	public String getYhdm() {
		return yhdm;
	}
	public void setYhdm(String yhdm) {
		this.yhdm = yhdm;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getYx() {
		return yx;
	}
	public void setYx(String yx) {
		this.yx = yx;
	}
	public String getXb() {
		return xb;
	}
	public void setXb(String xb) {
		this.xb = xb;
	}
	public String getJs() {
		return js;
	}
	public void setJs(String js) {
		this.js = js;
	}
	public String getSfzxj() {
		return sfzxj;
	}
	public void setSfzxj(String sfzxj) {
		this.sfzxj = sfzxj;
	}
	public String getSscddm() {
		return sscddm;
	}
	public void setSscddm(String sscddm) {
		this.sscddm = sscddm;
	}
	public String getFqxdm() {
		return fqxdm;
	}
	public void setFqxdm(String fqxdm) {
		this.fqxdm = fqxdm;
	}
	public String getCjr() {
		return cjr;
	}
	public void setCjr(String cjr) {
		this.cjr = cjr;
	}
	public String getSfcjgly() {
		return sfcjgly;
	}
	public void setSfcjgly(String sfcjgly) {
		this.sfcjgly = sfcjgly;
	}
	public Integer getDqJsdm() {
		return dqJsdm;
	}
	public void setDqJsdm(Integer dqJsdm) {
		this.dqJsdm = dqJsdm;
	}
	public String getDqYhdm() {
		return dqYhdm;
	}
	public void setDqYhdm(String dqYhdm) {
		this.dqYhdm = dqYhdm;
	}
	
}

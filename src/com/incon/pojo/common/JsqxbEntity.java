package com.incon.pojo.common;

import java.io.Serializable;

/**
 * 
 * @类名：  com.incon.pojo.common.JsqxbEntity
 * @创建人： 樊旭
 * @日期： 2014-3-14
 * @修改人：
 * @日期：
 * @描述：  角色权限表
 * @版本号：
 */
public class JsqxbEntity implements Serializable{
	private String jsdm;    //角色代码
	private String qxdm;    //权限代码
	private String jsqxdm;  //角色权限代码
	private String sfmrkf;  //是否默认开放
	private String fqxdm;   //父权限代码
	private String sfcjgly;       //是否超级管理员 1是0否
	
	private Integer dqJsdm;//当前登录人的角色代码
	private String dqYhdm ;//当前登录人的用户代码
	
	private Integer reCount;//查询人员角色权限表中是否有记录
	
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
	public String getJsqxdm() {
		return jsqxdm;
	}
	public void setJsqxdm(String jsqxdm) {
		this.jsqxdm = jsqxdm;
	}
	public String getSfmrkf() {
		return sfmrkf;
	}
	public void setSfmrkf(String sfmrkf) {
		this.sfmrkf = sfmrkf;
	}
	public String getFqxdm() {
		return fqxdm;
	}
	public void setFqxdm(String fqxdm) {
		this.fqxdm = fqxdm;
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
	public Integer getReCount() {
		return reCount;
	}
	public void setReCount(Integer reCount) {
		this.reCount = reCount;
	}
	
	
}

package com.incon.pojo.common;

import java.io.Serializable;

/**
 * 
 * @类名：  com.incon.pojo.common.JsanbEntity
 * @创建人： 于洋
 * @日期： 2014-3-20
 * @修改人：
 * @日期：
 * @描述：  角色按钮表
 * @版本号：
 */
@SuppressWarnings("all")
public class JsanbEntity implements Serializable{
	private String jsandm;		//角色按钮代码
	private String jsdm;		//角色代码
	private String andm;		//按钮代码
	private String sscddm;		//所属菜单代码
	private String xtdm;		//系统代码
	
	
	private String sfcjgly;       //是否超级管理员 1是0否
	
	private Integer dqJsdm;//当前登录人的角色代码
	private String dqYhdm ;//当前登录人的用户代码
	private Integer reCount;//查询人员角色权限表中是否有记录
	
	/** get set */
	public String getJsandm() {
		return jsandm;
	}
	
	public void setJsandm(String jsandm) {
		this.jsandm = jsandm;
	}
	
	public String getJsdm() {
		return jsdm;
	}
	
	public void setJsdm(String jsdm) {
		this.jsdm = jsdm;
	}
	
	public String getAndm() {
		return andm;
	}
	
	public void setAndm(String andm) {
		this.andm = andm;
	}
	
	public String getSscddm() {
		return sscddm;
	}
	
	public void setSscddm(String sscddm) {
		this.sscddm = sscddm;
	}
	
	public String getXtdm() {
		return xtdm;
	}
	
	public void setXtdm(String xtdm) {
		this.xtdm = xtdm;
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

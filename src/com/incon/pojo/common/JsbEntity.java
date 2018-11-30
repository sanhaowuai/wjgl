package com.incon.pojo.common;

import java.io.Serializable;

/**
 * 
 * @类名：  com.incon.pojo.common.JsbEntity
 * @创建人： 于洋
 * @日期： 2014-3-13
 * @修改人：
 * @日期：
 * @描述：  角色表
 * @版本号：
 */
@SuppressWarnings("all")
public class JsbEntity implements Serializable{
	private String jsdm;	//角色代码
	private String jsmc;	//角色名称
	private String kyf;		//可用否
	private String sfsd;	//是否锁定
	private String dlzylj;	//登录主页链接
	private String xtdm;	//系统代码
	private String ms;		//描述
	private String sfcjgly; //是否超级管理员
	private String checked;	//是否选中
	private String fjsdm;	//父角色代码
	
	/** get set */
	public String getJsdm() {
		return jsdm;
	}
	
	public void setJsdm(String jsdm) {
		this.jsdm = jsdm;
	}
	
	public String getJsmc() {
		return jsmc;
	}
	
	public void setJsmc(String jsmc) {
		this.jsmc = jsmc;
	}
	
	public String getKyf() {
		return kyf;
	}
	
	public void setKyf(String kyf) {
		this.kyf = kyf;
	}
	
	public String getSfsd() {
		return sfsd;
	}
	
	public void setSfsd(String sfsd) {
		this.sfsd = sfsd;
	}
	
	public String getDlzylj() {
		return dlzylj;
	}
	
	public void setDlzylj(String dlzylj) {
		this.dlzylj = dlzylj;
	}
	
	public String getXtdm() {
		return xtdm;
	}
	
	public void setXtdm(String xtdm) {
		this.xtdm = xtdm;
	}
	
	public String getMs() {
		return ms;
	}
	
	public void setMs(String ms) {
		this.ms = ms;
	}

	public String getSfcjgly() {
		return sfcjgly;
	}

	public void setSfcjgly(String sfcjgly) {
		this.sfcjgly = sfcjgly;
	}

	public String getChecked() {
		return checked;
	}

	public void setChecked(String checked) {
		this.checked = checked;
	}

	public String getFjsdm() {
		return fjsdm;
	}

	public void setFjsdm(String fjsdm) {
		this.fjsdm = fjsdm;
	}
}

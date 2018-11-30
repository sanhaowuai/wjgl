package com.incon.pojo.common;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @类名：  com.incon.pojo.common.RyjsbEntity
 * @创建人： 樊旭
 * @日期： 2014-3-17
 * @修改人：
 * @日期：
 * @描述：  人员角色表
 * @版本号：
 */
@SuppressWarnings("all")
public class RyjsbEntity implements Serializable{
	private String ryjsdm;       //人员角色代码
	private String yhdm;		 //用户代码
	private String jsdm;         //角色代码
	private String gljb;         //管理级别
	private String cjr;			 //创建人
	private Date cjsj;			 //创建时间
	private String xm;           //姓名
	private String xb;           //性别
	private String jsmc;         //角色名称
	private String checked;      //判断是否有次角色 1有 0没有
	private String mrjs;         //默认角色 1默认 0不默认
	private String sfcjgly;      //是否超级管理员
	private String dlr;          //登录人
	public String getRyjsdm() {
		return ryjsdm;
	}
	public void setRyjsdm(String ryjsdm) {
		this.ryjsdm = ryjsdm;
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
	public String getGljb() {
		return gljb;
	}
	public void setGljb(String gljb) {
		this.gljb = gljb;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getXb() {
		return xb;
	}
	public void setXb(String xb) {
		this.xb = xb;
	}
	public String getJsmc() {
		return jsmc;
	}
	public void setJsmc(String jsmc) {
		this.jsmc = jsmc;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	public String getMrjs() {
		return mrjs;
	}
	public void setMrjs(String mrjs) {
		this.mrjs = mrjs;
	}
	public String getCjr() {
		return cjr;
	}
	public void setCjr(String cjr) {
		this.cjr = cjr;
	}
	public Date getCjsj() {
		return cjsj;
	}
	public void setCjsj(Date cjsj) {
		this.cjsj = cjsj;
	}
	public String getSfcjgly() {
		return sfcjgly;
	}
	public void setSfcjgly(String sfcjgly) {
		this.sfcjgly = sfcjgly;
	}
	public String getDlr() {
		return dlr;
	}
	public void setDlr(String dlr) {
		this.dlr = dlr;
	}
}

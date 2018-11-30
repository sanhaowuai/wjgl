package com.incon.pojo.common;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @类名：  com.incon.pojo.common.RzEntity
 * @创建人： 樊旭
 * @日期： 2016-8-10
 * @修改人：高阳 
 * @日期：
 * @描述：  日志表
 * @版本号：
 */
@SuppressWarnings("all")
public class RzEntity implements Serializable{	
	private String czr;        //操作日
	private String czsj;       //操作时间
	private String czff;       //操作方法
	private String czffms;     //操作方法描述
	private String cs;         //参数
	private String czrip;      //操作人ip
	private String czrjs;      //操作人角色
	//新增字段
	private String rzbdm;      //	varchar2(50)			日志表代码，主键自增
	private String xtdm;       //	varchar2(50)			系统代码
	
	
	public String getCzr() {
		return czr;
	}
	public void setCzr(String czr) {
		this.czr = czr;
	}
	
	public String getCzsj() {
		return czsj;
	}
	public void setCzsj(String czsj) {
		this.czsj = czsj;
	}
	public String getCzff() {
		return czff;
	}
	public void setCzff(String czff) {
		this.czff = czff;
	}
	public String getCzffms() {
		return czffms;
	}
	public void setCzffms(String czffms) {
		this.czffms = czffms;
	}
	public String getCs() {
		return cs;
	}
	public void setCs(String cs) {
		this.cs = cs;
	}
	public String getCzrip() {
		return czrip;
	}
	public void setCzrip(String czrip) {
		this.czrip = czrip;
	}
	public String getCzrjs() {
		return czrjs;
	}
	public void setCzrjs(String czrjs) {
		this.czrjs = czrjs;
	}
	public String getRzbdm() {
		return rzbdm;
	}
	public void setRzbdm(String rzbdm) {
		this.rzbdm = rzbdm;
	}
	public String getXtdm() {
		return xtdm;
	}
	public void setXtdm(String xtdm) {
		this.xtdm = xtdm;
	}
	
}

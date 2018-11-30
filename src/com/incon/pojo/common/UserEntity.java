package com.incon.pojo.common;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 
 * @类名：  com.incon.pojo.common.UserEntity
 * @创建人： 于洋
 * @日期： 2014-3-10
 * @修改人：
 * @日期：
 * @描述：  用户表
 * @版本号：
 */
@SuppressWarnings("all")
public class UserEntity implements Serializable{
	private Integer dldm;	//登录代码
	private String yhdm;	//用户登录名
	private String mm;		//密码
	private String xm;		//姓名
	private Integer jsdm;	//角色代码
	private String yhlx;	//用户类型
	private String dlzylj;	//登录主页路径
	private String jsmc;	//角色名称
	private String qxdm;	//权限代码 main_02专用
	private String mrjs;    //默认角色
	private String sfcjgly; //是否超级管理员
	private String gljb;	//管理级别
	private String sfkdl;	//是否可登录
	private List<Map> cdMapList ; //访问菜单权限
	private List<Map> anMapList ; //访问按钮权限
	private String sfscdl;//是否首次登陆(1是；0否)
	private String inconqxdm ;//权限代码
	/** get set */
	public Integer getDldm() {
		return dldm;
	}
	
	public void setDldm(Integer dldm) {
		this.dldm = dldm;
	}

	

	public String getYhdm() {
		return yhdm;
	}

	public void setYhdm(String yhdm) {
		this.yhdm = yhdm;
	}

	public String getMm() {
		return mm;
	}
	
	public void setMm(String mm) {
		this.mm = mm;
	}
	
	public String getXm() {
		return xm;
	}
	
	public void setXm(String xm) {
		this.xm = xm;
	}
	
	public Integer getJsdm() {
		return jsdm;
	}

	public void setJsdm(Integer jsdm) {
		this.jsdm = jsdm;
	}

	public String getYhlx() {
		return yhlx;
	}
	
	public void setYhlx(String yhlx) {
		this.yhlx = yhlx;
	}

	public String getDlzylj() {
		return dlzylj;
	}

	public void setDlzylj(String dlzylj) {
		this.dlzylj = dlzylj;
	}

	public String getJsmc() {
		return jsmc;
	}

	public void setJsmc(String jsmc) {
		this.jsmc = jsmc;
	}

	public String getQxdm() {
		return qxdm;
	}

	public void setQxdm(String qxdm) {
		this.qxdm = qxdm;
	}

	public String getMrjs() {
		return mrjs;
	}

	public void setMrjs(String mrjs) {
		this.mrjs = mrjs;
	}

	public String getSfcjgly() {
		return sfcjgly;
	}

	public void setSfcjgly(String sfcjgly) {
		this.sfcjgly = sfcjgly;
	}

	public String getGljb() {
		return gljb;
	}

	public void setGljb(String gljb) {
		this.gljb = gljb;
	}

	public List<Map> getCdMapList() {
		return cdMapList;
	}

	public void setCdMapList(List<Map> cdMapList) {
		this.cdMapList = cdMapList;
	}

	public List<Map> getAnMapList() {
		return anMapList;
	}

	public void setAnMapList(List<Map> anMapList) {
		this.anMapList = anMapList;
	}

	public String getSfkdl() {
		return sfkdl;
	}

	public void setSfkdl(String sfkdl) {
		this.sfkdl = sfkdl;
	}

	public String getSfscdl() {
		return sfscdl;
	}

	public void setSfscdl(String sfscdl) {
		this.sfscdl = sfscdl;
	}

	public String getInconqxdm() {
		return inconqxdm;
	}

	public void setInconqxdm(String inconqxdm) {
		this.inconqxdm = inconqxdm;
	}

 
}

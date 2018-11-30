package com.incon.project.common.juesgl.page;

import com.incon.framework.page.Page;

/**
 * 
 * @类名：  com.incon.project.common.juesgl.page.JuesglPage
 * @创建人： 于洋
 * @日期： 2014-3-14
 * @修改人：
 * @日期：
 * @描述： 角色管理
 * @版本号：
 */
public class JuesglPage extends Page{
	private String dmmc;	//角色代码名称（查询专用）
	private String sfcjgly;	//是否超级管理员
	private String yhdm;	//用户代码
	private String jsdm;	//角色代码
	
	/** get set */
	public String getDmmc() {
		return dmmc;
	}

	public void setDmmc(String dmmc) {
		this.dmmc = dmmc;
	}

	public String getSfcjgly() {
		return sfcjgly;
	}

	public void setSfcjgly(String sfcjgly) {
		this.sfcjgly = sfcjgly;
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
}

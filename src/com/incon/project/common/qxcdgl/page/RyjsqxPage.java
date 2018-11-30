package com.incon.project.common.qxcdgl.page;

import com.incon.framework.page.Page;

/**
 * @类名：com.incon.project.common.qxcdgl.page.RyjsqxPage
 * @作者：樊旭
 * @时间：2014-3-17
 * @版本：
 * @描述：人员角色权限管理
 */
public class RyjsqxPage extends Page {
	private String jsdms;      //角色代码
	private String jsdm;       //模糊查询使用的角色代码
	private String xm;         //姓名
	
	public RyjsqxPage(){
		this.setSql("qxcdgl.queryRyfp");
		this.setSqlCount("qxcdgl.queryRyfpCount");
	}

	public String getJsdms() {
		return jsdms;
	}

	public void setJsdms(String jsdms) {
		this.jsdms = jsdms;
	}

	public String getJsdm() {
		return jsdm;
	}

	public void setJsdm(String jsdm) {
		this.jsdm = jsdm;
	}

	public String getXm() {
		return xm;
	}

	public void setXm(String xm) {
		this.xm = xm;
	}
}

package com.incon.project.common.zjwh.page;

import com.incon.framework.page.Page;

/**
 * 
 * @类名：com.incon.project.common.zjwh.page.ZjwhJsqxPage
 * @修改人：
 * @日期：
 * @描述：  组件维护
 * @版本号：
 */
public class ZjwhJsqxPage extends Page {
	private String pzjmc;
	private String jsdm;
	private String qxlb;
//	public ZjwhJsqxPage() {
//		// TODO Auto-generated constructor stub
//		this.setSql("zjwh.queryZjwhJsqx");
//		this.setSqlCount("zjwh.queryZjwhJsqxCount");
//	}
	
	
	public String getPzjmc() {
		return pzjmc;
	}
	public String getQxlb() {
		return qxlb;
	}
	public void setQxlb(String qxlb) {
		this.qxlb = qxlb;
	}
	public void setPzjmc(String pzjmc) {
		this.pzjmc = pzjmc;
	}
	public String getJsdm() {
		return jsdm;
	}
	public void setJsdm(String jsdm) {
		this.jsdm = jsdm;
	}
	
	
}

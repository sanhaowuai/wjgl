package com.incon.project.common.zjwh.page;

import com.incon.framework.page.Page;

/**
 * 
 * @类名： com.incon.project.common.zjwh.page.ZjwhPage
 * @修改人：
 * @日期：
 * @描述：  组件维护
 * @版本号：
 */
@SuppressWarnings("all")
public class ZjwhPage extends Page {
	private String pzjmc;
	private String pqxlb;
	
	public ZjwhPage() {
		// TODO Auto-generated constructor stub
		this.setSql("zjwh.queryZjwh");
		this.setSqlCount("zjwh.queryZjwhCount");
	}
	public String getPzjmc() {
		return pzjmc;
	}
	public void setPzjmc(String pzjmc) {
		this.pzjmc = pzjmc;
	}
	public String getPqxlb() {
		return pqxlb;
	}
	public void setPqxlb(String pqxlb) {
		this.pqxlb = pqxlb;
	}
	
}

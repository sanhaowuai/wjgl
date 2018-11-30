package com.incon.project.common.gzljcsz.page;

import com.incon.framework.page.Page;

public class YxPage extends Page {
	private String yxmc;
	private String yxdm;
	public String getYxmc() {
		return yxmc;
	}
	public void setYxmc(String yxmc) {
		this.yxmc = yxmc;
	}
	public String getYxdm() {
		return yxdm;
	}
	public void setYxdm(String yxdm) {
		this.yxdm = yxdm;
	}
	public YxPage()
	{
		this.setSql("gzljcsz.queryAllyx");
		this.setSqlCount("gzljcsz.queryAllyxCount");
	}
	
}

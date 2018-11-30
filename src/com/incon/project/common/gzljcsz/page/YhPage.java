package com.incon.project.common.gzljcsz.page;

import com.incon.framework.page.Page;

public class YhPage  extends Page {
	
	private String yhdm;
	private String xm;
	public String getYhdm() {
		return yhdm;
	}
	public void setYhdm(String yhdm) {
		this.yhdm = yhdm;
	}

	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public YhPage()
	{
		this.setSql("gzljcsz.queryAllyh");
		this.setSqlCount("gzljcsz.queryAllyhCount");
	}

}

package com.incon.project.common.shoujcd.page;

import com.incon.framework.page.Page;

public class ShoujcdPage extends Page {

	private String qxmcPage;
	private String wzPage;
	private String zxtdmPage;
	
	 

	public String getQxmcPage() {
		return qxmcPage;
	}

	public void setQxmcPage(String qxmcPage) {
		this.qxmcPage = qxmcPage;
	}

	 

	public String getWzPage() {
		return wzPage;
	}

	public void setWzPage(String wzPage) {
		this.wzPage = wzPage;
	}

	public String getZxtdmPage() {
		return zxtdmPage;
	}

	public void setZxtdmPage(String zxtdmPage) {
		this.zxtdmPage = zxtdmPage;
	}

	public ShoujcdPage() {
		// TODO Auto-generated constructor stub
		this.setSql("shoujcd.queryQxb");
		this.setSqlCount("shoujcd.queryQxbCount");
	}
	
	 
	
}

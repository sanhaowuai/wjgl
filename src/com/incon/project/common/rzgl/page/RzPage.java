package com.incon.project.common.rzgl.page;

import com.incon.framework.page.Page;

public class RzPage extends Page {

	private String pczr;
	private String pczsjq;
	private String pczsjh;
	private String pczff;
	private String pczrjs;
	
	public RzPage() {
		// TODO Auto-generated constructor stub
		this.setSql("rz.queryRz");
		this.setSqlCount("rz.queryRzCount");
	}
	
	public String getPczr() {
		return pczr;
	}
	public void setPczr(String pczr) {
		this.pczr = pczr;
	}	
	public String getPczff() {
		return pczff;
	}
	public void setPczff(String pczff) {
		this.pczff = pczff;
	}

	public String getPczsjq() {
		return pczsjq;
	}

	public void setPczsjq(String pczsjq) {
		this.pczsjq = pczsjq;
	}

	public String getPczsjh() {
		return pczsjh;
	}

	public void setPczsjh(String pczsjh) {
		this.pczsjh = pczsjh;
	}

	public String getPczrjs() {
		return pczrjs;
	}

	public void setPczrjs(String pczrjs) {
		this.pczrjs = pczrjs;
	}
	
	
	
	
	
}

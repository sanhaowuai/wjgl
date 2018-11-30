package com.incon.project.common.jxb.page;

import com.incon.framework.page.Page;


public class JxbPage extends Page{

	private String keyWOrd;		//关键字
	private String CMWHETHERAVAILABLE;//可用否

	public JxbPage() {
		this.setSql("jxb.queryJxb");
		this.setSqlCount("jxb.queryJxbCount");
	}
	public String getKeyWOrd() {
		return keyWOrd;
	}

	public void setKeyWOrd(String keyWOrd) {
		this.keyWOrd = keyWOrd;
	}
	public String getCMWHETHERAVAILABLE() {
		return CMWHETHERAVAILABLE;
	}
	public void setCMWHETHERAVAILABLE(String cMWHETHERAVAILABLE) {
		CMWHETHERAVAILABLE = cMWHETHERAVAILABLE;
	}
	
	
}

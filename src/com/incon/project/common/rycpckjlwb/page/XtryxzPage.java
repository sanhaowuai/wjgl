package com.incon.project.common.rycpckjlwb.page;

import com.incon.framework.page.Page;

public class XtryxzPage extends Page {
	
	public XtryxzPage(){
		this.setSql("rycpckjlwb.queryXtryxz");
		this.setSqlCount("rycpckjlwb.queryXtryxzCount");
	}

	private String pxm;
	private String pzgh;
	
	public String getPxm() {
		return pxm;
	}
	public void setPxm(String pxm) {
		this.pxm = pxm;
	}
	public String getPzgh() {
		return pzgh;
	}
	public void setPzgh(String pzgh) {
		this.pzgh = pzgh;
	}
	
}

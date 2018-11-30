package com.incon.project.common.zxtwh.page;

import com.incon.framework.page.Page;

public class ZxtwhPage extends Page{

	public ZxtwhPage(){
		this.setSql("zxtwh.queryZxtwh");
		this.setSqlCount("zxtwh.queryZxtwhCount");
	}
	private String pzxtmc;//子系统名称
	
	public String getPzxtmc() {
		return pzxtmc;
	}
	public void setPzxtmc(String pzxtmc) {
		this.pzxtmc = pzxtmc;
	}
}

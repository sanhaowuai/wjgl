package com.incon.common.customImpOrExp.page;

import com.incon.framework.page.Page;

public class CustomImpOrExpPage extends Page{
	
	private String ywmc;
	private String roleid;
	
	public CustomImpOrExpPage (){
		this.setSql("customImpOrExp.queryCustomImpOrExp");
		this.setSqlCount("customImpOrExp.queryCustomImpOrExpCount");
	}
	
	public String getRoleid() {
		return roleid;
	}

	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}

	public String getYwmc() {
		return ywmc;
	}

	public void setYwmc(String ywmc) {
		this.ywmc = ywmc;
	}
	
	

}

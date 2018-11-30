package com.incon.project.common.gzljcsz.page;

import com.incon.framework.page.Page;

public class JueSePage extends Page{
	
	public String jsmc;//角色名称
	
	public JueSePage()
	{
		this.setSql("gzljcsz.queryJueSe");
		this.setSqlCount("gzljcsz.queryJueSeCount");
	}
	public String getJsmc() {
		return jsmc;
	}
	public void setJsmc(String jsmc) {
		this.jsmc = jsmc;
	}
	 

}
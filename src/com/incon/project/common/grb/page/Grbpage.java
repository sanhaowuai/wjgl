package com.incon.project.common.grb.page;

import com.incon.framework.page.Page;

public class Grbpage extends Page {

	
	public Grbpage() {
		// TODO Auto-generated constructor stub
		this.setSql("grb.queryGrb");
		this.setSqlCount("grb.queryGrbCount");
	}
}

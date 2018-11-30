package com.incon.project.common.rycpckjlwb.page;

import com.incon.framework.page.Page;

public class RycpckjlwbPage extends Page {
	
	private String pyhdm;	//用户代码/用户姓名
	private String pyylx;	//应用类型
	public RycpckjlwbPage() {
		// TODO Auto-generated constructor stub
		this.setSql("rycpckjlwb.queryRycpckjlwb");
		this.setSqlCount("rycpckjlwb.queryRycpckjlwbCount");
	}
	public String getPyhdm() {
		return pyhdm;
	}
	public void setPyhdm(String pyhdm) {
		this.pyhdm = pyhdm;
	}
	public String getPyylx() {
		return pyylx;
	}
	public void setPyylx(String pyylx) {
		this.pyylx = pyylx;
	}
	
}

package com.incon.project.common.ymqxgl.page;

import com.incon.framework.page.Page;

public class YmqxglPage extends Page{

	private String yxqxdm; //权限名称
	public YmqxglPage(){
		this.setSql("ymqxgl.queryAnb");
		this.setSqlCount("ymqxgl.queryAnbCount");
	}
	public String getYxqxdm() {
		return yxqxdm;
	}
	public void setYxqxdm(String yxqxdm) {
		this.yxqxdm = yxqxdm;
	}
	
	
}

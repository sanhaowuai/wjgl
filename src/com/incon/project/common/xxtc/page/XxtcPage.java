package com.incon.project.common.xxtc.page;

import com.incon.framework.page.Page;
/**
 * 
 * 赵玥
 * 2016-11-10
 * 消息弹出表
 */
public class XxtcPage extends Page{

	 

	public XxtcPage(){
		this.setSql("xxtc.queryXxtc");
		this.setSqlCount("xxtc.queryXxtcCount");
	}

	 
	
}

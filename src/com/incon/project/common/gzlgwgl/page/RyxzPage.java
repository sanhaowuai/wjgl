package com.incon.project.common.gzlgwgl.page;

import com.incon.framework.page.Page;

/**
 * @类名：com.incon.project.common.qxcdgl.page.RyjsqxPage
 * @作者：李旭
 * @时间：2018-2-2
 * @版本：
 * @描述：人员角色权限管理
 */
public class RyxzPage extends Page {
	private String xh;
	

	public String getXh() {
		return xh;
	}

	public void setXh(String xh) {
		this.xh = xh;
	}


	public RyxzPage(){
		this.setSql("gzlgwgl.queryRyxz");
		this.setSqlCount("gzlgwgl.queryRyxzCount");
	}

	
}

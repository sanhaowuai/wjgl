package com.incon.project.common.ryxgxxwh.xwlbb.page;

import com.incon.framework.page.Page;

/**
 * @类名：com.incon.project.common.ryxgxxwh.xwlbb.page.XwlbPage
 * @作者：马爽
 * @时间：2014-4-1
 * @版本：
 * @描述：
 * @修改人员：
 * @修改时间：2014-4-1
 * @修改说明：
 */
@SuppressWarnings("all")
public class XwlbbPage extends Page {
	
	private String dmmc;
	
	public XwlbbPage(){
		this.setSql("xwlbbgl.queryXwlb");
		this.setSqlCount("xwlbbgl.queryXwlbCount");
	}

	public String getDmmc() {
		return dmmc;
	}

	public void setDmmc(String dmmc) {
		this.dmmc = dmmc;
	}
	
	
}

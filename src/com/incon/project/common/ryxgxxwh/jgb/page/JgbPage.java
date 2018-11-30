package com.incon.project.common.ryxgxxwh.jgb.page;

import com.incon.framework.page.Page;

/**
 * @类名：com.incon.project.common.ryxgxxwh.jgb.page.JgbPage
 * @作者：马爽
 * @时间：2014-3-31
 * @版本：
 * @描述：
 * @修改人员：
 * @修改时间：2014-3-31
 * @修改说明：
 */
@SuppressWarnings("all")
public class JgbPage extends Page{
	private String dmmc;
	
	public JgbPage(){
		this.setSql("jgbgl.queryJg");
		this.setSqlCount("jgbgl.queryJgCount");
	}

	public String getDmmc() {
		return dmmc;
	}

	public void setDmmc(String dmmc) {
		this.dmmc = dmmc;
	}
	
	
}

package com.incon.project.common.yxgl.page;

import com.incon.framework.page.Page;

/**
 * @类名：com.incon.project.common.yxgl.page.ZyPage
 * @时间：2014-3-29
 * @版本：
 * @描述：
 * @修改人员：
 * @修改时间：2014-3-29
 * @修改说明：
 */
@SuppressWarnings("all")
public class ZyPage extends Page{
	private String dmmc; //专业名称
	private String cxssyx;//学院
	private String cxssx;//系
	
	public ZyPage(){
		this.setSql("yxgl.queryZy");
		this.setSqlCount("yxgl.queryZyCount");
	}
	public String getCxssyx() {
		return cxssyx;
	}

	public void setCxssyx(String cxssyx) {
		this.cxssyx = cxssyx;
	}

	public String getCxssx() {
		return cxssx;
	}

	public void setCxssx(String cxssx) {
		this.cxssx = cxssx;
	}


	public String getDmmc() {
		return dmmc;
	}

	public void setDmmc(String dmmc) {
		this.dmmc = dmmc;
	}
	
}

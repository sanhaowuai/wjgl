package com.incon.project.common.yxzygl.page;

import com.incon.framework.page.Page;
/**
 * 
 * @类名： com.incon.project.common.zygl.page.ZyglPage
 * @修改人：
 * @日期：
 * @描述：专业管理
 * @版本号：
 */
public class YxZyglPage extends Page{

	private String dmmc; //专业名称
	private String cxssyx;//
	private String cxssx;
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

	public YxZyglPage(){
		this.setSql("yxzygl.queryYxZyb");
		this.setSqlCount("yxzygl.queryYxZyCount");
	}

	public String getDmmc() {
		return dmmc;
	}

	public void setDmmc(String dmmc) {
		this.dmmc = dmmc;
	}
	
}

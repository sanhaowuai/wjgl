package com.incon.project.common.xtfk.page;

import com.incon.framework.page.Page;

/**
 * 
 * @类名：  com.incon.project.common.xtfk.page.XtfkPage
 * @创建人： 于洋
 * @日期： 2014-5-6
 * @修改人：
 * @日期：
 * @描述： 系统反馈
 * @版本号：
 */
public class XtfkPage extends Page{
	private String fklb;	//反馈类别
	private String clbz;	//处理标志
	private String ff_fknr;
	private String fkr;
	private String yhdm;
	public XtfkPage(){
		this.setSql("xtfk.queryXtfk");
		this.setSqlCount("xtfk.queryXtfkCount");
	}

	public String getFf_fknr() {
		return ff_fknr;
	}

	public void setFf_fknr(String ffFknr) {
		ff_fknr = ffFknr;
	}

	/** get/set */
	public String getFklb() {
		return fklb;
	}

	public void setFklb(String fklb) {
		this.fklb = fklb;
	}

	public String getClbz() {
		return clbz;
	}

	public void setClbz(String clbz) {
		this.clbz = clbz;
	}

	 

	public String getFkr() {
		return fkr;
	}

	public void setFkr(String fkr) {
		this.fkr = fkr;
	}

	public String getYhdm() {
		return yhdm;
	}

	public void setYhdm(String yhdm) {
		this.yhdm = yhdm;
	}
	
}

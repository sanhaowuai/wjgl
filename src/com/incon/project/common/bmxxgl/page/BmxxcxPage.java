package com.incon.project.common.bmxxgl.page;

import com.incon.framework.page.Page;

public class BmxxcxPage extends Page {

	public BmxxcxPage(){
		this.setSql("bmxxgl.queryBmxxcx");
		this.setSqlCount("bmxxgl.queryBmxxcxCount");
	}
	
	private String sfbr;//发布人
	private String sxxbt;//信息标题
	private String sbm;//部门
	private String skssj;//起始时间
	private String sjssj;//结束时间
	private String syhdm;//用户代码
	private String syhlx;//用户类型
	private String sckfw;//查看范围
	private String sfbbm;//发布部门
	
	
	public String getSfbbm() {
		return sfbbm;
	}
	public void setSfbbm(String sfbbm) {
		this.sfbbm = sfbbm;
	}
	public String getSckfw() {
		return sckfw;
	}
	public void setSckfw(String sckfw) {
		this.sckfw = sckfw;
	}
	public String getSyhdm() {
		return syhdm;
	}
	public void setSyhdm(String syhdm) {
		this.syhdm = syhdm;
	}
	public String getSyhlx() {
		return syhlx;
	}
	public void setSyhlx(String syhlx) {
		this.syhlx = syhlx;
	}
	public String getSfbr() {
		return sfbr;
	}
	public void setSfbr(String sfbr) {
		this.sfbr = sfbr;
	}
	public String getSxxbt() {
		return sxxbt;
	}
	public void setSxxbt(String sxxbt) {
		this.sxxbt = sxxbt;
	}
	public String getSbm() {
		return sbm;
	}
	public void setSbm(String sbm) {
		this.sbm = sbm;
	}
	public String getSkssj() {
		return skssj;
	}
	public void setSkssj(String skssj) {
		this.skssj = skssj;
	}
	public String getSjssj() {
		return sjssj;
	}
	public void setSjssj(String sjssj) {
		this.sjssj = sjssj;
	}
	
	
}

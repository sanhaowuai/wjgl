package com.incon.project.common.xxfbxx.page;

import com.incon.framework.page.Page;
/**
 * 
 * @类名：com.incon.project.common.xxfbxx.page.XxfbxxglPage
 * @创建人：安智博
 * @日期：2016-8-17
 * @描述：学校发布信息（管理端）分页辅助类
 */
public class XxfbxxglPage extends Page {

	private String pxxlb;		//信息类别
	private String pfbr;		//发布人
	private String pxxbt;		//信息标题
	private String pxydm;		//学院代码
	private String pfbqssj;		//发布起始时间
	private String pfbjssj;		//发布结束时间
	
	public XxfbxxglPage() {
		this.setSql("xxfbxx.queryXxfbgl");
		this.setSqlCount("xxfbxx.queryXxfbglCount");
	}

	public String getPxxlb() {
		return pxxlb;
	}

	public void setPxxlb(String pxxlb) {
		this.pxxlb = pxxlb;
	}

	public String getPfbr() {
		return pfbr;
	}

	public void setPfbr(String pfbr) {
		this.pfbr = pfbr;
	}

	public String getPxxbt() {
		return pxxbt;
	}

	public void setPxxbt(String pxxbt) {
		this.pxxbt = pxxbt;
	}

	public String getPxydm() {
		return pxydm;
	}

	public void setPxydm(String pxydm) {
		this.pxydm = pxydm;
	}

	public String getPfbqssj() {
		return pfbqssj;
	}

	public void setPfbqssj(String pfbqssj) {
		this.pfbqssj = pfbqssj;
	}

	public String getPfbjssj() {
		return pfbjssj;
	}

	public void setPfbjssj(String pfbjssj) {
		this.pfbjssj = pfbjssj;
	}
}

package com.incon.project.common.bmxxgl.page;

import com.incon.framework.page.Page;

/**
 * 发布通知公告 回执页分页
 * @author Administrator
 *
 */
public class BmxxhzPage extends Page {
	private String ppxxbt ; 
	private String ppyhdm ;//用户代码
	private String ppyhxm ;// 用户姓名
	private String ppxxid;
	private String ppfbksrq; //开始日期
	private String ppfbjsrq;//结束日期
	
	public BmxxhzPage(){
		this.setSql("bmxxgl.queryFbxxhz");
		this.setSqlCount("bmxxgl.queryFbxxhzCount");
	}

	public String getPpxxbt() {
		return ppxxbt;
	}

	public void setPpxxbt(String ppxxbt) {
		this.ppxxbt = ppxxbt;
	}

	public String getPpyhdm() {
		return ppyhdm;
	}

	public void setPpyhdm(String ppyhdm) {
		this.ppyhdm = ppyhdm;
	}

	public String getPpxxid() {
		return ppxxid;
	}

	public void setPpxxid(String ppxxid) {
		this.ppxxid = ppxxid;
	}

	public String getPpyhxm() {
		return ppyhxm;
	}

	public void setPpyhxm(String ppyhxm) {
		this.ppyhxm = ppyhxm;
	}

	public String getPpfbksrq() {
		return ppfbksrq;
	}

	public void setPpfbksrq(String ppfbksrq) {
		this.ppfbksrq = ppfbksrq;
	}

	public String getPpfbjsrq() {
		return ppfbjsrq;
	}

	public void setPpfbjsrq(String ppfbjsrq) {
		this.ppfbjsrq = ppfbjsrq;
	}
	
}

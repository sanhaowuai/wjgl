package com.incon.project.common.xxfbxx.page;

import com.incon.framework.page.Page;
/**
 * 
 * @类名：com.incon.project.common.xxfbxx.page.XxfbxxlljlPage
 * @创建人：安智博
 * @日期：2016-8-18
 * @描述：学校发布信息浏览记录分页辅助类
 */
public class XxfbxxlljlPage extends Page {

	private String xxid;		//信息 ID
	private String pyhxm;		//用户姓名
	private String pdqqssj;		//读取起始时间
	private String pdqjssj;		//读取结束时间
	
	public XxfbxxlljlPage() {
		this.setSql("xxfbxx.queryXxfbLljl");
		this.setSqlCount("xxfbxx.queryXxfbLljlCount");
	}

	public String getXxid() {
		return xxid;
	}

	public void setXxid(String xxid) {
		this.xxid = xxid;
	}

	public String getPyhxm() {
		return pyhxm;
	}

	public void setPyhxm(String pyhxm) {
		this.pyhxm = pyhxm;
	}

	public String getPdqqssj() {
		return pdqqssj;
	}

	public void setPdqqssj(String pdqqssj) {
		this.pdqqssj = pdqqssj;
	}

	public String getPdqjssj() {
		return pdqjssj;
	}

	public void setPdqjssj(String pdqjssj) {
		this.pdqjssj = pdqjssj;
	}

}

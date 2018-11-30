package com.incon.project.common.jcxgxxwh.xnxq.page;

import com.incon.framework.page.Page;

/**
 * @类名：com.incon.project.common.jcxgxxwh.xnxq.page.XnxqglPage
 * @作者：杨文龙
 * @时间：2014-4-2
 * @版本：
 * @描述：学年学期管理
 */
@SuppressWarnings("all")
public class XnxqglPage extends Page{

	private String dmmc; //代码名称,查询用
	public XnxqglPage(){
		this.setSql("xnxqgl.queryXnxqgl");
		this.setSqlCount("xnxqgl.queryXnxqglCount");
	}
	public String getDmmc() {
		return dmmc;
	}
	public void setDmmc(String dmmc) {
		this.dmmc = dmmc;
	}
}

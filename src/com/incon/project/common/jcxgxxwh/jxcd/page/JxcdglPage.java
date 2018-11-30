package com.incon.project.common.jcxgxxwh.jxcd.page;

import com.incon.framework.page.Page;

/**
 * @类名：com.incon.project.common.jxcd.page.JxcdglPage
 * @作者：杨文龙
 * @时间：2014-4-1
 * @版本：
 * @描述：教学场地管理
 */
@SuppressWarnings("all")
public class JxcdglPage extends Page{

	private String dmmc; //代码名称,查询用
	public JxcdglPage(){
		this.setSql("jxcdgl.queryJxcdgl");
		this.setSqlCount("jxcdgl.queryJxcdglCount");
	}
	public String getDmmc() {
		return dmmc;
	}
	public void setDmmc(String dmmc) {
		this.dmmc = dmmc;
	}
}

package com.incon.project.common.ryxgxxwh.gj.page;

import com.incon.framework.page.Page;
/**
 * @类名：com.incon.project.common.jsgl.page.JsglPage
 * @作者：杨文龙
 * @时间：2014-4-2
 * @版本：
 * @描述：国籍管理
 */
@SuppressWarnings("all")
public class GjglPage extends Page{

	private String dmmc; //代码名称,查询用
	public GjglPage(){
		this.setSql("gjgl.queryGjgl");
		this.setSqlCount("gjgl.queryGjglCount");
	}
	public String getDmmc() {
		return dmmc;
	}
	public void setDmmc(String dmmc) {
		this.dmmc = dmmc;
	}
}

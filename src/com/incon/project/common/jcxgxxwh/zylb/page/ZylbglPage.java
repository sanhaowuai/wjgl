package com.incon.project.common.jcxgxxwh.zylb.page;

import com.incon.framework.page.Page;
/**
 * @类名：com.incon.project.common.jsgl.page.JsglPage
 * @作者：杨文龙
 * @时间：2014-4-1
 * @版本：
 * @描述：专业类别管理
 */
@SuppressWarnings("all")
public class ZylbglPage extends Page{

	private String dmmc; //代码名称,查询用
	public ZylbglPage(){
		this.setSql("zylbgl.queryZylbgl");
		this.setSqlCount("zylbgl.queryZylbglCount");
	}
	public String getDmmc() {
		return dmmc;
	}
	public void setDmmc(String dmmc) {
		this.dmmc = dmmc;
	}
	
}

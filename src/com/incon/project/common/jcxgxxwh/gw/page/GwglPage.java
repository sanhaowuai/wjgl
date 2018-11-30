package com.incon.project.common.jcxgxxwh.gw.page;

import com.incon.framework.page.Page;

/**
 * @类名：com.incon.project.common.gw.page.GwglPage
 * @作者：杨文龙
 * @时间：2014-4-1
 * @版本：
 * @描述：岗位管理
 */
@SuppressWarnings("all")
public class GwglPage extends Page{

	private String dmmc; //代码名称,查询用
	public GwglPage(){
		this.setSql("gwgl.queryGwgl");
		this.setSqlCount("gwgl.queryGwglCount");
	}
	public String getDmmc() {
		return dmmc;
	}
	public void setDmmc(String dmmc) {
		this.dmmc = dmmc;
	}
	
}

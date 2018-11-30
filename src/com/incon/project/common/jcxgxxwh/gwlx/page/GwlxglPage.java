package com.incon.project.common.jcxgxxwh.gwlx.page;

import com.incon.framework.page.Page;

/**
 * @类名：com.incon.project.common.jcxgxxwh.gwlx.page.GwlxglPage
 * @作者：杨文龙
 * @时间：2014-4-1
 * @版本：
 * @描述：岗位类型管理
 */
@SuppressWarnings("all")
public class GwlxglPage extends Page{

	private String dmmc; //代码名称,查询用
	public GwlxglPage(){
		this.setSql("gwlxgl.queryGwlxgl");
		this.setSqlCount("gwlxgl.queryGwlxglCount");
	}
	public String getDmmc() {
		return dmmc;
	}
	public void setDmmc(String dmmc) {
		this.dmmc = dmmc;
	}
}

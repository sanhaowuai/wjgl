package com.incon.project.common.jcxgxxwh.rxlx.page;

import com.incon.framework.page.Page;

/**
 * @类名：com.incon.project.common.jcxgxxwh.rxlx.page.RxlxglPage
 * @作者：杨文龙
 * @时间：2014-4-1
 * @版本：
 * @描述：入校类型管理
 */
@SuppressWarnings("all")
public class RxlxglPage extends Page{

	private String dmmc; //代码名称,查询用
	public RxlxglPage(){
		this.setSql("rxlxgl.queryRxlxgl");
		this.setSqlCount("rxlxgl.queryRxlxglCount");
	}
	public String getDmmc() {
		return dmmc;
	}
	public void setDmmc(String dmmc) {
		this.dmmc = dmmc;
	}
}

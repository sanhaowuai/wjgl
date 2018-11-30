package com.incon.project.common.jcxgxxwh.dq.page;

import com.incon.framework.page.Page;

/**
 * @类名：com.incon.project.common.jcxgxxwh.dq.page.DqglPage
 * @作者：杨文龙
 * @时间：2014-4-1
 * @版本：
 * @描述：地区管理
 */
@SuppressWarnings("all")
public class DqglPage extends Page{

	private String dmmc; //代码名称,查询用
	public DqglPage(){
		this.setSql("dqgl.queryDqgl");
		this.setSqlCount("dqgl.queryDqglCount");
	}
	public String getDmmc() {
		return dmmc;
	}
	public void setDmmc(String dmmc) {
		this.dmmc = dmmc;
	}
}

package com.incon.project.common.jcxgxxwh.nj.page;

import com.incon.framework.page.Page;

/**
 * @类名：com.incon.project.common.nj.page.NjglPage
 * @作者：杨文龙
 * @时间：2014-4-1
 * @版本：
 * @描述：年级管理
 */
@SuppressWarnings("all")
public class NjglPage extends Page{

	private String dmmc; //代码名称,查询用
	public NjglPage(){
		this.setSql("njgl.queryNjgl");
		this.setSqlCount("njgl.queryNjglCount");
	}
	public String getDmmc() {
		return dmmc;
	}
	public void setDmmc(String dmmc) {
		this.dmmc = dmmc;
	}
}

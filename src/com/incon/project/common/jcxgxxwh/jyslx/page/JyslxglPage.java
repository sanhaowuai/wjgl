package com.incon.project.common.jcxgxxwh.jyslx.page;

import com.incon.framework.page.Page;

/**
 * @类名：com.incon.project.common.jcxgxxwh.jyslx.page.JyslxglPage
 * @作者：杨文龙
 * @时间：2014-4-1
 * @版本：
 * @描述：教研室类型管理
 */
@SuppressWarnings("all")
public class JyslxglPage extends Page{

	private String dmmc; //代码名称,查询用
	public JyslxglPage(){
		this.setSql("jyslxgl.queryJyslxgl");
		this.setSqlCount("jyslxgl.queryJyslxglCount");
	}
	public String getDmmc() {
		return dmmc;
	}
	public void setDmmc(String dmmc) {
		this.dmmc = dmmc;
	}
}

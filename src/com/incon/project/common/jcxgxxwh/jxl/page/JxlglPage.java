package com.incon.project.common.jcxgxxwh.jxl.page;

import com.incon.framework.page.Page;

/**
 * @类名：com.incon.project.common.jcxgxxwh.jxl.page.JxlglPage
 * @作者：杨文龙
 * @时间：2014-4-1
 * @版本：
 * @描述：教学楼管理
 */
@SuppressWarnings("all")
public class JxlglPage extends Page{

	private String dmmc; //代码名称,查询用
	public JxlglPage(){
		this.setSql("jxlgl.queryJxlgl");
		this.setSqlCount("jxlgl.queryJxlglCount");
	}
	public String getDmmc() {
		return dmmc;
	}
	public void setDmmc(String dmmc) {
		this.dmmc = dmmc;
	}
}

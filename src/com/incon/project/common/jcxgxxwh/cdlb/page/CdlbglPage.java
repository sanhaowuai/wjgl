package com.incon.project.common.jcxgxxwh.cdlb.page;

import com.incon.framework.page.Page;

/**
 * @类名：com.incon.project.common.jcxgxxwh.cdlb.page.CdlbglPage
 * @作者：杨文龙
 * @时间：2014-4-2
 * @版本：
 * @描述：场地类别管理
 */
@SuppressWarnings("all")
public class CdlbglPage extends Page{

	private String dmmc; //代码名称,查询用
	public CdlbglPage(){
		this.setSql("cdlbgl.queryCdlbgl");
		this.setSqlCount("cdlbgl.queryCdlbglCount");
	}
	public String getDmmc() {
		return dmmc;
	}
	public void setDmmc(String dmmc) {
		this.dmmc = dmmc;
	}
}

/*
 * 文件名：XtglPage.java
 * 版权：Copyright 2011-2015 Libowei Tech. Co. Ltd. All Rights Reserved. 
 * 描述： XtglPage.java
 * 修改人：Administrator
 * 修改时间：2015-5-2
 * 修改内容：新增
 */
package com.incon.project.dbsx.page;

import com.incon.framework.page.Page;

/**
 * 
 * @类名： com.incon.project.dbsx.page.DbsxPage
 * @创建人： 赵玥(zhaoyue)
 * @日期： 2016-08-09
 * @版本号：
 * @说明：代办事项(更多)
 */
@SuppressWarnings("all")
public class DbsxPage extends Page
{
    private String yhdm; // 用户代码

    private Integer jsdm; // 角色代码

    private String sfyd; // 学年


    public DbsxPage()
    {
        this.setSql("dbsx.queryDbsx");
        this.setSqlCount("dbsx.queryDbsxCount");
    }


	public String getYhdm() {
		return yhdm;
	}


	public void setYhdm(String yhdm) {
		this.yhdm = yhdm;
	}


	public Integer getJsdm() {
		return jsdm;
	}


	public void setJsdm(Integer jsdm) {
		this.jsdm = jsdm;
	}


	public String getSfyd() {
		return sfyd;
	}


	public void setSfyd(String sfyd) {
		this.sfyd = sfyd;
	}


}

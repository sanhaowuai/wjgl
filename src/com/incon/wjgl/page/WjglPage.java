package com.incon.wjgl.page;

import com.incon.framework.page.Page;

/**
 *@author:zh
 *@description:文件管理
 *@date:2018/11/20
 */
public class WjglPage extends Page{

	private String wjm; //文件名

    public String getWjm() {
        return wjm;
    }

    public void setWjm(String wjm) {
        this.wjm = wjm;
    }

    public WjglPage(){
		this.setSql("wjgl.queryWjglList");
		this.setSqlCount("wjgl.queryWjglListCount");
	}
}

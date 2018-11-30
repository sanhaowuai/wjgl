package com.incon.project.common.pageGenerate.page;

import com.incon.framework.page.Page;

public class PageSearchPage extends Page {

	private String sqlStr;
	
	public String getSqlStr() {
		return sqlStr;
	}

	public void setSqlStr(String sqlStr) {
		this.sqlStr = sqlStr;
	}

	public PageSearchPage() {
		this.setSql("pageGen.queryPageSearchList");
		this.setSqlCount("pageGen.queryPageSearchListCount");
	}

}

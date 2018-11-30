package com.incon.common.dmbwh.page;


import com.incon.framework.page.Page;

/**
 * 代码表维护
 * 赵恒
 * 2016年12月2日
 */
public class DmbwhPage extends Page{
	//表名
	private String tablename;
	//查询
	private String cxtablename;
	
	public String getTablename() {
		return tablename;
	}
	
	public String getCxtablename() {
		return cxtablename;
	}

	public void setCxtablename(String cxtablename) {
		this.cxtablename = cxtablename;
	}

	public void setTablename(String tablename) {
		this.tablename = tablename;
	}

	public DmbwhPage() {
		this.setSql("dmbwh.queryDmbwh");
		this.setSqlCount("dmbwh.queryDmbwhCount");
	}

}

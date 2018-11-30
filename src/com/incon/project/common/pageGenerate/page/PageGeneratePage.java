package com.incon.project.common.pageGenerate.page;

import com.incon.framework.page.Page;

public class PageGeneratePage extends Page {

	private String pagename;// 页面名
	private String columnname;
	private String sql;
	private String sqlwhere;
	private String lx[];
	private String tablename[];
	private String sxmc[];
	private String sxdm[];
	private String bt[];
	private String id;
	private String lj;
	private String lj2;
	private String gnlb[];
	private String hngnlb[];
	private String tzlj[];
	private String hntzlj[];
	private String sffy;
	
	public String[] getGnlb() {
		return gnlb;
	}

	public void setGnlb(String[] gnlb) {
		this.gnlb = gnlb;
	}

	public String[] getHngnlb() {
		return hngnlb;
	}

	public void setHngnlb(String[] hngnlb) {
		this.hngnlb = hngnlb;
	}

	public String[] getTzlj() {
		return tzlj;
	}

	public void setTzlj(String[] tzlj) {
		this.tzlj = tzlj;
	}

	public String[] getHntzlj() {
		return hntzlj;
	}

	public void setHntzlj(String[] hntzlj) {
		this.hntzlj = hntzlj;
	}

	public String getSffy() {
		return sffy;
	}

	public void setSffy(String sffy) {
		this.sffy = sffy;
	}


	public String getLj2() {
		return lj2;
	}

	public void setLj2(String lj2) {
		this.lj2 = lj2;
	}

	private String qxdm;

	public PageGeneratePage() {
		this.setSql("pageGen.queryPageGenList");
		this.setSqlCount("pageGen.queryPageGenCount");
	}

	public String getPagename() {
		return pagename;
	}

	public void setPagename(String pagename) {
		this.pagename = pagename;
	}

	public String getColumnname() {
		return columnname;
	}

	public void setColumnname(String columnname) {
		this.columnname = columnname;
	}

	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}

	public String getSqlwhere() {
		return sqlwhere;
	}

	public void setSqlwhere(String sqlwhere) {
		this.sqlwhere = sqlwhere;
	}

	public String[] getLx() {
		return lx;
	}

	public void setLx(String[] lx) {
		this.lx = lx;
	}

	public String[] getTablename() {
		return tablename;
	}

	public void setTablename(String[] tablename) {
		this.tablename = tablename;
	}

	public String[] getSxmc() {
		return sxmc;
	}

	public void setSxmc(String[] sxmc) {
		this.sxmc = sxmc;
	}

	public String[] getSxdm() {
		return sxdm;
	}

	public void setSxdm(String[] sxdm) {
		this.sxdm = sxdm;
	}

	public String[] getBt() {
		return bt;
	}

	public void setBt(String[] bt) {
		this.bt = bt;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLj() {
		return lj;
	}

	public void setLj(String lj) {
		this.lj = lj;
	}

	public String getQxdm() {
		return qxdm;
	}

	public void setQxdm(String qxdm) {
		this.qxdm = qxdm;
	}


}

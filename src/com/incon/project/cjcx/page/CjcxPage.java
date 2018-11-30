package com.incon.project.cjcx.page;
import com.incon.framework.page.Page;

public class CjcxPage extends Page{
	
	private String pageLb;//类别
	private String pageXnxq;
	private String pageXn;
	private String pageXq;
	private String pageXh;
	private String pageKcmc;
	private String pageSffx;
	private String pageBkcxbj;
	private String pageSfjg;
	private String pageTable;//表名
	private String pageYxrs;//已选人数
	private String pageSyks;//实验课时
	private String pageMrzxks;//默认最小课时
	
	public CjcxPage(){
		this.setSql("cjcx.queryCjcxPage"); 
		this.setSqlCount("cjcx.queryCjcxPageCount");
	}

	public String getPageLb() {
		return pageLb;
	}

	public void setPageLb(String pageLb) {
		this.pageLb = pageLb;
	}

	public String getPageXnxq() {
		return pageXnxq;
	}

	public void setPageXnxq(String pageXnxq) {
		this.pageXnxq = pageXnxq;
	}

	public String getPageXn() {
		return pageXn;
	}

	public void setPageXn(String pageXn) {
		this.pageXn = pageXn;
	}

	public String getPageXq() {
		return pageXq;
	}

	public void setPageXq(String pageXq) {
		this.pageXq = pageXq;
	}

	public String getPageXh() {
		return pageXh;
	}

	public void setPageXh(String pageXh) {
		this.pageXh = pageXh;
	}

	public String getPageKcmc() {
		return pageKcmc;
	}

	public void setPageKcmc(String pageKcmc) {
		this.pageKcmc = pageKcmc;
	}

	public String getPageSffx() {
		return pageSffx;
	}

	public void setPageSffx(String pageSffx) {
		this.pageSffx = pageSffx;
	}

	public String getPageBkcxbj() {
		return pageBkcxbj;
	}

	public void setPageBkcxbj(String pageBkcxbj) {
		this.pageBkcxbj = pageBkcxbj;
	}

	public String getPageSfjg() {
		return pageSfjg;
	}

	public void setPageSfjg(String pageSfjg) {
		this.pageSfjg = pageSfjg;
	}

	public String getPageTable() {
		return pageTable;
	}

	public void setPageTable(String pageTable) {
		this.pageTable = pageTable;
	}

	public String getPageYxrs() {
		return pageYxrs;
	}

	public void setPageYxrs(String pageYxrs) {
		this.pageYxrs = pageYxrs;
	}

	public String getPageSyks() {
		return pageSyks;
	}

	public void setPageSyks(String pageSyks) {
		this.pageSyks = pageSyks;
	}

	public String getPageMrzxks() {
		return pageMrzxks;
	}

	public void setPageMrzxks(String pageMrzxks) {
		this.pageMrzxks = pageMrzxks;
	}

	
	
}

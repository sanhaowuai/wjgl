package com.incon.project.kjscx.page;
import com.incon.framework.page.Page;

public class KjscxPage extends Page{
	
	private String pageXnxq;
	private String pageXiaoqu;
	private String pageLhdm;
	private String pageCddm;
	private String pageZc1;
	private String pageZc2;
	private String pageSql;
	private String pageXn;
	private String pageXq;
	
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
	public KjscxPage(){
		this.setSql("kjscx.queryKjsPage"); 
		this.setSqlCount("kjscx.queryKjsPageCount");
	}
	public String getPageXnxq() {
		return pageXnxq;
	}

	public void setPageXnxq(String pageXnxq) {
		this.pageXnxq = pageXnxq;
	}
	public String getPageXiaoqu() {
		return pageXiaoqu;
	}

	public void setPageXiaoqu(String pageXiaoqu) {
		this.pageXiaoqu = pageXiaoqu;
	}

	public String getPageLhdm() {
		return pageLhdm;
	}

	public void setPageLhdm(String pageLhdm) {
		this.pageLhdm = pageLhdm;
	}

	public String getPageCddm() {
		return pageCddm;
	}

	public void setPageCddm(String pageCddm) {
		this.pageCddm = pageCddm;
	}

	public String getPageZc1() {
		return pageZc1;
	}

	public void setPageZc1(String pageZc1) {
		this.pageZc1 = pageZc1;
	}

	public String getPageZc2() {
		return pageZc2;
	}

	public void setPageZc2(String pageZc2) {
		this.pageZc2 = pageZc2;
	}

	public String getPageSql() {
		return pageSql;
	}

	public void setPageSql(String pageSql) {
		this.pageSql = pageSql;
	}
}

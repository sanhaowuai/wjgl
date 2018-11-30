package com.incon.project.common.bmxxgl.page;


import com.incon.framework.page.Page;

/**
 * 部门信息分页
 * @author GH
 *
 */
public class BmxxPage extends Page {
	private String pxxbt ; 
	private String pfbrq;
	private String pyhdm ;//当前登陆用户代码
	private String psfglqb; //是否管理全部标志位  1是0否
	private String pckfw;//查看范围
	private String pfbksrq; //发布日期开始日期
	private String pfbjsrq;//发布日期结束日期
	private String pfbr; //发布人
	private String pfbbm;//发布部门
	private String plb;
	private String pyhlx ; //用户类型 教师还是学生
	private String pglfw ;//管理范围  0.没有管理只能查看         1.全部   2.本部门   3.本人
	
	public BmxxPage(){
		this.setSql("bmxxgl.queryBmxx");
		this.setSqlCount("bmxxgl.queryBmxxCount");
	}



	public String getPlb() {
		return plb;
	}



	public void setPlb(String plb) {
		this.plb = plb;
	}



	public String getPfbr() {
		return pfbr;
	}



	public void setPfbr(String pfbr) {
		this.pfbr = pfbr;
	}



	public String getPfbbm() {
		return pfbbm;
	}



	public void setPfbbm(String pfbbm) {
		this.pfbbm = pfbbm;
	}



	public String getPglfw() {
		return pglfw;
	}



	public void setPglfw(String pglfw) {
		this.pglfw = pglfw;
	}



	public String getPyhlx() {
		return pyhlx;
	}


	public void setPyhlx(String pyhlx) {
		this.pyhlx = pyhlx;
	}


	public String getPxxbt() {
		return pxxbt;
	}

	public void setPxxbt(String pxxbt) {
		this.pxxbt = pxxbt;
	}

	public String getPfbrq() {
		return pfbrq;
	}

	public void setPfbrq(String pfbrq) {
		this.pfbrq = pfbrq;
	}

	public String getPyhdm() {
		return pyhdm;
	}

	public void setPyhdm(String pyhdm) {
		this.pyhdm = pyhdm;
	}

	public String getPsfglqb() {
		return psfglqb;
	}

	public void setPsfglqb(String psfglqb) {
		this.psfglqb = psfglqb;
	}

	public String getPckfw() {
		return pckfw;
	}

	public void setPckfw(String pckfw) {
		this.pckfw = pckfw;
	}

	public String getPfbksrq() {
		return pfbksrq;
	}

	public void setPfbksrq(String pfbksrq) {
		this.pfbksrq = pfbksrq;
	}

	public String getPfbjsrq() {
		return pfbjsrq;
	}

	public void setPfbjsrq(String pfbjsrq) {
		this.pfbjsrq = pfbjsrq;
	}
	
}

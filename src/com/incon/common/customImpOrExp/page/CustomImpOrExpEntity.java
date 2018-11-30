package com.incon.common.customImpOrExp.page;

import java.util.List;

public class CustomImpOrExpEntity {
	
	private String id;
	
	private String tablename;
	
	private String ywmc;
	
	private String imptype;
	
	private String roleid;
	
	private String zxtbh;
	
	private String bmbh;
	
	private List<JsEntity> js;

	public List<JsEntity> getJs() {
		return js;
	}

	public void setJs(List<JsEntity> js) {
		this.js = js;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTablename() {
		return tablename;
	}

	public void setTablename(String tablename) {
		this.tablename = tablename;
	}

	public String getYwmc() {
		return ywmc;
	}

	public void setYwmc(String ywmc) {
		this.ywmc = ywmc;
	}

	public String getImptype() {
		return imptype;
	}

	public void setImptype(String imptype) {
		this.imptype = imptype;
	}

	public String getRoleid() {
		return roleid;
	}

	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}

	public String getZxtbh() {
		return zxtbh;
	}

	public void setZxtbh(String zxtbh) {
		this.zxtbh = zxtbh;
	}

	public String getBmbh() {
		return bmbh;
	}

	public void setBmbh(String bmbh) {
		this.bmbh = bmbh;
	}

}

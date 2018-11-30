package com.incon.common.consumerExp.page;

import java.util.List;

import com.incon.common.customImpOrExp.page.JsEntity;

/**
 * 自定义导出模板
 * 赵恒
 * 2016年11月29日
 */
public class ConsumerExpEntity {
	//主键
	private String id;
	//表名
	private String tablename;
	//业务名称
	private String ywmc;
	//角色id
	private String roleid;
	//角色名称
	private String jsmc;
	
	private String zxtbh;
	
	private String bmbh;
	//角色
	private List<JsEntity> js;
	//字段英文
	private String column_en;
	//字段中文
	private String column_zh;
	//字段id
	private String col_id;
	//表id
	private String tab_id;
	
	public String getColumn_en() {
		return column_en;
	}

	public void setColumn_en(String column_en) {
		this.column_en = column_en;
	}

	public String getColumn_zh() {
		return column_zh;
	}

	public void setColumn_zh(String column_zh) {
		this.column_zh = column_zh;
	}

	public String getCol_id() {
		return col_id;
	}

	public void setCol_id(String col_id) {
		this.col_id = col_id;
	}

	public String getTab_id() {
		return tab_id;
	}

	public void setTab_id(String tab_id) {
		this.tab_id = tab_id;
	}

	public List<JsEntity> getJs() {
		return js;
	}

	public void setJs(List<JsEntity> js) {
		this.js = js;
	}

	public String getId() {
		return id;
	}
	
	public String getJsmc() {
		return jsmc;
	}

	public void setJsmc(String jsmc) {
		this.jsmc = jsmc;
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

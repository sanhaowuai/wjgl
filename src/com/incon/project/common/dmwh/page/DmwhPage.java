package com.incon.project.common.dmwh.page;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import com.incon.framework.page.Page;




/**
 * @类名：project.jxgzl.dmwh.page.DmwhPage
 * @作者：初旭
 * @时间：2012-6-18
 * @版本：
 * @描述：
 * @修改人员：
 * @修改时间：2012-6-18
 * @修改说明：
 */
public class DmwhPage extends Page{
	private String pjcdmlx;	//基础代码类型
	/** 表名 */
	private String tabName;
	/** 表注释 */
	private String tabZs;
	
	/** 关键字 */
	private String gjz;
	/** 主键 模糊查询用 */
	private String id;
	/** 名称 模糊查询用 */
	private String mc;
	/** 表结构List */
	private List< Map< String, String>> list = new ArrayList< Map< String, String>>();
	
	

	public List<Map<String, String>> getList() {
		return list;
	}

	public void setList(List<Map<String, String>> list) {
		this.list = list;
	}

	/**
	 * 构造方法
	 */
	public DmwhPage() {
		this.setSql("dmwh.queryDmwh");
		this.setSqlCount("dmwh.queryDmwhCount");
		this.setTabName("DM_DMWHB");
	}
	
	/** Set Get 方法 */
	
	
	public String getTabZs() {
		return tabZs;
	}

	public void setTabZs(String tabZs) {
		this.tabZs = tabZs;
	}
	public String getTabName() {
		return tabName;
	}
	public void setTabName(String tabName) {
		this.tabName = tabName;
	}
	public String getGjz() {
		return gjz;
	}
	public void setGjz(String gjz) {
		this.gjz = gjz;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMc() {
		return mc;
	}
	public void setMc(String mc) {
		this.mc = mc;
	}

	public String getPjcdmlx() {
		return pjcdmlx;
	}

	public void setPjcdmlx(String pjcdmlx) {
		this.pjcdmlx = pjcdmlx;
	}

	

	
	
}

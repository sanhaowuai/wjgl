package com.incon.common.grrc.page;

/**
 * 个人日程实体
 * @author Administrator
 *
 */
public class GrrcEntity {
	
	private String start;
	private String end;
	
	private String id;
	private String yhdm;
	private String title;
	private String rcsj;
	private String url;
	private String zxtdm;
	private String appurl;
	private String czbs;//操作标识（0：个人；1：系统推送）
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getYhdm() {
		return yhdm;
	}
	public void setYhdm(String yhdm) {
		this.yhdm = yhdm;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRcsj() {
		return rcsj;
	}
	public void setRcsj(String rcsj) {
		this.rcsj = rcsj;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getZxtdm() {
		return zxtdm;
	}
	public void setZxtdm(String zxtdm) {
		this.zxtdm = zxtdm;
	}
	public String getAppurl() {
		return appurl;
	}
	public void setAppurl(String appurl) {
		this.appurl = appurl;
	}
	public String getCzbs() {
		return czbs;
	}
	public void setCzbs(String czbs) {
		this.czbs = czbs;
	}

	
}

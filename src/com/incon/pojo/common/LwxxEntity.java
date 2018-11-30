package com.incon.pojo.common;

import java.util.Date;

public class LwxxEntity {
	private String lwid;
	private String userCode;
	private String status;
	private String keyword;
	private Date subDate;
	private String subDateString;
	private String summary;
	private String filepath;

	public String getLwid() {
		return lwid;
	}

	public void setLwid(String lwid) {
		this.lwid = lwid;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getSubDateString() {
		return subDateString;
	}

	public void setSubDateString(String subDateString) {
		this.subDateString = subDateString;
	}

	public Date getSubDate() {
		return subDate;
	}

	public void setSubDate(Date subDate) {
		this.subDate = subDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

}

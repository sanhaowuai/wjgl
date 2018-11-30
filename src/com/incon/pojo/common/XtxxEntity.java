package com.incon.pojo.common;

import java.util.Date;

public class XtxxEntity {
	private String title;
	private String teacherName;
	private Date selectDate;
	private String selectDateString;
	public String getSelectDateString() {
		return selectDateString;
	}
	public void setSelectDateString(String selectDateString) {
		this.selectDateString = selectDateString;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public Date getSelectDate() {
		return selectDate;
	}
	public void setSelectDate(Date selectDate) {
		this.selectDate = selectDate;
	}
	
}

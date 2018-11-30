package com.incon.pojo.common;

import java.text.SimpleDateFormat;
import java.util.Date;

public class LwdbTimeAddrEntity {
	private Date dabianTime;
	private String dabianTimeString;
	private Date endTime;
	private String endTimeString;
	private String dabianAddr;
	private SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTimeString=sdf.format(endTime);
		this.endTime = endTime;
	}
	public String getEndTimeString() {
		return endTimeString;
	}
	public Date getDabianTime() {
		return dabianTime;
	}
	public void setDabianTime(Date dabianTime) {
		dabianTimeString=sdf.format(dabianTime);
		this.dabianTime = dabianTime;
	}
	public String getDabianTimeString() {
		return dabianTimeString;
	}

	public String getDabianAddr() {
		return dabianAddr;
	}
	public void setDabianAddr(String dabianAddr) {
		this.dabianAddr = dabianAddr;
	}
	
}

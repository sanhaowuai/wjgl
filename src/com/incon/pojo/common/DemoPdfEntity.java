package com.incon.pojo.common;


import java.util.List;

import com.incon.common.pdf.app.pdf.AbstractDocumentVo;

public class DemoPdfEntity extends AbstractDocumentVo{
	
	private String bh;
	private List<XsxxbEntity> xslist;
	
	public String getBh() {
		return bh;
	}
	public void setBh(String bh) {
		this.bh = bh;
	}
	public List<XsxxbEntity> getXslist() {
		return xslist;
	}
	public void setXslist(List<XsxxbEntity> xslist) {
		this.xslist = xslist;
	}
	@Override
	public String findPrimaryKey() {
		return this.bh;
	}

	
	

	
	
	
}

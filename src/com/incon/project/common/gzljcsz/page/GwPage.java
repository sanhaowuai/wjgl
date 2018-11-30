package com.incon.project.common.gzljcsz.page;

import com.incon.framework.page.Page;

public class GwPage extends Page {
  private String gwmc;
  private String gwdm;
public String getGwmc() {
	return gwmc;
}
public void setGwmc(String gwmc) {
	this.gwmc = gwmc;
}
public String getGwdm() {
	return gwdm;
}
public void setGwdm(String gwdm) {
	this.gwdm = gwdm;
}
public GwPage()
{
	this.setSql("gzljcsz.queryAllgw");
	this.setSqlCount("gzljcsz.queryAllgwCount");
}
}

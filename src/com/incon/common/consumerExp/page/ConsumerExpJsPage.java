package com.incon.common.consumerExp.page;

import com.incon.framework.page.Page;
/**
 * 根据不同角色导出
 * 赵恒
 * 2016年11月29日
 */
public class ConsumerExpJsPage extends Page{
	//角色代码
	private String jsdm;
	//业务名称
	private String ywmc;
	public ConsumerExpJsPage (){
		this.setSql("consumerExp.queryConsumerJsExp");
		this.setSqlCount("consumerExp.queryConsumerJsExpCount");
	}

	public String getJsdm() {
		return jsdm;
	}
	
	public void setJsdm(String jsdm) {
		this.jsdm = jsdm;
	}

	public String getYwmc() {
		return ywmc;
	}

	public void setYwmc(String ywmc) {
		this.ywmc = ywmc;
	}
	
}

package com.incon.common.consumerExp.page;

import com.incon.framework.page.Page;
/**
 * 自定义导出模板
 * 赵恒
 * 2016年11月29日
 */
public class ConsumerExpPage extends Page{
	//业务名称
	private String ywmc;
	
	public ConsumerExpPage (){
		this.setSql("consumerExp.queryConsumerExp");
		this.setSqlCount("consumerExp.queryConsumerExpCount");
	}
	public String getYwmc() {
		return ywmc;
	}

	public void setYwmc(String ywmc) {
		this.ywmc = ywmc;
	}
	
	

}

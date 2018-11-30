package com.incon.pojo.common.zxtwh;

/**
 * 角色应用系统连接表
 * pt_jsyyxtljb
 * @author zjn
 */

public class JsyyxtljbEntity {

	private String jsdm;  //	varchar2(500)			角色代码
	private String zxtdm;  //	varchar2(50)			子系统代码
	
	
	public String getJsdm() {
		return jsdm;
	}
	public void setJsdm(String jsdm) {
		this.jsdm = jsdm;
	}
	public String getZxtdm() {
		return zxtdm;
	}
	public void setZxtdm(String zxtdm) {
		this.zxtdm = zxtdm;
	}

}

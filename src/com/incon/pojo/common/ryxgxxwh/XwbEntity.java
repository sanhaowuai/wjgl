package com.incon.pojo.common.ryxgxxwh;
/**
 * @类名：com.incon.pojo.common.XwbEntity
 * @作者：马爽
 * @时间：2014-3-31
 * @版本：
 * @描述：学位表 DM_XWB
 * @修改人员：
 * @修改时间：2014-3-31
 * @修改说明：
 */
@SuppressWarnings("all")
public class XwbEntity {

	private String dm;//代码
	private String mc;//名称
	private String xslbdm;//学生类别
	private String kyf;//可用否
	public String getDm() {
		return dm;
	}
	
	public String getXslbdm() {
		return xslbdm;
	}

	public void setXslbdm(String xslbdm) {
		this.xslbdm = xslbdm;
	}

	public void setDm(String dm) {
		this.dm = dm;
	}
	public String getMc() {
		return mc;
	}
	public void setMc(String mc) {
		this.mc = mc;
	}
	public String getKyf() {
		return kyf;
	}
	public void setKyf(String kyf) {
		this.kyf = kyf;
	}
}

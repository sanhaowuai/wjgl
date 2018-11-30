package com.incon.pojo.common.jcxgxxwh;

import java.io.Serializable;

/**
 * 
 * @类名： com.incon.pojo.common.jcxgxxwh.XnxqbEntity
 * @创建人： 杨文龙
 * @日期： 2014-4-2
 * @修改人：
 * @日期：
 * @描述： 学年学期表(DM_XNXQB)
 * @版本号：
 */
@SuppressWarnings("all")
public class XnxqbEntity implements Serializable{

	private String xn; //学年
	private String xq; //学期
	private String xnmc; //学年名称
	private String xqmc; //学期名称
	private String kyf; //可用否
	private String sfdqxq; //是否当前学期
	public String getXn() {
		return xn;
	}
	public void setXn(String xn) {
		this.xn = xn;
	}
	public String getXq() {
		return xq;
	}
	public void setXq(String xq) {
		this.xq = xq;
	}
	public String getXnmc() {
		return xnmc;
	}
	public void setXnmc(String xnmc) {
		this.xnmc = xnmc;
	}
	public String getXqmc() {
		return xqmc;
	}
	public void setXqmc(String xqmc) {
		this.xqmc = xqmc;
	}
	public String getKyf() {
		return kyf;
	}
	public void setKyf(String kyf) {
		this.kyf = kyf;
	}
	public String getSfdqxq() {
		return sfdqxq;
	}
	public void setSfdqxq(String sfdqxq) {
		this.sfdqxq = sfdqxq;
	}
	
}

package com.incon.pojo.common.jcxgxxwh;

import java.io.Serializable;


/**
 * 
 * @类名： com.incon.pojo.common.jcxgxxwh.ZylbbEntity
 * @创建人： 杨文龙
 * @日期： 2014-3-12
 * @修改人：
 * @日期：
 * @描述：教学楼表(DM_JXL)
 * @版本号：
 */
@SuppressWarnings("all")
public class JxlbEntity implements Serializable{

	private String dm; //教学楼代码
	private String mc; //教学楼名称
	private String zjm; //助记码
	private String jc; //教学楼简称
	private String xiaoqu; //校区
	private String kldly; //可流动楼宇
	private String kyf; //可用否
	private String xq; //校区
	public String getDm() {
		return dm;
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
	public String getZjm() {
		return zjm;
	}
	public void setZjm(String zjm) {
		this.zjm = zjm;
	}
	public String getJc() {
		return jc;
	}
	public void setJc(String jc) {
		this.jc = jc;
	}
	public String getXiaoqu() {
		return xiaoqu;
	}
	public void setXiaoqu(String xiaoqu) {
		this.xiaoqu = xiaoqu;
	}
	public String getKldly() {
		return kldly;
	}
	public void setKldly(String kldly) {
		this.kldly = kldly;
	}
	public String getKyf() {
		return kyf;
	}
	public void setKyf(String kyf) {
		this.kyf = kyf;
	}
	public String getXq() {
		return xq;
	}
	public void setXq(String xq) {
		this.xq = xq;
	}
	
}
